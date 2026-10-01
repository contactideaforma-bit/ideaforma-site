import { notFound } from "next/navigation";
import { requireAdmin } from "@/lib/auth";
import { ORGANISME } from "@/lib/organisme";
import { chargerDossier, donneesFigees, TYPES_DOCUMENT, formatDateLongue, type TypeDocument, type DossierInscription } from "@/lib/documents";
import { construireDocument, segments, type Bloc, type ModeleDocument } from "@/lib/documents-modele";
import BarreDocument from "@/components/documents/BarreDocument";

const TYPES: TypeDocument[] = ["attestation", "certificat", "releve"];

export default async function PageDocument({ params }: { params: Promise<{ inscriptionId: string; type: string }> }) {
  await requireAdmin();
  const { inscriptionId, type } = await params;
  if (!TYPES.includes(type as TypeDocument)) notFound();
  const t = type as TypeDocument;
  const dossier = await chargerDossier(inscriptionId);
  if (!dossier) notFound();
  const d = dossier as DossierInscription;

  const libelle = TYPES_DOCUMENT.find((x) => x.type === t)!.libelle;
  const emis = d.documents.find((x) => x.type === t) ?? null;
  const dateDoc = emis ? emis.emis_le : new Date().toISOString();
  const numero = emis?.numero ?? null;
  const doc = construireDocument(d, t, numero, dateDoc);

  const donnees = donneesFigees(d);

  return (
    <>
      <BarreDocument inscriptionId={inscriptionId} type={t} eleveId={d.eleve.id} numero={numero} donnees={donnees} libelle={libelle} />
      <article className="doc-feuille">
        <header className="doc-entete">
          <div className="doc-logo">IDEA<span>FORMA</span></div>
          <div className="doc-coord">
            {doc.entete.coordonnees.map((l, i) => <span key={i}>{l}<br /></span>)}
            {numero && <strong>Document n° {numero}</strong>}
          </div>
        </header>
        <h1 className="doc-titre">{doc.titre}</h1>
        <p className="doc-ref">{doc.reference}</p>
        {doc.blocs.map((b, i) => <RenduBloc key={i} bloc={b} doc={doc} />)}
        <footer className="doc-pied">
          <p>{doc.pied}</p>
          {!numero && <p className="doc-filigrane-note no-print">Brouillon : ce document n&apos;a pas encore de numéro officiel. Cliquez sur « Émettre » avant de l&apos;imprimer ou de l&apos;envoyer.</p>}
        </footer>
      </article>
    </>
  );
}

function Riche({ texte }: { texte: string }) {
  return <>{segments(texte).map((s, i) => (s.gras ? <strong key={i}>{s.texte}</strong> : <span key={i}>{s.texte}</span>))}</>;
}

function RenduBloc({ bloc, doc }: { bloc: Bloc; doc: ModeleDocument }) {
  switch (bloc.type) {
    case "p": return <p><Riche texte={bloc.texte} /></p>;
    case "h2": return <h2>{bloc.texte}</h2>;
    case "note": return <p className="doc-note"><Riche texte={bloc.texte} /></p>;
    case "liste": return <ul>{bloc.items.map((it, i) => <li key={i}><Riche texte={it} /></li>)}</ul>;
    case "identite":
      return (
        <div className="doc-encadre">
          <table className="doc-tab-id"><tbody>
            {bloc.lignes.map((l, i) => <tr key={i}><th>{l.label}</th><td><Riche texte={l.valeur} /></td></tr>)}
          </tbody></table>
        </div>
      );
    case "table":
      return (
        <table className={`doc-tab${bloc.petit ? " doc-tab-journal" : ""}`}>
          {bloc.entetes && <thead><tr>{bloc.entetes.map((e, i) => <th key={i}>{e}</th>)}</tr></thead>}
          <tbody>{bloc.lignes.map((l, i) => <tr key={i}>{l.map((c, j) => <td key={j}><Riche texte={c} /></td>)}</tr>)}</tbody>
        </table>
      );
    case "signature":
      return (
        <div className="doc-signature">
          <p>Fait à {ORGANISME.ville}, le {formatDateLongue(doc.dateDoc)}</p>
          <p>{ORGANISME.signataire.nom}, {ORGANISME.signataire.qualite}</p>
          <div className="doc-cachet">Signature et cachet</div>
        </div>
      );
  }
}
