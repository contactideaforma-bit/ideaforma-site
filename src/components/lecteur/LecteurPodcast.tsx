"use client";

import { useCallback, useEffect, useRef, useState } from "react";
import Icon from "@/components/Icon";

/**
 * Lecteur podcast avec visualisation animée au rythme du son (Web Audio API),
 * fond clair, couleurs du site. Si l'analyse audio n'est pas possible (CORS),
 * une animation de secours suit simplement la lecture.
 */
export default function LecteurPodcast({ src, titre, sousTitre }: { src: string; titre?: string; sousTitre?: string }) {
  const audioRef = useRef<HTMLAudioElement | null>(null);
  const canvasRef = useRef<HTMLCanvasElement | null>(null);
  const ctxRef = useRef<AudioContext | null>(null);
  const analyserRef = useRef<AnalyserNode | null>(null);
  const rafRef = useRef<number>(0);
  const lectureRef = useRef(false);

  const [cors, setCors] = useState<"essai" | "ok" | "non">("essai");
  const [lecture, setLecture] = useState(false);
  const [temps, setTemps] = useState(0);
  const [duree, setDuree] = useState(0);
  const [vitesse, setVitesse] = useState(1);
  const [volume, setVolume] = useState(1);

  const fmt = (s: number) => {
    if (!Number.isFinite(s)) return "0:00";
    const m = Math.floor(s / 60);
    const r = Math.floor(s % 60);
    return `${m}:${r.toString().padStart(2, "0")}`;
  };

  /* ---------- analyse audio ---------- */
  const brancherAnalyse = useCallback(() => {
    const audio = audioRef.current;
    if (!audio || ctxRef.current || cors !== "ok") return;
    try {
      const Ctx = window.AudioContext || (window as unknown as { webkitAudioContext: typeof AudioContext }).webkitAudioContext;
      const ctx = new Ctx();
      const source = ctx.createMediaElementSource(audio);
      const analyser = ctx.createAnalyser();
      analyser.fftSize = 256;
      analyser.smoothingTimeConstant = 0.82;
      source.connect(analyser);
      analyser.connect(ctx.destination);
      ctxRef.current = ctx;
      analyserRef.current = analyser;
    } catch {
      /* animation de secours */
    }
  }, [cors]);

  /* ---------- dessin ---------- */
  useEffect(() => {
    const canvas = canvasRef.current;
    if (!canvas) return;
    const c2d = canvas.getContext("2d");
    if (!c2d) return;

    const N = 56;
    const bins = new Uint8Array(128);
    const lisse = new Float32Array(N);
    let t0 = performance.now();

    const couleur = (i: number, a = 1) => {
      // bleu → violet → orange, selon la position de la barre
      const p = i / (N - 1);
      const stops: [number, number, number][] = [[47, 139, 214], [108, 92, 231], [255, 107, 53]];
      const seg = p < 0.5 ? 0 : 1;
      const q = p < 0.5 ? p * 2 : (p - 0.5) * 2;
      const [r1, g1, b1] = stops[seg];
      const [r2, g2, b2] = stops[seg + 1];
      return `rgba(${Math.round(r1 + (r2 - r1) * q)},${Math.round(g1 + (g2 - g1) * q)},${Math.round(b1 + (b2 - b1) * q)},${a})`;
    };

    const dessiner = () => {
      rafRef.current = requestAnimationFrame(dessiner);
      const dpr = window.devicePixelRatio || 1;
      const w = canvas.clientWidth;
      const h = canvas.clientHeight;
      if (canvas.width !== Math.round(w * dpr) || canvas.height !== Math.round(h * dpr)) {
        canvas.width = Math.round(w * dpr);
        canvas.height = Math.round(h * dpr);
      }
      c2d.setTransform(dpr, 0, 0, dpr, 0, 0);
      const now = performance.now();
      const dt = (now - t0) / 1000;
      t0 = now;

      // valeurs 0..1 par barre
      const an = analyserRef.current;
      const enLecture = lectureRef.current;
      const cible = new Float32Array(N);
      if (an) {
        an.getByteFrequencyData(bins);
        for (let i = 0; i < N; i++) {
          // répartition quasi logarithmique des fréquences
          const idx = Math.min(bins.length - 1, Math.floor(Math.pow(i / N, 1.6) * 90) + 1);
          cible[i] = bins[idx] / 255;
        }
      } else {
        const tt = now / 1000;
        for (let i = 0; i < N; i++) {
          const base = enLecture ? 0.35 + 0.3 * Math.sin(tt * 2.1 + i * 0.35) * Math.sin(tt * 0.7 + i * 0.11) : 0.06;
          cible[i] = Math.max(0.04, base + (enLecture ? 0.12 * Math.sin(tt * 5.3 + i) : 0));
        }
      }
      for (let i = 0; i < N; i++) {
        const k = cible[i] > lisse[i] ? 0.55 : 0.12;
        lisse[i] += (cible[i] - lisse[i]) * Math.min(1, k + dt);
      }
      const energie = lisse.reduce((s, v) => s + v, 0) / N;

      // fond clair
      c2d.clearRect(0, 0, w, h);
      const grad = c2d.createLinearGradient(0, 0, w, h);
      grad.addColorStop(0, "#F6F9FC");
      grad.addColorStop(1, "#EAF4FC");
      c2d.fillStyle = grad;
      c2d.fillRect(0, 0, w, h);

      // halo pulsé au centre
      const cx = w / 2;
      const cy = h * 0.44;
      const R = Math.min(w, h) * 0.17;
      const halo = c2d.createRadialGradient(cx, cy, R * 0.6, cx, cy, R * (2.2 + energie * 1.6));
      halo.addColorStop(0, `rgba(47,139,214,${0.16 + energie * 0.25})`);
      halo.addColorStop(1, "rgba(47,139,214,0)");
      c2d.fillStyle = halo;
      c2d.fillRect(0, 0, w, h);

      // barres radiales
      const rayonBase = R * 1.25;
      const longMax = Math.min(w, h) * 0.2;
      for (let i = 0; i < N; i++) {
        const a = (i / N) * Math.PI * 2 - Math.PI / 2;
        const l = 4 + lisse[i] * longMax;
        const x1 = cx + Math.cos(a) * rayonBase;
        const y1 = cy + Math.sin(a) * rayonBase;
        const x2 = cx + Math.cos(a) * (rayonBase + l);
        const y2 = cy + Math.sin(a) * (rayonBase + l);
        c2d.strokeStyle = couleur(i, 0.9);
        c2d.lineWidth = Math.max(3, (Math.PI * 2 * rayonBase) / N * 0.55);
        c2d.lineCap = "round";
        c2d.beginPath();
        c2d.moveTo(x1, y1);
        c2d.lineTo(x2, y2);
        c2d.stroke();
      }

      // disque central
      c2d.beginPath();
      c2d.arc(cx, cy, R * (1 + energie * 0.08), 0, Math.PI * 2);
      c2d.fillStyle = "#ffffff";
      c2d.shadowColor = "rgba(11,37,69,.18)";
      c2d.shadowBlur = 24;
      c2d.fill();
      c2d.shadowBlur = 0;
      c2d.lineWidth = 3;
      c2d.strokeStyle = "#0B2545";
      c2d.stroke();

      // spectre miroir en bas
      const bw = w / N;
      const baseY = h * 0.86;
      for (let i = 0; i < N; i++) {
        const bh = 2 + lisse[i] * h * 0.12;
        const x = i * bw + bw * 0.2;
        c2d.fillStyle = couleur(i, 0.55);
        c2d.beginPath();
        c2d.roundRect(x, baseY - bh, bw * 0.6, bh * 2, 3);
        c2d.fill();
      }
    };
    dessiner();
    return () => cancelAnimationFrame(rafRef.current);
  }, []);

  useEffect(() => () => { ctxRef.current?.close().catch(() => null); }, []);

  /* ---------- commandes ---------- */
  async function basculer() {
    const a = audioRef.current;
    if (!a) return;
    if (a.paused) {
      brancherAnalyse();
      await ctxRef.current?.resume().catch(() => null);
      await a.play().catch(() => null);
    } else {
      a.pause();
    }
  }
  function sauter(d: number) {
    const a = audioRef.current;
    if (!a) return;
    a.currentTime = Math.max(0, Math.min(a.duration || 0, a.currentTime + d));
  }
  function changerVitesse() {
    const suivantes = [1, 1.25, 1.5, 0.75];
    const v = suivantes[(suivantes.indexOf(vitesse) + 1) % suivantes.length];
    setVitesse(v);
    if (audioRef.current) audioRef.current.playbackRate = v;
  }

  const pct = duree ? (temps / duree) * 100 : 0;

  return (
    <div className="podcast-box" onContextMenu={(e) => e.preventDefault()}>
      <div className="podcast-scene">
        <canvas ref={canvasRef} className="podcast-canvas" aria-hidden />
        <div className="podcast-centre" aria-hidden>
          <Icon name="headphones" size={34} />
        </div>
        <div className="podcast-titres">
          <span className="podcast-etiquette">Podcast IDEAFORMA</span>
          {titre && <strong>{titre}</strong>}
          {sousTitre && <span className="muted">{sousTitre}</span>}
        </div>
      </div>

      <audio
        key={cors === "non" ? "sans-cors" : "cors"}
        ref={audioRef}
        src={src}
        preload="metadata"
        crossOrigin={cors === "non" ? undefined : "anonymous"}
        onCanPlay={() => { if (cors === "essai") setCors("ok"); }}
        onError={() => { if (cors !== "non") setCors("non"); }}
        onPlay={() => { setLecture(true); lectureRef.current = true; }}
        onPause={() => { setLecture(false); lectureRef.current = false; }}
        onEnded={() => { setLecture(false); lectureRef.current = false; }}
        onTimeUpdate={(e) => setTemps(e.currentTarget.currentTime)}
        onLoadedMetadata={(e) => { if (cors === "essai") setCors("ok"); setDuree(e.currentTarget.duration); e.currentTarget.playbackRate = vitesse; e.currentTarget.volume = volume; }}
        onDurationChange={(e) => setDuree(e.currentTarget.duration)}
      />

      <div className="podcast-controles">
        <button type="button" className="podcast-btn" onClick={() => sauter(-15)} aria-label="Reculer de 15 secondes" title="-15 s">
          <Icon name="refresh" size={18} /><span>15</span>
        </button>
        <button type="button" className="podcast-play" onClick={basculer} aria-label={lecture ? "Pause" : "Lecture"}>
          {lecture ? <PauseIcone /> : <Icon name="play" size={26} />}
        </button>
        <button type="button" className="podcast-btn" onClick={() => sauter(15)} aria-label="Avancer de 15 secondes" title="+15 s">
          <span>15</span><Icon name="arrow-right" size={18} />
        </button>
        <div className="podcast-temps">
          <span>{fmt(temps)}</span>
          <input
            type="range"
            min={0}
            max={duree || 0}
            step={0.5}
            value={Math.min(temps, duree || 0)}
            onChange={(e) => { const v = Number(e.target.value); setTemps(v); if (audioRef.current) audioRef.current.currentTime = v; }}
            style={{ background: `linear-gradient(90deg, var(--blue) ${pct}%, var(--border) ${pct}%)` }}
            aria-label="Position"
          />
          <span>{fmt(duree)}</span>
        </div>
        <button type="button" className="podcast-btn podcast-vitesse" onClick={changerVitesse} title="Vitesse de lecture">{vitesse}x</button>
        <div className="podcast-volume" title="Volume">
          <Icon name="headphones" size={16} />
          <input type="range" min={0} max={1} step={0.05} value={volume} onChange={(e) => { const v = Number(e.target.value); setVolume(v); if (audioRef.current) audioRef.current.volume = v; }} aria-label="Volume" />
        </div>
      </div>
    </div>
  );
}

function PauseIcone() {
  return (
    <svg width="26" height="26" viewBox="0 0 24 24" fill="currentColor" aria-hidden>
      <rect x="6" y="4" width="4" height="16" rx="1.2" /><rect x="14" y="4" width="4" height="16" rx="1.2" />
    </svg>
  );
}
