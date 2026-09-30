import { NextResponse } from "next/server";
import { createAdminClient } from "@/lib/supabase/admin";
import { envoyerMail, mailDemandeContact, destinataireContact, CONTACT_EMAIL } from "@/lib/mail";

export const runtime = "nodejs";

function champ(v: unknown, max = 200): string {
  return typeof v === "string" ? v.trim().slice(0, max) : "";
}

export async function POST(req: Request) {
  let body: Record<string, unknown>;
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ erreur: "Requête invalide." }, { status: 400 });
  }

  // Piège à robots
  if (champ(body.site_web)) return NextResponse.json({ ok: true });

  const demande = {
    prenom: champ(body.prenom, 80),
    nom: champ(body.nom, 80),
    email: champ(body.email, 160).toLowerCase(),
    telephone: champ(body.telephone, 40) || null,
    entreprise: champ(body.entreprise, 120) || null,
    fonction: champ(body.fonction, 120) || null,
    formation: champ(body.formation, 120) || null,
    participants: champ(body.participants, 40) || null,
    message: champ(body.message, 4000),
  };

  if (!demande.prenom || !demande.nom || !demande.message || !/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(demande.email)) {
    return NextResponse.json({ erreur: "Merci de renseigner votre nom, un e-mail valide et votre message." }, { status: 400 });
  }

  // 1. Enregistrement en base (visible dans l'espace admin → Demandes)
  let enregistre = false;
  try {
    const admin = createAdminClient();
    const { error } = await admin.from("demandes_contact").insert(demande);
    enregistre = !error;
    if (error) console.error("[contact] insertion impossible :", error.message);
  } catch (e) {
    console.error("[contact] base injoignable :", e);
  }

  // 2. Notification e-mail (SMTP OVH ou Resend, selon la configuration)
  const to = destinataireContact();
  const mail = mailDemandeContact(demande);
  const envoi = await envoyerMail({ to, ...mail, replyTo: demande.email });
  if (!envoi.ok) console.warn("[contact] e-mail non envoyé :", envoi.raison);

  if (!enregistre && !envoi.ok) {
    return NextResponse.json(
      { erreur: `Nous n'avons pas pu enregistrer votre demande. Écrivez-nous directement à ${CONTACT_EMAIL}.` },
      { status: 500 }
    );
  }
  return NextResponse.json({ ok: true });
}
