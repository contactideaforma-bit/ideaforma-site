import Link from "next/link";
import { notFound } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { formatDate, type Profile } from "@/lib/types";
import { nomComplet } from "@/lib/auth";
import {
  basculerActif, inscrire, modifierEleve, modifierInscription, supprimerEleve, supprimerInscription,
} from "@/app/admin/actions";
import ConfirmForm from "@/components/admin/ConfirmForm";
import MotDePasseActions from "@/components/admin/MotDePasseActions";

export default async function FicheEleve({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const supabase = await createClient();

  const [{ data: eleve }, { data: inscriptionsData }, { data: formations }, { data: avancement }] = await Promise.all([
    supabase.from("profiles").select("*").eq("id", id).eq("role", "eleve").maybeSingle(),
    supabase.from("inscriptions").select("*, formations:formation_id(id, titre)").eq("eleve_id", id).order("created_at"),
    supabase.from("formations").select("id, titre").order("titre"),
    supabase.from("v_avancement").select("*").eq("eleve_id", id),
  ]);
  if (!eleve) notFound();
  const e = eleve as Profile;

  const inscIds = ((inscriptionsData ?? []) as { id: string }[]).map((i) => i.id);
  const { data: quizData } = inscIds.length
    ? await supabase.from("quiz_reponses").select("id, lecon_id, score, reussi, created_at, lecons:lecon_id(titre)").in("inscription_id", inscIds).order("created_at", { ascending: false }).limit(50)
    : { data: [] };
  const tentativesQuiz = (quizData ?? []) as unknown as { id: string; score: number; reussi: boolean; created_at: string; lecons: { titre: string } | null }[];

  type Insc = { id: string; formation_id: string; date_debut: string; date_fin: string | null; statut: string; formations: { id: string; titre: string } | null };
  const inscriptions = (inscriptionsData ?? []) as unknown as Insc[];
  const avance = new Map<string, { pourcentage: number; nb_lecons: number; nb_terminees: number }>(
    ((avancement ?? []) as { inscription_id: string; pourcentage: number; nb_lecons: number; nb_terminees: number }[])
      .map((a) => [a.inscription_id, a])
  );
  const dejaInscrit = new Set(inscriptions.map((i) => i.formation_id));
  const disponibles = ((formations ?? []) as { id: string; titre: string }[]).filter((f) => !dejaInscrit.has(f.id));
  const mailConfigure = !!process.env.RESEND_API_KEY;
  const aujourdhui = new Date().toISOString().slice(0, 10);

  const modifier = modifierEleve.bind(null, e.id);
  const activer = basculerActif.bind(null, e.id, !e.actif);
  const supprimer = supprimerEleve.bind(null, e.id);
  const inscrireAction = inscrire.bind(null, e.id);

  return (
    <>
      <div className="breadcrumb"><Link href="/admin/eleves">Élèves</Link> / {nomComplet(e)}</div>
      <div className="page-title">
        <div>
          <h1>
            {nomComplet(e)}{" "}
            {e.actif ? <span className="badge badge-green">Actif</span> : <span className="badge badge-grey">Désactivé</span>}
          </h1>
          <p>{e.email} · compte créé le {formatDate(e.created_at)}</p>
        </div>
        <div className="actions">
          <ConfirmForm
            action={activer}
            message={e.actif ? "Désactiver ce compte ? L'élève ne pourra plus se connecter." : "Réactiver ce compte ?"}
          >
            <button className={`btn btn-sm ${e.actif ? "btn-danger" : "btn-blue"}`} type="submit">
              {e.actif ? "Désactiver le compte" : "Réactiver le compte"}
            </button>
          </ConfirmForm>
        </div>
      </div>

      <div className="two-cols">
        <div>
          <div className="panel">
            <h2>Formations attribuées <span className="count">{inscriptions.length}</span></h2>
            {inscriptions.length === 0 && <div className="empty"><div className="big">📚</div>Aucune formation attribuée.</div>}
            {inscriptions.map((i) => {
              const a = avance.get(i.id);
              const modifierInsc = modifierInscription.bind(null, i.id, e.id);
              const supprimerInsc = supprimerInscription.bind(null, i.id, e.id);
              const expiree = i.date_fin ? i.date_fin < aujourdhui : false;
              return (
                <div key={i.id} className="module-item" style={{ marginBottom: ".75rem" }}>
                  <header>
                    <h3>
                      <Link href={`/admin/formations/${i.formation_id}`}>{i.formations?.titre ?? "Formation"}</Link>
                    </h3>
                    {i.statut === "active" && !expiree && <span className="badge badge-blue">En cours</span>}
                    {i.statut === "active" && expiree && <span className="badge badge-orange">Délai dépassé</span>}
                    {i.statut === "terminee" && <span className="badge badge-green">Terminée</span>}
                    {i.statut === "suspendue" && <span className="badge badge-grey">Suspendue</span>}
                  </header>
                  <div style={{ margin: ".6rem 0" }}>
                    <div className="progress"><span style={{ width: `${a?.pourcentage ?? 0}%` }} /></div>
                    <div className="progress-label">{a?.pourcentage ?? 0} % — {a?.nb_terminees ?? 0}/{a?.nb_lecons ?? 0} leçons terminées</div>
                  </div>
                  <form action={modifierInsc} className="inline-form">
                    <label className="muted" style={{ fontSize: ".78rem" }}>Du</label>
                    <input type="date" name="date_debut" defaultValue={i.date_debut} />
                    <label className="muted" style={{ fontSize: ".78rem" }}>au</label>
                    <input type="date" name="date_fin" defaultValue={i.date_fin ?? ""} />
                    <select name="statut" defaultValue={i.statut}>
                      <option value="active">Active</option>
                      <option value="suspendue">Suspendue</option>
                      <option value="terminee">Terminée</option>
                    </select>
                    <button className="btn btn-ghost btn-sm" type="submit">Enregistrer</button>
                  </form>
                  <ConfirmForm action={supprimerInsc} message="Retirer cette formation à l'élève ? Sa progression sera perdue." style={{ marginTop: ".5rem" }}>
                    <button className="btn btn-danger btn-sm" type="submit">Retirer</button>
                  </ConfirmForm>
                </div>
              );
            })}

            {disponibles.length > 0 && (
              <form action={inscrireAction} className="callout" style={{ marginTop: "1rem" }}>
                <div style={{ fontWeight: 600, marginBottom: ".6rem" }}>+ Attribuer une formation</div>
                <div className="form-grid">
                  <div className="form-group full">
                    <select name="formation_id" required defaultValue="">
                      <option value="" disabled>— Choisir une formation —</option>
                      {disponibles.map((f) => <option key={f.id} value={f.id}>{f.titre}</option>)}
                    </select>
                  </div>
                  <div className="form-group"><label>Début d&apos;accès</label><input type="date" name="date_debut" defaultValue={aujourdhui} /></div>
                  <div className="form-group"><label>Fin d&apos;accès</label><input type="date" name="date_fin" /><span className="hint">Vide = illimité</span></div>
                </div>
                <button className="btn btn-primary btn-sm" type="submit" style={{ marginTop: ".75rem" }}>Attribuer</button>
              </form>
            )}
          </div>
        </div>

        <div>
          {tentativesQuiz.length > 0 && (
            <div className="panel">
              <h2>Quiz et évaluations <span className="count">{tentativesQuiz.length}</span></h2>
              <div className="table-wrap">
                <table className="table">
                  <thead><tr><th>Leçon</th><th>Score</th><th>Résultat</th><th>Date</th></tr></thead>
                  <tbody>
                    {tentativesQuiz.map((t) => (
                      <tr key={t.id}>
                        <td>{t.lecons?.titre ?? "—"}</td>
                        <td>{t.score} %</td>
                        <td>{t.reussi ? <span className="badge badge-green">Réussi</span> : <span className="badge badge-orange">Échec</span>}</td>
                        <td className="muted">{formatDate(t.created_at)}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
          )}

          <div className="panel">
            <h2>Identité</h2>
            <form action={modifier}>
              <div className="form-grid">
                <div className="form-group"><label htmlFor="prenom">Prénom</label><input id="prenom" name="prenom" defaultValue={e.prenom ?? ""} /></div>
                <div className="form-group"><label htmlFor="nom">Nom</label><input id="nom" name="nom" defaultValue={e.nom ?? ""} /></div>
                <div className="form-group"><label htmlFor="telephone">Téléphone</label><input id="telephone" name="telephone" defaultValue={e.telephone ?? ""} /></div>
                <div className="form-group"><label htmlFor="entreprise">Entreprise</label><input id="entreprise" name="entreprise" defaultValue={e.entreprise ?? ""} /></div>
                <div className="form-group full"><label>Identifiant (e-mail)</label><input value={e.email} disabled /></div>
              </div>
              <button className="btn btn-blue btn-sm" type="submit" style={{ marginTop: ".75rem" }}>Enregistrer</button>
            </form>
          </div>

          <div className="panel">
            <h2>Identifiants</h2>
            <p style={{ fontSize: ".85rem", marginBottom: ".75rem" }}>
              Le mot de passe n&apos;est jamais stocké en clair : pour renvoyer les identifiants, un nouveau mot de passe est généré.
            </p>
            <MotDePasseActions eleveId={e.id} mailConfigure={mailConfigure} />
          </div>

          <div className="panel" style={{ borderColor: "rgba(214,69,69,.35)" }}>
            <h2>Zone sensible</h2>
            <ConfirmForm action={supprimer} message={`Supprimer définitivement le compte de ${nomComplet(e)} ainsi que ses inscriptions et sa progression ?`}>
              <button className="btn btn-danger btn-sm" type="submit">Supprimer ce compte</button>
            </ConfirmForm>
          </div>
        </div>
      </div>
    </>
  );
}
