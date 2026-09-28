import type { Metadata } from "next";
import AppSidebar from "@/components/AppSidebar";
import { requireAdmin, nomComplet } from "@/lib/auth";

export const metadata: Metadata = { title: "Administration", robots: { index: false, follow: false } };

export default async function AdminLayout({ children }: { children: React.ReactNode }) {
  const admin = await requireAdmin();

  return (
    <div className="app-shell">
      <AppSidebar
        badge="Admin"
        nom={nomComplet(admin)}
        email={admin.email}
        sections={[
          {
            items: [{ href: "/admin", label: "Tableau de bord", icone: "📊", exact: true }],
          },
          {
            titre: "Pédagogie",
            items: [
              { href: "/admin/eleves", label: "Élèves", icone: "🎓" },
              { href: "/admin/formations", label: "Formations", icone: "📚" },
            ],
          },
          {
            titre: "Site",
            items: [
              { href: "/admin/demandes", label: "Demandes de contact", icone: "✉️" },
              { href: "/admin/compte", label: "Mon compte", icone: "⚙️" },
            ],
          },
        ]}
      />
      <main className="app-main">{children}</main>
    </div>
  );
}
