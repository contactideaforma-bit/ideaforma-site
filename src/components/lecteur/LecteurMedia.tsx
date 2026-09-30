"use client";

import { useState } from "react";
import LecteurPodcast from "@/components/lecteur/LecteurPodcast";

/**
 * Lecteur vidéo / audio sur URL signée courte durée.
 * Téléchargement, image-dans-l'image et menu contextuel désactivés ; filigrane sur la vidéo.
 * (Aucune protection navigateur n'est absolue : le filigrane rend toute fuite traçable.)
 * Un podcast (ou une "vidéo" sans piste image) est lu avec le lecteur podcast animé.
 */
export default function LecteurMedia({
  type, src, email, titre, sousTitre,
}: { type: "video" | "podcast"; src: string; email: string; titre?: string; sousTitre?: string }) {
  const [audioSeul, setAudioSeul] = useState(type === "podcast");

  if (audioSeul) return <LecteurPodcast src={src} titre={titre} sousTitre={sousTitre} />;

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
        onLoadedMetadata={(e) => { if (e.currentTarget.videoWidth === 0) setAudioSeul(true); }}
      />
      <div className="video-filigrane" aria-hidden>{email}</div>
    </div>
  );
}
