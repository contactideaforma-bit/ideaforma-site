/**
 * Structure du champ `lecons.contenu` (jsonb) selon le type de leçon.
 * Partagé entre l'éditeur admin, le lecteur élève et la correction serveur.
 */

export type QuestionQuiz = {
  id: string;
  enonce: string;
  options: string[];
  /** index des bonnes réponses (une ou plusieurs) */
  bonnes: number[];
  explication?: string;
};

export type ContenuQuiz = {
  questions: QuestionQuiz[];
  /** % minimum pour valider la leçon */
  seuil: number;
  /** 0 = illimité */
  tentatives_max: number;
  /** montrer les bonnes réponses après soumission */
  corrections: boolean;
  consigne?: string;
};

export type ContenuTexte = {
  /** texte enrichi léger : lignes, "# Titre", "## Sous-titre", "- puce", lignes vides = paragraphes */
  texte: string;
};

export type ContenuMedia = {
  /** chemin dans le bucket privé `contenus` (formations/<formation_id>/<lecon_id>/<fichier>) */
  storage_path?: string;
  nom_fichier?: string;
  taille?: number;
  /** vidéo hébergée ailleurs (YouTube non répertorié, Vimeo…) */
  url_externe?: string;
  description?: string;
};

export type Contenu = Partial<ContenuQuiz & ContenuTexte & ContenuMedia>;

export const TYPES_FICHIER = ["video", "podcast", "pdf", "ebook", "slides"] as const;
export const TYPES_QUIZ = ["quiz", "evaluation"] as const;

export function estFichier(type: string): boolean {
  return (TYPES_FICHIER as readonly string[]).includes(type);
}
export function estQuiz(type: string): boolean {
  return (TYPES_QUIZ as readonly string[]).includes(type);
}

export function lireQuiz(contenu: unknown): ContenuQuiz {
  const c = (contenu ?? {}) as Partial<ContenuQuiz>;
  const questions = Array.isArray(c.questions) ? c.questions : [];
  return {
    questions: questions
      .filter((q) => q && typeof q.enonce === "string")
      .map((q, i) => ({
        id: typeof q.id === "string" && q.id ? q.id : `q${i + 1}`,
        enonce: q.enonce,
        options: Array.isArray(q.options) ? q.options.map(String) : [],
        bonnes: Array.isArray(q.bonnes) ? q.bonnes.map(Number).filter(Number.isInteger) : [],
        explication: typeof q.explication === "string" ? q.explication : undefined,
      })),
    seuil: clamp(Number(c.seuil ?? 70), 0, 100),
    tentatives_max: Math.max(0, Number(c.tentatives_max ?? 0) || 0),
    corrections: c.corrections !== false,
    consigne: typeof c.consigne === "string" ? c.consigne : undefined,
  };
}

function clamp(n: number, min: number, max: number) {
  return Number.isFinite(n) ? Math.min(max, Math.max(min, n)) : min;
}

/** Note un quiz : reponses[i] = tableau d'index choisis pour la question i. Retourne le % et le détail. */
export function corrigerQuiz(quiz: ContenuQuiz, reponses: number[][]) {
  const detail = quiz.questions.map((q, i) => {
    const choisis = [...new Set((reponses[i] ?? []).map(Number))].sort((a, b) => a - b);
    const bonnes = [...new Set(q.bonnes)].sort((a, b) => a - b);
    const correct = choisis.length === bonnes.length && choisis.every((v, k) => v === bonnes[k]);
    return { id: q.id, correct, choisis, bonnes };
  });
  const total = quiz.questions.length;
  const justes = detail.filter((d) => d.correct).length;
  const score = total === 0 ? 0 : Math.round((1000 * justes) / total) / 10;
  return { score, justes, total, reussi: score >= quiz.seuil, detail };
}

/** Transforme le texte enrichi léger en blocs affichables. */
export function blocsTexte(texte: string): { type: "h1" | "h2" | "p" | "ul"; contenu: string | string[] }[] {
  const blocs: { type: "h1" | "h2" | "p" | "ul"; contenu: string | string[] }[] = [];
  let para: string[] = [];
  let liste: string[] = [];
  const flush = () => {
    if (para.length) blocs.push({ type: "p", contenu: para.join(" ") });
    if (liste.length) blocs.push({ type: "ul", contenu: liste });
    para = [];
    liste = [];
  };
  for (const brute of texte.split("\n")) {
    const l = brute.trim();
    if (!l) { flush(); continue; }
    if (l.startsWith("## ")) { flush(); blocs.push({ type: "h2", contenu: l.slice(3) }); continue; }
    if (l.startsWith("# ")) { flush(); blocs.push({ type: "h1", contenu: l.slice(2) }); continue; }
    if (l.startsWith("- ") || l.startsWith("• ")) { if (para.length) { blocs.push({ type: "p", contenu: para.join(" ") }); para = []; } liste.push(l.slice(2)); continue; }
    if (liste.length) { blocs.push({ type: "ul", contenu: liste }); liste = []; }
    para.push(l);
  }
  flush();
  return blocs;
}

/** Détecte une URL YouTube / Vimeo et renvoie l'URL d'intégration, sinon null. */
export function urlIntegration(url: string): string | null {
  try {
    const u = new URL(url);
    const h = u.hostname.replace(/^www\./, "");
    if (h === "youtube.com" || h === "m.youtube.com") {
      const id = u.searchParams.get("v");
      return id ? `https://www.youtube-nocookie.com/embed/${id}?rel=0&modestbranding=1` : null;
    }
    if (h === "youtu.be") return `https://www.youtube-nocookie.com/embed/${u.pathname.slice(1)}?rel=0&modestbranding=1`;
    if (h === "vimeo.com") return `https://player.vimeo.com/video/${u.pathname.split("/").filter(Boolean)[0]}?dnt=1`;
    if (h === "player.vimeo.com") return url;
    return null;
  } catch {
    return null;
  }
}

export const BUCKET = "contenus";
export function cheminStorage(formationId: string, leconId: string, nomFichier: string) {
  const propre = nomFichier.normalize("NFD").replace(/[̀-ͯ]/g, "").replace(/[^a-zA-Z0-9._-]+/g, "-").slice(0, 100);
  return `formations/${formationId}/${leconId}/${Date.now()}-${propre}`;
}
