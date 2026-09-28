import { blocsTexte } from "@/lib/contenu";

/** Rendu d'un texte enrichi léger (titres, paragraphes, puces, tableaux). */
export default function TexteCours({ texte, className = "cours" }: { texte: string; className?: string }) {
  return (
    <div className={className}>
      {blocsTexte(texte).map((b, i) => {
        if (b.type === "h1") return <h2 key={i}>{b.contenu}</h2>;
        if (b.type === "h2") return <h3 key={i}>{b.contenu}</h3>;
        if (b.type === "ul") return <ul key={i}>{b.contenu.map((li, k) => <li key={k}>{li}</li>)}</ul>;
        if (b.type === "table") {
          const [tete, ...lignes] = b.contenu;
          return (
            <div key={i} className="table-wrap">
              <table className="table cours-table">
                <thead><tr>{tete.map((c, k) => <th key={k}>{c}</th>)}</tr></thead>
                <tbody>{lignes.map((l, r) => <tr key={r}>{l.map((c, k) => <td key={k}>{c}</td>)}</tr>)}</tbody>
              </table>
            </div>
          );
        }
        return <p key={i}>{b.contenu}</p>;
      })}
    </div>
  );
}
