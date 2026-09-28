-- ============================================================
-- IDEAFORMA — plateforme de formation
-- Migration 0002 : traçabilité des quiz / évaluations
-- Idempotente. À exécuter dans Supabase → SQL Editor après 0001.
-- ============================================================

-- Chaque tentative de quiz / évaluation est conservée (preuve de réalisation Qualiopi).
create table if not exists public.quiz_reponses (
  id              uuid primary key default gen_random_uuid(),
  inscription_id  uuid not null references public.inscriptions(id) on delete cascade,
  lecon_id        uuid not null references public.lecons(id) on delete cascade,
  reponses        jsonb not null default '[]'::jsonb,   -- index choisis par question
  score           numeric(5,2) not null,                -- en %
  reussi          boolean not null default false,
  duree_secondes  integer,
  created_at      timestamptz not null default now()
);
create index if not exists quiz_reponses_insc_idx on public.quiz_reponses(inscription_id, lecon_id, created_at desc);

alter table public.quiz_reponses enable row level security;

drop policy if exists "quiz: lecture soi ou admin" on public.quiz_reponses;
create policy "quiz: lecture soi ou admin" on public.quiz_reponses
  for select using (
    public.is_admin()
    or exists (select 1 from public.inscriptions i where i.id = inscription_id and i.eleve_id = auth.uid())
  );

drop policy if exists "quiz: insertion élève" on public.quiz_reponses;
create policy "quiz: insertion élève" on public.quiz_reponses
  for insert with check (
    exists (select 1 from public.inscriptions i where i.id = inscription_id and i.eleve_id = auth.uid()
            and public.a_acces_formation(i.formation_id))
  );

drop policy if exists "quiz: admin" on public.quiz_reponses;
create policy "quiz: admin" on public.quiz_reponses
  for all using (public.is_admin()) with check (public.is_admin());

-- Dernière activité de l'élève (pour le suivi admin)
alter table public.progression add column if not exists derniere_activite timestamptz default now();
