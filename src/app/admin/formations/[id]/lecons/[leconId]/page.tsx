import Link from "next/link";
import Icon from "@/components/Icon";
import { notFound } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import type { Lecon, Module } from "@/lib/types";
import LeconEditor from "@/components/admin/LeconEditor";
import { modifierLecon } from "@/app/admin/actions";

export default async function EditionLecon({
  params,
}: {
  params: Promise<{ id: string; leconId: string }>;
}) {
  const { id, leconId } = await params;
  const supabase = await createClient();

  const [{ data: formation }, { data: lecon }] = await Promise.all([
    supabase.from("formations").select("id, titre").eq("id", id).maybeSingle(),
    supabase.from("lecons").select("*, modules:module_id(id, titre, formation_id)").eq("id", leconId).maybeSingle(),
  ]);
  if (!formation || !lecon) notFound();
  const l = lecon as unknown as Lecon & { modules: Pick<Module, "id" | "titre" | "formation_id"> | null };
  if (l.modules?.formation_id !== id) notFound();

  const { data: stats } = await supabase
    .from("quiz_reponses")
    .select("score, reussi")
    .eq("lecon_id", leconId);
  const tentatives = (stats ?? []) as { score: number; reussi: boolean }[];

  return (
    <>
      <div className="breadcrumb">
        <Link href="/admin/formations">Formations</Link> /{" "}
        <Link href={`/admin/formations/${id}`}>{formation.titre}</Link> / {l.modules?.titre} / {l.titre}
      </div>
      <div className="page-title">
        <div>
          <h1>Leçon : {l.titre}</h1>
          <p>Module « {l.modules?.titre} »</p>
        </div>
        <div className="actions">
          <Link href={`/espace/formation/${id}/lecon/${leconId}`} className="btn btn-primary btn-sm" target="_blank"><Icon name="play" size={14} /> Aperçu élève</Link>
          <Link href={`/admin/formations/${id}`} className="btn btn-ghost btn-sm"><Icon name="arrow-left" size={14} /> Retour à la formation</Link>
        </div>
      </div>

      <LeconEditor lecon={l} formationId={id} action={modifierLecon.bind(null, l.id, id)} />

      {tentatives.length > 0 && (
        <div className="panel">
          <h2>Résultats des élèves <span className="count">{tentatives.length} tentative{tentatives.length > 1 ? "s" : ""}</span></h2>
          <p style={{ fontSize: ".9rem" }}>
            Score moyen : <strong>{Math.round(tentatives.reduce((n, t) => n + Number(t.score), 0) / tentatives.length)} %</strong> ·
            Taux de réussite : <strong>{Math.round((100 * tentatives.filter((t) => t.reussi).length) / tentatives.length)} %</strong>
          </p>
        </div>
      )}
    </>
  );
}
