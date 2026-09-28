"use server";

import { revalidatePath } from "next/cache";
import { requireUser } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";

/** L'élève marque une leçon comme terminée (la RLS vérifie l'inscription et le délai d'accès). */
export async function terminerLecon(formationId: string, leconId: string): Promise<void> {
  const user = await requireUser();
  const supabase = await createClient();

  const { data: insc } = await supabase
    .from("inscriptions")
    .select("id")
    .eq("eleve_id", user.id)
    .eq("formation_id", formationId)
    .maybeSingle();
  if (!insc) return;

  await supabase.from("progression").upsert(
    { inscription_id: insc.id, lecon_id: leconId, statut: "termine", termine_le: new Date().toISOString() },
    { onConflict: "inscription_id,lecon_id" }
  );
  revalidatePath(`/espace/formation/${formationId}`);
  revalidatePath("/espace");
}
