import type { SVGProps } from "react";

/**
 * Pictogrammes SVG (trait 2 px, style linéaire) — remplace tous les emojis.
 * Usage : <Icon name="award" size={20} />
 */
const PATHS: Record<string, React.ReactNode> = {
  award: (<><circle cx="12" cy="8" r="5" /><path d="M8.5 12.5 7 21l5-3 5 3-1.5-8.5" /></>),
  target: (<><circle cx="12" cy="12" r="9" /><circle cx="12" cy="12" r="5" /><circle cx="12" cy="12" r="1" /></>),
  monitor: (<><rect x="3" y="4" width="18" height="13" rx="2" /><path d="M8 21h8M12 17v4" /></>),
  euro: (<><path d="M17 6.5A7 7 0 0 0 5.5 12 7 7 0 0 0 17 17.5M3 10h10M3 14h10" /></>),
  users: (<><circle cx="9" cy="8" r="3.5" /><path d="M2.5 20a6.5 6.5 0 0 1 13 0" /><circle cx="17" cy="9" r="2.5" /><path d="M16 15.5a5 5 0 0 1 5.5 4.5" /></>),
  user: (<><circle cx="12" cy="8" r="4" /><path d="M4.5 21a7.5 7.5 0 0 1 15 0" /></>),
  mic: (<><rect x="9" y="3" width="6" height="11" rx="3" /><path d="M5 11a7 7 0 0 0 14 0M12 18v3M8 21h8" /></>),
  shield: (<><path d="M12 3 4.5 6v6c0 4.5 3.2 7.8 7.5 9 4.3-1.2 7.5-4.5 7.5-9V6L12 3z" /><path d="m9 12 2 2 4-4" /></>),
  chart: (<><path d="M4 20V10M10 20V4M16 20v-7M22 20H2" /></>),
  folder: (<><path d="M3 7a2 2 0 0 1 2-2h4l2 2h8a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V7z" /></>),
  clipboard: (<><rect x="5" y="4" width="14" height="17" rx="2" /><path d="M9 4V2.5h6V4M9 11h6M9 15h4" /></>),
  heart: (<><path d="M12 20s-7-4.4-7-10a4 4 0 0 1 7-2.6A4 4 0 0 1 19 10c0 5.6-7 10-7 10z" /></>),
  brain: (<><path d="M9.5 3a3 3 0 0 0-3 3v.5A3 3 0 0 0 5 12a3 3 0 0 0 1.5 5.5V18a3 3 0 0 0 3 3h2V3h-2zM14.5 3a3 3 0 0 1 3 3v.5A3 3 0 0 1 19 12a3 3 0 0 1-1.5 5.5V18a3 3 0 0 1-3 3h-2V3h2z" /></>),
  lock: (<><rect x="5" y="11" width="14" height="10" rx="2" /><path d="M8 11V7a4 4 0 0 1 8 0v4" /></>),
  calendar: (<><rect x="3" y="5" width="18" height="16" rx="2" /><path d="M3 10h18M8 3v4M16 3v4" /></>),
  mail: (<><rect x="3" y="5" width="18" height="14" rx="2" /><path d="m3 7 9 6 9-6" /></>),
  phone: (<><path d="M5 4h4l2 5-2.5 1.5a11 11 0 0 0 5 5L15 13l5 2v4a2 2 0 0 1-2 2A16 16 0 0 1 3 6a2 2 0 0 1 2-2z" /></>),
  "map-pin": (<><path d="M12 21s-7-6.2-7-11.5a7 7 0 0 1 14 0C19 14.8 12 21 12 21z" /><circle cx="12" cy="9.5" r="2.5" /></>),
  "arrow-right": (<><path d="M5 12h14M13 6l6 6-6 6" /></>),
  "arrow-left": (<><path d="M19 12H5M11 6l-6 6 6 6" /></>),
  "arrow-up": (<><path d="M12 19V5M6 11l6-6 6 6" /></>),
  "arrow-down": (<><path d="M12 5v14M6 13l6 6 6-6" /></>),
  "external": (<><path d="M14 4h6v6M20 4l-9 9M19 14v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V6a1 1 0 0 1 1-1h5" /></>),
  play: (<><path d="M7 4.5v15l12-7.5-12-7.5z" /></>),
  video: (<><rect x="3" y="6" width="13" height="12" rx="2" /><path d="m16 10 5-3v10l-5-3" /></>),
  file: (<><path d="M6 3h8l5 5v13a1 1 0 0 1-1 1H6a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1z" /><path d="M14 3v5h5M9 13h6M9 17h6" /></>),
  headphones: (<><path d="M4 14v-2a8 8 0 0 1 16 0v2" /><rect x="4" y="14" width="4" height="6" rx="1.5" /><rect x="16" y="14" width="4" height="6" rx="1.5" /></>),
  book: (<><path d="M4 4.5A2.5 2.5 0 0 1 6.5 2H20v17H6.5A2.5 2.5 0 0 0 4 21.5v-17z" /><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20" /></>),
  "book-open": (<><path d="M2 5h6a4 4 0 0 1 4 4v11a3 3 0 0 0-3-3H2V5zM22 5h-6a4 4 0 0 0-4 4v11a3 3 0 0 1 3-3h7V5z" /></>),
  "help-circle": (<><circle cx="12" cy="12" r="9" /><path d="M9.5 9.5a2.5 2.5 0 1 1 3.5 2.3c-.7.4-1 1-1 1.7M12 17h.01" /></>),
  flag: (<><path d="M5 21V4M5 4h11l-2 4 2 4H5" /></>),
  settings: (<><circle cx="12" cy="12" r="3" /><path d="M19.4 15a1.7 1.7 0 0 0 .3 1.8l.1.1a2 2 0 1 1-2.8 2.8l-.1-.1a1.7 1.7 0 0 0-1.8-.3 1.7 1.7 0 0 0-1 1.5V21a2 2 0 1 1-4 0v-.1a1.7 1.7 0 0 0-1.1-1.5 1.7 1.7 0 0 0-1.8.3l-.1.1a2 2 0 1 1-2.8-2.8l.1-.1a1.7 1.7 0 0 0 .3-1.8 1.7 1.7 0 0 0-1.5-1H3a2 2 0 1 1 0-4h.1a1.7 1.7 0 0 0 1.5-1.1 1.7 1.7 0 0 0-.3-1.8l-.1-.1a2 2 0 1 1 2.8-2.8l.1.1a1.7 1.7 0 0 0 1.8.3H9a1.7 1.7 0 0 0 1-1.5V3a2 2 0 1 1 4 0v.1a1.7 1.7 0 0 0 1 1.5 1.7 1.7 0 0 0 1.8-.3l.1-.1a2 2 0 1 1 2.8 2.8l-.1.1a1.7 1.7 0 0 0-.3 1.8V9a1.7 1.7 0 0 0 1.5 1H21a2 2 0 1 1 0 4h-.1a1.7 1.7 0 0 0-1.5 1z" /></>),
  layout: (<><rect x="3" y="3" width="18" height="18" rx="2" /><path d="M3 9h18M9 21V9" /></>),
  "log-out": (<><path d="M10 17l-5-5 5-5M5 12h11M15 4h3a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2h-3" /></>),
  star: (<><path d="m12 3 2.8 5.7 6.2.9-4.5 4.4 1.1 6.2L12 17.3l-5.6 2.9 1.1-6.2L3 9.6l6.2-.9L12 3z" /></>),
  sparkles: (<><path d="M12 3l1.8 4.7L18.5 9.5l-4.7 1.8L12 16l-1.8-4.7L5.5 9.5l4.7-1.8L12 3zM19 15l.8 2.2L22 18l-2.2.8L19 21l-.8-2.2L16 18l2.2-.8L19 15zM5 15l.6 1.6L7.2 17l-1.6.6L5 19.2l-.6-1.6L2.8 17l1.6-.4L5 15z" /></>),
  clock: (<><circle cx="12" cy="12" r="9" /><path d="M12 7v5l3 2" /></>),
  menu: (<><path d="M4 7h16M4 12h16M4 17h16" /></>),
  x: (<><path d="M6 6l12 12M18 6 6 18" /></>),
  check: (<><path d="m5 12 4.5 4.5L19 7" /></>),
  "check-circle": (<><circle cx="12" cy="12" r="9" /><path d="m8.5 12 2.5 2.5 4.5-5" /></>),
  "x-circle": (<><circle cx="12" cy="12" r="9" /><path d="M9 9l6 6M15 9l-6 6" /></>),
  "chevron-down": (<><path d="m6 9 6 6 6-6" /></>),
  "chevron-right": (<><path d="m9 6 6 6-6 6" /></>),
  quote: (<><path d="M7 7h4v6H7a3 3 0 0 0-3 3v1M17 7h4v6h-4a3 3 0 0 0-3 3v1" /></>),
  lightbulb: (<><path d="M9 18h6M10 21h4M8 12a4 4 0 1 1 8 0c0 1.5-1 2.5-1.5 3.5S14 17 14 18h-4c0-1-.5-1.5-1-2.5S8 13.5 8 12z" /></>),
  "trending-up": (<><path d="M3 17l6-6 4 4 8-8M15 7h6v6" /></>),
  briefcase: (<><rect x="3" y="7" width="18" height="13" rx="2" /><path d="M9 7V5a2 2 0 0 1 2-2h2a2 2 0 0 1 2 2v2M3 13h18" /></>),
  "graduation": (<><path d="m2 9 10-5 10 5-10 5L2 9z" /><path d="M6 11.5V16c0 1.5 3 3 6 3s6-1.5 6-3v-4.5M22 9v5" /></>),
  inbox: (<><path d="M3 13h5l1.5 3h5L16 13h5" /><path d="M5 4h14l2 9v7a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-7l2-9z" /></>),
  key: (<><circle cx="8" cy="15" r="4" /><path d="M11 12 20 3M16 7l2 2M13 10l2 2" /></>),
  paperclip: (<><path d="m20 11-8.5 8.5a5 5 0 0 1-7-7l9-9a3.5 3.5 0 0 1 5 5l-9 9a2 2 0 0 1-3-3l8-8" /></>),
  compass: (<><circle cx="12" cy="12" r="9" /><path d="m15.5 8.5-2 5-5 2 2-5 5-2z" /></>),
  hand: (<><path d="M8 13V6a1.5 1.5 0 0 1 3 0v6M11 12V4.5a1.5 1.5 0 0 1 3 0V12M14 12V6a1.5 1.5 0 0 1 3 0v8a6 6 0 0 1-12 0v-3a1.5 1.5 0 0 1 3 0" /></>),
  refresh: (<><path d="M20 12a8 8 0 0 1-14.5 4.6M4 12a8 8 0 0 1 14.5-4.6M4 4v5h5M20 20v-5h-5" /></>),
  accessibility: (<><circle cx="12" cy="4.5" r="1.5" /><path d="M5 9c4.5 1 9.5 1 14 0M12 10v5l-3 6M12 15l3 6" /></>),
  wrench: (<><path d="M14.5 4.5a4.5 4.5 0 0 0 5.6 5.6L9.6 20.6a2.5 2.5 0 0 1-3.5-3.5L16.6 6.6a4.5 4.5 0 0 0-2.1-2.1z" /></>),
  "message": (<><path d="M4 5h16v10H9l-5 4V5z" /></>),
  zap: (<><path d="M13 2 4 14h7l-1 8 9-12h-7l1-8z" /></>),
  layers: (<><path d="m12 3 9 5-9 5-9-5 9-5z" /><path d="m3 13 9 5 9-5M3 17l9 5 9-5" /></>),
  smile: (<><circle cx="12" cy="12" r="9" /><path d="M8.5 14.5a4.5 4.5 0 0 0 7 0M9 10h.01M15 10h.01" /></>),
  frown: (<><circle cx="12" cy="12" r="9" /><path d="M8.5 16a4.5 4.5 0 0 1 7 0M9 10h.01M15 10h.01" /></>),
  party: (<><path d="M4 20 8 8l8 8-12 4z" /><path d="M11 5l1-2M15 9l2-1M14 4l3-1-1 3M18 13l2 1" /></>),
  construction: (<><path d="M3 16h18v4H3zM6 16V9M18 16V9M4 9h16M9 4h6l1 5H8l1-5z" /></>),
  presentation: (<><rect x="3" y="4" width="18" height="12" rx="2" /><path d="M8 20l4-4 4 4M9 12l3-3 3 3" /></>),
  "list": (<><path d="M9 6h11M9 12h11M9 18h11M4 6h.01M4 12h.01M4 18h.01" /></>),
};

export type IconName = keyof typeof PATHS;

export default function Icon({
  name,
  size = 20,
  strokeWidth = 2,
  className,
  ...rest
}: { name: string; size?: number; strokeWidth?: number } & SVGProps<SVGSVGElement>) {
  const d = PATHS[name] ?? PATHS["help-circle"];
  return (
    <svg
      width={size}
      height={size}
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth={strokeWidth}
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden="true"
      focusable="false"
      className={className}
      {...rest}
    >
      {d}
    </svg>
  );
}
