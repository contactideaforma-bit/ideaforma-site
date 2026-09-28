import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { formatPrix, libelleCategorie } from "@/lib/types";

export default async function FormationsAdmin() {
  const supabase = await createClient();
  const { data } = await supabase
    .from("formations")
    .select("id, titre, icone, categorie, duree_label, prix_ht, publie, ordre, modules(id), inscriptions(id)")
    .order("ordre")
    .order("titre");

  type Row = {
    id: string; titre: string; icone: string | null; categorie: string; duree_label: string | null;
    prix_ht: number | null; publie: boolean; ordre: number; modules: { id: string }[]; inscriptions: { id: string }[];
  };
  const formations = (data ?? []) as unknown as Row[];

  return (
    <>
      <div className="page-title">
        <div>
          <h1>Formations</h1>
          <p>Catalogue affiché sur le site et contenus de la plateforme.</p>
        </div>
        <div className="actions">
          <Link href="/admin/formations/nouvelle" className="btn btn-primary btn-sm">+ Nouvelle formation</Link>
        </div>
      </div>

      <div className="panel">
        {formations.length === 0 ? (
          <div className="empty"><div className="big">📚</div>Aucune formation. Le catalogue par défaut s&apos;affiche sur le site tant que la base est vide.</div>
        ) : (
          <div className="table-wrap">
            <table className="table">
              <thead>
                <tr><th>#</th><th>Formation</th><th>Catégorie</th><th>Durée</th><th>Prix</th><th>Modules</th><th>Inscrits</th><th>Site</th></tr>
              </thead>
              <tbody>
                {formations.map((f) => (
                  <tr key={f.id}>
                    <td className="muted">{f.ordre}</td>
                    <td><Link href={`/admin/formations/${f.id}`} className="row-link">{f.icone} {f.titre}</Link></td>
                    <td>{libelleCategorie(f.categorie)}</td>
                    <td>{f.duree_label ?? "—"}</td>
                    <td>{formatPrix(f.prix_ht)}</td>
                    <td>{f.modules.length}</td>
                    <td>{f.inscriptions.length}</td>
                    <td>{f.publie ? <span className="badge badge-green">Publiée</span> : <span className="badge badge-grey">Masquée</span>}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </>
  );
}
