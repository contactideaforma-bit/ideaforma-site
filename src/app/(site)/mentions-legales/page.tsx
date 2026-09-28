import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Mentions légales",
  robots: { index: false },
};

export default function MentionsLegales() {
  return (
    <>
      <div className="page-hero page-hero-simple">
        <h1>Mentions légales</h1>
      </div>
      <section className="section">
        <div className="section-inner prose">
          <h2>Éditeur du site</h2>
          <p>
            IDEAFORMA — SASU, RCS Nanterre 993 125 335 — SIRET 993 125 335 000 14 — Code NAF 8559A.
            <br />
            Siège social : 144 avenue Charles de Gaulle, 92200 Neuilly-sur-Seine.
            <br />
            Téléphone : 06 25 16 13 93 — E-mail : contact.ideaforma@gmail.com.
            <br />
            Directrice de la publication : Madame Myriam Ayouaz, Présidente.
          </p>
          <p>
            Organisme de formation enregistré sous le numéro de déclaration d&apos;activité 11922999392 auprès du
            Préfet de Région d&apos;Île-de-France (cet enregistrement ne vaut pas agrément de l&apos;État). Certifié
            Qualiopi au titre des actions de formation, des bilans de compétences et des actions de formation par
            apprentissage.
          </p>

          <h2>Hébergement</h2>
          <p>
            Vercel Inc., 440 N Barranca Ave #4133, Covina, CA 91723, États-Unis — vercel.com.
            <br />
            Données de la plateforme de formation hébergées par Supabase Inc. (région Union européenne).
          </p>

          <h2>Propriété intellectuelle</h2>
          <p>
            L&apos;ensemble des contenus de ce site et de la plateforme de formation (textes, vidéos, supports,
            quiz, illustrations, logos) est la propriété exclusive d&apos;IDEAFORMA. Toute reproduction,
            représentation, téléchargement, capture ou diffusion, totale ou partielle, sans autorisation écrite
            préalable est interdite et constitue une contrefaçon sanctionnée par le Code de la propriété
            intellectuelle. Les accès à la plateforme sont strictement personnels.
          </p>

          <h2 id="confidentialite">Politique de confidentialité</h2>
          <p>
            Les données collectées via le formulaire de contact (identité, coordonnées, message) servent
            uniquement à traiter votre demande. Les données des apprenants (identité, connexion, progression,
            résultats aux évaluations) servent à l&apos;exécution de l&apos;action de formation et aux obligations
            légales de l&apos;organisme (justificatifs de réalisation, Qualiopi). Elles sont conservées pendant la
            durée nécessaire à ces finalités puis archivées conformément aux obligations légales.
          </p>
          <p>
            Conformément au RGPD, vous disposez d&apos;un droit d&apos;accès, de rectification, d&apos;effacement,
            de limitation et d&apos;opposition. Pour l&apos;exercer : contact.ideaforma@gmail.com. Vous pouvez
            introduire une réclamation auprès de la CNIL (cnil.fr).
          </p>
          <p>
            Ce site n&apos;utilise que des cookies techniques strictement nécessaires (session de connexion à la
            plateforme). Aucun cookie publicitaire ni traceur tiers.
          </p>
        </div>
      </section>
    </>
  );
}
