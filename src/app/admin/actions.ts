"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { requireAdmin } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { createAdminClient } from "@/lib/supabase/admin";
import { envoyerMail, destinataireContact, genererMotDePasse, mailBienvenue, mailNouveauMotDePasse, mailPersonnalise, type FormationAttribuee } from "@/lib/mail";
import { chargerDossier, donneesFigees, TYPES_DOCUMENT, type TypeDocument } from "@/lib/documents";
import { construireDocument } from "@/lib/documents-modele";
import { genererPdf } from "@/lib/documents-pdf";

/* ───────────────────────── helpers ───────────────────────── */

const s = (fd: FormData, k: string, max = 500) => String(fd.get(k) ?? "").trim().slice(0, max);
const sOrNull = (fd: FormData, k: string, max = 500) => s(fd, k, max) || null;
const num = (fd: FormData, k: string) => {
  const v = s(fd, k, 30).replace(",", ".");
  if (!v) return null;
  const n = Number(v);
  return Number.isFinite(n) ? n : null;
};
const lignes = (fd: FormData, k: string) =>
  s(fd, k, 5000).split("\n").map((l) => l.trim()).filter(Boolean);
const slugify = (t: string) =>
  t.normalize("NFD").replace(/[̀-ͯ]/g, "").toLowerCase()
    .replace(/[^a-z0-9]+/g, "-").replace(/^-+|-+$/g, "").slice(0, 80) || "formation";

export type EtatCreationEleve = {
  ok?: boolean;
  erreur?: string;
  eleveId?: string;
  email?: string;
  motDePasse?: string;
  mailEnvoye?: boolean;
  raisonMail?: string;
};

export type EtatSimple = { ok?: boolean; erreur?: string; message?: string; motDePasse?: string };

/* ───────────────────────── élèves ───────────────────────── */

export async function creerEleve(_prev: EtatCreationEleve, fd: FormData): Promise<EtatCreationEleve> {
  const admin = await requireAdmin();
  const email = s(fd, "email", 160).toLowerCase();
  const prenom = sOrNull(fd, "prenom", 80);
  const nom = sOrNull(fd, "nom", 80);
  const telephone = sOrNull(fd, "telephone", 40);
  const entreprise = sOrNull(fd, "entreprise", 120);
  const envoyerMailBienvenue = fd.get("envoyer_mail") === "on";
  const formationId = sOrNull(fd, "formation_id", 60);
  const dateDebut = sOrNull(fd, "date_debut", 10);
  const dateFin = sOrNull(fd, "date_fin", 10);

  if (!/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(email)) return { erreur: "Adresse e-mail invalide." };
  if (!nom) return { erreur: "Le nom est obligatoire." };

  const motDePasse = genererMotDePasse();
  const supaAdmin = createAdminClient();

  const { data: created, error } = await supaAdmin.auth.admin.createUser({
    email,
    password: motDePasse,
    email_confirm: true,
    user_metadata: { prenom, nom, telephone, entreprise, role: "eleve" },
  });
  if (error || !created.user) {
    const msg = error?.message ?? "";
    return {
      erreur: /already|exists|registered/i.test(msg)
        ? "Un compte existe déjà avec cet e-mail."
        : `Création impossible : ${msg}`,
    };
  }
  const eleveId = created.user.id;

  // Le trigger a créé le profil ; on force les champs au cas où (et on garantit le rôle élève)
  await supaAdmin.from("profiles").upsert({
    id: eleveId, email, prenom, nom, telephone, entreprise, role: "eleve", actif: true,
  });

  if (formationId) {
    await supaAdmin.from("inscriptions").insert({
      eleve_id: eleveId,
      formation_id: formationId,
      date_debut: dateDebut ?? new Date().toISOString().slice(0, 10),
      date_fin: dateFin,
      created_by: admin.id,
    });
  }

  let mailEnvoye = false;
  let raisonMail: string | undefined;
  if (envoyerMailBienvenue) {
    let formationsMail: FormationAttribuee[] = [];
    if (formationId) {
      const { data: f } = await supaAdmin.from("formations").select("titre").eq("id", formationId).maybeSingle();
      if (f) formationsMail = [{ titre: (f as { titre: string }).titre, date_debut: dateDebut, date_fin: dateFin }];
    }
    const m = mailBienvenue({ prenom, email, motDePasse, formations: formationsMail, message: sOrNull(fd, "message", 4000) });
    const r = await envoyerMail({ to: email, ...m });
    mailEnvoye = r.ok;
    if (!r.ok) raisonMail = r.raison;
  }

  revalidatePath("/admin");
  revalidatePath("/admin/eleves");
  return { ok: true, eleveId, email, motDePasse, mailEnvoye, raisonMail };
}

