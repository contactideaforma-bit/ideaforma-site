# IDEAFORMA — déploiement de la plateforme (étape 1)

Ce projet remplace le site Netlify : **site public + espace administrateur + espace élève**,
sur Next.js 15 / Supabase / Vercel. L'appli interne (`~/ideaforma`, suivi OPCO, Nanika) reste
un projet séparé et n'est pas touchée.

Ordre conseillé : **1 → 2 → 3 → 4 → 5 → 6**. Compter environ une heure.

---

## 1. Lancer le projet en local (5 min)

```bash
cd ~/ideaforma-site
npm install
cp .env.example .env.local     # puis remplir les valeurs (étape 2)
npm run dev                    # http://localhost:3000
```

Le site public fonctionne même sans Supabase (catalogue par défaut). L'admin et l'espace
élève ont besoin des variables de l'étape 2.

---

## 2. Supabase — projet dédié (15 min)

1. https://supabase.com → **New project** → nom `ideaforma-plateforme`, région **Europe (Paris ou Francfort)**,
   mot de passe base de données à conserver dans ton coffre.
2. **SQL Editor** → nouvelle requête → coller tout le contenu de
   `supabase/migrations/0001_plateforme.sql` → **Run**.
   (Le script est rejouable sans risque.)
3. **Authentication → Users → Add user** : ton e-mail `contact.ideaforma@gmail.com`, un mot de passe,
   coche **Auto Confirm User** → Create.
4. Retour dans **SQL Editor** :
   ```sql
   update public.profiles set role = 'admin', actif = true
   where email = 'contact.ideaforma@gmail.com';
   ```
5. **Authentication → Sign In / Providers → Email** : décocher **Allow new users to sign up**
   (seule l'admin crée des comptes ; la création passe par la clé service_role, qui n'est pas
   concernée par ce réglage).
6. **Authentication → URL Configuration** :
   - Site URL : `https://ideaforma.fr`
   - Redirect URLs : `https://ideaforma.fr/auth/callback`, `https://*.vercel.app/auth/callback`,
     `http://localhost:3000/auth/callback`
7. **Authentication → Emails → SMTP Settings** (pour « mot de passe oublié ») : activer Custom SMTP
   avec la boîte OVH — Host `smtp.mail.ovh.net`, Port `465`, User `contact@ideaforma.fr`,
   Password = mot de passe de la boîte, Sender `contact@ideaforma.fr`, nom `IDEAFORMA`.
   Templates en français : voir section 6.2 (`supabase/emails/`).
8. **Project Settings → API** : noter `Project URL`, `anon public` et `service_role` (secrète !).

---

## 3. GitHub — nouveau dépôt (5 min)

Sur github.com : **New repository** → `ideaforma-site` (privé) → sans README. Puis :

```bash
cd ~/ideaforma-site
git init
git add -A
git commit -m "feat: site ideaforma.fr sur Next.js + plateforme de formation (admin, espace élève, Supabase)"
git branch -M main
git remote add origin https://github.com/contactideaforma-bit/ideaforma-site.git
git push -u origin main
```

Les dossiers `OPCO-dossier-referencement/` et `Claude outputs/` sont dans `.gitignore` :
ils restent sur ton Mac et ne partent pas sur GitHub.

---

## 4. Vercel — import et variables (10 min)

