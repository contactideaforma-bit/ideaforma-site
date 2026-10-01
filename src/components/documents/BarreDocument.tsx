"use client";

import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { emettreDocument } from "@/app/admin/actions";
import Icon from "@/components/Icon";

/** Barre d'actions (non imprimée) au-dessus d'un document officiel : émettre, imprimer, retour. */
export default function BarreDocument({
  inscriptionId, type, eleveId, numero, donnees, libelle,
}: {
  inscriptionId: string;
  type: "attestation" | "certificat" | "releve";
  eleveId: string;
  numero: string | null;
  donnees: Record<string, unknown>;
  libelle: string;
}) {
  const router = useRouter();
  const [erreur, setErreur] = useState("");
  const [enCours, startTransition] = useTransition();

  function emettre() {
    if (!window.confirm(`Émettre ${libelle.toLowerCase()} avec un numéro officiel ? Les données affichées seront figées dans le registre.`)) return;
    startTransition(async () => {
      const r = await emettreDocument(inscriptionId, type, donnees);
      if (!r.ok) { setErreur(r.erreur ?? "Erreur"); return; }
      router.refresh();
    });
  }

  return (
    <div className="doc-barre no-print">
      <div>
        <Link href={`/admin/eleves/${eleveId}`} className="btn btn-ghost btn-sm"><Icon name="arrow-left" size={15} /> Fiche élève</Link>
      </div>
      <div className="doc-barre-etat">
        {numero ? (
          <span className="badge badge-green">Émis · n° {numero}</span>
        ) : (
          <span className="badge badge-orange">Brouillon — non émis</span>
        )}
        {erreur && <span className="muted" style={{ color: "#a33" }}>{erreur}</span>}
      </div>
      <div className="actions-row">
        {!numero && (
          <button type="button" className="btn btn-blue btn-sm" onClick={emettre} disabled={enCours}>
            <Icon name="check-circle" size={15} /> {enCours ? "Émission…" : "Émettre (numéro officiel)"}
          </button>
        )}
        {numero && (
          <button type="button" className="btn btn-ghost btn-sm" onClick={emettre} disabled={enCours} title="Crée une nouvelle version numérotée avec les données actuelles">
            <Icon name="refresh" size={15} /> Rééditer
          </button>
        )}
        <a href={`/documents/${inscriptionId}/${type}/pdf`} target="_blank" rel="noopener" className="btn btn-primary btn-sm" title="Le même PDF que celui joint aux e-mails">
          <Icon name="file" size={15} /> PDF
        </a>
        <button type="button" className="btn btn-ghost btn-sm" onClick={() => window.print()}>
          Imprimer
        </button>
      </div>
    </div>
  );
}
