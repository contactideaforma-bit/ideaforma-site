-- ============================================================
-- IDEAFORMA — squelette de la formation « Management & Leadership » (35 h)
-- Généré depuis contenus/management-leadership/00-CONCEPTION.md
-- Crée les modules et les leçons (non publiées, contenu à produire) sur la
-- formation dont le slug est 'management-leadership'. Ne fait rien si des
-- modules existent déjà (relançable sans risque). À exécuter dans SQL Editor.
-- ============================================================
do $$
declare f uuid; m uuid;
begin
  select id into f from public.formations where slug = 'management-leadership';
  if f is null then raise exception 'Formation management-leadership introuvable (jouer 0001 d''abord)'; end if;
  if exists (select 1 from public.modules where formation_id = f) then
    raise notice 'Des modules existent déjà pour cette formation : rien n''a été modifié.'; return;
  end if;

  update public.formations set
    duree_heures = 35, duree_label = '35 h en ligne', modalite = '100 % en ligne', publie = true,
    accroche = 'Prenez vos fonctions de manager avec méthode : organiser le travail, animer, motiver, gérer les tensions et piloter la performance de votre équipe.',
    public_vise = 'Salariés nouvellement nommés ou pressentis pour encadrer une équipe, demandeurs d''emploi visant un poste avec responsabilité d''encadrement — tous secteurs.',
    prerequis = 'Français courant (B2 conseillé), une première expérience professionnelle ; aucune expérience d''encadrement exigée. Ordinateur ou tablette connecté.',
    objectifs = array[
      'Situer son rôle de manager, ses responsabilités (dont légales) et adopter une posture adaptée au contexte et aux profils',
      'Identifier les compétences nécessaires, structurer le travail de l''équipe et répartir rôles et missions',
      'Fixer des objectifs, construire et utiliser des outils de pilotage et d''évaluation de l''activité collective',
      'Conduire les entretiens et réunions clés du manager et assurer la communication avec la hiérarchie',
      'Mettre en place un cadre de travail respectueux, soutenable et équitable, incluant la prise en compte du handicap',
      'Soutenir la motivation et la progression individuelle et collective',
      'Prévenir et résoudre les situations de tension ou de conflit',
      'Évaluer les résultats collectifs, conduire l''amélioration continue et accompagner le changement'],
    programme = array['Module 0 — Bienvenue et méthode de travail', 'Module 1 — Comprendre le rôle du manager', 'Module 2 — Organiser et structurer le travail de l''équipe', 'Module 3 — Communiquer, animer, conduire les entretiens', 'Module 4 — Motiver, engager, faire progresser', 'Module 5 — Gérer les tensions et les conflits', 'Module 6 — Piloter la performance et accompagner le changement', 'Module 7 — Évaluation finale et plan d''action']
  where id = f;

  insert into public.modules (formation_id, titre, description, ordre, duree_minutes) values (f, 'Module 0 — Bienvenue et méthode de travail', 'Prise en main du parcours et autopositionnement.', 1, 60) returning id into m;
  insert into public.lecons (module_id, titre, type, duree_minutes, ordre, publie, contenu) values
    (m, 'Bienvenue dans votre formation', 'video', 10, 1, false, '{"description": "", "note_conception": "Présentation d''IDEAFORMA, du parcours, des règles (accès, protection des contenus, aide)."}'::jsonb),
    (m, 'Comment tirer le meilleur de ce parcours', 'texte', 15, 2, false, '{"texte": "", "note_conception": "Rythme conseillé (2 × 1 h/semaine sur 12 semaines), carnet de bord, plan d''action final, comment contacter le formateur."}'::jsonb),
    (m, 'Où en êtes-vous ? — autopositionnement', 'quiz', 20, 3, false, '{"questions": [], "seuil": 0, "tentatives_max": 0, "corrections": false, "consigne": "20 questions sur les 10 compétences (non noté, seuil 0 %) : donne un point de départ et sera refait en fin de parcours."}'::jsonb),
    (m, 'Le cas fil rouge : l''atelier Garnier', 'texte', 15, 4, false, '{"texte": "", "note_conception": "Présentation d''une PME fictive (atelier de carrosserie 9 personnes, nouveau chef d''atelier) réutilisée dans tous les modules."}'::jsonb);

  insert into public.modules (formation_id, titre, description, ordre, duree_minutes) values (f, 'Module 1 — Comprendre le rôle du manager', 'Objectifs O1 · C6, C10', 2, 298) returning id into m;
  insert into public.lecons (module_id, titre, type, duree_minutes, ordre, publie, contenu) values
    (m, 'Manager, leader, chef : de quoi parle-t-on ?', 'video', 10, 1, false, '{"description": "", "note_conception": "Définitions ; les 10 rôles du manager (Mintzberg) ; la différence management / leadership (Kotter)."}'::jsonb),
    (m, 'Ce que fait vraiment un manager de proximité', 'texte', 30, 2, false, '{"texte": "", "note_conception": "Les 5 fonctions (planifier, organiser, animer, contrôler, développer) ; répartition du temps ; les pièges de la première prise de poste."}'::jsonb),
    (m, 'Les six styles de leadership', 'texte', 30, 3, false, '{"texte": "", "note_conception": "Goleman (2000) : directif, chef de file, visionnaire, participatif, coach, collaboratif — quand chacun est efficace ; autodiagnostic."}'::jsonb),
    (m, 'Adapter son style à la personne : le leadership situationnel', 'video', 10, 4, false, '{"description": "", "note_conception": "Hersey & Blanchard : autonomie / compétence / motivation → diriger, entraîner, épauler, déléguer."}'::jsonb),
    (m, 'De collègue à manager : la légitimité', 'podcast', 18, 5, false, '{"description": "", "note_conception": "Conversation : promotion interne, distance juste, premières semaines, erreurs classiques."}'::jsonb),
    (m, 'Les responsabilités légales du manager', 'texte', 40, 6, false, '{"texte": "", "note_conception": "Obligation de sécurité (C. trav. L4121-1 et suivants), harcèlement moral et sexuel (L1152-1, L1153-1), discrimination (L1132-1), temps de travail et droit à la déconnexion (L2242-17), délégation de pouvoirs : ce que le manager engage."}'::jsonb),
    (m, 'Manager entre deux feux : la communication avec la hiérarchie', 'texte', 25, 7, false, '{"texte": "", "note_conception": "Communication ascendante (remonter, alerter, proposer) et descendante (relayer une décision, y compris impopulaire), reporting utile."}'::jsonb),
    (m, 'Fiche outil — Ma feuille de route des 90 premiers jours', 'pdf', 15, 8, false, '{"description": "", "note_conception": "Gabarit à remplir."}'::jsonb),
    (m, 'Application à votre situation — carnet de bord', 'texte', 100, 9, false, '{"texte": "", "note_conception": "Transposer : décrire son équipe (ou une équipe connue), son style dominant, ses obligations, sa feuille de route ; consignes et grille d''auto-évaluation."}'::jsonb),
    (m, 'Quiz — Module 1', 'quiz', 20, 10, false, '{"questions": [], "seuil": 70, "tentatives_max": 3, "corrections": true, "consigne": "12 questions, seuil 70 %."}'::jsonb);

  insert into public.modules (formation_id, titre, description, ordre, duree_minutes) values (f, 'Module 2 — Organiser et structurer le travail de l''équipe', 'Objectifs O2, O3, O5 · C1, C2, C3, C4', 3, 358) returning id into m;
  insert into public.lecons (module_id, titre, type, duree_minutes, ordre, publie, contenu) values
    (m, 'De la stratégie de l''entreprise aux objectifs de l''équipe', 'video', 8, 1, false, '{"description": "", "note_conception": "Cascade stratégie → service → équipe → individu ; à quoi sert un objectif."}'::jsonb),
    (m, 'Fixer des objectifs qui engagent', 'texte', 35, 2, false, '{"texte": "", "note_conception": "SMART (Doran, 1981), théorie de la fixation d''objectifs (Locke & Latham), OKR simplifiés, objectifs collectifs vs individuels, pièges (objectifs imposés, trop nombreux)."}'::jsonb),
    (m, 'Identifier les compétences nécessaires', 'texte', 30, 3, false, '{"texte": "", "note_conception": "Analyser l''activité, matrice de compétences / polyvalence, fiche de poste, repérer les besoins de recrutement ou de formation."}'::jsonb),
    (m, 'Répartir les rôles et les missions', 'texte', 30, 4, false, '{"texte": "", "note_conception": "Organiser le travail, matrice RACI, planning, charge, équité de répartition."}'::jsonb),
    (m, 'Déléguer sans lâcher', 'video', 10, 5, false, '{"description": "", "note_conception": "Les niveaux de délégation, ce qui se délègue et ce qui ne se délègue pas, le contrat de délégation."}'::jsonb),
    (m, 'Prioriser : l''essentiel d''abord', 'texte', 20, 6, false, '{"texte": "", "note_conception": "Matrice urgent / important (Eisenhower), gestion des interruptions, protéger le temps de l''équipe."}'::jsonb),
    (m, 'Construire son tableau de bord', 'texte', 40, 7, false, '{"texte": "", "note_conception": "Indicateurs de résultat et de moyens, choisir 5 à 7 indicateurs, fréquence, visuel, ne pas piloter « au rétroviseur » ; exemple complet sur le cas Garnier."}'::jsonb),
    (m, 'Handicap : organiser sans exclure', 'texte', 30, 8, false, '{"texte": "", "note_conception": "RQTH, obligation d''emploi (OETH), aménagements raisonnables, rôle du référent handicap, Cap emploi / Agefiph, ce que le manager peut dire et faire."}'::jsonb),
    (m, 'Le tableau de bord qui a sauvé l''atelier', 'podcast', 15, 9, false, '{"description": "", "note_conception": "Conversation : d''un pilotage au ressenti à trois indicateurs partagés."}'::jsonb),
    (m, 'Fiche outil — Matrice de compétences + RACI + tableau de bord', 'pdf', 20, 10, false, '{"description": "", "note_conception": "Gabarits."}'::jsonb),
    (m, 'Cas pratique — Organiser l''atelier Garnier', 'texte', 30, 11, false, '{"texte": "", "note_conception": "Exercice guidé avec corrigé commenté."}'::jsonb),
    (m, 'Application à votre situation — carnet de bord', 'texte', 70, 12, false, '{"texte": "", "note_conception": "Construire sa matrice de compétences, son RACI et ses 5 indicateurs."}'::jsonb),
    (m, 'Quiz — Module 2', 'quiz', 20, 13, false, '{"questions": [], "seuil": 70, "tentatives_max": 3, "corrections": true, "consigne": "12 questions, seuil 70 %."}'::jsonb);

  insert into public.modules (formation_id, titre, description, ordre, duree_minutes) values (f, 'Module 3 — Communiquer, animer, conduire les entretiens', 'Objectifs O4 · C6, C10', 4, 361) returning id into m;
  insert into public.lecons (module_id, titre, type, duree_minutes, ordre, publie, contenu) values
    (m, 'La communication du manager : 80 % du métier', 'video', 8, 1, false, '{"description": "", "note_conception": "Ce qui se joue dans chaque échange ; écrit / oral / réunion / individuel."}'::jsonb),
    (m, 'Écouter vraiment : écoute active et questionnement', 'texte', 30, 2, false, '{"texte": "", "note_conception": "Écoute active (Rogers), reformulation, questions ouvertes, silences, biais d''interprétation."}'::jsonb),
    (m, 'Donner un feedback qui fait progresser', 'texte', 35, 3, false, '{"texte": "", "note_conception": "Feedback positif et correctif, méthode SBI (Situation-Comportement-Impact, CCL), méthode DESC, fréquence, éviter le « sandwich » mal fait."}'::jsonb),
    (m, 'Le feedback en pratique', 'video', 10, 4, false, '{"description": "", "note_conception": "Trois mises en situation commentées (retard répété, erreur client, très bon travail)."}'::jsonb),
    (m, 'Conduire un entretien individuel de suivi', 'texte', 35, 5, false, '{"texte": "", "note_conception": "Préparer, structurer (faits, ressenti, objectifs, soutien), conclure, tracer ; entretien de recadrage."}'::jsonb),
    (m, 'Entretien annuel et entretien de parcours professionnel : ne pas confondre', 'texte', 30, 6, false, '{"texte": "", "note_conception": "Entretien annuel d''évaluation (facultatif, négocié) vs entretien de parcours professionnel (C. trav. L6315-1, loi du 24/10/2025 : dès la 1re année puis tous les 4 ans, bilan tous les 8 ans, entretien à 45 ans et avant 60 ans) — contenu obligatoire, rôle du manager, traces."}'::jsonb),
    (m, 'Animer une réunion d''équipe utile', 'texte', 30, 7, false, '{"texte": "", "note_conception": "Rituels (brief quotidien, point hebdo, réunion mensuelle), ordre du jour, rôles, décisions et relevé, gestion des bavards et des silencieux, réunion à distance."}'::jsonb),
    (m, 'Dire non, alerter, négocier avec sa hiérarchie', 'podcast', 18, 8, false, '{"description": "", "note_conception": "Conversation : remonter un problème sans passer pour un râleur, défendre son équipe, obtenir des moyens."}'::jsonb),
    (m, 'Fiche outil — Trame d''entretien de suivi + ordre du jour type', 'pdf', 15, 9, false, '{"description": "", "note_conception": "Gabarits."}'::jsonb),
    (m, 'Cas pratique — Trois entretiens à l''atelier Garnier', 'texte', 30, 10, false, '{"texte": "", "note_conception": "Mises en situation écrites avec corrigé."}'::jsonb),
    (m, 'Application à votre situation — carnet de bord', 'texte', 100, 11, false, '{"texte": "", "note_conception": "Préparer par écrit un feedback réel, un entretien de suivi et l''ordre du jour de sa prochaine réunion."}'::jsonb),
    (m, 'Quiz — Module 3', 'quiz', 20, 12, false, '{"questions": [], "seuil": 70, "tentatives_max": 3, "corrections": true, "consigne": "12 questions, seuil 70 %."}'::jsonb);

  insert into public.modules (formation_id, titre, description, ordre, duree_minutes) values (f, 'Module 4 — Motiver, engager, faire progresser', 'Objectifs O5, O6 · C5, C7', 5, 358) returning id into m;
  insert into public.lecons (module_id, titre, type, duree_minutes, ordre, publie, contenu) values
    (m, 'Ce qui motive vraiment au travail', 'video', 10, 1, false, '{"description": "", "note_conception": "Herzberg (facteurs d''hygiène / de motivation), théorie de l''autodétermination (Deci & Ryan : autonomie, compétence, lien), le « principe du progrès » (Amabile & Kramer)."}'::jsonb),
    (m, 'La sécurité psychologique, socle de la performance', 'texte', 35, 2, false, '{"texte": "", "note_conception": "Edmondson (1999), projet Aristotle de Google (2015) : pourquoi les équipes où l''on ose parler performent ; 5 comportements du manager."}'::jsonb),
    (m, 'Reconnaître sans flatter', 'texte', 25, 3, false, '{"texte": "", "note_conception": "Reconnaissance des résultats, de l''effort, de la personne ; concret, sincère, régulier ; erreurs courantes."}'::jsonb),
    (m, 'Développer les compétences de chacun', 'texte', 35, 4, false, '{"texte": "", "note_conception": "Repérer les potentiels, plan de développement individuel, tutorat / binôme, formation (CPF, plan de développement des compétences), modèle GROW pour les entretiens de progression."}'::jsonb),
    (m, 'Intégrer un nouvel arrivant', 'texte', 25, 5, false, '{"texte": "", "note_conception": "Parcours d''intégration, parrain, premiers jours / première semaine / premier mois, point à 1 mois."}'::jsonb),
    (m, 'Un cadre de travail soutenable : charge, QVCT, télétravail', 'texte', 35, 6, false, '{"texte": "", "note_conception": "Charge de travail et régulation, QVCT (ANACT, ANI 2020), télétravail et hybride (L1222-9), droit à la déconnexion, équité de traitement."}'::jsonb),
    (m, 'Prévenir les risques psychosociaux : le rôle du manager', 'texte', 30, 7, false, '{"texte": "", "note_conception": "RPS (INRS ED 6250 « 9 conseils pour agir au quotidien »), signaux d''alerte, ce qui relève du manager / de l''employeur / du médecin du travail."}'::jsonb),
    (m, 'Le jour où l''équipe a arrêté de se taire', 'podcast', 18, 8, false, '{"description": "", "note_conception": "Conversation : installer la sécurité psychologique, réagir à une erreur, droit à l''erreur sans laxisme."}'::jsonb),
    (m, 'Fiche outil — Plan de développement individuel + check-list intégration', 'pdf', 15, 9, false, '{"description": "", "note_conception": "Gabarits."}'::jsonb),
    (m, 'Application à votre situation — carnet de bord', 'texte', 110, 10, false, '{"texte": "", "note_conception": "Diagnostic motivation / sécurité psychologique de son équipe, plan de développement d''un collaborateur, check-list charge de travail."}'::jsonb),
    (m, 'Quiz — Module 4', 'quiz', 20, 11, false, '{"questions": [], "seuil": 70, "tentatives_max": 3, "corrections": true, "consigne": "12 questions, seuil 70 %."}'::jsonb);

  insert into public.modules (formation_id, titre, description, ordre, duree_minutes) values (f, 'Module 5 — Gérer les tensions et les conflits', 'Objectifs O7 · C8', 6, 243) returning id into m;
  insert into public.lecons (module_id, titre, type, duree_minutes, ordre, publie, contenu) values
    (m, 'Le conflit n''est pas le problème', 'video', 8, 1, false, '{"description": "", "note_conception": "Conflit de tâche / de relation, niveaux d''escalade (Glasl), coût de l''évitement."}'::jsonb),
    (m, 'Comprendre ce qui se joue', 'texte', 30, 2, false, '{"texte": "", "note_conception": "Sources (rôles flous, ressources, valeurs, personnes), triangle dramatique (Karpman), biais du manager."}'::jsonb),
    (m, 'Prévenir : cadre, règles du jeu, signaux faibles', 'texte', 25, 3, false, '{"texte": "", "note_conception": "Règles de fonctionnement co-construites, rituels de régulation, repérer tôt."}'::jsonb),
    (m, 'Résoudre : la méthode en cinq étapes', 'texte', 35, 4, false, '{"texte": "", "note_conception": "Accueillir, écouter chaque partie, objectiver, chercher les options, contractualiser et suivre ; communication non violente (Rosenberg) ; quand et comment faire de la médiation."}'::jsonb),
    (m, 'Deux collègues qui ne se parlent plus', 'video', 10, 5, false, '{"description": "", "note_conception": "Mise en situation commentée pas à pas."}'::jsonb),
    (m, 'Situations difficiles : recadrer, sanctionner, alerter', 'texte', 35, 6, false, '{"texte": "", "note_conception": "Recadrage vs sanction (procédure disciplinaire : ce que le manager fait / ne fait pas), insubordination, collaborateur en souffrance, soupçon de harcèlement : obligation d''agir, enquête, orientation."}'::jsonb),
    (m, 'Le conflit que j''ai laissé pourrir', 'podcast', 15, 7, false, '{"description": "", "note_conception": "Conversation : retour d''expérience et enseignements."}'::jsonb),
    (m, 'Cas pratique — La tension au bureau Garnier', 'texte', 25, 8, false, '{"texte": "", "note_conception": "Cas écrit avec corrigé."}'::jsonb),
    (m, 'Application à votre situation — carnet de bord', 'texte', 40, 9, false, '{"texte": "", "note_conception": "Analyser une tension vécue avec la méthode en cinq étapes."}'::jsonb),
    (m, 'Quiz — Module 5', 'quiz', 20, 10, false, '{"questions": [], "seuil": 70, "tentatives_max": 3, "corrections": true, "consigne": "12 questions, seuil 70 %."}'::jsonb);

  insert into public.modules (formation_id, titre, description, ordre, duree_minutes) values (f, 'Module 6 — Piloter la performance et accompagner le changement', 'Objectifs O3, O8 · C3, C9', 7, 301) returning id into m;
  insert into public.lecons (module_id, titre, type, duree_minutes, ordre, publie, contenu) values
    (m, 'Évaluer sans juger : le bilan d''activité', 'video', 8, 1, false, '{"description": "", "note_conception": "Évaluer l''activité collective : résultats, moyens, conditions ; distinguer évaluation de l''activité et évaluation des personnes."}'::jsonb),
    (m, 'Le retour d''expérience et la rétrospective', 'texte', 30, 2, false, '{"texte": "", "note_conception": "Retex structuré (faits, causes, décisions), rétrospective d''équipe, culture de l''apprentissage par l''erreur."}'::jsonb),
    (m, 'L''amélioration continue au quotidien', 'texte', 35, 3, false, '{"texte": "", "note_conception": "PDCA (Deming), résolution de problème (5 pourquoi, diagramme d''Ishikawa, QQOQCP), petites améliorations vs grands chantiers."}'::jsonb),
    (m, 'Conduire le changement dans son équipe', 'texte', 40, 4, false, '{"texte": "", "note_conception": "Les 8 étapes de Kotter, courbe d''adaptation, résistances (peurs, pertes, habitudes), rôle du manager relais, communication du changement."}'::jsonb),
    (m, 'Annoncer un changement impopulaire', 'video', 10, 5, false, '{"description": "", "note_conception": "Mise en situation commentée."}'::jsonb),
    (m, 'Manager à distance et en hybride', 'texte', 25, 6, false, '{"texte": "", "note_conception": "Confiance et résultats plutôt que présence, rituels adaptés, outils, isolement, équité présentiel / distanciel."}'::jsonb),
    (m, 'Le changement qui a failli tout casser', 'podcast', 18, 7, false, '{"description": "", "note_conception": "Conversation : nouvel outil, résistances, ce qui a fait basculer l''équipe."}'::jsonb),
    (m, 'Fiche outil — Trame de retex + plan de conduite du changement', 'pdf', 15, 8, false, '{"description": "", "note_conception": "Gabarits."}'::jsonb),
    (m, 'Application à votre situation — carnet de bord', 'texte', 100, 9, false, '{"texte": "", "note_conception": "Rédiger un retex, choisir un problème à traiter en PDCA, esquisser un plan de changement."}'::jsonb),
    (m, 'Quiz — Module 6', 'quiz', 20, 10, false, '{"questions": [], "seuil": 70, "tentatives_max": 3, "corrections": true, "consigne": "12 questions, seuil 70 %."}'::jsonb);

  insert into public.modules (formation_id, titre, description, ordre, duree_minutes) values (f, 'Module 7 — Évaluation finale et plan d''action', 'Objectifs tous objectifs', 8, 113) returning id into m;
  insert into public.lecons (module_id, titre, type, duree_minutes, ordre, publie, contenu) values
    (m, 'Étude de cas transversale — l''atelier Garnier, un an après', 'evaluation', 60, 1, false, '{"questions": [], "seuil": 70, "tentatives_max": 2, "corrections": true, "consigne": "25 questions situationnelles couvrant les 10 compétences (seuil 70 %, 2 tentatives)."}'::jsonb),
    (m, 'Où en êtes-vous maintenant ? — autopositionnement final', 'quiz', 15, 2, false, '{"questions": [], "seuil": 0, "tentatives_max": 0, "corrections": false, "consigne": "Les 20 questions du module 0 : mesure de la progression."}'::jsonb),
    (m, 'Mon plan d''action 30-60-90 jours', 'texte', 30, 3, false, '{"texte": "", "note_conception": "Gabarit + consignes ; l''apprenant le rédige et le conserve (dépôt possible en étape 3)."}'::jsonb),
    (m, 'Et après ? Ressources, certification, suite de parcours', 'video', 8, 4, false, '{"description": "", "note_conception": "Aller plus loin : lectures, certification RS7377 (dès habilitation), formations IDEAFORMA complémentaires ; questionnaire de satisfaction."}'::jsonb);

  raise notice 'Squelette créé : % modules', (select count(*) from public.modules where formation_id = f);
end $$;