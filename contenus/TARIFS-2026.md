# Grille tarifaire IDEAFORMA 2026 — justification

Date : 29/09/2026. Prix inter-entreprises, par personne, € HT. Intra-entreprise et sur-mesure : sur devis.

## Repères marché relevés (septembre 2026)

| Organisme | Formation | Durée | Format | Prix HT / pers. | € / h |
|---|---|---|---|---|---|
| Cegos | Management de proximité (RS6730) | 42 h (6 j) | Blended, avec formateur | 3 990 € | 95 |
| ORSYS | Manager de proximité | 21 h (3 j) | Présentiel ou classe à distance | 2 080 € | 99 |
| 360 Compétences | Intégrer le management d'équipe (certifiant) | 21 à 42 h | Présentiel ou distance | 2 550 à 5 100 € | 73 à 145 |
| 360 Compétences | Leadership / gestion des conflits | 14 h | idem | 1 460 à 3 600 € | 104 à 257 |
| 360 Compétences | Déléguer efficacement | 7 h | idem | 730 à 1 800 € | 104 à 257 |

Plafonds OPCO (plan de développement des compétences, entreprises < 50 salariés, 2026) : Constructys 24 €/h, OPCO EP 25 à 30 €/h (selon branche), Atlas 40 €/h, OPCO Mobilités 1 500 à 2 700 €/an/entreprise, L'Opcommerce 1 900 à 2 500 €/an. Un prix au-dessus du plafond n'est pas un frein : le reste à charge employeur est la norme sur ce marché.

## Positionnement retenu

IDEAFORMA vend un parcours **100 % en ligne, asynchrone**, sans journées de formateur en direct : le prix doit rester nettement sous Cegos/ORSYS (qui incluent 3 à 6 jours d'animateur) tout en sortant du « bas de marché » où 890 € pour 35 h (25 €/h) signale un contenu léger. Cible : **55 à 65 €/h** pour les parcours longs, **95 à 115 €/h** pour les formats courts (le coût fixe de conception pèse plus).

| Formation | Durée | Ancien prix | Nouveau prix | € / h |
|---|---|---|---|---|
| Management & Leadership (en ligne) | 35 h | 890 € | **2 190 €** | 63 |
| Gestion de projet | 21 h | 1 290 € | **1 990 €** | 95 |
| Prise de parole en public | 14 h | 790 € | **1 390 €** | 99 |
| Recrutement & intégration | 14 h | 890 € | **1 390 €** | 99 |
| Excel avancé | 14 h | 690 € | **1 190 €** | 85 |
| Communication professionnelle | 7 h | 490 € | **790 €** | 113 |
| Gestion du stress & QVT | 7 h | 490 € | **790 €** | 113 |
| Gestes & postures / TMS | 7 h | 390 € | **690 €** | 99 |
| Sécurité & prévention | 7 h | 390 € | **690 €** | 99 |

## Leviers à prévoir (non affichés sur le site pour l'instant)

- **Option accompagnement** sur Management & Leadership : 2 visios individuelles d'une heure avec la formatrice (démarrage + bilan) : + 490 € HT. Justifie un prix « tutoré » proche de 2 690 €, et renforce le dossier Qualiopi (accompagnement).
- **Dégressif entreprise** : − 15 % à partir de 3 inscrits, − 25 % à partir de 6.
- **Intra-entreprise** (journée animée, jusqu'à 8 personnes) : 1 400 à 1 800 € HT / jour selon la préparation sur-mesure.
- **Demandeurs d'emploi** en autofinancement : tarif particulier possible (− 30 %), à traiter au cas par cas et hors site.
- Réviser la grille chaque janvier ; passer Management & Leadership à 2 490 € une fois l'habilitation RS7377 obtenue (parcours certifiant, éligible CPF).

## Où c'est appliqué

- Site : `src/lib/catalogue.ts` (catalogue de secours) et base Supabase via `supabase/seeds/prix_2026.sql`.
- Modifiable à tout moment dans Admin → Formations → fiche → « Prix HT ».
