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

  const { data } = await supabase.from("profiles").select("*").eq("id", user.id).maybeSingle();
  return (data as Profile | null) ?? null;
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