export async function modifierEleve(id: string, fd: FormData): Promise<void> {
  await requireAdmin();
  const supabase = await createClient();
  await supabase
    .from("profiles")
    .update({
      prenom: sOrNull(fd, "prenom", 80),
      nom: sOrNull(fd, "nom", 80),
      telephone: sOrNull(fd, "telephone", 40),
      entreprise: sOrNull(fd, "entreprise", 120),
    })
    .eq("id", id)
    .eq("role", "eleve");
  revalidatePath(`/admin/eleves/${id}`);
  revalidatePath("/admin/eleves");
}

export async function basculerActif(id: string, actif: boolean): Promise<void> {
  const admin = await requireAdmin();
  if (id === admin.id) return;
  const supabase = await createClient();
  await supabase.from("profiles").update({ actif }).eq("id", id);
  revalidatePath(`/admin/eleves/${id}`);
  revalidatePath("/admin/eleves");
}

export async function regenererMotDePasse(id: string, envoyer: boolean): Promise<EtatSimple> {
  await requireAdmin();
  const supaAdmin = createAdminClient();
  const { data: profil } = await supaAdmin.from("profiles").select("email, prenom").eq("id", id).maybeSingle();
  if (!profil) return { erreur: "Élève introuvable." };

  const motDePasse = genererMotDePasse();
  const { error } = await supaAdmin.auth.admin.updateUserById(id, { password: motDePasse });
  if (error) return { erreur: `Impossible de changer le mot de passe : ${error.message}` };

  if (envoyer) {
    const m = mailNouveauMotDePasse({ prenom: profil.prenom, email: profil.email, motDePasse });
    const r = await envoyerMail({ to: profil.email, ...m });
    if (!r.ok) return { ok: true, motDePasse, message: `Mot de passe changé mais e-mail non envoyé (${r.raison}). Transmettez-le manuellement.` };
    return { ok: true, motDePasse, message: `Nouveau mot de passe envoyé à ${profil.email}.` };
  }
  return { ok: true, motDePasse, message: "Nouveau mot de passe généré. Transmettez-le à l'élève." };
}

export type EtatMailEleve = { ok?: boolean; erreur?: string; message?: string; motDePasse?: string };

/**
 * E-mail personnalisé à un élève depuis sa fiche (bienvenue, relance, information).
 * Si "nouveaux_identifiants" est coché, un nouveau mot de passe est généré et inclus dans l'e-mail.
 */
export async function envoyerMailEleve(eleveId: string, _prev: EtatMailEleve, fd: FormData): Promise<EtatMailEleve> {
  await requireAdmin();
  const sujet = s(fd, "sujet", 200);
  const message = s(fd, "message", 6000);
  const nouveauxIdentifiants = fd.get("nouveaux_identifiants") === "on";
  if (!sujet) return { erreur: "L'objet est obligatoire." };
  if (!message) return { erreur: "Le message est vide." };

  const supaAdmin = createAdminClient();
  const { data: profil } = await supaAdmin.from("profiles").select("email, prenom").eq("id", eleveId).eq("role", "eleve").maybeSingle();
  if (!profil) return { erreur: "Élève introuvable." };

  let motDePasse: string | undefined;
  if (nouveauxIdentifiants) {
    motDePasse = genererMotDePasse();
    const { error } = await supaAdmin.auth.admin.updateUserById(eleveId, { password: motDePasse });
    if (error) return { erreur: `Impossible de générer le mot de passe : ${error.message}` };
  }

  const m = mailPersonnalise({ sujet, message, email: profil.email, motDePasse });
  const r = await envoyerMail({ to: profil.email, ...m });
  if (!r.ok) {
    return {
      erreur: motDePasse
        ? `E-mail non envoyé (${r.raison}). Le mot de passe a tout de même été changé : ${motDePasse}`
        : `E-mail non envoyé (${r.raison}).`,
      motDePasse,
    };
  }
  return { ok: true, message: `E-mail envoyé à ${profil.email}.`, motDePasse };
}

