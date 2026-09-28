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

  // Sans configuration Supabase (variables absentes sur Vercel), on laisse passer le site public
  // au lieu de faire planter toutes les pages.
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
  if (!url || !key) {
    const { pathname } = request.nextUrl;
    if (pathname.startsWith("/admin") || pathname.startsWith("/espace")) {
      return new NextResponse(
        "Plateforme non configurée : ajoutez NEXT_PUBLIC_SUPABASE_URL et NEXT_PUBLIC_SUPABASE_ANON_KEY dans les variables d'environnement Vercel, puis redéployez.",
        { status: 503, headers: { "Content-Type": "text/plain; charset=utf-8" } }
      );
    }
    return response;
  }

  try {
    return await avecSession(request, response, url, key);
  } catch (e) {
    console.error("[middleware] erreur Supabase :", e);
    return response;
  }
}

async function avecSession(request: NextRequest, response: NextResponse, url: string, key: string) {
  const supabase = createServerClient(
    url,
    key,
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
