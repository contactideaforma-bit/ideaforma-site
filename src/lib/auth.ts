import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import type { Profile } from "@/lib/types";

/** Utilisateur connecté + son profil (ou null). */
export async function getCurrentProfile(): Promise<Profile | null> {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) return null;

  let { data, error } = await supabase.from("profiles").select("*").eq("id", user.id).maybeSingle();
  if (error || !data) {
    // Seconde tentative : la première peut tomber pendant le renouvellement du jeton.
    ({ data, error } = await supabase.from("profiles").select("*").eq("id", user.id).maybeSingle());
  }
  if (data) return data as Profile;

  // Profil illisible alors que l'utilisateur est bien connecté : on reconstruit le minimum
  // depuis le jeton (rôle synchronisé dans app_metadata) plutôt que de le traiter en élève.
  const meta = (user.app_metadata ?? {}) as { role?: string; actif?: boolean };
  const um = (user.user_metadata ?? {}) as { prenom?: string; nom?: string };
  if (!meta.role) return null;
  return {
    id: user.id,
    email: user.email ?? "",
    prenom: um.prenom ?? null,
    nom: um.nom ?? null,
    telephone: null,
    entreprise: null,
    role: meta.role as Profile["role"],
    actif: meta.actif ?? true,
    created_at: user.created_at,
    updated_at: user.created_at,
  } as Profile;
}

/** Garantit un admin connecté, sinon redirige. */
export async function requireAdmin(): Promise<Profile> {
  const profile = await getCurrentProfile();
  if (!profile) redirect("/connexion?suivant=/admin");
  if (profile.role !== "admin") redirect("/espace");
  return profile;
}

/** Garantit un utilisateur connecté et actif (élève ou admin), sinon redirige. */
export async function requireUser(): Promise<Profile> {
  const profile = await getCurrentProfile();
  if (!profile) redirect("/connexion?suivant=/espace");
  if (!profile.actif && profile.role !== "admin") redirect("/connexion?erreur=compte-desactive");
  return profile;
}

export function nomComplet(p: Pick<Profile, "prenom" | "nom" | "email">): string {
  const n = [p.prenom, p.nom].filter(Boolean).join(" ").trim();
  return n || p.email;
}
