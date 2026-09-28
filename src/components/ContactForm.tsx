"use client";

import { useState } from "react";

const FORMATIONS_OPTIONS = [
  "Management & Leadership",
  "Communication Professionnelle",
  "Prise de Parole en Public",
  "Gestes & Postures / TMS",
  "Sécurité & Prévention",
  "Excel Avancé",
  "Gestion de Projet",
  "Recrutement & Intégration",
  "Gestion du Stress & QVT",
  "Formation sur-mesure",
  "Autre / Ne sait pas encore",
];

export default function ContactForm({ formationInitiale }: { formationInitiale?: string }) {
  const [etat, setEtat] = useState<"idle" | "envoi" | "ok" | "erreur">("idle");
  const [erreur, setErreur] = useState("");

  async function onSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    setEtat("envoi");
    setErreur("");
    const data = Object.fromEntries(new FormData(e.currentTarget).entries());
    try {
      const res = await fetch("/api/contact", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data),
      });
      const json = await res.json().catch(() => ({}));
      if (!res.ok) throw new Error(json.erreur || "Envoi impossible pour le moment.");
      setEtat("ok");
    } catch (err) {
      setErreur(err instanceof Error ? err.message : "Envoi impossible pour le moment.");
      setEtat("erreur");
    }
  }

  if (etat === "ok") {
    return (
      <div className="form-card">
        <div className="form-success">
          <div className="success-icon">✅</div>
          <h3>Merci, votre demande est bien envoyée !</h3>
          <p>Nous revenons vers vous sous 24h ouvrées.</p>
        </div>
      </div>
    );
  }

  const initiale = FORMATIONS_OPTIONS.includes(formationInitiale ?? "")
    ? formationInitiale
    : formationInitiale
      ? "Autre / Ne sait pas encore"
      : "";

  return (
    <div className="form-card">
      <h3>📝 Demande de devis / renseignements</h3>
      {etat === "erreur" && <div className="alert alert-error">{erreur}</div>}
      <form onSubmit={onSubmit}>
        <div className="form-grid">
          <div className="form-group">
            <label htmlFor="prenom">Prénom *</label>
            <input id="prenom" name="prenom" required autoComplete="given-name" />
          </div>
          <div className="form-group">
            <label htmlFor="nom">Nom *</label>
            <input id="nom" name="nom" required autoComplete="family-name" />
          </div>
          <div className="form-group">
            <label htmlFor="email">E-mail professionnel *</label>
            <input id="email" name="email" type="email" required autoComplete="email" />
          </div>
          <div className="form-group">
            <label htmlFor="telephone">Téléphone</label>
            <input id="telephone" name="telephone" type="tel" autoComplete="tel" />
          </div>
          <div className="form-group">
            <label htmlFor="entreprise">Entreprise</label>
            <input id="entreprise" name="entreprise" autoComplete="organization" />
          </div>
          <div className="form-group">
            <label htmlFor="fonction">Fonction</label>
            <input id="fonction" name="fonction" placeholder="Responsable RH, dirigeant…" />
          </div>
          <div className="form-group">
            <label htmlFor="formation">Formation souhaitée</label>
            <select id="formation" name="formation" defaultValue={initiale}>
              <option value="">— Choisir une formation —</option>
              {FORMATIONS_OPTIONS.map((o) => (
                <option key={o} value={o}>{o}</option>
              ))}
            </select>
          </div>
          <div className="form-group">
            <label htmlFor="participants">Nombre de participants</label>
            <select id="participants" name="participants" defaultValue="">
              <option value="">— Sélectionner —</option>
              <option value="1 personne">1 personne (formation individuelle)</option>
              <option value="2 à 5">2 à 5 personnes</option>
              <option value="6 à 10">6 à 10 personnes</option>
              <option value="11 à 20">11 à 20 personnes</option>
              <option value="Plus de 20">Plus de 20 personnes</option>
            </select>
          </div>
          <div className="form-group full">
            <label htmlFor="message">Votre projet *</label>
            <textarea
              id="message"
              name="message"
              required
              placeholder="Décrivez votre projet, vos besoins, vos contraintes de dates ou toute information utile…"
            />
          </div>
          {/* Piège à robots : champ invisible qui doit rester vide */}
          <input type="text" name="site_web" tabIndex={-1} autoComplete="off" style={{ display: "none" }} aria-hidden="true" />
        </div>
        <div className="form-footer">
          <span className="form-notice">* Champs obligatoires. Vos données ne sont utilisées que pour traiter votre demande.</span>
          <button type="submit" className="btn btn-primary" disabled={etat === "envoi"}>
            {etat === "envoi" ? "Envoi…" : "Envoyer ma demande"}
          </button>
        </div>
      </form>
    </div>
  );
}
