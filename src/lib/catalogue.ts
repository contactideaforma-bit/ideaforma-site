import { createClient } from "@/lib/supabase/server";
import type { Formation } from "@/lib/types";

/** Catalogue de secours si la base n'est pas encore alimentée (mêmes fiches que le seed SQL). */
export const CATALOGUE_DEFAUT: Formation[] = [
  f("management-leadership", "Management & Leadership", "management", "🏆", 14, "2 jours", "Intra-entreprise", 890,
    "Développez votre posture managériale, motivez vos équipes et apprenez à conduire le changement avec assurance.",
    ["Styles de management et leadership situationnel", "Entretiens de performance et feedback constructif", "Motivation et engagement des équipes", "Gestion des situations difficiles"], 1),
  f("prise-de-parole", "Prise de Parole en Public", "communication", "🎤", 14, "2 jours", "Intra-entreprise", 790,
    "Gagnez en aisance et en impact lors de vos prises de parole : réunions, présentations, conférences.",
    ["Gestion du stress et du trac", "Structure et clarté du message", "Langage corporel et présence", "Entraînements filmés et feedback"], 2),
  f("communication-professionnelle", "Communication Professionnelle", "communication", "🗣️", 7, "1 jour", "En ligne / Intra", 490,
    "Communiquez avec clarté et assertivité dans toutes les situations professionnelles.",
    ["Écoute active et reformulation", "Communication assertive", "Gestion des conflits et de l'agressivité", "Communication non verbale"], 3),
  f("gestes-postures-tms", "Gestes & Postures / TMS", "securite", "🛡️", 7, "1 jour", "Intra-entreprise", 390,
    "Prévenez les troubles musculo-squelettiques (TMS) et adoptez les bons gestes dans votre activité quotidienne.",
    ["Anatomie fonctionnelle simplifiée", "Identification des facteurs de risque", "Gestes et postures adaptés au poste", "Exercices pratiques en situation"], 4),
  f("securite-prevention", "Sécurité & Prévention au Travail", "securite", "⛑️", 7, "1 jour", "Intra-entreprise", 390,
    "Maîtrisez les fondamentaux de la sécurité au travail et de la prévention des risques professionnels.",
    ["Réglementation et responsabilités", "Évaluation des risques (DUERP)", "Port des EPI et procédures d'urgence", "Culture sécurité en entreprise"], 5),
  f("excel-avance", "Excel Avancé", "bureautique", "📊", 14, "2 jours", "En ligne / Intra", 690,
    "Maîtrisez les fonctions avancées d'Excel pour analyser vos données et automatiser vos tableaux de bord.",
    ["Fonctions avancées (RECHERCHEV, INDEX, etc.)", "Tableaux croisés dynamiques", "Macros VBA (initiation)", "Graphiques et visualisations"], 6),
  f("gestion-de-projet", "Gestion de Projet", "projet", "🗂️", 21, "3 jours", "En ligne / Intra", 1290,
    "Pilotez vos projets avec méthode : planification, suivi, livrables et gestion des parties prenantes.",
    ["Cadrage et note de lancement", "Planification (WBS, Gantt, chemin critique)", "Pilotage des risques et des coûts", "Méthodes agiles (Scrum, Kanban)"], 7),
  f("recrutement-integration", "Recrutement & Intégration", "rh", "👥", 14, "2 jours", "Intra-entreprise", 890,
    "Construisez un processus de recrutement efficace et soignez l'intégration de vos nouveaux collaborateurs.",
    ["Définition du besoin et du profil", "Techniques d'entretien structuré", "Évaluation objective des candidats", "Onboarding et fidélisation"], 8),
  f("gestion-du-stress-qvt", "Gestion du Stress & QVT", "rh", "🧘", 7, "1 jour", "En ligne / Intra", 490,
    "Reprenez le contrôle face au stress professionnel et améliorez votre qualité de vie au travail.",
    ["Identifier ses sources de stress", "Techniques de régulation émotionnelle", "Organisation et gestion des priorités", "Pratiques de pleine conscience"], 9),
];

function f(
  slug: string, titre: string, categorie: string, icone: string, duree_heures: number, duree_label: string,
  modalite: string, prix_ht: number, accroche: string, programme: string[], ordre: number
): Formation {
  return {
    id: slug, slug, titre, accroche, description: null, categorie, icone, duree_heures, duree_label, modalite,
    prix_ht, objectifs: [], programme, prerequis: null, public_vise: null, publie: true, ordre,
    created_at: "", updated_at: "",
  };
}

/** Formations publiées (site public). Retombe sur le catalogue par défaut si la base est vide ou injoignable. */
export async function getFormationsPubliees(): Promise<Formation[]> {
  try {
    const supabase = await createClient();
    const { data, error } = await supabase
      .from("formations")
      .select("*")
      .eq("publie", true)
      .order("ordre", { ascending: true })
      .order("titre", { ascending: true });
    if (error || !data || data.length === 0) return CATALOGUE_DEFAUT;
    return data as Formation[];
  } catch {
    return CATALOGUE_DEFAUT;
  }
}
