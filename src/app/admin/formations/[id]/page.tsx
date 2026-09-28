import Link from "next/link";
import { notFound } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { TYPES_LECON, type Formation, type Lecon, type Module } from "@/lib/types";
import FormationForm from "@/components/admin/FormationForm";
import ConfirmForm from "@/components/admin/ConfirmForm";
import {
  ajouterLecon, ajouterModule, deplacerLecon, deplacerModule, modifierFormation, modifierModule,
  supprimerFormation, supprimerLecon, supprimerModule,
} from "@/app/admin/actions";

export default async function FicheFormation({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const supabase = await createClient();

  const [{ data: formation }, { data: modulesData }, { data: inscrits }] = await Promise.all([
    supabase.from("formations").select("*").eq("id", id).maybeSingle(),
    supabase.from("modules").select("*, lecons(*)").eq("formation_id", id).order("ordre"),
    supabase.from("inscriptions").select("id, statut, profiles:eleve_id(id, prenom, nom, email)").eq("formation_id", id),
  ]);
  if (!formation) notFound();
  const f = formation as Formation;
  const modules = (modulesData ?? []) as unknown as (Module & { lecons: Lecon[] })[];
  type Inscrit = { id: string; statut: string; profiles: { id: string; prenom: string | null; nom: string | null; email: string } | null };
  const eleves = (inscrits ?? []) as unknown as Inscrit[];

  const modifier = modifierFormation.bind(null, f.id);
  const supprimer = supprimerFormation.bind(null, f.id);
  const ajouterMod = ajouterModule.bind(null, f.id);
  const typeLabel = (t: string) => TYPES_LECON.find((x) => x.value === t);

  return (
    <>
      <div className="breadcrumb"><Link href="/admin/formations">Formations</Link> / {f.titre}</div>
      <div className="page-title">
        <div>
          <h1>{f.icone} {f.titre} {f.publie ? <span className="badge badge-green">Publiée</span> : <span className="badge badge-grey">Masquée</span>}</h1>
          <p>{modules.length} module{modules.length > 1 ? "s" : ""} · {modules.reduce((n, m) => n + m.lecons.length, 0)} leçon(s) · {eleves.length} inscrit(s)</p>
        </div>
        <div className="actions">
          {f.publie && <Link href="/formations" className="btn btn-ghost btn-sm" target="_blank">Voir sur le site ↗</Link>}
        </div>
      </div>

      <div className="two-cols">
        <div>
          <div className="panel">
            <h2>Contenu de la formation <span className="count">{modules.length} modules</span></h2>
            <p style={{ fontSize: ".85rem", marginBottom: "1rem" }}>
              Structurez le parcours : modules, puis leçons (vidéo, slides, PDF, podcast, quiz, évaluation…).
              Cliquez sur « Modifier » pour déposer le fichier, rédiger le cours ou composer le quiz.
            </p>
            <div className="module-list">
              {modules.map((m, idx) => {
                const modifierMod = modifierModule.bind(null, m.id, f.id);
                const supprimerMod = supprimerModule.bind(null, m.id, f.id);
                const monter = deplacerModule.bind(null, m.id, f.id, "haut");
                const descendre = deplacerModule.bind(null, m.id, f.id, "bas");
                const ajouterLec = ajouterLecon.bind(null, m.id, f.id);
                return (
                  <div key={m.id} className="module-item">
                    <header>
                      <h3><span className="num">{idx + 1}</span>{m.titre} {!m.publie && <span className="badge badge-grey">masqué</span>}</h3>
                      <div className="actions-row">
                        <form action={monter}><button className="btn btn-ghost btn-sm" type="submit" disabled={idx === 0} title="Monter">↑</button></form>
                        <form action={descendre}><button className="btn btn-ghost btn-sm" type="submit" disabled={idx === modules.length - 1} title="Descendre">↓</button></form>
                        <ConfirmForm action={supprimerMod} message={`Supprimer le module « ${m.titre} » et ses leçons ?`}>
                          <button className="btn btn-danger btn-sm" type="submit">Supprimer</button>
                        </ConfirmForm>
                      </div>
                    </header>
                    <details style={{ marginTop: ".5rem" }}>
                      <summary style={{ cursor: "pointer", fontSize: ".82rem", color: "var(--blue)" }}>Modifier le module</summary>
                      <form action={modifierMod} className="form-grid" style={{ marginTop: ".6rem" }}>
                        <div className="form-group full"><label>Titre</label><input name="titre" defaultValue={m.titre} required /></div>
                        <div className="form-group full"><label>Description</label><input name="description" defaultValue={m.description ?? ""} /></div>
                        <div className="form-group"><label>Durée (min)</label><input name="duree_minutes" type="number" min="0" defaultValue={m.duree_minutes ?? ""} /></div>
                        <div className="form-group" style={{ justifyContent: "flex-end" }}><label className="form-check"><input type="checkbox" name="publie" defaultChecked={m.publie} /> Visible pour les élèves</label></div>
                        <div className="form-group full"><button className="btn btn-blue btn-sm" type="submit">Enregistrer le module</button></div>
                      </form>
                    </details>
                    {m.description && <p>{m.description}</p>}

                    <div className="lecon-list">
                      {m.lecons.sort((a, b) => a.ordre - b.ordre).map((l) => {
                        const supprimerLec = supprimerLecon.bind(null, l.id, f.id);
                        const t = typeLabel(l.type);
                        return (
                          <div key={l.id} className="lecon-item">
                            <span>{t?.icone ?? "📄"}</span>
                            <span>{l.titre}</span>
                            <span className="type">{t?.label ?? l.type}{l.duree_minutes ? ` · ${l.duree_minutes} min` : ""}</span>
                            {(l.type === "quiz" || l.type === "evaluation") && !(l.contenu as { questions?: unknown[] })?.questions?.length && <span className="badge badge-orange">sans questions</span>}
                            {["video", "podcast", "pdf", "ebook", "slides"].includes(l.type) && !l.storage_path && !(l.contenu as { url_externe?: string })?.url_externe && <span className="badge badge-orange">sans fichier</span>}
                            {!l.publie && <span className="badge badge-grey">masquée</span>}
                            <span className="spacer" />
                            <Link href={`/admin/formations/${f.id}/lecons/${l.id}`} className="btn btn-blue btn-sm">Modifier</Link>
                            <form action={deplacerLecon.bind(null, l.id, m.id, f.id, "haut")}><button className="btn btn-ghost btn-sm" type="submit" title="Monter">↑</button></form>
                            <form action={deplacerLecon.bind(null, l.id, m.id, f.id, "bas")}><button className="btn btn-ghost btn-sm" type="submit" title="Descendre">↓</button></form>
                            <ConfirmForm action={supprimerLec} message={`Supprimer la leçon « ${l.titre} » ?`}>
                              <button className="btn btn-ghost btn-sm" type="submit" title="Supprimer">✕</button>
                            </ConfirmForm>
                          </div>
                        );
                      })}
                      <form action={ajouterLec} className="inline-form" style={{ marginTop: ".4rem" }}>
                        <input name="titre" placeholder="Nouvelle leçon…" required style={{ flex: 1, minWidth: 160 }} />
                        <select name="type" defaultValue="texte">
                          {TYPES_LECON.map((t) => <option key={t.value} value={t.value}>{t.icone} {t.label}</option>)}
                        </select>
                        <input name="duree_minutes" type="number" min="0" placeholder="min" style={{ width: 70 }} />
                        <button className="btn btn-ghost btn-sm" type="submit">+ Ajouter</button>
                      </form>
                    </div>
                  </div>
                );
              })}
            </div>

            <form action={ajouterMod} className="callout" style={{ marginTop: "1rem" }}>
              <div style={{ fontWeight: 600, marginBottom: ".6rem" }}>+ Ajouter un module</div>
              <div className="form-grid">
                <div className="form-group full"><input name="titre" placeholder="Titre du module" required /></div>
                <div className="form-group full"><input name="description" placeholder="Description courte (facultatif)" /></div>
                <div className="form-group"><input name="duree_minutes" type="number" min="0" placeholder="Durée en minutes (facultatif)" /></div>
              </div>
              <button className="btn btn-primary btn-sm" type="submit" style={{ marginTop: ".75rem" }}>Ajouter le module</button>
            </form>
          </div>

          <div className="panel">
            <h2>Élèves inscrits <span className="count">{eleves.length}</span></h2>
            {eleves.length === 0 ? (
              <div className="empty">Aucun élève inscrit. Attribuez cette formation depuis une fiche élève.</div>
            ) : (
              <ul>
                {eleves.map((i) => (
                  <li key={i.id} style={{ padding: ".4rem 0", borderBottom: "1px solid rgba(74,159,212,.12)", fontSize: ".9rem" }}>
                    {i.profiles ? (
                      <Link href={`/admin/eleves/${i.profiles.id}`} style={{ color: "var(--blue-dark)", fontWeight: 600 }}>
                        {[i.profiles.prenom, i.profiles.nom].filter(Boolean).join(" ") || i.profiles.email}
                      </Link>
                    ) : "—"}{" "}
                    <span className={`badge ${i.statut === "active" ? "badge-blue" : "badge-grey"}`}>{i.statut}</span>
                  </li>
                ))}
              </ul>
            )}
          </div>
        </div>

        <div>
          <FormationForm action={modifier} formation={f} />
          <div className="panel" style={{ borderColor: "rgba(214,69,69,.35)" }}>
            <h2>Zone sensible</h2>
            <ConfirmForm action={supprimer} message={`Supprimer la formation « ${f.titre} », ses modules, ses leçons et toutes les inscriptions associées ?`}>
              <button className="btn btn-danger btn-sm" type="submit">Supprimer la formation</button>
            </ConfirmForm>
          </div>
        </div>
      </div>
    </>
  );
}
