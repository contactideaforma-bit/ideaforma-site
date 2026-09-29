-- IDEAFORMA — grille tarifaire 2026 (inter-entreprises, € HT par personne)
-- Alignement sur le marché (Cegos, Orsys, 360 Compétences) — voir contenus/TARIFS-2026.md
update public.formations set prix_ht = v.prix from (values
  ('management-leadership', 2190),
  ('prise-de-parole', 1390),
  ('communication-professionnelle', 790),
  ('gestes-postures-tms', 690),
  ('securite-prevention', 690),
  ('excel-avance', 1190),
  ('gestion-de-projet', 1990),
  ('recrutement-integration', 1390),
  ('gestion-du-stress-qvt', 790)
) as v(slug, prix) where formations.slug = v.slug;
