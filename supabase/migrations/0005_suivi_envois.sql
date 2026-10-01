-- 0005 — Suivi pédagogique (prochain échange, note) et historique des envois de documents.
-- À exécuter après 0004 dans le SQL Editor de Supabase.

alter table public.inscriptions
  add column if not exists prochain_contact date,
  add column if not exists note_suivi text;

create table if not exists public.envois_documents (
  id             uuid primary key default gen_random_uuid(),
  inscription_id uuid not null references public.inscriptions(id) on delete cascade,
  eleve_id       uuid not null references public.profiles(id) on delete cascade,
  envoye_par     uuid references public.profiles(id) on delete set null,
  envoye_le      timestamptz not null default now(),
  destinataire   text not null,
  sujet          text not null,
  documents      text[] not null default '{}',   -- numéros des documents joints (IDF-2026-0001…)
  types          text[] not null default '{}'    -- attestation / certificat / releve
);
create index if not exists envois_documents_inscription_idx on public.envois_documents(inscription_id);

alter table public.envois_documents enable row level security;
drop policy if exists "envois admin" on public.envois_documents;
create policy "envois admin" on public.envois_documents for all using (public.is_admin()) with check (public.is_admin());

-- Vue de suivi : une ligne par inscription, avec l'avancement, la dernière activité et les documents émis.
create or replace view public.v_suivi with (security_invoker = true) as
select
  i.id                                   as inscription_id,
  i.eleve_id,
  i.formation_id,
  i.statut,
  i.date_debut,
  i.date_fin,
  i.prochain_contact,
  i.note_suivi,
  a.nb_lecons,
  a.nb_terminees,
  a.pourcentage,
  greatest(
    (select max(j.created_at) from public.journal_activite j where j.inscription_id = i.id),
    (select max(p.updated_at)  from public.progression p where p.inscription_id = i.id),
    (select max(q.created_at)  from public.quiz_reponses q where q.inscription_id = i.id)
  )                                      as derniere_activite,
  (select count(*) from public.journal_activite j where j.inscription_id = i.id and j.type = 'connexion') as nb_connexions,
  exists (select 1 from public.documents_emis d where d.inscription_id = i.id and d.type = 'attestation') as attestation_emise,
  exists (select 1 from public.documents_emis d where d.inscription_id = i.id and d.type = 'certificat')  as certificat_emis,
  exists (select 1 from public.documents_emis d where d.inscription_id = i.id and d.type = 'releve')     as releve_emis,
  (select max(e.envoye_le) from public.envois_documents e where e.inscription_id = i.id) as dernier_envoi
from public.inscriptions i
left join public.v_avancement a on a.inscription_id = i.id;
