import ChangerMotDePasse from "@/components/ChangerMotDePasse";
import { requireAdmin, nomComplet } from "@/lib/auth";
import { transportActif, expediteur, destinataireContact } from "@/lib/mail";

export default async function CompteAdmin() {
  const admin = await requireAdmin();
  const transport = transportActif();
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
            <tr><td>Envoi d&apos;e-mails</td><td>{transport === "smtp" ? <span className="badge badge-green">SMTP OVH ({process.env.SMTP_HOST})</span> : transport === "resend" ? <span className="badge badge-blue">Resend</span> : <span className="badge badge-orange">Non configuré</span>}</td></tr>
            <tr><td>Expéditeur</td><td className="muted">{expediteur()}</td></tr>
            <tr><td>Réception des demandes de contact</td><td className="muted">{destinataireContact()}</td></tr>
            <tr><td>URL du site</td><td className="muted">{process.env.NEXT_PUBLIC_SITE_URL || "—"}</td></tr>
          </tbody>
        </table>
        <p style={{ fontSize: ".8rem", marginTop: ".75rem" }}>Ces réglages se modifient dans les variables d&apos;environnement Vercel (voir DEPLOIEMENT.md).</p>
      </div>
    </>
  );
}
