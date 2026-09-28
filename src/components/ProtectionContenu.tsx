"use client";

import { useEffect, useState } from "react";

/**
 * Protection des contenus pédagogiques :
 *  - clic droit, sélection, glisser-déposer, copie et impression désactivés ;
 *  - raccourcis d'enregistrement / impression / outils de développement bloqués ;
 *  - contenu flouté dès que la fenêtre perd le focus ou que l'onglet est masqué
 *    (limite les captures par un outil tiers) ;
 *  - filigrane avec l'e-mail de l'élève : aucun navigateur ne peut empêcher une capture
 *    d'écran, mais toute fuite devient traçable.
 */
export default function ProtectionContenu({ email, children }: { email: string; children: React.ReactNode }) {
  const [masque, setMasque] = useState(false);

  useEffect(() => {
    const bloque = (e: Event) => e.preventDefault();
    const clavier = (e: KeyboardEvent) => {
      const k = e.key.toLowerCase();
      if ((e.ctrlKey || e.metaKey) && ["s", "p", "u"].includes(k)) e.preventDefault();
      if ((e.ctrlKey || e.metaKey) && e.shiftKey && ["i", "j", "c", "s", "3", "4", "5"].includes(k)) e.preventDefault();
      if (k === "f12" || k === "printscreen") e.preventDefault();
    };
    const cacher = () => setMasque(true);
    const montrer = () => setMasque(false);
    const visibilite = () => setMasque(document.hidden);

    document.addEventListener("contextmenu", bloque);
    document.addEventListener("dragstart", bloque);
    document.addEventListener("copy", bloque);
    document.addEventListener("keydown", clavier);
    document.addEventListener("visibilitychange", visibilite);
    window.addEventListener("blur", cacher);
    window.addEventListener("focus", montrer);
    const style = document.createElement("style");
    style.textContent = "@media print { body { display: none !important; } }";
    document.head.appendChild(style);
    return () => {
      document.removeEventListener("contextmenu", bloque);
      document.removeEventListener("dragstart", bloque);
      document.removeEventListener("copy", bloque);
      document.removeEventListener("keydown", clavier);
      document.removeEventListener("visibilitychange", visibilite);
      window.removeEventListener("blur", cacher);
      window.removeEventListener("focus", montrer);
      style.remove();
    };
  }, []);

  return (
    <div className={`protege${masque ? " protege-masque" : ""}`}>
      {children}
      <div className="filigrane" aria-hidden>
        {Array.from({ length: 24 }).map((_, i) => (
          <span key={i}>{email} · IDEAFORMA</span>
        ))}
      </div>
      {masque && (
        <div className="protege-voile" aria-hidden>
          <div>🔒 Contenu masqué — revenez sur cette fenêtre pour continuer.</div>
        </div>
      )}
    </div>
  );
}
