"use client";

import { useActionState } from "react";
import { CATEGORIES, type Formation } from "@/lib/types";
import type { EtatSimple } from "@/app/admin/actions";

export default function FormationForm({
  action,
  formation,
  libelleBouton = "Enregistrer",
}: {
  action: (prev: EtatSimple, fd: FormData) => Promise<EtatSimple>;
  formation?: Formation;
  libelleBouton?: string;
}) {
  const [etat, formAction, enCours] = useActionState<EtatSimple, FormData>(action, {});
  const f = formation;

  return (
    <form action={formAction} className="panel">
      {etat.erreur && <div className="alert alert-error">{etat.erreur}</div>}
      {etat.ok && etat.message && <div className="alert alert-success">{etat.message}</div>}

      <h2>Fiche catalogue</h2>
      <div className="form-grid">
        <div className="form-group full"><label htmlFor="titre">Titre *</label><input id="titre" name="titre" required defaultValue={f?.titre ?? ""} /></div>
        <div className="form-group full"><label htmlFor="accroche">Accroche (1 à 2 phrases, affichée sur la carte)</label><input id="accroche" name="accroche" defaultValue={f?.accroche ?? ""} /></div>
        <div className="form-group">
          <label htmlFor="categorie">Catégorie</label>
          <select id="categorie" name="categorie" defaultValue={f?.categorie ?? "autre"}>
            {CATEGORIES.map((c) => <option key={c.value} value={c.value}>{c.label}</option>)}
          </select>
        </div>
        <div className="form-group"><label htmlFor="icone">Icône (emoji)</label><input id="icone" name="icone" defaultValue={f?.icone ?? "🎓"} maxLength={8} /></div>
        <div className="form-group"><label htmlFor="duree_heures">Durée (heures)</label><input id="duree_heures" name="duree_heures" type="number" step="0.5" min="0" defaultValue={f?.duree_heures ?? ""} /></div>
        <div className="form-group"><label htmlFor="duree_label">Durée affichée</label><input id="duree_label" name="duree_label" placeholder="2 jours" defaultValue={f?.duree_label ?? ""} /></div>
        <div className="form-group"><label htmlFor="modalite">Modalité</label><input id="modalite" name="modalite" placeholder="En ligne / Intra" defaultValue={f?.modalite ?? ""} /></div>
        <div className="form-group"><label htmlFor="prix_ht">Prix HT (€ / pers.)</label><input id="prix_ht" name="prix_ht" type="number" step="1" min="0" defaultValue={f?.prix_ht ?? ""} /><span className="hint">Vide = « Sur devis »</span></div>
        <div className="form-group full"><label htmlFor="programme">Programme (une ligne par point)</label><textarea id="programme" name="programme" defaultValue={(f?.programme ?? []).join("\n")} /></div>
        <div className="form-group full"><label htmlFor="objectifs">Objectifs pédagogiques (une ligne par objectif)</label><textarea id="objectifs" name="objectifs" defaultValue={(f?.objectifs ?? []).join("\n")} /></div>
        <div className="form-group full"><label htmlFor="description">Description détaillée</label><textarea id="description" name="description" defaultValue={f?.description ?? ""} /></div>
        <div className="form-group"><label htmlFor="public_vise">Public visé</label><input id="public_vise" name="public_vise" defaultValue={f?.public_vise ?? ""} /></div>
        <div className="form-group"><label htmlFor="prerequis">Prérequis</label><input id="prerequis" name="prerequis" defaultValue={f?.prerequis ?? ""} /></div>
        <div className="form-group"><label htmlFor="ordre">Ordre d&apos;affichage</label><input id="ordre" name="ordre" type="number" defaultValue={f?.ordre ?? 0} /></div>
        <div className="form-group" style={{ justifyContent: "flex-end" }}>
          <label className="form-check"><input type="checkbox" name="publie" defaultChecked={f?.publie ?? false} /> Visible sur le site public</label>
        </div>
      </div>
      <div className="form-footer">
        <span className="form-notice">Les modules et leçons se gèrent après création, sur la fiche de la formation.</span>
        <button type="submit" className="btn btn-primary" disabled={enCours}>{enCours ? "Enregistrement…" : libelleBouton}</button>
      </div>
    </form>
  );
}
