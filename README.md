# ideaforma.fr — site et plateforme de formation

Site public d'IDEAFORMA (organisme de formation certifié Qualiopi) et plateforme de formation en ligne :
espace administrateur (comptes élèves, formations, modules, inscriptions, demandes de contact) et
espace élève (formations attribuées, progression, délai d'accès).

**Stack** : Next.js 15 (App Router, TypeScript), Supabase (Auth + Postgres + RLS + Storage), Vercel, e-mails via SMTP OVH (contact@ideaforma.fr).

## Démarrer

```bash
npm install
cp .env.example .env.local   # remplir les clés Supabase
npm run dev
```

Guide complet de mise en production : **[DEPLOIEMENT.md](./DEPLOIEMENT.md)**.

## Structure

```
src/
  app/
    (site)/            pages publiques : accueil, formations, à propos, contact, mentions légales
    connexion/         connexion (admin + élèves), mot-de-passe-oublie/, reinitialiser/
    admin/             espace administrateur (layout protégé) + actions.ts (server actions)
    espace/            espace élève (layout protégé) + actions.ts
    api/contact/       réception du formulaire de contact
    auth/              callback PKCE, déconnexion
  components/          composants React (site, admin, formulaires)
  lib/
    supabase/          clients : navigateur, serveur (RLS), admin (service_role, serveur uniquement)
    auth.ts            getCurrentProfile / requireAdmin / requireUser
    mail.ts            envoi SMTP OVH (ou Resend en secours) ; mail-gabarits.ts : gabarits HTML aux couleurs du site
    catalogue.ts       catalogue par défaut si la base est vide
    types.ts           types métier
  middleware.ts        rafraîchit la session et protège /admin et /espace
supabase/migrations/   schéma SQL (à jouer dans Supabase → SQL Editor)
public/images/         images du site
legacy-netlify/        ancien site statique (référence, non déployé)
```

## Rôles et sécurité

- `profiles.role` : `admin` (IDEAFORMA) ou `eleve`. Un élève `actif = false` ne peut plus se connecter.
- Les comptes élèves sont créés par l'admin (clé `service_role`, côté serveur uniquement) ; le mot de passe
  généré est envoyé par e-mail de bienvenue et n'est jamais stocké en clair.
- RLS : un élève ne voit que son profil, ses inscriptions, sa progression, et le contenu des formations
  auxquelles il est inscrit **pendant la période d'accès** (`date_debut` → `date_fin`).
- Le bucket Storage `contenus` est privé : les fichiers seront servis par URL signées (étape 2).