export async function supprimerEleve(id: string): Promise<void> {
  const admin = await requireAdmin();
  if (id === admin.id) return;
  const supaAdmin = createAdminClient();
  const { data: profil } = await supaAdmin.from("profiles").select("role").eq("id", id).maybeSingle();
  if (!profil || profil.role === "admin") return;
  await supaAdmin.auth.admin.deleteUser(id); // cascade : profiles, inscriptions, progression
  revalidatePath("/admin/eleves");
  redirect("/admin/eleves");
}

/* ───────────────────────── inscriptions ───────────────────────── */

export async function inscrire(eleveId: string, fd: FormData): Promise<void> {
  const admin = await requireAdmin();
  const formationId = s(fd, "formation_id", 60);
  if (!formationId) return;
  const supabase = await createClient();
  await supabase.from("inscriptions").upsert(
    {
      eleve_id: eleveId,
      formation_id: formationId,
      date_debut: sOrNull(fd, "date_debut", 10) ?? new Date().toISOString().slice(0, 10),
      date_fin: sOrNull(fd, "date_fin", 10),
      statut: "active",
      created_by: admin.id,
    },
    { onConflict: "eleve_id,formation_id" }
  );
  revalidatePath(`/admin/eleves/${eleveId}`);
  revalidatePath("/admin");
}

export async function modifierInscription(id: string, eleveId: string, fd: FormData): Promise<void> {
  await requireAdmin();
  const statut = s(fd, "statut", 20);
  const supabase = await createClient();
  await supabase
    .from("inscriptions")
    .update({
      statut: ["active", "terminee", "suspendue"].includes(statut) ? statut : "active",
      date_debut: sOrNull(fd, "date_debut", 10) ?? undefined,
      date_fin: sOrNull(fd, "date_fin", 10),
    })
    .eq("id", id);
  revalidatePath(`/admin/eleves/${eleveId}`);
}

export async function supprimerInscription(id: string, eleveId: string): Promise<void> {
  await requireAdmin();
  const supabase = await createClient();
  await supabase.from("inscriptions").delete().eq("id", id);
  revalidatePath(`/admin/eleves/${eleveId}`);
  revalidatePath("/admin");
}

/* ───────────────────────── formations ───────────────────────── */

function champsFormation(fd: FormData) {
  const titre = s(fd, "titre", 160);
  return {
    titre,
    accroche: sOrNull(fd, "accroche", 400),
    description: sOrNull(fd, "description", 5000),
    categorie: s(fd, "categorie", 40) || "autre",
    icone: sOrNull(fd, "icone", 40) ?? "graduation",
    duree_heures: num(fd, "duree_heures"),
    duree_label: sOrNull(fd, "duree_label", 60),
    modalite: sOrNull(fd, "modalite", 80),
    prix_ht: num(fd, "prix_ht"),
    objectifs: lignes(fd, "objectifs"),
    programme: lignes(fd, "programme"),
    prerequis: sOrNull(fd, "prerequis", 1000),
    public_vise: sOrNull(fd, "public_vise", 1000),
    publie: fd.get("publie") === "on",
    ordre: num(fd, "ordre") ?? 0,
  };
}

export async function creerFormation(_prev: EtatSimple, fd: FormData): Promise<EtatSimple> {
  await requireAdmin();
  const champs = champsFormation(fd);
  if (!champs.titre) return { erreur: "Le titre est obligatoire." };
  const supabase = await createClient();
  const base = slugify(champs.titre);
  const slug = `${base}-${Math.random().toString(36).slice(2, 6)}`;
  const { data, error } = await supabase.from("formations").insert({ ...champs, slug }).select("id").single();
  if (error || !data) return { erreur: `Création impossible : ${error?.message}` };
  revalidatePath("/admin/formations");
  revalidatePath("/formations");
  revalidatePath("/");
  redirect(`/admin/formations/${data.id}`);
}

