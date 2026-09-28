import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";

/** Échange le code PKCE (lien de réinitialisation de mot de passe) contre une session. */
export async function GET(req: Request) {
  const url = new URL(req.url);
  const code = url.searchParams.get("code");
  const next = url.searchParams.get("next") || "/espace";
  const destination = next.startsWith("/") ? next : "/espace";

  if (code) {
    const supabase = await createClient();
    const { error } = await supabase.auth.exchangeCodeForSession(code);
    if (!error) return NextResponse.redirect(new URL(destination, url.origin));
  }
  return NextResponse.redirect(new URL("/connexion?erreur=lien-invalide", url.origin));
}
