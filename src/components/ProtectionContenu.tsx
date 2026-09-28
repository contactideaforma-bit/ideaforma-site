"use client";

import { useEffect } from "react";

/**
 * Protection de base des contenus pédagogiques (socle de l'étape 2) :
 *  - clic droit, sélection, glisser-déposer et impression désactivés ;
 *  - raccourcis de sauvegarde / impression / outils de développement bloqués ;
 *  - filigrane discret avec l'e-mail de l'élève (dissuasion des captures : aucun navigateur
 *    ne permet d'empêcher techniquement une capture d'écran ; le filigrane rend la fuite traçable).
 */
export default function ProtectionContenu({ email, children }: { email: string; children: React.ReactNode }) {
  useEffect(() => {
    const bloque = (e: Event) => e.preventDefault();
    const clavier = (e: KeyboardEvent) => {
      const k = e.key.toLowerCase();
      if ((e.ctrlKey || e.metaKey) && ["s", "p", "u"].includes(k)) e.preventDefault();
      if ((e.ctrlKey || e.metaKey) && e.shiftKey && ["i", "j", "c"].includes(k)) e.preventDefault();
      if (k === "f12") e.preventDefault();
    };
    document.addEventListener("contextmenu", bloque);
    document.addEventListener("dragstart", bloque);
    document.addEventListener("copy", bloque);
    document.addEventListener("keydown", clavier);
    const style = document.createElement("style");
    style.textContent = "@media print { body { display: none !important; } }";
    document.head.appendChild(style);
    return () => {
      document.removeEventListener("contextmenu", bloque);
      document.removeEventListener("dragstart", bloque);
      document.removeEventListener("copy", bloque);
      document.removeEventListener("keydown", clavier);
      style.remove();
    };
  }, []);

  return (
    <div style={{ position: "relative", userSelect: "none", WebkitUserSelect: "none" }}>
      {children}
      <div
        aria-hidden
        style={{
          position: "fixed", inset: 0, pointerEvents: "none", zIndex: 5, overflow: "hidden",
          display: "flex", flexWrap: "wrap", alignContent: "space-around", justifyContent: "space-around",
          opacity: 0.06, fontSize: "14px", fontWeight: 600, color: "#1565A0", transform: "rotate(-20deg) scale(1.4)",
        }}
      >
        {Array.from({ length: 24 }).map((_, i) => (
          <span key={i} style={{ padding: "2.5rem 3rem", whiteSpace: "nowrap" }}>{email} · IDEAFORMA</span>
        ))}
      </div>
    </div>
  );
}
