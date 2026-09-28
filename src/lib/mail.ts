import "server-only";

type MailInput = {
  to: string;
  subject: string;
  html: string;
  text: string;
  replyTo?: string;
};

export type MailResult = { ok: true } | { ok: false; raison: string };

/**
 * Envoi d'e-mail via l'API REST de Resend (sans SDK).
 * Retourne { ok:false } au lieu de lever une erreur : l'appelant décide quoi faire
 * (par ex. afficher le mot de passe à l'admin si l'e-mail de bienvenue n'est pas parti).
 */
export async function envoyerMail(input: MailInput): Promise<MailResult> {
  const apiKey = process.env.RESEND_API_KEY;
  const from = process.env.MAIL_FROM || "IDEAFORMA <onboarding@resend.dev>";
  if (!apiKey) return { ok: false, raison: "RESEND_API_KEY non configurée" };

  try {
    const res = await fetch("https://api.resend.com/emails", {
      method: "POST",
      headers: { Authorization: `Bearer ${apiKey}`, "Content-Type": "application/json" },
      body: JSON.stringify({
        from,
        to: [input.to],
        subject: input.subject,
        html: input.html,
        text: input.text,
        reply_to: input.replyTo,
      }),
    });
    if (!res.ok) {
      const detail = await res.text().catch(() => "");
      return { ok: false, raison: `Resend ${res.status} : ${detail.slice(0, 300)}` };
    }
    return { ok: true };
  } catch (e) {
    return { ok: false, raison: e instanceof Error ? e.message : "erreur réseau" };
  }
}

const SITE = () => process.env.NEXT_PUBLIC_SITE_URL || "https://ideaforma.fr";

function gabarit(titre: string, corps: string): string {
  return `<!doctype html><html lang="fr"><body style="margin:0;background:#EDF7FD;font-family:Poppins,Arial,sans-serif;color:#1a3a52;">
  <div style="max-width:560px;margin:32px auto;background:#ffffff;border:1px solid #cfe6f6;border-radius:14px;overflow:hidden;">
    <div style="background:#1565A0;color:#fff;padding:22px 28px;font-size:20px;font-weight:700;letter-spacing:.5px;">IDEAFORMA</div>
    <div style="padding:28px;line-height:1.6;font-size:15px;">
      <h1 style="font-size:20px;color:#1565A0;margin:0 0 16px;">${titre}</h1>
      ${corps}
    </div>
    <div style="padding:16px 28px;font-size:12px;color:#6B8CA9;border-top:1px solid #e3f0f9;">
      IDEAFORMA — Organisme de formation certifié Qualiopi · 144 avenue Charles de Gaulle, 92200 Neuilly-sur-Seine · 06 25 16 13 93
    </div>
  </div></body></html>`;
}

export function mailBienvenue(opts: { prenom: string | null; email: string; motDePasse: string }) {
  const url = `${SITE()}/connexion`;
  const bonjour = opts.prenom ? `Bonjour ${opts.prenom},` : "Bonjour,";
  const html = gabarit(
    "Bienvenue sur votre plateforme de formation",
    `<p>${bonjour}</p>
     <p>Votre compte a été créé sur la plateforme de formation IDEAFORMA. Voici vos identifiants de connexion :</p>
     <table style="border-collapse:collapse;margin:16px 0;">
       <tr><td style="padding:6px 12px 6px 0;color:#6B8CA9;">Identifiant</td><td style="padding:6px 0;font-weight:600;">${opts.email}</td></tr>
       <tr><td style="padding:6px 12px 6px 0;color:#6B8CA9;">Mot de passe</td><td style="padding:6px 0;font-weight:600;font-family:monospace;font-size:16px;">${opts.motDePasse}</td></tr>
     </table>
     <p><a href="${url}" style="display:inline-block;background:#FF6B35;color:#fff;text-decoration:none;padding:12px 22px;border-radius:50px;font-weight:600;">Accéder à ma formation</a></p>
     <p style="font-size:13px;color:#6B8CA9;">Nous vous conseillons de modifier votre mot de passe dès votre première connexion (menu « Mon compte »). Ce mot de passe est strictement personnel.</p>`
  );
  const text = `${bonjour}\n\nVotre compte a été créé sur la plateforme de formation IDEAFORMA.\n\nIdentifiant : ${opts.email}\nMot de passe : ${opts.motDePasse}\n\nConnexion : ${url}\n\nPensez à modifier votre mot de passe dès votre première connexion.\n\nIDEAFORMA`;
  return { subject: "Vos identifiants — plateforme de formation IDEAFORMA", html, text };
}

export function mailNouveauMotDePasse(opts: { prenom: string | null; email: string; motDePasse: string }) {
  const url = `${SITE()}/connexion`;
  const bonjour = opts.prenom ? `Bonjour ${opts.prenom},` : "Bonjour,";
  const html = gabarit(
    "Votre nouveau mot de passe",
    `<p>${bonjour}</p>
     <p>Un nouveau mot de passe a été généré pour votre compte sur la plateforme IDEAFORMA :</p>
     <p style="font-family:monospace;font-size:18px;font-weight:700;">${opts.motDePasse}</p>
     <p><a href="${url}" style="display:inline-block;background:#FF6B35;color:#fff;text-decoration:none;padding:12px 22px;border-radius:50px;font-weight:600;">Me connecter</a></p>`
  );
  const text = `${bonjour}\n\nNouveau mot de passe pour ${opts.email} : ${opts.motDePasse}\n\nConnexion : ${url}\n\nIDEAFORMA`;
  return { subject: "Nouveau mot de passe — plateforme IDEAFORMA", html, text };
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
    v ? `<tr><td style="padding:4px 12px 4px 0;color:#6B8CA9;vertical-align:top;">${l}</td><td style="padding:4px 0;">${v}</td></tr>` : "";
  const html = gabarit(
    "Nouvelle demande depuis ideaforma.fr",
    `<table style="border-collapse:collapse;">
      ${ligne("Nom", `${d.prenom} ${d.nom}`)}${ligne("E-mail", d.email)}${ligne("Téléphone", d.telephone)}
      ${ligne("Entreprise", d.entreprise)}${ligne("Fonction", d.fonction)}${ligne("Formation", d.formation)}${ligne("Participants", d.participants)}
     </table>
     <p style="white-space:pre-wrap;border-left:3px solid #4A9FD4;padding-left:12px;margin-top:16px;">${d.message}</p>`
  );
  const text = `Nouvelle demande de contact\n\nNom : ${d.prenom} ${d.nom}\nE-mail : ${d.email}\nTéléphone : ${d.telephone ?? "-"}\nEntreprise : ${d.entreprise ?? "-"}\nFonction : ${d.fonction ?? "-"}\nFormation : ${d.formation ?? "-"}\nParticipants : ${d.participants ?? "-"}\n\n${d.message}`;
  return { subject: `[ideaforma.fr] Demande de ${d.prenom} ${d.nom}`, html, text };
}

/** Mot de passe lisible, sans caractères ambigus (ex. Idea-7KQ4-XM2P). */
export function genererMotDePasse(): string {
  const alphabet = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
  const bloc = () => {
    const bytes = new Uint8Array(4);
    crypto.getRandomValues(bytes);
    return Array.from(bytes, (b) => alphabet[b % alphabet.length]).join("");
  };
  return `Idea-${bloc()}-${bloc()}`;
}
