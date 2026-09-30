"use client";

import Link from "next/link";
import { useActionState, useEffect, useState } from "react";
import { messageBienvenueParDefaut } from "@/lib/mail-gabarits";
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
  const [envoyer, setEnvoyer] = useState(mailConfigure);
  const [prenom, setPrenom] = useState("");
  const [formationId, setFormationId] = useState("");
  const [dateFin, setDateFin] = useState("");
  const [message, setMessage] = useState(() => messageBienvenueParDefaut({ prenom: null, formations: [] }));
  const [messageModifie, setMessageModifie] = useState(false);
  // Tant que l'admin n'a pas touché au texte, il suit le prénom et la formation saisis.
  useEffect(() => {
    if (messageModifie) return;
    const f = formations.find((x) => x.id === formationId);
    setMessage(messageBienvenueParDefaut({ prenom: prenom.trim() || null, formations: f ? [{ titre: f.titre, date_fin: dateFin || null }] : [] }));
  }, [prenom, formationId, dateFin, messageModifie, formations]);

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
          Envoi d&apos;e-mails non configuré (variables SMTP sur Vercel) : le mot de passe sera affiché à l&apos;écran pour transmission manuelle.
        </div>
      )}
      <h2>Identité</h2>
      <div className="form-grid">
        <div className="form-group"><label htmlFor="prenom">Prénom</label><input id="prenom" name="prenom" autoComplete="off" value={prenom} onChange={(e) => setPrenom(e.target.value)} /></div>
        <div className="form-group"><label htmlFor="nom">Nom *</label><input id="nom" name="nom" required autoComplete="off" /></div>
        <div className="form-group"><label htmlFor="email">E-mail (identifiant) *</label><input id="email" name="email" type="email" required autoComplete="off" /></div>
        <div className="form-group"><label htmlFor="telephone">Téléphone</label><input id="telephone" name="telephone" type="tel" autoComplete="off" /></div>
        <div className="form-group full"><label htmlFor="entreprise">Entreprise</label><input id="entreprise" name="entreprise" autoComplete="off" /></div>
      </div>

      <h2 style={{ marginTop: "1.5rem" }}>Première formation (facultatif)</h2>
      <div className="form-grid">
        <div className="form-group full">
          <label htmlFor="formation_id">Formation</label>
          <select id="formation_id" name="formation_id" value={formationId} onChange={(e) => setFormationId(e.target.value)}>
            <option value="">— Attribuer plus tard —</option>
            {formations.map((f) => (
              <option key={f.id} value={f.id}>{f.titre}</option>
            ))}
          </select>
        </div>
        <div className="form-group"><label htmlFor="date_debut">Début d&apos;accès</label><input id="date_debut" name="date_debut" type="date" defaultValue={aujourdhui} /></div>
        <div className="form-group">
          <label htmlFor="date_fin">Fin d&apos;accès</label>
          <input id="date_fin" name="date_fin" type="date" value={dateFin} onChange={(e) => setDateFin(e.target.value)} />
          <span className="hint">Vide = accès sans limite de temps.</span>
        </div>
      </div>

      <h2 style={{ marginTop: "1.5rem" }}>E-mail de bienvenue</h2>
      <label className="form-check">
        <input type="checkbox" name="envoyer_mail" checked={envoyer} onChange={(e) => setEnvoyer(e.target.checked)} />
        Envoyer l&apos;e-mail de bienvenue avec l&apos;identifiant et le mot de passe
      </label>
      {envoyer && (
        <div className="form-group full" style={{ marginTop: ".75rem" }}>
          <label htmlFor="message">Message (modifiable)</label>
          <textarea id="message" name="message" rows={10} value={message} onChange={(e) => { setMessage(e.target.value); setMessageModifie(true); }} maxLength={4000} />
          <span className="hint">
            Le bloc identifiants et le bouton « Accéder à ma formation » sont insérés à l'endroit du repère [identifiants] ; mise en page IDEAFORMA automatique.
            Le prénom et la formation choisis ci-dessus sont repris dans le texte proposé ; vous pouvez le modifier librement.
          </span>
        </div>
      )}

      <div className="form-footer">
        <span className="form-notice">Le mot de passe est généré automatiquement et affiché une seule fois après création.</span>
        <button type="submit" className="btn btn-primary" disabled={enCours}>
          {enCours ? "Création…" : "Créer le compte"}
        </button>
      </div>
    </form>
  );
}
