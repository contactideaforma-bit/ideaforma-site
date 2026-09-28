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
   avec Resend — Host `smtp.resend.com`, Port `465`, User `resend`, Password = clé API Resend,
   Sender = `onboarding@resend.dev` tant que le domaine n'est pas vérifié (voir étape 6).
   Dans **Email Templates → Reset password**, texte en français et lien `{{ .ConfirmationURL }}`.
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
   | `RESEND_API_KEY` | clé Resend (facultatif au début) |
   | `MAIL_FROM` | `IDEAFORMA <onboarding@resend.dev>` puis `IDEAFORMA <contact@ideaforma.fr>` |
   | `CONTACT_TO` | `contact.ideaforma@gmail.com` |

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

## 6. Resend — envoi des e-mails de bienvenue (10 min)

Sans clé Resend, la plateforme fonctionne : le mot de passe de l'élève s'affiche à l'écran
après création, à transmettre à la main.

1. https://resend.com → **API Keys** → créer une clé → `RESEND_API_KEY` sur Vercel.
2. **Domains → Add domain → `ideaforma.fr`** → ajouter les enregistrements DNS indiqués
   (MX + TXT SPF + TXT DKIM) chez le gestionnaire DNS → Verify.
   ⚠️ Tant que le domaine n'est pas vérifié, `onboarding@resend.dev` ne peut écrire **qu'à ton
   adresse** : les élèves ne recevront rien. C'est donc une étape obligatoire avant le premier vrai élève.
3. Passer `MAIL_FROM` à `IDEAFORMA <contact@ideaforma.fr>` sur Vercel → Redeploy.

---

## Vérifications de fin d'étape 1

- [ ] `https://ideaforma.fr` affiche le nouveau site (4 pages + mentions légales).
- [ ] Formulaire de contact → la demande apparaît dans **Admin → Demandes de contact** (+ e-mail si Resend).
- [ ] `/connexion` avec le compte admin → tableau de bord.
- [ ] Créer un élève test avec ta propre adresse → e-mail reçu (ou mot de passe affiché) → connexion sur `/espace`.
- [ ] Attribuer une formation avec une date de fin passée → l'élève la voit « Délai dépassé » et ne peut pas l'ouvrir.
- [ ] Désactiver le compte test → connexion refusée.

## Étape 2 (à venir)

Lecteur de contenu (vidéo, slides, PDF, podcast, e-book) via le bucket privé `contenus` et des URL
signées de quelques minutes, éditeur de quiz et d'évaluations avec notation, certificats de réalisation,
protection renforcée (filigrane dynamique, flou quand l'onglet perd le focus, lecture vidéo sans
téléchargement), et création des premières formations « solides ».
