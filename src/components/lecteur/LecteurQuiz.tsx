"use client";

import { useRef, useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { soumettreQuiz, type ResultatQuiz } from "@/app/espace/actions";
import Icon from "@/components/Icon";

type QuestionAffichee = { id: string; enonce: string; options: string[]; multiple: boolean };

export default function LecteurQuiz({
  formationId, leconId, titre, questions, seuil, tentativesMax, tentativesFaites, meilleurScore, dejaReussi, consigne, essai,
}: {
  formationId: string;
  leconId: string;
  titre: string;
  questions: QuestionAffichee[];
  seuil: number;
  tentativesMax: number;
  tentativesFaites: number;
  meilleurScore: number | null;
  dejaReussi: boolean;
  consigne?: string;
  /** Mode essai (aperçu administrateur) : correction locale, rien n'est enregistré. */
  essai?: { bonnes: number[][]; explications: Record<string, string>; corrections: boolean };
}) {
  const router = useRouter();
  const [reponses, setReponses] = useState<number[][]>(questions.map(() => []));
  const [resultat, setResultat] = useState<ResultatQuiz | null>(null);
  const [enCours, startTransition] = useTransition();
  const [faites, setFaites] = useState(tentativesFaites);
  const debut = useRef<number>(Date.now());

  const epuise = !essai && tentativesMax > 0 && faites >= tentativesMax;
  const toutesRepondues = reponses.every((r) => r.length > 0);

  function choisir(qi: number, k: number, multiple: boolean) {
    setReponses((rs) => rs.map((r, i) => {
      if (i !== qi) return r;
      if (!multiple) return [k];
      return r.includes(k) ? r.filter((x) => x !== k) : [...r, k].sort((a, b) => a - b);
    }));
  }

  function soumettre() {
    if (!toutesRepondues && !window.confirm("Certaines questions sont sans réponse. Soumettre quand même ?")) return;
    if (essai) {
      const detail = questions.map((q, i) => {
        const choisis = [...new Set<number>(reponses[i] ?? [])].sort((a, b) => a - b);
        const bonnes = [...new Set<number>(essai.bonnes[i] ?? [])].sort((a, b) => a - b);
        const correct = choisis.length === bonnes.length && choisis.every((v, k) => v === bonnes[k]);
        return { id: q.id, correct, choisis, bonnes };
      });
      const justes = detail.filter((d) => d.correct).length;
      const score = questions.length ? Math.round((1000 * justes) / questions.length) / 10 : 0;
      setResultat({ ok: true, score, justes, total: questions.length, reussi: score >= seuil, seuil, tentative: faites + 1, tentatives_max: tentativesMax, detail, corrections: true, explications: essai.explications });
      setFaites((n) => n + 1);
      return;
    }
    startTransition(async () => {
      const r = await soumettreQuiz(formationId, leconId, reponses, (Date.now() - debut.current) / 1000);
      setResultat(r);
      if (r.ok) { setFaites((n) => n + 1); router.refresh(); }
    });
  }

  function recommencer() {
    setResultat(null);
    setReponses(questions.map(() => []));
    debut.current = Date.now();
  }

  if (questions.length === 0) return <div className="empty">Ce {titre.toLowerCase()} n&apos;a pas encore de questions.</div>;

  // ── Écran de résultat ──
  if (resultat?.ok) {
    type Detail = NonNullable<ResultatQuiz["detail"]>[number];
    const detail = new Map<string, Detail>((resultat.detail ?? []).map((d: Detail) => [d.id, d]));
    return (
      <div>
        {essai && <div className="alert alert-info"><Icon name="settings" size={16} /> <span>Mode essai administrateur : ce résultat n&apos;est pas enregistré. Les corrections et explications sont toujours affichées ici, même si le quiz les masque aux élèves.</span></div>}
        <div className={`alert ${resultat.reussi ? "alert-success" : "alert-warn"}`} style={{ fontSize: "1rem" }}>
          <Icon name={resultat.reussi ? "party" : "frown"} size={20} /> <span>{resultat.reussi ? "Réussi !" : "Pas encore…"} Score : <strong>{resultat.score} %</strong> ({resultat.justes}/{resultat.total} bonnes réponses, seuil {resultat.seuil} %).
          {resultat.tentatives_max ? ` Tentative ${resultat.tentative} sur ${resultat.tentatives_max}.` : ` Tentative n° ${resultat.tentative}.`}</span>
        </div>
        {resultat.corrections && (
          <div className="module-list">
            {questions.map((q, i) => {
              const d = detail.get(q.id);
              return (
                <div key={q.id} className="module-item" style={{ borderColor: d?.correct ? "rgba(63,181,121,.5)" : "rgba(214,69,69,.4)" }}>
                  <header><h3><span className="num">{i + 1}</span>{q.enonce}</h3>{d?.correct ? <span className="badge badge-green">Correct</span> : <span className="badge badge-red">Incorrect</span>}</header>
                  <div className="lecon-list">
                    {q.options.map((o, k) => {
                      const bonne = d?.bonnes.includes(k);
                      const choisie = d?.choisis.includes(k);
                      return (
                        <div key={k} className="lecon-item" style={{ background: bonne ? "rgba(63,181,121,.14)" : choisie ? "rgba(214,69,69,.10)" : undefined }}>
                          <span className={`lecon-ico${bonne ? " done" : ""}`}><Icon name={bonne ? "check" : choisie ? "x" : "chevron-right"} size={14} /></span><span>{o}</span>
                        </div>
                      );
                    })}
                  </div>
                  {resultat.explications?.[q.id] && <p style={{ marginTop: ".5rem", fontSize: ".85rem", display: "flex", gap: ".4rem" }}><Icon name="lightbulb" size={16} /> <span>{resultat.explications[q.id]}</span></p>}
                </div>
              );
            })}
          </div>
        )}
        <div className="actions-row" style={{ marginTop: "1rem" }}>
          {(essai || (!resultat.reussi && !(tentativesMax > 0 && faites >= tentativesMax))) && (
            <button type="button" className="btn btn-primary" onClick={recommencer}>Réessayer</button>
          )}
        </div>
      </div>
    );
  }

  // ── Formulaire ──
  return (
    <div>
      {essai && <div className="alert alert-info"><Icon name="settings" size={16} /> <span>Mode essai administrateur : vous pouvez répondre et voir la correction, rien n&apos;est enregistré et les tentatives ne sont pas décomptées.</span></div>}
      {dejaReussi && <div className="alert alert-success">Vous avez déjà validé ce {titre.toLowerCase()}{meilleurScore !== null ? ` (meilleur score : ${meilleurScore} %)` : ""}. Vous pouvez le refaire pour vous entraîner.</div>}
      {resultat && !resultat.ok && <div className="alert alert-error">{resultat.erreur}</div>}
      <p style={{ fontSize: ".9rem", marginBottom: "1rem" }}>
        {questions.length} question{questions.length > 1 ? "s" : ""} · seuil de réussite {seuil} %
        {tentativesMax > 0 ? ` · ${Math.max(0, tentativesMax - faites)} tentative(s) restante(s)` : ""}
        {consigne ? ` · ${consigne}` : ""}
      </p>
      {epuise ? (
        <div className="alert alert-warn">Nombre maximum de tentatives atteint. Contactez votre formateur si nécessaire.</div>
      ) : (
        <>
          <div className="module-list">
            {questions.map((q, i) => (
              <div key={q.id} className="module-item">
                <header><h3><span className="num">{i + 1}</span>{q.enonce}</h3>{q.multiple && <span className="badge badge-blue">plusieurs réponses</span>}</header>
                <div className="lecon-list">
                  {q.options.map((o, k) => (
                    <label key={k} className="lecon-item" style={{ cursor: "pointer", background: reponses[i].includes(k) ? "rgba(74,159,212,.14)" : undefined }}>
                      <input
                        type={q.multiple ? "checkbox" : "radio"}
                        name={`q-${q.id}`}
                        checked={reponses[i].includes(k)}
                        onChange={() => choisir(i, k, q.multiple)}
                        style={{ accentColor: "var(--blue)" }}
                      />
                      <span>{o}</span>
                    </label>
                  ))}
                </div>
              </div>
            ))}
          </div>
          <div className="actions-row" style={{ marginTop: "1rem" }}>
            <button type="button" className="btn btn-primary" disabled={enCours} onClick={soumettre}>
              {enCours ? "Correction…" : "Valider mes réponses"}
            </button>
          </div>
        </>
      )}
    </div>
  );
}
