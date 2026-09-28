import type { Metadata } from "next";
import { redirect } from "next/navigation";
import ChangerMotDePasse from "@/components/ChangerMotDePasse";
import { getCurrentProfile } from "@/lib/auth";

export const metadata: Metadata = { title: "Nouveau mot de passe", robots: { index: false } };

export default async function Reinitialiser() {
  const profile = await getCurrentProfile();
  if (!profile) redirect("/connexion?erreur=lien-invalide");

  return (
    <div className="auth-page">
      <div className="auth-card">
        {/* eslint-disable-next-line @next/next/no-img-element */}
        <img src="/images/logo-ideaforma.png" alt="IDEAFORMA" className="auth-logo" />
        <h1>Choisir un nouveau mot de passe</h1>
        <p>Compte : {profile.email}</p>
        <ChangerMotDePasse redirection={profile.role === "admin" ? "/admin" : "/espace"} />
      </div>
    </div>
  );
}
