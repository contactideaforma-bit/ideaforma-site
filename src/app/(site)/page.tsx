import Link from "next/link";
import Icon from "@/components/Icon";
import FormationCard from "@/components/FormationCard";
import Reveal from "@/components/site/Reveal";
import PlatformMock from "@/components/site/PlatformMock";
import { getFormationsPubliees } from "@/lib/catalogue";

const THEMES = [
  ["users", "Management & leadership"], ["mic", "Communication"], ["shield", "Sécurité au travail"],
  ["monitor", "Bureautique"], ["folder", "Gestion de projet"], ["heart", "Ressources humaines"],
  ["brain", "Intelligence artificielle"], ["wrench", "Automobile"], ["zap", "Prise de parole"],
];

const FAQ = [
  ["Comment se déroule une formation en ligne IDEAFORMA ?", "Vous recevez vos identifiants par e-mail, puis vous accédez à votre espace : vidéos courtes, cours écrits, podcasts, fiches outils, quiz et évaluations. Vous avancez à votre rythme pendant la durée d'accès, et vous suivez votre progression en temps réel."],
  ["La formation peut-elle être financée par mon OPCO ?", "Oui. IDEAFORMA est certifié Qualiopi, condition d'accès aux financements des OPCO et des autres financeurs publics. Nous vous accompagnons dans le montage du dossier et fournissons tous les justificatifs de réalisation."],
  ["Est-ce adapté si je suis en recherche d'emploi ?", "Oui. Nos parcours sont conçus pour des adultes en activité ou en transition. Contactez-nous pour étudier les possibilités de prise en charge selon votre situation."],
  ["Que se passe-t-il à la fin du parcours ?", "Vous recevez une attestation de réalisation qui précise les compétences travaillées, les évaluations réussies et le temps de formation, utilisable auprès de votre employeur ou dans un dossier de candidature."],
  ["Puis-je suivre la formation sur mobile ?", "Oui. La plateforme fonctionne sur ordinateur, tablette et smartphone. Les vidéos sont sous-titrées et les podcasts transcrits."],
];

