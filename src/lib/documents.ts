import "server-only";
import { createClient } from "@/lib/supabase/server";
import type { Profile, Formation, Module, Lecon } from "@/lib/types";

export type TypeDocument = "attestation" | "certificat" | "releve";
export const TYPES_DOCUMENT: { type: TypeDocument; libelle: string; description: string }[] = [
  { type: "attestation", libelle: "Attestation de fin de formation", description: "Objectifs, nature, durée, résultats de l'évaluation des acquis (C. trav. L6353-1)." },
  { type: "certificat", libelle: "Certificat de réalisation", description: "Modèle du ministère du Travail, à transmettre au financeur (OPCO, entreprise)." },
  { type: "releve", libelle: "Relevé de connexion et de progression", description: "Preuve d'assiduité de la formation à distance (C. trav. D6313-3-1)." },
];

export type EvenementJournal = { id: string; type: string; created_at: string; lecon_id: string | null; meta: Record<string, unknown> };
export type TentativeQuiz = { id: string; lecon_id: string; score: number; reussi: boolean; duree_secondes: number | null; created_at: string };
export type ProgressionLecon = { lecon_id: string; statut: string; score: number | null; tentatives: number; termine_le: string | null; updated_at: string };
export type DocumentEmis = { id: string; numero: string; type: TypeDocument; emis_le: string; donnees: Record<string, unknown> };

export type DossierInscription = {
  inscription: { id: string; date_debut: string; date_fin: string | null; statut: string; created_at: string };
  eleve: Profile;
  formation: Formation;
  modules: (Module & { lecons: Lecon[] })[];
  progression: ProgressionLecon[];
  quiz: TentativeQuiz[];
  journal: EvenementJournal[];
  documents: DocumentEmis[];
  synthese: {
    nbLecons: number;
    nbTerminees: number;
    pourcentage: number;
    minutesRealisees: number;
    heuresRealisees: number;
    nbConnexions: number;
    nbJoursActifs: number;
    premiereActivite: string | null;
    derniereActivite: string | null;
    dateFinReelle: string;
    evaluationFinale: { score: number; reussi: boolean; date: string; tentatives: number } | null;
    quizModules: { module: string; titre: string; meilleurScore: number | null; reussi: boolean; tentatives: number }[];
  };
};

