import SiteNav from "@/components/SiteNav";
import SiteFooter from "@/components/SiteFooter";
import { createClient } from "@/lib/supabase/server";

export default async function SiteLayout({ children }: { children: React.ReactNode }) {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  return (
    <>
      <SiteNav connecte={!!user} />
      <main>{children}</main>
      <SiteFooter />
    </>
  );
}
