import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { requireUser } from "@/lib/auth";
import { TYPES_LECON, type Formation, type Lecon, type Module } from "@/lib/types";
import { BUCKET, estFichier, estQuiz, lireQuiz, urlIntegration, type ContenuMedia } from "@/lib/contenu";
import TexteCours from "@/components/lecteur/TexteCours";
import { terminerLecon } from "@/app/espace/actions";
import ProtectionContenu from "@/components/ProtectionContenu";
import LecteurPdf from "@/components/lecteur/LecteurPdf";
import LecteurMedia from "@/components/lecteur/LecteurMedia";
import LecteurQuiz from "@/components/lecteur/LecteurQuiz";

export default async function LeconEleve({ params }: { params: Promise<{ id: string; leconId: string }> }) {
  const { id, leconId } = await params;
  const user = await requireUser();
  const supabase = await createClient();

  const { data: insc } = await supabase
    .from("inscriptions").select("id").eq("eleve_id", user.id).eq("formation_id", id).maybeSingle();
  if (!insc && user.role !== "admin") redirect("/espace");

  const [{ data: formation }, { data: modulesData }] = await Promise.all([
    supabase.from("formations").select("id, titre, icone").eq("id", id).maybeSingle(),
    supabase.from("modules").select("*, lecons(*)").eq("formation_id", id).eq("publie", true).order("ordre"),
  ]);
  if (!formation) notFound();
  const f = formation as Pick<Formation, "id" | "titre" | "icone">;
  const modules = (modulesData ?? []) as unknown as (Module & { lecons: Lecon[] })[];

  // Liste ordonnée des leçons publiées → précédent / suivant
  const plat: { lecon: Lecon; module: Module }[] = [];
  for (const m of modules) {
    for (const l of [...m.lecons].filter((x) => x.publie).sort((a, b) => a.ordre - b.ordre)) plat.push({ lecon: l, module: m });
  }
  const idx = plat.findIndex((p) => p.lecon.id === leconId);
  if (idx < 0) notFound();
  const { lecon, module } = plat[idx];
  const precedente = idx > 0 ? plat[idx - 1].lecon : null;
  const suivante = idx < plat.length - 1 ? plat[idx + 1].lecon : null;
  const typeInfo = TYPES_LECON.find((t) => t.value === lecon.type);

  // Progression de cette leçon
  let statut: "en_cours" | "termine" = "en_cours";
  let score: number | null = null;
  let tentatives = 0;
  if (insc) {
    const { data: prog } = await supabase
      .from("progression").select("id, statut, score, tentatives").eq("inscription_id", insc.id).eq("lecon_id", leconId).maybeSingle();
    if (prog) {
      statut = prog.statut;
      score = prog.score;
      tentatives = prog.tentatives ?? 0;
      await supabase.from("progression").update({ derniere_activite: new Date().toISOString() }).eq("id", prog.id);
    } else {
      await supabase.from("progression").insert({ inscription_id: insc.id, lecon_id: leconId, statut: "en_cours" });
    }
  }

  // Contenu selon le type
  const contenu = (lecon.contenu ?? {}) as ContenuMedia & { texte?: string };
  let urlSignee: string | null = null;
  if (estFichier(lecon.type) && contenu.storage_path) {
    const { data } = await supabase.storage.from(BUCKET).createSignedUrl(contenu.storage_path, 60 * 60 * 3);
    urlSignee = data?.signedUrl ?? null;
  }
  const embed = lecon.type === "video" && contenu.url_externe ? urlIntegration(contenu.url_externe) : null;
  const quiz = estQuiz(lecon.type) ? lireQuiz(lecon.contenu) : null;

  const terminer = terminerLecon.bind(null, id, leconId);

  return (
    <ProtectionContenu email={user.email}>
      <div className="breadcrumb">
        <Link href="/espace">Mes formations</Link> / <Link href={`/espace/formation/${id}`}>{f.titre}</Link> / {module.titre}
      </div>
      <div className="page-title">
        <div>
          <h1>{typeInfo?.icone} {lecon.titre} {statut === "termine" && <span className="badge badge-green">✓ Terminée</span>}</h1>
          <p>
            {typeInfo?.label}{lecon.duree_minutes ? ` · ${lecon.duree_minutes} min` : ""} · Leçon {idx + 1} sur {plat.length}
          </p>
        </div>
      </div>

      <div className="panel lecteur">
        {lecon.type === "texte" && (
          <>
            <TexteCours texte={contenu.texte ?? ""} />
            {!contenu.texte && <div className="empty">Contenu en cours de rédaction.</div>}
          </>
        )}

        {(lecon.type === "video" || lecon.type === "podcast") && (
          <>
            {embed ? (
              <div className="video-frame">
                <iframe src={embed} title={lecon.titre} allow="autoplay; encrypted-media; fullscreen" allowFullScreen referrerPolicy="strict-origin-when-cross-origin" />
              </div>
            ) : urlSignee ? (
              <LecteurMedia type={lecon.type} src={urlSignee} email={user.email} />
            ) : (
              <div className="empty"><div className="big">🚧</div>Média en cours de mise en ligne.</div>
            )}
          </>
        )}

        {(lecon.type === "pdf" || lecon.type === "ebook" || lecon.type === "slides") && (
          urlSignee ? <LecteurPdf src={urlSignee} mode={lecon.type === "slides" ? "slides" : "document"} email={user.email} />
          : <div className="empty"><div className="big">🚧</div>Document en cours de mise en ligne.</div>
        )}

        {contenu.description && estFichier(lecon.type) && (
          <details className="transcription" open={!urlSignee && !embed}>
            <summary>{urlSignee || embed ? "Transcription et notes" : "Texte de la leçon (média en cours de mise en ligne)"}</summary>
            <TexteCours texte={contenu.description} />
          </details>
        )}

        {quiz && (
          insc ? (
            <LecteurQuiz
              formationId={id}
              leconId={leconId}
              titre={lecon.type === "evaluation" ? "Évaluation" : "Quiz"}
              questions={quiz.questions.map((q) => ({ id: q.id, enonce: q.enonce, options: q.options, multiple: q.bonnes.length > 1 }))}
              seuil={quiz.seuil}
              tentativesMax={quiz.tentatives_max}
              tentativesFaites={tentatives}
              meilleurScore={score}
              dejaReussi={statut === "termine"}
              consigne={quiz.consigne}
            />
          ) : (
            <div className="alert alert-info">Aperçu administrateur : {quiz.questions.length} question(s), seuil {quiz.seuil} %.</div>
          )
        )}
      </div>

      <div className="lecteur-nav">
        {precedente ? (
          <Link href={`/espace/formation/${id}/lecon/${precedente.id}`} className="btn btn-ghost">← {precedente.titre}</Link>
        ) : <span />}
        {insc && !quiz && statut !== "termine" && (
          <form action={terminer}>
            <button className="btn btn-primary" type="submit">✓ J&apos;ai terminé cette leçon</button>
          </form>
        )}
        {suivante ? (
          <Link href={`/espace/formation/${id}/lecon/${suivante.id}`} className="btn btn-blue">{suivante.titre} →</Link>
        ) : (
          <Link href={`/espace/formation/${id}`} className="btn btn-blue">Retour au programme →</Link>
        )}
      </div>
    </ProtectionContenu>
  );
}
