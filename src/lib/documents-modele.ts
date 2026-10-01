/**
 * Modèle neutre des documents officiels : construit à partir d'un dossier d'inscription,
 * puis rendu en HTML (aperçu / impression) ou en PDF (pièce jointe aux e-mails).
 * Une seule source de vérité pour le contenu des trois documents.
 * Le balisage **gras** est accepté dans les textes.
 */
import { ORGANISME, MENTION_NDA } from "@/lib/organisme";
import type { DossierInscription, TypeDocument } from "@/lib/documents";
import { formatDateLongue, formatDateCourte, formatHeure, formatHeures, TYPES_DOCUMENT } from "@/lib/documents";

export type Bloc =
  | { type: "p"; texte: string }
  | { type: "h2"; texte: string }
  | { type: "identite"; lignes: { label: string; valeur: string }[] }
  | { type: "liste"; items: string[] }
  | { type: "table"; entetes?: string[]; lignes: string[][]; petit?: boolean }
  | { type: "note"; texte: string }
  | { type: "signature" };

export type ModeleDocument = {
  type: TypeDocument;
  libelle: string;
  titre: string;
  reference: string;
  numero: string | null;
  dateDoc: string;
  entete: { coordonnees: string[] };
  blocs: Bloc[];
  pied: string;
  /** Nom de fichier proposé pour le PDF. */
  nomFichier: string;
};

function nom(d: DossierInscription): string {
  return [d.eleve.prenom, d.eleve.nom].filter(Boolean).join(" ") || d.eleve.email;
}

function slug(s: string): string {
  return s.normalize("NFKD").replace(/[̀-ͯ]/g, "").toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "");
}

export function construireDocument(d: DossierInscription, type: TypeDocument, numero: string | null, dateDoc: string): ModeleDocument {
  const libelle = TYPES_DOCUMENT.find((x) => x.type === type)!.libelle;
  const base = {
    type, libelle, numero, dateDoc,
    entete: {
      coordonnees: [
        `${ORGANISME.raisonSociale} · ${ORGANISME.formeJuridique}`,
        ORGANISME.adresse,
        `SIRET ${ORGANISME.siret} · ${ORGANISME.rcs}`,
        `${ORGANISME.email} · ${ORGANISME.telephone}`,
      ],
    },
    pied: `${MENTION_NDA} Organisme certifié Qualiopi au titre des ${ORGANISME.qualiopi.categories} (certificat n° ${ORGANISME.qualiopi.numero}).`,
    nomFichier: `IDEAFORMA_${slug(libelle).slice(0, 40)}_${slug(nom(d))}${numero ? `_${numero}` : ""}.pdf`,
  };
  if (type === "attestation") return { ...base, ...attestation(d, dateDoc) };
  if (type === "certificat") return { ...base, ...certificat(d, dateDoc) };
  return { ...base, ...releve(d, dateDoc) };
}

type Corps = { titre: string; reference: string; blocs: Bloc[] };

function dureePrevue(d: DossierInscription): string {
  const f = d.formation;
  return f.duree_heures ? formatHeures(Number(f.duree_heures)) : (f.duree_label ?? "—");
}

