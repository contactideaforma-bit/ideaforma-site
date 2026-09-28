import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { requireUser } from "@/lib/auth";
import { TYPES_LECON, formatDate, type Formation, type Lecon, type Module } from "@/lib/types";
import ProtectionContenu from "@/components/ProtectionContenu";

export default async function FormationEleve({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const user = await requireUser();
  const supabase = await createClient();

  const { data: insc } = await supabase
    .from("inscriptions").select("id, date_debut, date_fin, statut")
    .eq("eleve_id", user.id).eq("formation_id", id).maybeSingle();
  if (!insc && user.role !== "admin") redirect("/espace");

  const [{ data: formation }, { data: modulesData }, { data: progData }] = await Promise.all([
    supabase.from("formations").select("*").eq("id", id).maybeSingle(),
    supabase.from("modules").select("*, lecons(*)").eq("formation_id", id).eq("publie", true).order("ordre"),
    insc ? supabase.from("progression").select("lecon_id, statut, score").eq("inscription_id", insc.id) : Promise.resolve({ data: [] }),
  ]);
  if (!formation) notFound(); // RLS : formation inaccessible (délai dépassé, suspendue…) → 404
  const f = formation as Formation;
  const modules = (modulesData ?? []) as unknown as (Module & { lecons: Lecon[] })[];
  const terminees = new Set(((progData ?? []) as { lecon_id: string; statut: string }[]).filter((p) => p.statut === "termine").map((p) => p.lecon_id));
  const total = modules.reduce((n, m) => n + m.lecons.filter((l) => l.publie).length, 0);
  const faites = modules.reduce((n, m) => n + m.lecons.filter((l) => l.publie && terminees.has(l.id)).length, 0);
  const pct = total ? Math.round((100 * faites) / total) : 0;
  const typeLabel = (t: string) => TYPES_LECON.find((x) => x.value === t);

  return (
    <ProtectionContenu email={user.email}>
      <div className="breadcrumb"><Link href="/espace">Mes formations</Link> / {f.titre}</div>
      <div className="page-title">
        <div>
          <h1>{f.icone} {f.titre}</h1>
          <p>
            {f.duree_label && <>Durée indicative : {f.duree_label} · </>}
            {insc?.date_fin ? `Accès jusqu'au ${formatDate(insc.date_fin)}` : "Accès sans limite de temps"}
          </p>
        </div>
      </div>

      <div className="panel">
        <h2>Ma progression <span className="count">{pct} %</span></h2>
        {pct === 100 && <div className="alert alert-success">🎉 Formation terminée : toutes les leçons sont validées.</div>}
        <div className="progress" style={{ height: 12 }}><span style={{ width: `${pct}%` }} /></div>
        <div className="progress-label">{faites} leçon{faites > 1 ? "s" : ""} terminée{faites > 1 ? "s" : ""} sur {total}</div>
      </div>

      {f.objectifs.length > 0 && (
        <div className="panel">
          <h2>Objectifs pédagogiques</h2>
          <ul className="detail-list">{f.objectifs.map((o) => <li key={o}>{o}</li>)}</ul>
        </div>
      )}

      <div className="panel">
        <h2>Programme</h2>
        {modules.length === 0 ? (
          <div className="empty"><div className="big">🚧</div>Le contenu de cette formation est en cours de mise en ligne.</div>
        ) : (
          <div className="module-list">
            {modules.map((m, idx) => (
              <div key={m.id} className="module-item">
                <header>
                  <h3><span className="num">{idx + 1}</span>{m.titre}</h3>
                  {m.duree_minutes ? <span className="badge badge-grey">⏱ {m.duree_minutes} min</span> : null}
                </header>
                {m.description && <p>{m.description}</p>}
                <div className="lecon-list">
                  {m.lecons.filter((l) => l.publie).sort((a, b) => a.ordre - b.ordre).map((l) => {
                    const t = typeLabel(l.type);
                    const faite = terminees.has(l.id);
                    return (
                      <Link key={l.id} href={`/espace/formation/${f.id}/lecon/${l.id}`} className="lecon-item lecon-lien">
                        <span>{faite ? "✅" : t?.icone ?? "📄"}</span>
                        <span style={{ fontWeight: faite ? 400 : 500 }}>{l.titre}</span>
                        <span className="type">{t?.label ?? l.type}{l.duree_minutes ? ` · ${l.duree_minutes} min` : ""}</span>
                        <span className="spacer" />
                        <span className="btn btn-ghost btn-sm">{faite ? "Revoir" : "Ouvrir"} →</span>
                      </Link>
                    );
                  })}
                  {m.lecons.filter((l) => l.publie).length === 0 && <div className="muted" style={{ fontSize: ".82rem" }}>Contenu à venir.</div>}
                </div>
              </div>
            ))}
          </div>
        )}
        <p style={{ fontSize: ".8rem", marginTop: "1rem" }}>
          🔒 Les contenus de cette formation sont strictement personnels : leur téléchargement, capture ou diffusion sont interdits.
        </p>
      </div>
    </ProtectionContenu>
  );
}
