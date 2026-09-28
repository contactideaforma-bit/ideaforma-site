import ChangerMotDePasse from "@/components/ChangerMotDePasse";
import { requireUser, nomComplet } from "@/lib/auth";

export default async function CompteEleve() {
  const user = await requireUser();
  return (
    <>
      <div className="page-title">
        <div>
          <h1>Mon compte</h1>
          <p>{nomComplet(user)} · {user.email}{user.entreprise ? ` · ${user.entreprise}` : ""}</p>
        </div>
      </div>
      <div className="panel">
        <h2>Changer mon mot de passe</h2>
        <p style={{ fontSize: ".85rem", marginBottom: "1rem" }}>
          Nous vous conseillons de remplacer le mot de passe reçu par e-mail par un mot de passe personnel.
        </p>
        <ChangerMotDePasse />
      </div>
      <div className="panel">
        <h2>Mes informations</h2>
        <p style={{ fontSize: ".85rem" }}>
          Pour modifier votre nom, votre téléphone ou votre entreprise, contactez IDEAFORMA :{" "}
          <a href="mailto:contact.ideaforma@gmail.com" style={{ color: "var(--blue)" }}>contact.ideaforma@gmail.com</a>.
        </p>
      </div>
    </>
  );
}
