"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import Icon from "@/components/Icon";

export type SidebarItem = { href: string; label: string; icone: string; exact?: boolean };
export type SidebarSection = { titre?: string; items: SidebarItem[] };

export default function AppSidebar({
  badge,
  sections,
  nom,
  email,
}: {
  badge: string;
  sections: SidebarSection[];
  nom: string;
  email: string;
}) {
  const pathname = usePathname();
  const actif = (it: SidebarItem) => (it.exact ? pathname === it.href : pathname.startsWith(it.href));

  return (
    <aside className="app-sidebar">
      <Link href="/" className="brand" title="Retour au site">
        {/* eslint-disable-next-line @next/next/no-img-element */}
        <img src="/images/logo-ideaforma.png" alt="IDEAFORMA" />
        <span>{badge}</span>
      </Link>
      {sections.map((s, i) => (
        <div key={i} style={{ display: "contents" }}>
          {s.titre && <div className="nav-section">{s.titre}</div>}
          {s.items.map((it) => (
            <Link key={it.href} href={it.href} className={`nav-item${actif(it) ? " active" : ""}`}>
              <Icon name={it.icone} size={18} />
              {it.label}
            </Link>
          ))}
        </div>
      ))}
      <div className="sidebar-footer">
        <div className="who">{nom}</div>
        <div className="mail">{email}</div>
        <form action="/auth/deconnexion" method="post">
          <button type="submit" className="btn btn-ghost btn-sm"><Icon name="log-out" size={15} /> Se déconnecter</button>
        </form>
      </div>
    </aside>
  );
}