function attestation(d: DossierInscription, dateDoc: string): Corps {
  const s = d.synthese;
  const f = d.formation;
  const lignes: { label: string; valeur: string }[] = [
    { label: "Stagiaire", valeur: `**${nom(d)}**` },
    ...(d.eleve.entreprise ? [{ label: "Entreprise", valeur: d.eleve.entreprise }] : []),
    { label: "Action de formation", valeur: `**${f.titre}**` },
    { label: "Nature de l'action", valeur: "Action de formation (C. trav. L6313-1, 1°)" },
    { label: "Modalité", valeur: "Formation à distance, asynchrone, sur la plateforme ideaforma.fr (vidéos, podcasts, cours écrits, cas pratiques, quiz, évaluation finale)" },
    { label: "Durée de l'action", valeur: dureePrevue(d) },
    { label: "Période", valeur: `du ${formatDateLongue(d.inscription.date_debut)} au ${formatDateLongue(s.dateFinReelle)}` },
  ];
  const resultats: string[][] = [
    ["Parcours réalisé", `${s.nbTerminees} leçons sur ${s.nbLecons} (${s.pourcentage} %) — ${formatHeures(s.heuresRealisees)} réalisées sur ${dureePrevue(d)}`],
    ...s.quizModules.map((q) => [q.titre, q.meilleurScore === null ? "non passé" : `${q.meilleurScore} % — ${q.reussi ? "validé" : "non validé"} (${q.tentatives} tentative${q.tentatives > 1 ? "s" : ""})`]),
    ["**Évaluation finale**", `**${s.evaluationFinale ? `${s.evaluationFinale.score} % — ${s.evaluationFinale.reussi ? "acquis" : "non acquis"} (le ${formatDateCourte(s.evaluationFinale.date)})` : "non passée"}**`],
  ];
  return {
    titre: "Attestation de fin de formation",
    reference: "Établie en application des articles L6353-1 et D6313-3-1 du Code du travail",
    blocs: [
      { type: "p", texte: `Je soussignée, ${ORGANISME.signataire.nom}, ${ORGANISME.signataire.qualite} de ${ORGANISME.raisonSociale}, organisme de formation, atteste que :` },
      { type: "identite", lignes },
      { type: "h2", texte: "Objectifs de la formation" },
      f.objectifs?.length
        ? { type: "liste", items: f.objectifs }
        : { type: "p", texte: "Organiser, animer et piloter le travail d'une équipe en adoptant une posture d'encadrement constructive, respectueuse du cadre légal et adaptée aux personnes." },
      { type: "h2", texte: "Résultats de l'évaluation des acquis" },
      { type: "table", entetes: ["Élément", "Résultat"], lignes: resultats },
      { type: "note", texte: "Seuil de validation des quiz et de l'évaluation finale : 70 % de bonnes réponses. Les carnets de bord d'application à la situation du stagiaire sont conservés par celui-ci." },
      { type: "p", texte: "Cette attestation est délivrée au stagiaire pour servir et valoir ce que de droit. Elle ne constitue pas une certification professionnelle." },
      { type: "signature" },
    ],
  };
}

