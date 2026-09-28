import "server-only";
import { createClient as createSupabaseClient } from "@supabase/supabase-js";

/**
 * Client Supabase avec la clé service_role : contourne la RLS.
 * À n'utiliser QUE côté serveur, après avoir vérifié que l'appelant est admin
 * (voir requireAdmin dans lib/auth.ts).
 */
export function createAdminClient() {
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  if (!key) {
    throw new Error("SUPABASE_SERVICE_ROLE_KEY manquante dans les variables d'environnement.");
  }
  return createSupabaseClient(process.env.NEXT_PUBLIC_SUPABASE_URL!, key, {
    auth: { autoRefreshToken: false, persistSession: false },
  });
}
