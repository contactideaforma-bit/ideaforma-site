import type { Metadata } from "next";
import Link from "next/link";
import Icon from "@/components/Icon";
import Reveal from "@/components/site/Reveal";

export const metadata: Metadata = {
  title: "À propos",
  description:
    "IDEAFORMA, organisme de formation certifié Qualiopi : notre mission, nos valeurs, notre méthode pédagogique et nos engagements.",
};

export default function APropos() {
  return (
    <>
      <div className="page-hero">
        <div className="hero-grid" />
        <span className="overline anim-up">À propos</span>
        <h1 className="anim-up d1">Former pour transformer</h1>
        <p className="anim-up d2">
          IDEAFORMA est né d&apos;une conviction simple : la formation est le levier le plus puissant du
          développement professionnel, à condition d&apos;être concrète, mesurable et agréable à suivre.
        </p>
      </div>

      <section className="section section-white">
        <div className="section-inner">
          <div className="about-grid">
            <Reveal>
              <span className="overline">Notre mission</span>
              <h2 style={{ marginBottom: "1rem" }}>Des parcours ancrés dans la réalité du travail</h2>
              <p style={{ fontSize: "1.02rem", marginBottom: "1rem" }}>
                Nous concevons des formations qui transmettent des savoir-faire directement applicables, pas
                seulement des savoirs. Chaque module s&apos;appuie sur des sources identifiées, des cas pratiques
                et des outils que l&apos;apprenant réutilise dès le lendemain.
              </p>
              <div className="cert-strip">
                {/* eslint-disable-next-line @next/next/no-img-element */}
                <img src="/images/logo-qualiopi.png" alt="Certification Qualiopi" className="cert-logo" />
                <div>
                  <h4>Certification Qualiopi</h4>
                  <p>Référentiel national qualité : rigueur pédagogique et accès aux financements publics (OPCO, France Travail, France Compétences).</p>
                </div>
              </div>
              <div className="cert-strip">
                <div className="icon-box" style={{ margin: 0, flexShrink: 0 }}><Icon name="shield" size={22} /></div>
                <div>
                  <h4>Déclaration d&apos;activité n° 11922999392</h4>
                  <p>Enregistrée auprès du Préfet de Région d&apos;Île-de-France. Cet enregistrement ne vaut pas agrément de l&apos;État.</p>
                </div>
              </div>
            </Reveal>
            <Reveal delay={150} className="about-photo">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img src="/images/formation-digital.png" alt="Formation en ligne IDEAFORMA" />
            </Reveal>
          </div>
        </div>
      </section>

      <section className="section section-bg">
        <div className="section-inner">
          <Reveal className="section-header">
            <span className="overline">Ce qui nous anime</span>
            <h2>Nos valeurs</h2>
          </Reveal>
          <div className="values-grid">
            {[
              ["target", "Pragmatisme", "Chaque apport théorique se traduit en outil concret, applicable dès le retour au poste."],
              ["hand", "Proximité", "Nous prenons le temps de comprendre vos enjeux avant de proposer la moindre solution."],
              ["star", "Exigence", "Des contenus sourcés, relus, alignés sur les référentiels reconnus ; pas de management de comptoir."],
              ["refresh", "Amélioration continue", "Nos parcours évoluent avec les retours des apprenants et les évolutions réglementaires."],
            ].map(([ic, t, d], i) => (
              <Reveal key={t} delay={i * 90} className="value-item">
                <div className={`icon-box${i % 2 ? " amber" : ""}`}><Icon name={ic} size={20} /></div>
                <div><h4>{t}</h4><p>{d}</p></div>
              </Reveal>
            ))}
          </div>
        </div>
      </section>

      <section className="section section-white">
        <div className="section-inner">
          <div className="split-grid">
            <Reveal className="split-photo">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img src="/images/illustration-apprenant.png" alt="Méthode pédagogique IDEAFORMA" />
              <div className="float-card"><Icon name="layers" size={20} /> Un cas fil rouge par formation</div>
            </Reveal>
            <Reveal delay={120} className="split-text">
              <span className="overline">Notre méthode</span>
              <h2>Apprendre en faisant, mesurer en avançant</h2>
              <p>Chaque formation suit une boucle éprouvée, du diagnostic initial à l&apos;évaluation finale.</p>
              <div className="timeline">
                {[
                  ["Diagnostic", "Analyse des besoins, objectifs mesurables, autopositionnement de l'apprenant."],
                  ["Apprentissage", "Vidéos courtes, cours écrits sourcés, podcasts de retour d'expérience, fiches outils."],
                  ["Application", "Cas pratiques corrigés et carnet de bord : chacun transpose à sa propre situation."],
                  ["Évaluation", "Quiz par module, étude de cas finale, attestation détaillée et bilan transmis."],
                ].map(([t, d]) => (
                  <div key={t} className="timeline-item"><h4>{t}</h4><p>{d}</p></div>
                ))}
              </div>
            </Reveal>
          </div>
        </div>
      </section>

      <section className="section section-bg">
        <div className="section-inner">
          <Reveal className="section-header">
            <span className="overline">Notre promesse</span>
            <h2>Nos engagements</h2>
          </Reveal>
          <div className="engagements-grid">
            {[
              ["clock", "Réponse sous 24 h", "Toute demande de renseignement ou de devis reçoit une réponse dans la journée ouvrée."],
              ["target", "Adéquation programme / besoins", "Analyse de vos besoins et adaptation du contenu avant toute formation intra-entreprise."],
              ["chart", "Évaluation systématique", "Bilan à chaud et à froid pour mesurer les acquis et l'impact réel en situation de travail."],
              ["accessibility", "Accessibilité et inclusion", "Référent handicap disponible pour adapter nos dispositifs aux besoins de chaque stagiaire."],
            ].map(([ic, t, d], i) => (
              <Reveal key={t} delay={i * 90} className="engagement-card">
                <div className={`icon-box${i === 3 ? " green" : ""}`}><Icon name={ic} size={20} /></div>
                <div><h4>{t}</h4><p>{d}</p></div>
              </Reveal>
            ))}
          </div>
        </div>
      </section>

      <Reveal className="cta-banner">
        <h2>Envie d&apos;en savoir plus ?</h2>
        <p>Rencontrons-nous pour échanger sur vos projets de formation.</p>
        <div className="cta-actions">
          <Link href="/contact#rdv" className="btn btn-primary btn-lg"><Icon name="calendar" size={18} /> Prendre rendez-vous</Link>
          <Link href="/formations" className="btn btn-outline btn-lg">Voir les formations</Link>
        </div>
      </Reveal>
    </>
  );
}
