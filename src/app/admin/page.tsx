import Link from "next/link";
import Icon from "@/components/Icon";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/types";

export default async function AdminDashboard() {
  const supabase = await createClient();

  const [eleves, elevesActifs, formations, inscriptions, demandes, dernieresInscriptions, derniersEleves] =
    await Promise.all([
      supabase.from("profiles").select("id", { count: "exact", head: true }).eq("role", "eleve"),
      supabase.from("profiles").select("id", { count: "exact", head: true }).eq("role", "eleve").eq("actif", true),
      supabase.from("formations").select("id", { count: "exact", head: true }),
      supabase.from("inscriptions").select("id", { count: "exact", head: true }).eq("statut", "active"),
      supabase.from("demandes_contact").select("id", { count: "exact", head: true }).eq("traitee", false),
      supabase
        .from("inscriptions")
        .select("id, date_debut, date_fin, statut, profiles:eleve_id(id, prenom, nom, email), formations:formation_id(id, titre)")
        .order("created_at", { ascending: false })
        .limit(8),
      supabase.from("profiles").select("id, prenom, nom, email, actif, created_at").eq("role", "eleve")
        .order("created_at", { ascending: false }).limit(6),
    ]);

  type Rel = { id: string; prenom: string | null; nom: string | null; email: string } | null;
  type RelF = { id: string; titre: string } | null;
  const insc = (dernieresInscriptions.data ?? []) as unknown as {
    id: string; date_debut: string; date_fin: string | null; statut: string; profiles: Rel; formations: RelF;
  }[];
  const nouveaux = (derniersEleves.data ?? []) as {
    id: string; prenom: string | null; nom: string | null; email: string; actif: boolean; created_at: string;
  }[];

  return (
    <>
      <div className="page-title">
        <div>
          <h1>Tableau de bord</h1>
          <p>Vue d&apos;ensemble de la plateforme de formation.</p>
        </div>
        <div className="actions">
          <Link href="/admin/eleves/nouveau" className="btn btn-primary btn-sm">+ Nouvel élève</Link>
          <Link href="/admin/formations/nouvelle" className="btn btn-blue btn-sm">+ Nouvelle formation</Link>
        </div>
      </div>

      <div className="stats-grid">
        <div className="stat-tile"><div className="label">Élèves</div><div className="value">{eleves.count ?? 0}</div><div className="sub">{elevesActifs.count ?? 0} actifs</div></div>
        <div className="stat-tile"><div className="label">Formations</div><div className="value">{formations.count ?? 0}</div><div className="sub">au catalogue</div></div>
        <div className="stat-tile"><div className="label">Inscriptions actives</div><div className="value">{inscriptions.count ?? 0}</div><div className="sub">parcours en cours</div></div>
        <div className="stat-tile"><div className="label">Demandes à traiter</div><div className="value">{demandes.count ?? 0}</div><div className="sub"><Link href="/admin/demandes" style={{ color: "var(--blue)" }}>voir les demandes</Link></div></div>
      </div>

      <div className="two-cols">
        <div className="panel">
          <h2>Dernières inscriptions</h2>
          {insc.length === 0 ? (
            <div className="empty"><div className="big"><Icon name="inbox" size={26} /></div>Aucune inscription pour le moment.</div>
          ) : (
            <div className="table-wrap">
              <table className="table">
                <thead><tr><th>Élève</th><th>Formation</th><th>Accès</th></tr></thead>
                <tbody>
                  {insc.map((i) => (
                    <tr key={i.id}>
                      <td>
                        {i.profiles ? (
                          <Link href={`/admin/eleves/${i.profiles.id}`} className="row-link">
                            {[i.profiles.prenom, i.profiles.nom].filter(Boolean).join(" ") || i.profiles.email}
                          </Link>
                        ) : "—"}
                      </td>
                      <td>{i.formations?.titre ?? "—"}</td>
                      <td className="muted">{formatDate(i.date_debut)} – {i.date_fin ? formatDate(i.date_fin) : "illimité"}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>

        <div className="panel">
          <h2>Derniers élèves créés</h2>
          {nouveaux.length === 0 ? (
            <div className="empty"><div className="big"><Icon name="graduation" size={26} /></div>Aucun élève. <Link href="/admin/eleves/nouveau" style={{ color: "var(--blue)" }}>Créer le premier compte</Link></div>
          ) : (
            <div className="table-wrap">
              <table className="table">
                <thead><tr><th>Nom</th><th>Statut</th><th>Créé le</th></tr></thead>
                <tbody>
                  {nouveaux.map((e) => (
                    <tr key={e.id}>
                      <td><Link href={`/admin/eleves/${e.id}`} className="row-link">{[e.prenom, e.nom].filter(Boolean).join(" ") || e.email}</Link><div className="muted">{e.email}</div></td>
                      <td>{e.actif ? <span className="badge badge-green">Actif</span> : <span className="badge badge-grey">Désactivé</span>}</td>
                      <td className="muted">{formatDate(e.created_at)}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>
      </div>
    </>
  );
}
