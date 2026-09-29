"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { useEffect, useState } from "react";
import Icon from "@/components/Icon";

const LIENS = [
  { href: "/", label: "Accueil", icone: "layout" },
  { href: "/formations", label: "Formations", icone: "book-open" },
  { href: "/a-propos", label: "À propos", icone: "compass" },
  { href: "/contact", label: "Contact", icone: "mail" },
];

export default function SiteNav({ connecte }: { connecte: boolean }) {
  const pathname = usePathname();
  const [open, setOpen] = useState(false);
  const espaceHref = connecte ? "/espace" : "/connexion";
  const espaceLabel = connecte ? "Mon espace" : "Espace élève";

  useEffect(() => setOpen(false), [pathname]);

  return (
    <>
      <nav className="site-nav">
        <div className="nav-inner">
          <Link href="/" className="nav-logo" aria-label="Accueil IDEAFORMA">
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img src="/images/logo-ideaforma.png" alt="IDEAFORMA" className="nav-logo-img" />
          </Link>
          <ul className="nav-links">
            {LIENS.map((l) => (
              <li key={l.href}>
                <Link href={l.href} className={pathname === l.href ? "active" : undefined}>
                  {l.label}
                </Link>
              </li>
            ))}
          </ul>
          <div className="nav-actions">
            <Link href={espaceHref} className="btn btn-ghost btn-sm">
              <Icon name="lock" size={16} /> {espaceLabel}
            </Link>
            <Link href="/contact#rdv" className="btn btn-primary btn-sm">
              <Icon name="calendar" size={16} /> Prendre rendez-vous
            </Link>
            <button
              className="hamburger"
              aria-label={open ? "Fermer le menu" : "Ouvrir le menu"}
              aria-expanded={open}
              onClick={() => setOpen((o) => !o)}
            >
              <Icon name={open ? "x" : "menu"} size={22} />
            </button>
          </div>
        </div>
      </nav>
      <div className={`mobile-menu${open ? " open" : ""}`}>
        {LIENS.map((l) => (
          <Link key={l.href} href={l.href}>
            <Icon name={l.icone} size={18} /> {l.label}
          </Link>
        ))}
        <Link href={espaceHref}>
          <Icon name="lock" size={18} /> {espaceLabel}
        </Link>
        <Link href="/contact#rdv" className="btn btn-primary">
          <Icon name="calendar" size={16} /> Prendre rendez-vous
        </Link>
      </div>
    </>
  );
}
