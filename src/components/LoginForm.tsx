"use client";

import { useState } from "react";
import { journaliserConnexion } from "@/app/espace/actions";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";

export default function LoginForm({ suivant }: { suivant?: string }) {
  const router = useRouter();
  const [erreur, setErreur] = useState("");
  const [chargement, setChargement] = useState(false);

  async function onSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    setErreur("");
    setChargement(true);
    const form = new FormData(e.currentTarget);
    const email = String(form.get("email") || "").trim().toLowerCase();
    const password = String(form.get("password") || "");

    const supabase = createClient();
    const { data, error } = await supabase.auth.signInWithPassword({ email, password });
    if (error || !data.user) {
      setErreur("Identifiant ou mot de passe incorrect.");
      setChargement(false);
      return;
    }

    const { data: profile } = await supabase
      .from("profiles")
      .select("role, actif")
      .eq("id", data.user.id)
      .maybeSingle();

    if (profile && !profile.actif && profile.role !== "admin") {
      await supabase.auth.signOut();
      setErreur("Votre compte est désactivé. Contactez IDEAFORMA.");
      setChargement(false);
      return;
    }

    const roleJeton = (data.user.app_metadata as { role?: string } | undefined)?.role;
    const role = profile?.role ?? roleJeton;
    const destination =
      suivant && suivant.startsWith("/") ? suivant : role === "admin" ? "/admin" : "/espace";
    if (role !== "admin") journaliserConnexion().catch(() => null);
    router.replace(destination);
    router.refresh();
  }

  return (
    <form onSubmit={onSubmit}>
      {erreur && <div className="alert alert-error">{erreur}</div>}
      <div className="form-group">
        <label htmlFor="email">Identifiant (e-mail)</label>
        <input id="email" name="email" type="email" required autoComplete="username" autoFocus />
      </div>
      <div className="form-group">
        <label htmlFor="password">Mot de passe</label>
        <input id="password" name="password" type="password" required autoComplete="current-password" />
      </div>
      <button type="submit" className="btn btn-primary" disabled={chargement}>
        {chargement ? "Connexion…" : "Se connecter"}
      </button>
    </form>
  );
}