/** Charge tout ce qu'il faut pour produire un document officiel sur une inscription. Réservé à l'admin (RLS). */
export async function chargerDossier(inscriptionId: string): Promise<DossierInscription | null> {
  const supabase = await createClient();
  const { data: insc } = await supabase
    .from("inscriptions")
    .select("id, date_debut, date_fin, statut, created_at, eleve_id, formation_id")
    .eq("id", inscriptionId)
    .maybeSingle();
  if (!insc) return null;
  const i = insc as { id: string; date_debut: string; date_fin: string | null; statut: string; created_at: string; eleve_id: string; formation_id: string };

  const [{ data: eleve }, { data: formation }, { data: modulesData }, { data: prog }, { data: quiz }, { data: journal }, { data: docs }] = await Promise.all([
    supabase.from("profiles").select("*").eq("id", i.eleve_id).maybeSingle(),
    supabase.from("formations").select("*").eq("id", i.formation_id).maybeSingle(),
    supabase.from("modules").select("*, lecons(*)").eq("formation_id", i.formation_id).order("ordre"),
    supabase.from("progression").select("lecon_id, statut, score, tentatives, termine_le, updated_at").eq("inscription_id", i.id),
    supabase.from("quiz_reponses").select("id, lecon_id, score, reussi, duree_secondes, created_at").eq("inscription_id", i.id).order("created_at"),
    supabase.from("journal_activite").select("id, type, created_at, lecon_id, meta").eq("inscription_id", i.id).order("created_at"),
    supabase.from("documents_emis").select("id, numero, type, emis_le, donnees").eq("inscription_id", i.id).order("emis_le", { ascending: false }),
  ]);
  if (!eleve || !formation) return null;

  const modules = ((modulesData ?? []) as unknown as (Module & { lecons: Lecon[] })[])
    .map((m) => ({ ...m, lecons: [...(m.lecons ?? [])].sort((a, b) => a.ordre - b.ordre) }));
  const progression = (prog ?? []) as ProgressionLecon[];
  const tentatives = (quiz ?? []) as TentativeQuiz[];
  const evenements = (journal ?? []) as EvenementJournal[];
  const documents = (docs ?? []) as DocumentEmis[];

  const lecons = modules.flatMap((m) => m.lecons.filter((l) => l.publie));
  const terminees = new Set(progression.filter((p) => p.statut === "termine").map((p) => p.lecon_id));
  const minutes = lecons.filter((l) => terminees.has(l.id)).reduce((s, l) => s + (l.duree_minutes ?? 0), 0);

  const dates = [
    ...evenements.map((e) => e.created_at),
    ...progression.map((p) => p.termine_le ?? p.updated_at),
    ...tentatives.map((t) => t.created_at),
  ].filter(Boolean).sort();
  const jours = new Set(evenements.map((e) => e.created_at.slice(0, 10)));

  const evalLecon = lecons.find((l) => l.type === "evaluation");
  const evalTentatives = evalLecon ? tentatives.filter((t) => t.lecon_id === evalLecon.id) : [];
  const meilleureEval = evalTentatives.reduce<TentativeQuiz | null>((best, t) => (!best || t.score > best.score ? t : best), null);

  const quizModules = modules
    .map((m) => {
      const q = m.lecons.find((l) => l.type === "quiz" && (m.ordre > 1) && !/autopositionnement/i.test(l.titre));
      if (!q) return null;
      const ts = tentatives.filter((t) => t.lecon_id === q.id);
      const best = ts.reduce<number | null>((b, t) => (b === null || t.score > b ? t.score : b), null);
      return { module: m.titre, titre: q.titre, meilleurScore: best, reussi: ts.some((t) => t.reussi), tentatives: ts.length };
    })
    .filter((x): x is NonNullable<typeof x> => x !== null);

  const derniere = dates.length ? dates[dates.length - 1] : null;
  const dateFinReelle = (derniere ? derniere.slice(0, 10) : i.date_fin ?? i.date_debut);

  return {
    inscription: { id: i.id, date_debut: i.date_debut, date_fin: i.date_fin, statut: i.statut, created_at: i.created_at },
    eleve: eleve as Profile,
    formation: formation as Formation,
    modules,
    progression,
    quiz: tentatives,
    journal: evenements,
    documents,
    synthese: {
      nbLecons: lecons.length,
      nbTerminees: lecons.filter((l) => terminees.has(l.id)).length,
      pourcentage: lecons.length ? Math.round((100 * lecons.filter((l) => terminees.has(l.id)).length) / lecons.length) : 0,
      minutesRealisees: minutes,
      heuresRealisees: Math.round((minutes / 60) * 2) / 2,
      nbConnexions: evenements.filter((e) => e.type === "connexion").length,
      nbJoursActifs: jours.size,
      premiereActivite: dates.length ? dates[0] : null,
      derniereActivite: derniere,
      dateFinReelle,
      evaluationFinale: meilleureEval ? { score: meilleureEval.score, reussi: meilleureEval.reussi, date: meilleureEval.created_at, tentatives: evalTentatives.length } : null,
      quizModules,
    },
  };
}

export function formatDateLongue(d: string | null | undefined): string {
  if (!d) return "—";
  return new Date(d).toLocaleDateString("fr-FR", { day: "numeric", month: "long", year: "numeric", timeZone: "Europe/Paris" });
}
export function formatDateCourte(d: string | null | undefined): string {
  if (!d) return "—";
  return new Date(d).toLocaleDateString("fr-FR", { day: "2-digit", month: "2-digit", year: "numeric", timeZone: "Europe/Paris" });
}
export function formatHeure(d: string): string {
  return new Date(d).toLocaleTimeString("fr-FR", { hour: "2-digit", minute: "2-digit", timeZone: "Europe/Paris" });
}
export function formatHeures(h: number): string {
  const entier = Math.floor(h);
  const demi = h - entier >= 0.5;
  return demi ? `${entier} h 30` : `${entier} h`;
}

/** Données figées dans le registre au moment de l'émission d'un document. */
export function donneesFigees(d: DossierInscription): Record<string, unknown> {
  return {
    eleve: [d.eleve.prenom, d.eleve.nom].filter(Boolean).join(" ") || d.eleve.email, email: d.eleve.email, entreprise: d.eleve.entreprise,
    formation: d.formation.titre, duree_heures: d.formation.duree_heures,
    date_debut: d.inscription.date_debut, date_fin: d.synthese.dateFinReelle,
    heures_realisees: d.synthese.heuresRealisees, pourcentage: d.synthese.pourcentage,
    evaluation: d.synthese.evaluationFinale, quiz: d.synthese.quizModules,
    connexions: d.synthese.nbConnexions, jours_actifs: d.synthese.nbJoursActifs,
  };
}
