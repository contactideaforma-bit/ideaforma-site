"use client";

import { useActionState, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import type { Lecon, LeconType } from "@/lib/types";
import { TYPES_LECON } from "@/lib/types";
import { BUCKET, cheminStorage, estFichier, estQuiz, lireQuiz, type ContenuMedia, type QuestionQuiz } from "@/lib/contenu";
import type { EtatSimple } from "@/app/admin/actions";
import Icon from "@/components/Icon";
import { urlSigneeAdmin } from "@/app/admin/actions";

const ACCEPT: Record<string, string> = {
  video: "video/mp4,video/webm,video/quicktime",
  podcast: "audio/mpeg,audio/mp4,audio/x-m4a,audio/wav,audio/ogg",
  pdf: "application/pdf",
  ebook: "application/pdf",
  slides: "application/pdf",
};
const AIDE: Record<string, string> = {
  video: "Format MP4 (H.264) recommandé. Pour les grosses vidéos, préférez une vidéo YouTube « non répertoriée » ou Vimeo et collez son lien ci-dessous.",
  podcast: "Format MP3 ou M4A.",
  pdf: "Document PDF affiché page par page dans la plateforme (sans bouton de téléchargement).",
  ebook: "E-book au format PDF, affiché page par page.",
  slides: "Exportez vos slides en PDF (PowerPoint → Fichier → Exporter → PDF, ou Canva → Télécharger → PDF standard).",
};

export default function LeconEditor({
  lecon,
  formationId,
  action,
}: {
  lecon: Lecon;
  formationId: string;
  action: (prev: EtatSimple, fd: FormData) => Promise<EtatSimple>;
}) {
  const [etat, formAction, enCours] = useActionState<EtatSimple, FormData>(action, {});
  const [type, setType] = useState<LeconType>(lecon.type);
  const c = lecon.contenu ?? {};

  // état du contenu selon le type
  const [texte, setTexte] = useState<string>(typeof c.texte === "string" ? c.texte : "");
  const [media, setMedia] = useState<ContenuMedia>({
    storage_path: typeof c.storage_path === "string" ? c.storage_path : undefined,
    nom_fichier: typeof c.nom_fichier === "string" ? c.nom_fichier : undefined,
    taille: typeof c.taille === "number" ? c.taille : undefined,
    url_externe: typeof c.url_externe === "string" ? c.url_externe : "",
    description: typeof c.description === "string" ? c.description : "",
  });
  const quizInit = lireQuiz(c);
  const [questions, setQuestions] = useState<QuestionQuiz[]>(quizInit.questions);
  const [seuil, setSeuil] = useState<number>(quizInit.seuil);
  const [tentativesMax, setTentativesMax] = useState<number>(quizInit.tentatives_max);
  const [corrections, setCorrections] = useState<boolean>(quizInit.corrections);
  const [consigne, setConsigne] = useState<string>(quizInit.consigne ?? "");

  const [upload, setUpload] = useState<{ etat: "idle" | "envoi" | "ok" | "erreur"; message?: string }>({ etat: "idle" });

  function contenuJson(): string {
    if (type === "texte") return JSON.stringify({ texte });
    if (estFichier(type)) return JSON.stringify({ ...media, url_externe: media.url_externe?.trim() || undefined, description: media.description?.trim() || undefined });
    if (estQuiz(type)) return JSON.stringify({ questions, seuil, tentatives_max: tentativesMax, corrections, consigne: consigne.trim() || undefined });
    return "{}";
  }

  async function envoyerFichier(file: File) {
    setUpload({ etat: "envoi", message: `Envoi de ${file.name}…` });
    const supabase = createClient();
    const chemin = cheminStorage(formationId, lecon.id, file.name);
    const { error } = await supabase.storage.from(BUCKET).upload(chemin, file, { upsert: false, contentType: file.type || undefined });
    if (error) {
      setUpload({ etat: "erreur", message: `Échec de l'envoi : ${error.message}` });
      return;
    }
    // supprime l'ancien fichier (best effort)
    if (media.storage_path && media.storage_path !== chemin) {
      await supabase.storage.from(BUCKET).remove([media.storage_path]).catch(() => null);
    }
    setMedia((m) => ({ ...m, storage_path: chemin, nom_fichier: file.name, taille: file.size }));
    setUpload({ etat: "ok", message: `Fichier envoyé. Pensez à cliquer sur « Enregistrer la leçon ».` });
  }

  async function apercu() {
    if (!media.storage_path) return;
    const url = await urlSigneeAdmin(media.storage_path);
    if (url) window.open(url, "_blank", "noopener");
  }

  const majQuestion = (i: number, patch: Partial<QuestionQuiz>) =>
    setQuestions((qs) => qs.map((q, k) => (k === i ? { ...q, ...patch } : q)));

  return (
    <form action={formAction} className="panel">
      {etat.erreur && <div className="alert alert-error">{etat.erreur}</div>}
      {etat.ok && etat.message && <div className="alert alert-success">{etat.message}</div>}
      <input type="hidden" name="contenu_json" value={contenuJson()} readOnly />

      <h2>Informations</h2>
      <div className="form-grid">
        <div className="form-group full"><label htmlFor="titre">Titre *</label><input id="titre" name="titre" required defaultValue={lecon.titre} /></div>
        <div className="form-group">
          <label htmlFor="type">Type</label>
          <select id="type" name="type" value={type} onChange={(e) => setType(e.target.value as LeconType)}>
            {TYPES_LECON.map((t) => <option key={t.value} value={t.value}>{t.label}</option>)}
          </select>
        </div>
        <div className="form-group"><label htmlFor="duree_minutes">Durée estimée (min)</label><input id="duree_minutes" name="duree_minutes" type="number" min="0" defaultValue={lecon.duree_minutes ?? ""} /></div>
        <div className="form-group full">
          <label className="form-check"><input type="checkbox" name="publie" defaultChecked={lecon.publie} /> Visible pour les élèves</label>
        </div>
      </div>

      {type === "texte" && (
        <>
          <h2 style={{ marginTop: "1.5rem" }}>Contenu du cours</h2>
          <div className="form-group">
            <textarea value={texte} onChange={(e) => setTexte(e.target.value)} style={{ minHeight: 320, fontFamily: "inherit" }} placeholder={"# Titre de section\nParagraphe…\n\n## Sous-titre\n- point clé\n- autre point"} />
            <span className="hint">Mise en forme : une ligne « # Titre », « ## Sous-titre », « - puce » ; une ligne vide sépare les paragraphes.</span>
          </div>
        </>
      )}

      {estFichier(type) && (
        <>
          <h2 style={{ marginTop: "1.5rem" }}>Fichier</h2>
          <p style={{ fontSize: ".85rem", marginBottom: ".75rem" }}>{AIDE[type]}</p>
          {media.storage_path ? (
            <div className="callout" style={{ marginBottom: "1rem" }}>
              <div style={{ fontWeight: 600, display: "flex", alignItems: "center", gap: ".4rem" }}><Icon name="paperclip" size={16} /> {media.nom_fichier ?? media.storage_path}</div>
              {media.taille ? <div className="muted" style={{ fontSize: ".8rem", color: "var(--text-muted)" }}>{(media.taille / 1048576).toFixed(1)} Mo</div> : null}
              <div className="actions-row" style={{ marginTop: ".5rem" }}>
                <button type="button" className="btn btn-ghost btn-sm" onClick={apercu}>Aperçu</button>
                <button type="button" className="btn btn-danger btn-sm" onClick={() => setMedia((m) => ({ ...m, storage_path: undefined, nom_fichier: undefined, taille: undefined }))}>Retirer</button>
              </div>
            </div>
          ) : null}
          <div className="form-group">
            <label htmlFor="fichier">{media.storage_path ? "Remplacer le fichier" : "Déposer un fichier"}</label>
            <input id="fichier" type="file" accept={ACCEPT[type]} disabled={upload.etat === "envoi"} onChange={(e) => { const f = e.target.files?.[0]; if (f) envoyerFichier(f); }} />
            <span className="hint">Envoi direct vers le stockage privé. Limite par fichier : 50 Mo (offre Supabase gratuite) — au-delà, utilisez un lien vidéo externe.</span>
          </div>
          {upload.message && (
            <div className={`alert ${upload.etat === "erreur" ? "alert-error" : upload.etat === "ok" ? "alert-success" : "alert-info"}`}>{upload.message}</div>
          )}
          {type === "video" && (
            <div className="form-group" style={{ marginTop: ".5rem" }}>
              <label htmlFor="url_externe">Ou lien vidéo externe (YouTube non répertorié, Vimeo)</label>
              <input id="url_externe" value={media.url_externe ?? ""} onChange={(e) => setMedia((m) => ({ ...m, url_externe: e.target.value }))} placeholder="https://youtu.be/…" />
            </div>
          )}
          <div className="form-group" style={{ marginTop: ".5rem" }}>
            <label htmlFor="description">Texte d&apos;accompagnement (facultatif)</label>
            <textarea id="description" value={media.description ?? ""} onChange={(e) => setMedia((m) => ({ ...m, description: e.target.value }))} placeholder="Consignes, résumé, points à retenir…" />
          </div>
        </>
      )}

      {estQuiz(type) && (
        <>
          <h2 style={{ marginTop: "1.5rem" }}>{type === "evaluation" ? "Évaluation" : "Quiz"} — réglages</h2>
          <div className="form-grid">
            <div className="form-group"><label>Seuil de réussite (%)</label><input type="number" min="0" max="100" value={seuil} onChange={(e) => setSeuil(Number(e.target.value))} /></div>
            <div className="form-group"><label>Tentatives maximum</label><input type="number" min="0" value={tentativesMax} onChange={(e) => setTentativesMax(Number(e.target.value))} /><span className="hint">0 = illimité</span></div>
            <div className="form-group full"><label>Consigne (facultatif)</label><input value={consigne} onChange={(e) => setConsigne(e.target.value)} placeholder="Une seule réponse par question sauf mention contraire…" /></div>
            <div className="form-group full"><label className="form-check"><input type="checkbox" checked={corrections} onChange={(e) => setCorrections(e.target.checked)} /> Afficher les bonnes réponses et les explications après soumission</label></div>
          </div>

          <h2 style={{ marginTop: "1.5rem" }}>Questions <span className="count">{questions.length}</span></h2>
          <div className="module-list">
            {questions.map((q, i) => (
              <div key={q.id} className="module-item">
                <header>
                  <h3><span className="num">{i + 1}</span>Question</h3>
                  <div className="actions-row">
                    <button type="button" className="btn btn-ghost btn-sm" disabled={i === 0} onClick={() => setQuestions((qs) => { const a = [...qs]; [a[i - 1], a[i]] = [a[i], a[i - 1]]; return a; })}><Icon name="arrow-up" size={14} /></button>
                    <button type="button" className="btn btn-ghost btn-sm" disabled={i === questions.length - 1} onClick={() => setQuestions((qs) => { const a = [...qs]; [a[i + 1], a[i]] = [a[i], a[i + 1]]; return a; })}><Icon name="arrow-down" size={14} /></button>
                    <button type="button" className="btn btn-danger btn-sm" onClick={() => setQuestions((qs) => qs.filter((_, k) => k !== i))}>Supprimer</button>
                  </div>
                </header>
                <div className="form-group" style={{ marginTop: ".6rem" }}>
                  <textarea value={q.enonce} onChange={(e) => majQuestion(i, { enonce: e.target.value })} placeholder="Énoncé de la question" style={{ minHeight: 60 }} />
                </div>
                <div className="lecon-list">
                  {q.options.map((opt, k) => (
                    <div key={k} className="lecon-item" style={{ background: q.bonnes.includes(k) ? "rgba(63,181,121,.12)" : undefined }}>
                      <label className="form-check" title="Bonne réponse">
                        <input
                          type="checkbox"
                          checked={q.bonnes.includes(k)}
                          onChange={(e) => majQuestion(i, { bonnes: e.target.checked ? [...q.bonnes, k].sort((a, b) => a - b) : q.bonnes.filter((b) => b !== k) })}
                        />
                      </label>
                      <input
                        value={opt}
                        onChange={(e) => majQuestion(i, { options: q.options.map((o, j) => (j === k ? e.target.value : o)) })}
                        placeholder={`Réponse ${k + 1}`}
                        style={{ flex: 1, padding: ".4rem .6rem", border: "1.5px solid var(--border)", borderRadius: 6, fontFamily: "inherit", fontSize: ".88rem" }}
                      />
                      <button type="button" className="btn btn-ghost btn-sm" title="Retirer" onClick={() => majQuestion(i, { options: q.options.filter((_, j) => j !== k), bonnes: q.bonnes.filter((b) => b !== k).map((b) => (b > k ? b - 1 : b)) })}><Icon name="x" size={14} /></button>
                    </div>
                  ))}
                  <button type="button" className="btn btn-ghost btn-sm" style={{ alignSelf: "flex-start" }} onClick={() => majQuestion(i, { options: [...q.options, ""] })}>+ Réponse</button>
                </div>
                <div className="form-group" style={{ marginTop: ".6rem" }}>
                  <input value={q.explication ?? ""} onChange={(e) => majQuestion(i, { explication: e.target.value })} placeholder="Explication affichée après correction (facultatif)" />
                </div>
                <div className="hint" style={{ marginTop: ".3rem", fontSize: ".75rem", color: "var(--text-muted)" }}>
                  Cochez la ou les bonnes réponses. Plusieurs cases cochées = question à choix multiples.
                </div>
              </div>
            ))}
          </div>
          <button
            type="button"
            className="btn btn-blue btn-sm"
            style={{ marginTop: "1rem" }}
            onClick={() => setQuestions((qs) => [...qs, { id: `q${Date.now()}`, enonce: "", options: ["", "", ""], bonnes: [] }])}
          >
            + Ajouter une question
          </button>
        </>
      )}

      <div className="form-footer">
        <span className="form-notice">Les modifications ne sont visibles par les élèves qu&apos;après enregistrement.</span>
        <button type="submit" className="btn btn-primary" disabled={enCours || upload.etat === "envoi"}>{enCours ? "Enregistrement…" : "Enregistrer la leçon"}</button>
      </div>
    </form>
  );
}
