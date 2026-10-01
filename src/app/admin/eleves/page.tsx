import Link from "next/link";
import Icon from "@/components/Icon";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/types";
import { evaluerSuivi, depuis, type LigneSuivi, type Alerte } from "@/lib/suivi";

export default async function ElevesPage({
  searchParams,
}: {
  searchParams: Promise<{ q?: string; filtre?: string; tri?: string }>;
}) {
  const { q, filtre, tri } = await searchParams;
  const supabase = await createClient();

  let query = supabase
    .from("profiles")
    .select("id, prenom, nom, email, entreprise, actif, created_at, inscriptions!eleve_id(id, statut, date_debut, date_fin, formations:formation_id(titre))")
    .eq("role", "eleve")
    .order("created_at", { ascending: false });
  if (filtre === "actifs") query = query.eq("actif", true);
  if (filtre === "inactifs") query = query.eq("actif", false);
  if (q) query = query.or(`nom.ilike.%${q}%,prenom.ilike.%${q}%,email.ilike.%${q}%,entreprise.ilike.%${q}%`);

  const [{ data, error }, { data: suiviData }] = await Promise.all([query, supabase.from("v_suivi").select("*")]);
  if (error) console.error("[admin/eleves] requête impossible :", error.message);
  type Row = {
    id: string; prenom: string | null; nom: string | null; email: string; entreprise: string | null;
    actif: boolean; created_at: string;
    inscriptions: { id: string; statut: string; date_debut: string; date_fin: string | null; formations: { titre: string } | null }[];
  };
  const suivi = new Map(((suiviData ?? []) as LigneSuivi[]).map((l) => [l.inscription_id, l]));
  const maintenant = new Date();

  // Une ligne par inscription (un élève sans formation garde une ligne), avec l'alerte calculée.
  type Ligne = { eleve: Row; insc: Row["inscriptions"][number] | null; suivi: LigneSuivi | null; alerte: Alerte | null };
  let lignes: Ligne[] = ((data ?? []) as unknown as Row[]).flatMap((e): Ligne[] =>
    e.inscriptions.length === 0
      ? [{ eleve: e, insc: null, suivi: null, alerte: null }]
      : e.inscriptions.map((i) => {
          const s = suivi.get(i.id) ?? null;
          return { eleve: e, insc: i, suivi: s, alerte: s ? evaluerSuivi(s, maintenant) : null };
        })
  );
  if (filtre === "a-traiter") lignes = lignes.filter((l) => (l.alerte?.priorite ?? 0) >= 2);
  if (filtre === "termines") lignes = lignes.filter((l) => (l.suivi?.pourcentage ?? 0) >= 100);
  if (tri === "priorite" || !tri) {
    lignes.sort((a, b) => (b.alerte?.priorite ?? -1) - (a.alerte?.priorite ?? -1) || (b.suivi?.derniere_activite ?? "").localeCompare(a.suivi?.derniere_activite ?? ""));
  } else if (tri === "activite") {
    lignes.sort((a, b) => (b.suivi?.derniere_activite ?? "").localeCompare(a.suivi?.derniere_activite ?? ""));
  } else if (tri === "nom") {
    lignes.sort((a, b) => (a.eleve.nom ?? a.eleve.email).localeCompare(b.eleve.nom ?? b.eleve.email, "fr"));
  }
  const nbATraiter = lignes.filter((l) => (l.alerte?.priorite ?? 0) >= 2).length;
  const nbComptes = new Set(lignes.map((l) => l.eleve.id)).size;

  return (
    <>
      <div className="page-title">
        <div>
          <h1>Élèves</h1>
          <p>{nbComptes} compte{nbComptes > 1 ? "s" : ""}{nbATraiter ? ` · ${nbATraiter} suivi${nbATraiter > 1 ? "s" : ""} à traiter` : " · rien d'urgent"}</p>
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
            <option value="a-traiter">À traiter (relances, échanges, documents)</option>
            <option value="termines">Parcours terminés</option>
            <option value="actifs">Comptes actifs</option>
            <option value="inactifs">Comptes désactivés</option>
          </select>
          <select name="tri" defaultValue={tri ?? "priorite"}>
            <option value="priorite">Tri : priorité</option>
            <option value="activite">Tri : dernière activité</option>
            <option value="nom">Tri : nom</option>
          </select>
          <button className="btn btn-ghost btn-sm" type="submit">Filtrer</button>
        </form>

        {lignes.length === 0 ? (
          <div className="empty"><div className="big"><Icon name="graduation" size={26} /></div>Aucun élève trouvé.</div>
        ) : (
          <div className="table-wrap">
            <table className="table table-suivi">
              <thead>
                <tr><th>Élève</th><th>Formation</th><th style={{ minWidth: 170 }}>Avancement</th><th>Dernière activité</th><th>Suivi</th><th>Prochain échange</th></tr>
              </thead>
              <tbody>
                {lignes.map((l) => {
                  const e = l.eleve;
                  const pct = l.suivi?.pourcentage ?? 0;
                  return (
                    <tr key={`${e.id}-${l.insc?.id ?? "none"}`} className={(l.alerte?.priorite ?? 0) >= 3 ? "ligne-urgente" : undefined}>
                      <td>
                        <Link href={`/admin/eleves/${e.id}`} className="row-link">
                          {[e.prenom, e.nom].filter(Boolean).join(" ") || e.email}
                        </Link>
                        <div className="muted">{e.entreprise ?? e.email}{!e.actif && <> · <span className="badge badge-grey">désactivé</span></>}</div>
                      </td>
                      <td>
                        {l.insc ? (
                          <>
                            {l.insc.formations?.titre ?? "?"}
                            <div className="muted">{formatDate(l.insc.date_debut)} – {l.insc.date_fin ? formatDate(l.insc.date_fin) : "illimité"}</div>
                          </>
                        ) : <span className="muted">Aucune formation</span>}
                      </td>
                      <td>
                        {l.insc && (
                          <>
                            <div className="progress"><span style={{ width: `${pct}%` }} /></div>
                            <div className="progress-label">{pct} % · {l.suivi?.nb_terminees ?? 0}/{l.suivi?.nb_lecons ?? 0} leçons</div>
                          </>
                        )}
                      </td>
                      <td>
                        {l.insc && (
                          <>
                            {depuis(l.suivi?.derniere_activite ?? null, maintenant)}
                            {l.suivi?.nb_connexions ? <div className="muted">{l.suivi.nb_connexions} connexion{l.suivi.nb_connexions > 1 ? "s" : ""}</div> : null}
                          </>
                        )}
                      </td>
                      <td>
                        {l.alerte && <span className={`badge ${l.alerte.badge}`}>{l.alerte.libelle}</span>}
                        {l.suivi?.note_suivi && <div className="muted note-courte" title={l.suivi.note_suivi}>{l.suivi.note_suivi}</div>}
                      </td>
                      <td>
                        {l.suivi?.prochain_contact ? formatDate(l.suivi.prochain_contact) : <span className="muted">—</span>}
                        {l.suivi?.dernier_envoi && <div className="muted">docs envoyés {depuis(l.suivi.dernier_envoi, maintenant)}</div>}
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </>
  );
}
