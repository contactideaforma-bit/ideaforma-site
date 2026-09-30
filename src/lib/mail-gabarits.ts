/**
 * Gabarits d'e-mails IDEAFORMA (HTML + texte), aux couleurs du site.
 * Ce fichier n'a pas de dépendance serveur : il est aussi utilisé côté client
 * pour l'aperçu dans l'espace admin.
 */

export const CONTACT_EMAIL = "contact@ideaforma.fr";
export const CONTACT_TEL = "06 25 16 13 93";
/** Repère facultatif dans un message : le bloc identifiants et le bouton sont insérés à cet endroit. */
export const MARQUEUR_IDENTIFIANTS = "[identifiants]";
export const ADRESSE = "144 avenue Charles de Gaulle, 92200 Neuilly-sur-Seine";

const C = {
  navy: "#0B2545",
  blue: "#2F8BD6",
  blueDark: "#1565A0",
  bluePale: "#EAF4FC",
  amber: "#FF6B35",
  text: "#14213D",
  muted: "#5B6B82",
  bg: "#F6F9FC",
  border: "#E3EAF2",
};

export function echapper(s: string): string {
  return s.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;");
}

/** Texte libre (retours à la ligne) → paragraphes HTML sûrs. */
export function texteVersHtml(texte: string): string {
  return texte
    .trim()
    .split(/\n{2,}/)
    .map((p) => `<p style="margin:0 0 14px;">${echapper(p).replace(/\n/g, "<br />")}</p>`)
    .join("");
}

export function bouton(libelle: string, url: string): string {
  return `<table role="presentation" cellspacing="0" cellpadding="0" style="margin:22px 0;"><tr><td style="background:${C.amber};border-radius:999px;">
    <a href="${url}" style="display:inline-block;color:#ffffff;text-decoration:none;padding:13px 26px;font-weight:600;font-family:Poppins,Arial,sans-serif;font-size:15px;">${echapper(libelle)}</a>
  </td></tr></table>`;
}

export function blocIdentifiants(email: string, motDePasse: string): string {
  return `<table role="presentation" cellspacing="0" cellpadding="0" style="width:100%;margin:18px 0;border:1.5px solid ${C.navy};border-radius:12px;background:#ffffff;">
    <tr><td style="padding:16px 20px;">
      <div style="font-size:12px;letter-spacing:.6px;text-transform:uppercase;color:${C.muted};font-weight:600;margin-bottom:10px;">Vos identifiants de connexion</div>
      <table role="presentation" cellspacing="0" cellpadding="0">
        <tr><td style="padding:4px 14px 4px 0;color:${C.muted};font-size:14px;">Identifiant</td><td style="padding:4px 0;font-weight:600;font-size:15px;color:${C.text};">${echapper(email)}</td></tr>
        <tr><td style="padding:4px 14px 4px 0;color:${C.muted};font-size:14px;">Mot de passe</td><td style="padding:4px 0;font-family:Menlo,Consolas,monospace;font-weight:700;font-size:17px;letter-spacing:1px;color:${C.navy};">${echapper(motDePasse)}</td></tr>
      </table>
    </td></tr>
  </table>`;
}

