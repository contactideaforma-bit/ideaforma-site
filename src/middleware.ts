import { createServerClient } from "@supabase/ssr";
import { NextResponse, type NextRequest } from "next/server";

/**
 * Middleware :
 *  1. rafraîchit la session Supabase (cookies) à chaque requête ;
 *  2. protège /admin (rôle admin) et /espace (élève actif ou admin) ;
 *  3. renvoie un utilisateur déjà connecté qui visite /connexion vers son espace.
 */
export async function middleware(request: NextRequest) {
  let response = NextResponse.next({ request });

  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return request.cookies.getAll();
        },
        setAll(cookiesToSet) {
          cookiesToSet.forEach(({ name, value }) => request.cookies.set(name, value));
          response = NextResponse.next({ request });
          cookiesToSet.forEach(({ name, value, options }) =>
            response.cookies.set(name, value, options)
          );
        },
      },
    }
  );

  const {
    data: { user },
  } = await supabase.auth.getUser();

  const { pathname } = request.nextUrl;
  const isAdminRoute = pathname.startsWith("/admin");
  const isEspaceRoute = pathname.startsWith("/espace");
  const isLoginRoute = pathname === "/connexion";

  if (!user) {
    if (isAdminRoute || isEspaceRoute) {
      const url = request.nextUrl.clone();
      url.pathname = "/connexion";
      url.searchParams.set("suivant", pathname);
      return NextResponse.redirect(url);
    }
    return response;
  }

  if (isAdminRoute || isEspaceRoute || isLoginRoute) {
    const { data: profile } = await supabase
      .from("profiles")
      .select("role, actif")
      .eq("id", user.id)
      .maybeSingle();

    const role = profile?.role ?? "eleve";
    const actif = profile?.actif ?? false;

    if (isLoginRoute) {
      const url = request.nextUrl.clone();
      url.pathname = role === "admin" ? "/admin" : "/espace";
      url.search = "";
      return NextResponse.redirect(url);
    }

    if (isAdminRoute && role !== "admin") {
      const url = request.nextUrl.clone();
      url.pathname = "/espace";
      url.search = "";
      return NextResponse.redirect(url);
    }

    if (isEspaceRoute && role !== "admin" && !actif) {
      const url = request.nextUrl.clone();
      url.pathname = "/connexion";
      url.search = "?erreur=compte-desactive";
      return NextResponse.redirect(url);
    }
  }

  return response;
}

export const config = {
  matcher: [
    // Tout sauf les fichiers statiques et les images
    "/((?!_next/static|_next/image|favicon.ico|images/|.*\\.(?:png|jpg|jpeg|svg|webp|ico|txt|xml)$).*)",
  ],
};
