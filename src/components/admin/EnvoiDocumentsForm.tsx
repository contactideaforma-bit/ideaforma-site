"use client";

import { useActionState, useEffect, useMemo, useState } from "react";
import { envoyerDocuments, type EtatEnvoiDocuments } from "@/app/admin/actions";
import { mailPersonnalise, messageDocumentsParDefaut, sujetDocumentsParDefaut, type DocumentJoint } from "@/lib/mail-gabarits";
import Icon from "@/components/Icon";

type TypeDoc = "attestation" | "certificat" | "releve";

export type DocumentDisponible = {
  type: TypeDoc;
  libelle: string;
  description: string;
  numero: string | null;
  /** Conseillé dans la situation actuelle de l'élève (ex. attestation quand le parcours est terminé). */
  conseille: boolean;
};

/**
 * Envoi des documents officiels en pièces jointes PDF, depuis la fiche élève.
 * L'objet et le message sont pré-générés selon les pièces cochées ; ils restent modifiables.
 */
export default function EnvoiDocumentsForm({
  inscriptionId, prenom, email, entreprise, formation, pourcentage, evaluationReussie, documents, mailConfigure, site,
}: {
  inscriptionId: string;
  prenom: string | null;
  email: string;
  entreprise: string | null;
  formation: string;
  pourcentage: number;
  evaluationReussie: boolean | null;
  documents: DocumentDisponible[];
  mailConfigure: boolean;
  site: string;
}) {
  const action = envoyerDocuments.bind(null, inscriptionId);
  const [etat, formAction, enCours] = useActionState<EtatEnvoiDocuments, FormData>(action, {});
  const [ouvert, setOuvert] = useState(false);
  const [coches, setCoches] = useState<TypeDoc[]>(documents.filter((d) => d.conseille).map((d) => d.type));
  const [sujet, setSujet] = useState("");
  const [message, setMessage] = useState("");
  const [modifie, setModifie] = useState(false);
  const [apercu, setApercu] = useState(false);

  const joints: DocumentJoint[] = useMemo(
    () => documents.filter((d) => coches.includes(d.type)).map((d) => ({ type: d.type, libelle: d.libelle })),
    [documents, coches]
  );

  // Objet et message régénérés à chaque changement de sélection, tant que l'admin n'a pas modifié le texte.
  useEffect(() => {
    if (modifie) return;
    setSujet(sujetDocumentsParDefaut(joints, formation));
    setMessage(messageDocumentsParDefaut({ prenom, formation, docs: joints, pourcentage, evaluationReussie, entreprise }));
  }, [joints, modifie, prenom, formation, pourcentage, evaluationReussie, entreprise]);

  useEffect(() => { if (etat.ok) setOuvert(false); }, [etat.ok]);

  function basculer(t: TypeDoc) {
    setCoches((c) => (c.includes(t) ? c.filter((x) => x !== t) : [...c, t]));
  }

  const htmlApercu = useMemo(
    () => mailPersonnalise({ sujet: sujet || "(sans objet)", message, email, sansBouton: true, site }).html,
    [sujet, message, email, site]
  );

  return (
    <div className="envoi-docs">
      {etat.erreur && <div className="alert alert-error"><Icon name="x-circle" size={18} /> <span>{etat.erreur}</span></div>}
      {etat.ok && <div className="alert alert-success"><Icon name="check-circle" size={18} /> <span>{etat.message}</span></div>}

      {!ouvert ? (
        <button type="button" className="btn btn-blue btn-sm" onClick={() => setOuvert(true)}>
          <Icon name="mail" size={15} /> Envoyer des documents par e-mail
        </button>
      ) : (
        <form action={formAction} className="callout" style={{ marginTop: ".5rem" }}>
          <div style={{ fontWeight: 600, marginBottom: ".5rem" }}>Documents à joindre (PDF)</div>
          <div className="docs-choix">
            {documents.map((d) => (
              <label key={d.type} className={`docs-choix-item${coches.includes(d.type) ? " coche" : ""}`} title={d.description}>
                <input type="checkbox" name="documents" value={d.type} checked={coches.includes(d.type)} onChange={() => basculer(d.type)} />
                <span>
                  <strong>{d.libelle}</strong>
                  <small>{d.numero ? `Émis · n° ${d.numero}` : "Sera émis et numéroté à l'envoi"}{d.conseille ? " · conseillé" : ""}</small>
                </span>
              </label>
            ))}
          </div>

          <div className="form-grid" style={{ marginTop: ".9rem" }}>
            <div className="form-group full">
              <label htmlFor={`sujet-${inscriptionId}`}>Objet</label>
              <input id={`sujet-${inscriptionId}`} name="sujet" value={sujet} onChange={(e) => { setSujet(e.target.value); setModifie(true); }} required maxLength={200} />
            </div>
            <div className="form-group full">
              <label htmlFor={`message-${inscriptionId}`}>Message</label>
              <textarea id={`message-${inscriptionId}`} name="message" rows={11} value={message} onChange={(e) => { setMessage(e.target.value); setModifie(true); }} required maxLength={6000} />
              <span className="hint">
                Texte pré-rédigé selon les pièces cochées ; modifiez-le librement.
                {modifie && <> <button type="button" className="lien" onClick={() => setModifie(false)}>Régénérer le texte</button></>}
              </span>
            </div>
          </div>
          <label className="form-check" style={{ marginTop: ".6rem" }}>
            <input type="checkbox" name="copie" defaultChecked /> M&apos;envoyer une copie (archivage)
          </label>
          <div className="actions-row" style={{ marginTop: ".9rem" }}>
            <button type="button" className="btn btn-ghost btn-sm" onClick={() => setApercu((v) => !v)}>
              <Icon name="monitor" size={15} /> {apercu ? "Masquer l'aperçu" : "Aperçu"}
            </button>
            <button type="button" className="btn btn-ghost btn-sm" onClick={() => setOuvert(false)}>Annuler</button>
            <button
              type="submit"
              className="btn btn-primary btn-sm"
              disabled={enCours || !mailConfigure || coches.length === 0}
              onClick={(e) => {
                const nonEmis = documents.filter((d) => coches.includes(d.type) && !d.numero);
                const q = nonEmis.length
                  ? `Envoyer ${coches.length} document${coches.length > 1 ? "s" : ""} à ${email} ? ${nonEmis.length} document${nonEmis.length > 1 ? "s seront émis" : " sera émis"} avec un numéro officiel.`
                  : `Envoyer ${coches.length} document${coches.length > 1 ? "s" : ""} à ${email} ?`;
                if (!window.confirm(q)) e.preventDefault();
              }}
            >
              <Icon name="mail" size={15} /> {enCours ? "Génération et envoi…" : `Envoyer à ${email}`}
            </button>
          </div>
          {!mailConfigure && <p className="hint" style={{ marginTop: ".5rem" }}>Envoi désactivé : variables SMTP manquantes sur Vercel.</p>}
          {apercu && (
            <div style={{ marginTop: "1rem", border: "1.5px solid var(--border)", borderRadius: "var(--radius-sm)", overflow: "hidden", background: "var(--bg)" }}>
              <iframe title="Aperçu de l'e-mail" srcDoc={htmlApercu} sandbox="" style={{ width: "100%", height: 560, border: 0, display: "block", background: "#F6F9FC" }} />
            </div>
          )}
        </form>
      )}
    </div>
  );
}