/** Enveloppe commune : bandeau, corps, pied. Fond clair uniquement. */
export function gabarit(titre: string, corps: string, opts?: { site?: string }): string {
  const site = opts?.site ?? "https://ideaforma.fr";
  return `<!doctype html><html lang="fr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width"><title>${echapper(titre)}</title></head>
<body style="margin:0;padding:0;background:${C.bg};font-family:Inter,Helvetica,Arial,sans-serif;color:${C.text};">
  <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background:${C.bg};"><tr><td align="center" style="padding:28px 12px;">
    <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="max-width:600px;width:100%;background:#ffffff;border:1px solid ${C.border};border-radius:16px;overflow:hidden;">
      <tr><td style="padding:22px 32px;border-bottom:1px solid ${C.border};">
        <table role="presentation" cellspacing="0" cellpadding="0" width="100%"><tr>
          <td style="font-family:Poppins,Arial,sans-serif;font-size:22px;font-weight:700;color:${C.navy};letter-spacing:.5px;">IDEA<span style="color:${C.blue};">FORMA</span></td>
          <td align="right" style="font-size:12px;color:${C.muted};">Organisme de formation certifié Qualiopi</td>
        </tr></table>
      </td></tr>
      <tr><td style="height:4px;background:${C.blue};"></td></tr>
      <tr><td style="padding:30px 32px 10px;">
        <h1 style="margin:0 0 18px;font-family:Poppins,Arial,sans-serif;font-size:22px;line-height:1.3;color:${C.navy};">${echapper(titre)}</h1>
        <div style="font-size:15px;line-height:1.65;color:${C.text};">${corps}</div>
      </td></tr>
      <tr><td style="padding:18px 32px 26px;font-size:12px;line-height:1.6;color:${C.muted};border-top:1px solid ${C.border};background:${C.bluePale};">
        <strong style="color:${C.navy};">IDEAFORMA</strong> · ${echapper(ADRESSE)}<br />
        <a href="mailto:${CONTACT_EMAIL}" style="color:${C.blueDark};text-decoration:none;">${CONTACT_EMAIL}</a> · ${CONTACT_TEL} · <a href="${site}" style="color:${C.blueDark};text-decoration:none;">ideaforma.fr</a>
      </td></tr>
    </table>
  </td></tr></table>
</body></html>`;
}

export type FormationAttribuee = { titre: string; date_debut?: string | null; date_fin?: string | null };

function fmt(d?: string | null): string {
  if (!d) return "";
  const [y, m, j] = d.slice(0, 10).split("-");
  return `${j}/${m}/${y}`;
}

function phraseFormations(formations: FormationAttribuee[]): string {
  if (!formations.length) return "";
  if (formations.length === 1) {
    const f = formations[0];
    const periode = f.date_fin ? ` jusqu'au ${fmt(f.date_fin)}` : f.date_debut ? ` à partir du ${fmt(f.date_debut)}` : "";
    return `Vous avez accès à la formation « ${f.titre} »${periode}.`;
  }
  return `Vous avez accès aux formations suivantes : ${formations
    .map((f) => `« ${f.titre} »${f.date_fin ? ` (jusqu'au ${fmt(f.date_fin)})` : ""}`)
    .join(", ")}.`;
}

/** Message de bienvenue par défaut, modifiable par l'admin avant envoi. */
export function messageBienvenueParDefaut(opts: { prenom: string | null; formations: FormationAttribuee[] }): string {
  const bonjour = opts.prenom ? `Bonjour ${opts.prenom},` : "Bonjour,";
  const acces = phraseFormations(opts.formations);
  return [
    bonjour,
    `Nous avons le plaisir de vous accueillir sur la plateforme de formation IDEAFORMA. Votre compte est prêt.${acces ? " " + acces : ""}`,
    "Voici vos identifiants de connexion. Nous vous conseillons de modifier votre mot de passe dès votre première connexion, depuis le menu « Mon compte ».",
    MARQUEUR_IDENTIFIANTS,
    "Pour bien démarrer : commencez par le module 0 (bienvenue et méthode de travail), prévoyez des séances régulières d'une heure environ, et prenez le temps de faire les carnets de bord à la fin de chaque module. C'est là que la formation devient concrète pour votre équipe.",
    `Pour toute question, répondez simplement à cet e-mail ou écrivez-nous à ${CONTACT_EMAIL}.`,
    "Bonne formation,\nMyriam Ayouaz\nIDEAFORMA",
  ].join("\n\n");
}

/**
 * E-mail personnalisé à un élève : message libre de l'admin, avec ou sans identifiants.
 * Sert au mail de bienvenue (création de compte) et aux envois ultérieurs.
 */
