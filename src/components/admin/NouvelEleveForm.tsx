"use client";

import Link from "next/link";
import { useActionState } from "react";
import { creerEleve, type EtatCreationEleve } from "@/app/admin/actions";
import Icon from "@/components/Icon";

export default function NouvelEleveForm({
  formations,
  mailConfigure,
}: {
  formations: { id: string; titre: string }[];
  mailConfigure: boolean;
}) {
  const [etat, action, enCours] = useActionState<EtatCreationEleve, FormData>(creerEleve, {});
  const aujourdhui = new Date().toISOString().slice(0, 10);

  if (etat.ok) {
    return (
      <div className="panel">
        <div className="alert alert-success"><Icon name="check-circle" size={18} /> Compte créé pour <strong>{etat.email}</strong>.</div>
        {etat.mailEnvoye ? (
          <p style={{ marginBottom: "1rem" }}>L&apos;e-mail de bienvenue avec les identifiants a été envoyé.</p>
        ) : (
          <div className="alert alert-warn">
            L&apos;e-mail de bienvenue n&apos;a pas été envoyé{etat.raisonMail ? ` (${etat.raisonMail})` : ""}.
            Transmettez les identifiants ci-dessous à l&apos;élève par le moyen de votre choix.
          </div>
        )}
        <div className="callout" style={{ marginBottom: "1.25rem" }}>
          <div style={{ fontSize: ".8rem", color: "var(--text-muted)" }}>Identifiant</div>
          <div style={{ fontWeight: 600, marginBottom: ".6rem" }}>{etat.email}</div>
          <div style={{ fontSize: ".8rem", color: "var(--text-muted)" }}>Mot de passe (affiché une seule fois)</div>
          <div className="password-box">{etat.motDePasse}</div>
        </div>
        <div className="actions-row">
          <Link href={`/admin/eleves/${etat.eleveId}`} className="btn btn-blue btn-sm">Voir la fiche élève</Link>
          <Link href="/admin/eleves/nouveau" className="btn btn-ghost btn-sm">Créer un autre élève</Link>
        </div>
      </div>
    );
  }

  return (
    <form action={action} className="panel">
      {etat.erreur && <div className="alert alert-error">{etat.erreur}</div>}
      {!mailConfigure && (
        <div className="alert alert-info">
          Envoi d&apos;e-mails non configuré (RESEND_API_KEY absente) : le mot de passe sera affiché à l&apos;écran pour transmission manuelle.
        </div>
      )}
      <h2>Identité</h2>
      <div className="form-grid">
        <div className="form-group"><label htmlFor="prenom">Prénom</label><input id="prenom" name="prenom" autoComplete="off" /></div>
        <div className="form-group"><label htmlFor="nom">Nom *</label><input id="nom" name="nom" required autoComplete="off" /></div>
        <div className="form-group"><label htmlFor="email">E-mail (identifiant) *</label><input id="email" name="email" type="email" required autoComplete="off" /></div>
        <div className="form-group"><label htmlFor="telephone">Téléphone</label><input id="telephone" name="telephone" type="tel" autoComplete="off" /></div>
        <div className="form-group full"><label htmlFor="entreprise">Entreprise</label><input id="entreprise" name="entreprise" autoComplete="off" /></div>
      </div>

      <h2 style={{ marginTop: "1.5rem" }}>Première formation (facultatif)</h2>
      <div className="form-grid">
        <div className="form-group full">
          <label htmlFor="formation_id">Formation</label>
          <select id="formation_id" name="formation_id" defaultValue="">
            <option value="">— Attribuer plus tard —</option>
            {formations.map((f) => (
              <option key={f.id} value={f.id}>{f.titre}</option>
            ))}
          </select>
        </div>
        <div className="form-group"><label htmlFor="date_debut">Début d&apos;accès</label><input id="date_debut" name="date_debut" type="date" defaultValue={aujourdhui} /></div>
        <div className="form-group">
          <label htmlFor="date_fin">Fin d&apos;accès</label>
          <input id="date_fin" name="date_fin" type="date" />
          <span className="hint">Vide = accès sans limite de temps.</span>
        </div>
      </div>

      <div style={{ marginTop: "1.5rem" }}>
        <label className="form-check">
          <input type="checkbox" name="envoyer_mail" defaultChecked={mailConfigure} />
          Envoyer l&apos;e-mail de bienvenue avec l&apos;identifiant et le mot de passe
        </label>
      </div>

      <div className="form-footer">
        <span className="form-notice">Le mot de passe est généré automatiquement et affiché une seule fois après création.</span>
        <button type="submit" className="btn btn-primary" disabled={enCours}>
          {enCours ? "Création…" : "Créer le compte"}
        </button>
      </div>
    </form>
  );
}
