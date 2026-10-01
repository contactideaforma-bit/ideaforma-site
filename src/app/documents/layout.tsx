import type { Metadata } from "next";

export const metadata: Metadata = { title: "Document", robots: { index: false, follow: false } };

export default function DocumentsLayout({ children }: { children: React.ReactNode }) {
  return <div className="doc-ecran">{children}</div>;
}