export function mailPersonnalise(opts: {
  sujet: string;
  message: string;
  email: string;
  motDePasse?: string | null;
  site?: string;
}) {
  const site = opts.site ?? "https://ideaforma.fr";
  const url = `${site}/connexion`;
  // Le repère [identifiants] place le bloc identifiants + bouton dans le texte ; sinon ils vont à la fin.
  const [avant, apres] = opts.message.includes(MARQUEUR_IDENTIFIANTS)
    ? opts.message.split(MARQUEUR_IDENTIFIANTS, 2)
    : [opts.message, ""];
  const bloc = (opts.motDePasse ? blocIdentifiants(opts.email, opts.motDePasse) : "") + bouton("Accéder à ma formation", url);
  const corps = texteVersHtml(avant) + bloc + (apres.trim() ? texteVersHtml(apres) : "");
  const html = gabarit(opts.sujet, corps, { site });
  const blocTexte =
    (opts.motDePasse ? `\n\n— Vos identifiants —\nIdentifiant : ${opts.email}\nMot de passe : ${opts.motDePasse}` : "") +
    `\nConnexion : ${url}`;
  const text = avant.trim() + blocTexte + (apres.trim() ? `\n\n${apres.trim()}` : "") + `\n\nIDEAFORMA · ${CONTACT_EMAIL} · ${CONTACT_TEL}`;
  return { subject: opts.sujet, html, text };
}

export const SUJET_BIENVENUE = "Bienvenue sur votre plateforme de formation IDEAFORMA";

export function mailBienvenue(opts: {
  prenom: string | null;
  email: string;
  motDePasse: string;
  formations?: FormationAttribuee[];
  message?: string | null;
  site?: string;
}) {
  const message = opts.message?.trim() || messageBienvenueParDefaut({ prenom: opts.prenom, formations: opts.formations ?? [] });
  return mailPersonnalise({ sujet: SUJET_BIENVENUE, message, email: opts.email, motDePasse: opts.motDePasse, site: opts.site });
}

export function mailNouveauMotDePasse(opts: { prenom: string | null; email: string; motDePasse: string; site?: string }) {
  const bonjour = opts.prenom ? `Bonjour ${opts.prenom},` : "Bonjour,";
  const message = `${bonjour}\n\nUn nouveau mot de passe a été généré pour votre compte sur la plateforme IDEAFORMA. Vous pouvez le modifier après connexion, depuis le menu « Mon compte ».\n\nSi vous n'êtes pas à l'origine de cette demande, écrivez-nous à ${CONTACT_EMAIL}.`;
  return mailPersonnalise({ sujet: "Votre nouveau mot de passe — IDEAFORMA", message, email: opts.email, motDePasse: opts.motDePasse, site: opts.site });
}

export function mailDemandeContact(d: {
  prenom: string;
  nom: string;
  email: string;
  telephone?: string | null;
  entreprise?: string | null;
  fonction?: string | null;
  formation?: string | null;
  participants?: string | null;
  message: string;
}) {
  const ligne = (l: string, v?: string | null) =>
    v ? `<tr><td style="padding:4px 12px 4px 0;color:${C.muted};vertical-align:top;white-space:nowrap;">${l}</td><td style="padding:4px 0;">${echapper(v)}</td></tr>` : "";
  const html = gabarit(
    "Nouvelle demande depuis ideaforma.fr",
    `<table role="presentation" cellspacing="0" cellpadding="0" style="font-size:15px;">
      ${ligne("Nom", `${d.prenom} ${d.nom}`)}${ligne("E-mail", d.email)}${ligne("Téléphone", d.telephone)}
      ${ligne("Entreprise", d.entreprise)}${ligne("Fonction", d.fonction)}${ligne("Formation", d.formation)}${ligne("Participants", d.participants)}
     </table>
     <div style="white-space:pre-wrap;border-left:3px solid ${C.blue};padding-left:14px;margin-top:18px;">${echapper(d.message)}</div>`
  );
  const text = `Nouvelle demande de contact\n\nNom : ${d.prenom} ${d.nom}\nE-mail : ${d.email}\nTéléphone : ${d.telephone ?? "-"}\nEntreprise : ${d.entreprise ?? "-"}\nFonction : ${d.fonction ?? "-"}\nFormation : ${d.formation ?? "-"}\nParticipants : ${d.participants ?? "-"}\n\n${d.message}`;
  return { subject: `[ideaforma.fr] Demande de ${d.prenom} ${d.nom}`, html, text };
}
