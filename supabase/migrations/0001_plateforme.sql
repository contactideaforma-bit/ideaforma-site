-- ============================================================
-- IDEAFORMA — plateforme de formation
-- Migration 0001 : socle (profils, catalogue, modules, leçons,
-- inscriptions, progression, demandes de contact, RLS, Storage)
-- Idempotente : peut être rejouée sans casser l'existant.
-- À exécuter dans Supabase → SQL Editor, sur le projet DÉDIÉ
-- à la plateforme (pas celui de l'appli interne).
-- ============================================================

create extension if not exists pgcrypto;

-- ------------------------------------------------------------
-- 1. Profils (1 ligne par utilisateur auth)
-- ------------------------------------------------------------
create table if not exists public.profiles (
  id          uuid primary key references auth.users(id) on delete cascade,
  email       text not null,
  prenom      text,
  nom         text,
  telephone   text,
  entreprise  text,
  role        text not null default 'eleve' check (role in ('admin','eleve')),
  actif       boolean not null default true,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);
create index if not exists profiles_role_idx on public.profiles(role);

-- Création automatique du profil à l'inscription d'un utilisateur
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  insert into public.profiles (id, email, prenom, nom, telephone, entreprise, role)
  values (
    new.id,
    new.email,
    new.raw_user_meta_data->>'prenom',
    new.raw_user_meta_data->>'nom',
    new.raw_user_meta_data->>'telephone',
    new.raw_user_meta_data->>'entreprise',
    case when new.raw_user_meta_data->>'role' = 'admin' then 'admin' else 'eleve' end
  )
  on conflict (id) do nothing;
  return new;
end $$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- updated_at automatique
create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end $$;

drop trigger if exists profiles_updated_at on public.profiles;
create trigger profiles_updated_at before update on public.profiles
  for each row execute function public.set_updated_at();

-- Est-ce que l'utilisateur courant est un admin actif ?
-- security definer : lit profiles sans passer par la RLS (évite la récursion).
create or replace function public.is_admin()
returns boolean language sql stable security definer set search_path = public as $$
  select exists (
    select 1 from public.profiles
    where id = auth.uid() and role = 'admin' and actif
  );
$$;

-- ------------------------------------------------------------
-- 2. Catalogue : formations → modules → leçons
-- ------------------------------------------------------------
create table if not exists public.formations (
  id            uuid primary key default gen_random_uuid(),
  slug          text not null unique,
  titre         text not null,
  accroche      text,
  description   text,
  categorie     text not null default 'autre',
  icone         text default '🎓',
  duree_heures  numeric(6,1),
  duree_label   text,
  modalite      text,
  prix_ht       numeric(10,2),
  objectifs     text[] not null default '{}',
  programme     text[] not null default '{}',
  prerequis     text,
  public_vise   text,
  publie        boolean not null default false,
  ordre         integer not null default 0,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);
drop trigger if exists formations_updated_at on public.formations;
create trigger formations_updated_at before update on public.formations
  for each row execute function public.set_updated_at();

create table if not exists public.modules (
  id             uuid primary key default gen_random_uuid(),
  formation_id   uuid not null references public.formations(id) on delete cascade,
  titre          text not null,
  description    text,
  ordre          integer not null default 0,
  duree_minutes  integer,
  publie         boolean not null default true,
  created_at     timestamptz not null default now()
);
create index if not exists modules_formation_idx on public.modules(formation_id, ordre);

create table if not exists public.lecons (
  id             uuid primary key default gen_random_uuid(),
  module_id      uuid not null references public.modules(id) on delete cascade,
  titre          text not null,
  type           text not null default 'texte'
                 check (type in ('video','slides','pdf','podcast','ebook','texte','quiz','evaluation')),
  contenu        jsonb not null default '{}'::jsonb,   -- texte, questions de quiz, réglages…
  storage_path   text,                                  -- chemin dans le bucket privé "contenus"
  duree_minutes  integer,
  ordre          integer not null default 0,
  publie         boolean not null default true,
  created_at     timestamptz not null default now()
);
create index if not exists lecons_module_idx on public.lecons(module_id, ordre);

-- ------------------------------------------------------------
-- 3. Inscriptions (élève ↔ formation, avec délai d'accès)
-- ------------------------------------------------------------
create table if not exists public.inscriptions (
  id            uuid primary key default gen_random_uuid(),
  eleve_id      uuid not null references public.profiles(id) on delete cascade,
  formation_id  uuid not null references public.formations(id) on delete cascade,
  date_debut    date not null default current_date,
  date_fin      date,
  statut        text not null default 'active' check (statut in ('active','terminee','suspendue')),
  created_by    uuid references public.profiles(id) on delete set null,
  created_at    timestamptz not null default now(),
  unique (eleve_id, formation_id)
);
create index if not exists inscriptions_eleve_idx on public.inscriptions(eleve_id);
create index if not exists inscriptions_formation_idx on public.inscriptions(formation_id);

-- L'élève courant a-t-il accès à cette formation aujourd'hui ?
create or replace function public.a_acces_formation(f uuid)
returns boolean language sql stable security definer set search_path = public as $$
  select exists (
    select 1
    from public.inscriptions i
    join public.profiles p on p.id = i.eleve_id
    where i.eleve_id = auth.uid()
      and i.formation_id = f
      and i.statut = 'active'
      and p.actif
      and i.date_debut <= current_date
      and (i.date_fin is null or i.date_fin >= current_date)
  );
$$;

-- ------------------------------------------------------------
-- 4. Progression (par leçon)
-- ------------------------------------------------------------
create table if not exists public.progression (
  id              uuid primary key default gen_random_uuid(),
  inscription_id  uuid not null references public.inscriptions(id) on delete cascade,
  lecon_id        uuid not null references public.lecons(id) on delete cascade,
  statut          text not null default 'en_cours' check (statut in ('en_cours','termine')),
  score           numeric(5,2),
  tentatives      integer not null default 0,
  termine_le      timestamptz,
  updated_at      timestamptz not null default now(),
  unique (inscription_id, lecon_id)
);
drop trigger if exists progression_updated_at on public.progression;
create trigger progression_updated_at before update on public.progression
  for each row execute function public.set_updated_at();

-- Vue : avancement (%) par inscription = leçons terminées / leçons publiées de la formation
-- security_invoker : la vue respecte la RLS de l'utilisateur qui l'interroge
create or replace view public.v_avancement with (security_invoker = true) as
select
  i.id                               as inscription_id,
  i.eleve_id,
  i.formation_id,
  count(l.id)                        as nb_lecons,
  count(p.id) filter (where p.statut = 'termine') as nb_terminees,
  case when count(l.id) = 0 then 0
       else round(100.0 * count(p.id) filter (where p.statut = 'termine') / count(l.id))
  end                                as pourcentage
from public.inscriptions i
left join public.modules m on m.formation_id = i.formation_id and m.publie
left join public.lecons  l on l.module_id = m.id and l.publie
left join public.progression p on p.inscription_id = i.id and p.lecon_id = l.id
group by i.id, i.eleve_id, i.formation_id;

-- ------------------------------------------------------------
-- 5. Demandes du formulaire de contact (site public)
-- ------------------------------------------------------------
create table if not exists public.demandes_contact (
  id            uuid primary key default gen_random_uuid(),
  prenom        text not null,
  nom           text not null,
  email         text not null,
  telephone     text,
  entreprise    text,
  fonction      text,
  formation     text,
  participants  text,
  message       text not null,
  traitee       boolean not null default false,
  created_at    timestamptz not null default now()
);

-- ------------------------------------------------------------
-- 6. Row Level Security
-- ------------------------------------------------------------
alter table public.profiles         enable row level security;
alter table public.formations       enable row level security;
alter table public.modules          enable row level security;
alter table public.lecons           enable row level security;
alter table public.inscriptions     enable row level security;
alter table public.progression      enable row level security;
alter table public.demandes_contact enable row level security;

-- profiles
drop policy if exists "profiles: lecture soi ou admin" on public.profiles;
create policy "profiles: lecture soi ou admin" on public.profiles
  for select using (id = auth.uid() or public.is_admin());
drop policy if exists "profiles: écriture admin" on public.profiles;
create policy "profiles: écriture admin" on public.profiles
  for all using (public.is_admin()) with check (public.is_admin());

-- formations : publiques si publiées, sinon élèves inscrits + admin
drop policy if exists "formations: lecture" on public.formations;
create policy "formations: lecture" on public.formations
  for select using (publie or public.is_admin() or public.a_acces_formation(id));
drop policy if exists "formations: écriture admin" on public.formations;
create policy "formations: écriture admin" on public.formations
  for all using (public.is_admin()) with check (public.is_admin());

-- modules / leçons : contenu réservé aux inscrits (jamais public)
drop policy if exists "modules: lecture inscrits ou admin" on public.modules;
create policy "modules: lecture inscrits ou admin" on public.modules
  for select using (public.is_admin() or (publie and public.a_acces_formation(formation_id)));
drop policy if exists "modules: écriture admin" on public.modules;
create policy "modules: écriture admin" on public.modules
  for all using (public.is_admin()) with check (public.is_admin());

drop policy if exists "lecons: lecture inscrits ou admin" on public.lecons;
create policy "lecons: lecture inscrits ou admin" on public.lecons
  for select using (
    public.is_admin()
    or (publie and exists (
      select 1 from public.modules m
      where m.id = module_id and m.publie and public.a_acces_formation(m.formation_id)
    ))
  );
drop policy if exists "lecons: écriture admin" on public.lecons;
create policy "lecons: écriture admin" on public.lecons
  for all using (public.is_admin()) with check (public.is_admin());

-- inscriptions
drop policy if exists "inscriptions: lecture soi ou admin" on public.inscriptions;
create policy "inscriptions: lecture soi ou admin" on public.inscriptions
  for select using (eleve_id = auth.uid() or public.is_admin());
drop policy if exists "inscriptions: écriture admin" on public.inscriptions;
create policy "inscriptions: écriture admin" on public.inscriptions
  for all using (public.is_admin()) with check (public.is_admin());

-- progression : l'élève écrit la sienne, l'admin voit tout
drop policy if exists "progression: lecture soi ou admin" on public.progression;
create policy "progression: lecture soi ou admin" on public.progression
  for select using (
    public.is_admin()
    or exists (select 1 from public.inscriptions i where i.id = inscription_id and i.eleve_id = auth.uid())
  );
drop policy if exists "progression: écriture élève" on public.progression;
create policy "progression: écriture élève" on public.progression
  for insert with check (
    exists (select 1 from public.inscriptions i where i.id = inscription_id and i.eleve_id = auth.uid()
            and public.a_acces_formation(i.formation_id))
  );
drop policy if exists "progression: mise à jour élève" on public.progression;
create policy "progression: mise à jour élève" on public.progression
  for update using (
    exists (select 1 from public.inscriptions i where i.id = inscription_id and i.eleve_id = auth.uid())
  );
drop policy if exists "progression: admin" on public.progression;
create policy "progression: admin" on public.progression
  for all using (public.is_admin()) with check (public.is_admin());

-- demandes de contact : insérées côté serveur (service_role), lues/traitées par l'admin
drop policy if exists "demandes: admin" on public.demandes_contact;
create policy "demandes: admin" on public.demandes_contact
  for all using (public.is_admin()) with check (public.is_admin());

-- ------------------------------------------------------------
-- 7. Storage : bucket PRIVÉ pour les contenus pédagogiques
--    (vidéos, PDF, podcasts…). Servis via URL signées courte durée.
-- ------------------------------------------------------------
insert into storage.buckets (id, name, public, file_size_limit)
values ('contenus', 'contenus', false, 524288000)  -- 500 Mo par fichier
on conflict (id) do update set public = false;

drop policy if exists "contenus: admin" on storage.objects;
create policy "contenus: admin" on storage.objects
  for all using (bucket_id = 'contenus' and public.is_admin())
  with check (bucket_id = 'contenus' and public.is_admin());

-- Lecture par un élève inscrit : le chemin doit commencer par formations/<formation_id>/
drop policy if exists "contenus: lecture inscrits" on storage.objects;
create policy "contenus: lecture inscrits" on storage.objects
  for select using (
    bucket_id = 'contenus'
    and (storage.foldername(name))[1] = 'formations'
    and public.a_acces_formation(((storage.foldername(name))[2])::uuid)
  );

-- ------------------------------------------------------------
-- 8. Seed du catalogue (les 9 formations du site)
-- ------------------------------------------------------------
insert into public.formations (slug, titre, categorie, icone, duree_heures, duree_label, modalite, prix_ht, accroche, programme, publie, ordre) values
('management-leadership', 'Management & Leadership', 'management', '🏆', 14, '2 jours', 'Intra-entreprise', 890,
 'Développez votre posture managériale, motivez vos équipes et apprenez à conduire le changement avec assurance.',
 array['Styles de management et leadership situationnel','Entretiens de performance et feedback constructif','Motivation et engagement des équipes','Gestion des situations difficiles'], true, 1),
('prise-de-parole', 'Prise de Parole en Public', 'communication', '🎤', 14, '2 jours', 'Intra-entreprise', 790,
 'Gagnez en aisance et en impact lors de vos prises de parole : réunions, présentations, conférences.',
 array['Gestion du stress et du trac','Structure et clarté du message','Langage corporel et présence','Entraînements filmés et feedback'], true, 2),
('communication-professionnelle', 'Communication Professionnelle', 'communication', '🗣️', 7, '1 jour', 'En ligne / Intra', 490,
 'Communiquez avec clarté et assertivité dans toutes les situations professionnelles.',
 array['Écoute active et reformulation','Communication assertive','Gestion des conflits et de l''agressivité','Communication non verbale'], true, 3),
('gestes-postures-tms', 'Gestes & Postures / TMS', 'securite', '🛡️', 7, '1 jour', 'Intra-entreprise', 390,
 'Prévenez les troubles musculo-squelettiques (TMS) et adoptez les bons gestes dans votre activité quotidienne.',
 array['Anatomie fonctionnelle simplifiée','Identification des facteurs de risque','Gestes et postures adaptés au poste','Exercices pratiques en situation'], true, 4),
('securite-prevention', 'Sécurité & Prévention au Travail', 'securite', '⛑️', 7, '1 jour', 'Intra-entreprise', 390,
 'Maîtrisez les fondamentaux de la sécurité au travail et de la prévention des risques professionnels.',
 array['Réglementation et responsabilités','Évaluation des risques (DUERP)','Port des EPI et procédures d''urgence','Culture sécurité en entreprise'], true, 5),
('excel-avance', 'Excel Avancé', 'bureautique', '📊', 14, '2 jours', 'En ligne / Intra', 690,
 'Maîtrisez les fonctions avancées d''Excel pour analyser vos données et automatiser vos tableaux de bord.',
 array['Fonctions avancées (RECHERCHEV, INDEX, etc.)','Tableaux croisés dynamiques','Macros VBA (initiation)','Graphiques et visualisations'], true, 6),
('gestion-de-projet', 'Gestion de Projet', 'projet', '🗂️', 21, '3 jours', 'En ligne / Intra', 1290,
 'Pilotez vos projets avec méthode : planification, suivi, livrables et gestion des parties prenantes.',
 array['Cadrage et note de lancement','Planification (WBS, Gantt, chemin critique)','Pilotage des risques et des coûts','Méthodes agiles (Scrum, Kanban)'], true, 7),
('recrutement-integration', 'Recrutement & Intégration', 'rh', '👥', 14, '2 jours', 'Intra-entreprise', 890,
 'Construisez un processus de recrutement efficace et soignez l''intégration de vos nouveaux collaborateurs.',
 array['Définition du besoin et du profil','Techniques d''entretien structuré','Évaluation objective des candidats','Onboarding et fidélisation'], true, 8),
('gestion-du-stress-qvt', 'Gestion du Stress & QVT', 'rh', '🧘', 7, '1 jour', 'En ligne / Intra', 490,
 'Reprenez le contrôle face au stress professionnel et améliorez votre qualité de vie au travail.',
 array['Identifier ses sources de stress','Techniques de régulation émotionnelle','Organisation et gestion des priorités','Pratiques de pleine conscience'], true, 9)
on conflict (slug) do nothing;

-- Rattrapage : profils manquants pour des utilisateurs créés avant cette migration
insert into public.profiles (id, email, prenom, nom, role)
select u.id, u.email, u.raw_user_meta_data->>'prenom', u.raw_user_meta_data->>'nom', 'eleve'
from auth.users u
where not exists (select 1 from public.profiles p where p.id = u.id);

-- ------------------------------------------------------------
-- 9. PREMIER ADMIN — à faire UNE fois, après avoir créé ton
--    utilisateur dans Supabase → Authentication → Users
--    (Add user → email + mot de passe, "Auto confirm" coché) :
--
--    update public.profiles set role = 'admin', actif = true
--    where email = 'contact.ideaforma@gmail.com';
-- ------------------------------------------------------------
