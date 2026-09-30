import Link from "next/link";
import Icon from "@/components/Icon";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/types";

export default async function ElevesPage({
  searchParams,
}: {
  searchParams: Promise<{ q?: string; filtre?: string }>;
}) {
  const { q, filtre } = await searchParams;
  const supabase = await createClient();

  let query = supabase
    .from("profiles")
    .select("id, prenom, nom, email, entreprise, actif, created_at, inscriptions!eleve_id(id, statut, formations:formation_id(titre))")
    .eq("role", "eleve")
    .order("created_at", { ascending: false });
  if (filtre === "actifs") query = query.eq("actif", true);
  if (filtre === "inactifs") query = query.eq("actif", false);
  if (q) query = query.or(`nom.ilike.%${q}%,prenom.ilike.%${q}%,email.ilike.%${q}%,entreprise.ilike.%${q}%`);

  const { data, error } = await query;
  if (error) console.error("[admin/eleves] requête impossible :", error.message);
  type Row = {
    id: string; prenom: string | null; nom: string | null; email: string; entreprise: string | null;
    actif: boolean; created_at: string;
    inscriptions: { id: string; statut: string; formations: { titre: string } | null }[];
  };
  const eleves = (data ?? []) as unknown as Row[];

  return (
    <>
      <div className="page-title">
        <div>
          <h1>Élèves</h1>
          <p>{eleves.length} compte{eleves.length > 1 ? "s" : ""}</p>
        </div>
        <div className="actions">
          <Link href="/admin/eleves/nouveau" className="btn btn-primary btn-sm">+ Nouvel élève</Link>
        </div>
      </div>

      <div className="panel">
        <form className="inline-form" method="get" style={{ marginBottom: "1rem" }}>
          <input name="q" placeholder="Rechercher (nom, e-mail, entreprise)" defaultValue={q ?? ""} style={{ minWidth: 260 }} />
          <select name="filtre" defaultValue={filtre ?? ""}>
            <option value="">Tous</option>
            <option value="actifs">Actifs</option>
            <option value="inactifs">Désactivés</option>
          </select>
          <button className="btn btn-ghost btn-sm" type="submit">Filtrer</button>
        </form>

        {eleves.length === 0 ? (
          <div className="empty"><div className="big"><Icon name="graduation" size={26} /></div>Aucun élève trouvé.</div>
        ) : (
          <div className="table-wrap">
            <table className="table">
              <thead>
                <tr><th>Élève</th><th>Entreprise</th><th>Formations</th><th>Statut</th><th>Créé le</th></tr>
              </thead>
              <tbody>
                {eleves.map((e) => (
                  <tr key={e.id}>
                    <td>
                      <Link href={`/admin/eleves/${e.id}`} className="row-link">
                        {[e.prenom, e.nom].filter(Boolean).join(" ") || e.email}
                      </Link>
                      <div className="muted">{e.email}</div>
                    </td>
                    <td>{e.entreprise ?? <span className="muted">—</span>}</td>
                    <td>
                      {e.inscriptions.length === 0 ? (
                        <span className="muted">Aucune</span>
                      ) : (
                        e.inscriptions.map((i) => (
                          <span key={i.id} className={`badge ${i.statut === "active" ? "badge-blue" : "badge-grey"}`} style={{ marginRight: 4, marginBottom: 4 }}>
                            {i.formations?.titre ?? "?"}
                          </span>
                        ))
                      )}
                    </td>
                    <td>{e.actif ? <span className="badge badge-green">Actif</span> : <span className="badge badge-grey">Désactivé</span>}</td>
                    <td className="muted">{formatDate(e.created_at)}</td>
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
