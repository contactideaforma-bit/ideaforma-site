import Link from "next/link";

export default function SiteFooter() {
  return (
    <footer className="site-footer">
      <div className="footer-inner">
        <div className="footer-grid">
          <div className="footer-brand">
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img src="/images/logo-ideaforma.png" alt="IDEAFORMA" className="footer-logo-img" />
            <p>
              Organisme de formation professionnelle certifié Qualiopi, spécialisé dans le
              développement des compétences en entreprise.
            </p>
          </div>
          <div>
            <h4>Navigation</h4>
            <ul>
              <li><Link href="/">Accueil</Link></li>
              <li><Link href="/formations">Nos Formations</Link></li>
              <li><Link href="/a-propos">À Propos</Link></li>
              <li><Link href="/contact">Contact</Link></li>
              <li><Link href="/connexion">Espace élève</Link></li>
            </ul>
          </div>
          <div>
            <h4>Formations</h4>
            <ul>
              <li><Link href="/formations?cat=management">Management</Link></li>
              <li><Link href="/formations?cat=communication">Communication</Link></li>
              <li><Link href="/formations?cat=securite">Sécurité &amp; TMS</Link></li>
              <li><Link href="/formations?cat=bureautique">Bureautique</Link></li>
              <li><Link href="/formations?cat=projet">Gestion de projet</Link></li>
            </ul>
          </div>
          <div className="footer-contact">
            <h4>Contact</h4>
            <p>📧 contact.ideaforma@gmail.com</p>
            <p>📞 06 25 16 13 93</p>
            <p>
              📍 144 Avenue Charles de Gaulle
              <br />
              92200 Neuilly-sur-Seine
            </p>
            <Link href="/contact#rdv" className="btn btn-primary btn-sm" style={{ marginTop: "1rem" }}>
              📅 Prendre RDV
            </Link>
          </div>
        </div>
        <div className="footer-bottom">
          <span>© {new Date().getFullYear()} IDEAFORMA. Tous droits réservés.</span>
          <span>
            <Link href="/mentions-legales">Mentions légales</Link> &nbsp;·&nbsp;{" "}
            <Link href="/mentions-legales#confidentialite">Politique de confidentialité</Link>
          </span>
        </div>
      </div>
    </footer>
  );
}
