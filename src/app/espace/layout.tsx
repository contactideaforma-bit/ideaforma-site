import type { Metadata } from "next";
import AppSidebar, { type SidebarSection } from "@/components/AppSidebar";
import { requireUser, nomComplet } from "@/lib/auth";

export const metadata: Metadata = { title: "Mon espace de formation", robots: { index: false, follow: false } };

export default async function EspaceLayout({ children }: { children: React.ReactNode }) {
  const user = await requireUser();
  const sections: SidebarSection[] = [
    {
      items: [
        { href: "/espace", label: "Mes formations", icone: "book-open", exact: true },
        { href: "/espace/compte", label: "Mon compte", icone: "settings" },
      ],
    },
  ];
  if (user.role === "admin") {
    sections.push({ items: [{ href: "/admin", label: "Administration", icone: "wrench" }] });
  }

  return (
    <div className="app-shell">
      <AppSidebar badge="Élève" nom={nomComplet(user)} email={user.email} sections={sections} />
      <main className="app-main">{children}</main>
    </div>
  );
}
