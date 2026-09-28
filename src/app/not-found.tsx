import Link from "next/link";

export default function NotFound() {
  return (
    <div className="auth-page">
      <div className="auth-card" style={{ textAlign: "center" }}>
        <div style={{ fontSize: "3rem" }}>🧭</div>
        <h1>Page introuvable</h1>
        <p>La page demandée n&apos;existe pas ou n&apos;est plus accessible.</p>
        <Link href="/" className="btn btn-blue">Retour à l&apos;accueil</Link>
      </div>
    </div>
  );
}
