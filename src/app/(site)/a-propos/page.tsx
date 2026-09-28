import type { Metadata } from "next";
import Link from "next/link";

export const metadata: Metadata = {
  title: "À Propos",
  description:
    "IDEAFORMA, organisme de formation certifié Qualiopi : notre mission, nos valeurs, notre approche pédagogique et nos engagements.",
};

export default function APropos() {
  return (
    <>
      <div className="page-hero page-hero-apropos">
        <h1>À Propos d&apos;IDEAFORMA</h1>
        <p>Notre mission : rendre la formation professionnelle concrète, utile et mesurable pour chaque entreprise et chaque apprenant.</p>
      </div>

      <section className="section section-bg">
        <div className="section-inner">
          <div className="about-grid">
            <div>
              <span className="overline">Notre mission</span>
              <h2 style={{ color: "var(--blue-dark)", margin: ".5rem 0 1rem" }}>Former pour transformer</h2>
              <p style={{ fontSize: "1rem", marginBottom: "1rem" }}>
                IDEAFORMA est né d&apos;une conviction simple :{" "}
                <strong>la formation est le levier le plus puissant du développement humain et professionnel.</strong>
              </p>
              <p style={{ marginBottom: "1.5rem" }}>
                Nous concevons des parcours de formation ancrés dans la réalité du terrain, animés par des
                experts praticiens qui transmettent non seulement des savoirs, mais des savoir-faire
                directement applicables.
              </p>
              <div className="cert-strip">
                {/* eslint-disable-next-line @next/next/no-img-element */}
                <img src="/images/logo-qualiopi.png" alt="Certification Qualiopi" className="cert-logo" />
                <div>
                  <h4>Certification Qualiopi</h4>
                  <p>IDEAFORMA est certifié Qualiopi (référentiel national qualité) — gage de rigueur pédagogique et condition pour accéder aux financements publics (OPCO, France Compétences).</p>
                </div>
              </div>
              <div className="cert-strip" style={{ marginTop: "1rem" }}>
                <div className="cert-badge">📋</div>
                <div>
                  <h4>Numéro DA : 11922999392</h4>
                  <p>Déclaration d&apos;activité enregistrée auprès du Préfet de Région d&apos;Île-de-France.</p>
                </div>
              </div>
            </div>
            <div className="about-photo">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img src="/images/formation-digital.png" alt="Formation digitale IDEAFORMA" />
            </div>
          </div>
        </div>
      </section>

      <section className="section section-white">
        <div className="section-inner">
          <div className="section-header">
            <span className="overline">Ce qui nous anime</span>
            <h2>Nos valeurs</h2>
            <p>Des principes qui guident chacune de nos formations et toutes nos interactions.</p>
          </div>
          <div className="values-grid">
            <div className="value-item"><div className="v-icon">🎯</div><div><h4>Pragmatisme</h4><p>Chaque apport théorique se traduit en outils concrets, applicables dès le retour au poste.</p></div></div>
            <div className="value-item"><div className="v-icon">🤝</div><div><h4>Proximité</h4><p>Nous prenons le temps de comprendre vos enjeux avant de proposer la moindre solution.</p></div></div>
            <div className="value-item"><div className="v-icon">⭐</div><div><h4>Excellence pédagogique</h4><p>Nos formateurs sont sélectionnés pour leur expertise terrain autant que pour leur pédagogie.</p></div></div>
            <div className="value-item"><div className="v-icon">🔄</div><div><h4>Amélioration continue</h4><p>Nous faisons évoluer nos contenus en permanence pour rester à l&apos;état de l&apos;art.</p></div></div>
          </div>
        </div>
      </section>

      <section className="section section-bg">
        <div className="section-inner">
          <div className="section-header">
            <span className="overline">Comment nous travaillons</span>
            <h2>Notre approche pédagogique</h2>
            <p>Chaque formation IDEAFORMA suit un processus rigoureux, du diagnostic initial à l&apos;évaluation finale.</p>
          </div>
          <div className="split-grid">
            <div className="split-photo">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img src="/images/training-dev.png" alt="Approche pédagogique IDEAFORMA" />
            </div>
            <div className="split-text">
              <ul>
                <li>Analyse des besoins et des objectifs avant toute intervention</li>
                <li>Programme adapté au contexte métier de l&apos;entreprise</li>
                <li>Pédagogie active : cas pratiques, mises en situation, échanges réels</li>
                <li>Plateforme en ligne : supports, vidéos, quiz et suivi de progression</li>
                <li>Évaluation des acquis à chaud et à froid</li>
                <li>Compte-rendu et bilan transmis à l&apos;entreprise commanditaire</li>
              </ul>
              <Link href="/contact" className="btn btn-blue">Discuter de votre projet →</Link>
            </div>
          </div>
        </div>
      </section>

      <section className="section section-white">
        <div className="section-inner">
          <div className="section-header">
            <span className="overline">Notre promesse</span>
            <h2>Nos engagements</h2>
          </div>
          <div className="engagements-grid">
            <div className="engagement-card"><div className="engagement-icon">📞</div><div><h4>Réponse sous 24h</h4><p>Toute demande de renseignement ou de devis reçoit une réponse dans la journée ouvrable.</p></div></div>
            <div className="engagement-card"><div className="engagement-icon">🎯</div><div><h4>Adéquation programme / besoins</h4><p>Analyse de vos besoins et adaptation du contenu avant toute formation intra-entreprise.</p></div></div>
            <div className="engagement-card"><div className="engagement-icon">📊</div><div><h4>Évaluation systématique</h4><p>Bilan à chaud et à froid pour mesurer les acquis et l&apos;impact réel en situation de travail.</p></div></div>
            <div className="engagement-card"><div className="engagement-icon">♿</div><div><h4>Accessibilité &amp; inclusion</h4><p>Référent handicap disponible pour adapter nos dispositifs aux besoins spécifiques de chaque stagiaire.</p></div></div>
          </div>
        </div>
      </section>

      <div className="cta-banner">
        <h2>Envie d&apos;en savoir plus ?</h2>
        <p>Rencontrons-nous pour échanger sur vos projets de formation.</p>
        <div className="cta-actions">
          <Link href="/contact#rdv" className="btn btn-primary">📅 Prendre RDV</Link>
          <Link href="/formations" className="btn btn-outline">Voir nos formations</Link>
        </div>
      </div>
    </>
  );
}
