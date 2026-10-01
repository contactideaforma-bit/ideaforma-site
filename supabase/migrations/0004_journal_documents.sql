-- ============================================================
-- IDEAFORMA — 0004 : journal d'activité (preuve de réalisation du distanciel)
--                   et registre des documents émis (attestations, certificats, relevés)
-- Rejouable sans risque.
-- ============================================================

-- 1. Journal d'activité : une ligne par événement élève (connexion, ouverture de leçon,
--    leçon terminée, quiz). Sert au relevé de connexion et de progression demandé par les
--    financeurs pour la formation à distance (C. trav. D6313-3-1).
create table if not exists public.journal_activite (
  id              uuid primary key default gen_random_uuid(),
  eleve_id        uuid not null references public.profiles(id) on delete cascade,
  inscription_id  uuid references public.inscriptions(id) on delete cascade,
  lecon_id        uuid references public.lecons(id) on delete set null,
  type            text not null check (type in ('connexion','ouverture','fin_lecon','quiz')),
  meta            jsonb not null default '{}'::jsonb,
  created_at      timestamptz not null default now()
);
create index if not exists journal_activite_eleve_idx on public.journal_activite(eleve_id, created_at);
create index if not exists journal_activite_inscription_idx on public.journal_activite(inscription_id, created_at);

alter table public.journal_activite enable row level security;
drop policy if exists "journal: insertion par l'élève" on public.journal_activite;
create policy "journal: insertion par l'élève" on public.journal_activite
  for insert with check (eleve_id = auth.uid());
drop policy if exists "journal: lecture élève ou admin" on public.journal_activite;
create policy "journal: lecture élève ou admin" on public.journal_activite
  for select using (eleve_id = auth.uid() or public.is_admin());

-- 2. Registre des documents émis, numérotés (IDF-AAAA-NNNN), avec les données figées au moment
--    de l'émission (donnees jsonb) pour pouvoir rééditer un document à l'identique.
create table if not exists public.documents_emis (
  id              uuid primary key default gen_random_uuid(),
  numero          text not null unique,
  type            text not null check (type in ('attestation','certificat','releve')),
  inscription_id  uuid not null references public.inscriptions(id) on delete cascade,
  eleve_id        uuid not null references public.profiles(id) on delete cascade,
  emis_par        uuid references public.profiles(id) on delete set null,
  emis_le         timestamptz not null default now(),
  donnees         jsonb not null default '{}'::jsonb
);
create index if not exists documents_emis_inscription_idx on public.documents_emis(inscription_id);

alter table public.documents_emis enable row level security;
drop policy if exists "documents: admin" on public.documents_emis;
create policy "documents: admin" on public.documents_emis
  for all using (public.is_admin()) with check (public.is_admin());
drop policy if exists "documents: lecture élève" on public.documents_emis;
create policy "documents: lecture élève" on public.documents_emis
  for select using (eleve_id = auth.uid());

-- Numérotation séquentielle par année : IDF-2026-0001, IDF-2026-0002…
create sequence if not exists public.documents_emis_seq;
create or replace function public.prochain_numero_document()
returns text language plpgsql security definer set search_path = public as $$
declare n bigint; annee text := to_char(now(), 'YYYY');
begin
  select coalesce(max(split_part(numero, '-', 3)::int), 0) + 1 into n
  from public.documents_emis where numero like 'IDF-' || annee || '-%';
  return 'IDF-' || annee || '-' || lpad(n::text, 4, '0');
end;
$$;

-- 3. Vue de synthèse par inscription (jours actifs, connexions, leçons, temps estimé)
create or replace view public.v_releve with (security_invoker = true) as
select
  i.id as inscription_id,
  i.eleve_id,
  i.formation_id,
  (select count(*) from public.journal_activite j where j.inscription_id = i.id and j.type = 'connexion') as nb_connexions,
  (select count(distinct (j.created_at at time zone 'Europe/Paris')::date) from public.journal_activite j where j.inscription_id = i.id) as nb_jours_actifs,
  (select min(j.created_at) from public.journal_activite j where j.inscription_id = i.id) as premiere_activite,
  (select max(j.created_at) from public.journal_activite j where j.inscription_id = i.id) as derniere_activite,
  (select count(*) from public.progression p where p.inscription_id = i.id and p.statut = 'termine') as nb_lecons_terminees,
  (select coalesce(sum(l.duree_minutes), 0) from public.progression p join public.lecons l on l.id = p.lecon_id where p.inscription_id = i.id and p.statut = 'termine') as minutes_realisees
from public.inscriptions i;
