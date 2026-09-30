import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { mailConfigure as mailEstConfigure } from "@/lib/mail";
import NouvelEleveForm from "@/components/admin/NouvelEleveForm";

export default async function NouvelElevePage() {
  const supabase = await createClient();
  const { data: formations } = await supabase.from("formations").select("id, titre").order("titre");
  const mailConfigure = mailEstConfigure();

  return (
    <>
      <div className="breadcrumb"><Link href="/admin/eleves">Élèves</Link> / Nouveau</div>
      <div className="page-title">
        <div>
          <h1>Créer un compte élève</h1>
          <p>Un identifiant (e-mail) et un mot de passe sont générés, puis envoyés par e-mail de bienvenue.</p>
        </div>
      </div>
      <NouvelEleveForm
        formations={(formations ?? []) as { id: string; titre: string }[]}
        mailConfigure={mailConfigure}
      />
    </>
  );
}
