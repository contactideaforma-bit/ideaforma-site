import Link from "next/link";
import type { Formation } from "@/lib/types";
import { formatPrix } from "@/lib/types";

export default function FormationCard({ formation, detail = false }: { formation: Formation; detail?: boolean }) {
  const f = formation;
  return (
    <article className="card card-hover formation-card">
      <div className="card-icon">{f.icone || "🎓"}</div>
      <h3>{f.titre}</h3>
      <div className="card-meta">
        {f.duree_label && <span className="card-tag">⏱ {f.duree_label}</span>}
        {f.modalite && <span className="card-tag orange">{f.modalite}</span>}
      </div>
      <p>{f.accroche}</p>
      {detail && f.programme.length > 0 && (
        <ul className="detail-list">
          {f.programme.map((p) => (
            <li key={p}>{p}</li>
          ))}
        </ul>
      )}
      <div className="card-footer">
        <span className="price">
          {formatPrix(f.prix_ht)}
          {f.prix_ht !== null && <span style={{ fontSize: ".75rem", fontWeight: 500 }}> / pers.</span>}
        </span>
        <Link href={`/contact?formation=${encodeURIComponent(f.titre)}`} className="btn btn-blue btn-sm">
          {detail ? "Demander un devis" : "En savoir +"}
        </Link>
      </div>
    </article>
  );
}
