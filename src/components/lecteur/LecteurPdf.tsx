"use client";

import { useCallback, useEffect, useRef, useState } from "react";

/**
 * Lecteur PDF « fermé » : rendu page par page sur canvas via pdf.js (CDN cdnjs),
 * sans barre d'outils ni bouton de téléchargement du navigateur, filigrane par page.
 *  - mode "document" : toutes les pages à la suite (PDF, e-book)
 *  - mode "slides"   : une page à la fois, flèches ← → (diaporama)
 */

const PDFJS_VERSION = "4.10.38";
const PDFJS_URL = `https://cdnjs.cloudflare.com/ajax/libs/pdf.js/${PDFJS_VERSION}/pdf.min.mjs`;
const WORKER_URL = `https://cdnjs.cloudflare.com/ajax/libs/pdf.js/${PDFJS_VERSION}/pdf.worker.min.mjs`;

type PdfDoc = { numPages: number; getPage: (n: number) => Promise<PdfPage> };
type PdfPage = {
  getViewport: (o: { scale: number }) => { width: number; height: number };
  render: (o: { canvasContext: CanvasRenderingContext2D; viewport: { width: number; height: number } }) => { promise: Promise<void> };
};

let pdfjsPromise: Promise<{ getDocument: (o: { url: string }) => { promise: Promise<PdfDoc> } }> | null = null;
function chargerPdfjs() {
  if (!pdfjsPromise) {
    pdfjsPromise = import(/* webpackIgnore: true */ PDFJS_URL).then((lib) => {
      lib.GlobalWorkerOptions.workerSrc = WORKER_URL;
      return lib;
    });
  }
  return pdfjsPromise;
}

export default function LecteurPdf({ src, mode, email }: { src: string; mode: "document" | "slides"; email: string }) {
  const conteneur = useRef<HTMLDivElement>(null);
  const [doc, setDoc] = useState<PdfDoc | null>(null);
  const [erreur, setErreur] = useState("");
  const [page, setPage] = useState(1);
  const [largeur, setLargeur] = useState(0);

  useEffect(() => {
    let annule = false;
    chargerPdfjs()
      .then((lib) => lib.getDocument({ url: src }).promise)
      .then((d) => { if (!annule) setDoc(d); })
      .catch((e) => { if (!annule) setErreur("Impossible d'afficher le document (" + (e instanceof Error ? e.message : "erreur") + ")."); });
    return () => { annule = true; };
  }, [src]);

  useEffect(() => {
    const el = conteneur.current;
    if (!el) return;
    const maj = () => setLargeur(el.clientWidth);
    maj();
    const ro = new ResizeObserver(maj);
    ro.observe(el);
    return () => ro.disconnect();
  }, []);

  useEffect(() => {
    if (mode !== "slides" || !doc) return;
    const k = (e: KeyboardEvent) => {
      if (e.key === "ArrowRight" || e.key === "PageDown") setPage((p) => Math.min(doc.numPages, p + 1));
      if (e.key === "ArrowLeft" || e.key === "PageUp") setPage((p) => Math.max(1, p - 1));
    };
    window.addEventListener("keydown", k);
    return () => window.removeEventListener("keydown", k);
  }, [mode, doc]);

  const pages = doc ? (mode === "slides" ? [page] : Array.from({ length: doc.numPages }, (_, i) => i + 1)) : [];

  return (
    <div ref={conteneur} className="pdf-lecteur" onContextMenu={(e) => e.preventDefault()}>
      {erreur && <div className="alert alert-error">{erreur}</div>}
      {!doc && !erreur && <div className="empty">Chargement du document…</div>}
      {doc && mode === "slides" && (
        <div className="pdf-barre">
          <button type="button" className="btn btn-ghost btn-sm" disabled={page <= 1} onClick={() => setPage((p) => p - 1)}>← Précédente</button>
          <span>Diapositive {page} / {doc.numPages}</span>
          <button type="button" className="btn btn-ghost btn-sm" disabled={page >= doc.numPages} onClick={() => setPage((p) => p + 1)}>Suivante →</button>
        </div>
      )}
      {doc && largeur > 0 && pages.map((n) => <PagePdf key={n} doc={doc} numero={n} largeur={largeur} email={email} />)}
      {doc && mode === "document" && <div className="pdf-fin">— {doc.numPages} page{doc.numPages > 1 ? "s" : ""} —</div>}
    </div>
  );
}

function PagePdf({ doc, numero, largeur, email }: { doc: PdfDoc; numero: number; largeur: number; email: string }) {
  const ref = useRef<HTMLCanvasElement>(null);
  const [hauteur, setHauteur] = useState(0);

  const rendre = useCallback(async () => {
    const canvas = ref.current;
    if (!canvas) return;
    const p = await doc.getPage(numero);
    const base = p.getViewport({ scale: 1 });
    const scale = (largeur - 2) / base.width;
    const ratio = Math.min(window.devicePixelRatio || 1, 2);
    const vp = p.getViewport({ scale: scale * ratio });
    canvas.width = Math.floor(vp.width);
    canvas.height = Math.floor(vp.height);
    canvas.style.width = `${Math.floor(vp.width / ratio)}px`;
    canvas.style.height = `${Math.floor(vp.height / ratio)}px`;
    setHauteur(Math.floor(vp.height / ratio));
    const ctx = canvas.getContext("2d");
    if (!ctx) return;
    await p.render({ canvasContext: ctx, viewport: vp }).promise;
    // filigrane discret
    ctx.save();
    ctx.globalAlpha = 0.10;
    ctx.fillStyle = "#1565A0";
    ctx.font = `${Math.round(14 * ratio)}px sans-serif`;
    ctx.translate(canvas.width / 2, canvas.height / 2);
    ctx.rotate(-Math.PI / 8);
    ctx.textAlign = "center";
    ctx.fillText(`${email} · IDEAFORMA`, 0, 0);
    ctx.restore();
  }, [doc, numero, largeur, email]);

  useEffect(() => { rendre(); }, [rendre]);

  return (
    <div className="pdf-page" style={{ minHeight: hauteur || 200 }}>
      <canvas ref={ref} />
    </div>
  );
}