function certificat(d: DossierInscription, dateDoc: string): Corps {
  const s = d.synthese;
  const f = d.formation;
  return {
    titre: "Certificat de réalisation",
    reference: "Modèle établi par le ministère du Travail pour les actions concourant au développement des compétences (C. trav. L6313-1)",
    blocs: [
      { type: "p", texte: `Je soussignée, **${ORGANISME.signataire.nom}**, représentante légale du dispensateur de l'action **${ORGANISME.raisonSociale}** (SIRET ${ORGANISME.siret}, NDA ${ORGANISME.nda}), atteste que :` },
      { type: "identite", lignes: [
        { label: "Bénéficiaire", valeur: `**${nom(d)}**${d.eleve.entreprise ? `, salarié(e) de l'entreprise ${d.eleve.entreprise}` : ""}` },
        { label: "Nature de l'action", valeur: "Action de formation" },
        { label: "Intitulé", valeur: `**${f.titre}**` },
        { label: "Modalité", valeur: "Formation à distance (plateforme ideaforma.fr)" },
        { label: "Dates de réalisation", valeur: `du ${formatDateCourte(d.inscription.date_debut)} au ${formatDateCourte(s.dateFinReelle)}` },
        { label: "Durée", valeur: `${formatHeures(s.heuresRealisees)} réalisées${f.duree_heures ? ` sur ${formatHeures(Number(f.duree_heures))} prévues` : ""}` },
      ] },
      { type: "p", texte: "a suivi l'action ci-dessus. La réalisation de la formation à distance est justifiée par le relevé de connexion et de progression de la plateforme et par les résultats des évaluations (travaux réalisés), conservés par l'organisme et tenus à disposition du financeur." },
      { type: "note", texte: "Sans préjudice des délais imposés par les règles fiscales, comptables ou commerciales, le dispensateur conserve les pièces justificatives de la réalisation de l'action pendant trois ans (C. trav. R6332-26)." },
      { type: "signature" },
    ],
  };
}

function releve(d: DossierInscription, dateDoc: string): Corps {
  const s = d.synthese;
  const f = d.formation;
  const infoLecon = new Map(d.modules.flatMap((m) => m.lecons.map((l) => [l.id, { titre: l.titre, duree: l.duree_minutes ?? 0 }] as const)));
  const libelleEvt = (e: DossierInscription["journal"][number]) => {
    const l = e.lecon_id ? infoLecon.get(e.lecon_id) : null;
    if (e.type === "connexion") return "Connexion à la plateforme";
    if (e.type === "ouverture") return `Ouverture : ${l?.titre ?? "leçon"}`;
    if (e.type === "fin_lecon") return `Leçon terminée : ${l?.titre ?? "leçon"}${l?.duree ? ` (${l.duree} min)` : ""}`;
    if (e.type === "quiz") { const m = e.meta as { score?: number; reussi?: boolean }; return `Quiz : ${l?.titre ?? ""} — ${m.score ?? "?"} % ${m.reussi ? "(validé)" : "(non validé)"}`; }
    return e.type;
  };
  let jourPrecedent = "";
  const journal: string[][] = d.journal.map((e) => {
    const jour = formatDateCourte(e.created_at);
    const afficher = jour !== jourPrecedent ? jour : "";
    jourPrecedent = jour;
    return [afficher, formatHeure(e.created_at), libelleEvt(e)];
  });

  const modules: string[][] = d.modules.map((m) => {
    const pub = m.lecons.filter((l) => l.publie);
    const done = pub.filter((l) => d.progression.some((p) => p.lecon_id === l.id && p.statut === "termine")).length;
    const q = s.quizModules.find((x) => x.module === m.titre);
    return [m.titre, `${done} / ${pub.length}`, q ? (q.meilleurScore === null ? "non passé" : `${q.meilleurScore} % ${q.reussi ? "validé" : "non validé"}`) : "—"];
  });

  return {
    titre: "Relevé de connexion et de progression",
    reference: "Justificatif d'assiduité d'une formation à distance (C. trav. D6313-3-1 : travaux réalisés et suivi de l'assiduité)",
    blocs: [
      { type: "identite", lignes: [
        { label: "Stagiaire", valeur: `**${nom(d)}** · ${d.eleve.email}` },
        { label: "Formation", valeur: `**${f.titre}**${f.duree_heures ? ` — ${formatHeures(Number(f.duree_heures))}` : ""}` },
        { label: "Accès ouvert", valeur: `du ${formatDateCourte(d.inscription.date_debut)} ${d.inscription.date_fin ? `au ${formatDateCourte(d.inscription.date_fin)}` : "(sans limite)"}` },
        { label: "Relevé établi le", valeur: formatDateLongue(dateDoc) },
      ] },
      { type: "h2", texte: "Synthèse" },
      { type: "table", lignes: [
        ["Première activité", s.premiereActivite ? `${formatDateCourte(s.premiereActivite)} à ${formatHeure(s.premiereActivite)}` : "—"],
        ["Dernière activité", s.derniereActivite ? `${formatDateCourte(s.derniereActivite)} à ${formatHeure(s.derniereActivite)}` : "—"],
        ["Connexions enregistrées", String(s.nbConnexions)],
        ["Jours d'activité distincts", String(s.nbJoursActifs)],
        ["Leçons terminées", `${s.nbTerminees} / ${s.nbLecons} (${s.pourcentage} %)`],
        ["Durée réalisée (somme des durées des leçons terminées)", `${formatHeures(s.heuresRealisees)}${f.duree_heures ? ` sur ${formatHeures(Number(f.duree_heures))}` : ""}`],
        ["Évaluation finale", s.evaluationFinale ? `${s.evaluationFinale.score} % — ${s.evaluationFinale.reussi ? "acquis" : "non acquis"}` : "non passée"],
      ] },
      { type: "h2", texte: "Progression par module" },
      { type: "table", entetes: ["Module", "Leçons terminées", "Quiz"], lignes: modules },
      { type: "h2", texte: "Journal d'activité" },
      journal.length
        ? { type: "table", entetes: ["Date", "Heure", "Événement"], lignes: journal, petit: true }
        : { type: "note", texte: "Aucun événement enregistré pour cette inscription (le journal a été mis en place après le début de l'accès, ou le stagiaire ne s'est pas encore connecté)." },
      { type: "note", texte: "Les horodatages sont enregistrés par la plateforme (heure de Paris). La durée réalisée est calculée à partir des durées pédagogiques des leçons terminées, et non du temps de connexion, conformément à la logique de la formation à distance asynchrone." },
      { type: "signature" },
    ],
  };
}

/** Découpe « texte **gras** texte » en segments. */
export function segments(texte: string): { texte: string; gras: boolean }[] {
  return texte.split(/(\*\*[^*]+\*\*)/g).filter(Boolean).map((p) =>
    p.startsWith("**") && p.endsWith("**") ? { texte: p.slice(2, -2), gras: true } : { texte: p, gras: false }
  );
}
