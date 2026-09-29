import { createClient } from "@/lib/supabase/server";
import Icon from "@/components/Icon";
import { formatDate, type DemandeContact } from "@/lib/types";
import { marquerDemande, supprimerDemande } from "@/app/admin/actions";
import ConfirmForm from "@/components/admin/ConfirmForm";

export default async function DemandesPage() {
  const supabase = await createClient();
  const { data } = await supabase.from("demandes_contact").select("*").order("created_at", { ascending: false }).limit(200);
  const demandes = (data ?? []) as DemandeContact[];
  const aTraiter = demandes.filter((d) => !d.traitee);
  const traitees = demandes.filter((d) => d.traitee);

  const Bloc = ({ d }: { d: DemandeContact }) => {
    const basculer = marquerDemande.bind(null, d.id, !d.traitee);
    const supprimer = supprimerDemande.bind(null, d.id);
    return (
      <div className="module-item" style={{ opacity: d.traitee ? 0.75 : 1 }}>
        <header>
          <h3>{d.prenom} {d.nom} {d.entreprise && <span className="muted" style={{ fontWeight: 400, fontSize: ".85rem" }}>· {d.entreprise}</span>}</h3>
          <span className="muted" style={{ fontSize: ".8rem" }}>{formatDate(d.created_at)}</span>
        </header>
        <p style={{ fontSize: ".85rem" }}>
          <a href={`mailto:${d.email}`} style={{ color: "var(--blue)" }}>{d.email}</a>
          {d.telephone && <> · <a href={`tel:${d.telephone}`} style={{ color: "var(--blue)" }}>{d.telephone}</a></>}
          {d.fonction && <> · {d.fonction}</>}
        </p>
        <div className="card-meta" style={{ margin: ".4rem 0" }}>
          {d.formation && <span className="card-tag">{d.formation}</span>}
          {d.participants && <span className="card-tag orange">{d.participants}</span>}
        </div>
        <p style={{ whiteSpace: "pre-wrap", color: "var(--text)", fontSize: ".9rem", borderLeft: "3px solid var(--blue)", paddingLeft: ".75rem" }}>{d.message}</p>
        <div className="actions-row" style={{ marginTop: ".75rem" }}>
          <form action={basculer}><button className={`btn btn-sm ${d.traitee ? "btn-ghost" : "btn-blue"}`} type="submit">{d.traitee ? "Remettre à traiter" : "Marquer traitée"}</button></form>
          <a className="btn btn-ghost btn-sm" href={`mailto:${d.email}?subject=${encodeURIComponent("Votre demande de formation — IDEAFORMA")}`}>Répondre</a>
          <ConfirmForm action={supprimer} message="Supprimer cette demande ?"><button className="btn btn-danger btn-sm" type="submit">Supprimer</button></ConfirmForm>
        </div>
      </div>
    );
  };

  return (
    <>
      <div className="page-title">
        <div>
          <h1>Demandes de contact</h1>
          <p>Formulaire du site public. {aTraiter.length} à traiter.</p>
        </div>
      </div>
      <div className="panel">
        <h2>À traiter <span className="count">{aTraiter.length}</span></h2>
        {aTraiter.length === 0 ? <div className="empty"><div className="big"><Icon name="check-circle" size={26} /></div>Tout est traité.</div> : <div className="module-list">{aTraiter.map((d) => <Bloc key={d.id} d={d} />)}</div>}
      </div>
      {traitees.length > 0 && (
        <div className="panel">
          <h2>Traitées <span className="count">{traitees.length}</span></h2>
          <div className="module-list">{traitees.map((d) => <Bloc key={d.id} d={d} />)}</div>
        </div>
      )}
    </>
  );
}
