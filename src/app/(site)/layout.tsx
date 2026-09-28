import SiteNav from "@/components/SiteNav";
import SiteFooter from "@/components/SiteFooter";
import { createClient } from "@/lib/supabase/server";

export default async function SiteLayout({ children }: { children: React.ReactNode }) {
  let connecte = false;
  try {
    const supabase = await createClient();
    const { data } = await supabase.auth.getUser();
    connecte = !!data.user;
  } catch {
    // Supabase non configuré : le site public reste accessible.
  }

  return (
    <>
      <SiteNav connecte={connecte} />
      <main>{children}</main>
      <SiteFooter />
    </>
  );
}