export async function modifierFormation(id: string, _prev: EtatSimple, fd: FormData): Promise<EtatSimple> {
  await requireAdmin();
  const champs = champsFormation(fd);
  if (!champs.titre) return { erreur: "Le titre est obligatoire." };
  const supabase = await createClient();
  const { error } = await supabase.from("formations").update(champs).eq("id", id);
  if (error) return { erreur: `Enregistrement impossible : ${error.message}` };
  revalidatePath(`/admin/formations/${id}`);
  revalidatePath("/admin/formations");
  revalidatePath("/formations");
  revalidatePath("/");
  return { ok: true, message: "Formation enregistrée." };
}

export async function supprimerFormation(id: string): Promise<void> {
  await requireAdmin();
  const supabase = await createClient();
  await supabase.from("formations").delete().eq("id", id);
  revalidatePath("/admin/formations");
  revalidatePath("/formations");
  redirect("/admin/formations");
}

/* ───────────────────────── modules & leçons ───────────────────────── */

export async function ajouterModule(formationId: string, fd: FormData): Promise<void> {
  await requireAdmin();
  const titre = s(fd, "titre", 160);
  if (!titre) return;
  const supabase = await createClient();
  const { data: dernier } = await supabase
    .from("modules").select("ordre").eq("formation_id", formationId).order("ordre", { ascending: false }).limit(1).maybeSingle();
  await supabase.from("modules").insert({
    formation_id: formationId,
    titre,
    description: sOrNull(fd, "description", 1000),
    duree_minutes: num(fd, "duree_minutes"),
    ordre: (dernier?.ordre ?? 0) + 1,
  });
  revalidatePath(`/admin/formations/${formationId}`);
}

export async function modifierModule(id: string, formationId: string, fd: FormData): Promise<void> {
  await requireAdmin();
  const supabase = await createClient();
  await supabase.from("modules").update({
    titre: s(fd, "titre", 160) || undefined,
    description: sOrNull(fd, "description", 1000),
    duree_minutes: num(fd, "duree_minutes"),
    publie: fd.get("publie") === "on",
  }).eq("id", id);
  revalidatePath(`/admin/formations/${formationId}`);
}

export async function deplacerModule(id: string, formationId: string, sens: "haut" | "bas"): Promise<void> {
  await requireAdmin();
  const supabase = await createClient();
  const { data } = await supabase.from("modules").select("id, ordre").eq("formation_id", formationId).order("ordre");
  const mods = (data ?? []) as { id: string; ordre: number }[];
  const i = mods.findIndex((m) => m.id === id);
  const j = sens === "haut" ? i - 1 : i + 1;
  if (i < 0 || j < 0 || j >= mods.length) return;
  // Renumérote proprement 1..n après échange
  const ordre = mods.map((m) => m.id);
  [ordre[i], ordre[j]] = [ordre[j], ordre[i]];
  await Promise.all(ordre.map((mid, idx) => supabase.from("modules").update({ ordre: idx + 1 }).eq("id", mid)));
  revalidatePath(`/admin/formations/${formationId}`);
}

export async function supprimerModule(id: string, formationId: string): Promise<void> {
  await requireAdmin();
  const supabase = await createClient();
  await supabase.from("modules").delete().eq("id", id);
  revalidatePath(`/admin/formations/${formationId}`);
}

export async function ajouterLecon(moduleId: string, formationId: string, fd: FormData): Promise<void> {
  await requireAdmin();
  const titre = s(fd, "titre", 160);
  if (!titre) return;
  const supabase = await createClient();
  const { data: dernier } = await supabase
    .from("lecons").select("ordre").eq("module_id", moduleId).order("ordre", { ascending: false }).limit(1).maybeSingle();
  await supabase.from("lecons").insert({
    module_id: moduleId,
    titre,
    type: s(fd, "type", 20) || "texte",
    duree_minutes: num(fd, "duree_minutes"),
    ordre: (dernier?.ordre ?? 0) + 1,
  });
  revalidatePath(`/admin/formations/${formationId}`);
}

export async function supprimerLecon(id: string, formationId: string): Promise<void> {
  await requireAdmin();
  const supabase = await createClient();
  await supabase.from("lecons").delete().eq("id", id);
  revalidatePath(`/admin/formations/${formationId}`);
}

/* ───────────────────────── demandes de contact ───────────────────────── */

export async function marquerDemande(id: string, traitee: boolean): Promise<void> {
  await requireAdmin();
  const supabase = await createClient();
  await supabase.from("demandes_contact").update({ traitee }).eq("id", id);
  revalidatePath("/admin/demandes");
  revalidatePath("/admin");
}

