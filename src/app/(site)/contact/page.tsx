import type { Metadata } from "next";
import Icon from "@/components/Icon";
import ContactForm from "@/components/ContactForm";
import Reveal from "@/components/site/Reveal";

export const metadata: Metadata = {
  title: "Contact",
  description: "Contactez IDEAFORMA pour un devis, un renseignement ou un rendez-vous. Réponse sous 24 h ouvrées.",
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
      <div className="page-hero">
        <div className="hero-grid" />
        <span className="overline anim-up">Contact</span>
        <h1 className="anim-up d1">Parlons de votre projet</h1>
        <p className="anim-up d2">Un projet de formation, une question sur le financement OPCO ? Nous répondons sous 24 h ouvrées.</p>
      </div>

      <section className="section section-bg" style={{ paddingTop: "3rem" }}>
        <div className="section-inner">
          <div className="contact-grid">
            <Reveal className="contact-info">
              <div className="contact-item">
                <div className="icon-box"><Icon name="mail" size={20} /></div>
                <div><h4>E-mail</h4><p><a href="mailto:contact@ideaforma.fr">contact@ideaforma.fr</a></p></div>
              </div>
              <div className="contact-item">
                <div className="icon-box amber"><Icon name="phone" size={20} /></div>
                <div><h4>Téléphone</h4><p><a href="tel:+33625161393">06 25 16 13 93</a><br />Du lundi au vendredi, 9 h – 18 h</p></div>
              </div>
              <div className="contact-item">
                <div className="icon-box purple"><Icon name="map-pin" size={20} /></div>
                <div><h4>Adresse</h4><p>144 avenue Charles de Gaulle<br />92200 Neuilly-sur-Seine</p></div>
              </div>
              <div className="contact-item">
                <div className="icon-box green"><Icon name="award" size={20} /></div>
                <div><h4>Certification</h4><p>Organisme certifié Qualiopi — NDA 11922999392</p></div>
              </div>
              <div className="calendly-box" id="rdv">
                <h3><Icon name="calendar" size={20} /> Prendre rendez-vous</h3>
                <p>Réservez un créneau de 30 minutes pour échanger sur votre projet de formation.</p>
                <a href={RDV_URL} target="_blank" rel="noopener noreferrer" className="btn btn-primary">
                  Choisir un créneau <Icon name="external" size={15} />
                </a>
              </div>
            </Reveal>

            <Reveal delay={120}>
              <ContactForm formationInitiale={formation} />
            </Reveal>
          </div>
        </div>
      </section>
    </>
  );
}
