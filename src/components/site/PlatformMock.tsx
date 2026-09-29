import Icon from "@/components/Icon";

/**
 * Aperçu animé de la plateforme (CSS pur) : une fenêtre d'application avec un parcours,
 * des barres de progression qui se remplissent et une carte quiz qui se valide.
 */
export default function PlatformMock() {
  return (
    <div className="mock" aria-hidden="true">
      <div className="mock-bar">
        <span /><span /><span />
        <div className="mock-url">ideaforma.fr/espace</div>
      </div>
      <div className="mock-body">
        <aside className="mock-side">
          <div className="mock-side-item active"><Icon name="book-open" size={14} />Mes formations</div>
          <div className="mock-side-item"><Icon name="chart" size={14} />Progression</div>
          <div className="mock-side-item"><Icon name="award" size={14} />Attestations</div>
          <div className="mock-side-item"><Icon name="settings" size={14} />Mon compte</div>
        </aside>
        <div className="mock-main">
          <div className="mock-title">Management &amp; Leadership</div>
          <div className="mock-sub">Module 3 · Communiquer, animer, conduire les entretiens</div>
          <div className="mock-progress"><span /></div>
          <div className="mock-lessons">
            <div className="mock-lesson done"><Icon name="check-circle" size={14} /><span>La communication du manager</span><em>8 min</em></div>
            <div className="mock-lesson done"><Icon name="check-circle" size={14} /><span>Écouter vraiment : écoute active</span><em>30 min</em></div>
            <div className="mock-lesson current"><Icon name="play" size={14} /><span>Donner un feedback qui fait progresser</span><em>35 min</em></div>
            <div className="mock-lesson"><Icon name="headphones" size={14} /><span>Dire non, alerter, négocier</span><em>18 min</em></div>
            <div className="mock-lesson"><Icon name="help-circle" size={14} /><span>Quiz — Module 3</span><em>12 questions</em></div>
          </div>
        </div>
      </div>
      <div className="mock-card mock-card-quiz">
        <div className="mock-card-head"><Icon name="help-circle" size={14} /> Quiz validé</div>
        <div className="mock-score">92 %</div>
        <div className="mock-card-sub">11 / 12 bonnes réponses</div>
      </div>
      <div className="mock-card mock-card-badge">
        <Icon name="award" size={18} />
        <div><strong>Attestation</strong><br />disponible</div>
      </div>
    </div>
  );
}
