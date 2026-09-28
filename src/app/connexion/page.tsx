import type { Metadata } from "next";
import Link from "next/link";
import LoginForm from "@/components/LoginForm";

export const metadata: Metadata = { title: "Connexion", robots: { index: false } };

export default async function Connexion({
  searchParams,
}: {
  searchParams: Promise<{ suivant?: string; erreur?: string; info?: string }>;
}) {
  const { suivant, erreur, info } = await searchParams;

  return (
    <div className="auth-page">
      <div className="auth-card">
        <Link href="/">
          {/* eslint-disable-next-line @next/next/no-img-element */}
          <img src="/images/logo-ideaforma.png" alt="IDEAFORMA" className="auth-logo" />
        </Link>
        <h1>Espace de formation</h1>
        <p>Connectez-vous avec les identifiants reçus par e-mail.</p>
        {erreur === "compte-desactive" && (
          <div className="alert alert-warn">Votre compte est désactivé. Contactez IDEAFORMA pour le réactiver.</div>
        )}
        {info === "mot-de-passe-modifie" && (
          <div className="alert alert-success">Mot de passe modifié. Vous pouvez vous connecter.</div>
        )}
        <LoginForm suivant={suivant} />
        <div className="auth-links">
          <Link href="/mot-de-passe-oublie">Mot de passe oublié ?</Link>
          <Link href="/">← Retour au site</Link>
        </div>
      </div>
    </div>
  );
}
