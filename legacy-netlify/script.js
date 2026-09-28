/* ============================================================
   IDEAFORMA — Global Script
   Nav · Easter eggs (logo ×5, Konami, Pendu) · Form · Float RDV
   ============================================================ */

document.addEventListener('DOMContentLoaded', () => {
  initNav();
  initActiveLink();
  initLogoEasterEgg();
  initKonamiCode();
  initHangman();
  initContactForm();
  initRdvFloat();
});

/* ── Navigation mobile ── */
function initNav() {
  const hamburger = document.getElementById('hamburger');
  const mobileMenu = document.getElementById('mobile-menu');
  if (!hamburger || !mobileMenu) return;

  hamburger.addEventListener('click', () => {
    hamburger.classList.toggle('open');
    mobileMenu.classList.toggle('open');
  });

  mobileMenu.querySelectorAll('a').forEach(a => {
    a.addEventListener('click', () => {
      hamburger.classList.remove('open');
      mobileMenu.classList.remove('open');
    });
  });

  document.addEventListener('click', e => {
    if (!hamburger.contains(e.target) && !mobileMenu.contains(e.target)) {
      hamburger.classList.remove('open');
      mobileMenu.classList.remove('open');
    }
  });
}

/* ── Active nav link ── */
function initActiveLink() {
  const page = location.pathname.split('/').pop() || 'index.html';
  document.querySelectorAll('.nav-links a, .mobile-menu a').forEach(a => {
    const href = a.getAttribute('href') || '';
    if (href === page || (page === '' && href === 'index.html')) {
      a.classList.add('active');
    }
  });
}

/* ── Easter egg #1 : clic × 5 sur le logo ── */
function initLogoEasterEgg() {
  const logo = document.querySelector('.nav-logo');
  if (!logo) return;

  let clicks = 0;
  let timer = null;

  logo.addEventListener('click', () => {
    clicks++;
    clearTimeout(timer);

    if (clicks >= 5) {
      clicks = 0;
      triggerConfetti();
      const img = logo.querySelector('.nav-logo-img');
      if (img) {
        img.classList.remove('shake');
        void img.offsetWidth;
        img.classList.add('shake');
      }
    } else {
      timer = setTimeout(() => { clicks = 0; }, 2000);
    }
  });
}

/* ── Easter egg #2 : code Konami ── */
function initKonamiCode() {
  const sequence = [
    'ArrowUp','ArrowUp','ArrowDown','ArrowDown',
    'ArrowLeft','ArrowRight','ArrowLeft','ArrowRight',
    'b','a'
  ];
  let idx = 0;

  document.addEventListener('keydown', e => {
    if (document.getElementById('hangman-modal')?.classList.contains('open')) return;
    const key = e.key;
    if (key === sequence[idx]) {
      idx++;
      if (idx === sequence.length) { idx = 0; showModal('konami-modal'); }
    } else {
      idx = (key === sequence[0]) ? 1 : 0;
    }
  });
}

