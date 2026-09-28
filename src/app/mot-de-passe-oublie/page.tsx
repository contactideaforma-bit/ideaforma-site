"use client";

import Link from "next/link";
import { useState } from "react";
import { createClient } from "@/lib/supabase/client";

export default function MotDePasseOublie() {
  const [etat, setEtat] = useState<"idle" | "envoi" | "ok">("idle");
  const [erreur, setErreur] = useState("");

  async function onSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    setErreur("");
    setEtat("envoi");
    const email = String(new FormData(e.currentTarget).get("email") || "").trim().toLowerCase();
    const supabase = createClient();
    const { error } = await supabase.auth.resetPasswordForEmail(email, {
      redirectTo: `${window.location.origin}/auth/callback?next=/reinitialiser`,
    });
    if (error) {
      setErreur("Envoi impossible. Vérifiez l'adresse ou réessayez plus tard.");
      setEtat("idle");
      return;
    }
    setEtat("ok");
  }

  return (
    <div className="auth-page">
      <div className="auth-card">
        {/* eslint-disable-next-line @next/next/no-img-element */}
        <img src="/images/logo-ideaforma.png" alt="IDEAFORMA" className="auth-logo" />
        <h1>Mot de passe oublié</h1>
        <p>Indiquez votre e-mail : vous recevrez un lien pour choisir un nouveau mot de passe.</p>
        {etat === "ok" ? (
          <div className="alert alert-success">
            Si un compte existe pour cette adresse, un e-mail vient de partir. Pensez à vérifier vos indésirables.
          </div>
        ) : (
          <form onSubmit={onSubmit}>
            {erreur && <div className="alert alert-error">{erreur}</div>}
            <div className="form-group">
              <label htmlFor="email">E-mail</label>
              <input id="email" name="email" type="email" required autoComplete="email" autoFocus />
            </div>
            <button type="submit" className="btn btn-primary" disabled={etat === "envoi"}>
              {etat === "envoi" ? "Envoi…" : "Recevoir le lien"}
            </button>
          </form>
        )}
        <div className="auth-links">
          <Link href="/connexion">← Retour à la connexion</Link>
        </div>
      </div>
    </div>
  );
}
