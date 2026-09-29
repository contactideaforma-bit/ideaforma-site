export type Role = "admin" | "eleve";

export type Profile = {
  id: string;
  email: string;
  prenom: string | null;
  nom: string | null;
  telephone: string | null;
  entreprise: string | null;
  role: Role;
  actif: boolean;
  created_at: string;
  updated_at: string;
};

export type Formation = {
  id: string;
  slug: string;
  titre: string;
  accroche: string | null;
  description: string | null;
  categorie: string;
  icone: string | null;
  duree_heures: number | null;
  duree_label: string | null;
  modalite: string | null;
  prix_ht: number | null;
  objectifs: string[];
  programme: string[];
  prerequis: string | null;
  public_vise: string | null;
  publie: boolean;
  ordre: number;
  created_at: string;
  updated_at: string;
};

export type Module = {
  id: string;
  formation_id: string;
  titre: string;
  description: string | null;
  ordre: number;
  duree_minutes: number | null;
  publie: boolean;
  created_at: string;
};

export type LeconType =
  | "video"
  | "slides"
  | "pdf"
  | "podcast"
  | "ebook"
  | "texte"
  | "quiz"
  | "evaluation";

export type Lecon = {
  id: string;
  module_id: string;
  titre: string;
  type: LeconType;
  contenu: Record<string, unknown>;
  storage_path: string | null;
  duree_minutes: number | null;
  ordre: number;
  publie: boolean;
  created_at: string;
};

export type InscriptionStatut = "active" | "terminee" | "suspendue";

export type Inscription = {
  id: string;
  eleve_id: string;
  formation_id: string;
  date_debut: string;
  date_fin: string | null;
  statut: InscriptionStatut;
  created_at: string;
};

export type Progression = {
  id: string;
  inscription_id: string;
  lecon_id: string;
  statut: "en_cours" | "termine";
  score: number | null;
  tentatives: number;
  termine_le: string | null;
  updated_at: string;
};

export type DemandeContact = {
  id: string;
  prenom: string;
  nom: string;
  email: string;
  telephone: string | null;
  entreprise: string | null;
  fonction: string | null;
  formation: string | null;
  participants: string | null;
  message: string;
  traitee: boolean;
  created_at: string;
};

export const CATEGORIES: { value: string; label: string; icone: string }[] = [
  { value: "management", label: "Management", icone: "users" },
  { value: "communication", label: "Communication", icone: "mic" },
  { value: "securite", label: "Sécurité", icone: "shield" },
  { value: "bureautique", label: "Bureautique", icone: "monitor" },
  { value: "projet", label: "Gestion de projet", icone: "folder" },
  { value: "rh", label: "RH", icone: "heart" },
  { value: "automobile", label: "Automobile", icone: "wrench" },
  { value: "ia", label: "Intelligence artificielle", icone: "brain" },
  { value: "autre", label: "Autre", icone: "graduation" },
];

export const TYPES_LECON: { value: LeconType; label: string; icone: string }[] = [
  { value: "video", label: "Vidéo", icone: "video" },
  { value: "slides", label: "Slides", icone: "presentation" },
  { value: "pdf", label: "Document PDF", icone: "file" },
  { value: "podcast", label: "Podcast audio", icone: "headphones" },
  { value: "ebook", label: "E-book", icone: "book" },
  { value: "texte", label: "Texte / cours", icone: "book-open" },
  { value: "quiz", label: "Quiz", icone: "help-circle" },
  { value: "evaluation", label: "Évaluation", icone: "flag" },
];

export function iconeCategorie(value: string): string {
  return CATEGORIES.find((c) => c.value === value)?.icone ?? "graduation";
}

export function libelleCategorie(value: string): string {
  return CATEGORIES.find((c) => c.value === value)?.label ?? value;
}

export function formatPrix(prix: number | null): string {
  if (prix === null || prix === undefined) return "Sur devis";
  return `${new Intl.NumberFormat("fr-FR").format(prix)} € HT`;
}

export function formatDate(iso: string | null): string {
  if (!iso) return "—";
  return new Intl.DateTimeFormat("fr-FR", { dateStyle: "medium" }).format(new Date(iso));
}