1. https://vercel.com → **Add New → Project** → importer `ideaforma-site` (framework détecté : Next.js).
2. **Environment Variables** (toutes pour Production + Preview) :

   | Variable | Valeur |
   |---|---|
   | `NEXT_PUBLIC_SUPABASE_URL` | Project URL Supabase |
   | `NEXT_PUBLIC_SUPABASE_ANON_KEY` | clé `anon public` |
   | `SUPABASE_SERVICE_ROLE_KEY` | clé `service_role` |
   | `NEXT_PUBLIC_SITE_URL` | `https://ideaforma.fr` |
   | `SMTP_HOST` | `smtp.mail.ovh.net` (boîte OVH contact@ideaforma.fr) |
   | `SMTP_PORT` | `465` |
   | `SMTP_USER` | `contact@ideaforma.fr` |
   | `SMTP_PASS` | mot de passe de la boîte (celui défini dans l'espace client OVH → E-mails) |
   | `MAIL_FROM` | `IDEAFORMA <contact@ideaforma.fr>` |
   | `CONTACT_TO` | `contact@ideaforma.fr` |
   | `RESEND_API_KEY` | facultatif : transport de secours si SMTP n'est pas renseigné |

3. **Deploy**. Tester sur l'URL `*.vercel.app` : accueil, `/formations`, `/connexion` avec ton compte
   admin → `/admin`.

---

## 5. Domaine ideaforma.fr : de Netlify vers Vercel (10 min + propagation)

1. Vercel → projet → **Settings → Domains** → ajouter `ideaforma.fr` et `www.ideaforma.fr`
   (www redirigé vers l'apex). Vercel affiche les enregistrements attendus.
2. Là où est géré le DNS aujourd'hui (Netlify DNS) → **Domains → ideaforma.fr → DNS settings** :
   - supprimer les enregistrements Netlify existants pour `@` et `www` ;
   - ajouter `A` `@` → `76.76.21.21` ;
   - ajouter `CNAME` `www` → `cname.vercel-dns.com`.
   Alternative plus propre : remplacer les serveurs de noms chez le registrar par ceux de Vercel
   (`ns1.vercel-dns.com`, `ns2.vercel-dns.com`) — dans ce cas recréer aussi les éventuels
   enregistrements e-mail (MX, TXT) dans Vercel avant de basculer.
3. Attendre la propagation (quelques minutes à quelques heures). Vercel émet le certificat HTTPS seul.
4. Une fois `https://ideaforma.fr` servi par Vercel : supprimer le site Netlify (ou le laisser, il ne sert plus).
5. Google Search Console : le fichier `google56cf4919626cb036.html` est conservé dans `public/`, rien à refaire.

Les anciennes URL (`/formations.html`…) redirigent en 301 vers les nouvelles.

---

## 6. E-mails — boîte OVH contact@ideaforma.fr (10 min)

Tous les e-mails de la plateforme (bienvenue et identifiants, nouveau mot de passe, e-mails
personnalisés depuis la fiche élève, notification des demandes de contact) partent de la boîte
OVH `contact@ideaforma.fr` via SMTP. Sans configuration, la plateforme fonctionne quand même :
le mot de passe de l'élève s'affiche à l'écran après création, à transmettre à la main.

### 6.1 Envois de l'application (Vercel)

1. Vercel → Settings → Environment Variables : ajouter `SMTP_HOST`, `SMTP_PORT`, `SMTP_USER`,
   `SMTP_PASS`, `MAIL_FROM`, `CONTACT_TO` (valeurs dans le tableau de la section 4) → Redeploy.
2. Vérifier dans **Admin → Mon compte → Configuration** : « Envoi d'e-mails : SMTP OVH ».
3. Test : Admin → Élèves → un élève → « Envoyer un e-mail à l'élève » → aperçu → envoyer à
   une adresse à toi. Si l'envoi échoue, l'erreur SMTP s'affiche dans le formulaire (mot de passe
   de la boîte le plus souvent : c'est celui d'OVH → E-mails, pas celui du compte OVH).

### 6.2 E-mails d'authentification Supabase (mot de passe oublié)

Le lien « Mot de passe oublié » de la page de connexion est envoyé par Supabase, pas par
l'application. Par défaut Supabase utilise un expéditeur générique limité à quelques envois par
heure : il faut lui donner la boîte OVH.

1. Supabase → **Authentication → Emails → SMTP Settings** → Enable Custom SMTP :
   Sender email `contact@ideaforma.fr`, Sender name `IDEAFORMA`, Host `smtp.mail.ovh.net`,
   Port `465`, Username `contact@ideaforma.fr`, Password (mot de passe de la boîte) → Save.
2. **Authentication → Emails → Templates → Reset password** : Subject
   `Réinitialiser votre mot de passe — IDEAFORMA`, et coller le contenu de
   `supabase/emails/reset-password.html` (gabarit aux couleurs du site, fond clair).
   Faire de même pour **Change email address** avec `supabase/emails/change-email.html`.
3. **Authentication → URL Configuration** : Site URL `https://ideaforma.fr`, Redirect URLs
   `https://ideaforma.fr/reinitialiser` (déjà fait à l'étape 2 si tu as suivi le guide).

### 6.3 Délivrabilité

Les MX du domaine pointent déjà vers OVH (la boîte reçoit). Pour que les e-mails envoyés ne
finissent pas en spam, vérifier dans la zone DNS OVH la présence d'un enregistrement TXT SPF
(`v=spf1 include:mx.ovh.com ~all`) et activer DKIM dans l'espace client OVH → E-mails →
ideaforma.fr → onglet DKIM (Activer). Aucune modification côté Vercel.

---

## Vérifications de fin d'étape 1

- [ ] `https://ideaforma.fr` affiche le nouveau site (4 pages + mentions légales).
- [ ] Formulaire de contact → la demande apparaît dans **Admin → Demandes de contact** (+ e-mail si SMTP configuré).
- [ ] `/connexion` avec le compte admin → tableau de bord.
- [ ] Créer un élève test avec ta propre adresse → e-mail reçu (ou mot de passe affiché) → connexion sur `/espace`.
- [ ] Attribuer une formation avec une date de fin passée → l'élève la voit « Délai dépassé » et ne peut pas l'ouvrir.
- [ ] Désactiver le compte test → connexion refusée.

## Étape 2 — contenus et quiz (livrée)

**À faire une fois** : Supabase → SQL Editor → coller `supabase/migrations/0002_contenus_quiz.sql` → Run
(table `quiz_reponses` = traçabilité de chaque tentative, preuve de réalisation).

Ce que ça apporte :
- **Admin → Formations → fiche → « Modifier »** sur une leçon : rédaction d'un cours texte, dépôt d'un fichier
  (vidéo MP4, podcast MP3, PDF / e-book / slides exportées en PDF) directement dans le stockage privé,
  lien vidéo externe (YouTube non répertorié / Vimeo), éditeur de quiz et d'évaluations (choix unique ou
  multiple, seuil de réussite, tentatives maximum, explications).
- **Élève** : lecteur intégré (vidéo et audio sans téléchargement, PDF rendu page par page sans barre
  d'outils, diaporama avec flèches), quiz corrigés **côté serveur** (les bonnes réponses ne sont jamais
  envoyées au navigateur avant soumission), progression automatique, navigation précédent / suivant.
- **Protection** : clic droit, copie, impression et raccourcis bloqués ; contenu flouté quand la fenêtre
  perd le focus ; filigrane avec l'e-mail de l'élève sur les pages, vidéos et PDF ; fichiers servis par
  URL signées valables 3 h, uniquement aux inscrits dans leur délai d'accès.

Limites à connaître :
- Fichiers : 50 Mo maximum par fichier sur l'offre Supabase gratuite (l'offre Pro monte à 5 Go). Pour les
  vidéos longues, utilisez un lien YouTube « non répertorié » ou Vimeo.
- Capture d'écran : impossible à empêcher techniquement dans un navigateur ; le filigrane nominatif et le
  floutage hors focus rendent la fuite dissuasive et traçable.

## Étape 3 (à venir)

Attestations / certificats de réalisation PDF générés automatiquement, relevés de connexion (temps passé
par leçon), questionnaire de satisfaction à chaud, rappels e-mail avant la fin du délai d'accès, et
création des premières formations complètes.
