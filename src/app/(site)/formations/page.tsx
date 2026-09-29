import type { Metadata } from "next";
import Link from "next/link";
import Icon from "@/components/Icon";
import FormationCard from "@/components/FormationCard";
import Reveal from "@/components/site/Reveal";
import { getFormationsPubliees } from "@/lib/catalogue";
import { CATEGORIES } from "@/lib/types";

export const metadata: Metadata = {
  title: "Nos Formations",
  description:
    "Catalogue des formations IDEAFORMA : management, communication, bureautique, sécurité, gestion de projet. 100 % en ligne, finançables par votre OPCO.",
};

export default async function Formations({
  searchParams,
}: {
  searchParams: Promise<{ cat?: string }>;
}) {
  const { cat } = await searchParams;
  const toutes = await getFormationsPubliees();
  const categoriesPresentes = CATEGORIES.filter((c) => toutes.some((f) => f.categorie === c.value));
  const actives = cat ? toutes.filter((f) => f.categorie === cat) : toutes;

  return (
    <>
      <div className="page-hero">
        <div className="hero-grid" />
        <span className="overline anim-up">Catalogue</span>
        <h1 className="anim-up d1">Nos formations</h1>
        <p className="anim-up d2">
          Des parcours 100 % en ligne, construits sur des référentiels reconnus et finançables par votre OPCO.
          Chaque formation combine vidéos, podcasts, cours écrits, cas pratiques et évaluations.
        </p>
      </div>

      <section className="section-tight section-white">
        <div className="section-inner">
          <div className="stats-band">
            <div><Icon name="monitor" size={22} /><div className="big">100 %</div><div className="lbl">en ligne, à votre rythme</div></div>
            <div><Icon name="award" size={22} /><div className="big">Qualiopi</div><div className="lbl">organisme certifié</div></div>
            <div><Icon name="euro" size={22} /><div className="big">OPCO</div><div className="lbl">financement accompagné</div></div>
            <div><Icon name="clock" size={22} /><div className="big">24 h</div><div className="lbl">délai de réponse ouvré</div></div>
          </div>
        </div>
      </section>

      <section className="section section-bg" style={{ paddingTop: "3rem" }}>
        <div className="section-inner">
          <div className="filter-bar">
            <Link href="/formations" className={`filter-btn${!cat ? " active" : ""}`}><Icon name="layers" size={15} /> Toutes</Link>
            {categoriesPresentes.map((c) => (
              <Link key={c.value} href={`/formations?cat=${c.value}`} className={`filter-btn${cat === c.value ? " active" : ""}`}>
                <Icon name={c.icone} size={15} /> {c.label}
              </Link>
            ))}
          </div>

          <p className="center" style={{ fontSize: ".86rem", marginTop: "-1rem", marginBottom: "2rem" }}>
            Tarifs inter-entreprises, par personne, hors taxes. Intra-entreprise, groupes et parcours sur-mesure : sur devis. Prise en charge OPCO possible.
          </p>

          {actives.length === 0 ? (
            <div className="empty">
              <div className="big"><Icon name="compass" size={26} /></div>
              Aucune formation dans cette catégorie pour le moment.
            </div>
          ) : (
            <div className="formations-grid">
              {actives.map((f, i) => (
                <Reveal key={f.id} delay={(i % 3) * 90}><FormationCard formation={f} detail /></Reveal>
              ))}
            </div>
          )}
        </div>
      </section>

      <section className="section section-white">
        <div className="section-inner">
          <div className="split-grid">
            <Reveal className="split-photo">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img src="/images/training-dev.png" alt="Conception d'une formation sur-mesure" />
              <div className="float-card"><Icon name="sparkles" size={20} /> Programme sur-mesure sous 48 h</div>
            </Reveal>
            <Reveal delay={120} className="split-text">
              <span className="overline">Sur-mesure</span>
              <h2>Vous ne trouvez pas votre formation ?</h2>
              <p>
                Nous concevons des parcours adaptés à votre métier et à vos contraintes : durée, modalités,
                cas pratiques issus de votre activité. Dites-nous ce dont votre équipe a besoin.
              </p>
              <ul className="check-list">
                <li><span className="ck"><Icon name="check" size={14} /></span>Analyse des besoins et objectifs mesurables</li>
                <li><span className="ck"><Icon name="check" size={14} /></span>Programme, convention et dossier de financement</li>
                <li><span className="ck"><Icon name="check" size={14} /></span>Évaluations et bilan transmis à l&apos;entreprise</li>
              </ul>
              <Link href="/contact" className="btn btn-primary">Parler de mon projet <Icon name="arrow-right" size={16} className="arrow" /></Link>
            </Reveal>
          </div>
        </div>
      </section>
    </>
  );
}
