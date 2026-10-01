/**
 * Identité légale d'IDEAFORMA, utilisée sur les documents officiels (attestations, certificats, relevés).
 * Sources : extrait Kbis (RCS Nanterre), fiche UAI, certificat Qualiopi. À mettre à jour si l'un de ces éléments change.
 */
export const ORGANISME = {
  raisonSociale: "IDEAFORMA",
  formeJuridique: "SAS à associé unique au capital de 100 €",
  siret: "993 125 335 00014",
  rcs: "RCS Nanterre 993 125 335",
  adresse: "144 avenue Charles de Gaulle, 92200 Neuilly-sur-Seine",
  ville: "Neuilly-sur-Seine",
  telephone: "06 25 16 13 93",
  email: "contact@ideaforma.fr",
  site: "ideaforma.fr",
  /** Numéro de déclaration d'activité (NDA). */
  nda: "11922999392",
  prefetRegion: "préfet de la région Île-de-France",
  uai: "0923466T",
  qualiopi: { numero: "26-027-04", categories: "actions de formation" },
  signataire: { nom: "Myriam Ayouaz", qualite: "Présidente" },
} as const;

export const MENTION_NDA = `Déclaration d'activité enregistrée sous le numéro ${ORGANISME.nda} auprès du ${ORGANISME.prefetRegion}. Cet enregistrement ne vaut pas agrément de l'État.`;
