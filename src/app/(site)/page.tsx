import Link from "next/link";
import FormationCard from "@/components/FormationCard";
import { getFormationsPubliees } from "@/lib/catalogue";

export default async function Accueil() {
  const formations = (await getFormationsPubliees()).slice(0, 3);

  return (
    <>
      <section className="hero">
        <div className="hero-inner">
          <div className="hero-badge">✅ Organisme certifié Qualiopi</div>
          <h1>
            Développez les <em>compétences</em> qui font la différence
          </h1>
          <p>
            IDEAFORMA conçoit des formations professionnelles sur-mesure pour faire monter vos
            équipes en puissance — en ligne, en visioconférence ou directement dans vos locaux.
          </p>
          <div className="hero-actions">
            <Link href="/formations" className="btn btn-primary">Découvrir nos formations</Link>
            <Link href="/contact#rdv" className="btn btn-outline">📅 Prendre RDV</Link>
          </div>
          <div className="hero-stats">
            <div className="stat"><span className="stat-num">🏅</span><span className="stat-label">Certifié Qualiopi</span></div>
            <div className="stat"><span className="stat-num">💻</span><span className="stat-label">100 % en ligne ou intra-entreprise</span></div>
            <div className="stat"><span className="stat-num">🎯</span><span className="stat-label">Programmes sur-mesure</span></div>
            <div className="stat"><span className="stat-num">📋</span><span className="stat-label">Financement OPCO</span></div>
          </div>
        </div>
      </section>

      <div className="features-strip">
        <div className="section-inner">
          <div className="features-grid">
            <div className="feature-item"><div className="feature-icon">🏅</div><div><h4>Certification Qualiopi</h4><p>Qualité certifiée, financement facilité</p></div></div>
            <div className="feature-item"><div className="feature-icon">🎯</div><div><h4>Formations sur-mesure</h4><p>Adaptées à vos enjeux métier</p></div></div>
            <div className="feature-item"><div className="feature-icon">💻</div><div><h4>En ligne &amp; intra-entreprise</h4><p>Plateforme e-learning, visio ou vos locaux</p></div></div>
            <div className="feature-item"><div className="feature-icon">💶</div><div><h4>Financement OPCO</h4><p>Nous vous accompagnons dans vos démarches</p></div></div>
          </div>
        </div>
      </div>

      <section className="section section-white">
        <div className="section-inner">
          <div className="split-grid">
            <div className="split-photo">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img src="/images/illustration-apprenant.png" alt="Apprenant en formation IDEAFORMA" />
            </div>
            <div className="split-text">
              <span className="overline">Notre approche</span>
              <h2>Apprendre autrement, progresser durablement</h2>
              <p>
                Chez IDEAFORMA, chaque formation est conçue autour d&apos;une conviction : la théorie ne
                suffit pas. Nos formateurs, tous issus du terrain, transmettent des méthodes directement
                applicables au poste de travail.
              </p>
              <ul>
                <li>Pédagogie active : mises en situation, jeux de rôle, cas réels</li>
                <li>Groupes de 6 à 12 personnes maximum pour un suivi individualisé</li>
                <li>Évaluation des acquis avant, pendant et après la formation</li>
                <li>Plateforme en ligne : cours, vidéos, quiz et suivi de progression</li>
              </ul>
              <Link href="/a-propos" className="btn btn-blue">En savoir plus sur IDEAFORMA →</Link>
            </div>
          </div>
        </div>
      </section>

      <section className="section section-bg">
        <div className="section-inner">
          <div className="section-header">
            <span className="overline">Notre catalogue</span>
            <h2>Des formations pour chaque besoin</h2>
            <p>Management, communication, bureautique, sécurité… découvrez nos formations conçues pour le monde professionnel d&apos;aujourd&apos;hui.</p>
          </div>
          <div className="formations-grid">
            {formations.map((f) => (
              <FormationCard key={f.id} formation={f} />
            ))}
          </div>
          <div className="center mt-3">
            <Link href="/formations" className="btn btn-blue">Voir toutes les formations →</Link>
          </div>
        </div>
      </section>

      <section className="section section-white">
        <div className="section-inner">
          <div className="section-header">
            <span className="overline">Notre engagement</span>
            <h2>La qualité, pas les promesses</h2>
            <p>IDEAFORMA construit sa réputation sur des fondements concrets : certification, pédagogie active et accompagnement personnalisé.</p>
          </div>
          <div className="formations-grid" style={{ gridTemplateColumns: "repeat(auto-fill, minmax(260px, 1fr))" }}>
            <div className="card card-hover"><div className="card-icon">🏅</div><h3>Certifié Qualiopi</h3><p>Notre certification garantit la qualité de nos processus pédagogiques et ouvre l&apos;accès aux financements OPCO.</p></div>
            <div className="card card-hover"><div className="card-icon">🎯</div><h3>Analyse des besoins</h3><p>Chaque formation commence par un entretien approfondi pour cerner vos enjeux et adapter le programme à votre contexte métier réel.</p></div>
            <div className="card card-hover"><div className="card-icon">💬</div><h3>Pédagogie active</h3><p>Mises en situation, cas concrets, échanges pratiques : nous privilégions l&apos;apprentissage par l&apos;expérience.</p></div>
            <div className="card card-hover"><div className="card-icon">📊</div><h3>Évaluation mesurée</h3><p>Chaque formation fait l&apos;objet d&apos;une évaluation des acquis et d&apos;un bilan de satisfaction remis à l&apos;entreprise.</p></div>
          </div>
          <div className="center mt-2">
            <Link href="/a-propos" className="btn btn-blue">Notre engagement qualité →</Link>
          </div>
        </div>
      </section>

      <div className="cta-banner">
        <h2>Prêt à former vos équipes ?</h2>
        <p>Échangeons sur vos besoins et construisons ensemble le parcours de formation idéal.</p>
        <div className="cta-actions">
          <Link href="/contact#rdv" className="btn btn-primary">📅 Prendre RDV gratuit</Link>
          <Link href="/contact" className="btn btn-outline">Demander un devis</Link>
        </div>
      </div>
    </>
  );
}
