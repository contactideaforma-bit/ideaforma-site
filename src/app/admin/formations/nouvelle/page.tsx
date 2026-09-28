import Link from "next/link";
import FormationForm from "@/components/admin/FormationForm";
import { creerFormation } from "@/app/admin/actions";

export default function NouvelleFormation() {
  return (
    <>
      <div className="breadcrumb"><Link href="/admin/formations">Formations</Link> / Nouvelle</div>
      <div className="page-title">
        <div>
          <h1>Nouvelle formation</h1>
          <p>Créez la fiche, puis ajoutez les modules et leçons.</p>
        </div>
      </div>
      <FormationForm action={creerFormation} libelleBouton="Créer la formation" />
    </>
  );
}