export default async function Accueil() {
  const formations = (await getFormationsPubliees()).slice(0, 3);

  return (
    <>
      {/* ── HERO ── */}
      <section className="hero">
        <div className="hero-grid" />
        <div className="blob blob-1" /><div className="blob blob-2" /><div className="blob blob-3" />
        <div className="hero-inner">
          <div>
            <div className="hero-badge anim-up"><span className="dot"><Icon name="award" size={14} /></span> Organisme de formation certifié Qualiopi</div>
            <h1 className="anim-up d1">
              Des formations qui font <span className="accent">progresser</span> vos équipes, pour de vrai.
            </h1>
            <p className="hero-lead anim-up d2">
              Management, communication, bureautique, sécurité : des parcours en ligne construits sur des
              référentiels reconnus, avec vidéos, podcasts, quiz et suivi de progression. Pour les entreprises,
              les salariés et les personnes en transition professionnelle.
            </p>
            <div className="hero-actions anim-up d3">
              <Link href="/formations" className="btn btn-primary btn-lg">Découvrir les formations <Icon name="arrow-right" size={18} className="arrow" /></Link>
              <Link href="/contact#rdv" className="btn btn-ghost btn-lg"><Icon name="calendar" size={18} /> Échanger 30 minutes</Link>
            </div>
            <div className="hero-proof anim-up d4">
              <div className="proof"><span className="ico"><Icon name="monitor" size={17} /></span>100 % en ligne, à votre rythme</div>
              <div className="proof"><span className="ico"><Icon name="euro" size={17} /></span>Finançable par votre OPCO</div>
              <div className="proof"><span className="ico"><Icon name="clock" size={17} /></span>Réponse sous 24 h ouvrées</div>
            </div>
          </div>
          <div className="hero-visual anim-up d2">
            <PlatformMock />
          </div>
        </div>
      </section>

      {/* ── BANDEAU DÉFILANT ── */}
      <div className="marquee" aria-hidden="true">
        <div className="marquee-track">
          {[...THEMES, ...THEMES].map(([ic, label], i) => (
            <span key={i} className="marquee-item"><Icon name={ic} size={18} /> {label}</span>
          ))}
        </div>
      </div>

      {/* ── ATOUTS ── */}
      <section className="section section-bg">
        <div className="section-inner">
          <Reveal className="section-header">
            <span className="overline">Pourquoi IDEAFORMA</span>
            <h2>Une formation sérieuse n&apos;a pas besoin d&apos;être ennuyeuse</h2>
            <p>Nous concevons chaque parcours comme un produit : des objectifs clairs, des formats variés, des sources citées, et une plateforme agréable à utiliser.</p>
          </Reveal>
          <div className="features-grid">
            {[
              ["award", "Certifié Qualiopi", "Qualité des processus pédagogiques contrôlée, accès aux financements OPCO."],
              ["layers", "Référentiels reconnus", "Nos programmes s'alignent sur les certifications enregistrées par France Compétences."],
              ["sparkles", "Formats qui engagent", "Vidéos courtes, podcasts, cas pratiques, quiz : on apprend en faisant."],
              ["chart", "Progression mesurée", "Évaluations, tableau de bord et attestation détaillée en fin de parcours."],
            ].map(([ic, t, d], i) => (
              <Reveal key={t} delay={i * 90} className="feature-item">
                <div className={`icon-box${i === 1 ? " amber" : i === 2 ? " purple" : i === 3 ? " green" : ""}`}><Icon name={ic} size={22} /></div>
                <div><h4>{t}</h4><p>{d}</p></div>
              </Reveal>
            ))}
          </div>
        </div>
      </section>

      {/* ── COMMENT ÇA MARCHE ── */}
      <section className="section section-white">
        <div className="section-inner">
          <Reveal className="section-header">
            <span className="overline">Comment ça marche</span>
            <h2>De la première prise de contact à l&apos;attestation, en quatre étapes</h2>
          </Reveal>
          <div className="steps">
            {[
              ["message", "Vous nous parlez de votre besoin", "Un échange de 30 minutes pour comprendre votre contexte, vos objectifs et votre financement."],
              ["clipboard", "Nous construisons le parcours", "Programme, convention, devis et dossier OPCO : nous nous occupons de l'administratif."],
              ["play", "Vous vous formez en ligne", "Vidéos, podcasts, cours, quiz et cas pratiques, à votre rythme, avec un suivi de progression."],
              ["award", "Vous obtenez votre attestation", "Évaluation finale, attestation de réalisation détaillée et plan d'action personnel."],
            ].map(([ic, t, d], i) => (
              <Reveal key={t} delay={i * 100} className="step">
                <span className="num">{i + 1}</span>
                <div className="icon-box"><Icon name={ic} size={22} /></div>
                <h3>{t}</h3>
                <p>{d}</p>
              </Reveal>
            ))}
          </div>
        </div>
      </section>

      {/* ── PLATEFORME ── */}
      <section className="section section-bg">
        <div className="section-inner">
          <div className="split-grid">
            <Reveal className="split-text">
              <span className="overline">La plateforme</span>
              <h2>Un espace de formation pensé pour donner envie de continuer</h2>
              <p>
                Chaque apprenant dispose d&apos;un espace personnel : ses formations, sa progression, ses résultats.
                Les contenus sont protégés et accessibles pendant toute la durée convenue.
              </p>
              <ul className="check-list">
                {[
                  "Vidéos sous-titrées, podcasts transcrits, cours écrits structurés",
                  "Quiz corrigés instantanément avec explications",
                  "Cas pratiques et fiches outils réutilisables au travail",
                  "Suivi de progression et justificatifs de réalisation pour votre OPCO",
                ].map((t) => (
                  <li key={t}><span className="ck"><Icon name="check" size={14} /></span>{t}</li>
                ))}
              </ul>
              <Link href="/formations" className="btn btn-blue">Voir les formations <Icon name="arrow-right" size={16} className="arrow" /></Link>
            </Reveal>
            <Reveal delay={150} className="split-photo">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img src="/images/elearning-laptop.png" alt="Apprenant sur la plateforme IDEAFORMA" />
              <div className="float-card"><Icon name="check-circle" size={20} /> Module 3 validé — 92 %</div>
            </Reveal>
          </div>
        </div>
      </section>

      {/* ── FORMATIONS ── */}
      <section className="section section-white">
        <div className="section-inner">
          <Reveal className="section-header">
            <span className="overline">Le catalogue</span>
            <h2>Des formations pour chaque étape de votre parcours</h2>
            <p>Management, communication, bureautique, sécurité, gestion de projet, ressources humaines.</p>
          </Reveal>
          <div className="formations-grid">
            {formations.map((f, i) => (
              <Reveal key={f.id} delay={i * 100}><FormationCard formation={f} /></Reveal>
            ))}
          </div>
          <Reveal className="center mt-3">
            <Link href="/formations" className="btn btn-ghost">Toutes les formations <Icon name="arrow-right" size={16} className="arrow" /></Link>
          </Reveal>
        </div>
      </section>

      {/* ── PUBLICS ── */}
      <section className="section section-bg">
        <div className="section-inner">
          <Reveal className="section-header">
            <span className="overline">Pour qui</span>
            <h2>Entreprises, salariés, personnes en transition</h2>
          </Reveal>
          <div className="audience">
            {[
              ["Entreprises", "briefcase", "Faites monter vos équipes en compétences sans immobiliser vos plannings.", ["Programmes adaptés à votre métier", "Convention, devis et dossier OPCO pris en charge", "Suivi individuel de chaque collaborateur", "Bilan transmis à l'issue du parcours"]],
              ["Salariés", "user", "Progressez vers un nouveau poste ou consolidez vos responsabilités actuelles.", ["Formation à votre rythme, en dehors ou pendant le temps de travail", "Attestation détaillée des compétences", "Financement possible via le plan de développement des compétences", "Accompagnement par e-mail sous 24 h"]],
              ["En recherche d'emploi", "compass", "Préparez un poste avec responsabilités et valorisez de nouvelles compétences.", ["Parcours alignés sur les attentes du marché", "Cas pratiques transposables à un entretien", "Étude des solutions de prise en charge", "Plan d'action personnel en fin de formation"]],
            ].map(([t, ic, d, items], i) => (
              <Reveal key={t as string} delay={i * 100} className="card card-hover">
                <span className="tag">{t as string}</span>
                <div className="icon-box"><Icon name={ic as string} size={22} /></div>
                <p>{d as string}</p>
                <ul>{(items as string[]).map((x) => <li key={x}><Icon name="check-circle" size={15} />{x}</li>)}</ul>
              </Reveal>
            ))}
          </div>
        </div>
      </section>

      {/* ── FAQ ── */}
      <section className="section section-white">
        <div className="section-inner">
          <Reveal className="section-header">
            <span className="overline">Questions fréquentes</span>
            <h2>Tout ce qu&apos;il faut savoir avant de commencer</h2>
          </Reveal>
          <Reveal className="faq">
            {FAQ.map(([q, a]) => (
              <details key={q}>
                <summary>{q} <Icon name="chevron-down" size={18} /></summary>
                <div className="faq-body">{a}</div>
              </details>
            ))}
          </Reveal>
        </div>
      </section>

      {/* ── CTA ── */}
      <Reveal className="cta-banner">
        <h2>Prêt à former vos équipes, ou vous-même ?</h2>
        <p>Échangeons 30 minutes sur votre projet. Sans engagement, avec une proposition claire sous 48 h.</p>
        <div className="cta-actions">
          <Link href="/contact#rdv" className="btn btn-primary btn-lg"><Icon name="calendar" size={18} /> Prendre rendez-vous</Link>
          <Link href="/contact" className="btn btn-outline btn-lg">Demander un devis</Link>
        </div>
      </Reveal>
    </>
  );
}
