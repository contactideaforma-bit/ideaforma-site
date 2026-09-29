import Link from "next/link";
import Icon from "@/components/Icon";
import { createClient } from "@/lib/supabase/server";
import { requireUser } from "@/lib/auth";
import { formatDate } from "@/lib/types";

export default async function MesFormations() {
  const user = await requireUser();
  const supabase = await createClient();

  const [{ data: inscData }, { data: avData }] = await Promise.all([
    supabase
      .from("inscriptions")
      .select("id, formation_id, date_debut, date_fin, statut, formations:formation_id(id, titre, icone, accroche, duree_label)")
      .eq("eleve_id", user.id)
      .order("created_at", { ascending: false }),
    supabase.from("v_avancement").select("*").eq("eleve_id", user.id),
  ]);

  type Insc = {
    id: string; formation_id: string; date_debut: string; date_fin: string | null; statut: string;
    formations: { id: string; titre: string; icone: string | null; accroche: string | null; duree_label: string | null } | null;
  };
  const inscriptions = (inscData ?? []) as unknown as Insc[];
  const avance = new Map(((avData ?? []) as { inscription_id: string; pourcentage: number; nb_lecons: number; nb_terminees: number }[]).map((a) => [a.inscription_id, a]));
  const aujourdhui = new Date().toISOString().slice(0, 10);

  return (
    <>
      <div className="page-title">
        <div>
          <h1>Bonjour {user.prenom ?? ""}</h1>
          <p>Retrouvez ici vos formations et votre progression.</p>
        </div>
      </div>

      {inscriptions.length === 0 ? (
        <div className="panel">
          <div className="empty">
            <div className="big"><Icon name="book-open" size={26} /></div>
            Aucune formation ne vous est attribuée pour le moment.
            <br />Contactez IDEAFORMA si vous pensez qu&apos;il s&apos;agit d&apos;une erreur.
          </div>
        </div>
      ) : (
        <div className="formations-grid">
          {inscriptions.map((i) => {
            const a = avance.get(i.id);
            const pasCommence = i.date_debut > aujourdhui;
            const expiree = !!i.date_fin && i.date_fin < aujourdhui;
            const accessible = i.statut === "active" && !pasCommence && !expiree;
            return (
              <article key={i.id} className="card formation-card">
                <div className="icon-box"><Icon name="book-open" size={22} /></div>
                <h3>{i.formations?.titre ?? "Formation"}</h3>
                <div className="card-meta">
                  {i.formations?.duree_label && <span className="card-tag"><Icon name="clock" /> {i.formations.duree_label}</span>}
                  {accessible && <span className="card-tag green"><Icon name="check" /> Accès ouvert</span>}
                  {pasCommence && <span className="card-tag grey">Ouvre le {formatDate(i.date_debut)}</span>}
                  {expiree && <span className="card-tag red">Délai dépassé</span>}
                  {i.statut === "terminee" && <span className="card-tag green">Terminée</span>}
                  {i.statut === "suspendue" && <span className="card-tag grey">Suspendue</span>}
                </div>
                <p>{i.formations?.accroche}</p>
                <div style={{ marginBottom: "1rem" }}>
                  <div className="progress"><span style={{ width: `${a?.pourcentage ?? 0}%` }} /></div>
                  <div className="progress-label">{a?.pourcentage ?? 0} % — {a?.nb_terminees ?? 0}/{a?.nb_lecons ?? 0} leçons</div>
                </div>
                <div className="card-footer">
                  <span className="muted" style={{ fontSize: ".78rem", color: "var(--text-muted)" }}>
                    {i.date_fin ? `Jusqu'au ${formatDate(i.date_fin)}` : "Accès sans limite"}
                  </span>
                  {accessible ? (
                    <Link href={`/espace/formation/${i.formation_id}`} className="btn btn-primary btn-sm">
                      {(a?.nb_terminees ?? 0) > 0 ? "Continuer" : "Commencer"}
                    </Link>
                  ) : (
                    <span className="btn btn-ghost btn-sm" aria-disabled style={{ opacity: .6 }}>Indisponible</span>
                  )}
                </div>
              </article>
            );
          })}
        </div>
      )}
    </>
  );
}
