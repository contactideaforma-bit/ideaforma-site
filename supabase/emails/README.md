# Gabarits d'e-mails Supabase Auth

À coller dans Supabase → Authentication → Emails → Templates (voir DEPLOIEMENT.md, section 6.2).

| Template Supabase | Fichier | Objet à saisir |
|---|---|---|
| Reset password | `reset-password.html` | Réinitialiser votre mot de passe — IDEAFORMA |
| Change email address | `change-email.html` | Confirmer votre nouvelle adresse e-mail — IDEAFORMA |

Les autres templates (Confirm signup, Magic link, Invite) ne sont pas utilisés : les comptes sont créés par l'administrateur, déjà confirmés, et les identifiants partent par l'e-mail de bienvenue de la plateforme.

Variables Supabase disponibles : `{{ .ConfirmationURL }}`, `{{ .Email }}`, `{{ .NewEmail }}`, `{{ .SiteURL }}`.
