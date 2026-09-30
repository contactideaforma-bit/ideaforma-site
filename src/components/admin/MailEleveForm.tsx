"use client";

import { useActionState, useMemo, useState } from "react";
import { envoyerMailEleve, type EtatMailEleve } from "@/app/admin/actions";
import { mailPersonnalise, messageBienvenueParDefaut, SUJET_BIENVENUE, type FormationAttribuee } from "@/lib/mail-gabarits";
import Icon from "@/components/Icon";

const MODELES: { id: string; libelle: string; sujet: string; message: (p: { prenom: string | null; formations: FormationAttribuee[] }) => string; identifiants: boolean }[] = [
  {
    id: "bienvenue",
    libelle: "Bienvenue et identifiants",
    sujet: SUJET_BIENVENUE,
    message: messageBienvenueParDefaut,
    identifiants: true,
  },
  {
    id: "relance",
    libelle: "Relance : reprendre la formation",
    sujet: "Votre formation IDEAFORMA vous attend",
    identifiants: false,
    message: ({ prenom, formations }) =>
      `${prenom ? `Bonjour ${prenom},` : "Bonjour,"}\n\nNous avons remarqué que vous n'avez pas repris votre formation${formations[0] ? ` « ${formations[0].titre} »` : ""} depuis quelque temps. C'est normal d'avoir des semaines chargées ; l'essentiel est de reprendre, même trente minutes.\n\nVotre progression est conservée : vous retrouverez la formation exactement là où vous l'aviez laissée.${formations[0]?.date_fin ? ` Pour information, votre accès est ouvert jusqu'au ${formations[0].date_fin.split("-").reverse().join("/")}.` : ""}\n\nSi quelque chose vous bloque (un contenu, une question, un problème technique), répondez à cet e-mail : nous sommes là pour ça.\n\nBonne reprise,\nMyriam Ayouaz\nIDEAFORMA`,
  },
  {
    id: "libre",
    libelle: "Message libre",
    sujet: "",
    identifiants: false,
    message: ({ prenom }) => `${prenom ? `Bonjour ${prenom},` : "Bonjour,"}\n\n\n\nBien cordialement,\nMyriam Ayouaz\nIDEAFORMA`,
  },
];

export default function MailEleveForm({
  eleveId,
  prenom,
  email,
  formations,
  mailConfigure,
  site,
}: {
  eleveId: string;
  prenom: string | null;
  email: string;
  formations: FormationAttribuee[];
  mailConfigure: boolean;
  site: string;
}) {
  const action = envoyerMailEleve.bind(null, eleveId);
  const [etat, formAction, enCours] = useActionState<EtatMailEleve, FormData>(action, {});
  const [modele, setModele] = useState(MODELES[0].id);
  const [sujet, setSujet] = useState(MODELES[0].sujet);
  const [message, setMessage] = useState(MODELES[0].message({ prenom, formations }));
  const [identifiants, setIdentifiants] = useState(true);
  const [apercu, setApercu] = useState(false);

  function choisirModele(id: string) {
    const m = MODELES.find((x) => x.id === id) ?? MODELES[0];
    setModele(id);
    setSujet(m.sujet);
    setMessage(m.message({ prenom, formations }));
    setIdentifiants(m.identifiants);
  }

  const htmlApercu = useMemo(
    () => mailPersonnalise({ sujet: sujet || "(sans objet)", message, email, motDePasse: identifiants ? "Idea-XXXX-XXXX" : null, site }).html,
    [sujet, message, email, identifiants, site]
  );

  return (
    <div>
      {etat.erreur && <div className="alert alert-error"><Icon name="x-circle" size={18} /> <span>{etat.erreur}</span></div>}
      {etat.ok && (
        <div className="alert alert-success">
          <Icon name="check-circle" size={18} />
          <span>
            {etat.message}
            {etat.motDePasse && <> Nouveau mot de passe inclus : <span className="password-box" style={{ fontSize: ".95rem", padding: ".2rem .6rem" }}>{etat.motDePasse}</span></>}
          </span>
        </div>
      )}
      {!mailConfigure && (
        <div className="alert alert-warn"><Icon name="mail" size={18} /> <span>Envoi d&apos;e-mails non configuré (variables SMTP_HOST, SMTP_USER, SMTP_PASS sur Vercel). Le formulaire reste utilisable pour préparer et prévisualiser.</span></div>
      )}

      <form action={formAction}>
        <div className="form-grid">
          <div className="form-group full">
            <label htmlFor="modele">Modèle</label>
            <select id="modele" value={modele} onChange={(e) => choisirModele(e.target.value)}>
              {MODELES.map((m) => <option key={m.id} value={m.id}>{m.libelle}</option>)}
            </select>
          </div>
          <div className="form-group full">
            <label htmlFor="sujet">Objet</label>
            <input id="sujet" name="sujet" value={sujet} onChange={(e) => setSujet(e.target.value)} required maxLength={200} />
          </div>
          <div className="form-group full">
            <label htmlFor="message">Message</label>
            <textarea id="message" name="message" rows={12} value={message} onChange={(e) => setMessage(e.target.value)} required maxLength={6000} />
            <span className="hint">Texte simple : une ligne vide sépare les paragraphes. Le bloc identifiants et le bouton « Accéder à ma formation » sont insérés à l'endroit du repère [identifiants], ou à la fin du message s'il est absent. Mise en page IDEAFORMA automatique.</span>
          </div>
        </div>
        <label className="form-check" style={{ marginTop: ".75rem" }}>
          <input type="checkbox" name="nouveaux_identifiants" checked={identifiants} onChange={(e) => setIdentifiants(e.target.checked)} />
          Inclure des identifiants (génère un nouveau mot de passe, l&apos;ancien cesse de fonctionner)
        </label>
        <div className="actions-row" style={{ marginTop: "1rem" }}>
          <button type="button" className="btn btn-ghost btn-sm" onClick={() => setApercu((v) => !v)}>
            <Icon name="monitor" size={15} /> {apercu ? "Masquer l'aperçu" : "Aperçu de l'e-mail"}
          </button>
          <button
            type="submit"
            className="btn btn-primary btn-sm"
            disabled={enCours || !mailConfigure}
            onClick={(e) => { if (identifiants && !window.confirm(`Envoyer cet e-mail à ${email} avec un nouveau mot de passe ?`)) e.preventDefault(); }}
          >
            <Icon name="mail" size={15} /> {enCours ? "Envoi…" : `Envoyer à ${email}`}
          </button>
        </div>
      </form>

      {apercu && (
        <div style={{ marginTop: "1rem", border: "1.5px solid var(--border)", borderRadius: "var(--radius-sm)", overflow: "hidden", background: "var(--bg)" }}>
          <iframe title="Aperçu de l'e-mail" srcDoc={htmlApercu} sandbox="" style={{ width: "100%", height: 620, border: 0, display: "block", background: "#F6F9FC" }} />
        </div>
      )}
    </div>
  );
}
