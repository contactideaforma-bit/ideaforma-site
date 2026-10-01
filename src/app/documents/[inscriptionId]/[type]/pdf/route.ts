import { NextResponse } from "next/server";
import { getCurrentProfile } from "@/lib/auth";
import { chargerDossier, type TypeDocument } from "@/lib/documents";
import { construireDocument } from "@/lib/documents-modele";
import { genererPdf } from "@/lib/documents-pdf";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

/** Téléchargement du PDF d'un document officiel (même rendu que la pièce jointe envoyée par e-mail). */
export async function GET(_req: Request, { params }: { params: Promise<{ inscriptionId: string; type: string }> }) {
  const profil = await getCurrentProfile();
  if (!profil || profil.role !== "admin") return new NextResponse("Accès réservé", { status: 403 });
  const { inscriptionId, type } = await params;
  if (!["attestation", "certificat", "releve"].includes(type)) return new NextResponse("Type inconnu", { status: 404 });
  const d = await chargerDossier(inscriptionId);
  if (!d) return new NextResponse("Inscription introuvable", { status: 404 });
  const emis = d.documents.find((x) => x.type === type) ?? null;
  const doc = construireDocument(d, type as TypeDocument, emis?.numero ?? null, emis?.emis_le ?? new Date().toISOString());
  const pdf = await genererPdf(doc);
  const nom = emis ? doc.nomFichier : doc.nomFichier.replace(/\.pdf$/, "_BROUILLON.pdf");
  return new NextResponse(new Uint8Array(pdf), {
    headers: {
      "Content-Type": "application/pdf",
      "Content-Disposition": `inline; filename="${nom}"`,
      "Cache-Control": "no-store",
    },
  });
}
