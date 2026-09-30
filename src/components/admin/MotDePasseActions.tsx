"use client";

import { useState, useTransition } from "react";
import { regenererMotDePasse, type EtatSimple } from "@/app/admin/actions";
import Icon from "@/components/Icon";

export default function MotDePasseActions({ eleveId, mailConfigure }: { eleveId: string; mailConfigure: boolean }) {
  const [etat, setEtat] = useState<EtatSimple>({});
  const [enCours, startTransition] = useTransition();

  function lancer(envoyer: boolean) {
    const question = envoyer
      ? "Générer un nouveau mot de passe et l'envoyer par e-mail à l'élève ?"
      : "Générer un nouveau mot de passe (affiché ici, à transmettre vous-même) ?";
    if (!window.confirm(question)) return;
    startTransition(async () => {
      setEtat(await regenererMotDePasse(eleveId, envoyer));
    });
  }

  return (
    <div>
      {etat.erreur && <div className="alert alert-error">{etat.erreur}</div>}
      {etat.ok && (
        <div className="alert alert-success">
          {etat.message}
          {etat.motDePasse && (
            <div style={{ marginTop: ".5rem" }}>
              <span className="password-box">{etat.motDePasse}</span>
            </div>
          )}
        </div>
      )}
      <div className="actions-row">
        <button type="button" className="btn btn-blue btn-sm" disabled={enCours || !mailConfigure} onClick={() => lancer(true)} title={mailConfigure ? "" : "Configurer SMTP_HOST, SMTP_USER et SMTP_PASS pour activer l'envoi"}>
          <Icon name="mail" size={15} /> Renvoyer des identifiants par e-mail
        </button>
        <button type="button" className="btn btn-ghost btn-sm" disabled={enCours} onClick={() => lancer(false)}>
          <Icon name="key" size={15} /> Nouveau mot de passe (afficher)
        </button>
      </div>
    </div>
  );
}
