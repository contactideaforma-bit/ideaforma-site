import "server-only";
import React from "react";
import { Document, Page, Text, View, StyleSheet, Font, renderToBuffer } from "@react-pdf/renderer";
import { ORGANISME } from "@/lib/organisme";
import { formatDateLongue } from "@/lib/documents";
import { segments, type Bloc, type ModeleDocument } from "@/lib/documents-modele";

// Pas de césure automatique (évite les coupures de mots hasardeuses en français).
Font.registerHyphenationCallback((mot) => [mot]);

const NAVY = "#0B2545";
const MUTED = "#5B6B82";
const PALE = "#EAF4FC";

const st = StyleSheet.create({
  page: { paddingTop: 42, paddingBottom: 60, paddingHorizontal: 50, fontFamily: "Helvetica", fontSize: 10, lineHeight: 1.45, color: "#111111" },
  entete: { flexDirection: "row", justifyContent: "space-between", alignItems: "flex-start", borderBottomWidth: 2, borderBottomColor: NAVY, paddingBottom: 8, marginBottom: 16 },
  logo: { fontFamily: "Helvetica-Bold", fontSize: 20, color: NAVY, letterSpacing: 0.5 },
  logoSous: { fontSize: 7, color: MUTED, letterSpacing: 1.2, marginTop: 3 },
  coord: { fontSize: 7.5, color: "#333333", textAlign: "right", lineHeight: 1.4 },
  numero: { fontFamily: "Helvetica-Bold", fontSize: 7.5, color: NAVY, textAlign: "right", marginTop: 2 },
  titre: { fontFamily: "Helvetica-Bold", fontSize: 15, color: NAVY, marginTop: 4, marginBottom: 2, textTransform: "uppercase", letterSpacing: 0.6 },
  ref: { fontSize: 8, color: MUTED, marginBottom: 12 },
  p: { marginBottom: 7, textAlign: "justify" },
  h2: { fontFamily: "Helvetica-Bold", fontSize: 11, color: NAVY, marginTop: 10, marginBottom: 5 },
  note: { fontSize: 7.5, color: "#333333", marginTop: 6, marginBottom: 6, textAlign: "justify" },
  liste: { marginBottom: 7, paddingLeft: 10 },
  puce: { flexDirection: "row", marginBottom: 2 },
  encadre: { borderWidth: 1.2, borderColor: "#111111", borderRadius: 4, paddingVertical: 7, paddingHorizontal: 10, marginVertical: 8 },
  ligneId: { flexDirection: "row", marginBottom: 3 },
  labelId: { width: "32%", color: MUTED, fontSize: 9 },
  valeurId: { width: "68%", fontSize: 9.5 },
  table: { marginTop: 4, marginBottom: 10, borderWidth: 0.8, borderColor: "#333333" },
  tr: { flexDirection: "row", borderBottomWidth: 0.6, borderBottomColor: "#333333" },
  trDernier: { flexDirection: "row" },
  th: { fontFamily: "Helvetica-Bold", backgroundColor: PALE, color: NAVY, fontSize: 8.5, paddingVertical: 3, paddingHorizontal: 5, borderRightWidth: 0.6, borderRightColor: "#333333" },
  td: { fontSize: 8.5, paddingVertical: 3, paddingHorizontal: 5, borderRightWidth: 0.6, borderRightColor: "#333333" },
  tdPetit: { fontSize: 7.5, paddingVertical: 1.5, paddingHorizontal: 4, borderRightWidth: 0.6, borderRightColor: "#333333" },
  signature: { width: 220, alignSelf: "flex-end", marginTop: 18, fontSize: 9.5 },
  cachet: { height: 90, borderWidth: 1, borderColor: "#999999", borderStyle: "dashed", borderRadius: 4, marginTop: 5, justifyContent: "flex-end", alignItems: "flex-end", padding: 4 },
  cachetTexte: { fontSize: 7, color: "#888888" },
  pied: { position: "absolute", left: 50, right: 50, bottom: 24, borderTopWidth: 0.6, borderTopColor: "#999999", paddingTop: 4, fontSize: 7, color: "#444444", textAlign: "center", lineHeight: 1.35 },
  pageNum: { position: "absolute", right: 50, bottom: 12, fontSize: 7, color: "#888888" },
});

