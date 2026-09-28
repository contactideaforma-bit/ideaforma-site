import type { Metadata } from "next";
import Link from "next/link";
import FormationCard from "@/components/FormationCard";
import { getFormationsPubliees } from "@/lib/catalogue";
import { CATEGORIES } from "@/lib/types";

export const metadata: Metadata = {
  title: "Nos Formations",
  description:
    "Catalogue des formations IDEAFORMA : management, communication, bureautique, sécurité, gestion de projet. Financement OPCO.",
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
      <div className="page-hero page-hero-formations">
        <h1>Nos Formations</h1>
        <p>
          Des formations professionnelles finançables via votre OPCO, animées par des formateurs
          experts de leur domaine — en ligne sur notre plateforme, en visio ou dans vos locaux.
        </p>
      </div>

      <section className="section">
        <div className="section-inner">
          <div className="filter-bar">
            <Link href="/formations" className={`filter-btn${!cat ? " active" : ""}`}>Toutes</Link>
            {categoriesPresentes.map((c) => (
              <Link
                key={c.value}
                href={`/formations?cat=${c.value}`}
                className={`filter-btn${cat === c.value ? " active" : ""}`}
              >
                {c.label}
              </Link>
            ))}
          </div>

          {actives.length === 0 ? (
            <div className="empty">
              <div className="big">🔎</div>
              Aucune formation dans cette catégorie pour le moment.
            </div>
          ) : (
            <div className="formations-grid">
              {actives.map((f) => (
                <FormationCard key={f.id} formation={f} detail />
              ))}
            </div>
          )}
        </div>
      </section>

      <div className="cta-banner">
        <h2>Vous ne trouvez pas votre formation ?</h2>
        <p>Nous concevons des parcours sur-mesure adaptés à vos besoins spécifiques.</p>
        <div className="cta-actions">
          <Link href="/contact#rdv" className="btn btn-primary">📅 Discutons de votre projet</Link>
          <Link href="/contact" className="btn btn-outline">Demander un devis</Link>
        </div>
      </div>
    </>
  );
}
