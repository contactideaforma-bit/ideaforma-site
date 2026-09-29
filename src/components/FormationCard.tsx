import Link from "next/link";
import Icon from "@/components/Icon";
import type { Formation } from "@/lib/types";
import { formatPrix, iconeCategorie, libelleCategorie } from "@/lib/types";

export default function FormationCard({ formation, detail = false }: { formation: Formation; detail?: boolean }) {
  const f = formation;
  return (
    <article className="card card-hover formation-card">
      <div className="card-top">
        <div className="icon-box">
          <Icon name={iconeCategorie(f.categorie)} size={24} />
        </div>
        <span className="card-tag grey">{libelleCategorie(f.categorie)}</span>
      </div>
      <h3>{f.titre}</h3>
      <div className="card-meta">
        {f.duree_label && <span className="card-tag"><Icon name="clock" /> {f.duree_label}</span>}
        {f.modalite && <span className="card-tag orange"><Icon name="monitor" /> {f.modalite}</span>}
      </div>
      <p>{f.accroche}</p>
      {detail && f.programme.length > 0 && (
        <ul className="detail-list">
          {f.programme.map((p) => (
            <li key={p}><Icon name="check" size={15} />{p}</li>
          ))}
        </ul>
      )}
      <div className="card-footer">
        <span className="price">
          {formatPrix(f.prix_ht)}
          {f.prix_ht !== null && <small> / pers.</small>}
        </span>
        <Link href={`/contact?formation=${encodeURIComponent(f.titre)}`} className="btn btn-blue btn-sm">
          {detail ? "Demander un devis" : "Découvrir"} <Icon name="arrow-right" size={15} className="arrow" />
        </Link>
      </div>
    </article>
  );
}
