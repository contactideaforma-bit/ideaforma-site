"use server";

import { revalidatePath } from "next/cache";
import { requireUser } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { corrigerQuiz, lireQuiz } from "@/lib/contenu";

async function inscriptionPour(formationId: string) {
  const user = await requireUser();
  const supabase = await createClient();
  const { data: insc } = await supabase
    .from("inscriptions")
    .select("id")
    .eq("eleve_id", user.id)
    .eq("formation_id", formationId)
    .maybeSingle();
  return { user, supabase, inscriptionId: (insc?.id as string | undefined) ?? null };
}

/** L'élève marque une leçon (non notée) comme terminée. La RLS vérifie l'inscription et le délai d'accès. */
export async function terminerLecon(formationId: string, leconId: string): Promise<void> {
  const { supabase, inscriptionId } = await inscriptionPour(formationId);
  if (!inscriptionId) return;

  await supabase.from("progression").upsert(
    { inscription_id: inscriptionId, lecon_id: leconId, statut: "termine", termine_le: new Date().toISOString(), derniere_activite: new Date().toISOString() },
    { onConflict: "inscription_id,lecon_id" }
  );
  revalidatePath(`/espace/formation/${formationId}`);
  revalidatePath(`/espace/formation/${formationId}/lecon/${leconId}`);
  revalidatePath("/espace");
}

/** Trace l'ouverture d'une leçon (statut en_cours si pas déjà terminée). */
export async function ouvrirLecon(formationId: string, leconId: string): Promise<void> {
  const { supabase, inscriptionId } = await inscriptionPour(formationId);
  if (!inscriptionId) return;
  const { data: existante } = await supabase
    .from("progression").select("id, statut").eq("inscription_id", inscriptionId).eq("lecon_id", leconId).maybeSingle();
  if (existante) {
    await supabase.from("progression").update({ derniere_activite: new Date().toISOString() }).eq("id", existante.id);
  } else {
    await supabase.from("progression").insert({ inscription_id: inscriptionId, lecon_id: leconId, statut: "en_cours" });
  }
}

export type ResultatQuiz = {
  ok: boolean;
  erreur?: string;
  score?: number;
  justes?: number;
  total?: number;
  reussi?: boolean;
  seuil?: number;
  tentative?: number;
  tentatives_max?: number;
  detail?: { id: string; correct: boolean; choisis: number[]; bonnes: number[] }[];
  corrections?: boolean;
  explications?: Record<string, string>;
};

/** Correction côté serveur : les bonnes réponses ne quittent jamais la base avant soumission. */
export async function soumettreQuiz(formationId: string, leconId: string, reponses: number[][], dureeSecondes?: number): Promise<ResultatQuiz> {
  const { supabase, inscriptionId } = await inscriptionPour(formationId);
  if (!inscriptionId) return { ok: false, erreur: "Vous n'êtes pas inscrit(e) à cette formation." };

  const { data: lecon } = await supabase.from("lecons").select("id, type, contenu").eq("id", leconId).maybeSingle();
  if (!lecon) return { ok: false, erreur: "Leçon inaccessible." };
  const quiz = lireQuiz(lecon.contenu);
  if (quiz.questions.length === 0) return { ok: false, erreur: "Ce quiz ne contient aucune question." };

  const { count } = await supabase
    .from("quiz_reponses").select("id", { count: "exact", head: true })
    .eq("inscription_id", inscriptionId).eq("lecon_id", leconId);
  const dejaFaites = count ?? 0;
  if (quiz.tentatives_max > 0 && dejaFaites >= quiz.tentatives_max) {
    return { ok: false, erreur: `Nombre maximum de tentatives atteint (${quiz.tentatives_max}).` };
  }

  const resultat = corrigerQuiz(quiz, Array.isArray(reponses) ? reponses : []);

  const { error } = await supabase.from("quiz_reponses").insert({
    inscription_id: inscriptionId,
    lecon_id: leconId,
    reponses: resultat.detail.map((d) => d.choisis),
    score: resultat.score,
    reussi: resultat.reussi,
    duree_secondes: dureeSecondes ? Math.round(dureeSecondes) : null,
  });
  if (error) return { ok: false, erreur: "Enregistrement impossible : " + error.message };

  // Progression : meilleur score conservé ; terminé dès qu'une tentative atteint le seuil.
  const { data: prog } = await supabase
    .from("progression").select("id, statut, score").eq("inscription_id", inscriptionId).eq("lecon_id", leconId).maybeSingle();
  const meilleur = Math.max(Number(prog?.score ?? 0), resultat.score);
  const statut = prog?.statut === "termine" || resultat.reussi ? "termine" : "en_cours";
  await supabase.from("progression").upsert(
    {
      inscription_id: inscriptionId,
      lecon_id: leconId,
      statut,
      score: meilleur,
      tentatives: dejaFaites + 1,
      termine_le: statut === "termine" ? (prog?.statut === "termine" ? undefined : new Date().toISOString()) : null,
      derniere_activite: new Date().toISOString(),
    },
    { onConflict: "inscription_id,lecon_id" }
  );

  revalidatePath(`/espace/formation/${formationId}`);
  revalidatePath("/espace");

  const explications: Record<string, string> = {};
  for (const q of quiz.questions) if (q.explication) explications[q.id] = q.explication;

  return {
    ok: true,
    score: resultat.score,
    justes: resultat.justes,
    total: resultat.total,
    reussi: resultat.reussi,
    seuil: quiz.seuil,
    tentative: dejaFaites + 1,
    tentatives_max: quiz.tentatives_max,
    corrections: quiz.corrections,
    detail: quiz.corrections ? resultat.detail : resultat.detail.map((d) => ({ ...d, bonnes: [] })),
    explications: quiz.corrections ? explications : {},
  };
}
