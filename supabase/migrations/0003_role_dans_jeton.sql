-- ============================================================
-- IDEAFORMA — 0003 : rôle et statut copiés dans le jeton (app_metadata)
--
-- Pourquoi : le middleware et les layouts lisaient le rôle dans public.profiles à chaque
-- requête ; pendant le renouvellement du jeton de session, cette lecture pouvait échouer
-- et l'admin était traité comme un élève. Le rôle est désormais aussi présent dans
-- auth.users.raw_app_meta_data (donc dans le JWT), tenu à jour par trigger.
-- Rejouable sans risque.
-- ============================================================

create or replace function public.sync_role_vers_jeton()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  update auth.users
  set raw_app_meta_data = coalesce(raw_app_meta_data, '{}'::jsonb)
    || jsonb_build_object('role', new.role, 'actif', new.actif)
  where id = new.id;
  return new;
end;
$$;

drop trigger if exists trg_sync_role_vers_jeton on public.profiles;
create trigger trg_sync_role_vers_jeton
  after insert or update of role, actif on public.profiles
  for each row execute function public.sync_role_vers_jeton();

-- Mise à niveau des comptes existants
update auth.users u
set raw_app_meta_data = coalesce(u.raw_app_meta_data, '{}'::jsonb)
  || jsonb_build_object('role', p.role, 'actif', p.actif)
from public.profiles p
where p.id = u.id;

-- Vérification : doit afficher role = admin pour ton compte
-- select email, raw_app_meta_data from auth.users;
