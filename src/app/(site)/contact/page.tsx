import type { Metadata } from "next";
import ContactForm from "@/components/ContactForm";

export const metadata: Metadata = {
  title: "Contact",
  description: "Contactez IDEAFORMA pour un devis, un renseignement ou un rendez-vous. Réponse sous 24h ouvrées.",
};

const RDV_URL = "https://calendar.google.com/calendar/u/0?cid=Y29udGFjdC5pZGVhZm9ybWFAZ21haWwuY29t";

export default async function Contact({
  searchParams,
}: {
  searchParams: Promise<{ formation?: string }>;
}) {
  const { formation } = await searchParams;

  return (
    <>
      <div className="page-hero page-hero-contact">
        <h1>Contactez-nous</h1>
        <p>Un projet de formation, une question sur le financement OPCO ? Nous vous répondons sous 24h ouvrées.</p>
      </div>

      <section className="section">
        <div className="section-inner">
          <div className="contact-grid">
            <div className="contact-info">
              <div className="contact-item">
                <div className="contact-icon">📧</div>
                <div>
                  <h4>E-mail</h4>
                  <p><a href="mailto:contact.ideaforma@gmail.com">contact.ideaforma@gmail.com</a></p>
                </div>
              </div>
              <div className="contact-item">
                <div className="contact-icon">📞</div>
                <div>
                  <h4>Téléphone</h4>
                  <p><a href="tel:+33625161393">06 25 16 13 93</a></p>
                  <p>Du lundi au vendredi, 9h – 18h</p>
                </div>
              </div>
              <div className="contact-item">
                <div className="contact-icon">📍</div>
                <div>
                  <h4>Adresse</h4>
                  <p>144 Avenue Charles de Gaulle<br />92200 Neuilly-sur-Seine</p>
                </div>
              </div>
              <div className="contact-item">
                <div className="contact-icon">🏅</div>
                <div>
                  <h4>Certification</h4>
                  <p>Organisme certifié Qualiopi — NDA 11922999392</p>
                </div>
              </div>
              <div className="calendly-box" id="rdv">
                <h3>📅 Prendre rendez-vous</h3>
                <p>Réservez un créneau de 30 minutes pour échanger sur votre projet de formation.</p>
                <a href={RDV_URL} target="_blank" rel="noopener noreferrer" className="btn btn-primary">
                  Choisir un créneau
                </a>
              </div>
            </div>

            <ContactForm formationInitiale={formation} />
          </div>
        </div>
      </section>
    </>
  );
}
