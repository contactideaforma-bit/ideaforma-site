"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { useState } from "react";

const LIENS = [
  { href: "/", label: "Accueil" },
  { href: "/formations", label: "Nos Formations" },
  { href: "/a-propos", label: "À Propos" },
  { href: "/contact", label: "Contact" },
];

export default function SiteNav({ connecte }: { connecte: boolean }) {
  const pathname = usePathname();
  const [open, setOpen] = useState(false);
  const espaceHref = connecte ? "/espace" : "/connexion";
  const espaceLabel = connecte ? "Mon espace" : "Espace élève";

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
              🔐 {espaceLabel}
            </Link>
            <Link href="/contact#rdv" className="btn btn-primary btn-sm nav-cta">
              📅 Prendre RDV
            </Link>
            <button
              className={`hamburger${open ? " open" : ""}`}
              aria-label="Menu"
              aria-expanded={open}
              onClick={() => setOpen((o) => !o)}
            >
              <span></span>
              <span></span>
              <span></span>
            </button>
          </div>
        </div>
      </nav>
      <div className={`mobile-menu${open ? " open" : ""}`}>
        {LIENS.map((l) => (
          <Link key={l.href} href={l.href} onClick={() => setOpen(false)}>
            {l.label}
          </Link>
        ))}
        <Link href={espaceHref} onClick={() => setOpen(false)}>
          🔐 {espaceLabel}
        </Link>
        <Link href="/contact#rdv" className="btn btn-primary" onClick={() => setOpen(false)}>
          📅 Prendre RDV
        </Link>
      </div>
    </>
  );
}
