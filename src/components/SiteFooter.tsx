import Link from "next/link";
import Icon from "@/components/Icon";

export default function SiteFooter() {
  return (
    <footer className="site-footer">
      <div className="footer-inner">
        <div className="footer-grid">
          <div className="footer-brand">
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img src="/images/logo-ideaforma.png" alt="IDEAFORMA" className="footer-logo-img" />
            <p>
              Organisme de formation professionnelle certifié Qualiopi. Des parcours en ligne, concrets et
              mesurables, pour les entreprises et les personnes qui veulent progresser.
            </p>
            <div className="footer-badges">
              <span><Icon name="award" size={13} /> Qualiopi</span>
              <span><Icon name="shield" size={13} /> NDA 11922999392</span>
              <span><Icon name="euro" size={13} /> Financement OPCO</span>
            </div>
          </div>
          <div>
            <h4>Navigation</h4>
            <ul>
              <li><Link href="/"><Icon name="chevron-right" size={14} />Accueil</Link></li>
              <li><Link href="/formations"><Icon name="chevron-right" size={14} />Formations</Link></li>
              <li><Link href="/a-propos"><Icon name="chevron-right" size={14} />À propos</Link></li>
              <li><Link href="/contact"><Icon name="chevron-right" size={14} />Contact</Link></li>
              <li><Link href="/connexion"><Icon name="chevron-right" size={14} />Espace élève</Link></li>
            </ul>
          </div>
          <div>
            <h4>Domaines</h4>
            <ul>
              <li><Link href="/formations?cat=management"><Icon name="chevron-right" size={14} />Management</Link></li>
              <li><Link href="/formations?cat=communication"><Icon name="chevron-right" size={14} />Communication</Link></li>
              <li><Link href="/formations?cat=securite"><Icon name="chevron-right" size={14} />Sécurité</Link></li>
              <li><Link href="/formations?cat=bureautique"><Icon name="chevron-right" size={14} />Bureautique</Link></li>
              <li><Link href="/formations?cat=projet"><Icon name="chevron-right" size={14} />Gestion de projet</Link></li>
            </ul>
          </div>
          <div className="footer-contact">
            <h4>Contact</h4>
            <p><Icon name="mail" size={16} /><a href="mailto:contact.ideaforma@gmail.com">contact.ideaforma@gmail.com</a></p>
            <p><Icon name="phone" size={16} /><a href="tel:+33625161393">06 25 16 13 93</a></p>
            <p><Icon name="map-pin" size={16} /><span>144 avenue Charles de Gaulle<br />92200 Neuilly-sur-Seine</span></p>
            <Link href="/contact#rdv" className="btn btn-primary btn-sm" style={{ marginTop: ".75rem" }}>
              <Icon name="calendar" size={15} /> Prendre rendez-vous
            </Link>
          </div>
        </div>
        <div className="footer-bottom">
          <span>© {new Date().getFullYear()} IDEAFORMA — SASU, RCS Nanterre 993 125 335. Tous droits réservés.</span>
          <span>
            <Link href="/mentions-legales">Mentions légales</Link> &nbsp;·&nbsp;{" "}
            <Link href="/mentions-legales#confidentialite">Confidentialité</Link>
          </span>
        </div>
      </div>
    </footer>
  );
}
