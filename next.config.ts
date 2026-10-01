import type { NextConfig } from "next";

const securityHeaders = [
  { key: "X-Content-Type-Options", value: "nosniff" },
  { key: "X-Frame-Options", value: "DENY" },
  { key: "Referrer-Policy", value: "strict-origin-when-cross-origin" },
  { key: "Permissions-Policy", value: "camera=(), microphone=(), geolocation=()" },
];

const nextConfig: NextConfig = {
  reactStrictMode: true,
  poweredByHeader: false,
  // Pas de config ESLint dans le projet : on ne bloque pas le build Vercel dessus.
  eslint: { ignoreDuringBuilds: true },
  // Génération des PDF officiels côté serveur : le paquet doit rester hors du bundle webpack.
  serverExternalPackages: ["@react-pdf/renderer"],
  images: {
    remotePatterns: [{ protocol: "https", hostname: "**.supabase.co" }],
  },
  async headers() {
    return [{ source: "/(.*)", headers: securityHeaders }];
  },
  async redirects() {
    // Anciennes URL du site Netlify → nouvelles routes
    return [
      { source: "/index.html", destination: "/", permanent: true },
      { source: "/formations.html", destination: "/formations", permanent: true },
      { source: "/a-propos.html", destination: "/a-propos", permanent: true },
      { source: "/contact.html", destination: "/contact", permanent: true },
    ];
  },
};

export default nextConfig;
