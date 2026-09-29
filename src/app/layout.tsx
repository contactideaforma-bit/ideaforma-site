import type { Metadata } from "next";
import { Poppins, Inter } from "next/font/google";
import "./globals.css";

const poppins = Poppins({
  subsets: ["latin"],
  weight: ["500", "600", "700", "800"],
  display: "swap",
  variable: "--font-poppins",
});
const inter = Inter({ subsets: ["latin"], display: "swap", variable: "--font-inter" });

export const metadata: Metadata = {
  metadataBase: new URL(process.env.NEXT_PUBLIC_SITE_URL || "https://ideaforma.fr"),
  title: {
    default: "IDEAFORMA — Organisme de Formation Professionnelle",
    template: "%s — IDEAFORMA",
  },
  description:
    "IDEAFORMA, organisme de formation professionnelle certifié Qualiopi. Management, communication, bureautique, sécurité au travail. Formations sur-mesure pour vos équipes, en ligne ou en intra-entreprise.",
  openGraph: {
    type: "website",
    locale: "fr_FR",
    siteName: "IDEAFORMA",
    images: ["/images/cover-formation.png"],
  },
  icons: { icon: "/images/logo-ideaforma.png" },
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="fr" className={`${poppins.variable} ${inter.variable}`}>
      <body>{children}</body>
    </html>
  );
}
