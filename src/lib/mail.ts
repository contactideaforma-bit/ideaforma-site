import "server-only";
import nodemailer from "nodemailer";
import { CONTACT_EMAIL } from "@/lib/mail-gabarits";

export {
  mailBienvenue,
  mailNouveauMotDePasse,
  mailDemandeContact,
  mailPersonnalise,
  messageBienvenueParDefaut,
  SUJET_BIENVENUE,
  CONTACT_EMAIL,
  type FormationAttribuee,
} from "@/lib/mail-gabarits";

type MailInput = {
  to: string;
  subject: string;
  html: string;
  text: string;
  replyTo?: string;
  /** Pièces jointes (PDF générés, etc.). */
  attachments?: { filename: string; content: Buffer; contentType?: string }[];
};

export type MailResult = { ok: true } | { ok: false; raison: string };

/** Expéditeur par défaut : la boîte OVH contact@ideaforma.fr. */
export function expediteur(): string {
  return process.env.MAIL_FROM || `IDEAFORMA <${process.env.SMTP_USER || CONTACT_EMAIL}>`;
}

/** Adresse qui reçoit les demandes de contact du site. */
export function destinataireContact(): string {
  return process.env.CONTACT_TO || CONTACT_EMAIL;
}

/** Vrai si un transport d'envoi est configuré (SMTP OVH en priorité, sinon Resend). */
export function mailConfigure(): boolean {
  return !!(process.env.SMTP_HOST && process.env.SMTP_USER && process.env.SMTP_PASS) || !!process.env.RESEND_API_KEY;
}

export function transportActif(): "smtp" | "resend" | null {
  if (process.env.SMTP_HOST && process.env.SMTP_USER && process.env.SMTP_PASS) return "smtp";
  if (process.env.RESEND_API_KEY) return "resend";
  return null;
}

/**
 * Envoi d'e-mail. Retourne { ok:false } au lieu de lever une erreur : l'appelant décide quoi faire
 * (par ex. afficher le mot de passe à l'admin si l'e-mail de bienvenue n'est pas parti).
 *
 * Transport 1 (recommandé) : SMTP OVH — SMTP_HOST=smtp.mail.ovh.net, SMTP_PORT=465,
 *   SMTP_USER=contact@ideaforma.fr, SMTP_PASS=mot de passe de la boîte.
 * Transport 2 : Resend (RESEND_API_KEY), conservé en secours.
 */
export async function envoyerMail(input: MailInput): Promise<MailResult> {
  const t = transportActif();
  if (t === "smtp") return envoyerSmtp(input);
  if (t === "resend") return envoyerResend(input);
  return { ok: false, raison: "aucun transport d'e-mail configuré (SMTP_HOST/SMTP_USER/SMTP_PASS ou RESEND_API_KEY)" };
}

async function envoyerSmtp(input: MailInput): Promise<MailResult> {
  const port = Number(process.env.SMTP_PORT || 465);
  try {
    const transporter = nodemailer.createTransport({
      host: process.env.SMTP_HOST,
      port,
      secure: port === 465,
      auth: { user: process.env.SMTP_USER, pass: process.env.SMTP_PASS },
      connectionTimeout: 15_000,
      greetingTimeout: 15_000,
      socketTimeout: 20_000,
    });
    await transporter.sendMail({
      from: expediteur(),
      to: input.to,
      subject: input.subject,
      html: input.html,
      text: input.text,
      replyTo: input.replyTo,
      attachments: input.attachments?.map((a) => ({ filename: a.filename, content: a.content, contentType: a.contentType ?? "application/pdf" })),
    });
    return { ok: true };
  } catch (e) {
    return { ok: false, raison: `SMTP : ${e instanceof Error ? e.message : "erreur d'envoi"}` };
  }
}

async function envoyerResend(input: MailInput): Promise<MailResult> {
  try {
    const res = await fetch("https://api.resend.com/emails", {
      method: "POST",
      headers: { Authorization: `Bearer ${process.env.RESEND_API_KEY}`, "Content-Type": "application/json" },
      body: JSON.stringify({
        from: expediteur(),
        to: [input.to],
        subject: input.subject,
        html: input.html,
        text: input.text,
        reply_to: input.replyTo,
        attachments: input.attachments?.map((a) => ({ filename: a.filename, content: a.content.toString("base64") })),
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