export async function supprimerDemande(id: string): Promise<void> {
  await requireAdmin();
  const supabase = await createClient();
  await supabase.from("demandes_contact").delete().eq("id", id);
  revalidatePath("/admin/demandes");
  revalidatePath("/admin");
}

/* ───────────────────────── contenu des leçons (étape 2) ───────────────────────── */

export async function modifierLecon(id: string, formationId: string, _prev: EtatSimple, fd: FormData): Promise<EtatSimple> {
  await requireAdmin();
  const titre = s(fd, "titre", 160);
  if (!titre) return { erreur: "Le titre est obligatoire." };
  let contenu: Record<string, unknown> = {};
  try {
    contenu = JSON.parse(s(fd, "contenu_json", 200000) || "{}");
  } catch {
    return { erreur: "Contenu invalide." };
  }
  const supabase = await createClient();
  const { error } = await supabase
    .from("lecons")
    .update({
      titre,
      type: s(fd, "type", 20) || "texte",
      duree_minutes: num(fd, "duree_minutes"),
      publie: fd.get("publie") === "on",
      contenu,
      storage_path: typeof contenu.storage_path === "string" ? contenu.storage_path : null,
    })
    .eq("id", id);
  if (error) return { erreur: `Enregistrement impossible : ${error.message}` };
  revalidatePath(`/admin/formations/${formationId}`);
  revalidatePath(`/admin/formations/${formationId}/lecons/${id}`);
  return { ok: true, message: "Leçon enregistrée." };
}

export async function deplacerLecon(id: string, moduleId: string, formationId: string, sens: "haut" | "bas"): Promise<void> {
  await requireAdmin();
  const supabase = await createClient();
  const { data } = await supabase.from("lecons").select("id, ordre").eq("module_id", moduleId).order("ordre");
  const lecs = (data ?? []) as { id: string; ordre: number }[];
  const i = lecs.findIndex((l) => l.id === id);
  const j = sens === "haut" ? i - 1 : i + 1;
  if (i < 0 || j < 0 || j >= lecs.length) return;
  const ordre = lecs.map((l) => l.id);
  [ordre[i], ordre[j]] = [ordre[j], ordre[i]];
  await Promise.all(ordre.map((lid, idx) => supabase.from("lecons").update({ ordre: idx + 1 }).eq("id", lid)));
  revalidatePath(`/admin/formations/${formationId}`);
}

/** URL signée (lecture) d'un fichier du bucket privé, pour l'aperçu admin. */
export async function urlSigneeAdmin(storagePath: string): Promise<string | null> {
  await requireAdmin();
  const supabase = await createClient();
  const { data } = await supabase.storage.from("contenus").createSignedUrl(storagePath, 60 * 30);
  return data?.signedUrl ?? null;
}

/* ───────────────────────── documents officiels ───────────────────────── */

export type EtatDocument = { ok?: boolean; erreur?: string; numero?: string };

/** Attribue un numéro officiel et enregistre le document dans le registre. */
async function emettre(adminId: string, inscriptionId: string, eleveId: string, type: TypeDocument, donnees: Record<string, unknown>): Promise<{ numero: string; emis_le: string } | { erreur: string }> {
  const supabase = await createClient();
  const { data: numero, error: e1 } = await supabase.rpc("prochain_numero_document");
  if (e1 || !numero) return { erreur: `Numérotation impossible : ${e1?.message ?? "inconnu"}` };
  const { data, error } = await supabase.from("documents_emis")
    .insert({ numero, type, inscription_id: inscriptionId, eleve_id: eleveId, emis_par: adminId, donnees })
    .select("numero, emis_le").single();
  if (error || !data) return { erreur: `Enregistrement impossible : ${error?.message ?? "inconnu"}` };
  return data as { numero: string; emis_le: string };
}

/**
 * Émet un document officiel (attestation, certificat, relevé) : attribue un numéro séquentiel
 * IDF-AAAA-NNNN et fige les données affichées, pour pouvoir le rééditer à l'identique.
 */