/* ── Easter egg #3 : jeu du pendu (taper "jeu") ── */
function initHangman() {
  const WORDS     = ['CHOCOLAT', 'COMPÉTENCE', 'IDEAFORMA'];
  const PARTS     = ['hm-head','hm-body','hm-arm-l','hm-arm-r','hm-leg-l','hm-leg-r'];
  const MAX_ERR   = 6;

  let word        = '';
  let guessed     = new Set();
  let errors      = 0;
  let active      = false;
  let typedBuffer = '';

  const modal = document.getElementById('hangman-modal');
  if (!modal) return;

  /* ── Normalise : enlève les accents → compare A-Z ── */
  function norm(ch) {
    return ch.normalize('NFD').replace(/[̀-ͯ]/g, '').toUpperCase();
  }

  /* ── Démarrer une partie ── */
  function startGame() {
    word    = WORDS[Math.floor(Math.random() * WORDS.length)];
    guessed = new Set();
    errors  = 0;
    active  = true;
    render();
    modal.classList.add('open');
  }

  /* ── Proposer une lettre ── */
  function guess(letter) {
    if (!active || guessed.has(letter)) return;
    guessed.add(letter);
    if (!word.split('').some(ch => norm(ch) === letter)) errors++;
    render();
  }

  /* ── Victoire ? ── */
  function isWon() {
    return word.split('').every(ch => guessed.has(norm(ch)));
  }

  /* ── Rendu complet ── */
  function render() {
    // Parties du bonhomme
    PARTS.forEach((id, i) => {
      const el = document.getElementById(id);
      if (el) el.style.opacity = i < errors ? '1' : '0';
    });

    // Mot à deviner
    const wordEl = document.getElementById('hm-word');
    if (wordEl) {
      wordEl.innerHTML = word.split('').map(ch => {
        if (ch === ' ') return '<span class="hm-space"></span>';
        const shown = guessed.has(norm(ch));
        return `<span class="hm-letter${shown ? ' found' : ''}">${shown ? ch : '_'}</span>`;
      }).join('');
    }

    // Clavier A–Z
    const kbEl = document.getElementById('hm-keyboard');
    if (kbEl) {
      kbEl.innerHTML = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('').map(ch => {
        const done   = guessed.has(ch);
        const inWord = word.split('').some(c => norm(c) === ch);
        let cls = 'hm-key';
        if (done) cls += inWord ? ' hm-correct' : ' hm-wrong';
        return `<button class="${cls}" data-letter="${ch}"${done || !active ? ' disabled' : ''}>${ch}</button>`;
      }).join('');

      kbEl.querySelectorAll('.hm-key:not([disabled])').forEach(btn => {
        btn.addEventListener('click', () => guess(btn.dataset.letter));
      });
    }

    // Statut / vies
    const statusEl = document.getElementById('hm-status');
    if (statusEl) {
      const won = isWon();
      if (won) {
        active = false;
        statusEl.innerHTML = `<span class="hm-win">🎉 Bravo ! <strong>${word}</strong> était le bon mot !</span>
          <button class="btn btn-primary hm-play-again" style="margin-top:.75rem;font-size:.85rem;">Nouveau mot →</button>`;
      } else if (errors >= MAX_ERR) {
        active = false;
        statusEl.innerHTML = `<span class="hm-lose">😢 Perdu ! Le mot était : <strong>${word}</strong></span>
          <button class="btn btn-blue hm-play-again" style="margin-top:.75rem;font-size:.85rem;">Réessayer →</button>`;
      } else {
        const rest = MAX_ERR - errors;
        statusEl.innerHTML = `<span class="hm-lives">${'❤️'.repeat(rest)}${'🖤'.repeat(errors)}</span>
          <small>${rest} essai${rest > 1 ? 's' : ''} restant${rest > 1 ? 's' : ''}</small>`;
      }
    }
  }

  /* ── Clavier physique dans le jeu ── */
  document.addEventListener('keydown', e => {
    if (!modal.classList.contains('open')) return;
    const key = e.key.toUpperCase();
    if (/^[A-Z]$/.test(key)) { e.preventDefault(); guess(key); }
  });

  /* ── Déclencheur "jeu" ── */
  document.addEventListener('keydown', e => {
    if (modal.classList.contains('open')) return;
    const ch = e.key.toLowerCase();
    if (/^[a-z]$/.test(ch)) {
      typedBuffer = (typedBuffer + ch).slice(-3);
      if (typedBuffer === 'jeu') { typedBuffer = ''; startGame(); }
    } else if (!['shift','control','alt','meta'].includes(ch)) {
      typedBuffer = '';
    }
  });

  /* ── Bouton "rejouer" via délégation ── */
  modal.addEventListener('click', e => {
    if (e.target.closest('.hm-play-again')) startGame();
  });
}

/* ── Confetti ── */
function triggerConfetti() {
  const canvas = document.getElementById('confetti-canvas');
  if (!canvas) return;
  const ctx = canvas.getContext('2d');
  canvas.width  = window.innerWidth;
  canvas.height = window.innerHeight;
  canvas.style.display = 'block';

  const colors = ['#1565A0','#4A9FD4','#FF6B35','#FFE066','#3FB579','#8B6BE8'];
  const particles = Array.from({ length: 130 }, () => ({
    x: Math.random() * canvas.width,
    y: Math.random() * -canvas.height,
    r: Math.random() * 7 + 3,
    d: Math.random() * 4 + 1,
    color: colors[Math.floor(Math.random() * colors.length)],
    angle: Math.random() * Math.PI * 2,
    spin:  Math.random() * .1 + .04,
  }));

  let frame = 0;
  function draw() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    particles.forEach(p => {
      ctx.beginPath();
      ctx.fillStyle = p.color;
      ctx.ellipse(p.x, p.y, p.r, p.r / 2, p.angle, 0, 2 * Math.PI);
      ctx.fill();
      p.y += p.d;
      p.angle += p.spin;
      p.x += Math.sin(p.angle) * 2;
      if (p.y > canvas.height) { p.y = -10; p.x = Math.random() * canvas.width; }
    });
    frame++;
    if (frame < 200) requestAnimationFrame(draw);
    else { ctx.clearRect(0, 0, canvas.width, canvas.height); canvas.style.display = 'none'; }
  }
  draw();
}

/* ── Fermeture des modals ── */
function showModal(id) {
  document.getElementById(id)?.classList.add('open');
}

document.addEventListener('click', e => {
  if (e.target.classList.contains('modal-overlay') || e.target.classList.contains('modal-close')) {
    document.querySelectorAll('.modal-overlay').forEach(m => m.classList.remove('open'));
  }
});
document.addEventListener('keydown', e => {
  if (e.key === 'Escape') {
    document.querySelectorAll('.modal-overlay').forEach(m => m.classList.remove('open'));
  }
});

/* ── Formulaire de contact ── */
function initContactForm() {
  const form = document.getElementById('contact-form');
  if (!form) return;
  form.addEventListener('submit', e => {
    e.preventDefault();
    const btn = form.querySelector('[type="submit"]');
    btn.disabled = true;
    btn.textContent = 'Envoi en cours…';
    setTimeout(() => {
      form.style.display = 'none';
      const success = document.getElementById('form-success');
      if (success) success.style.display = 'block';
    }, 1200);
  });
}

/* ── Bouton RDV flottant ── */
function initRdvFloat() {
  const float = document.getElementById('rdv-float');
  if (!float) return;
  window.addEventListener('scroll', () => {
    const visible = window.scrollY > 300;
    float.style.opacity        = visible ? '1' : '0';
    float.style.pointerEvents  = visible ? 'auto' : 'none';
  }, { passive: true });
}
