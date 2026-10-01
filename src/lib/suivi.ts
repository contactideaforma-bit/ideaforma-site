/**
 * Suivi pédagogique : à partir d'une ligne de la vue v_suivi, calcule l'état d'une inscription
 * et l'action conseillée, pour la liste des élèves et le tableau de bord.
 */
export type LigneSuivi = {
  inscription_id: string;
  eleve_id: string;
  formation_id: string;
  statut: string;
  date_debut: string;
  date_fin: string | null;
  prochain_contact: string | null;
  note_suivi: string | null;
  nb_lecons: number | null;
  nb_terminees: number | null;
  pourcentage: number | null;
  derniere_activite: string | null;
  nb_connexions: number | null;
  attestation_emise: boolean;
  certificat_emis: boolean;
  releve_emis: boolean;
  dernier_envoi: string | null;
};

export type Alerte = {
  code: "contact" | "documents" | "inactif" | "jamais" | "echeance" | "ok" | "termine" | "suspendue";
  libelle: string;
  /** 3 = à traiter aujourd'hui, 2 = à surveiller, 1 = information, 0 = rien à faire. */
  priorite: 0 | 1 | 2 | 3;
  badge: "badge-orange" | "badge-blue" | "badge-green" | "badge-grey";
};

/** Jours d'inactivité à partir desquels on propose une relance. */
export const SEUIL_INACTIVITE_JOURS = 14;
/** Jours après l'ouverture de l'accès sans aucune connexion. */
export const SEUIL_JAMAIS_CONNECTE_JOURS = 7;
/** Jours avant la fin d'accès pour alerter si le parcours n'est pas terminé. */
export const SEUIL_ECHEANCE_JOURS = 15;

function joursDepuis(date: string, aujourdhui: Date): number {
  return Math.floor((aujourdhui.getTime() - new Date(date).getTime()) / 86_400_000);
}

export function evaluerSuivi(l: LigneSuivi, aujourdhui = new Date()): Alerte {
  const auj = aujourdhui.toISOString().slice(0, 10);
  const pct = l.pourcentage ?? 0;
  if (l.statut === "suspendue") return { code: "suspendue", libelle: "Suspendue", priorite: 0, badge: "badge-grey" };
  if (l.prochain_contact && l.prochain_contact <= auj) {
    return { code: "contact", libelle: l.prochain_contact === auj ? "Échange prévu aujourd'hui" : "Échange en retard", priorite: 3, badge: "badge-orange" };
  }
  if (pct >= 100 && !(l.attestation_emise && l.certificat_emis)) {
    return { code: "documents", libelle: "Parcours terminé — documents à envoyer", priorite: 3, badge: "badge-orange" };
  }
  if (pct >= 100) return { code: "termine", libelle: "Terminé — documents envoyés", priorite: 0, badge: "badge-green" };
  if (l.statut === "terminee") return { code: "termine", libelle: "Clôturée", priorite: 0, badge: "badge-grey" };
  if (!l.derniere_activite) {
    const j = joursDepuis(l.date_debut, aujourdhui);
    if (j >= SEUIL_JAMAIS_CONNECTE_JOURS) return { code: "jamais", libelle: `Jamais connecté (${j} j)`, priorite: 3, badge: "badge-orange" };
    return { code: "ok", libelle: "Accès ouvert, pas encore connecté", priorite: 1, badge: "badge-blue" };
  }
  const inactif = joursDepuis(l.derniere_activite, aujourdhui);
  if (inactif >= SEUIL_INACTIVITE_JOURS) return { code: "inactif", libelle: `Inactif depuis ${inactif} j`, priorite: 2, badge: "badge-orange" };
  if (l.date_fin) {
    const reste = -joursDepuis(l.date_fin, aujourdhui);
    if (reste >= 0 && reste <= SEUIL_ECHEANCE_JOURS) return { code: "echeance", libelle: `Fin d'accès dans ${reste} j`, priorite: 2, badge: "badge-orange" };
  }
  return { code: "ok", libelle: "En cours", priorite: 0, badge: "badge-blue" };
}

/** Texte court « il y a X » pour une date ISO. */
export function depuis(date: string | null, aujourdhui = new Date()): string {
  if (!date) return "jamais";
  const j = joursDepuis(date, aujourdhui);
  if (j <= 0) return "aujourd'hui";
  if (j === 1) return "hier";
  if (j < 30) return `il y a ${j} j`;
  if (j < 365) return `il y a ${Math.floor(j / 30)} mois`;
  return `il y a ${Math.floor(j / 365)} an${j >= 730 ? "s" : ""}`;
}