export async function emettreDocument(inscriptionId: string, type: TypeDocument, donnees: Record<string, unknown>): Promise<EtatDocument> {
  const admin = await requireAdmin();
  const supabase = await createClient();
  const { data: insc } = await supabase.from("inscriptions").select("id, eleve_id").eq("id", inscriptionId).maybeSingle();
  if (!insc) return { erreur: "Inscription introuvable." };
  const eleveId = (insc as { eleve_id: string }).eleve_id;
  const r = await emettre(admin.id, inscriptionId, eleveId, type, donnees);
  if ("erreur" in r) return { erreur: r.erreur };
  revalidatePath(`/documents/${inscriptionId}/${type}`);
  revalidatePath(`/admin/eleves/${eleveId}`);
  return { ok: true, numero: r.numero };
}

export type EtatEnvoiDocuments = { ok?: boolean; erreur?: string; message?: string };

/**
 * Envoie à l'élève, en pièces jointes PDF, les documents cochés. Un document non encore émis
 * reçoit son numéro officiel au moment de l'envoi (on n'envoie jamais de brouillon).
 */
export async function envoyerDocuments(inscriptionId: string, _prev: EtatEnvoiDocuments, fd: FormData): Promise<EtatEnvoiDocuments> {
  const admin = await requireAdmin();
  const types = fd.getAll("documents").map(String).filter((t): t is TypeDocument => TYPES_DOCUMENT.some((x) => x.type === t));
  const sujet = s(fd, "sujet", 200);
  const message = s(fd, "message", 6000);
  const copie = fd.get("copie") === "on";
  if (types.length === 0) return { erreur: "Sélectionnez au moins un document." };
  if (!sujet) return { erreur: "L'objet est obligatoire." };
  if (!message) return { erreur: "Le message est vide." };

  const d = await chargerDossier(inscriptionId);
  if (!d) return { erreur: "Inscription introuvable." };

  const pieces: { filename: string; content: Buffer }[] = [];
  const numeros: string[] = [];
  const donnees = donneesFigees(d);
  for (const type of types) {
    let emis = d.documents.find((x) => x.type === type) ?? null;
    if (!emis) {
      const r = await emettre(admin.id, inscriptionId, d.eleve.id, type, donnees);
      if ("erreur" in r) return { erreur: r.erreur };
      emis = { id: "", numero: r.numero, type, emis_le: r.emis_le, donnees };
      d.documents.push(emis);
    }
    const modele = construireDocument(d, type, emis.numero, emis.emis_le);
    try {
      pieces.push({ filename: modele.nomFichier, content: await genererPdf(modele) });
    } catch (e) {
      return { erreur: `Génération du PDF impossible (${modele.libelle}) : ${e instanceof Error ? e.message : "erreur"}` };
    }
    numeros.push(emis.numero);
  }

  const m = mailPersonnalise({ sujet, message, email: d.eleve.email, sansBouton: true });
  const r = await envoyerMail({ to: d.eleve.email, ...m, attachments: pieces });
  if (!r.ok) return { erreur: `E-mail non envoyé (${r.raison}).` };
  if (copie) {
    await envoyerMail({ to: destinataireContact(), subject: `[Copie] ${sujet} — ${d.eleve.email}`, html: m.html, text: m.text, attachments: pieces });
  }

  const supabase = await createClient();
  await supabase.from("envois_documents").insert({
    inscription_id: inscriptionId, eleve_id: d.eleve.id, envoye_par: admin.id, destinataire: d.eleve.email, sujet, documents: numeros, types,
  });
  revalidatePath(`/admin/eleves/${d.eleve.id}`);
  revalidatePath("/admin/eleves");
  revalidatePath("/admin");
  return { ok: true, message: `${pieces.length} document${pieces.length > 1 ? "s" : ""} envoyé${pieces.length > 1 ? "s" : ""} à ${d.eleve.email} (${numeros.join(", ")}).` };
}

/* ───────────────────────── suivi pédagogique ───────────────────────── */

/** Prochain échange planifié et note de suivi sur une inscription. */
export async function enregistrerSuivi(inscriptionId: string, eleveId: string, fd: FormData): Promise<void> {
  await requireAdmin();
  const supabase = await createClient();
  await supabase.from("inscriptions").update({
    prochain_contact: sOrNull(fd, "prochain_contact", 10),
    note_suivi: sOrNull(fd, "note_suivi", 2000),
  }).eq("id", inscriptionId);
  revalidatePath(`/admin/eleves/${eleveId}`);
  revalidatePath("/admin/eleves");
  revalidatePath("/admin");
}
