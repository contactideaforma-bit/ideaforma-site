import ChangerMotDePasse from "@/components/ChangerMotDePasse";
import { requireAdmin, nomComplet } from "@/lib/auth";

export default async function CompteAdmin() {
  const admin = await requireAdmin();
  return (
    <>
      <div className="page-title">
        <div>
          <h1>Mon compte</h1>
          <p>{nomComplet(admin)} · {admin.email} · rôle administrateur</p>
        </div>
      </div>
      <div className="panel">
        <h2>Changer mon mot de passe</h2>
        <ChangerMotDePasse />
      </div>
      <div className="panel">
        <h2>Configuration</h2>
        <table className="table">
          <tbody>
            <tr><td>Envoi d&apos;e-mails (Resend)</td><td>{process.env.RESEND_API_KEY ? <span className="badge badge-green">Configuré</span> : <span className="badge badge-orange">Non configuré</span>}</td></tr>
            <tr><td>Expéditeur</td><td className="muted">{process.env.MAIL_FROM || "IDEAFORMA <onboarding@resend.dev>"}</td></tr>
            <tr><td>Réception des demandes de contact</td><td className="muted">{process.env.CONTACT_TO || "contact.ideaforma@gmail.com"}</td></tr>
            <tr><td>URL du site</td><td className="muted">{process.env.NEXT_PUBLIC_SITE_URL || "—"}</td></tr>
          </tbody>
        </table>
        <p style={{ fontSize: ".8rem", marginTop: ".75rem" }}>Ces réglages se modifient dans les variables d&apos;environnement Vercel (voir DEPLOIEMENT.md).</p>
      </div>
    </>
  );
}
