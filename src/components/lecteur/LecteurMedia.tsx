"use client";

/**
 * Lecteur vidéo / audio sur URL signée courte durée.
 * Téléchargement, image-dans-l'image et menu contextuel désactivés ; filigrane sur la vidéo.
 * (Aucune protection navigateur n'est absolue : le filigrane rend toute fuite traçable.)
 */
export default function LecteurMedia({ type, src, email }: { type: "video" | "podcast"; src: string; email: string }) {
  if (type === "podcast") {
    return (
      <div className="audio-box">
        <div className="audio-icon">🎧</div>
        <audio src={src} controls controlsList="nodownload noplaybackrate" preload="metadata" onContextMenu={(e) => e.preventDefault()} style={{ width: "100%" }} />
      </div>
    );
  }
  return (
    <div className="video-frame">
      <video
        src={src}
        controls
        controlsList="nodownload"
        disablePictureInPicture
        disableRemotePlayback
        playsInline
        preload="metadata"
        onContextMenu={(e) => e.preventDefault()}
      />
      <div className="video-filigrane" aria-hidden>{email}</div>
    </div>
  );
}