function Riche({ texte, style }: { texte: string; style?: object }) {
  return (
    <Text style={style}>
      {segments(texte).map((s, i) => (s.gras ? <Text key={i} style={{ fontFamily: "Helvetica-Bold" }}>{s.texte}</Text> : <Text key={i}>{s.texte}</Text>))}
    </Text>
  );
}

/** Largeurs de colonnes selon le nombre de colonnes (en %). */
function largeurs(n: number, petit?: boolean): string[] {
  if (n === 2) return ["42%", "58%"];
  if (n === 3) return petit ? ["16%", "12%", "72%"] : ["46%", "22%", "32%"];
  return Array.from({ length: n }, () => `${Math.floor(100 / n)}%`);
}

function RenduBloc({ bloc, doc }: { bloc: Bloc; doc: ModeleDocument }) {
  switch (bloc.type) {
    case "p": return <Riche texte={bloc.texte} style={st.p} />;
    case "h2": return <Text style={st.h2}>{bloc.texte}</Text>;
    case "note": return <Riche texte={bloc.texte} style={st.note} />;
    case "liste":
      return (
        <View style={st.liste}>
          {bloc.items.map((it, i) => (
            <View key={i} style={st.puce}><Text style={{ width: 10 }}>•</Text><Riche texte={it} style={{ flex: 1, textAlign: "justify" }} /></View>
          ))}
        </View>
      );
    case "identite":
      return (
        <View style={st.encadre}>
          {bloc.lignes.map((l, i) => (
            <View key={i} style={st.ligneId}><Text style={st.labelId}>{l.label}</Text><Riche texte={l.valeur} style={st.valeurId} /></View>
          ))}
        </View>
      );
    case "table": {
      const n = (bloc.entetes ?? bloc.lignes[0] ?? []).length;
      const w = largeurs(n, bloc.petit);
      const cell = bloc.petit ? st.tdPetit : st.td;
      return (
        <View style={st.table}>
          {bloc.entetes && (
            <View style={st.tr} fixed>
              {bloc.entetes.map((e, j) => <Text key={j} style={[st.th, { width: w[j] }, j === n - 1 ? { borderRightWidth: 0 } : {}]}>{e}</Text>)}
            </View>
          )}
          {bloc.lignes.map((l, i) => (
            <View key={i} style={i === bloc.lignes.length - 1 ? st.trDernier : st.tr} wrap={false}>
              {l.map((c, j) => <Riche key={j} texte={c} style={[cell, { width: w[j] }, j === n - 1 ? { borderRightWidth: 0 } : {}]} />)}
            </View>
          ))}
        </View>
      );
    }
    case "signature":
      return (
        <View style={st.signature} wrap={false}>
          <Text>Fait à {ORGANISME.ville}, le {formatDateLongue(doc.dateDoc)}</Text>
          <Text>{ORGANISME.signataire.nom}, {ORGANISME.signataire.qualite}</Text>
          <View style={st.cachet}><Text style={st.cachetTexte}>Signature et cachet</Text></View>
        </View>
      );
  }
}

function DocumentPdf({ doc }: { doc: ModeleDocument }) {
  return (
    <Document title={`${doc.libelle}${doc.numero ? ` n° ${doc.numero}` : ""}`} author={ORGANISME.raisonSociale} language="fr">
      <Page size="A4" style={st.page}>
        <View style={st.entete} fixed>
          <View>
            <Text style={st.logo}>IDEAFORMA</Text>
            <Text style={st.logoSous}>ORGANISME DE FORMATION</Text>
          </View>
          <View>
            {doc.entete.coordonnees.map((l, i) => <Text key={i} style={st.coord}>{l}</Text>)}
            {doc.numero && <Text style={st.numero}>Document n° {doc.numero}</Text>}
          </View>
        </View>
        <Text style={st.titre}>{doc.titre}</Text>
        <Text style={st.ref}>{doc.reference}</Text>
        {doc.blocs.map((b, i) => <RenduBloc key={i} bloc={b} doc={doc} />)}
        <Text style={st.pied} fixed>{doc.pied}</Text>
        <Text style={st.pageNum} fixed render={({ pageNumber, totalPages }: { pageNumber: number; totalPages: number }) => `${pageNumber} / ${totalPages}`} />
      </Page>
    </Document>
  );
}

/** Produit le PDF d'un document officiel (pièce jointe e-mail, archive). */
export async function genererPdf(doc: ModeleDocument): Promise<Buffer> {
  const buf = await renderToBuffer(<DocumentPdf doc={doc} />);
  return Buffer.from(buf);
}
