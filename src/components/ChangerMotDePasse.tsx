"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";

/** Formulaire de changement de mot de passe (session déjà ouverte). */
export default function ChangerMotDePasse({ redirection }: { redirection?: string }) {
  const router = useRouter();
  const [erreur, setErreur] = useState("");
  const [ok, setOk] = useState(false);
  const [chargement, setChargement] = useState(false);

  async function onSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    setErreur("");
    const form = new FormData(e.currentTarget);
    const p1 = String(form.get("p1") || "");
    const p2 = String(form.get("p2") || "");
    if (p1.length < 8) return setErreur("8 caractères minimum.");
    if (p1 !== p2) return setErreur("Les deux mots de passe ne correspondent pas.");

    setChargement(true);
    const supabase = createClient();
    const { error } = await supabase.auth.updateUser({ password: p1 });
    setChargement(false);
    if (error) return setErreur("Modification impossible : " + error.message);
    setOk(true);
    if (redirection) {
      router.replace(redirection);
      router.refresh();
    }
  }

  return (
    <form onSubmit={onSubmit} style={{ display: "flex", flexDirection: "column", gap: "1rem", maxWidth: 420 }}>
      {erreur && <div className="alert alert-error">{erreur}</div>}
      {ok && !redirection && <div className="alert alert-success">Mot de passe modifié.</div>}
      <div className="form-group">
        <label htmlFor="p1">Nouveau mot de passe</label>
        <input id="p1" name="p1" type="password" required minLength={8} autoComplete="new-password" />
        <span className="hint">8 caractères minimum.</span>
      </div>
      <div className="form-group">
        <label htmlFor="p2">Confirmer le mot de passe</label>
        <input id="p2" name="p2" type="password" required minLength={8} autoComplete="new-password" />
      </div>
      <button type="submit" className="btn btn-blue" disabled={chargement}>
        {chargement ? "Enregistrement…" : "Enregistrer le mot de passe"}
      </button>
    </form>
  );
}
