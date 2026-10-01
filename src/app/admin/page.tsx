import Link from "next/link";
import Icon from "@/components/Icon";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/types";
import { evaluerSuivi, depuis, type LigneSuivi } from "@/lib/suivi";

export default async function AdminDashboard() {
  const supabase = await createClient();

  const [eleves, elevesActifs, formations, inscriptions, demandes, dernieresInscriptions, derniersEleves, suiviRes, profilsRes] =
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
      supabase.from("v_suivi").select("*"),
      supabase.from("profiles").select("id, prenom, nom, email").eq("role", "eleve"),
    ]);

  // Suivi : actions à mener, triées par priorité
  const maintenant = new Date();
  const profils = new Map(((profilsRes.data ?? []) as { id: string; prenom: string | null; nom: string | null; email: string }[]).map((p) => [p.id, p]));
  const aFaire = ((suiviRes.data ?? []) as LigneSuivi[])
    .map((l) => ({ l, alerte: evaluerSuivi(l, maintenant), p: profils.get(l.eleve_id) }))
    .filter((x) => x.alerte.priorite >= 2)
    .sort((a, b) => b.alerte.priorite - a.alerte.priorite);
  const enCours = ((suiviRes.data ?? []) as LigneSuivi[]).filter((l) => l.statut === "active" && (l.pourcentage ?? 0) < 100);
  const avancementMoyen = enCours.length ? Math.round(enCours.reduce((s, l) => s + (l.pourcentage ?? 0), 0) / enCours.length) : 0;
  const actifs7j = ((suiviRes.data ?? []) as LigneSuivi[]).filter((l) => l.derniere_activite && (maintenant.getTime() - new Date(l.derniere_activite).getTime()) < 7 * 86_400_000).length;

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
        <div className="stat-tile"><div className="label">Inscriptions actives</div><div className="value">{inscriptions.count ?? 0}</div><div className="sub">{avancementMoyen} % d&apos;avancement moyen · {actifs7j} actif{actifs7j > 1 ? "s" : ""} ces 7 jours</div></div>
        <div className="stat-tile"><div className="label">Demandes à traiter</div><div className="value">{demandes.count ?? 0}</div><div className="sub"><Link href="/admin/demandes" style={{ color: "var(--blue)" }}>voir les demandes</Link></div></div>
      </div>

      <div className="panel">
        <h2>À faire <span className="count">{aFaire.length}</span></h2>
        {aFaire.length === 0 ? (
          <div className="empty"><div className="big"><Icon name="check-circle" size={26} /></div>Rien d&apos;urgent : aucune relance, aucun échange en retard, aucun document en attente.</div>
        ) : (
          <div className="table-wrap">
            <table className="table">
              <thead><tr><th>Élève</th><th>Situation</th><th>Avancement</th><th>Dernière activité</th><th>Note</th><th></th></tr></thead>
              <tbody>
                {aFaire.map(({ l, alerte, p }) => (
                  <tr key={l.inscription_id} className={alerte.priorite >= 3 ? "ligne-urgente" : undefined}>
                    <td>{p ? <Link href={`/admin/eleves/${p.id}`} className="row-link">{[p.prenom, p.nom].filter(Boolean).join(" ") || p.email}</Link> : "—"}</td>
                    <td><span className={`badge ${alerte.badge}`}>{alerte.libelle}</span></td>
                    <td>{l.pourcentage ?? 0} %</td>
                    <td className="muted">{depuis(l.derniere_activite, maintenant)}</td>
                    <td className="muted note-courte" title={l.note_suivi ?? ""}>{l.note_suivi ?? ""}</td>
                    <td>{p && <Link href={`/admin/eleves/${p.id}`} className="btn btn-ghost btn-sm">Ouvrir</Link>}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
        <p className="muted" style={{ fontSize: ".8rem", marginTop: ".6rem" }}>
          Règles : échange planifié arrivé à échéance, parcours terminé sans attestation et certificat émis, jamais connecté 7 jours après l&apos;ouverture, inactif depuis 14 jours, fin d&apos;accès dans 15 jours.
        </p>
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
