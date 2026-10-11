-- ============================================================
-- IDEAFORMA — import du contenu des leçons (partie 1/2) : management-leadership
-- Généré par contenus/outils/generer_import.py — relançable (écrase le contenu des leçons listées).
-- Prérequis : la formation et son squelette (modules + leçons) existent.
-- ============================================================
do $$
declare f uuid; n int := 0;
begin
  select id into f from public.formations where slug = 'management-leadership';
  if f is null then raise exception 'formation introuvable'; end if;

  -- 0.1-video-bienvenue.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

Bonjour, et bienvenue.

Vous venez d''ouvrir la formation « Management & Leadership » d''IDEAFORMA. Que vous soyez déjà responsable d''une équipe, sur le point de le devenir, ou que vous prépariez un poste avec des responsabilités d''encadrement, vous êtes au bon endroit.

Je vais prendre quelques minutes pour vous expliquer ce que vous allez apprendre, comment la formation est organisée, et comment en tirer le meilleur.

## Pourquoi cette formation ?

Commençons par une idée simple. On ne naît pas manager. On le devient, et on l''apprend. La plupart des personnes qui encadrent une équipe pour la première fois ont été nommées parce qu''elles étaient bonnes dans leur métier : bon technicien, bonne vendeuse, bon comptable. Et du jour au lendemain, on leur demande autre chose : organiser le travail des autres, fixer des objectifs, faire des retours, gérer des tensions, rendre des comptes à la direction.

Ce sont des compétences. Elles s''apprennent, elles se travaillent, et c''est exactement ce que nous allons faire ensemble.

## Ce que vous saurez faire à la fin

À la fin de ce parcours, vous serez capable de huit choses.

Un : situer votre rôle de manager, vos responsabilités, y compris légales, et adopter la bonne posture selon la situation et les personnes.

Deux : identifier les compétences dont votre activité a besoin, structurer le travail et répartir les rôles.

Trois : fixer des objectifs et construire un tableau de bord simple pour piloter l''activité.

Quatre : conduire les entretiens et les réunions clés, et bien communiquer avec votre hiérarchie.

Cinq : mettre en place un cadre de travail respectueux, soutenable et équitable, y compris pour les personnes en situation de handicap.

Six : soutenir la motivation et la progression de chacun.

Sept : prévenir et résoudre les tensions et les conflits.

Huit : évaluer les résultats, améliorer en continu et accompagner le changement.

Ces huit capacités correspondent aux compétences attendues d''un manager de proximité en France aujourd''hui. Nous nous sommes appuyés sur le référentiel officiel « Animer une équipe de travail », enregistré par France Compétences, pour construire ce programme. Autrement dit : ce que vous allez apprendre ici, c''est ce que le marché du travail attend réellement d''un responsable d''équipe.

## Comment c''est organisé

La formation compte huit modules, pour environ trente-cinq heures de travail.

Le module zéro, celui que vous commencez maintenant, vous met en selle : la méthode, un questionnaire de départ, et la présentation du cas que nous suivrons tout au long du parcours.

Le module un vous fait entrer dans le rôle du manager : ce qu''il fait vraiment, les styles de leadership, la légitimité, et vos responsabilités légales.

Le module deux porte sur l''organisation du travail : objectifs, compétences, répartition des rôles, délégation, tableau de bord.

Le module trois traite de la communication : écoute, feedback, entretiens, réunions, relation avec la hiérarchie.

Le module quatre parle de motivation, d''engagement et de progression : ce qui motive vraiment, la sécurité psychologique, la reconnaissance, le développement des compétences, la prévention des risques psychosociaux.

Le module cinq est consacré aux tensions et aux conflits.

Le module six, au pilotage de la performance et à la conduite du changement.

Et le module sept termine par une évaluation finale et votre plan d''action personnel.

## Un cas fil rouge

Pour que tout cela reste concret, nous suivrons une seule et même histoire du début à la fin : celle de l''atelier Garnier, une petite entreprise de carrosserie de neuf personnes, où un technicien vient d''être promu chef d''atelier. À chaque module, nous verrons comment il applique les outils, ses réussites et ses erreurs. Puis, à chaque fois, vous transposerez à votre propre situation.

Si vous ne travaillez pas dans l''automobile, aucune inquiétude : les situations sont universelles, et des variantes en commerce, en bureau ou en service sont proposées régulièrement.

## Les formats

Chaque module mélange plusieurs formats. Des vidéos courtes, comme celle-ci, pour poser l''essentiel. Des cours écrits, pour approfondir les concepts et les méthodes, avec leurs sources. Des podcasts, sous forme de conversation, pour entendre des retours d''expérience et des nuances. Des fiches outils, que vous pourrez réutiliser au travail. Des cas pratiques corrigés. Et un quiz à la fin de chaque module, pour vérifier que l''essentiel est acquis.

## Quelques règles

Trois règles simples.

Première règle : allez à votre rythme, mais gardez le rythme. Nous vous conseillons deux séances d''une heure par semaine, pendant douze semaines. Votre accès à la formation a une date de fin, que vous voyez sur votre tableau de bord.

Deuxième règle : les contenus de cette plateforme sont personnels. Ils sont protégés : pas de téléchargement, pas de copie, pas de diffusion. Chaque page porte un filigrane à votre nom. C''est ce qui nous permet de vous proposer des contenus de qualité à un prix accessible.

Troisième règle : vous n''êtes pas seul. Si vous avez une question, une difficulté technique ou un besoin d''aménagement, par exemple en cas de situation de handicap, contactez IDEAFORMA : les coordonnées sont dans la leçon suivante et dans votre espace. Nous répondons sous vingt-quatre heures ouvrées.

Une dernière chose avant de commencer. Vous allez apprendre des méthodes, des modèles, des outils. Mais le management, ce n''est pas réciter des modèles. C''est prendre des décisions, avec des personnes réelles, dans des situations qui ne ressemblent jamais tout à fait aux exemples. Les modèles sont là pour vous aider à réfléchir, pas pour réfléchir à votre place.

Alors gardez toujours cette question en tête, à chaque leçon : « Et moi, dans mon équipe, qu''est-ce que je ferais ? »

C''est parti. Rendez-vous dans la leçon suivante pour la méthode de travail.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

Bonjour, et bienvenue.

Vous venez d''ouvrir la formation « Management & Leadership » d''IDEAFORMA. Que vous soyez déjà responsable d''une équipe, sur le point de le devenir, ou que vous prépariez un poste avec des responsabilités d''encadrement, vous êtes au bon endroit.

Je vais prendre quelques minutes pour vous expliquer ce que vous allez apprendre, comment la formation est organisée, et comment en tirer le meilleur.

## Pourquoi cette formation ?

Commençons par une idée simple. On ne naît pas manager. On le devient, et on l''apprend. La plupart des personnes qui encadrent une équipe pour la première fois ont été nommées parce qu''elles étaient bonnes dans leur métier : bon technicien, bonne vendeuse, bon comptable. Et du jour au lendemain, on leur demande autre chose : organiser le travail des autres, fixer des objectifs, faire des retours, gérer des tensions, rendre des comptes à la direction.

Ce sont des compétences. Elles s''apprennent, elles se travaillent, et c''est exactement ce que nous allons faire ensemble.

## Ce que vous saurez faire à la fin

À la fin de ce parcours, vous serez capable de huit choses.

Un : situer votre rôle de manager, vos responsabilités, y compris légales, et adopter la bonne posture selon la situation et les personnes.

Deux : identifier les compétences dont votre activité a besoin, structurer le travail et répartir les rôles.

Trois : fixer des objectifs et construire un tableau de bord simple pour piloter l''activité.

Quatre : conduire les entretiens et les réunions clés, et bien communiquer avec votre hiérarchie.

Cinq : mettre en place un cadre de travail respectueux, soutenable et équitable, y compris pour les personnes en situation de handicap.

Six : soutenir la motivation et la progression de chacun.

Sept : prévenir et résoudre les tensions et les conflits.

Huit : évaluer les résultats, améliorer en continu et accompagner le changement.

Ces huit capacités correspondent aux compétences attendues d''un manager de proximité en France aujourd''hui. Nous nous sommes appuyés sur le référentiel officiel « Animer une équipe de travail », enregistré par France Compétences, pour construire ce programme. Autrement dit : ce que vous allez apprendre ici, c''est ce que le marché du travail attend réellement d''un responsable d''équipe.

## Comment c''est organisé

La formation compte huit modules, pour environ trente-cinq heures de travail.

Le module zéro, celui que vous commencez maintenant, vous met en selle : la méthode, un questionnaire de départ, et la présentation du cas que nous suivrons tout au long du parcours.

Le module un vous fait entrer dans le rôle du manager : ce qu''il fait vraiment, les styles de leadership, la légitimité, et vos responsabilités légales.

Le module deux porte sur l''organisation du travail : objectifs, compétences, répartition des rôles, délégation, tableau de bord.

Le module trois traite de la communication : écoute, feedback, entretiens, réunions, relation avec la hiérarchie.

Le module quatre parle de motivation, d''engagement et de progression : ce qui motive vraiment, la sécurité psychologique, la reconnaissance, le développement des compétences, la prévention des risques psychosociaux.

Le module cinq est consacré aux tensions et aux conflits.

Le module six, au pilotage de la performance et à la conduite du changement.

Et le module sept termine par une évaluation finale et votre plan d''action personnel.

## Un cas fil rouge

Pour que tout cela reste concret, nous suivrons une seule et même histoire du début à la fin : celle de l''atelier Garnier, une petite entreprise de carrosserie de neuf personnes, où un technicien vient d''être promu chef d''atelier. À chaque module, nous verrons comment il applique les outils, ses réussites et ses erreurs. Puis, à chaque fois, vous transposerez à votre propre situation.

Si vous ne travaillez pas dans l''automobile, aucune inquiétude : les situations sont universelles, et des variantes en commerce, en bureau ou en service sont proposées régulièrement.

## Les formats

Chaque module mélange plusieurs formats. Des vidéos courtes, comme celle-ci, pour poser l''essentiel. Des cours écrits, pour approfondir les concepts et les méthodes, avec leurs sources. Des podcasts, sous forme de conversation, pour entendre des retours d''expérience et des nuances. Des fiches outils, que vous pourrez réutiliser au travail. Des cas pratiques corrigés. Et un quiz à la fin de chaque module, pour vérifier que l''essentiel est acquis.

## Quelques règles

Trois règles simples.

Première règle : allez à votre rythme, mais gardez le rythme. Nous vous conseillons deux séances d''une heure par semaine, pendant douze semaines. Votre accès à la formation a une date de fin, que vous voyez sur votre tableau de bord.

Deuxième règle : les contenus de cette plateforme sont personnels. Ils sont protégés : pas de téléchargement, pas de copie, pas de diffusion. Chaque page porte un filigrane à votre nom. C''est ce qui nous permet de vous proposer des contenus de qualité à un prix accessible.

Troisième règle : vous n''êtes pas seul. Si vous avez une question, une difficulté technique ou un besoin d''aménagement, par exemple en cas de situation de handicap, contactez IDEAFORMA : les coordonnées sont dans la leçon suivante et dans votre espace. Nous répondons sous vingt-quatre heures ouvrées.

Une dernière chose avant de commencer. Vous allez apprendre des méthodes, des modèles, des outils. Mais le management, ce n''est pas réciter des modèles. C''est prendre des décisions, avec des personnes réelles, dans des situations qui ne ressemblent jamais tout à fait aux exemples. Les modèles sont là pour vous aider à réfléchir, pas pour réfléchir à votre place.

Alors gardez toujours cette question en tête, à chaque leçon : « Et moi, dans mon équipe, qu''est-ce que je ferais ? »

C''est parti. Rendez-vous dans la leçon suivante pour la méthode de travail.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 1 and l.ordre = 1;
  n := n + 1;

  -- 0.2-methode.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Cette formation représente environ 35 heures de travail, à caser à côté d''un emploi, d''une recherche d''emploi ou d''une vie de famille. Sans organisation, il est facile de décrocher au bout de quelques semaines. Voici la méthode que nous vous proposons.

## Le rythme conseillé

Nous vous recommandons deux séances d''une heure par semaine, sur douze semaines. Ce rythme tient dans un emploi du temps chargé et vous laisse le temps d''essayer au travail, entre deux séances, ce que vous venez de lire. À l''inverse, tout avaler en trois jours donne l''impression d''avancer vite, mais on en retient peu.

Si vous préférez des séances plus longues le week-end, ou plus courtes chaque jour, c''est possible. L''important est la régularité : une séance par semaine minimum, sans quoi vous perdrez le fil.

Votre espace affiche la date de fin de votre accès. Si vous sentez que vous n''y arriverez pas dans les temps, prévenez-nous avant l''échéance, pas après.

## L''ordre des leçons

Les modules sont conçus pour être suivis dans l''ordre : chaque module s''appuie sur les précédents et le cas fil rouge évolue au fil du parcours. À l''intérieur d''un module, suivez aussi l''ordre proposé : vidéo, cours, podcast, fiche, cas pratique, carnet de bord, quiz.

Vous pouvez revenir sur une leçon terminée autant de fois que vous le souhaitez.

## Le carnet de bord

C''est l''outil le plus important de la formation, et il ne se trouve pas sur la plateforme : c''est un document que vous tenez vous-même, sur papier ou sur ordinateur.

À la fin de chaque module, une leçon « Application à votre situation » vous demande de transposer ce que vous venez d''apprendre à votre propre équipe, ou à une équipe que vous connaissez bien si vous n''encadrez pas encore. Vous y répondez dans votre carnet de bord.

Ce carnet vous servira trois fois : pendant la formation, pour ancrer les apprentissages ; à la fin, pour construire votre plan d''action 30-60-90 jours ; et plus tard, dans votre poste, comme aide-mémoire.

Ouvrez-le dès maintenant et notez en première page : votre situation actuelle (poste, équipe, ancienneté), ce qui vous amène à cette formation, et ce que vous voulez savoir faire dans trois mois.

## Les quiz et l''évaluation finale

Chaque module se termine par un quiz de vingt questions. Le seuil de réussite est de 70 %, avec trois tentatives possibles. Ces quiz ne cherchent pas à vous piéger : ils vérifient que les notions principales sont acquises avant de passer à la suite. Si vous échouez, relisez les leçons concernées avant de retenter.

Le module 7 comporte une évaluation finale sous forme d''étude de cas : vingt-cinq situations concrètes qui couvrent l''ensemble du parcours. Seuil de 70 %, deux tentatives.

Au début et à la fin de la formation, un questionnaire d''autopositionnement de vingt questions vous permet de mesurer votre progression. Il n''est pas noté : répondez sincèrement, c''est le seul moyen qu''il vous serve.

Vos résultats sont conservés. Ils constituent, avec votre temps de connexion et votre progression, les preuves de réalisation de la formation, que nous devons pouvoir présenter en cas de contrôle (par votre financeur ou dans le cadre de notre certification Qualiopi).

## L''attestation de fin de formation

À la fin du parcours, IDEAFORMA vous délivre une attestation de fin de formation. Elle mentionne les objectifs, la nature et la durée de la formation, ainsi que les résultats de vos évaluations. Si votre formation est prise en charge (par un OPCO ou France Travail, par exemple), un certificat de réalisation est aussi transmis au financeur.

Un point important : cette formation travaille les compétences du certificat « Animer une équipe de travail » (RS7377, CCI France), mais elle ne délivre pas ce certificat, n''est pas certifiante et n''ouvre pas droit au CPF. Si vous souhaitez passer le certificat, nous vous indiquerons la marche à suivre à la fin du parcours.

## Les sources

Tout ce que vous lirez ici s''appuie sur des sources identifiées : textes de loi (Code du travail), organismes publics (INRS, ANACT, France Compétences), et travaux de référence en management et en psychologie du travail. Chaque cours cite ses sources en fin de leçon.

En management, on entend beaucoup d''affirmations séduisantes et fausses. Savoir d''où vient une idée, c''est savoir jusqu''où on peut lui faire confiance. Prenez cette habitude dans votre pratique : demandez d''où vient un chiffre avant de le répéter.

## Accessibilité et aménagements

Chaque vidéo et chaque podcast est accompagné de sa version écrite complète, à lire sous le lecteur : vous pouvez suivre toute la formation sans le son. La plateforme se navigue au clavier.

Si vous êtes en situation de handicap, ou si une difficulté particulière (dyslexie, fatigue, contraintes de temps) rend certains formats difficiles, contactez notre référent handicap à l''adresse contact@ideaforma.fr, en indiquant « Référent handicap » dans l''objet. Nous pouvons adapter la durée d''accès, proposer des supports alternatifs ou aménager les modalités d''évaluation. Cette demande reste confidentielle.

## Nous contacter

- Questions sur le contenu, difficultés techniques, aménagements : contact@ideaforma.fr (réponse sous 24 heures ouvrées).
- Téléphone : 06 25 16 13 93, du lundi au vendredi, de 9 h à 18 h.
- Pour changer votre mot de passe : menu « Mon compte ».

## À retenir

- Deux séances d''une heure par semaine, dans l''ordre des modules.
- Tenez un carnet de bord : il devient votre plan d''action.
- Quiz à 70 %, trois tentatives ; évaluation finale, deux tentatives.
- Répondez sincèrement à l''autopositionnement.
- En cas de difficulté, écrivez-nous avant la date de fin d''accès.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Cette formation représente environ 35 heures de travail, à caser à côté d''un emploi, d''une recherche d''emploi ou d''une vie de famille. Sans organisation, il est facile de décrocher au bout de quelques semaines. Voici la méthode que nous vous proposons.

## Le rythme conseillé

Nous vous recommandons deux séances d''une heure par semaine, sur douze semaines. Ce rythme tient dans un emploi du temps chargé et vous laisse le temps d''essayer au travail, entre deux séances, ce que vous venez de lire. À l''inverse, tout avaler en trois jours donne l''impression d''avancer vite, mais on en retient peu.

Si vous préférez des séances plus longues le week-end, ou plus courtes chaque jour, c''est possible. L''important est la régularité : une séance par semaine minimum, sans quoi vous perdrez le fil.

Votre espace affiche la date de fin de votre accès. Si vous sentez que vous n''y arriverez pas dans les temps, prévenez-nous avant l''échéance, pas après.

## L''ordre des leçons

Les modules sont conçus pour être suivis dans l''ordre : chaque module s''appuie sur les précédents et le cas fil rouge évolue au fil du parcours. À l''intérieur d''un module, suivez aussi l''ordre proposé : vidéo, cours, podcast, fiche, cas pratique, carnet de bord, quiz.

Vous pouvez revenir sur une leçon terminée autant de fois que vous le souhaitez.

## Le carnet de bord

C''est l''outil le plus important de la formation, et il ne se trouve pas sur la plateforme : c''est un document que vous tenez vous-même, sur papier ou sur ordinateur.

À la fin de chaque module, une leçon « Application à votre situation » vous demande de transposer ce que vous venez d''apprendre à votre propre équipe, ou à une équipe que vous connaissez bien si vous n''encadrez pas encore. Vous y répondez dans votre carnet de bord.

Ce carnet vous servira trois fois : pendant la formation, pour ancrer les apprentissages ; à la fin, pour construire votre plan d''action 30-60-90 jours ; et plus tard, dans votre poste, comme aide-mémoire.

Ouvrez-le dès maintenant et notez en première page : votre situation actuelle (poste, équipe, ancienneté), ce qui vous amène à cette formation, et ce que vous voulez savoir faire dans trois mois.

## Les quiz et l''évaluation finale

Chaque module se termine par un quiz de vingt questions. Le seuil de réussite est de 70 %, avec trois tentatives possibles. Ces quiz ne cherchent pas à vous piéger : ils vérifient que les notions principales sont acquises avant de passer à la suite. Si vous échouez, relisez les leçons concernées avant de retenter.

Le module 7 comporte une évaluation finale sous forme d''étude de cas : vingt-cinq situations concrètes qui couvrent l''ensemble du parcours. Seuil de 70 %, deux tentatives.

Au début et à la fin de la formation, un questionnaire d''autopositionnement de vingt questions vous permet de mesurer votre progression. Il n''est pas noté : répondez sincèrement, c''est le seul moyen qu''il vous serve.

Vos résultats sont conservés. Ils constituent, avec votre temps de connexion et votre progression, les preuves de réalisation de la formation, que nous devons pouvoir présenter en cas de contrôle (par votre financeur ou dans le cadre de notre certification Qualiopi).

## L''attestation de fin de formation

À la fin du parcours, IDEAFORMA vous délivre une attestation de fin de formation. Elle mentionne les objectifs, la nature et la durée de la formation, ainsi que les résultats de vos évaluations. Si votre formation est prise en charge (par un OPCO ou France Travail, par exemple), un certificat de réalisation est aussi transmis au financeur.

Un point important : cette formation travaille les compétences du certificat « Animer une équipe de travail » (RS7377, CCI France), mais elle ne délivre pas ce certificat, n''est pas certifiante et n''ouvre pas droit au CPF. Si vous souhaitez passer le certificat, nous vous indiquerons la marche à suivre à la fin du parcours.

## Les sources

Tout ce que vous lirez ici s''appuie sur des sources identifiées : textes de loi (Code du travail), organismes publics (INRS, ANACT, France Compétences), et travaux de référence en management et en psychologie du travail. Chaque cours cite ses sources en fin de leçon.

En management, on entend beaucoup d''affirmations séduisantes et fausses. Savoir d''où vient une idée, c''est savoir jusqu''où on peut lui faire confiance. Prenez cette habitude dans votre pratique : demandez d''où vient un chiffre avant de le répéter.

## Accessibilité et aménagements

Chaque vidéo et chaque podcast est accompagné de sa version écrite complète, à lire sous le lecteur : vous pouvez suivre toute la formation sans le son. La plateforme se navigue au clavier.

Si vous êtes en situation de handicap, ou si une difficulté particulière (dyslexie, fatigue, contraintes de temps) rend certains formats difficiles, contactez notre référent handicap à l''adresse contact@ideaforma.fr, en indiquant « Référent handicap » dans l''objet. Nous pouvons adapter la durée d''accès, proposer des supports alternatifs ou aménager les modalités d''évaluation. Cette demande reste confidentielle.

## Nous contacter

- Questions sur le contenu, difficultés techniques, aménagements : contact@ideaforma.fr (réponse sous 24 heures ouvrées).
- Téléphone : 06 25 16 13 93, du lundi au vendredi, de 9 h à 18 h.
- Pour changer votre mot de passe : menu « Mon compte ».

## À retenir

- Deux séances d''une heure par semaine, dans l''ordre des modules.
- Tenez un carnet de bord : il devient votre plan d''action.
- Quiz à 70 %, trois tentatives ; évaluation finale, deux tentatives.
- Répondez sincèrement à l''autopositionnement.
- En cas de difficulté, écrivez-nous avant la date de fin d''accès.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 1 and l.ordre = 2;
  n := n + 1;

  -- 0.3-autopositionnement.json
  update public.lecons l set contenu = '{"questions": [{"id": "ap01", "enonce": "Je sais expliquer clairement en quoi le rôle d''un manager diffère de celui d''un expert technique.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "ap02", "enonce": "Je connais les principales obligations légales qui pèsent sur un manager (sécurité, harcèlement, discrimination, temps de travail).", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "ap03", "enonce": "Je suis capable d''adapter ma façon de manager selon la personne et la situation, plutôt que d''appliquer un seul style.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "ap04", "enonce": "Je sais lister les compétences nécessaires à une activité et repérer celles qui manquent dans une équipe.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "ap05", "enonce": "Je sais répartir les rôles et les missions dans une équipe de façon claire et équitable.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "ap06", "enonce": "Je sais formuler un objectif précis, mesurable et daté pour une équipe.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "ap07", "enonce": "Je sais construire et utiliser un tableau de bord simple (quelques indicateurs) pour suivre l''activité.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "ap08", "enonce": "Je sais déléguer une tâche en fixant le cadre, le niveau d''autonomie et le point de contrôle.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "ap09", "enonce": "Je sais donner un retour (feedback) sur un comportement, positif ou correctif, sans blesser ni minimiser.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "ap10", "enonce": "Je sais préparer et conduire un entretien individuel de suivi avec un collaborateur.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "ap11", "enonce": "Je connais la différence entre l''entretien annuel d''évaluation et l''entretien de parcours professionnel prévu par la loi.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "ap12", "enonce": "Je sais animer une réunion d''équipe qui aboutit à des décisions et à des actions suivies.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "ap13", "enonce": "Je sais faire remonter un problème ou un désaccord à ma hiérarchie de manière constructive.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "ap14", "enonce": "Je sais ce qui motive réellement les personnes au travail et comment agir dessus en tant que manager.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "ap15", "enonce": "Je sais créer un climat où chacun ose signaler un problème ou une erreur sans crainte.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "ap16", "enonce": "Je sais repérer les signaux d''une charge de travail excessive ou d''un risque psychosocial dans une équipe et je sais quoi faire.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "ap17", "enonce": "Je sais ce qu''un manager peut et doit faire pour intégrer un collaborateur en situation de handicap.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "ap18", "enonce": "Je sais accompagner la montée en compétences d''un collaborateur (plan de développement, tutorat, formation).", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "ap19", "enonce": "Je sais intervenir dans un conflit entre deux collaborateurs avec une méthode, sans prendre parti.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "ap20", "enonce": "Je sais évaluer les résultats d''une équipe, en tirer des enseignements et conduire un changement dans l''équipe.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}], "seuil": 0, "tentatives_max": 0, "corrections": false, "consigne": "Autopositionnement (non noté). Pour chaque affirmation, choisissez la réponse qui décrit le mieux votre situation aujourd''hui. Répondez sincèrement : ce questionnaire vous sert de point de départ et sera repris en fin de parcours."}'::jsonb, publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 1 and l.ordre = 3;
  n := n + 1;

  -- 0.4-cas-garnier.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Tout au long de la formation, nous suivrons une même entreprise et une même personne. Prenez cinq minutes pour faire connaissance avec eux : vous les retrouverez à chaque module.

## L''entreprise

Carrosserie Garnier est une entreprise de carrosserie-peinture installée en zone industrielle, en périphérie d''une ville moyenne. Elle existe depuis vingt-deux ans. Elle répare des véhicules de particuliers, mais surtout des véhicules de flottes d''entreprises et de compagnies d''assurance, qui représentent 70 % du chiffre d''affaires.

L''atelier tourne avec neuf personnes :

- Michel Garnier, 58 ans, le fondateur et dirigeant. Il passe encore la moitié de son temps à l''atelier, mais souhaite se consacrer davantage aux clients et à la gestion. Il veut « pouvoir partir en vacances sans que tout s''arrête ».
- Sophie, 41 ans, secrétaire et gestionnaire administrative : accueil, devis, relations avec les experts et les assurances, facturation. Elle connaît tous les clients et tous les dossiers.
- Karim, 34 ans, carrossier depuis douze ans, dont huit chez Garnier. Reconnu comme le plus rapide et le plus soigneux. Il vient d''être nommé chef d''atelier.
- Thierry, 52 ans, carrossier depuis vingt-huit ans, dont vingt chez Garnier. Très compétent, plutôt taiseux, n''aime pas qu''on change ses habitudes. Il a été pressenti pour le poste de chef d''atelier il y a quelques années et l''a refusé.
- Nadia, 29 ans, peintre. Rigoureuse, autonome, elle gère seule la cabine de peinture. Elle aimerait évoluer, sans savoir vers quoi.
- Julien, 26 ans, carrossier arrivé il y a dix-huit mois. Motivé, rapide, mais parfois brouillon ; deux reprises pour défaut de finition ce trimestre.
- Lucas, 20 ans, apprenti carrossier en deuxième année. Très à l''aise avec les outils numériques, moins avec la ponctualité.
- Fatou, 45 ans, préparatrice : démontage, préparation des surfaces, nettoyage des véhicules avant restitution. Discrète, fiable, jamais absente. Elle bénéficie d''une reconnaissance de la qualité de travailleur handicapé (RQTH). Le médecin du travail a fixé une seule restriction, la seule chose que l''entreprise a à connaître : pas de port de charges de plus de dix kilos.
- Marc, 38 ans, mécanicien, chargé des interventions mécaniques liées aux chocs (géométrie, trains roulants, climatisation). Il travaille souvent seul et se plaint de ne jamais être prévenu des priorités.

## La situation

Il y a trois semaines, Michel Garnier a réuni l''équipe et annoncé que Karim devenait chef d''atelier. Ses mots : « Karim, tu connais le boulot mieux que personne. Tu organises l''atelier, tu gères les priorités, tu me fais remonter ce qui ne va pas. Moi je m''occupe des clients et de la boutique. »

Il n''y a pas eu de fiche de poste. Karim garde une partie de son activité de carrossier « pour ne pas perdre la main » et parce que l''atelier a besoin de bras. Sa rémunération a augmenté de 180 euros brut par mois.

Depuis trois semaines, voici ce qui s''est passé.

Thierry a dit à Karim, devant Julien : « Tu vas pas commencer à me dire comment faire mon boulot, quand même. » Karim n''a rien répondu.

Sophie continue de donner directement les priorités aux carrossiers quand un client appelle, comme elle l''a toujours fait. Deux fois, Karim a découvert qu''un véhicule qu''il avait planifié pour le lendemain avait été commencé dans la journée.

Julien a rendu un véhicule avec une coulure de vernis sur l''aile arrière : c''est à lui, à l''atelier, de faire le lustrage et la vérification finale avant restitution, et il ne l''a pas vue. Le client de la flotte a fait une réclamation. Michel a réprimandé Julien vertement devant tout le monde, puis a dit à Karim : « C''est à toi de contrôler. »

Marc est venu voir Karim pour lui dire qu''il n''a jamais les infos à temps et qu''il « en a marre d''être la cinquième roue du carrosse ».

Lucas est arrivé en retard trois fois. Personne ne lui a rien dit.

Karim fait toujours ses huit heures de carrosserie et gère « le reste » entre deux voitures, souvent le soir. Il rentre chez lui fatigué et se demande s''il a bien fait d''accepter.

## Ce que dit Michel Garnier

« L''atelier est bon, on a des clients, le problème c''est l''organisation. Je veux qu''on tienne les délais annoncés aux assurances, qu''on arrête les reprises, et que je n''aie plus à intervenir tous les jours. Karim a six mois pour mettre ça en place. Je le soutiens. »

## Ce que nous allons faire avec ce cas

À chaque module, nous reprendrons l''atelier Garnier là où nous l''avons laissé :

- Module 1 : Karim clarifie son rôle, prend conscience de ses responsabilités et choisit comment se positionner face à Thierry, à Sophie et à Michel.
- Module 2 : il organise l''atelier (compétences, rôles, priorités, tableau de bord) et intègre les contraintes de poste de Fatou.
- Module 3 : il conduit ses premiers entretiens (Julien, Marc, Lucas) et met en place une réunion hebdomadaire.
- Module 4 : il travaille la motivation et la progression (Nadia, Julien, Lucas) et la charge de travail (la sienne y compris).
- Module 5 : il traite la tension avec Thierry et un désaccord entre Sophie et l''atelier.
- Module 6 : il fait le bilan des six mois, propose un changement d''organisation et l''accompagne.
- Module 7 : l''évaluation finale se déroule un an plus tard.

## Et si vous n''êtes pas dans l''automobile

Les situations de Karim existent partout : un vendeur devenu responsable de magasin, une infirmière devenue cadre de service, un développeur devenu chef d''équipe, une chargée de clientèle devenue responsable d''agence. Quand une leçon s''y prête, nous proposons une variante « commerce », « bureau » ou « service ». Et dans votre carnet de bord, c''est toujours votre situation qui compte.

## Pour votre carnet de bord

Avant de passer au module 1, notez trois choses :

- Qu''est-ce qui, dans la situation de Karim, ressemble à ce que vous vivez ou avez vu vivre ?
- Quelle est, selon vous, la première chose que Karim devrait faire ?
- Qu''auriez-vous fait à la place de Michel Garnier au moment de nommer Karim ?

Gardez ces réponses : vous les relirez au module 7.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Tout au long de la formation, nous suivrons une même entreprise et une même personne. Prenez cinq minutes pour faire connaissance avec eux : vous les retrouverez à chaque module.

## L''entreprise

Carrosserie Garnier est une entreprise de carrosserie-peinture installée en zone industrielle, en périphérie d''une ville moyenne. Elle existe depuis vingt-deux ans. Elle répare des véhicules de particuliers, mais surtout des véhicules de flottes d''entreprises et de compagnies d''assurance, qui représentent 70 % du chiffre d''affaires.

L''atelier tourne avec neuf personnes :

- Michel Garnier, 58 ans, le fondateur et dirigeant. Il passe encore la moitié de son temps à l''atelier, mais souhaite se consacrer davantage aux clients et à la gestion. Il veut « pouvoir partir en vacances sans que tout s''arrête ».
- Sophie, 41 ans, secrétaire et gestionnaire administrative : accueil, devis, relations avec les experts et les assurances, facturation. Elle connaît tous les clients et tous les dossiers.
- Karim, 34 ans, carrossier depuis douze ans, dont huit chez Garnier. Reconnu comme le plus rapide et le plus soigneux. Il vient d''être nommé chef d''atelier.
- Thierry, 52 ans, carrossier depuis vingt-huit ans, dont vingt chez Garnier. Très compétent, plutôt taiseux, n''aime pas qu''on change ses habitudes. Il a été pressenti pour le poste de chef d''atelier il y a quelques années et l''a refusé.
- Nadia, 29 ans, peintre. Rigoureuse, autonome, elle gère seule la cabine de peinture. Elle aimerait évoluer, sans savoir vers quoi.
- Julien, 26 ans, carrossier arrivé il y a dix-huit mois. Motivé, rapide, mais parfois brouillon ; deux reprises pour défaut de finition ce trimestre.
- Lucas, 20 ans, apprenti carrossier en deuxième année. Très à l''aise avec les outils numériques, moins avec la ponctualité.
- Fatou, 45 ans, préparatrice : démontage, préparation des surfaces, nettoyage des véhicules avant restitution. Discrète, fiable, jamais absente. Elle bénéficie d''une reconnaissance de la qualité de travailleur handicapé (RQTH). Le médecin du travail a fixé une seule restriction, la seule chose que l''entreprise a à connaître : pas de port de charges de plus de dix kilos.
- Marc, 38 ans, mécanicien, chargé des interventions mécaniques liées aux chocs (géométrie, trains roulants, climatisation). Il travaille souvent seul et se plaint de ne jamais être prévenu des priorités.

## La situation

Il y a trois semaines, Michel Garnier a réuni l''équipe et annoncé que Karim devenait chef d''atelier. Ses mots : « Karim, tu connais le boulot mieux que personne. Tu organises l''atelier, tu gères les priorités, tu me fais remonter ce qui ne va pas. Moi je m''occupe des clients et de la boutique. »

Il n''y a pas eu de fiche de poste. Karim garde une partie de son activité de carrossier « pour ne pas perdre la main » et parce que l''atelier a besoin de bras. Sa rémunération a augmenté de 180 euros brut par mois.

Depuis trois semaines, voici ce qui s''est passé.

Thierry a dit à Karim, devant Julien : « Tu vas pas commencer à me dire comment faire mon boulot, quand même. » Karim n''a rien répondu.

Sophie continue de donner directement les priorités aux carrossiers quand un client appelle, comme elle l''a toujours fait. Deux fois, Karim a découvert qu''un véhicule qu''il avait planifié pour le lendemain avait été commencé dans la journée.

Julien a rendu un véhicule avec une coulure de vernis sur l''aile arrière : c''est à lui, à l''atelier, de faire le lustrage et la vérification finale avant restitution, et il ne l''a pas vue. Le client de la flotte a fait une réclamation. Michel a réprimandé Julien vertement devant tout le monde, puis a dit à Karim : « C''est à toi de contrôler. »

Marc est venu voir Karim pour lui dire qu''il n''a jamais les infos à temps et qu''il « en a marre d''être la cinquième roue du carrosse ».

Lucas est arrivé en retard trois fois. Personne ne lui a rien dit.

Karim fait toujours ses huit heures de carrosserie et gère « le reste » entre deux voitures, souvent le soir. Il rentre chez lui fatigué et se demande s''il a bien fait d''accepter.

## Ce que dit Michel Garnier

« L''atelier est bon, on a des clients, le problème c''est l''organisation. Je veux qu''on tienne les délais annoncés aux assurances, qu''on arrête les reprises, et que je n''aie plus à intervenir tous les jours. Karim a six mois pour mettre ça en place. Je le soutiens. »

## Ce que nous allons faire avec ce cas

À chaque module, nous reprendrons l''atelier Garnier là où nous l''avons laissé :

- Module 1 : Karim clarifie son rôle, prend conscience de ses responsabilités et choisit comment se positionner face à Thierry, à Sophie et à Michel.
- Module 2 : il organise l''atelier (compétences, rôles, priorités, tableau de bord) et intègre les contraintes de poste de Fatou.
- Module 3 : il conduit ses premiers entretiens (Julien, Marc, Lucas) et met en place une réunion hebdomadaire.
- Module 4 : il travaille la motivation et la progression (Nadia, Julien, Lucas) et la charge de travail (la sienne y compris).
- Module 5 : il traite la tension avec Thierry et un désaccord entre Sophie et l''atelier.
- Module 6 : il fait le bilan des six mois, propose un changement d''organisation et l''accompagne.
- Module 7 : l''évaluation finale se déroule un an plus tard.

## Et si vous n''êtes pas dans l''automobile

Les situations de Karim existent partout : un vendeur devenu responsable de magasin, une infirmière devenue cadre de service, un développeur devenu chef d''équipe, une chargée de clientèle devenue responsable d''agence. Quand une leçon s''y prête, nous proposons une variante « commerce », « bureau » ou « service ». Et dans votre carnet de bord, c''est toujours votre situation qui compte.

## Pour votre carnet de bord

Avant de passer au module 1, notez trois choses :

- Qu''est-ce qui, dans la situation de Karim, ressemble à ce que vous vivez ou avez vu vivre ?
- Quelle est, selon vous, la première chose que Karim devrait faire ?
- Qu''auriez-vous fait à la place de Michel Garnier au moment de nommer Karim ?

Gardez ces réponses : vous les relirez au module 7.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 1 and l.ordre = 4;
  n := n + 1;

  -- 1.1-video-manager-leader-chef.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Module 1 — Comprendre le rôle du manager

Trois mots reviennent sans arrêt dès qu''on parle d''encadrement : chef, manager, leader. On les emploie souvent comme des synonymes. Ils ne le sont pas, et la différence n''est pas une question de vocabulaire : elle change ce que vous faites chaque jour.

## Le chef

Commençons par le plus ancien : le chef. Le chef, c''est une position. On est chef parce qu''on a été nommé, et l''on tire son autorité de cette nomination. Le chef donne des ordres et contrôle qu''ils sont exécutés.

Cette position existe toujours, et elle est nécessaire : dans une équipe, quelqu''un doit pouvoir trancher. Mais si votre seule ressource est « c''est moi le chef », vous obtiendrez au mieux de l''obéissance, jamais de l''engagement. Et vous le paierez le jour où vous aurez besoin que quelqu''un fasse un effort que vous n''avez pas demandé.

## Le manager

Le manager, c''est une fonction. Le mot nous vient de l''anglais, qui l''a lui-même tiré de l''italien maneggiare, « manier, conduire », et il désigne celui qui fait fonctionner une organisation.

En 1916, un ingénieur français, Henri Fayol, a été l''un des premiers à décrire ce que fait un manager. Il a identifié cinq activités : prévoir, organiser, commander, coordonner, contrôler. Plus d''un siècle après, la liste a été un peu reformulée, mais elle tient toujours.

Dans cette formation, nous retiendrons cinq fonctions : planifier, organiser, animer, contrôler, développer. Nous les détaillerons dans la leçon suivante.

En 1973, un chercheur canadien, Henry Mintzberg, a publié les résultats d''une démarche très simple et très rare : il avait suivi cinq dirigeants, une semaine chacun, en notant minute par minute ce qu''ils faisaient vraiment. Sa conclusion a surpris tout le monde. Le manager ne passe pas ses journées à planifier calmement dans son bureau. La moitié de ses activités durent moins de neuf minutes. Il gère des dizaines de sujets courts. Il passe l''essentiel de son temps à parler : écouter, informer, négocier, décider.

Mintzberg a décrit dix rôles, regroupés en trois familles. Les rôles de relations : représenter l''équipe, l''animer, faire le lien avec l''extérieur. Les rôles d''information : observer ce qui se passe, diffuser l''information à l''équipe, parler au nom de l''équipe vers la hiérarchie. Et les rôles de décision : lancer des améliorations, régler les problèmes, répartir les ressources, négocier.

Retenez l''idée principale : manager, c''est un métier de relations et d''information au moins autant qu''un métier de décision.

## Le leader

Et le leader, alors ? Le leader, ce n''est ni une position ni une fonction : c''est une influence. On est leader parce que les autres choisissent de vous suivre. Cette influence ne se décrète pas ; elle se construit, par ce que vous faites, ce que vous dites, et la cohérence entre les deux.

En 1990, un professeur de Harvard, John Kotter, a proposé une distinction qui fait toujours référence. Le management, dit-il, sert à gérer la complexité : planifier, budgéter, organiser, contrôler, pour que les choses se passent comme prévu. Le leadership sert à gérer le changement : donner une direction, mobiliser les gens, les motiver, pour que les choses se passent autrement qu''avant.

Le management fait fonctionner. Le leadership fait évoluer. Et la conclusion de Kotter est importante : une organisation a besoin des deux, et la plupart des entreprises ont, selon lui, trop de management et pas assez de leadership, pas l''inverse.

## Et vous ?

Alors, où vous situez-vous ?

Si vous venez d''être nommé, vous êtes chef : vous avez la position. C''est le point de départ, pas l''arrivée.

Votre travail, dès les premières semaines, c''est de devenir manager : prendre en main les cinq fonctions, tenir les dix rôles, faire fonctionner l''équipe. Ça s''apprend, et c''est l''objet de cette formation.

Et votre ambition, sur la durée, c''est de devenir leader : que votre équipe vous suive parce qu''elle vous fait confiance, pas parce qu''elle y est obligée.

## À l''atelier Garnier

Prenons Karim, à l''atelier Garnier. Il a été nommé chef d''atelier : il a la position. Mais il ne l''exerce pas encore comme manager : il n''a pas planifié, pas organisé, il subit les priorités que Sophie donne à sa place. Et son leadership est fragile : Thierry, le carrossier expérimenté, le lui a fait sentir devant Julien.

Que doit faire Karim ? Pas choisir entre les trois. Assumer la position, qui est la sienne. Prendre en main la fonction, méthodiquement. Et construire l''influence, jour après jour, en commençant par la cohérence : dire ce qu''il va faire, et le faire.

## Trois erreurs classiques

Terminons par trois erreurs de débutant, que vous reconnaîtrez peut-être.

Première erreur : rester expert. Continuer à faire le travail soi-même parce qu''on le fait mieux et plus vite. C''est la tentation de Karim, qui fait toujours ses huit heures de carrosserie. Le problème, c''est qu''on ne peut pas manager entre deux voitures.

Deuxième erreur : se réfugier dans la position. « C''est moi qui décide, point. » Ça marche une fois. Puis les gens se taisent, et vous perdez l''information dont vous avez besoin pour décider.

Troisième erreur : vouloir être aimé. Éviter tout ce qui pourrait déplaire : les retours difficiles, les arbitrages, les non. On se croit leader ; on est seulement absent.

Dans les prochaines leçons, nous allons entrer dans le détail : ce que fait vraiment un manager de proximité, les six styles de leadership, comment adapter votre style à chaque personne, et ce que vous engagez légalement en prenant ce poste.

À tout de suite.

## Sources
Fayol, *Administration industrielle et générale* (1916) ; Mintzberg, *The Nature of Managerial Work* (1973) et « The Manager''s Job: Folklore and Fact », *Harvard Business Review* (1975) ; Kotter, « What Leaders Really Do », *Harvard Business Review* (1990).
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Module 1 — Comprendre le rôle du manager

Trois mots reviennent sans arrêt dès qu''on parle d''encadrement : chef, manager, leader. On les emploie souvent comme des synonymes. Ils ne le sont pas, et la différence n''est pas une question de vocabulaire : elle change ce que vous faites chaque jour.

## Le chef

Commençons par le plus ancien : le chef. Le chef, c''est une position. On est chef parce qu''on a été nommé, et l''on tire son autorité de cette nomination. Le chef donne des ordres et contrôle qu''ils sont exécutés.

Cette position existe toujours, et elle est nécessaire : dans une équipe, quelqu''un doit pouvoir trancher. Mais si votre seule ressource est « c''est moi le chef », vous obtiendrez au mieux de l''obéissance, jamais de l''engagement. Et vous le paierez le jour où vous aurez besoin que quelqu''un fasse un effort que vous n''avez pas demandé.

## Le manager

Le manager, c''est une fonction. Le mot nous vient de l''anglais, qui l''a lui-même tiré de l''italien maneggiare, « manier, conduire », et il désigne celui qui fait fonctionner une organisation.

En 1916, un ingénieur français, Henri Fayol, a été l''un des premiers à décrire ce que fait un manager. Il a identifié cinq activités : prévoir, organiser, commander, coordonner, contrôler. Plus d''un siècle après, la liste a été un peu reformulée, mais elle tient toujours.

Dans cette formation, nous retiendrons cinq fonctions : planifier, organiser, animer, contrôler, développer. Nous les détaillerons dans la leçon suivante.

En 1973, un chercheur canadien, Henry Mintzberg, a publié les résultats d''une démarche très simple et très rare : il avait suivi cinq dirigeants, une semaine chacun, en notant minute par minute ce qu''ils faisaient vraiment. Sa conclusion a surpris tout le monde. Le manager ne passe pas ses journées à planifier calmement dans son bureau. La moitié de ses activités durent moins de neuf minutes. Il gère des dizaines de sujets courts. Il passe l''essentiel de son temps à parler : écouter, informer, négocier, décider.

Mintzberg a décrit dix rôles, regroupés en trois familles. Les rôles de relations : représenter l''équipe, l''animer, faire le lien avec l''extérieur. Les rôles d''information : observer ce qui se passe, diffuser l''information à l''équipe, parler au nom de l''équipe vers la hiérarchie. Et les rôles de décision : lancer des améliorations, régler les problèmes, répartir les ressources, négocier.

Retenez l''idée principale : manager, c''est un métier de relations et d''information au moins autant qu''un métier de décision.

## Le leader

Et le leader, alors ? Le leader, ce n''est ni une position ni une fonction : c''est une influence. On est leader parce que les autres choisissent de vous suivre. Cette influence ne se décrète pas ; elle se construit, par ce que vous faites, ce que vous dites, et la cohérence entre les deux.

En 1990, un professeur de Harvard, John Kotter, a proposé une distinction qui fait toujours référence. Le management, dit-il, sert à gérer la complexité : planifier, budgéter, organiser, contrôler, pour que les choses se passent comme prévu. Le leadership sert à gérer le changement : donner une direction, mobiliser les gens, les motiver, pour que les choses se passent autrement qu''avant.

Le management fait fonctionner. Le leadership fait évoluer. Et la conclusion de Kotter est importante : une organisation a besoin des deux, et la plupart des entreprises ont, selon lui, trop de management et pas assez de leadership, pas l''inverse.

## Et vous ?

Alors, où vous situez-vous ?

Si vous venez d''être nommé, vous êtes chef : vous avez la position. C''est le point de départ, pas l''arrivée.

Votre travail, dès les premières semaines, c''est de devenir manager : prendre en main les cinq fonctions, tenir les dix rôles, faire fonctionner l''équipe. Ça s''apprend, et c''est l''objet de cette formation.

Et votre ambition, sur la durée, c''est de devenir leader : que votre équipe vous suive parce qu''elle vous fait confiance, pas parce qu''elle y est obligée.

## À l''atelier Garnier

Prenons Karim, à l''atelier Garnier. Il a été nommé chef d''atelier : il a la position. Mais il ne l''exerce pas encore comme manager : il n''a pas planifié, pas organisé, il subit les priorités que Sophie donne à sa place. Et son leadership est fragile : Thierry, le carrossier expérimenté, le lui a fait sentir devant Julien.

Que doit faire Karim ? Pas choisir entre les trois. Assumer la position, qui est la sienne. Prendre en main la fonction, méthodiquement. Et construire l''influence, jour après jour, en commençant par la cohérence : dire ce qu''il va faire, et le faire.

## Trois erreurs classiques

Terminons par trois erreurs de débutant, que vous reconnaîtrez peut-être.

Première erreur : rester expert. Continuer à faire le travail soi-même parce qu''on le fait mieux et plus vite. C''est la tentation de Karim, qui fait toujours ses huit heures de carrosserie. Le problème, c''est qu''on ne peut pas manager entre deux voitures.

Deuxième erreur : se réfugier dans la position. « C''est moi qui décide, point. » Ça marche une fois. Puis les gens se taisent, et vous perdez l''information dont vous avez besoin pour décider.

Troisième erreur : vouloir être aimé. Éviter tout ce qui pourrait déplaire : les retours difficiles, les arbitrages, les non. On se croit leader ; on est seulement absent.

Dans les prochaines leçons, nous allons entrer dans le détail : ce que fait vraiment un manager de proximité, les six styles de leadership, comment adapter votre style à chaque personne, et ce que vous engagez légalement en prenant ce poste.

À tout de suite.

## Sources
Fayol, *Administration industrielle et générale* (1916) ; Mintzberg, *The Nature of Managerial Work* (1973) et « The Manager''s Job: Folklore and Fact », *Harvard Business Review* (1975) ; Kotter, « What Leaders Really Do », *Harvard Business Review* (1990).
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 2 and l.ordre = 1;
  n := n + 1;

  -- 1.10-quiz.json
  update public.lecons l set contenu = '{"questions": [{"id": "m1q01", "enonce": "Selon la distinction proposée par John Kotter (1990), à quoi sert le leadership, par opposition au management ?", "options": ["Donner une direction, mobiliser et motiver pour faire évoluer l''organisation", "Planifier, budgéter, organiser et contrôler pour que tout se passe comme prévu", "Représenter l''équipe auprès de la direction et des clients", "Organiser le travail et répartir les moyens entre les équipes"], "bonnes": [0], "explication": "Pour Kotter, le management gère la complexité (faire fonctionner) et le leadership gère le changement (faire évoluer). Une organisation a besoin des deux."}, {"id": "m1q02", "enonce": "Henry Mintzberg a observé des dirigeants au travail. Quelle conclusion tire-t-il de ses observations ?", "options": ["Ils passent l''essentiel de la journée à planifier, au calme, dans leur bureau", "Ils travaillent sur peu de sujets à la fois et sont rarement interrompus", "Ils délèguent la plupart des décisions et communiquent surtout par écrit", "Ils parlent la majeure partie du temps, sur beaucoup de sujets courts"], "bonnes": [3], "explication": "Chez les cinq dirigeants observés par Mintzberg, 78 % du temps passait en communication orale et la moitié des activités duraient moins de neuf minutes : un travail fragmenté, fait d''échanges."}, {"id": "m1q03", "enonce": "Parmi les cinq fonctions du manager, laquelle est le plus souvent négligée parce que ses résultats ne se voient qu''à long terme ?", "options": ["Développer", "Planifier", "Animer", "Contrôler"], "bonnes": [0], "explication": "Développer les personnes et l''équipe est la première fonction sacrifiée quand le temps manque : il faut la protéger en la mettant à l''agenda."}, {"id": "m1q04", "enonce": "Un nouveau manager continue à assurer une production personnelle à temps plein et gère l''équipe « entre deux tâches ». Dans quel piège tombe-t-il ?", "options": ["Tout changer tout de suite", "Rester dans la production", "Ne rien changer du tout", "Faire seul"], "bonnes": [1], "explication": "C''est le piège de l''expert promu : il n''a pas de temps pour manager. Le temps de management doit être négocié et protégé."}, {"id": "m1q05", "enonce": "D''après l''étude reprise par Daniel Goleman (2000), quels styles de leadership dégradent le climat de l''équipe lorsqu''ils sont utilisés régulièrement ? (plusieurs réponses)", "options": ["Visionnaire", "Directif", "Coach", "Chef de file"], "bonnes": [1, 3], "explication": "Directif et chef de file sont utiles ponctuellement (crise, équipe d''experts très motivés) mais toxiques en usage courant. Visionnaire, participatif, coach et collaboratif ont un effet positif."}, {"id": "m1q06", "enonce": "Quel style de leadership consiste à donner une direction claire et un sens (« venez avec moi ») en laissant la liberté des moyens ?", "options": ["Participatif", "Collaboratif", "Visionnaire", "Directif"], "bonnes": [2], "explication": "Le style visionnaire est, selon l''étude, celui qui a l''effet le plus positif sur le climat dans la plupart des situations."}, {"id": "m1q07", "enonce": "Dans le leadership situationnel (Hersey & Blanchard), un collaborateur compétent sur une tâche mais qui hésite à prendre l''initiative relève de quel style ?", "options": ["Déléguer (peu de direction, peu de soutien)", "Diriger (beaucoup de direction, peu de soutien)", "Entraîner (beaucoup de direction, beaucoup de soutien)", "Épauler (peu de direction, beaucoup de soutien)"], "bonnes": [3], "explication": "Compétence forte et engagement variable = niveau A3 : on n''explique plus comment faire, on écoute, on rassure, on consulte."}, {"id": "m1q08", "enonce": "Quelle affirmation sur le niveau d''autonomie est exacte ?", "options": ["Il est une caractéristique stable de la personne", "Il dépend de la tâche et évolue avec le temps", "Chez un expert, il est le même pour toutes les tâches", "Il se déduit surtout de l''ancienneté dans le poste"], "bonnes": [1], "explication": "On manage une personne sur une tâche donnée. Un excellent carrossier peut être débutant sur un logiciel de devis. Le style doit évoluer avec le niveau."}, {"id": "m1q09", "enonce": "Un ancien collègue conteste votre légitimité par des remarques devant l''équipe. Quelle est la réaction la plus appropriée ?", "options": ["Le recevoir seul à seul, reconnaître son expérience et poser la règle : les désaccords se disent en privé", "Le recadrer devant l''équipe, pour que chacun voie bien qui décide désormais", "Laisser passer quelques mois sans rien dire : ce genre de remarques s''éteint en général tout seul", "Demander à la direction de lui adresser un avertissement écrit"], "bonnes": [0], "explication": "Ni affrontement ni évitement : un entretien individuel qui reconnaît la place de la personne et pose la règle. Les contestations non traitées s''installent."}, {"id": "m1q10", "enonce": "Concernant l''obligation de sécurité (Code du travail, L4121-1), quelle affirmation est exacte ?", "options": ["Elle ne concerne que les risques physiques (accidents, machines, port de charges), pas la santé mentale", "Elle pèse surtout sur le salarié, premier responsable de sa propre sécurité", "Elle pèse sur l''employeur et couvre la santé physique et mentale ; le manager la met en œuvre", "Elle ne s''applique qu''aux entreprises d''au moins 50 salariés dotées d''un CSE"], "bonnes": [2], "explication": "L''employeur doit prendre les mesures nécessaires pour protéger la santé physique et mentale des travailleurs. Le manager en est le relais au quotidien ; sa responsabilité pénale personnelle peut être engagée, en particulier s''il a reçu une délégation de pouvoirs."}, {"id": "m1q11", "enonce": "Un salarié vous signale des faits qui pourraient constituer du harcèlement de la part d''un collègue. Que devez-vous faire ?", "options": ["Mener vous-même une enquête discrète avant d''en parler à qui que ce soit", "Attendre d''avoir des preuves solides pour ne pas accuser quelqu''un à tort", "Réunir les deux personnes pour qu''elles s''expliquent en votre présence", "Prendre le signalement au sérieux et le transmettre sans délai, par écrit, à la hiérarchie ou aux RH"], "bonnes": [3], "explication": "L''employeur doit réagir dès qu''il est informé. Le manager ne minimise pas, n''enquête pas seul, n''organise pas de confrontation et transmet immédiatement ; l''inaction engage la responsabilité de l''entreprise et peut lui être reprochée."}, {"id": "m1q12", "enonce": "Votre direction vous demande de livrer huit véhicules pour vendredi, ce qui est irréaliste avec l''équipe actuelle. Quelle réponse correspond à la méthode vue dans le module ?", "options": ["« D''accord, on va y arriver », puis livrer avec deux jours de retard", "« C''est possible si nous décalons les deux particuliers ; sinon, il faut deux jours d''intérim. Que préférez-vous ? »", "« C''est impossible avec l''équipe actuelle », sans rien proposer d''autre", "Transmettre la demande telle quelle à l''équipe en précisant que la direction l''exige"], "bonnes": [1], "explication": "« Oui, à ces conditions » : rendre visibles les conséquences et laisser la décision à qui elle appartient, plutôt qu''un oui intenable ou un non sans argument."}, {"id": "m1q13", "enonce": "Selon la leçon sur les cinq fonctions du manager, quelle est la différence entre planifier et remplir un planning ?", "options": ["Le planning est le résultat ; la planification est le raisonnement qui le produit", "Aucune : ce sont deux mots pour la même chose", "Planifier revient à la direction ; remplir le planning de la semaine revient au manager", "Remplir un planning demande plus de réflexion que planifier"], "bonnes": [0], "explication": "Planifier, c''est transformer ce qu''on attend de l''équipe en objectifs et en calendrier. Le planning n''en est que la trace."}, {"id": "m1q14", "enonce": "D''après la leçon 1.2, une grande partie des « problèmes de personnes » rencontrés par les managers sont en réalité…", "options": ["des problèmes de caractère ou de personnalité, sur lesquels le manager n''a aucune prise", "des problèmes de rémunération, qui relèvent de la seule direction", "des problèmes d''organisation : rôles flous, doublons, personne responsable de rien", "des écarts de génération entre les anciens et les jeunes salariés"], "bonnes": [2], "explication": "Avant de conclure à un problème de personne, le manager vérifie l''organisation : qui fait quoi, qui décide, qui est responsable."}, {"id": "m1q15", "enonce": "Quel style de leadership (Goleman) consiste à dire « Essayez ceci » et vise le développement de la personne à long terme, quitte à accepter des résultats moins rapides ?", "options": ["Le style directif", "Le style chef de file", "Le style collaboratif", "Le style coach"], "bonnes": [3], "explication": "Le style coach investit dans la progression des personnes. Il demande du temps et une personne volontaire ; il est sous-utilisé par les managers pressés."}, {"id": "m1q16", "enonce": "Un apprenti motivé mais qui ne maîtrise pas encore une tâche. Dans le leadership situationnel, quel style convient ?", "options": ["Déléguer : il est motivé, il apprendra en faisant", "Diriger : consignes précises, démonstration, contrôle rapproché", "Épauler : l''écouter et le laisser choisir sa méthode", "Entraîner : surtout le rassurer pour relancer une motivation en baisse"], "bonnes": [1], "explication": "Faible compétence et forte motivation appellent le style « diriger ». Ce n''est pas de la méfiance : c''est ce dont un débutant a besoin pour réussir vite."}, {"id": "m1q17", "enonce": "D''après l''article L3132-2 du Code du travail, de combien d''heures consécutives de repos un salarié doit-il disposer chaque semaine, repos quotidien compris (sauf dérogation) ?", "options": ["11 heures", "24 heures", "35 heures", "48 heures"], "bonnes": [2], "explication": "Le repos hebdomadaire est de 24 heures consécutives, auxquelles s''ajoutent les 11 heures de repos quotidien : 35 heures consécutives au total, sauf dérogation. Le manager qui organise les plannings doit connaître ces limites."}, {"id": "m1q18", "enonce": "Lucas arrive en retard pour la quatrième fois malgré un recadrage. Sauf délégation expresse, que fait Karim, manager de proximité ?", "options": ["Il recadre, trace les faits (dates, propos tenus) et alerte Michel, seul à pouvoir sanctionner", "Il lui adresse lui-même un avertissement écrit, puisque c''est lui qui organise l''atelier", "Il retient une heure sur son salaire pour chaque retard constaté", "Il laisse passer : Lucas est apprenti, ça s''arrangera avec l''âge"], "bonnes": [0], "explication": "La sanction relève de l''employeur et d''une procédure (L1331-1 et suivants, L1332-1 et suivants). Le manager agit en amont : recadrer, tracer, alerter. Les sanctions pécuniaires sont interdites (L1331-2)."}, {"id": "m1q19", "enonce": "Fatou a une restriction médicale de port de charge. Que dit Karim à l''équipe ?", "options": ["« Fatou a un problème de dos, elle ne porte plus rien de lourd »", "« Fatou ne porte pas les pare-chocs, c''est organisé comme ça »", "Il explique la RQTH de Fatou à l''équipe pour éviter les jalousies", "Rien : il laisse Fatou s''arranger avec ses collègues"], "bonnes": [1], "explication": "Une information de santé ne se diffuse pas, même « pour expliquer ». Le manager organise le travail et énonce la règle, sans en donner le motif médical."}, {"id": "m1q20", "enonce": "Plusieurs réponses. Dans le podcast « De collègue à manager », quelles sont les deux erreurs classiques décrites lors d''une promotion interne ?", "options": ["Ne rien changer : déjeuner avec les mêmes, plaisanter sur le chef comme avant", "S''entretenir individuellement avec chaque membre de l''équipe", "Surcorriger : manger seul dans son bureau, vouvoyer tout le monde", "Demander un point régulier à son directeur"], "bonnes": [0, 2], "explication": "La distance juste se trouve entre les deux excès : ni copain comme avant, ni chef inaccessible. Elle se construit par des actes cohérents, pas par une posture."}], "seuil": 70, "tentatives_max": 3, "corrections": true, "consigne": "20 questions. Une seule bonne réponse par question, sauf mention « plusieurs réponses ». Seuil de réussite : 70 %."}'::jsonb, publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 2 and l.ordre = 10;
  n := n + 1;

  -- 1.2-ce-que-fait-un-manager.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Dans la vidéo précédente, nous avons distingué chef, manager et leader. Cette leçon décrit concrètement le travail du manager de proximité, c''est-à-dire celui qui encadre directement une équipe d''exécutants ou de techniciens : chef d''équipe, chef d''atelier, responsable de magasin, responsable de service, chef de projet opérationnel. C''est le premier niveau d''encadrement, et c''est celui qui a le plus d''impact sur le quotidien des salariés.

## Les cinq fonctions du manager

Henri Fayol, en 1916, décrivait cinq activités : prévoir, organiser, commander, coordonner, contrôler. Nous les reformulons ainsi pour un manager de proximité d''aujourd''hui.

## 1. Planifier

Planifier, c''est transformer ce qu''on attend de l''équipe en objectifs et en calendrier. Cela suppose de connaître les attentes de la hiérarchie et des clients, de les traduire en objectifs pour l''équipe, d''anticiper la charge (qui fait quoi, quand) et de prévoir les moyens nécessaires.

Ce qu''il ne faut pas confondre : planifier n''est pas remplir un planning. Le planning est le résultat ; la planification est le raisonnement qui l''a produit.

## 2. Organiser

Organiser, c''est mettre en place les conditions pour que le travail puisse se faire : répartir les rôles et les missions, définir les règles de fonctionnement (horaires, priorités, circuits d''information), s''assurer que chacun a les compétences, les outils et l''information nécessaires.

Une grande partie des « problèmes de personnes » que rencontrent les managers sont en réalité des problèmes d''organisation : rôles flous, doublons, personne responsable de rien.

## 3. Animer

Animer, c''est faire vivre l''équipe au quotidien : donner le sens, communiquer, écouter, motiver, réguler les tensions, reconnaître le travail. C''est la fonction la plus visible et celle qui prend le plus de temps.

Mintzberg l''a mesuré chez les cinq dirigeants qu''il a observés : 78 % de leur temps passait en communication orale (réunions, téléphone, échanges impromptus). Au niveau du terrain, le rythme est encore plus haché : une étude américaine sur 56 contremaîtres, qu''il cite, comptait en moyenne 583 activités par journée de huit heures, soit une toutes les 48 secondes. Si vous avez l''impression de passer vos journées à parler et à être interrompu, rassurez-vous : c''est le travail.

## 4. Contrôler

Contrôler, c''est vérifier que ce qui devait être fait a été fait, au niveau de qualité attendu, et agir sur les écarts. Le mot a mauvaise presse, mais la fonction est indispensable : une équipe qu''on ne contrôle pas est une équipe qu''on abandonne. Le contrôle donne aussi de la reconnaissance : on ne peut pas féliciter un travail qu''on n''a pas regardé.

La question n''est pas de contrôler ou non, mais comment : sur quoi, à quelle fréquence, avec quelle transparence. Nous y reviendrons au module 2 avec le tableau de bord.

## 5. Développer

Développer, c''est faire progresser les personnes et l''équipe : repérer les potentiels, former, déléguer pour faire grandir, préparer l''avenir. C''est la fonction la plus souvent négligée, parce que ses résultats se voient à long terme. Deux ou trois ans plus tard, c''est pourtant elle qui fait la différence entre une équipe qui tient debout quand son manager est absent et une équipe qui dépend de lui pour tout.

## Comment se répartit le temps

Aucune étude ne fixe de répartition idéale. Les chiffres ci-dessous sont un repère de terrain, couramment utilisé en formation, pour un manager de proximité qui encadre cinq à quinze personnes ; à ajuster selon votre secteur et la part de production que vous gardez :

- Animer : 40 à 50 % (échanges, réunions, présence terrain, régulation)
- Planifier et organiser : 20 à 25 %
- Contrôler : 15 à 20 %
- Développer : 10 à 15 %

Deux points de vigilance.

Premier point : ce temps de management doit exister. Un manager qui conserve une activité opérationnelle à temps plein ne manage pas ; il fait des heures supplémentaires. C''est la situation de Karim, qui gère « le reste » entre deux voitures et le soir. Si vous encadrez une équipe tout en gardant une production personnelle, négociez explicitement la part de votre temps consacrée au management. Pour une équipe de neuf personnes comme celle de l''atelier Garnier, consacrer au moins la moitié de son temps au management nous paraît un minimum réaliste.

Second point : la fonction « développer » est la première sacrifiée quand le temps manque. Protégez-la en la mettant à l''agenda, par exemple un entretien de progression par personne et par trimestre.

## Les pièges de la première prise de poste

Linda Hill, professeure à la Harvard Business School, a suivi dix-neuf managers pendant leur première année dans le poste. Son livre, *Becoming a Manager*, et l''article qu''elle en a tiré en 2007 décrivent ce qu''ils découvrent, souvent à leurs dépens.

Les nouveaux managers imaginent d''abord que le poste leur donne du pouvoir. Ils découvrent surtout des dépendances : envers leur équipe, leur propre hiérarchie, les autres services, les clients. Plusieurs disent se sentir moins libres qu''avant.

Ils pensent ensuite que leur autorité vient du titre. Elle se gagne en réalité auprès de chacun, par la crédibilité : la fiabilité, la compétence (y compris managériale) et la capacité à obtenir des résultats. Un ordre obtenu par la seule position produit de l''obéissance, rarement de l''engagement.

Enfin, beaucoup se concentrent sur la relation avec chaque personne, une par une. Ils comprennent avec le temps que chaque décision individuelle est observée par tout le groupe, et que leur travail consiste aussi à construire une équipe qui fonctionne quand ils ne sont pas là.

On peut en tirer quatre pièges fréquents.

**Piège 1 : rester dans la production.** Le nouveau manager continue à faire le travail lui-même, parce qu''il le fait bien, parce que ça le rassure, parce que l''équipe manque de bras. Résultat : il n''a pas le temps de manager, et l''équipe ne progresse pas.

**Piège 2 : tout changer tout de suite.** Pour marquer son territoire, le nouveau manager réorganise dès la première semaine. Il ne connaît pas encore les raisons de l''organisation existante, et il se met l''équipe à dos. Prenez le temps d''observer : les 90 premiers jours servent à comprendre, pas à bouleverser.

**Piège 3 : ne rien changer du tout.** À l''inverse, par peur de déplaire, le nouveau manager laisse tout en l''état, y compris ce qui dysfonctionne. L''équipe conclut que rien ne changera, et les problèmes s''installent. C''est le cas de Karim avec les retards de Lucas : personne ne dit rien.

**Piège 4 : faire seul.** Le nouveau manager ne demande pas d''aide, ni à sa hiérarchie ni à ses pairs, parce qu''il pense qu''on l''a nommé pour se débrouiller. Or son propre manager a une responsabilité dans sa réussite. Demander un point hebdomadaire de 30 minutes avec sa hiérarchie pendant les trois premiers mois relève de l''organisation, pas d''un aveu de faiblesse.

## Le cas Garnier

Reprenons les cinq fonctions et regardons où en est Karim après trois semaines.

Planifier : il planifie les véhicules du lendemain, mais Sophie bouleverse le planning en donnant directement des priorités. La planification existe mais elle n''est pas respectée, parce que le circuit de décision n''a pas été clarifié.

Organiser : rien n''a été formalisé. Pas de fiche de poste pour Karim, pas de règle sur qui fixe les priorités, pas de circuit d''information vers Marc, le mécanicien.

Animer : Karim est présent à l''atelier, mais en tant que carrossier. Il n''a pas tenu de réunion d''équipe, n''a pas répondu à Thierry, n''a pas parlé à Lucas.

Contrôler : le contrôle qualité avant restitution n''existe pas (la coulure de vernis de Julien est arrivée jusqu''au client). Michel a dit « c''est à toi de contrôler » sans que l''on sache comment.

Développer : rien pour l''instant, ce qui est normal à trois semaines.

Karim a donc la position, pas encore la fonction. Sa priorité n''est ni de faire encore mieux de la carrosserie, ni de « recadrer Thierry ». Il doit d''abord clarifier son rôle avec Michel (temps consacré au management, périmètre de décision, circuit des priorités), puis organiser.

Nous verrons à la fin de ce module, dans la fiche outil « feuille de route des 90 premiers jours », comment structurer cette prise de poste.

## Variante commerce

Remplacez l''atelier par un magasin de huit vendeurs, et Karim par Inès, meilleure vendeuse promue responsable adjointe. Elle continue de faire ses ventes (sa prime en dépend), la directrice régionale donne des consignes directement aux vendeurs par téléphone, et un vendeur senior lui a lancé : « Tu vas pas m''apprendre à vendre. » Les fonctions, les pièges et le diagnostic sont exactement les mêmes.

## À retenir

- Cinq fonctions : planifier, organiser, animer, contrôler, développer.
- Animer (échanger, écouter, réguler) occupe une grande partie du temps : c''est normal.
- Le temps de management doit être négocié et protégé, surtout si vous gardez une activité de production.
- Quatre pièges : rester dans la production, tout changer, ne rien changer, faire seul.
- Votre crédibilité se gagne par la fiabilité et les résultats de l''équipe, plus que par le titre ou l''expertise technique.

## Sources

- Henri Fayol, « Administration industrielle et générale », *Bulletin de la Société de l''industrie minérale*, 1916 ; rééd. en volume, Dunod.
- Henry Mintzberg, *The Nature of Managerial Work*, Harper & Row, 1973 ; « The Manager''s Job: Folklore and Fact », *Harvard Business Review*, juillet-août 1975 ; *Manager : ce que font vraiment les managers*, Vuibert, 2011.
- Linda A. Hill, *Becoming a Manager: How New Managers Master the Challenges of Leadership*, Harvard Business School Press, 2e éd., 2003 ; « Becoming the Boss », *Harvard Business Review*, janvier 2007.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Dans la vidéo précédente, nous avons distingué chef, manager et leader. Cette leçon décrit concrètement le travail du manager de proximité, c''est-à-dire celui qui encadre directement une équipe d''exécutants ou de techniciens : chef d''équipe, chef d''atelier, responsable de magasin, responsable de service, chef de projet opérationnel. C''est le premier niveau d''encadrement, et c''est celui qui a le plus d''impact sur le quotidien des salariés.

## Les cinq fonctions du manager

Henri Fayol, en 1916, décrivait cinq activités : prévoir, organiser, commander, coordonner, contrôler. Nous les reformulons ainsi pour un manager de proximité d''aujourd''hui.

## 1. Planifier

Planifier, c''est transformer ce qu''on attend de l''équipe en objectifs et en calendrier. Cela suppose de connaître les attentes de la hiérarchie et des clients, de les traduire en objectifs pour l''équipe, d''anticiper la charge (qui fait quoi, quand) et de prévoir les moyens nécessaires.

Ce qu''il ne faut pas confondre : planifier n''est pas remplir un planning. Le planning est le résultat ; la planification est le raisonnement qui l''a produit.

## 2. Organiser

Organiser, c''est mettre en place les conditions pour que le travail puisse se faire : répartir les rôles et les missions, définir les règles de fonctionnement (horaires, priorités, circuits d''information), s''assurer que chacun a les compétences, les outils et l''information nécessaires.

Une grande partie des « problèmes de personnes » que rencontrent les managers sont en réalité des problèmes d''organisation : rôles flous, doublons, personne responsable de rien.

## 3. Animer

Animer, c''est faire vivre l''équipe au quotidien : donner le sens, communiquer, écouter, motiver, réguler les tensions, reconnaître le travail. C''est la fonction la plus visible et celle qui prend le plus de temps.

Mintzberg l''a mesuré chez les cinq dirigeants qu''il a observés : 78 % de leur temps passait en communication orale (réunions, téléphone, échanges impromptus). Au niveau du terrain, le rythme est encore plus haché : une étude américaine sur 56 contremaîtres, qu''il cite, comptait en moyenne 583 activités par journée de huit heures, soit une toutes les 48 secondes. Si vous avez l''impression de passer vos journées à parler et à être interrompu, rassurez-vous : c''est le travail.

## 4. Contrôler

Contrôler, c''est vérifier que ce qui devait être fait a été fait, au niveau de qualité attendu, et agir sur les écarts. Le mot a mauvaise presse, mais la fonction est indispensable : une équipe qu''on ne contrôle pas est une équipe qu''on abandonne. Le contrôle donne aussi de la reconnaissance : on ne peut pas féliciter un travail qu''on n''a pas regardé.

La question n''est pas de contrôler ou non, mais comment : sur quoi, à quelle fréquence, avec quelle transparence. Nous y reviendrons au module 2 avec le tableau de bord.

## 5. Développer

Développer, c''est faire progresser les personnes et l''équipe : repérer les potentiels, former, déléguer pour faire grandir, préparer l''avenir. C''est la fonction la plus souvent négligée, parce que ses résultats se voient à long terme. Deux ou trois ans plus tard, c''est pourtant elle qui fait la différence entre une équipe qui tient debout quand son manager est absent et une équipe qui dépend de lui pour tout.

## Comment se répartit le temps

Aucune étude ne fixe de répartition idéale. Les chiffres ci-dessous sont un repère de terrain, couramment utilisé en formation, pour un manager de proximité qui encadre cinq à quinze personnes ; à ajuster selon votre secteur et la part de production que vous gardez :

- Animer : 40 à 50 % (échanges, réunions, présence terrain, régulation)
- Planifier et organiser : 20 à 25 %
- Contrôler : 15 à 20 %
- Développer : 10 à 15 %

Deux points de vigilance.

Premier point : ce temps de management doit exister. Un manager qui conserve une activité opérationnelle à temps plein ne manage pas ; il fait des heures supplémentaires. C''est la situation de Karim, qui gère « le reste » entre deux voitures et le soir. Si vous encadrez une équipe tout en gardant une production personnelle, négociez explicitement la part de votre temps consacrée au management. Pour une équipe de neuf personnes comme celle de l''atelier Garnier, consacrer au moins la moitié de son temps au management nous paraît un minimum réaliste.

Second point : la fonction « développer » est la première sacrifiée quand le temps manque. Protégez-la en la mettant à l''agenda, par exemple un entretien de progression par personne et par trimestre.

## Les pièges de la première prise de poste

Linda Hill, professeure à la Harvard Business School, a suivi dix-neuf managers pendant leur première année dans le poste. Son livre, *Becoming a Manager*, et l''article qu''elle en a tiré en 2007 décrivent ce qu''ils découvrent, souvent à leurs dépens.

Les nouveaux managers imaginent d''abord que le poste leur donne du pouvoir. Ils découvrent surtout des dépendances : envers leur équipe, leur propre hiérarchie, les autres services, les clients. Plusieurs disent se sentir moins libres qu''avant.

Ils pensent ensuite que leur autorité vient du titre. Elle se gagne en réalité auprès de chacun, par la crédibilité : la fiabilité, la compétence (y compris managériale) et la capacité à obtenir des résultats. Un ordre obtenu par la seule position produit de l''obéissance, rarement de l''engagement.

Enfin, beaucoup se concentrent sur la relation avec chaque personne, une par une. Ils comprennent avec le temps que chaque décision individuelle est observée par tout le groupe, et que leur travail consiste aussi à construire une équipe qui fonctionne quand ils ne sont pas là.

On peut en tirer quatre pièges fréquents.

**Piège 1 : rester dans la production.** Le nouveau manager continue à faire le travail lui-même, parce qu''il le fait bien, parce que ça le rassure, parce que l''équipe manque de bras. Résultat : il n''a pas le temps de manager, et l''équipe ne progresse pas.

**Piège 2 : tout changer tout de suite.** Pour marquer son territoire, le nouveau manager réorganise dès la première semaine. Il ne connaît pas encore les raisons de l''organisation existante, et il se met l''équipe à dos. Prenez le temps d''observer : les 90 premiers jours servent à comprendre, pas à bouleverser.

**Piège 3 : ne rien changer du tout.** À l''inverse, par peur de déplaire, le nouveau manager laisse tout en l''état, y compris ce qui dysfonctionne. L''équipe conclut que rien ne changera, et les problèmes s''installent. C''est le cas de Karim avec les retards de Lucas : personne ne dit rien.

**Piège 4 : faire seul.** Le nouveau manager ne demande pas d''aide, ni à sa hiérarchie ni à ses pairs, parce qu''il pense qu''on l''a nommé pour se débrouiller. Or son propre manager a une responsabilité dans sa réussite. Demander un point hebdomadaire de 30 minutes avec sa hiérarchie pendant les trois premiers mois relève de l''organisation, pas d''un aveu de faiblesse.

## Le cas Garnier

Reprenons les cinq fonctions et regardons où en est Karim après trois semaines.

Planifier : il planifie les véhicules du lendemain, mais Sophie bouleverse le planning en donnant directement des priorités. La planification existe mais elle n''est pas respectée, parce que le circuit de décision n''a pas été clarifié.

Organiser : rien n''a été formalisé. Pas de fiche de poste pour Karim, pas de règle sur qui fixe les priorités, pas de circuit d''information vers Marc, le mécanicien.

Animer : Karim est présent à l''atelier, mais en tant que carrossier. Il n''a pas tenu de réunion d''équipe, n''a pas répondu à Thierry, n''a pas parlé à Lucas.

Contrôler : le contrôle qualité avant restitution n''existe pas (la coulure de vernis de Julien est arrivée jusqu''au client). Michel a dit « c''est à toi de contrôler » sans que l''on sache comment.

Développer : rien pour l''instant, ce qui est normal à trois semaines.

Karim a donc la position, pas encore la fonction. Sa priorité n''est ni de faire encore mieux de la carrosserie, ni de « recadrer Thierry ». Il doit d''abord clarifier son rôle avec Michel (temps consacré au management, périmètre de décision, circuit des priorités), puis organiser.

Nous verrons à la fin de ce module, dans la fiche outil « feuille de route des 90 premiers jours », comment structurer cette prise de poste.

## Variante commerce

Remplacez l''atelier par un magasin de huit vendeurs, et Karim par Inès, meilleure vendeuse promue responsable adjointe. Elle continue de faire ses ventes (sa prime en dépend), la directrice régionale donne des consignes directement aux vendeurs par téléphone, et un vendeur senior lui a lancé : « Tu vas pas m''apprendre à vendre. » Les fonctions, les pièges et le diagnostic sont exactement les mêmes.

## À retenir

- Cinq fonctions : planifier, organiser, animer, contrôler, développer.
- Animer (échanger, écouter, réguler) occupe une grande partie du temps : c''est normal.
- Le temps de management doit être négocié et protégé, surtout si vous gardez une activité de production.
- Quatre pièges : rester dans la production, tout changer, ne rien changer, faire seul.
- Votre crédibilité se gagne par la fiabilité et les résultats de l''équipe, plus que par le titre ou l''expertise technique.

## Sources

- Henri Fayol, « Administration industrielle et générale », *Bulletin de la Société de l''industrie minérale*, 1916 ; rééd. en volume, Dunod.
- Henry Mintzberg, *The Nature of Managerial Work*, Harper & Row, 1973 ; « The Manager''s Job: Folklore and Fact », *Harvard Business Review*, juillet-août 1975 ; *Manager : ce que font vraiment les managers*, Vuibert, 2011.
- Linda A. Hill, *Becoming a Manager: How New Managers Master the Challenges of Leadership*, Harvard Business School Press, 2e éd., 2003 ; « Becoming the Boss », *Harvard Business Review*, janvier 2007.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 2 and l.ordre = 2;
  n := n + 1;

  -- 1.3-six-styles-de-leadership.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'En 2000, le psychologue Daniel Goleman a publié dans la *Harvard Business Review* un article devenu une référence : « Leadership That Gets Results ». Il s''appuyait sur une étude du cabinet de conseil Hay/McBer portant sur 3 871 cadres dirigeants, tirés d''une base de plus de 20 000. Elle cherchait à savoir quels comportements de leadership produisent des résultats, et dans quelles conditions.

Sa conclusion : il n''y a pas un bon style de leadership. L''étude en distingue six, et les managers les plus efficaces passent de l''un à l''autre selon la situation. Les voici, avec la formule qui résume chacun d''eux.

## 1. Le style directif (« Faites ce que je dis »)

Le manager décide seul et attend l''exécution immédiate. Il contrôle étroitement et sanctionne les écarts.

Quand il est efficace : en situation de crise (accident, urgence client, sécurité), avec un collaborateur en difficulté grave, ou pour arrêter une dérive nette.

Son effet à long terme : c''est, dans l''étude, le style qui dégrade le plus le climat de l''équipe. Utilisé au quotidien, il étouffe l''initiative ; les gens cessent de signaler les problèmes et se contentent d''exécuter.

## 2. Le style chef de file (« Faites comme moi, tout de suite »)

Le manager fixe des standards très élevés, montre l''exemple et attend que chacun suive. Il remplace ceux qui ne suivent pas plutôt que de les aider.

Quand il est efficace : avec une équipe très compétente et très motivée, qui a besoin de peu d''encadrement (des experts, des commerciaux confirmés).

Son effet à long terme : les collaborateurs se sentent dépassés, ne comprennent pas ce qu''on attend d''eux, et le climat se dégrade. C''est le style naturel de beaucoup d''experts promus managers, comme Karim ou Inès : « je fais mieux, donc je montre ». Il est rarement efficace avec une équipe hétérogène.

## 3. Le style visionnaire (« Venez avec moi »)

Le manager donne une direction claire et un sens : voici où nous allons et pourquoi. Il laisse à chacun la liberté des moyens.

Quand il est efficace : presque toujours, et particulièrement lorsqu''une équipe a besoin d''une nouvelle direction (nouveau manager, réorganisation, changement de stratégie).

Son effet à long terme : c''est, selon l''étude, le style qui a l''impact le plus positif sur le climat. Il fonctionne mal, en revanche, face à une équipe d''experts plus expérimentés que le manager, qui peuvent trouver ses grands discours prétentieux.

## 4. Le style participatif (« Qu''en pensez-vous ? »)

Le manager consulte l''équipe, cherche le consensus, fait participer aux décisions.

Quand il est efficace : quand le manager a besoin des idées de l''équipe, quand l''adhésion compte plus que la vitesse, ou quand il ne sait pas lui-même quelle est la bonne solution.

Son effet à long terme : positif sur le climat, mais avec un risque : réunions sans fin, décisions qui ne se prennent pas. Inefficace en crise, et avec des collaborateurs qui n''ont pas les compétences pour contribuer.

## 5. Le style coach (« Essayez ceci »)

Le manager se concentre sur le développement de la personne : il aide chacun à identifier ses forces, ses faiblesses et ses objectifs professionnels, il délègue des missions qui font grandir, il accepte l''échec à court terme au profit de l''apprentissage.

Quand il est efficace : avec des collaborateurs qui veulent progresser et qui sont conscients de leurs points faibles.

Son effet à long terme : très positif sur le climat. Son défaut : c''est le style le moins utilisé, parce qu''il demande du temps et que ses résultats ne sont pas immédiats. Il ne fonctionne pas avec un collaborateur qui refuse de changer.

## 6. Le style collaboratif (« Les gens d''abord »)

Le manager privilégie l''harmonie et les relations. Il évite les conflits, valorise, crée du lien.

Quand il est efficace : pour ressouder une équipe après une période difficile, restaurer la confiance, motiver dans un contexte pénible.

Son effet à long terme : positif sur le climat, mais s''il est utilisé seul, la médiocrité s''installe : personne ne reçoit de retour correctif, et les bons collaborateurs ont l''impression que l''effort n''est pas reconnu.

## Ce que montre l''étude

On retient généralement deux résultats.

D''abord, quatre styles ont un effet positif sur le climat de l''équipe (visionnaire, participatif, coach, collaboratif) et deux un effet négatif quand ils sont utilisés régulièrement (directif, chef de file). Or, selon l''étude, le climat expliquerait près d''un tiers des résultats.

Ensuite, les managers qui obtiennent les meilleurs résultats maîtrisent au moins quatre styles, en particulier le visionnaire, le participatif, le coach et le collaboratif, et ils passent de l''un à l''autre avec souplesse selon la situation, parfois dans la même journée.

Goleman compare les styles aux clubs d''un golfeur : le bon joueur choisit le club selon le coup à jouer. Un manager qui n''a qu''un style ressemble à un golfeur qui jouerait tout le parcours avec le même club.

Une limite à connaître : l''étude vient d''un cabinet de conseil et ses données détaillées n''ont pas été publiées dans une revue scientifique, ce qui empêche de la vérifier. Prenez les chiffres comme des ordres de grandeur et les six styles comme une grille de lecture utile, pas comme une loi.

## Autodiagnostic

Répondez spontanément. Dans une semaine ordinaire, quelle proportion de votre temps de management correspond à chaque phrase ?

- « Je dis ce qu''il faut faire et je vérifie que c''est fait. » (directif)
- « Je montre comment faire et j''attends que les autres suivent le rythme. » (chef de file)
- « J''explique où on va et pourquoi, et je laisse choisir les moyens. » (visionnaire)
- « Je demande l''avis de l''équipe avant de décider. » (participatif)
- « Je prends du temps pour aider quelqu''un à progresser sur un point. » (coach)
- « Je veille à l''ambiance et aux relations entre les personnes. » (collaboratif)

Si un ou deux styles dominent à plus de 60 %, c''est votre style naturel. Ce n''est ni bien ni mal : c''est votre point de départ. Les styles que vous n''utilisez presque jamais sont ceux qu''il faut travailler.

Attention à un piège de l''autodiagnostic : on se voit souvent plus participatif ou plus coach qu''on ne l''est. Si vous en avez la possibilité, demandez à deux personnes de confiance de répondre à votre place.

## Le cas Garnier

Le style naturel de Karim est le chef de file : il est le meilleur carrossier, il montre, il attend que les autres suivent. C''est précisément ce qui ne marche pas avec Thierry (qui n''a rien à apprendre de lui en carrosserie) ni avec Lucas (qui a besoin d''un cadre, pas d''un modèle).

Pour les trois prochains mois, on peut proposer un dosage. Du visionnaire en premier : dire clairement où l''on va (tenir les délais annoncés aux assurances, arrêter les reprises) et pourquoi l''entreprise en dépend. Du participatif pour construire les nouvelles règles avec l''équipe, Thierry compris. Du coach pour Julien et Lucas. Et un peu de directif, ponctuel et assumé, sur la sécurité et sur les retards répétés.

## À retenir

- Six styles : directif, chef de file, visionnaire, participatif, coach, collaboratif.
- Directif et chef de file sont utiles ponctuellement, toxiques en usage courant.
- Le visionnaire est, selon l''étude, le plus efficace dans la plupart des situations.
- Les managers qui réussissent le mieux maîtrisent au moins quatre styles et en changent selon la situation.
- Identifiez votre style dominant et travaillez ceux que vous n''utilisez pas.

## Sources

- Daniel Goleman, « Leadership That Gets Results », *Harvard Business Review*, mars-avril 2000.
- Daniel Goleman, Richard Boyatzis, Annie McKee, *Primal Leadership*, Harvard Business School Press, 2002 ; trad. fr. *L''intelligence émotionnelle au travail*, Village mondial, 2002.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'En 2000, le psychologue Daniel Goleman a publié dans la *Harvard Business Review* un article devenu une référence : « Leadership That Gets Results ». Il s''appuyait sur une étude du cabinet de conseil Hay/McBer portant sur 3 871 cadres dirigeants, tirés d''une base de plus de 20 000. Elle cherchait à savoir quels comportements de leadership produisent des résultats, et dans quelles conditions.

Sa conclusion : il n''y a pas un bon style de leadership. L''étude en distingue six, et les managers les plus efficaces passent de l''un à l''autre selon la situation. Les voici, avec la formule qui résume chacun d''eux.

## 1. Le style directif (« Faites ce que je dis »)

Le manager décide seul et attend l''exécution immédiate. Il contrôle étroitement et sanctionne les écarts.

Quand il est efficace : en situation de crise (accident, urgence client, sécurité), avec un collaborateur en difficulté grave, ou pour arrêter une dérive nette.

Son effet à long terme : c''est, dans l''étude, le style qui dégrade le plus le climat de l''équipe. Utilisé au quotidien, il étouffe l''initiative ; les gens cessent de signaler les problèmes et se contentent d''exécuter.

## 2. Le style chef de file (« Faites comme moi, tout de suite »)

Le manager fixe des standards très élevés, montre l''exemple et attend que chacun suive. Il remplace ceux qui ne suivent pas plutôt que de les aider.

Quand il est efficace : avec une équipe très compétente et très motivée, qui a besoin de peu d''encadrement (des experts, des commerciaux confirmés).

Son effet à long terme : les collaborateurs se sentent dépassés, ne comprennent pas ce qu''on attend d''eux, et le climat se dégrade. C''est le style naturel de beaucoup d''experts promus managers, comme Karim ou Inès : « je fais mieux, donc je montre ». Il est rarement efficace avec une équipe hétérogène.

## 3. Le style visionnaire (« Venez avec moi »)

Le manager donne une direction claire et un sens : voici où nous allons et pourquoi. Il laisse à chacun la liberté des moyens.

Quand il est efficace : presque toujours, et particulièrement lorsqu''une équipe a besoin d''une nouvelle direction (nouveau manager, réorganisation, changement de stratégie).

Son effet à long terme : c''est, selon l''étude, le style qui a l''impact le plus positif sur le climat. Il fonctionne mal, en revanche, face à une équipe d''experts plus expérimentés que le manager, qui peuvent trouver ses grands discours prétentieux.

## 4. Le style participatif (« Qu''en pensez-vous ? »)

Le manager consulte l''équipe, cherche le consensus, fait participer aux décisions.

Quand il est efficace : quand le manager a besoin des idées de l''équipe, quand l''adhésion compte plus que la vitesse, ou quand il ne sait pas lui-même quelle est la bonne solution.

Son effet à long terme : positif sur le climat, mais avec un risque : réunions sans fin, décisions qui ne se prennent pas. Inefficace en crise, et avec des collaborateurs qui n''ont pas les compétences pour contribuer.

## 5. Le style coach (« Essayez ceci »)

Le manager se concentre sur le développement de la personne : il aide chacun à identifier ses forces, ses faiblesses et ses objectifs professionnels, il délègue des missions qui font grandir, il accepte l''échec à court terme au profit de l''apprentissage.

Quand il est efficace : avec des collaborateurs qui veulent progresser et qui sont conscients de leurs points faibles.

Son effet à long terme : très positif sur le climat. Son défaut : c''est le style le moins utilisé, parce qu''il demande du temps et que ses résultats ne sont pas immédiats. Il ne fonctionne pas avec un collaborateur qui refuse de changer.

## 6. Le style collaboratif (« Les gens d''abord »)

Le manager privilégie l''harmonie et les relations. Il évite les conflits, valorise, crée du lien.

Quand il est efficace : pour ressouder une équipe après une période difficile, restaurer la confiance, motiver dans un contexte pénible.

Son effet à long terme : positif sur le climat, mais s''il est utilisé seul, la médiocrité s''installe : personne ne reçoit de retour correctif, et les bons collaborateurs ont l''impression que l''effort n''est pas reconnu.

## Ce que montre l''étude

On retient généralement deux résultats.

D''abord, quatre styles ont un effet positif sur le climat de l''équipe (visionnaire, participatif, coach, collaboratif) et deux un effet négatif quand ils sont utilisés régulièrement (directif, chef de file). Or, selon l''étude, le climat expliquerait près d''un tiers des résultats.

Ensuite, les managers qui obtiennent les meilleurs résultats maîtrisent au moins quatre styles, en particulier le visionnaire, le participatif, le coach et le collaboratif, et ils passent de l''un à l''autre avec souplesse selon la situation, parfois dans la même journée.

Goleman compare les styles aux clubs d''un golfeur : le bon joueur choisit le club selon le coup à jouer. Un manager qui n''a qu''un style ressemble à un golfeur qui jouerait tout le parcours avec le même club.

Une limite à connaître : l''étude vient d''un cabinet de conseil et ses données détaillées n''ont pas été publiées dans une revue scientifique, ce qui empêche de la vérifier. Prenez les chiffres comme des ordres de grandeur et les six styles comme une grille de lecture utile, pas comme une loi.

## Autodiagnostic

Répondez spontanément. Dans une semaine ordinaire, quelle proportion de votre temps de management correspond à chaque phrase ?

- « Je dis ce qu''il faut faire et je vérifie que c''est fait. » (directif)
- « Je montre comment faire et j''attends que les autres suivent le rythme. » (chef de file)
- « J''explique où on va et pourquoi, et je laisse choisir les moyens. » (visionnaire)
- « Je demande l''avis de l''équipe avant de décider. » (participatif)
- « Je prends du temps pour aider quelqu''un à progresser sur un point. » (coach)
- « Je veille à l''ambiance et aux relations entre les personnes. » (collaboratif)

Si un ou deux styles dominent à plus de 60 %, c''est votre style naturel. Ce n''est ni bien ni mal : c''est votre point de départ. Les styles que vous n''utilisez presque jamais sont ceux qu''il faut travailler.

Attention à un piège de l''autodiagnostic : on se voit souvent plus participatif ou plus coach qu''on ne l''est. Si vous en avez la possibilité, demandez à deux personnes de confiance de répondre à votre place.

## Le cas Garnier

Le style naturel de Karim est le chef de file : il est le meilleur carrossier, il montre, il attend que les autres suivent. C''est précisément ce qui ne marche pas avec Thierry (qui n''a rien à apprendre de lui en carrosserie) ni avec Lucas (qui a besoin d''un cadre, pas d''un modèle).

Pour les trois prochains mois, on peut proposer un dosage. Du visionnaire en premier : dire clairement où l''on va (tenir les délais annoncés aux assurances, arrêter les reprises) et pourquoi l''entreprise en dépend. Du participatif pour construire les nouvelles règles avec l''équipe, Thierry compris. Du coach pour Julien et Lucas. Et un peu de directif, ponctuel et assumé, sur la sécurité et sur les retards répétés.

## À retenir

- Six styles : directif, chef de file, visionnaire, participatif, coach, collaboratif.
- Directif et chef de file sont utiles ponctuellement, toxiques en usage courant.
- Le visionnaire est, selon l''étude, le plus efficace dans la plupart des situations.
- Les managers qui réussissent le mieux maîtrisent au moins quatre styles et en changent selon la situation.
- Identifiez votre style dominant et travaillez ceux que vous n''utilisez pas.

## Sources

- Daniel Goleman, « Leadership That Gets Results », *Harvard Business Review*, mars-avril 2000.
- Daniel Goleman, Richard Boyatzis, Annie McKee, *Primal Leadership*, Harvard Business School Press, 2002 ; trad. fr. *L''intelligence émotionnelle au travail*, Village mondial, 2002.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 2 and l.ordre = 3;
  n := n + 1;

  -- 1.4-video-leadership-situationnel.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Le leadership situationnel

Dans la leçon précédente, vous avez vu qu''un bon manager change de style selon la situation. Mais selon quoi, exactement ? Comment savoir, face à une personne donnée, sur une tâche donnée, s''il faut diriger, accompagner ou laisser faire ?

À la fin des années 1960, deux chercheurs américains, Paul Hersey et Kenneth Blanchard, ont proposé une réponse simple, qu''on appelle le leadership situationnel. Elle est enseignée dans le monde entier depuis cinquante ans, même si les études scientifiques ne confirment qu''en partie ses recommandations : prenez-la comme une grille pratique, pas comme une loi. Son principe : adaptez votre style au niveau d''autonomie de la personne sur la tâche.

## Deux ingrédients

Le niveau d''autonomie, c''est la combinaison de deux ingrédients.

Le premier, c''est la compétence : est-ce que la personne sait faire cette tâche précise ? Pas « est-elle compétente en général », mais « sait-elle faire cela ». Un excellent carrossier peut être incompétent pour rédiger un devis.

Le second, c''est l''engagement : a-t-elle envie de le faire, et se sent-elle capable ? La motivation et la confiance en soi.

En croisant les deux, on obtient quatre niveaux d''autonomie.

A1 : compétence faible, engagement fort. C''est le débutant enthousiaste. Il ne sait pas encore, mais il a envie. Pensez à Lucas, l''apprenti, sur une tâche nouvelle.

A2 : compétence faible ou moyenne, engagement faible. C''est l''apprenant déçu. Il a essayé, il a vu que c''était plus dur que prévu, il doute. Pensez à Julien après sa deuxième reprise.

A3 : compétence forte, engagement variable. C''est le collaborateur compétent mais prudent : il sait faire, mais il hésite à prendre l''initiative, ou il a un coup de mou. Pensez à Nadia, qui gère seule la cabine mais ne sait pas vers quoi évoluer.

A4 : compétence forte, engagement fort. C''est l''expert autonome. Il sait, il veut, il fait. Pensez à Thierry sur son cœur de métier.

## Quatre styles pour quatre niveaux

À chaque niveau correspond un style de management, défini par deux dosages : combien je dirige, c''est-à-dire combien j''explique, je cadre, je contrôle ; et combien je soutiens, c''est-à-dire combien j''écoute, j''encourage, je fais participer.

Style 1, diriger : beaucoup de direction, peu de soutien. Je dis quoi faire, comment, quand ; je montre ; je contrôle de près. C''est ce qu''il faut pour A1, le débutant enthousiaste. Il n''a pas besoin qu''on le motive, il l''est déjà ; il a besoin qu''on lui apprenne.

Style 2, entraîner : beaucoup de direction, beaucoup de soutien. Je continue à cadrer et à expliquer, mais j''écoute ses difficultés, j''encourage, je valorise les progrès. C''est ce qu''il faut pour A2, l''apprenant déçu : il a besoin des deux, du savoir-faire et de la confiance.

Style 3, épauler : peu de direction, beaucoup de soutien. Je ne lui explique plus comment faire, il sait. Mais je l''écoute, je le consulte, je le rassure sur sa capacité à décider. C''est ce qu''il faut pour A3, le compétent prudent.

Style 4, déléguer : peu de direction, peu de soutien. Je fixe le résultat attendu et je laisse faire. Je reste disponible, je fais le point de temps en temps, mais je n''interviens pas. C''est ce qu''il faut pour A4, l''expert autonome.

## Trois règles d''usage

Trois règles pour utiliser ce modèle sans se tromper.

Première règle : le niveau d''autonomie est lié à une tâche, pas à une personne. Thierry est A4 en carrosserie et probablement A1 sur un nouveau logiciel de devis. Vous ne managez pas « Thierry » : vous managez Thierry sur telle tâche.

Deuxième règle : le niveau évolue, et votre style doit évoluer avec lui. L''objectif, c''est de faire monter chacun vers A4 sur le maximum de tâches, et donc de passer progressivement de diriger à déléguer. Un manager qui dirige encore quelqu''un qui est devenu compétent l''infantilise. Un manager qui délègue à quelqu''un qui ne sait pas encore l''abandonne.

Troisième règle : quand vous hésitez, demandez. « Sur ce sujet, tu préfères que je te montre, ou tu vois comment faire ? » Cette question, à elle seule, évite la plupart des erreurs de dosage.

## Les deux erreurs les plus fréquentes

Les deux erreurs les plus fréquentes sont symétriques.

La première : sur-diriger les compétents. C''est le manager qui explique à un expert comment faire son travail. L''expert le vit comme un manque de confiance, et se désengage. C''est exactement ce que Thierry redoute de Karim.

La seconde : sous-diriger les débutants, par bienveillance ou par manque de temps. On confie une tâche nouvelle en disant « tu verras, c''est facile », et on découvre le résultat trop tard. C''est ce qui est arrivé avec Julien et la coulure de vernis : personne n''a contrôlé un carrossier qui n''était pas encore autonome sur la finition.

## À l''atelier Garnier

Appliquons à l''atelier Garnier.

Thierry, sur la carrosserie : déléguer. Karim n''a rien à lui apprendre ; il lui fixe le résultat et le délai, et il lui fiche la paix. En revanche, sur les nouvelles règles d''organisation, Thierry est plutôt A2 : il ne les connaît pas encore et n''en voit pas l''intérêt. Il faudra expliquer, et écouter.

Julien : entraîner. Expliquer à nouveau les points de contrôle de la finition, vérifier avec lui pendant quelques semaines, et surtout valoriser ce qui est bien, parce qu''il est en train de perdre confiance.

Lucas : diriger, franchement. Sur la ponctualité comme sur les tâches : des consignes claires, un contrôle rapproché, sans agressivité mais sans flou.

Nadia : épauler. Elle est autonome en peinture ; ce dont elle a besoin, c''est qu''on l''écoute sur son envie d''évoluer, et qu''on lui confie une responsabilité qui le lui permette.

Vous voyez le principe : même équipe, même manager, quatre styles différents, parce que quatre situations différentes. Ce n''est pas de l''incohérence, c''est de l''adaptation. Et c''est ce que les gens attendent d''un manager : qu''il les traite selon ce dont ils ont besoin, pas tous pareil.

Dans le podcast qui suit, nous parlerons d''une situation particulière et très fréquente : passer de collègue à manager dans la même équipe.

## Sources
Hersey & Blanchard, « Life Cycle Theory of Leadership », *Training and Development Journal* (1969) et *Management of Organizational Behavior*, Prentice Hall (1re éd. 1969) ; Blanchard, Zigarmi & Zigarmi, *Leadership and the One Minute Manager*, William Morrow (1985), modèle SLII dont sont tirés les quatre niveaux (notés D1 à D4 dans la version originale) ; Thompson & Vecchio, « Situational leadership theory: A test of three versions », *The Leadership Quarterly*, vol. 20 (2009), sur les limites empiriques du modèle.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Le leadership situationnel

Dans la leçon précédente, vous avez vu qu''un bon manager change de style selon la situation. Mais selon quoi, exactement ? Comment savoir, face à une personne donnée, sur une tâche donnée, s''il faut diriger, accompagner ou laisser faire ?

À la fin des années 1960, deux chercheurs américains, Paul Hersey et Kenneth Blanchard, ont proposé une réponse simple, qu''on appelle le leadership situationnel. Elle est enseignée dans le monde entier depuis cinquante ans, même si les études scientifiques ne confirment qu''en partie ses recommandations : prenez-la comme une grille pratique, pas comme une loi. Son principe : adaptez votre style au niveau d''autonomie de la personne sur la tâche.

## Deux ingrédients

Le niveau d''autonomie, c''est la combinaison de deux ingrédients.

Le premier, c''est la compétence : est-ce que la personne sait faire cette tâche précise ? Pas « est-elle compétente en général », mais « sait-elle faire cela ». Un excellent carrossier peut être incompétent pour rédiger un devis.

Le second, c''est l''engagement : a-t-elle envie de le faire, et se sent-elle capable ? La motivation et la confiance en soi.

En croisant les deux, on obtient quatre niveaux d''autonomie.

A1 : compétence faible, engagement fort. C''est le débutant enthousiaste. Il ne sait pas encore, mais il a envie. Pensez à Lucas, l''apprenti, sur une tâche nouvelle.

A2 : compétence faible ou moyenne, engagement faible. C''est l''apprenant déçu. Il a essayé, il a vu que c''était plus dur que prévu, il doute. Pensez à Julien après sa deuxième reprise.

A3 : compétence forte, engagement variable. C''est le collaborateur compétent mais prudent : il sait faire, mais il hésite à prendre l''initiative, ou il a un coup de mou. Pensez à Nadia, qui gère seule la cabine mais ne sait pas vers quoi évoluer.

A4 : compétence forte, engagement fort. C''est l''expert autonome. Il sait, il veut, il fait. Pensez à Thierry sur son cœur de métier.

## Quatre styles pour quatre niveaux

À chaque niveau correspond un style de management, défini par deux dosages : combien je dirige, c''est-à-dire combien j''explique, je cadre, je contrôle ; et combien je soutiens, c''est-à-dire combien j''écoute, j''encourage, je fais participer.

Style 1, diriger : beaucoup de direction, peu de soutien. Je dis quoi faire, comment, quand ; je montre ; je contrôle de près. C''est ce qu''il faut pour A1, le débutant enthousiaste. Il n''a pas besoin qu''on le motive, il l''est déjà ; il a besoin qu''on lui apprenne.

Style 2, entraîner : beaucoup de direction, beaucoup de soutien. Je continue à cadrer et à expliquer, mais j''écoute ses difficultés, j''encourage, je valorise les progrès. C''est ce qu''il faut pour A2, l''apprenant déçu : il a besoin des deux, du savoir-faire et de la confiance.

Style 3, épauler : peu de direction, beaucoup de soutien. Je ne lui explique plus comment faire, il sait. Mais je l''écoute, je le consulte, je le rassure sur sa capacité à décider. C''est ce qu''il faut pour A3, le compétent prudent.

Style 4, déléguer : peu de direction, peu de soutien. Je fixe le résultat attendu et je laisse faire. Je reste disponible, je fais le point de temps en temps, mais je n''interviens pas. C''est ce qu''il faut pour A4, l''expert autonome.

## Trois règles d''usage

Trois règles pour utiliser ce modèle sans se tromper.

Première règle : le niveau d''autonomie est lié à une tâche, pas à une personne. Thierry est A4 en carrosserie et probablement A1 sur un nouveau logiciel de devis. Vous ne managez pas « Thierry » : vous managez Thierry sur telle tâche.

Deuxième règle : le niveau évolue, et votre style doit évoluer avec lui. L''objectif, c''est de faire monter chacun vers A4 sur le maximum de tâches, et donc de passer progressivement de diriger à déléguer. Un manager qui dirige encore quelqu''un qui est devenu compétent l''infantilise. Un manager qui délègue à quelqu''un qui ne sait pas encore l''abandonne.

Troisième règle : quand vous hésitez, demandez. « Sur ce sujet, tu préfères que je te montre, ou tu vois comment faire ? » Cette question, à elle seule, évite la plupart des erreurs de dosage.

## Les deux erreurs les plus fréquentes

Les deux erreurs les plus fréquentes sont symétriques.

La première : sur-diriger les compétents. C''est le manager qui explique à un expert comment faire son travail. L''expert le vit comme un manque de confiance, et se désengage. C''est exactement ce que Thierry redoute de Karim.

La seconde : sous-diriger les débutants, par bienveillance ou par manque de temps. On confie une tâche nouvelle en disant « tu verras, c''est facile », et on découvre le résultat trop tard. C''est ce qui est arrivé avec Julien et la coulure de vernis : personne n''a contrôlé un carrossier qui n''était pas encore autonome sur la finition.

## À l''atelier Garnier

Appliquons à l''atelier Garnier.

Thierry, sur la carrosserie : déléguer. Karim n''a rien à lui apprendre ; il lui fixe le résultat et le délai, et il lui fiche la paix. En revanche, sur les nouvelles règles d''organisation, Thierry est plutôt A2 : il ne les connaît pas encore et n''en voit pas l''intérêt. Il faudra expliquer, et écouter.

Julien : entraîner. Expliquer à nouveau les points de contrôle de la finition, vérifier avec lui pendant quelques semaines, et surtout valoriser ce qui est bien, parce qu''il est en train de perdre confiance.

Lucas : diriger, franchement. Sur la ponctualité comme sur les tâches : des consignes claires, un contrôle rapproché, sans agressivité mais sans flou.

Nadia : épauler. Elle est autonome en peinture ; ce dont elle a besoin, c''est qu''on l''écoute sur son envie d''évoluer, et qu''on lui confie une responsabilité qui le lui permette.

Vous voyez le principe : même équipe, même manager, quatre styles différents, parce que quatre situations différentes. Ce n''est pas de l''incohérence, c''est de l''adaptation. Et c''est ce que les gens attendent d''un manager : qu''il les traite selon ce dont ils ont besoin, pas tous pareil.

Dans le podcast qui suit, nous parlerons d''une situation particulière et très fréquente : passer de collègue à manager dans la même équipe.

## Sources
Hersey & Blanchard, « Life Cycle Theory of Leadership », *Training and Development Journal* (1969) et *Management of Organizational Behavior*, Prentice Hall (1re éd. 1969) ; Blanchard, Zigarmi & Zigarmi, *Leadership and the One Minute Manager*, William Morrow (1985), modèle SLII dont sont tirés les quatre niveaux (notés D1 à D4 dans la version originale) ; Thompson & Vecchio, « Situational leadership theory: A test of three versions », *The Leadership Quarterly*, vol. 20 (2009), sur les limites empiriques du modèle.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 2 and l.ordre = 4;
  n := n + 1;

  -- 1.5-podcast-de-collegue-a-manager.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Version écrite de l''épisode (le texte de référence ; l''enregistrement peut le formuler autrement).

Conversation entre Claire, animatrice IDEAFORMA et David, manager invité, responsable d''un atelier de 12 personnes dans une PME industrielle, promu en interne il y a quatre ans (personnage fictif inspiré de situations réelles).

**Claire** — Bonjour et bienvenue dans ce podcast IDEAFORMA. Aujourd''hui, on parle d''un moment que beaucoup d''entre vous vivent ou vont vivre : le jour où l''on devient le manager de ses anciens collègues. Pour en parler, j''ai avec moi David, qui est passé par là. David, bonjour.

**David** — Bonjour Claire.

**Claire** — Vous encadrez aujourd''hui une équipe de douze personnes. Racontez-nous comment ça a commencé.

**David** — J''étais technicien de maintenance dans l''atelier depuis sept ans. Mon chef est parti à la retraite, et le directeur m''a proposé le poste. J''ai dit oui en une soirée. Je pensais que ce serait la même chose avec un peu plus de responsabilités. Ça n''avait rien à voir.

**Claire** — Qu''est-ce qui a changé, concrètement, le premier jour ?

**David** — Le premier jour, rien. Les gens m''ont félicité. Le problème est arrivé la deuxième semaine, quand j''ai dû demander à un collègue, avec qui je déjeunais tous les jours depuis des années, de refaire un travail qui n''était pas conforme. Il m''a regardé et il m''a dit : « Ah, c''est comme ça maintenant ? » Et là j''ai compris que la relation avait changé, que je le veuille ou non.

**Claire** — C''est ce qu''on appelle la question de la légitimité. Vous aviez été nommé, donc légitime sur le papier. Mais visiblement ça ne suffisait pas.

**David** — Non. La nomination vous donne le droit de décider. Elle ne vous donne pas le fait que les gens l''acceptent. Ça, il faut le construire. Et le piège, quand on est promu en interne, c''est qu''on croit que l''ancienne relation va faire le travail à notre place. « Ils me connaissent, ils m''aiment bien, ça va passer. » En réalité, c''est presque l''inverse : ils vous connaissent comme collègue, donc ils ont du mal à vous voir comme manager.

**Claire** — Il y a une expression qu''on entend souvent : trouver la « bonne distance ». Vous, vous l''avez trouvée comment ?

**David** — Par erreurs, honnêtement. Ma première erreur, ça a été de ne rien changer. Je continuais à déjeuner avec les mêmes, à plaisanter sur le chef comme avant, sauf que le chef c''était moi. Au bout d''un mois, j''ai réalisé que les trois personnes avec qui je déjeunais étaient perçues comme mes protégés par les neuf autres. Alors que je n''avais rien décidé.

**Claire** — Donc la proximité avec certains devient un problème d''équité pour les autres.

**David** — Exactement. Et ça, on ne le voit pas de l''intérieur. Il a fallu qu''une collègue me le dise. Ensuite, deuxième erreur, j''ai surcorrigé. Je me suis mis à manger seul dans mon bureau, à vouvoyer les gens. Ridicule. Ils ont cru que la promotion m''était montée à la tête.

**Claire** — Et la bonne distance, finalement ?

**David** — Ce que j''ai compris, c''est que la distance, ce n''est pas une question de tutoiement ou de pause-café. C''est une question de rôle. Je peux déjeuner avec l''équipe, plaisanter, être proche. Mais quand il s''agit du travail, je tiens mon rôle : je décide, je fais des retours, je tranche, et je le fais pareil avec tout le monde. Y compris avec mes anciens amis. Surtout avec mes anciens amis, en fait.

**Claire** — C''est ça qui construit la légitimité : la constance.

**David** — La constance et l''équité. Les gens ne vous suivent pas parce que vous êtes sympa. Ils vous suivent parce qu''ils savent à quoi s''attendre avec vous. Ce que vous avez dit lundi, vous le tenez vendredi. Ce que vous demandez à l''un, vous le demandez à l''autre. C''est presque ennuyeux à dire, mais c''est ça.

**Claire** — Parlons de la situation la plus délicate : l''ancien collègue qui voulait le poste, ou qui pense qu''il le méritait plus que vous. Vous avez eu ça ?

**David** — Oui. Un technicien plus ancien que moi, très compétent, qui ne l''a jamais dit clairement mais qui le faisait sentir. Des remarques devant les autres, des « moi je ferais pas comme ça », des silences dans les réunions.

**Claire** — Et qu''est-ce que vous avez fait ?

**David** — D''abord, pendant deux mois, rien. J''espérais que ça passe. Ça ne passe pas. Ça s''installe, et les autres regardent comment vous réagissez. Puis j''ai fait ce que j''aurais dû faire dès le début : je l''ai pris en entretien, seul à seul.

**Claire** — Vous lui avez dit quoi ?

**David** — Trois choses. La première : que je savais qu''il avait plus d''expérience que moi sur la partie technique, et que j''avais besoin de lui pour ça. C''était vrai, ce n''était pas de la flatterie. La deuxième : que j''avais remarqué les remarques devant l''équipe, avec deux exemples précis, et que ça ne pouvait pas continuer, parce que ça mettait tout le monde mal à l''aise, lui compris. La troisième : qu''il avait le droit de ne pas être d''accord avec mes décisions, et que je voulais qu''il me le dise, mais en entretien, pas devant les autres.

**Claire** — Et il a réagi comment ?

**David** — Il a d''abord nié. Puis il a dit que de toute façon il n''avait pas voulu du poste. Et à la fin, il m''a dit : « Bon, on fait comment pour la ligne 3 ? » C''est-à-dire qu''il est revenu au travail. Ce n''est pas devenu mon meilleur ami. Mais les remarques publiques ont cessé, et deux ans plus tard c''est lui qui forme les nouveaux.

**Claire** — Ce que je retiens, c''est que vous ne l''avez pas affronté, vous ne l''avez pas ignoré non plus. Vous lui avez donné une place.

**David** — C''est exactement ça. Les gens qui contestent votre légitimité ont souvent besoin qu''on reconnaisse la leur. Un ancien qui râle, c''est souvent quelqu''un qui a peur de ne plus compter.

**Claire** — Passons à un autre point délicat : la relation avec la hiérarchie. Quand on est promu en interne, on a souvent l''impression d''être coincé entre l''équipe et la direction.

**David** — C''est le cas. Et il faut l''accepter : c''est le poste. Le manager de proximité, c''est celui qui traduit dans les deux sens. Vers le bas, il explique les décisions de la direction, même celles qu''il n''a pas choisies. Vers le haut, il fait remonter ce que l''équipe vit, même ce que la direction n''a pas envie d''entendre.

**Claire** — Le piège, c''est de choisir un camp.

**David** — Oui. Il y a le manager qui devient le porte-parole de la direction : « c''est comme ça, c''est décidé en haut, je n''y peux rien ». L''équipe le lâche. Et il y a le manager qui devient le syndicaliste de son équipe : « moi je suis avec vous, c''est eux le problème ». La direction ne lui fait plus confiance, et il ne peut plus rien obtenir pour son équipe. Dans les deux cas, il a perdu.

**Claire** — Alors comment on fait ?

**David** — Une règle simple : je défends mon équipe devant la direction, et je défends les décisions de la direction devant mon équipe. Quand je ne suis pas d''accord avec une décision, je le dis à mon directeur, en entretien, avec des arguments. Une fois que c''est tranché, je porte la décision devant l''équipe. Je peux dire « j''ai exprimé des réserves », mais pas « je suis contre ». Ce serait me défausser.

**Claire** — On a évoqué dans une leçon précédente le cas de Karim, promu chef d''atelier dans une carrosserie, et qui découvre que la secrétaire continue à donner les priorités directement aux carrossiers, et que son patron intervient encore tous les jours. Qu''est-ce que vous lui diriez ?

**David** — Qu''il a un problème de clarification avant d''avoir un problème de légitimité. Personne n''a dit à l''équipe ce que le chef d''atelier décide et ce qu''il ne décide pas. Donc chacun continue comme avant, et ce n''est même pas de la mauvaise volonté. Je lui dirais d''aller voir son patron avec une feuille : voilà ce que je propose de décider, voilà comment les priorités circulent, voilà ce que je vous remonte et à quel rythme. Et de demander que ce soit annoncé à l''équipe par le patron lui-même.

**Claire** — Pourquoi par le patron ?

**David** — Parce que la légitimité, au début, elle vient d''en haut. Si Karim annonce lui-même « désormais c''est moi qui fixe les priorités », ça ressemble à une prise de pouvoir. Si Michel Garnier le dit devant l''équipe, ça devient une organisation. Ensuite, à Karim de la faire vivre.

**Claire** — On arrive vers la fin. Si vous deviez donner trois conseils à quelqu''un qui devient manager de ses collègues la semaine prochaine ?

**David** — Premier conseil : parlez-en, individuellement, avec chaque personne de l''équipe, dans les quinze premiers jours. Pas une grande réunion, des entretiens de vingt minutes. « Comment tu vois les choses, qu''est-ce qui marche, qu''est-ce qui ne marche pas, qu''est-ce que tu attends de moi. » Vous apprenez énormément, et vous montrez que le rôle a changé sans avoir à le dire.

**Claire** — Deuxième ?

**David** — Ne changez rien de structurel pendant un mois, mais réglez immédiatement ce qui est inacceptable. Les retards, les manques de sécurité, les manques de respect. Si vous laissez passer ça au début, vous avez perdu, parce que tout le monde regarde.

**Claire** — Et le troisième ?

**David** — Acceptez de ne plus être « l''un d''entre eux ». Ce n''est pas une perte. Vous n''êtes plus un collègue ; vous êtes la personne qui va leur permettre de bien travailler. Si vous faites bien ce travail, vous aurez quelque chose de mieux que l''amitié : la confiance.

**Claire** — Merci David. Pour résumer : la légitimité ne vient pas de la nomination mais de la constance et de l''équité ; les contestations se traitent en entretien, en donnant une place ; le manager traduit dans les deux sens sans choisir de camp ; et les quinze premiers jours servent à écouter chacun.

**David** — Et à régler tout de suite ce qui est inacceptable.

**Claire** — Et à régler tout de suite ce qui est inacceptable. À bientôt dans la suite du module.

## Sources
Linda A. Hill, *Becoming a Manager*, Harvard Business School Press (2003), sur la découverte du rôle par les nouveaux managers ; Mintzberg (1973), rôles d''agent de liaison et de porte-parole ; Kotter (1990), management vs leadership.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Version écrite de l''épisode (le texte de référence ; l''enregistrement peut le formuler autrement).

Conversation entre Claire, animatrice IDEAFORMA et David, manager invité, responsable d''un atelier de 12 personnes dans une PME industrielle, promu en interne il y a quatre ans (personnage fictif inspiré de situations réelles).

**Claire** — Bonjour et bienvenue dans ce podcast IDEAFORMA. Aujourd''hui, on parle d''un moment que beaucoup d''entre vous vivent ou vont vivre : le jour où l''on devient le manager de ses anciens collègues. Pour en parler, j''ai avec moi David, qui est passé par là. David, bonjour.

**David** — Bonjour Claire.

**Claire** — Vous encadrez aujourd''hui une équipe de douze personnes. Racontez-nous comment ça a commencé.

**David** — J''étais technicien de maintenance dans l''atelier depuis sept ans. Mon chef est parti à la retraite, et le directeur m''a proposé le poste. J''ai dit oui en une soirée. Je pensais que ce serait la même chose avec un peu plus de responsabilités. Ça n''avait rien à voir.

**Claire** — Qu''est-ce qui a changé, concrètement, le premier jour ?

**David** — Le premier jour, rien. Les gens m''ont félicité. Le problème est arrivé la deuxième semaine, quand j''ai dû demander à un collègue, avec qui je déjeunais tous les jours depuis des années, de refaire un travail qui n''était pas conforme. Il m''a regardé et il m''a dit : « Ah, c''est comme ça maintenant ? » Et là j''ai compris que la relation avait changé, que je le veuille ou non.

**Claire** — C''est ce qu''on appelle la question de la légitimité. Vous aviez été nommé, donc légitime sur le papier. Mais visiblement ça ne suffisait pas.

**David** — Non. La nomination vous donne le droit de décider. Elle ne vous donne pas le fait que les gens l''acceptent. Ça, il faut le construire. Et le piège, quand on est promu en interne, c''est qu''on croit que l''ancienne relation va faire le travail à notre place. « Ils me connaissent, ils m''aiment bien, ça va passer. » En réalité, c''est presque l''inverse : ils vous connaissent comme collègue, donc ils ont du mal à vous voir comme manager.

**Claire** — Il y a une expression qu''on entend souvent : trouver la « bonne distance ». Vous, vous l''avez trouvée comment ?

**David** — Par erreurs, honnêtement. Ma première erreur, ça a été de ne rien changer. Je continuais à déjeuner avec les mêmes, à plaisanter sur le chef comme avant, sauf que le chef c''était moi. Au bout d''un mois, j''ai réalisé que les trois personnes avec qui je déjeunais étaient perçues comme mes protégés par les neuf autres. Alors que je n''avais rien décidé.

**Claire** — Donc la proximité avec certains devient un problème d''équité pour les autres.

**David** — Exactement. Et ça, on ne le voit pas de l''intérieur. Il a fallu qu''une collègue me le dise. Ensuite, deuxième erreur, j''ai surcorrigé. Je me suis mis à manger seul dans mon bureau, à vouvoyer les gens. Ridicule. Ils ont cru que la promotion m''était montée à la tête.

**Claire** — Et la bonne distance, finalement ?

**David** — Ce que j''ai compris, c''est que la distance, ce n''est pas une question de tutoiement ou de pause-café. C''est une question de rôle. Je peux déjeuner avec l''équipe, plaisanter, être proche. Mais quand il s''agit du travail, je tiens mon rôle : je décide, je fais des retours, je tranche, et je le fais pareil avec tout le monde. Y compris avec mes anciens amis. Surtout avec mes anciens amis, en fait.

**Claire** — C''est ça qui construit la légitimité : la constance.

**David** — La constance et l''équité. Les gens ne vous suivent pas parce que vous êtes sympa. Ils vous suivent parce qu''ils savent à quoi s''attendre avec vous. Ce que vous avez dit lundi, vous le tenez vendredi. Ce que vous demandez à l''un, vous le demandez à l''autre. C''est presque ennuyeux à dire, mais c''est ça.

**Claire** — Parlons de la situation la plus délicate : l''ancien collègue qui voulait le poste, ou qui pense qu''il le méritait plus que vous. Vous avez eu ça ?

**David** — Oui. Un technicien plus ancien que moi, très compétent, qui ne l''a jamais dit clairement mais qui le faisait sentir. Des remarques devant les autres, des « moi je ferais pas comme ça », des silences dans les réunions.

**Claire** — Et qu''est-ce que vous avez fait ?

**David** — D''abord, pendant deux mois, rien. J''espérais que ça passe. Ça ne passe pas. Ça s''installe, et les autres regardent comment vous réagissez. Puis j''ai fait ce que j''aurais dû faire dès le début : je l''ai pris en entretien, seul à seul.

**Claire** — Vous lui avez dit quoi ?

**David** — Trois choses. La première : que je savais qu''il avait plus d''expérience que moi sur la partie technique, et que j''avais besoin de lui pour ça. C''était vrai, ce n''était pas de la flatterie. La deuxième : que j''avais remarqué les remarques devant l''équipe, avec deux exemples précis, et que ça ne pouvait pas continuer, parce que ça mettait tout le monde mal à l''aise, lui compris. La troisième : qu''il avait le droit de ne pas être d''accord avec mes décisions, et que je voulais qu''il me le dise, mais en entretien, pas devant les autres.

**Claire** — Et il a réagi comment ?

**David** — Il a d''abord nié. Puis il a dit que de toute façon il n''avait pas voulu du poste. Et à la fin, il m''a dit : « Bon, on fait comment pour la ligne 3 ? » C''est-à-dire qu''il est revenu au travail. Ce n''est pas devenu mon meilleur ami. Mais les remarques publiques ont cessé, et deux ans plus tard c''est lui qui forme les nouveaux.

**Claire** — Ce que je retiens, c''est que vous ne l''avez pas affronté, vous ne l''avez pas ignoré non plus. Vous lui avez donné une place.

**David** — C''est exactement ça. Les gens qui contestent votre légitimité ont souvent besoin qu''on reconnaisse la leur. Un ancien qui râle, c''est souvent quelqu''un qui a peur de ne plus compter.

**Claire** — Passons à un autre point délicat : la relation avec la hiérarchie. Quand on est promu en interne, on a souvent l''impression d''être coincé entre l''équipe et la direction.

**David** — C''est le cas. Et il faut l''accepter : c''est le poste. Le manager de proximité, c''est celui qui traduit dans les deux sens. Vers le bas, il explique les décisions de la direction, même celles qu''il n''a pas choisies. Vers le haut, il fait remonter ce que l''équipe vit, même ce que la direction n''a pas envie d''entendre.

**Claire** — Le piège, c''est de choisir un camp.

**David** — Oui. Il y a le manager qui devient le porte-parole de la direction : « c''est comme ça, c''est décidé en haut, je n''y peux rien ». L''équipe le lâche. Et il y a le manager qui devient le syndicaliste de son équipe : « moi je suis avec vous, c''est eux le problème ». La direction ne lui fait plus confiance, et il ne peut plus rien obtenir pour son équipe. Dans les deux cas, il a perdu.

**Claire** — Alors comment on fait ?

**David** — Une règle simple : je défends mon équipe devant la direction, et je défends les décisions de la direction devant mon équipe. Quand je ne suis pas d''accord avec une décision, je le dis à mon directeur, en entretien, avec des arguments. Une fois que c''est tranché, je porte la décision devant l''équipe. Je peux dire « j''ai exprimé des réserves », mais pas « je suis contre ». Ce serait me défausser.

**Claire** — On a évoqué dans une leçon précédente le cas de Karim, promu chef d''atelier dans une carrosserie, et qui découvre que la secrétaire continue à donner les priorités directement aux carrossiers, et que son patron intervient encore tous les jours. Qu''est-ce que vous lui diriez ?

**David** — Qu''il a un problème de clarification avant d''avoir un problème de légitimité. Personne n''a dit à l''équipe ce que le chef d''atelier décide et ce qu''il ne décide pas. Donc chacun continue comme avant, et ce n''est même pas de la mauvaise volonté. Je lui dirais d''aller voir son patron avec une feuille : voilà ce que je propose de décider, voilà comment les priorités circulent, voilà ce que je vous remonte et à quel rythme. Et de demander que ce soit annoncé à l''équipe par le patron lui-même.

**Claire** — Pourquoi par le patron ?

**David** — Parce que la légitimité, au début, elle vient d''en haut. Si Karim annonce lui-même « désormais c''est moi qui fixe les priorités », ça ressemble à une prise de pouvoir. Si Michel Garnier le dit devant l''équipe, ça devient une organisation. Ensuite, à Karim de la faire vivre.

**Claire** — On arrive vers la fin. Si vous deviez donner trois conseils à quelqu''un qui devient manager de ses collègues la semaine prochaine ?

**David** — Premier conseil : parlez-en, individuellement, avec chaque personne de l''équipe, dans les quinze premiers jours. Pas une grande réunion, des entretiens de vingt minutes. « Comment tu vois les choses, qu''est-ce qui marche, qu''est-ce qui ne marche pas, qu''est-ce que tu attends de moi. » Vous apprenez énormément, et vous montrez que le rôle a changé sans avoir à le dire.

**Claire** — Deuxième ?

**David** — Ne changez rien de structurel pendant un mois, mais réglez immédiatement ce qui est inacceptable. Les retards, les manques de sécurité, les manques de respect. Si vous laissez passer ça au début, vous avez perdu, parce que tout le monde regarde.

**Claire** — Et le troisième ?

**David** — Acceptez de ne plus être « l''un d''entre eux ». Ce n''est pas une perte. Vous n''êtes plus un collègue ; vous êtes la personne qui va leur permettre de bien travailler. Si vous faites bien ce travail, vous aurez quelque chose de mieux que l''amitié : la confiance.

**Claire** — Merci David. Pour résumer : la légitimité ne vient pas de la nomination mais de la constance et de l''équité ; les contestations se traitent en entretien, en donnant une place ; le manager traduit dans les deux sens sans choisir de camp ; et les quinze premiers jours servent à écouter chacun.

**David** — Et à régler tout de suite ce qui est inacceptable.

**Claire** — Et à régler tout de suite ce qui est inacceptable. À bientôt dans la suite du module.

## Sources
Linda A. Hill, *Becoming a Manager*, Harvard Business School Press (2003), sur la découverte du rôle par les nouveaux managers ; Mintzberg (1973), rôles d''agent de liaison et de porte-parole ; Kotter (1990), management vs leadership.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 2 and l.ordre = 5;
  n := n + 1;

  -- 1.6-responsabilites-legales.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'En devenant manager, vous changez de fonction, et vous prenez aussi votre part de responsabilité. En droit français, la plupart des obligations pèsent sur l''employeur, c''est-à-dire l''entreprise et son dirigeant. Mais le manager de proximité est celui qui les applique au quotidien, et il peut, dans certains cas, être personnellement mis en cause. Cette leçon décrit les six domaines que tout manager doit connaître.

Avertissement : cette leçon donne les repères essentiels, à jour au 11 octobre 2026. Elle ne remplace ni la convention collective de votre secteur, ni le règlement intérieur de votre entreprise, ni l''avis d''un juriste sur une situation précise. En cas de doute, la bonne réaction est toujours la même : alerter votre hiérarchie ou le service RH, par écrit.

## 1. La santé et la sécurité

C''est l''obligation la plus lourde. Selon l''article L4121-1 du Code du travail, « l''employeur prend les mesures nécessaires pour assurer la sécurité et protéger la santé physique et mentale des travailleurs ». Ces mesures comprennent la prévention des risques, l''information et la formation, et une organisation et des moyens adaptés. L''article L4121-2 fixe neuf principes généraux de prévention, parmi lesquels : éviter les risques, les évaluer, les combattre à la source, adapter le travail à la personne, donner la priorité à la protection collective, donner les instructions appropriées.

La santé mentale est explicitement incluse : les risques psychosociaux (stress, harcèlement, violence, épuisement) relèvent de la même obligation que les risques physiques.

Concrètement, vous êtes le relais de cette obligation dans votre équipe. Vous devez faire respecter les consignes de sécurité, arrêter un travail dangereux, signaler un risque que vous constatez, et ne jamais demander à quelqu''un d''accomplir une tâche pour laquelle il n''est ni formé ni équipé. À l''atelier Garnier, faire porter à Fatou une charge de plus de dix kilos malgré sa restriction médicale serait une faute.

Chaque salarié a de son côté une obligation de prendre soin de sa sécurité et de celle des autres (L4122-1), et un droit de retrait s''il a un motif raisonnable de penser qu''une situation présente un danger grave et imminent (L4131-1). Aucune sanction ni retenue sur salaire ne peut frapper un salarié qui a exercé ce droit de manière légitime (L4131-3).

Reste la question de votre responsabilité personnelle, qui passe d''abord par la délégation de pouvoirs. Le dirigeant peut déléguer à un salarié ses pouvoirs en matière de sécurité, et transférer ainsi sa responsabilité pénale, si ce salarié dispose de la compétence, de l''autorité et des moyens nécessaires (Cour de cassation, chambre criminelle, 11 mars 1993). Si vous recevez une délégation de pouvoirs, vous pouvez être poursuivi personnellement en cas d''accident lié à un manquement. Sans délégation, votre responsabilité pénale peut aussi être recherchée pour une faute personnelle (par exemple, imposer en connaissance de cause un travail dangereux), mais c''est d''abord l''employeur qui répond de l''obligation de sécurité. Si on vous demande d''en signer une, lisez-la, vérifiez que vous avez réellement l''autorité et les moyens qu''elle suppose, et demandez la formation correspondante.

## 2. Le harcèlement

Le harcèlement moral est défini à l''article L1152-1 : des agissements répétés qui ont pour objet ou pour effet une dégradation des conditions de travail susceptible de porter atteinte aux droits et à la dignité, d''altérer la santé physique ou mentale ou de compromettre l''avenir professionnel. Le harcèlement sexuel est défini à l''article L1153-1. Les deux sont aussi des délits (Code pénal, articles 222-33-2 et 222-33), punis de deux ans d''emprisonnement et 30 000 euros d''amende. Pour le harcèlement sexuel, la peine passe à trois ans et 45 000 euros notamment lorsque l''auteur abuse de l''autorité que lui confèrent ses fonctions, ce qui vise directement les personnes qui encadrent.

L''employeur a l''obligation de prévenir le harcèlement (L1152-4 et L1153-5) ; pour le harcèlement sexuel, la loi précise qu''il doit aussi y mettre un terme et le sanctionner. Les juges attendent de lui qu''il réagisse dès qu''il est informé de faits susceptibles d''en constituer.

Deux points pour le manager.

D''une part, vous pouvez être l''auteur. Le harcèlement moral managérial existe : critiques systématiques, humiliations en public, objectifs inatteignables, mise à l''écart, surveillance excessive. Des méthodes de gestion qui se répètent peuvent être qualifiées de harcèlement moral, même sans intention de nuire, dès lors qu''elles dégradent les conditions de travail (Cour de cassation, chambre sociale, 10 novembre 2009, n° 07-45.321). Réprimander vertement Julien devant toute l''équipe, comme l''a fait Michel Garnier, n''est pas du harcèlement s''il s''agit d''un fait isolé, puisque la loi parle d''agissements répétés ; si cela devient une habitude, cela peut le devenir.

D''autre part, vous êtes un maillon de la prévention. Si un salarié vous signale des faits de harcèlement, ou si vous en êtes témoin, vous devez agir : prendre le signalement au sérieux, ne pas minimiser, ne pas enquêter seul, et transmettre sans délai à votre hiérarchie ou aux RH. Rester inactif engage la responsabilité de l''entreprise, et peut vous être reproché. Notez qu''aucun salarié ne peut être sanctionné pour avoir, de bonne foi, relaté ou témoigné de faits de harcèlement moral (L1152-2) ; la même protection existe pour le harcèlement sexuel (L1153-3).

## 3. La discrimination et l''égalité de traitement

L''article L1132-1 interdit toute discrimination, directe ou indirecte, fondée sur une liste de critères : origine, sexe, mœurs, orientation sexuelle, identité de genre, âge, situation de famille, grossesse, caractéristiques génétiques, appartenance vraie ou supposée à une ethnie, une nation ou une prétendue race, opinions politiques, convictions religieuses, apparence physique, nom de famille, lieu de résidence, domiciliation bancaire, état de santé, perte d''autonomie, handicap, capacité à s''exprimer dans une langue autre que le français, particulière vulnérabilité économique, activités syndicales ou mutualistes, qualité de lanceur d''alerte, entre autres. La discrimination est également un délit (Code pénal, articles 225-1 et suivants).

Pour le manager, cela concerne toutes les décisions du quotidien : répartition des tâches, attribution des primes, choix des personnes formées, horaires, évaluation. Une décision doit toujours pouvoir être justifiée par des éléments objectifs liés au travail. En cas de litige, le salarié présente des éléments de fait qui laissent supposer une discrimination ; c''est ensuite à l''employeur de prouver que sa décision repose sur des éléments objectifs étrangers à toute discrimination (L1134-1). D''où l''importance de garder une trace des raisons de vos décisions.

Le handicap fait l''objet d''une obligation supplémentaire : l''employeur doit prendre les « mesures appropriées » pour permettre à un travailleur handicapé d''accéder à un emploi, de l''exercer et d''y progresser (L5213-6). Le refus de ces mesures peut constituer une discrimination. Nous y consacrerons une leçon complète au module 2.

## 4. Le temps de travail et le droit à la déconnexion

Le manager est souvent celui qui organise les horaires, valide les heures supplémentaires et sollicite les salariés en dehors du travail. Il doit connaître les limites légales (un accord collectif ou une autorisation de l''inspection du travail peut prévoir des dérogations, dans des limites fixées par la loi) :

- durée légale : 35 heures par semaine (L3121-27) ; au-delà, heures supplémentaires majorées ;
- durée maximale : 10 heures par jour (L3121-18), 48 heures sur une semaine et 44 heures en moyenne sur 12 semaines (L3121-20 et L3121-22) ;
- repos : 11 heures consécutives entre deux journées (L3131-1), 35 heures consécutives par semaine (L3132-2), 20 minutes de pause dès 6 heures de travail (L3121-16).

Le droit à la déconnexion (L2242-17) fait partie de la négociation obligatoire dans les entreprises qui ont des délégués syndicaux ; à défaut d''accord, l''employeur élabore une charte, après avis du CSE. Dans toutes les entreprises, les temps de repos s''imposent. Concrètement : un manager ne doit pas attendre de réponse à un message envoyé le soir ou le week-end, et doit lui-même s''abstenir de solliciter son équipe en dehors des horaires, sauf urgence réelle ou astreinte organisée.

Enfin, l''employeur doit décompter le temps de travail des salariés (L3171-2 et suivants). Un manager qui « ferme les yeux » sur des heures non déclarées expose l''entreprise à des rappels de salaire et à des sanctions, et le salarié à un risque pour sa santé. Karim, qui gère l''atelier le soir sans que ces heures soient comptées, est lui-même dans cette situation.

## 5. Le pouvoir disciplinaire et ses limites

Sanctionner un salarié (avertissement, mise à pied, mutation, licenciement) est un pouvoir de l''employeur, encadré par une procédure (L1331-1 et suivants, L1332-1 à L1332-3) : convocation, entretien préalable pour toute sanction ayant une incidence sur la présence, la fonction ou la rémunération, délai de réflexion, notification écrite et motivée. Aucune procédure disciplinaire ne peut être engagée plus de deux mois après que l''employeur a eu connaissance des faits, sauf poursuites pénales dans ce délai (L1332-4). Les sanctions pécuniaires sont interdites (L1331-2).

Pour le manager de proximité, cela veut dire que, sauf délégation expresse, vous ne prononcez pas de sanction. Votre rôle est en amont : recadrer, tracer les faits (date, nature, témoins, ce qui a été dit), alerter la hiérarchie si les faits se répètent. Un recadrage oral n''est pas une sanction disciplinaire ; un « avertissement » écrit, même informel, peut en être une. Dans ce cas, les mêmes faits ne pourront plus être sanctionnés une seconde fois, même si la direction voulait aller plus loin. Le module 5 traite en détail la différence entre recadrage et sanction.

## 6. La vie privée et les données des salariés

Le manager a accès à des informations personnelles : adresse, situation de famille, santé (arrêts de travail, restrictions), rémunération. Ces données sont protégées par le RGPD et par le Code du travail (L1121-1 : les restrictions aux libertés doivent être justifiées et proportionnées). Trois règles :

- ne collectez que ce dont vous avez besoin pour organiser le travail ;
- ne diffusez jamais une information de santé ou une situation personnelle, même « pour expliquer » une absence à l''équipe ;
- tout dispositif de contrôle de l''activité (badgeuse, géolocalisation, logiciel de suivi) doit avoir été porté à la connaissance des salariés avant sa mise en place (L1222-4).

Concernant Fatou : Karim doit organiser le travail en tenant compte de sa restriction de port de charge ; il n''a pas à expliquer à l''équipe pourquoi. « Fatou ne porte pas les pare-chocs, c''est organisé comme ça » suffit.

## Que faire en cas de doute

Face à une situation que vous ne savez pas qualifier, retenez trois réflexes :

- Protéger d''abord : si quelqu''un est en danger ou en souffrance, on agit avant de réfléchir au cadre.
- Tracer : notez les faits, les dates, les paroles exactes, les témoins. Un simple courriel à vous-même horodaté a de la valeur.
- Alerter par écrit votre hiérarchie ou les RH. Vous n''avez pas à tout résoudre seul ; vous avez à ne pas laisser passer.

Les interlocuteurs vers lesquels vous pouvez orienter un salarié : le médecin du travail (tenu au secret médical, que le salarié peut solliciter à tout moment), les représentants du personnel (CSE) quand il en existe, l''inspection du travail, le Défenseur des droits pour les discriminations.

## Le cas Garnier

Karim doit régler, dans l''ordre : ses propres heures non comptées ; la restriction de Fatou, qui doit être intégrée dans l''organisation des postes et non gérée « à la débrouille » ; les retards de Lucas, qui relèvent d''un recadrage tracé, et non d''une sanction qu''il n''a pas le pouvoir de prononcer ; et la façon dont Michel réprimande en public, qu''il devra aborder avec lui, non pour le contredire devant l''équipe, mais parce que l''employeur engage sa responsabilité.

## À retenir

- Santé et sécurité : obligation de l''employeur, appliquée par le manager ; attention à la délégation de pouvoirs.
- Harcèlement : vous pouvez en être l''auteur par un management répété sous pression ; vous devez transmettre tout signalement.
- Discrimination : toute décision doit être justifiable par des éléments objectifs et tracés.
- Temps de travail : 10 h/jour, 48 h/semaine, 11 h de repos ; ne sollicitez pas hors horaires.
- Sanction : ce n''est pas votre pouvoir, sauf délégation ; vous recadrez, tracez, alertez.
- Données personnelles : ne diffusez jamais une information de santé ou de vie privée.

## Sources

- Code du travail : L4121-1 à L4121-5, L4122-1, L4131-1, L4131-3 ; L1152-1 à L1152-4, L1153-1 à L1153-5 ; L1132-1, L1134-1, L5213-6 ; L3121-16, L3121-18, L3121-20, L3121-22, L3121-27, L3131-1, L3132-2, L3171-2, L2242-17 ; L1331-1 à L1332-4 ; L1121-1, L1222-4 — legifrance.gouv.fr.
- Code pénal : articles 222-33, 222-33-2, 225-1 à 225-4.
- Cour de cassation, chambre criminelle, 11 mars 1993, n° 91-80.958 (conditions de validité de la délégation de pouvoirs) ; chambre sociale, 10 novembre 2009, n° 07-45.321 (harcèlement moral et méthodes de gestion) ; chambre sociale, 25 novembre 2015, n° 14-24.444 (portée de l''obligation de sécurité).
- INRS, *Managers : agissez pour prévenir les risques psychosociaux*, collection « Les essentiels », inrs.fr.
- Service-public.gouv.fr, fiche F2354 « Harcèlement moral » ; Code du travail numérique, code.travail.gouv.fr.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'En devenant manager, vous changez de fonction, et vous prenez aussi votre part de responsabilité. En droit français, la plupart des obligations pèsent sur l''employeur, c''est-à-dire l''entreprise et son dirigeant. Mais le manager de proximité est celui qui les applique au quotidien, et il peut, dans certains cas, être personnellement mis en cause. Cette leçon décrit les six domaines que tout manager doit connaître.

Avertissement : cette leçon donne les repères essentiels, à jour au 11 octobre 2026. Elle ne remplace ni la convention collective de votre secteur, ni le règlement intérieur de votre entreprise, ni l''avis d''un juriste sur une situation précise. En cas de doute, la bonne réaction est toujours la même : alerter votre hiérarchie ou le service RH, par écrit.

## 1. La santé et la sécurité

C''est l''obligation la plus lourde. Selon l''article L4121-1 du Code du travail, « l''employeur prend les mesures nécessaires pour assurer la sécurité et protéger la santé physique et mentale des travailleurs ». Ces mesures comprennent la prévention des risques, l''information et la formation, et une organisation et des moyens adaptés. L''article L4121-2 fixe neuf principes généraux de prévention, parmi lesquels : éviter les risques, les évaluer, les combattre à la source, adapter le travail à la personne, donner la priorité à la protection collective, donner les instructions appropriées.

La santé mentale est explicitement incluse : les risques psychosociaux (stress, harcèlement, violence, épuisement) relèvent de la même obligation que les risques physiques.

Concrètement, vous êtes le relais de cette obligation dans votre équipe. Vous devez faire respecter les consignes de sécurité, arrêter un travail dangereux, signaler un risque que vous constatez, et ne jamais demander à quelqu''un d''accomplir une tâche pour laquelle il n''est ni formé ni équipé. À l''atelier Garnier, faire porter à Fatou une charge de plus de dix kilos malgré sa restriction médicale serait une faute.

Chaque salarié a de son côté une obligation de prendre soin de sa sécurité et de celle des autres (L4122-1), et un droit de retrait s''il a un motif raisonnable de penser qu''une situation présente un danger grave et imminent (L4131-1). Aucune sanction ni retenue sur salaire ne peut frapper un salarié qui a exercé ce droit de manière légitime (L4131-3).

Reste la question de votre responsabilité personnelle, qui passe d''abord par la délégation de pouvoirs. Le dirigeant peut déléguer à un salarié ses pouvoirs en matière de sécurité, et transférer ainsi sa responsabilité pénale, si ce salarié dispose de la compétence, de l''autorité et des moyens nécessaires (Cour de cassation, chambre criminelle, 11 mars 1993). Si vous recevez une délégation de pouvoirs, vous pouvez être poursuivi personnellement en cas d''accident lié à un manquement. Sans délégation, votre responsabilité pénale peut aussi être recherchée pour une faute personnelle (par exemple, imposer en connaissance de cause un travail dangereux), mais c''est d''abord l''employeur qui répond de l''obligation de sécurité. Si on vous demande d''en signer une, lisez-la, vérifiez que vous avez réellement l''autorité et les moyens qu''elle suppose, et demandez la formation correspondante.

## 2. Le harcèlement

Le harcèlement moral est défini à l''article L1152-1 : des agissements répétés qui ont pour objet ou pour effet une dégradation des conditions de travail susceptible de porter atteinte aux droits et à la dignité, d''altérer la santé physique ou mentale ou de compromettre l''avenir professionnel. Le harcèlement sexuel est défini à l''article L1153-1. Les deux sont aussi des délits (Code pénal, articles 222-33-2 et 222-33), punis de deux ans d''emprisonnement et 30 000 euros d''amende. Pour le harcèlement sexuel, la peine passe à trois ans et 45 000 euros notamment lorsque l''auteur abuse de l''autorité que lui confèrent ses fonctions, ce qui vise directement les personnes qui encadrent.

L''employeur a l''obligation de prévenir le harcèlement (L1152-4 et L1153-5) ; pour le harcèlement sexuel, la loi précise qu''il doit aussi y mettre un terme et le sanctionner. Les juges attendent de lui qu''il réagisse dès qu''il est informé de faits susceptibles d''en constituer.

Deux points pour le manager.

D''une part, vous pouvez être l''auteur. Le harcèlement moral managérial existe : critiques systématiques, humiliations en public, objectifs inatteignables, mise à l''écart, surveillance excessive. Des méthodes de gestion qui se répètent peuvent être qualifiées de harcèlement moral, même sans intention de nuire, dès lors qu''elles dégradent les conditions de travail (Cour de cassation, chambre sociale, 10 novembre 2009, n° 07-45.321). Réprimander vertement Julien devant toute l''équipe, comme l''a fait Michel Garnier, n''est pas du harcèlement s''il s''agit d''un fait isolé, puisque la loi parle d''agissements répétés ; si cela devient une habitude, cela peut le devenir.

D''autre part, vous êtes un maillon de la prévention. Si un salarié vous signale des faits de harcèlement, ou si vous en êtes témoin, vous devez agir : prendre le signalement au sérieux, ne pas minimiser, ne pas enquêter seul, et transmettre sans délai à votre hiérarchie ou aux RH. Rester inactif engage la responsabilité de l''entreprise, et peut vous être reproché. Notez qu''aucun salarié ne peut être sanctionné pour avoir, de bonne foi, relaté ou témoigné de faits de harcèlement moral (L1152-2) ; la même protection existe pour le harcèlement sexuel (L1153-3).

## 3. La discrimination et l''égalité de traitement

L''article L1132-1 interdit toute discrimination, directe ou indirecte, fondée sur une liste de critères : origine, sexe, mœurs, orientation sexuelle, identité de genre, âge, situation de famille, grossesse, caractéristiques génétiques, appartenance vraie ou supposée à une ethnie, une nation ou une prétendue race, opinions politiques, convictions religieuses, apparence physique, nom de famille, lieu de résidence, domiciliation bancaire, état de santé, perte d''autonomie, handicap, capacité à s''exprimer dans une langue autre que le français, particulière vulnérabilité économique, activités syndicales ou mutualistes, qualité de lanceur d''alerte, entre autres. La discrimination est également un délit (Code pénal, articles 225-1 et suivants).

Pour le manager, cela concerne toutes les décisions du quotidien : répartition des tâches, attribution des primes, choix des personnes formées, horaires, évaluation. Une décision doit toujours pouvoir être justifiée par des éléments objectifs liés au travail. En cas de litige, le salarié présente des éléments de fait qui laissent supposer une discrimination ; c''est ensuite à l''employeur de prouver que sa décision repose sur des éléments objectifs étrangers à toute discrimination (L1134-1). D''où l''importance de garder une trace des raisons de vos décisions.

Le handicap fait l''objet d''une obligation supplémentaire : l''employeur doit prendre les « mesures appropriées » pour permettre à un travailleur handicapé d''accéder à un emploi, de l''exercer et d''y progresser (L5213-6). Le refus de ces mesures peut constituer une discrimination. Nous y consacrerons une leçon complète au module 2.

## 4. Le temps de travail et le droit à la déconnexion

Le manager est souvent celui qui organise les horaires, valide les heures supplémentaires et sollicite les salariés en dehors du travail. Il doit connaître les limites légales (un accord collectif ou une autorisation de l''inspection du travail peut prévoir des dérogations, dans des limites fixées par la loi) :

- durée légale : 35 heures par semaine (L3121-27) ; au-delà, heures supplémentaires majorées ;
- durée maximale : 10 heures par jour (L3121-18), 48 heures sur une semaine et 44 heures en moyenne sur 12 semaines (L3121-20 et L3121-22) ;
- repos : 11 heures consécutives entre deux journées (L3131-1), 35 heures consécutives par semaine (L3132-2), 20 minutes de pause dès 6 heures de travail (L3121-16).

Le droit à la déconnexion (L2242-17) fait partie de la négociation obligatoire dans les entreprises qui ont des délégués syndicaux ; à défaut d''accord, l''employeur élabore une charte, après avis du CSE. Dans toutes les entreprises, les temps de repos s''imposent. Concrètement : un manager ne doit pas attendre de réponse à un message envoyé le soir ou le week-end, et doit lui-même s''abstenir de solliciter son équipe en dehors des horaires, sauf urgence réelle ou astreinte organisée.

Enfin, l''employeur doit décompter le temps de travail des salariés (L3171-2 et suivants). Un manager qui « ferme les yeux » sur des heures non déclarées expose l''entreprise à des rappels de salaire et à des sanctions, et le salarié à un risque pour sa santé. Karim, qui gère l''atelier le soir sans que ces heures soient comptées, est lui-même dans cette situation.

## 5. Le pouvoir disciplinaire et ses limites

Sanctionner un salarié (avertissement, mise à pied, mutation, licenciement) est un pouvoir de l''employeur, encadré par une procédure (L1331-1 et suivants, L1332-1 à L1332-3) : convocation, entretien préalable pour toute sanction ayant une incidence sur la présence, la fonction ou la rémunération, délai de réflexion, notification écrite et motivée. Aucune procédure disciplinaire ne peut être engagée plus de deux mois après que l''employeur a eu connaissance des faits, sauf poursuites pénales dans ce délai (L1332-4). Les sanctions pécuniaires sont interdites (L1331-2).

Pour le manager de proximité, cela veut dire que, sauf délégation expresse, vous ne prononcez pas de sanction. Votre rôle est en amont : recadrer, tracer les faits (date, nature, témoins, ce qui a été dit), alerter la hiérarchie si les faits se répètent. Un recadrage oral n''est pas une sanction disciplinaire ; un « avertissement » écrit, même informel, peut en être une. Dans ce cas, les mêmes faits ne pourront plus être sanctionnés une seconde fois, même si la direction voulait aller plus loin. Le module 5 traite en détail la différence entre recadrage et sanction.

## 6. La vie privée et les données des salariés

Le manager a accès à des informations personnelles : adresse, situation de famille, santé (arrêts de travail, restrictions), rémunération. Ces données sont protégées par le RGPD et par le Code du travail (L1121-1 : les restrictions aux libertés doivent être justifiées et proportionnées). Trois règles :

- ne collectez que ce dont vous avez besoin pour organiser le travail ;
- ne diffusez jamais une information de santé ou une situation personnelle, même « pour expliquer » une absence à l''équipe ;
- tout dispositif de contrôle de l''activité (badgeuse, géolocalisation, logiciel de suivi) doit avoir été porté à la connaissance des salariés avant sa mise en place (L1222-4).

Concernant Fatou : Karim doit organiser le travail en tenant compte de sa restriction de port de charge ; il n''a pas à expliquer à l''équipe pourquoi. « Fatou ne porte pas les pare-chocs, c''est organisé comme ça » suffit.

## Que faire en cas de doute

Face à une situation que vous ne savez pas qualifier, retenez trois réflexes :

- Protéger d''abord : si quelqu''un est en danger ou en souffrance, on agit avant de réfléchir au cadre.
- Tracer : notez les faits, les dates, les paroles exactes, les témoins. Un simple courriel à vous-même horodaté a de la valeur.
- Alerter par écrit votre hiérarchie ou les RH. Vous n''avez pas à tout résoudre seul ; vous avez à ne pas laisser passer.

Les interlocuteurs vers lesquels vous pouvez orienter un salarié : le médecin du travail (tenu au secret médical, que le salarié peut solliciter à tout moment), les représentants du personnel (CSE) quand il en existe, l''inspection du travail, le Défenseur des droits pour les discriminations.

## Le cas Garnier

Karim doit régler, dans l''ordre : ses propres heures non comptées ; la restriction de Fatou, qui doit être intégrée dans l''organisation des postes et non gérée « à la débrouille » ; les retards de Lucas, qui relèvent d''un recadrage tracé, et non d''une sanction qu''il n''a pas le pouvoir de prononcer ; et la façon dont Michel réprimande en public, qu''il devra aborder avec lui, non pour le contredire devant l''équipe, mais parce que l''employeur engage sa responsabilité.

## À retenir

- Santé et sécurité : obligation de l''employeur, appliquée par le manager ; attention à la délégation de pouvoirs.
- Harcèlement : vous pouvez en être l''auteur par un management répété sous pression ; vous devez transmettre tout signalement.
- Discrimination : toute décision doit être justifiable par des éléments objectifs et tracés.
- Temps de travail : 10 h/jour, 48 h/semaine, 11 h de repos ; ne sollicitez pas hors horaires.
- Sanction : ce n''est pas votre pouvoir, sauf délégation ; vous recadrez, tracez, alertez.
- Données personnelles : ne diffusez jamais une information de santé ou de vie privée.

## Sources

- Code du travail : L4121-1 à L4121-5, L4122-1, L4131-1, L4131-3 ; L1152-1 à L1152-4, L1153-1 à L1153-5 ; L1132-1, L1134-1, L5213-6 ; L3121-16, L3121-18, L3121-20, L3121-22, L3121-27, L3131-1, L3132-2, L3171-2, L2242-17 ; L1331-1 à L1332-4 ; L1121-1, L1222-4 — legifrance.gouv.fr.
- Code pénal : articles 222-33, 222-33-2, 225-1 à 225-4.
- Cour de cassation, chambre criminelle, 11 mars 1993, n° 91-80.958 (conditions de validité de la délégation de pouvoirs) ; chambre sociale, 10 novembre 2009, n° 07-45.321 (harcèlement moral et méthodes de gestion) ; chambre sociale, 25 novembre 2015, n° 14-24.444 (portée de l''obligation de sécurité).
- INRS, *Managers : agissez pour prévenir les risques psychosociaux*, collection « Les essentiels », inrs.fr.
- Service-public.gouv.fr, fiche F2354 « Harcèlement moral » ; Code du travail numérique, code.travail.gouv.fr.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 2 and l.ordre = 6;
  n := n + 1;

  -- 1.7-communication-avec-la-hierarchie.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Le manager de proximité est souvent le seul, dans une PME, à parler chaque jour à la fois avec ceux qui font le travail et avec ceux qui le décident. Presque toute l''information utile passe donc par lui, dans les deux sens. S''il n''organise pas ces échanges, c''est aussi ce qui l''use le plus vite.

Cette leçon traite des deux sens de cette communication : descendante (de la direction vers l''équipe) et ascendante (de l''équipe vers la direction). Elle correspond à la compétence 10 du référentiel « Animer une équipe de travail » : assurer la communication ascendante et descendante entre l''équipe et la hiérarchie.

## La communication descendante : relayer, pas répéter

Une décision de la direction arrive : nouveau logiciel, changement d''horaires, objectif revu à la hausse, refus d''une embauche. Votre travail est de la transmettre à l''équipe, et la manière compte autant que le message.

Première manière, à éviter : transférer. « La direction a décidé que… voilà, c''est comme ça. » Vous vous mettez hors jeu, vous laissez l''équipe seule face à une décision qu''elle n''a pas comprise, et vous perdez en crédibilité : un manager qui se contente de transmettre n''est plus qu''une boîte aux lettres.

Seconde manière : relayer, c''est-à-dire reprendre la décision à votre compte en expliquant à quoi elle sert. Pour cela, préparez quatre éléments :

- Le contexte : pourquoi cette décision, quel problème elle règle, quelles contraintes l''expliquent.
- Le contenu : ce qui change précisément, pour qui, à partir de quand.
- Les conséquences : ce que cela implique pour l''équipe, ce qui ne change pas.
- La suite : comment on va faire, ce que vous attendez de chacun, quand vous ferez le point.

Si vous n''êtes pas d''accord avec la décision, vous l''avez dit à votre hiérarchie avant, en entretien. Devant l''équipe, vous la portez. Vous pouvez reconnaître qu''elle est difficile, vous pouvez dire que vous avez exprimé des réserves ; vous ne pouvez pas dire « je suis contre, mais on n''a pas le choix ». Ce serait vous défausser, et l''équipe le sentirait.

Un cas particulier : quand vous ne connaissez pas les raisons de la décision. Ne les inventez pas. Dites que vous allez les demander, et faites-le. L''équipe préfère un « je ne sais pas, je me renseigne » à une explication improvisée qui sera démentie la semaine suivante.

## La communication ascendante : ce que votre hiérarchie attend

Votre responsable attend de vous de l''information, des alertes et des propositions. Il ne les obtiendra de façon fiable que si vous les organisez.

Premièrement, de l''information fiable sur l''activité : où en est-on, quels sont les résultats, quels sont les écarts. C''est le reporting. Il doit être régulier (un rythme convenu, hebdomadaire ou mensuel selon l''activité), court (une page, cinq chiffres, trois faits marquants) et honnête : les mauvaises nouvelles en premier, pas cachées en bas de page.

Deuxièmement, des alertes à temps. Un problème remonté tôt est un problème qu''on peut résoudre ; le même problème remonté trop tard est une crise. La règle : vous alertez dès que vous identifiez un risque que vous ne pouvez pas traiter seul, ou qui dépasse votre périmètre. Vous n''attendez pas d''être sûr, vous n''attendez pas d''avoir la solution.

Troisièmement, des propositions. Un manager qui ne remonte que des problèmes finit par n''être plus écouté. Un manager qui remonte des problèmes avec des options finit par obtenir des moyens. Pour chaque problème remonté, essayez d''apporter : ce que vous avez déjà fait, ce que vous proposez, ce dont vous avez besoin.

## Comment remonter un problème : la méthode en quatre temps

- Les faits : ce qui s''est passé, avec des chiffres et des dates, sans interprétation. « Trois reprises ce mois-ci sur des véhicules de flotte, contre une en moyenne les mois précédents. »
- L''impact : ce que cela coûte ou risque de coûter. « Le client Transports Ferrand a fait une réclamation écrite ; nous perdons environ six heures de main-d''œuvre par reprise. »
- L''analyse : ce que vous en comprenez. « Deux des trois reprises concernent la finition de Julien, qui n''est pas encore autonome sur cette étape et n''est pas contrôlé avant restitution. »
- La proposition : ce que vous comptez faire et ce que vous demandez. « Je mets en place un contrôle avant restitution dès lundi. J''ai besoin de votre accord pour que Thierry y consacre une demi-heure par jour. »

Ce déroulé se dit en trois minutes ou s''écrit en dix lignes, et il transforme une plainte en demande de décision.

## Dire non, poser ses limites

Il arrive que la hiérarchie demande quelque chose d''irréaliste : un délai impossible, un objectif sans les moyens, une tâche de plus pour une équipe déjà saturée. Les réflexes spontanés sont rarement les bons.

Dire oui et ne pas tenir : vous perdez votre crédibilité et vous épuisez l''équipe.

Dire non sans argument : vous passez pour quelqu''un qui n''a pas envie.

Ce qui marche mieux : « oui, à ces conditions » ou « non, et voici ce que je propose à la place ». Vous montrez que vous avez compris l''enjeu, vous chiffrez ce que la demande implique, et vous laissez la décision à qui elle appartient. « Livrer les huit véhicules vendredi est possible si nous décalons les deux particuliers à la semaine prochaine ; sinon, il faudrait deux jours d''intérim. Que préférez-vous ? »

Négocier avec sa hiérarchie consiste souvent à rendre visibles les conséquences d''une demande, plutôt qu''à la refuser en bloc.

## Protéger son équipe sans la couvrir

Défendre son équipe devant la direction est une partie du rôle. Mais il y a une différence entre protéger et couvrir.

Protéger : obtenir des moyens, du temps, de la reconnaissance ; refuser qu''un salarié soit réprimandé publiquement par un supérieur ; expliquer les contraintes réelles du terrain.

Couvrir : cacher une erreur, minimiser un incident, présenter une situation sous un jour meilleur qu''elle n''est. C''est toujours une mauvaise idée : la vérité finit par sortir, et c''est alors votre parole qui est mise en cause.

L''entretien de Karim avec Michel, après l''épisode de Julien réprimandé devant tout le monde, relève de la protection : « Je comprends que la reprise vous ait mis en colère, et j''ai mis en place un contrôle. Mais j''ai besoin que les remarques individuelles passent par moi, en privé. Sinon, je ne pourrai pas tenir mon rôle. » Karim ne critique pas Michel devant l''équipe : il lui fait, en tête-à-tête, une demande d''organisation.

## Organiser la relation avec son responsable

Ne laissez pas cette relation au hasard des couloirs. Trois pratiques :

- Un point régulier, à date fixe : 30 minutes par semaine les trois premiers mois, puis toutes les deux semaines. Ordre du jour stable : résultats, alertes, décisions à prendre, besoins.
- Un canal pour l''urgent, distinct du reste : ce qui ne peut pas attendre le point régulier passe par téléphone ou message, et uniquement cela.
- Une trace écrite des décisions : après chaque point, un courriel de trois lignes qui résume ce qui a été décidé. Cela n''a rien de méfiant et évite bien des « je n''avais pas compris ça ».

## Le cas Garnier

Le premier problème de Karim n''est pas Thierry, ni Sophie : c''est qu''il n''a jamais eu, avec Michel, la conversation qui définit son rôle. Il doit la provoquer, et arriver avec une proposition écrite :

- ce qu''il décide seul (planning quotidien, répartition des véhicules, contrôle qualité) ;
- ce qu''il décide avec Michel (priorités clients exceptionnelles, heures supplémentaires, achats) ;
- ce que Michel décide seul (embauches, sanctions, tarifs) ;
- le circuit des priorités : Sophie transmet les demandes à Karim, qui arbitre ; elle ne donne plus de consignes directes aux carrossiers ;
- le rythme du reporting : un point de 30 minutes chaque lundi matin, un tableau de bord hebdomadaire.

Puis il demande à Michel d''annoncer cette organisation lui-même à l''équipe. Karim la fera vivre ensuite.

## À retenir

- Vers l''équipe : relayer une décision avec son contexte, son contenu, ses conséquences et la suite ; ne jamais se défausser.
- Vers la hiérarchie : reporting régulier et honnête, alertes précoces, propositions.
- Remonter un problème : faits, impact, analyse, proposition.
- Dire « oui, à ces conditions » plutôt que oui sans tenir ou non sans argument.
- Protéger l''équipe, jamais la couvrir.
- Organiser la relation : point fixe, canal d''urgence, trace écrite.

## Sources

- Henry Mintzberg, *The Nature of Managerial Work*, Harper & Row, 1973 : rôles de diffuseur, de porte-parole et de négociateur.
- Linda A. Hill, *Becoming a Manager*, Harvard Business School Press, 2e éd., 2003 : la découverte des dépendances par les nouveaux managers.
- Roger Fisher, William Ury, *Getting to Yes*, Houghton Mifflin, 1981 (trad. fr. *Comment réussir une négociation*, Seuil) : négocier sur les intérêts plutôt que sur les positions.
- France Compétences, fiche RS7377 « Animer une équipe de travail » (CCI France), compétence 10 : francecompetences.fr/recherche/rs/7377.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Le manager de proximité est souvent le seul, dans une PME, à parler chaque jour à la fois avec ceux qui font le travail et avec ceux qui le décident. Presque toute l''information utile passe donc par lui, dans les deux sens. S''il n''organise pas ces échanges, c''est aussi ce qui l''use le plus vite.

Cette leçon traite des deux sens de cette communication : descendante (de la direction vers l''équipe) et ascendante (de l''équipe vers la direction). Elle correspond à la compétence 10 du référentiel « Animer une équipe de travail » : assurer la communication ascendante et descendante entre l''équipe et la hiérarchie.

## La communication descendante : relayer, pas répéter

Une décision de la direction arrive : nouveau logiciel, changement d''horaires, objectif revu à la hausse, refus d''une embauche. Votre travail est de la transmettre à l''équipe, et la manière compte autant que le message.

Première manière, à éviter : transférer. « La direction a décidé que… voilà, c''est comme ça. » Vous vous mettez hors jeu, vous laissez l''équipe seule face à une décision qu''elle n''a pas comprise, et vous perdez en crédibilité : un manager qui se contente de transmettre n''est plus qu''une boîte aux lettres.

Seconde manière : relayer, c''est-à-dire reprendre la décision à votre compte en expliquant à quoi elle sert. Pour cela, préparez quatre éléments :

- Le contexte : pourquoi cette décision, quel problème elle règle, quelles contraintes l''expliquent.
- Le contenu : ce qui change précisément, pour qui, à partir de quand.
- Les conséquences : ce que cela implique pour l''équipe, ce qui ne change pas.
- La suite : comment on va faire, ce que vous attendez de chacun, quand vous ferez le point.

Si vous n''êtes pas d''accord avec la décision, vous l''avez dit à votre hiérarchie avant, en entretien. Devant l''équipe, vous la portez. Vous pouvez reconnaître qu''elle est difficile, vous pouvez dire que vous avez exprimé des réserves ; vous ne pouvez pas dire « je suis contre, mais on n''a pas le choix ». Ce serait vous défausser, et l''équipe le sentirait.

Un cas particulier : quand vous ne connaissez pas les raisons de la décision. Ne les inventez pas. Dites que vous allez les demander, et faites-le. L''équipe préfère un « je ne sais pas, je me renseigne » à une explication improvisée qui sera démentie la semaine suivante.

## La communication ascendante : ce que votre hiérarchie attend

Votre responsable attend de vous de l''information, des alertes et des propositions. Il ne les obtiendra de façon fiable que si vous les organisez.

Premièrement, de l''information fiable sur l''activité : où en est-on, quels sont les résultats, quels sont les écarts. C''est le reporting. Il doit être régulier (un rythme convenu, hebdomadaire ou mensuel selon l''activité), court (une page, cinq chiffres, trois faits marquants) et honnête : les mauvaises nouvelles en premier, pas cachées en bas de page.

Deuxièmement, des alertes à temps. Un problème remonté tôt est un problème qu''on peut résoudre ; le même problème remonté trop tard est une crise. La règle : vous alertez dès que vous identifiez un risque que vous ne pouvez pas traiter seul, ou qui dépasse votre périmètre. Vous n''attendez pas d''être sûr, vous n''attendez pas d''avoir la solution.

Troisièmement, des propositions. Un manager qui ne remonte que des problèmes finit par n''être plus écouté. Un manager qui remonte des problèmes avec des options finit par obtenir des moyens. Pour chaque problème remonté, essayez d''apporter : ce que vous avez déjà fait, ce que vous proposez, ce dont vous avez besoin.

## Comment remonter un problème : la méthode en quatre temps

- Les faits : ce qui s''est passé, avec des chiffres et des dates, sans interprétation. « Trois reprises ce mois-ci sur des véhicules de flotte, contre une en moyenne les mois précédents. »
- L''impact : ce que cela coûte ou risque de coûter. « Le client Transports Ferrand a fait une réclamation écrite ; nous perdons environ six heures de main-d''œuvre par reprise. »
- L''analyse : ce que vous en comprenez. « Deux des trois reprises concernent la finition de Julien, qui n''est pas encore autonome sur cette étape et n''est pas contrôlé avant restitution. »
- La proposition : ce que vous comptez faire et ce que vous demandez. « Je mets en place un contrôle avant restitution dès lundi. J''ai besoin de votre accord pour que Thierry y consacre une demi-heure par jour. »

Ce déroulé se dit en trois minutes ou s''écrit en dix lignes, et il transforme une plainte en demande de décision.

## Dire non, poser ses limites

Il arrive que la hiérarchie demande quelque chose d''irréaliste : un délai impossible, un objectif sans les moyens, une tâche de plus pour une équipe déjà saturée. Les réflexes spontanés sont rarement les bons.

Dire oui et ne pas tenir : vous perdez votre crédibilité et vous épuisez l''équipe.

Dire non sans argument : vous passez pour quelqu''un qui n''a pas envie.

Ce qui marche mieux : « oui, à ces conditions » ou « non, et voici ce que je propose à la place ». Vous montrez que vous avez compris l''enjeu, vous chiffrez ce que la demande implique, et vous laissez la décision à qui elle appartient. « Livrer les huit véhicules vendredi est possible si nous décalons les deux particuliers à la semaine prochaine ; sinon, il faudrait deux jours d''intérim. Que préférez-vous ? »

Négocier avec sa hiérarchie consiste souvent à rendre visibles les conséquences d''une demande, plutôt qu''à la refuser en bloc.

## Protéger son équipe sans la couvrir

Défendre son équipe devant la direction est une partie du rôle. Mais il y a une différence entre protéger et couvrir.

Protéger : obtenir des moyens, du temps, de la reconnaissance ; refuser qu''un salarié soit réprimandé publiquement par un supérieur ; expliquer les contraintes réelles du terrain.

Couvrir : cacher une erreur, minimiser un incident, présenter une situation sous un jour meilleur qu''elle n''est. C''est toujours une mauvaise idée : la vérité finit par sortir, et c''est alors votre parole qui est mise en cause.

L''entretien de Karim avec Michel, après l''épisode de Julien réprimandé devant tout le monde, relève de la protection : « Je comprends que la reprise vous ait mis en colère, et j''ai mis en place un contrôle. Mais j''ai besoin que les remarques individuelles passent par moi, en privé. Sinon, je ne pourrai pas tenir mon rôle. » Karim ne critique pas Michel devant l''équipe : il lui fait, en tête-à-tête, une demande d''organisation.

## Organiser la relation avec son responsable

Ne laissez pas cette relation au hasard des couloirs. Trois pratiques :

- Un point régulier, à date fixe : 30 minutes par semaine les trois premiers mois, puis toutes les deux semaines. Ordre du jour stable : résultats, alertes, décisions à prendre, besoins.
- Un canal pour l''urgent, distinct du reste : ce qui ne peut pas attendre le point régulier passe par téléphone ou message, et uniquement cela.
- Une trace écrite des décisions : après chaque point, un courriel de trois lignes qui résume ce qui a été décidé. Cela n''a rien de méfiant et évite bien des « je n''avais pas compris ça ».

## Le cas Garnier

Le premier problème de Karim n''est pas Thierry, ni Sophie : c''est qu''il n''a jamais eu, avec Michel, la conversation qui définit son rôle. Il doit la provoquer, et arriver avec une proposition écrite :

- ce qu''il décide seul (planning quotidien, répartition des véhicules, contrôle qualité) ;
- ce qu''il décide avec Michel (priorités clients exceptionnelles, heures supplémentaires, achats) ;
- ce que Michel décide seul (embauches, sanctions, tarifs) ;
- le circuit des priorités : Sophie transmet les demandes à Karim, qui arbitre ; elle ne donne plus de consignes directes aux carrossiers ;
- le rythme du reporting : un point de 30 minutes chaque lundi matin, un tableau de bord hebdomadaire.

Puis il demande à Michel d''annoncer cette organisation lui-même à l''équipe. Karim la fera vivre ensuite.

## À retenir

- Vers l''équipe : relayer une décision avec son contexte, son contenu, ses conséquences et la suite ; ne jamais se défausser.
- Vers la hiérarchie : reporting régulier et honnête, alertes précoces, propositions.
- Remonter un problème : faits, impact, analyse, proposition.
- Dire « oui, à ces conditions » plutôt que oui sans tenir ou non sans argument.
- Protéger l''équipe, jamais la couvrir.
- Organiser la relation : point fixe, canal d''urgence, trace écrite.

## Sources

- Henry Mintzberg, *The Nature of Managerial Work*, Harper & Row, 1973 : rôles de diffuseur, de porte-parole et de négociateur.
- Linda A. Hill, *Becoming a Manager*, Harvard Business School Press, 2e éd., 2003 : la découverte des dépendances par les nouveaux managers.
- Roger Fisher, William Ury, *Getting to Yes*, Houghton Mifflin, 1981 (trad. fr. *Comment réussir une négociation*, Seuil) : négocier sur les intérêts plutôt que sur les positions.
- France Compétences, fiche RS7377 « Animer une équipe de travail » (CCI France), compétence 10 : francecompetences.fr/recherche/rs/7377.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 2 and l.ordre = 7;
  n := n + 1;

  -- 1.8-fiche-feuille-de-route-90-jours.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Cette fiche est un gabarit à remplir. Sur la plateforme, elle est proposée en PDF (à générer depuis ce contenu, mise en page IDEAFORMA, fond clair, encadrés à bordure noire). Le texte ci-dessous en est la source ; le texte d''accompagnement de la leçon figure en fin de fichier.

---

## MA FEUILLE DE ROUTE — 90 PREMIERS JOURS

Nom : ______________________ Poste : ______________________ Date de prise de poste : ____ / ____ / ______
Équipe : ______ personnes Mon responsable : ______________________

## Phase 1 — Jours 1 à 30 : comprendre

Objectif de la phase : connaître l''équipe, l''activité et les attentes avant de changer quoi que ce soit de structurel. Régler immédiatement ce qui est inacceptable (sécurité, respect, retards répétés).

Entretiens individuels de prise de contact (20 à 30 min chacun, dans les 15 premiers jours)

| Personne | Date | Ce qui marche selon elle | Ce qui ne marche pas | Ce qu''elle attend de moi |
|---|---|---|---|---|
| | | | | |
| | | | | |
| | | | | |
| | | | | |
| | | | | |
| | | | | |
| | | | | |
| | | | | |

Questions à poser à chacun : Comment vois-tu ton travail aujourd''hui ? Qu''est-ce qui te facilite la tâche, qu''est-ce qui te la complique ? Qu''est-ce que tu attends de moi ? Qu''est-ce qu''il ne faut surtout pas changer ?

Entretien de cadrage avec mon responsable (avant la fin de la semaine 2)

- Ce que je décide seul : ______________________________________________
- Ce que je décide avec lui / elle : ______________________________________
- Ce qu''il / elle décide seul(e) : _________________________________________
- Le circuit des priorités et des demandes : ________________________________
- Mon temps consacré au management (en % ou en heures) : ______________
- Rythme de nos points : ________________________________________________
- Les 3 résultats attendus de moi à 6 mois : 1. __________ 2. __________ 3. __________
- Annonce de cette organisation à l''équipe par mon responsable : date ____ / ____

Ce que j''observe (à compléter au fil des jours)

- Les 3 forces de l''équipe : ______________________________________________
- Les 3 dysfonctionnements les plus coûteux : _______________________________
- Les règles non écrites que j''ai repérées : _________________________________
- Ce qui est inacceptable et que j''ai réglé immédiatement : ____________________

## Phase 2 — Jours 31 à 60 : organiser

Objectif de la phase : clarifier les rôles, les règles et les indicateurs ; installer les rituels.

- Rôles et missions clarifiés (qui fait quoi) : fait le ____ / ____
- Règles de fonctionnement partagées avec l''équipe (horaires, priorités, qualité, sécurité) : fait le ____ / ____
- Tableau de bord : mes 5 indicateurs : 1. __________ 2. __________ 3. __________ 4. __________ 5. __________
- Rituel d''équipe mis en place (fréquence, durée, format) : ______________________
- Premier feedback individuel donné à chaque personne : ☐ oui ☐ non
- Mon style dominant (leçon 1.3) : __________ Les 2 styles que je travaille : __________ / __________
- Niveau d''autonomie de chacun sur ses tâches clés (leçon 1.4) : noté dans mon carnet ☐

## Phase 3 — Jours 61 à 90 : consolider

Objectif de la phase : vérifier que l''organisation tient sans moi, ajuster, préparer la suite.

- Ce qui fonctionne et que je conserve : ___________________________________
- Ce que j''ajuste : _____________________________________________________
- Première délégation significative confiée à : __________ sur : __________
- Point de bilan à 90 jours avec mon responsable : date ____ / ____ ; mes 3 messages : 1. __________ 2. __________ 3. __________
- Mes priorités pour les 3 mois suivants : 1. __________ 2. __________ 3. __________

## Mes garde-fous

- Je ne change rien de structurel avant le jour 30.
- Je règle immédiatement ce qui est inacceptable.
- Je traite tout le monde selon la même règle, anciens amis compris.
- Je remonte les problèmes avec des faits et une proposition.
- Je compte mes heures.

---

## Texte d''accompagnement de la leçon (à afficher au-dessus du PDF)

Cette feuille de route structure vos 90 premiers jours en trois phases : comprendre (jours 1 à 30), organiser (jours 31 à 60), consolider (jours 61 à 90). Elle reprend les enseignements du module : les entretiens de prise de contact et le cadrage avec votre responsable (podcast 1.5 et leçon 1.7), les styles de leadership (1.3 et 1.4), les garde-fous légaux (1.6).

Si vous êtes déjà en poste depuis longtemps, utilisez-la comme grille de relecture : quelles cases n''avez-vous jamais remplies ?

Si vous n''êtes pas encore en poste, remplissez-la pour le poste que vous visez, ou pour la situation de Karim à l''atelier Garnier : c''est un excellent exercice de préparation d''entretien d''embauche.

Imprimez-la ou recopiez les rubriques dans votre carnet de bord ; vous la compléterez au fil des modules.

L''idée de structurer la prise de poste sur 90 jours a été popularisée par Michael Watkins. Ses conseils (apprendre vite, négocier les attentes avec son responsable, obtenir de premiers résultats rapidement) s''adressent surtout à des cadres ; la version proposée ici est adaptée à un manager de proximité.

## Sources

- Michael D. Watkins, *The First 90 Days*, Harvard Business School Press, 2003 (éd. actualisée 2013).
- Linda A. Hill, *Becoming a Manager*, Harvard Business School Press, 2e éd., 2003.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Cette fiche est un gabarit à remplir. Sur la plateforme, elle est proposée en PDF (à générer depuis ce contenu, mise en page IDEAFORMA, fond clair, encadrés à bordure noire). Le texte ci-dessous en est la source ; le texte d''accompagnement de la leçon figure en fin de fichier.

---

## MA FEUILLE DE ROUTE — 90 PREMIERS JOURS

Nom : ______________________ Poste : ______________________ Date de prise de poste : ____ / ____ / ______
Équipe : ______ personnes Mon responsable : ______________________

## Phase 1 — Jours 1 à 30 : comprendre

Objectif de la phase : connaître l''équipe, l''activité et les attentes avant de changer quoi que ce soit de structurel. Régler immédiatement ce qui est inacceptable (sécurité, respect, retards répétés).

Entretiens individuels de prise de contact (20 à 30 min chacun, dans les 15 premiers jours)

| Personne | Date | Ce qui marche selon elle | Ce qui ne marche pas | Ce qu''elle attend de moi |
|---|---|---|---|---|
| | | | | |
| | | | | |
| | | | | |
| | | | | |
| | | | | |
| | | | | |
| | | | | |
| | | | | |

Questions à poser à chacun : Comment vois-tu ton travail aujourd''hui ? Qu''est-ce qui te facilite la tâche, qu''est-ce qui te la complique ? Qu''est-ce que tu attends de moi ? Qu''est-ce qu''il ne faut surtout pas changer ?

Entretien de cadrage avec mon responsable (avant la fin de la semaine 2)

- Ce que je décide seul : ______________________________________________
- Ce que je décide avec lui / elle : ______________________________________
- Ce qu''il / elle décide seul(e) : _________________________________________
- Le circuit des priorités et des demandes : ________________________________
- Mon temps consacré au management (en % ou en heures) : ______________
- Rythme de nos points : ________________________________________________
- Les 3 résultats attendus de moi à 6 mois : 1. __________ 2. __________ 3. __________
- Annonce de cette organisation à l''équipe par mon responsable : date ____ / ____

Ce que j''observe (à compléter au fil des jours)

- Les 3 forces de l''équipe : ______________________________________________
- Les 3 dysfonctionnements les plus coûteux : _______________________________
- Les règles non écrites que j''ai repérées : _________________________________
- Ce qui est inacceptable et que j''ai réglé immédiatement : ____________________

## Phase 2 — Jours 31 à 60 : organiser

Objectif de la phase : clarifier les rôles, les règles et les indicateurs ; installer les rituels.

- Rôles et missions clarifiés (qui fait quoi) : fait le ____ / ____
- Règles de fonctionnement partagées avec l''équipe (horaires, priorités, qualité, sécurité) : fait le ____ / ____
- Tableau de bord : mes 5 indicateurs : 1. __________ 2. __________ 3. __________ 4. __________ 5. __________
- Rituel d''équipe mis en place (fréquence, durée, format) : ______________________
- Premier feedback individuel donné à chaque personne : ☐ oui ☐ non
- Mon style dominant (leçon 1.3) : __________ Les 2 styles que je travaille : __________ / __________
- Niveau d''autonomie de chacun sur ses tâches clés (leçon 1.4) : noté dans mon carnet ☐

## Phase 3 — Jours 61 à 90 : consolider

Objectif de la phase : vérifier que l''organisation tient sans moi, ajuster, préparer la suite.

- Ce qui fonctionne et que je conserve : ___________________________________
- Ce que j''ajuste : _____________________________________________________
- Première délégation significative confiée à : __________ sur : __________
- Point de bilan à 90 jours avec mon responsable : date ____ / ____ ; mes 3 messages : 1. __________ 2. __________ 3. __________
- Mes priorités pour les 3 mois suivants : 1. __________ 2. __________ 3. __________

## Mes garde-fous

- Je ne change rien de structurel avant le jour 30.
- Je règle immédiatement ce qui est inacceptable.
- Je traite tout le monde selon la même règle, anciens amis compris.
- Je remonte les problèmes avec des faits et une proposition.
- Je compte mes heures.

---

## Texte d''accompagnement de la leçon (à afficher au-dessus du PDF)

Cette feuille de route structure vos 90 premiers jours en trois phases : comprendre (jours 1 à 30), organiser (jours 31 à 60), consolider (jours 61 à 90). Elle reprend les enseignements du module : les entretiens de prise de contact et le cadrage avec votre responsable (podcast 1.5 et leçon 1.7), les styles de leadership (1.3 et 1.4), les garde-fous légaux (1.6).

Si vous êtes déjà en poste depuis longtemps, utilisez-la comme grille de relecture : quelles cases n''avez-vous jamais remplies ?

Si vous n''êtes pas encore en poste, remplissez-la pour le poste que vous visez, ou pour la situation de Karim à l''atelier Garnier : c''est un excellent exercice de préparation d''entretien d''embauche.

Imprimez-la ou recopiez les rubriques dans votre carnet de bord ; vous la compléterez au fil des modules.

L''idée de structurer la prise de poste sur 90 jours a été popularisée par Michael Watkins. Ses conseils (apprendre vite, négocier les attentes avec son responsable, obtenir de premiers résultats rapidement) s''adressent surtout à des cadres ; la version proposée ici est adaptée à un manager de proximité.

## Sources

- Michael D. Watkins, *The First 90 Days*, Harvard Business School Press, 2003 (éd. actualisée 2013).
- Linda A. Hill, *Becoming a Manager*, Harvard Business School Press, 2e éd., 2003.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 2 and l.ordre = 8;
  n := n + 1;

  -- 1.9-carnet-application.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Vous avez vu ce qu''est le rôle du manager, les styles de leadership, comment les adapter, la question de la légitimité, vos responsabilités légales et la communication avec la hiérarchie. Il est temps de transposer à votre situation. Comptez 1 h 30 à 2 h, en plusieurs fois si nécessaire.

Écrivez vos réponses dans votre carnet de bord. Il n''y a pas de bonne réponse ; il y a des réponses sincères et argumentées. Personne ne les lira sans votre accord : elles vous serviront pour votre plan d''action du module 7.

Si vous n''encadrez pas d''équipe aujourd''hui, choisissez une équipe que vous connaissez bien (une équipe dont vous faites ou avez fait partie, ou l''atelier Garnier) et répondez du point de vue de son manager.

## Étape 1 — Mon équipe et mon rôle (20 min)

Décrivez votre équipe en une page : nombre de personnes, métiers, ancienneté, ce qu''elle produit, pour qui.

Puis répondez :

- Sur les cinq fonctions (planifier, organiser, animer, contrôler, développer), laquelle occupe le plus de mon temps ? Laquelle est la plus négligée ? Pourquoi ?
- Quelle part de mon temps est réellement consacrée au management ? Est-elle suffisante ? A-t-elle été négociée avec ma hiérarchie ?
- Dans quel piège de la prise de poste (rester dans la production, tout changer, ne rien changer, faire seul) suis-je le plus susceptible de tomber ?

## Étape 2 — Mon style et mes adaptations (25 min)

Reprenez l''autodiagnostic de la leçon 1.3 et notez la répartition estimée de vos six styles.

- Mon style dominant : lequel, et pourquoi il me vient naturellement (mon parcours, mon métier d''origine, ma personnalité).
- Les deux styles que je n''utilise presque jamais, et une situation récente où l''un d''eux aurait été plus efficace.

Puis, avec la grille du leadership situationnel (leçon 1.4), prenez trois personnes de votre équipe et, pour chacune, une tâche clé :

| Personne | Tâche | Compétence (faible/forte) | Engagement (faible/fort) | Niveau (A1-A4) | Style que j''utilise aujourd''hui | Style adapté |
|---|---|---|---|---|---|---|
| | | | | | | |
| | | | | | | |
| | | | | | | |

Où y a-t-il un écart entre le style que j''utilise et le style adapté ? Que vais-je changer, concrètement, dès la semaine prochaine ?

## Étape 3 — Ma légitimité (20 min)

- Sur quoi repose ma légitimité aujourd''hui : la position (j''ai été nommé), la fonction (je fais fonctionner l''équipe), l''influence (on me suit) ? Laquelle est la plus fragile ?
- Y a-t-il dans mon équipe une personne qui conteste, ouvertement ou non, ma légitimité ? Qu''est-ce qu''elle a peut-être besoin qu''on lui reconnaisse ? Quel entretien pourrais-je avoir avec elle, et avec quels trois messages ?
- Ai-je des relations privilégiées avec certaines personnes qui pourraient être perçues comme une inéquité ? Que dois-je ajuster ?

## Étape 4 — Mes responsabilités légales (20 min)

Parcourez les six domaines de la leçon 1.6 et répondez honnêtement :

- Sécurité : y a-t-il dans mon équipe un risque que je connais et que je n''ai pas signalé ou traité ? Ai-je une délégation de pouvoirs, et en connais-je le contenu ?
- Harcèlement et discrimination : y a-t-il un comportement, le mien ou celui d''un autre, qui me met mal à l''aise et que je laisse passer ?
- Temps de travail : mes heures et celles de mon équipe sont-elles comptées ? Est-ce que je sollicite des personnes en dehors des horaires ?
- Sanctions : ai-je déjà « sanctionné » quelqu''un sans en avoir le pouvoir, ou laissé une situation se répéter sans la tracer ?
- Données personnelles : ai-je déjà partagé une information de santé ou de vie privée d''un collaborateur ?

Notez une action corrective par domaine où vous avez répondu « oui » ou « je ne sais pas ».

## Étape 5 — Ma relation avec ma hiérarchie (20 min)

- Ai-je un point régulier avec mon responsable ? À quel rythme ? Avec quel ordre du jour ?
- Le périmètre de mes décisions est-il écrit quelque part ? Sinon, rédigez maintenant la proposition que vous lui feriez (ce que je décide seul / avec lui / ce qu''il décide seul / le circuit des priorités / le rythme de reporting).
- Le dernier problème que j''ai remonté : l''ai-je fait avec des faits, un impact, une analyse et une proposition ? Réécrivez-le dans cette structure.
- Une demande de ma hiérarchie que je juge irréaliste : quelle serait ma réponse « oui, à ces conditions » ?

## Étape 6 — Ma feuille de route (15 min)

Ouvrez la fiche outil de la leçon 1.8 et remplissez au minimum : la liste des entretiens de prise de contact (même si vous êtes en poste depuis longtemps : un « nouveau départ » se prépare de la même façon), le cadrage avec votre responsable, et vos garde-fous.

## Pour terminer

Relisez ce que vous avez écrit et notez, en trois lignes, la décision la plus importante que vous prenez à l''issue de ce module. Datez-la. Vous la retrouverez au module 7.

Vous pouvez maintenant passer au quiz du module 1.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Vous avez vu ce qu''est le rôle du manager, les styles de leadership, comment les adapter, la question de la légitimité, vos responsabilités légales et la communication avec la hiérarchie. Il est temps de transposer à votre situation. Comptez 1 h 30 à 2 h, en plusieurs fois si nécessaire.

Écrivez vos réponses dans votre carnet de bord. Il n''y a pas de bonne réponse ; il y a des réponses sincères et argumentées. Personne ne les lira sans votre accord : elles vous serviront pour votre plan d''action du module 7.

Si vous n''encadrez pas d''équipe aujourd''hui, choisissez une équipe que vous connaissez bien (une équipe dont vous faites ou avez fait partie, ou l''atelier Garnier) et répondez du point de vue de son manager.

## Étape 1 — Mon équipe et mon rôle (20 min)

Décrivez votre équipe en une page : nombre de personnes, métiers, ancienneté, ce qu''elle produit, pour qui.

Puis répondez :

- Sur les cinq fonctions (planifier, organiser, animer, contrôler, développer), laquelle occupe le plus de mon temps ? Laquelle est la plus négligée ? Pourquoi ?
- Quelle part de mon temps est réellement consacrée au management ? Est-elle suffisante ? A-t-elle été négociée avec ma hiérarchie ?
- Dans quel piège de la prise de poste (rester dans la production, tout changer, ne rien changer, faire seul) suis-je le plus susceptible de tomber ?

## Étape 2 — Mon style et mes adaptations (25 min)

Reprenez l''autodiagnostic de la leçon 1.3 et notez la répartition estimée de vos six styles.

- Mon style dominant : lequel, et pourquoi il me vient naturellement (mon parcours, mon métier d''origine, ma personnalité).
- Les deux styles que je n''utilise presque jamais, et une situation récente où l''un d''eux aurait été plus efficace.

Puis, avec la grille du leadership situationnel (leçon 1.4), prenez trois personnes de votre équipe et, pour chacune, une tâche clé :

| Personne | Tâche | Compétence (faible/forte) | Engagement (faible/fort) | Niveau (A1-A4) | Style que j''utilise aujourd''hui | Style adapté |
|---|---|---|---|---|---|---|
| | | | | | | |
| | | | | | | |
| | | | | | | |

Où y a-t-il un écart entre le style que j''utilise et le style adapté ? Que vais-je changer, concrètement, dès la semaine prochaine ?

## Étape 3 — Ma légitimité (20 min)

- Sur quoi repose ma légitimité aujourd''hui : la position (j''ai été nommé), la fonction (je fais fonctionner l''équipe), l''influence (on me suit) ? Laquelle est la plus fragile ?
- Y a-t-il dans mon équipe une personne qui conteste, ouvertement ou non, ma légitimité ? Qu''est-ce qu''elle a peut-être besoin qu''on lui reconnaisse ? Quel entretien pourrais-je avoir avec elle, et avec quels trois messages ?
- Ai-je des relations privilégiées avec certaines personnes qui pourraient être perçues comme une inéquité ? Que dois-je ajuster ?

## Étape 4 — Mes responsabilités légales (20 min)

Parcourez les six domaines de la leçon 1.6 et répondez honnêtement :

- Sécurité : y a-t-il dans mon équipe un risque que je connais et que je n''ai pas signalé ou traité ? Ai-je une délégation de pouvoirs, et en connais-je le contenu ?
- Harcèlement et discrimination : y a-t-il un comportement, le mien ou celui d''un autre, qui me met mal à l''aise et que je laisse passer ?
- Temps de travail : mes heures et celles de mon équipe sont-elles comptées ? Est-ce que je sollicite des personnes en dehors des horaires ?
- Sanctions : ai-je déjà « sanctionné » quelqu''un sans en avoir le pouvoir, ou laissé une situation se répéter sans la tracer ?
- Données personnelles : ai-je déjà partagé une information de santé ou de vie privée d''un collaborateur ?

Notez une action corrective par domaine où vous avez répondu « oui » ou « je ne sais pas ».

## Étape 5 — Ma relation avec ma hiérarchie (20 min)

- Ai-je un point régulier avec mon responsable ? À quel rythme ? Avec quel ordre du jour ?
- Le périmètre de mes décisions est-il écrit quelque part ? Sinon, rédigez maintenant la proposition que vous lui feriez (ce que je décide seul / avec lui / ce qu''il décide seul / le circuit des priorités / le rythme de reporting).
- Le dernier problème que j''ai remonté : l''ai-je fait avec des faits, un impact, une analyse et une proposition ? Réécrivez-le dans cette structure.
- Une demande de ma hiérarchie que je juge irréaliste : quelle serait ma réponse « oui, à ces conditions » ?

## Étape 6 — Ma feuille de route (15 min)

Ouvrez la fiche outil de la leçon 1.8 et remplissez au minimum : la liste des entretiens de prise de contact (même si vous êtes en poste depuis longtemps : un « nouveau départ » se prépare de la même façon), le cadrage avec votre responsable, et vos garde-fous.

## Pour terminer

Relisez ce que vous avez écrit et notez, en trois lignes, la décision la plus importante que vous prenez à l''issue de ce module. Datez-la. Vous la retrouverez au module 7.

Vous pouvez maintenant passer au quiz du module 1.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 2 and l.ordre = 9;
  n := n + 1;

  -- 2.1-video-strategie-objectifs.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Module 2 — Organiser et structurer le travail de l''équipe

Bienvenue dans le module 2. Le module 1 vous a situé dans votre rôle. Celui-ci vous donne la méthode pour organiser le travail : objectifs, compétences, répartition des rôles, délégation, priorités, tableau de bord, et prise en compte du handicap.

On commence par la question qui conditionne tout le reste : à quoi sert un objectif ?

## Pourquoi un objectif

Imaginez une équipe sans objectif. Chacun fait de son mieux, selon sa propre idée de ce qui compte. Le carrossier soigne la finition, la secrétaire répond vite aux clients, le mécanicien sécurise ses interventions. Tout le monde travaille, et pourtant les délais ne sont pas tenus, parce que personne n''a dit que le délai était la priorité.

Un objectif, c''est ce qui aligne les efforts. Il répond à trois questions : où allons-nous, comment saurons-nous que nous y sommes, et pour quand.

Les objectifs ne naissent pas dans l''équipe. Ils descendent d''une cascade.

Tout en haut, la stratégie de l''entreprise : ce que la direction veut obtenir cette année. Chez Garnier, Michel l''a dit : tenir les délais annoncés aux assurances, arrêter les reprises, ne plus dépendre de lui au quotidien.

Ensuite, les objectifs du service ou de l''atelier : la traduction de cette stratégie dans votre périmètre. Par exemple : 95 % des véhicules livrés à la date annoncée, au plus une reprise par mois.

Puis les objectifs de l''équipe : ce que vous vous engagez collectivement à faire pour y arriver. Par exemple : un contrôle qualité systématique avant restitution, un planning validé chaque veille au soir.

Et enfin, les objectifs individuels : la contribution de chacun. Julien : zéro défaut de finition sur le trimestre. Sophie : toutes les demandes clients transmises au chef d''atelier avant midi.

## Le rôle du manager dans la cascade

Votre rôle, c''est de faire la traduction entre le niveau du dessus et celui du dessous. Deux erreurs à éviter.

La première : transmettre l''objectif de l''entreprise tel quel. « Il faut tenir les délais. » C''est vrai, mais ça ne dit à personne quoi faire lundi matin. Un objectif que l''équipe ne peut pas relier à son travail concret ne change rien.

La seconde : fixer des objectifs d''équipe qui ne se rattachent à rien. « Ranger l''atelier » est peut-être utile, mais si personne ne voit le lien avec les délais ou la qualité, l''objectif sera vécu comme un caprice du chef.

Un bon objectif d''équipe, c''est un objectif dont chacun peut dire : je vois pourquoi on le fait, et je vois ce que j''y fais.

## Trois pièges

Trois pièges fréquents, que vous verrez dans la leçon suivante avec la méthode SMART.

Trop d''objectifs. Au-delà de trois à cinq objectifs pour une équipe, plus personne ne sait ce qui compte. La priorité se dilue.

Des objectifs qu''on ne mesure pas. « Améliorer la qualité » n''est pas un objectif, c''est un souhait. « Au plus une reprise par mois » est un objectif : à la fin du mois, on sait.

Des objectifs imposés sans explication. Un objectif accepté vaut dix fois un objectif subi. Cela ne veut pas dire que l''équipe choisit ses objectifs, mais qu''elle comprend d''où ils viennent et qu''elle a pu discuter des moyens.

## À l''atelier Garnier

À l''atelier Garnier, Karim va transformer les trois attentes de Michel en objectifs d''équipe pour le trimestre. Vous verrez comment dans les leçons suivantes, et vous ferez le même exercice pour votre équipe dans le carnet de bord.

À tout de suite pour la méthode.

## Sources
Peter F. Drucker, *The Practice of Management*, Harper & Row, 1954 (direction par objectifs) ; Edwin A. Locke et Gary P. Latham, *A Theory of Goal Setting and Task Performance*, Prentice Hall, 1990 (théorie de la fixation d''objectifs).
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Module 2 — Organiser et structurer le travail de l''équipe

Bienvenue dans le module 2. Le module 1 vous a situé dans votre rôle. Celui-ci vous donne la méthode pour organiser le travail : objectifs, compétences, répartition des rôles, délégation, priorités, tableau de bord, et prise en compte du handicap.

On commence par la question qui conditionne tout le reste : à quoi sert un objectif ?

## Pourquoi un objectif

Imaginez une équipe sans objectif. Chacun fait de son mieux, selon sa propre idée de ce qui compte. Le carrossier soigne la finition, la secrétaire répond vite aux clients, le mécanicien sécurise ses interventions. Tout le monde travaille, et pourtant les délais ne sont pas tenus, parce que personne n''a dit que le délai était la priorité.

Un objectif, c''est ce qui aligne les efforts. Il répond à trois questions : où allons-nous, comment saurons-nous que nous y sommes, et pour quand.

Les objectifs ne naissent pas dans l''équipe. Ils descendent d''une cascade.

Tout en haut, la stratégie de l''entreprise : ce que la direction veut obtenir cette année. Chez Garnier, Michel l''a dit : tenir les délais annoncés aux assurances, arrêter les reprises, ne plus dépendre de lui au quotidien.

Ensuite, les objectifs du service ou de l''atelier : la traduction de cette stratégie dans votre périmètre. Par exemple : 95 % des véhicules livrés à la date annoncée, au plus une reprise par mois.

Puis les objectifs de l''équipe : ce que vous vous engagez collectivement à faire pour y arriver. Par exemple : un contrôle qualité systématique avant restitution, un planning validé chaque veille au soir.

Et enfin, les objectifs individuels : la contribution de chacun. Julien : zéro défaut de finition sur le trimestre. Sophie : toutes les demandes clients transmises au chef d''atelier avant midi.

## Le rôle du manager dans la cascade

Votre rôle, c''est de faire la traduction entre le niveau du dessus et celui du dessous. Deux erreurs à éviter.

La première : transmettre l''objectif de l''entreprise tel quel. « Il faut tenir les délais. » C''est vrai, mais ça ne dit à personne quoi faire lundi matin. Un objectif que l''équipe ne peut pas relier à son travail concret ne change rien.

La seconde : fixer des objectifs d''équipe qui ne se rattachent à rien. « Ranger l''atelier » est peut-être utile, mais si personne ne voit le lien avec les délais ou la qualité, l''objectif sera vécu comme un caprice du chef.

Un bon objectif d''équipe, c''est un objectif dont chacun peut dire : je vois pourquoi on le fait, et je vois ce que j''y fais.

## Trois pièges

Trois pièges fréquents, que vous verrez dans la leçon suivante avec la méthode SMART.

Trop d''objectifs. Au-delà de trois à cinq objectifs pour une équipe, plus personne ne sait ce qui compte. La priorité se dilue.

Des objectifs qu''on ne mesure pas. « Améliorer la qualité » n''est pas un objectif, c''est un souhait. « Au plus une reprise par mois » est un objectif : à la fin du mois, on sait.

Des objectifs imposés sans explication. Un objectif accepté vaut dix fois un objectif subi. Cela ne veut pas dire que l''équipe choisit ses objectifs, mais qu''elle comprend d''où ils viennent et qu''elle a pu discuter des moyens.

## À l''atelier Garnier

À l''atelier Garnier, Karim va transformer les trois attentes de Michel en objectifs d''équipe pour le trimestre. Vous verrez comment dans les leçons suivantes, et vous ferez le même exercice pour votre équipe dans le carnet de bord.

À tout de suite pour la méthode.

## Sources
Peter F. Drucker, *The Practice of Management*, Harper & Row, 1954 (direction par objectifs) ; Edwin A. Locke et Gary P. Latham, *A Theory of Goal Setting and Task Performance*, Prentice Hall, 1990 (théorie de la fixation d''objectifs).
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 1;
  n := n + 1;

  -- 2.10-fiche-outils-organisation.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Trois gabarits à recopier ou à imprimer (PDF à générer, mise en page IDEAFORMA, fond clair). Remplissez-les pour votre équipe dans le carnet de bord du module.

---

## GABARIT 1 — Matrice de compétences

Échelle : 0 = ne sait pas · 1 = sait faire avec aide · 2 = sait faire seul au niveau attendu · 3 = sait faire et peut former ou contrôler.
Remplir avec les personnes (autoévaluation), puis confronter à votre observation. Entourer toute compétence détenue par une seule personne au niveau 2 ou 3 : c''est un risque.

| Activité / étape | Compétence | Personne 1 | Personne 2 | Personne 3 | Personne 4 | Personne 5 | Risque (1 seul ≥ 2) | Action (formation, binôme, recrutement) |
|---|---|---|---|---|---|---|---|---|
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| Transversal | Sécurité | | | | | | | |
| Transversal | Relation client | | | | | | | |
| Transversal | Outils numériques | | | | | | | |
| Transversal | Tutorat | | | | | | | |

Aménagements à prévoir (restrictions préconisées par le médecin du travail, sans mention du motif médical) : ____________________________

---

## GABARIT 2 — Matrice RACI

R = réalise · A = approuve / répond du résultat (un seul par ligne) · C = consulté avant · I = informé après.
Ne traiter que les activités où le flou pose problème.

| Activité ou décision | Rôle 1 | Rôle 2 | Rôle 3 | Rôle 4 | Rôle 5 | Contrôle : un seul A ? un R ? |
|---|---|---|---|---|---|---|
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |

Règles de fonctionnement qui en découlent (3 à 6 lignes, à afficher) :
1. ______________________________________________
2. ______________________________________________
3. ______________________________________________
4. ______________________________________________

---

## GABARIT 3 — Tableau de bord d''équipe

Cinq à sept indicateurs, issus des objectifs. Chaque objectif = un indicateur de résultat + un indicateur de moyens. Ajouter un garde-fou (heures supplémentaires, qualité, satisfaction).

Fiche de définition (une par indicateur) :

| Nom | Type (résultat / moyens / garde-fou) | Définition exacte | Formule | Source | Fréquence | Cible | Seuil d''alerte | Responsable de la mise à jour |
|---|---|---|---|---|---|---|---|---|
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |

Tableau de suivi (à afficher, mis à jour chaque semaine ou chaque mois) :

| Indicateur | Période précédente | Période en cours | Cible | Tendance | État (vert / orange / rouge) | Action décidée |
|---|---|---|---|---|---|---|
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |

Rituel : lecture en réunion d''équipe (3 min), analyse des écarts orange et rouge (10 min), une action décidée par écart, responsable et date.

---

## Texte d''accompagnement de la leçon

Ces trois gabarits sont les outils du module : la matrice de compétences (leçon 2.3), la matrice RACI (leçon 2.4) et le tableau de bord (leçon 2.7). Vous les remplirez pour votre équipe dans le carnet de bord (leçon 2.12), après avoir vu le cas pratique de l''atelier Garnier (leçon 2.11), qui montre les trois remplis.

Conseil : commencez petit. Une matrice de compétences sur une seule activité, un RACI sur trois décisions, un tableau de bord à quatre indicateurs. Un outil simple et utilisé vaut mieux qu''un outil complet abandonné.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Trois gabarits à recopier ou à imprimer (PDF à générer, mise en page IDEAFORMA, fond clair). Remplissez-les pour votre équipe dans le carnet de bord du module.

---

## GABARIT 1 — Matrice de compétences

Échelle : 0 = ne sait pas · 1 = sait faire avec aide · 2 = sait faire seul au niveau attendu · 3 = sait faire et peut former ou contrôler.
Remplir avec les personnes (autoévaluation), puis confronter à votre observation. Entourer toute compétence détenue par une seule personne au niveau 2 ou 3 : c''est un risque.

| Activité / étape | Compétence | Personne 1 | Personne 2 | Personne 3 | Personne 4 | Personne 5 | Risque (1 seul ≥ 2) | Action (formation, binôme, recrutement) |
|---|---|---|---|---|---|---|---|---|
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| Transversal | Sécurité | | | | | | | |
| Transversal | Relation client | | | | | | | |
| Transversal | Outils numériques | | | | | | | |
| Transversal | Tutorat | | | | | | | |

Aménagements à prévoir (restrictions préconisées par le médecin du travail, sans mention du motif médical) : ____________________________

---

## GABARIT 2 — Matrice RACI

R = réalise · A = approuve / répond du résultat (un seul par ligne) · C = consulté avant · I = informé après.
Ne traiter que les activités où le flou pose problème.

| Activité ou décision | Rôle 1 | Rôle 2 | Rôle 3 | Rôle 4 | Rôle 5 | Contrôle : un seul A ? un R ? |
|---|---|---|---|---|---|---|
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |

Règles de fonctionnement qui en découlent (3 à 6 lignes, à afficher) :
1. ______________________________________________
2. ______________________________________________
3. ______________________________________________
4. ______________________________________________

---

## GABARIT 3 — Tableau de bord d''équipe

Cinq à sept indicateurs, issus des objectifs. Chaque objectif = un indicateur de résultat + un indicateur de moyens. Ajouter un garde-fou (heures supplémentaires, qualité, satisfaction).

Fiche de définition (une par indicateur) :

| Nom | Type (résultat / moyens / garde-fou) | Définition exacte | Formule | Source | Fréquence | Cible | Seuil d''alerte | Responsable de la mise à jour |
|---|---|---|---|---|---|---|---|---|
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |
| | | | | | | | | |

Tableau de suivi (à afficher, mis à jour chaque semaine ou chaque mois) :

| Indicateur | Période précédente | Période en cours | Cible | Tendance | État (vert / orange / rouge) | Action décidée |
|---|---|---|---|---|---|---|
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |

Rituel : lecture en réunion d''équipe (3 min), analyse des écarts orange et rouge (10 min), une action décidée par écart, responsable et date.

---

## Texte d''accompagnement de la leçon

Ces trois gabarits sont les outils du module : la matrice de compétences (leçon 2.3), la matrice RACI (leçon 2.4) et le tableau de bord (leçon 2.7). Vous les remplirez pour votre équipe dans le carnet de bord (leçon 2.12), après avoir vu le cas pratique de l''atelier Garnier (leçon 2.11), qui montre les trois remplis.

Conseil : commencez petit. Une matrice de compétences sur une seule activité, un RACI sur trois décisions, un tableau de bord à quatre indicateurs. Un outil simple et utilisé vaut mieux qu''un outil complet abandonné.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 10;
  n := n + 1;

  -- 2.11-cas-pratique-organiser-garnier.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Ce cas pratique vous fait réaliser, sur l''atelier Garnier, les trois outils du module. Travaillez d''abord seul, par écrit, sans regarder le corrigé. Comptez 30 minutes. Puis comparez.

## Les données

Rappel de l''équipe : Michel (dirigeant), Sophie (administratif et clients), Karim (chef d''atelier, carrossier), Thierry (carrossier expérimenté), Nadia (peintre), Julien (carrossier, 18 mois), Lucas (apprenti carrossier), Fatou (préparatrice, restriction de port de charge à 10 kg), Marc (mécanicien).

L''activité principale : la réparation d''un véhicule de flotte, en onze étapes : réception et constat ; devis et échange avec l''expert ; commande des pièces ; démontage et préparation ; redressage et carrosserie ; mécanique liée au choc ; peinture ; finition et remontage ; contrôle qualité ; nettoyage et restitution ; facturation.

Ce que Karim a observé en trois semaines : les pièces sont commandées quand le carrossier en a besoin, donc en retard ; le contrôle qualité n''existe pas ; Sophie donne des priorités directement ; Marc n''est pas informé des interventions à prévoir ; Fatou demande de l''aide pour la manutention quand elle peut ; Lucas est en retard ; Julien a fait deux reprises.

Les objectifs du trimestre : 95 % de délais tenus, au plus une reprise par mois, un planning validé chaque soir sans Michel.

## Question 1 — Matrice de compétences

Pour les étapes suivantes, indiquez qui est, selon vous, au niveau 3 (peut former ou contrôler), au niveau 2 (autonome), au niveau 1 (avec aide) : devis et expert ; commande des pièces ; redressage et carrosserie ; peinture ; finition ; contrôle qualité ; mécanique liée au choc ; préparation des surfaces. Entourez les compétences portées par une seule personne.

## Question 2 — Matrice RACI

Construisez le RACI de cinq décisions : fixer les priorités du planning ; transmettre une demande client urgente ; commander les pièces ; valider la restitution d''un véhicule ; décider d''une reprise après réclamation client.

## Question 3 — Tableau de bord

Proposez six indicateurs (résultat, moyens, garde-fou) avec leur formule, leur fréquence et leur cible.

## Question 4 — Organisation

Rédigez en six lignes maximum les règles de fonctionnement que Karim affiche dans l''atelier.

---

## Corrigé commenté

Les réponses ci-dessous sont celles de Karim. D''autres choix restent défendables s''ils respectent les règles des leçons 2.3, 2.4 et 2.7 ; les commentaires indiquent ce qui ne l''est pas.

## Question 1 — Matrice de compétences

| Étape | Niveau 3 | Niveau 2 | Niveau 1 | Risque |
|---|---|---|---|---|
| Devis et expert | Michel | Sophie, Karim | — | Sophie seule au quotidien : Karim doit monter à 3 |
| Commande des pièces | Michel | — | Sophie | Michel seul : former Sophie (objectif : 2 sous 2 mois) |
| Redressage et carrosserie | Thierry, Karim | Julien | Lucas | Aucun |
| Peinture | Nadia | — | Julien (intéressé) | Nadia seule : binôme Julien sur 6 mois |
| Finition | Thierry, Karim | Nadia | Julien, Lucas | Julien à faire monter à 2 : c''est la cause des reprises |
| Contrôle qualité | Thierry | Karim | — | Compétence non exercée : à installer avec Thierry référent |
| Mécanique liée au choc | Marc | — | — | Marc seul : risque accepté à court terme, sous-traitance identifiée |
| Préparation des surfaces | Fatou | Julien, Lucas | — | Aménagement manutention à organiser (pas un problème de compétence) |

Ce qu''il faut voir : trois compétences portées par une seule personne (pièces, peinture, mécanique), une compétence qui existe mais n''est pas exercée (contrôle qualité), et une compétence à consolider (finition de Julien). Le plan de formation du trimestre découle directement de cette lecture. Une erreur fréquente : noter Fatou au niveau 1 en préparation à cause de sa restriction. Non : elle est au niveau 3 sur la compétence ; la restriction est une contrainte d''organisation, traitée à part.

## Question 2 — RACI

| Décision | Karim | Sophie | Michel | Thierry | Carrossiers | Marc |
|---|---|---|---|---|---|---|
| Fixer les priorités du planning | A/R | C | I | I | I | C |
| Transmettre une demande client urgente | I | A/R | I | — | — | — |
| Commander les pièces | I | R | A | C | C | C |
| Valider la restitution | A | I | I | R | I | — |
| Décider d''une reprise après réclamation | A | C | I | R | C | — |

Points de vigilance : un seul A par ligne. Sur les priorités, Sophie est consultée (elle connaît les engagements clients) mais ne décide plus. Sur la commande des pièces, Michel garde le A (engagement financier) mais Sophie réalise, avec une consultation systématique des carrossiers et de Marc au moment du devis : c''est ce qui supprime les attentes. Sur les reprises, Thierry réalise le diagnostic, Karim tranche : Michel est informé, il ne réprimande plus en direct.

## Question 3 — Tableau de bord

| Indicateur | Type | Formule | Fréquence | Cible |
|---|---|---|---|---|
| Délais tenus (flottes) | Résultat | Restitués à la date ÷ restitués | Mensuel | 95 % |
| Reprises | Résultat | Véhicules repris après restitution | Mensuel | ≤ 1 |
| Contrôles qualité réalisés | Moyens | Contrôlés ÷ restitués | Hebdo | 100 % |
| Plannings validés la veille à 17 h | Moyens | Jours validés ÷ jours ouvrés | Hebdo | 100 % |
| Jours d''attente pièces | Moyens | Jours d''immobilisation pour pièce manquante | Hebdo | 0 |
| Heures supplémentaires | Garde-fou | Heures sup. ÷ heures travaillées | Mensuel | < 5 % |

Toute proposition avec cinq à sept indicateurs, au moins deux de moyens et un garde-fou, chacun avec une formule et une cible, est correcte. Une proposition qui ne contient que des indicateurs de résultat (délais, reprises, chiffre d''affaires) est incomplète : elle ne permet pas d''agir dans la semaine.

## Question 4 — Règles de fonctionnement affichées

1. Les demandes clients passent par Sophie, qui les transmet à Karim avant midi. Personne ne donne de consigne directe aux carrossiers.
2. Le planning du lendemain est validé par Karim chaque jour à 17 h, après consultation de Marc et de Sophie.
3. Les pièces sont commandées par Sophie au moment du devis, sur la liste établie avec le carrossier.
4. Aucun véhicule ne sort sans contrôle qualité par Thierry (ou Karim en son absence). Une fiche de contrôle est signée.
5. La manutention des éléments lourds est assurée par Lucas et Julien, selon le planning.
6. Tout problème (retard, pièce, réclamation) est signalé à Karim le jour même ; on ne laisse pas traîner.

Ces règles tiennent sur une feuille A4. Elles sont annoncées par Michel en réunion d''équipe, puis affichées. Elles ne nomment aucun coupable ; elles décrivent une organisation.

## Ce que vous devez retenir de ce cas

Aucune des mesures de Karim ne consiste à « recadrer » quelqu''un. Les reprises de Julien, les consignes parallèles de Sophie, l''agacement de Marc, la fatigue de Karim lui-même : tout se traite par l''organisation. C''est la leçon centrale du module. Quand vous rencontrez un problème récurrent, cherchez d''abord la règle qui manque avant de chercher la personne qui a tort.

À vous, maintenant, dans le carnet de bord.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Ce cas pratique vous fait réaliser, sur l''atelier Garnier, les trois outils du module. Travaillez d''abord seul, par écrit, sans regarder le corrigé. Comptez 30 minutes. Puis comparez.

## Les données

Rappel de l''équipe : Michel (dirigeant), Sophie (administratif et clients), Karim (chef d''atelier, carrossier), Thierry (carrossier expérimenté), Nadia (peintre), Julien (carrossier, 18 mois), Lucas (apprenti carrossier), Fatou (préparatrice, restriction de port de charge à 10 kg), Marc (mécanicien).

L''activité principale : la réparation d''un véhicule de flotte, en onze étapes : réception et constat ; devis et échange avec l''expert ; commande des pièces ; démontage et préparation ; redressage et carrosserie ; mécanique liée au choc ; peinture ; finition et remontage ; contrôle qualité ; nettoyage et restitution ; facturation.

Ce que Karim a observé en trois semaines : les pièces sont commandées quand le carrossier en a besoin, donc en retard ; le contrôle qualité n''existe pas ; Sophie donne des priorités directement ; Marc n''est pas informé des interventions à prévoir ; Fatou demande de l''aide pour la manutention quand elle peut ; Lucas est en retard ; Julien a fait deux reprises.

Les objectifs du trimestre : 95 % de délais tenus, au plus une reprise par mois, un planning validé chaque soir sans Michel.

## Question 1 — Matrice de compétences

Pour les étapes suivantes, indiquez qui est, selon vous, au niveau 3 (peut former ou contrôler), au niveau 2 (autonome), au niveau 1 (avec aide) : devis et expert ; commande des pièces ; redressage et carrosserie ; peinture ; finition ; contrôle qualité ; mécanique liée au choc ; préparation des surfaces. Entourez les compétences portées par une seule personne.

## Question 2 — Matrice RACI

Construisez le RACI de cinq décisions : fixer les priorités du planning ; transmettre une demande client urgente ; commander les pièces ; valider la restitution d''un véhicule ; décider d''une reprise après réclamation client.

## Question 3 — Tableau de bord

Proposez six indicateurs (résultat, moyens, garde-fou) avec leur formule, leur fréquence et leur cible.

## Question 4 — Organisation

Rédigez en six lignes maximum les règles de fonctionnement que Karim affiche dans l''atelier.

---

## Corrigé commenté

Les réponses ci-dessous sont celles de Karim. D''autres choix restent défendables s''ils respectent les règles des leçons 2.3, 2.4 et 2.7 ; les commentaires indiquent ce qui ne l''est pas.

## Question 1 — Matrice de compétences

| Étape | Niveau 3 | Niveau 2 | Niveau 1 | Risque |
|---|---|---|---|---|
| Devis et expert | Michel | Sophie, Karim | — | Sophie seule au quotidien : Karim doit monter à 3 |
| Commande des pièces | Michel | — | Sophie | Michel seul : former Sophie (objectif : 2 sous 2 mois) |
| Redressage et carrosserie | Thierry, Karim | Julien | Lucas | Aucun |
| Peinture | Nadia | — | Julien (intéressé) | Nadia seule : binôme Julien sur 6 mois |
| Finition | Thierry, Karim | Nadia | Julien, Lucas | Julien à faire monter à 2 : c''est la cause des reprises |
| Contrôle qualité | Thierry | Karim | — | Compétence non exercée : à installer avec Thierry référent |
| Mécanique liée au choc | Marc | — | — | Marc seul : risque accepté à court terme, sous-traitance identifiée |
| Préparation des surfaces | Fatou | Julien, Lucas | — | Aménagement manutention à organiser (pas un problème de compétence) |

Ce qu''il faut voir : trois compétences portées par une seule personne (pièces, peinture, mécanique), une compétence qui existe mais n''est pas exercée (contrôle qualité), et une compétence à consolider (finition de Julien). Le plan de formation du trimestre découle directement de cette lecture. Une erreur fréquente : noter Fatou au niveau 1 en préparation à cause de sa restriction. Non : elle est au niveau 3 sur la compétence ; la restriction est une contrainte d''organisation, traitée à part.

## Question 2 — RACI

| Décision | Karim | Sophie | Michel | Thierry | Carrossiers | Marc |
|---|---|---|---|---|---|---|
| Fixer les priorités du planning | A/R | C | I | I | I | C |
| Transmettre une demande client urgente | I | A/R | I | — | — | — |
| Commander les pièces | I | R | A | C | C | C |
| Valider la restitution | A | I | I | R | I | — |
| Décider d''une reprise après réclamation | A | C | I | R | C | — |

Points de vigilance : un seul A par ligne. Sur les priorités, Sophie est consultée (elle connaît les engagements clients) mais ne décide plus. Sur la commande des pièces, Michel garde le A (engagement financier) mais Sophie réalise, avec une consultation systématique des carrossiers et de Marc au moment du devis : c''est ce qui supprime les attentes. Sur les reprises, Thierry réalise le diagnostic, Karim tranche : Michel est informé, il ne réprimande plus en direct.

## Question 3 — Tableau de bord

| Indicateur | Type | Formule | Fréquence | Cible |
|---|---|---|---|---|
| Délais tenus (flottes) | Résultat | Restitués à la date ÷ restitués | Mensuel | 95 % |
| Reprises | Résultat | Véhicules repris après restitution | Mensuel | ≤ 1 |
| Contrôles qualité réalisés | Moyens | Contrôlés ÷ restitués | Hebdo | 100 % |
| Plannings validés la veille à 17 h | Moyens | Jours validés ÷ jours ouvrés | Hebdo | 100 % |
| Jours d''attente pièces | Moyens | Jours d''immobilisation pour pièce manquante | Hebdo | 0 |
| Heures supplémentaires | Garde-fou | Heures sup. ÷ heures travaillées | Mensuel | < 5 % |

Toute proposition avec cinq à sept indicateurs, au moins deux de moyens et un garde-fou, chacun avec une formule et une cible, est correcte. Une proposition qui ne contient que des indicateurs de résultat (délais, reprises, chiffre d''affaires) est incomplète : elle ne permet pas d''agir dans la semaine.

## Question 4 — Règles de fonctionnement affichées

1. Les demandes clients passent par Sophie, qui les transmet à Karim avant midi. Personne ne donne de consigne directe aux carrossiers.
2. Le planning du lendemain est validé par Karim chaque jour à 17 h, après consultation de Marc et de Sophie.
3. Les pièces sont commandées par Sophie au moment du devis, sur la liste établie avec le carrossier.
4. Aucun véhicule ne sort sans contrôle qualité par Thierry (ou Karim en son absence). Une fiche de contrôle est signée.
5. La manutention des éléments lourds est assurée par Lucas et Julien, selon le planning.
6. Tout problème (retard, pièce, réclamation) est signalé à Karim le jour même ; on ne laisse pas traîner.

Ces règles tiennent sur une feuille A4. Elles sont annoncées par Michel en réunion d''équipe, puis affichées. Elles ne nomment aucun coupable ; elles décrivent une organisation.

## Ce que vous devez retenir de ce cas

Aucune des mesures de Karim ne consiste à « recadrer » quelqu''un. Les reprises de Julien, les consignes parallèles de Sophie, l''agacement de Marc, la fatigue de Karim lui-même : tout se traite par l''organisation. C''est la leçon centrale du module. Quand vous rencontrez un problème récurrent, cherchez d''abord la règle qui manque avant de chercher la personne qui a tort.

À vous, maintenant, dans le carnet de bord.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 11;
  n := n + 1;

  -- 2.12-carnet-application.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Vous avez vu comment fixer des objectifs, identifier les compétences, répartir les rôles, déléguer, prioriser, construire un tableau de bord et intégrer une situation de handicap dans l''organisation. À vous de le faire pour votre équipe. Comptez 1 h à 1 h 30. Utilisez les gabarits de la fiche outil (leçon 2.10).

Si vous n''encadrez pas d''équipe, travaillez sur une équipe que vous connaissez, ou refaites le cas Garnier en imaginant une variante (commerce, bureau, service) de votre choix.

## Étape 1 — Mes objectifs d''équipe (15 min)

- Quelles sont les trois attentes principales de ma hiérarchie (ou de mes clients) pour les six prochains mois ? Écrivez-les telles qu''elles vous ont été formulées.
- Traduisez-les en trois objectifs collectifs SMART. Pour chacun, notez l''indicateur qui dira s''il est atteint et le garde-fou associé.
- Pour deux personnes de l''équipe, écrivez un objectif individuel qui contribue à un objectif collectif. Comment allez-vous le leur présenter en entretien (contexte, proposition, discussion, ajustement, suivi) ?

## Étape 2 — Ma matrice de compétences (20 min)

- Choisissez l''activité principale de l''équipe et découpez-la en étapes (6 à 12).
- Remplissez le gabarit 1 : compétences par étape, niveau de chaque personne (0 à 3), tel que vous l''estimez aujourd''hui.
- Entourez les compétences portées par une seule personne. Quel est le risque le plus grave ? Quelle action (binôme, formation, recrutement) ?
- Une personne vous semble bloquée au niveau 1 depuis longtemps : est-ce un manque de formation, un mauvais poste, ou un manque de suivi de votre part ?
- Y a-t-il une restriction (médicale ou autre) que vous « gérez » sans l''avoir intégrée dans l''organisation ?

## Étape 3 — Mon RACI (15 min)

- Listez trois à cinq décisions ou activités où le « qui fait quoi » est flou, ou source de tension.
- Remplissez le gabarit 2. Vérifiez : un seul A par ligne, un R pour chaque activité.
- Quelle règle de fonctionnement en découle ? Écrivez-la en une phrase, comme si elle devait être affichée.

## Étape 4 — Ma délégation (10 min)

- Quelle tâche faites-vous encore vous-même alors que quelqu''un pourrait la faire ? Pourquoi ne l''avez-vous pas déléguée (manque de confiance, manque de temps pour former, peur que ce soit fait autrement) ?
- Rédigez le contrat de délégation : quoi, pourquoi, jusqu''où, avec quoi, quand le point. À quel niveau (1 à 5) ?
- Quelle délégation avez-vous reprise à la première difficulté ? Qu''auriez-vous pu faire à la place ?

## Étape 5 — Mes priorités et mon temps (10 min)

- Sur la semaine passée, estimez la part de votre temps dans chaque case de la matrice importance / urgence.
- Quelles sont les trois causes récurrentes de vos urgences ? Pour chacune, quelle action « importante, pas urgente » les supprimerait ?
- Quelles sont vos trois priorités pour demain ?

## Étape 6 — Mon tableau de bord (20 min)

- Remplissez le gabarit 3 : cinq à sept indicateurs issus de vos objectifs (résultat, moyens, garde-fou), avec formule, source, fréquence, cible, alerte, responsable.
- Quand et où sera-t-il regardé ? Avec qui ? Quelle sera la règle (une action par écart) ?
- Quel indicateur risque de « devenir l''objectif » et d''être manipulé ? Quel garde-fou l''empêche ?

## Pour terminer

Notez, datée, la décision d''organisation la plus importante que vous prenez à l''issue de ce module, et la date à laquelle vous l''annoncerez à l''équipe. Un changement d''organisation s''annonce en réunion, s''explique, s''affiche. Vous verrez comment conduire cette réunion au module 3.

Vous pouvez maintenant passer au quiz du module 2.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Vous avez vu comment fixer des objectifs, identifier les compétences, répartir les rôles, déléguer, prioriser, construire un tableau de bord et intégrer une situation de handicap dans l''organisation. À vous de le faire pour votre équipe. Comptez 1 h à 1 h 30. Utilisez les gabarits de la fiche outil (leçon 2.10).

Si vous n''encadrez pas d''équipe, travaillez sur une équipe que vous connaissez, ou refaites le cas Garnier en imaginant une variante (commerce, bureau, service) de votre choix.

## Étape 1 — Mes objectifs d''équipe (15 min)

- Quelles sont les trois attentes principales de ma hiérarchie (ou de mes clients) pour les six prochains mois ? Écrivez-les telles qu''elles vous ont été formulées.
- Traduisez-les en trois objectifs collectifs SMART. Pour chacun, notez l''indicateur qui dira s''il est atteint et le garde-fou associé.
- Pour deux personnes de l''équipe, écrivez un objectif individuel qui contribue à un objectif collectif. Comment allez-vous le leur présenter en entretien (contexte, proposition, discussion, ajustement, suivi) ?

## Étape 2 — Ma matrice de compétences (20 min)

- Choisissez l''activité principale de l''équipe et découpez-la en étapes (6 à 12).
- Remplissez le gabarit 1 : compétences par étape, niveau de chaque personne (0 à 3), tel que vous l''estimez aujourd''hui.
- Entourez les compétences portées par une seule personne. Quel est le risque le plus grave ? Quelle action (binôme, formation, recrutement) ?
- Une personne vous semble bloquée au niveau 1 depuis longtemps : est-ce un manque de formation, un mauvais poste, ou un manque de suivi de votre part ?
- Y a-t-il une restriction (médicale ou autre) que vous « gérez » sans l''avoir intégrée dans l''organisation ?

## Étape 3 — Mon RACI (15 min)

- Listez trois à cinq décisions ou activités où le « qui fait quoi » est flou, ou source de tension.
- Remplissez le gabarit 2. Vérifiez : un seul A par ligne, un R pour chaque activité.
- Quelle règle de fonctionnement en découle ? Écrivez-la en une phrase, comme si elle devait être affichée.

## Étape 4 — Ma délégation (10 min)

- Quelle tâche faites-vous encore vous-même alors que quelqu''un pourrait la faire ? Pourquoi ne l''avez-vous pas déléguée (manque de confiance, manque de temps pour former, peur que ce soit fait autrement) ?
- Rédigez le contrat de délégation : quoi, pourquoi, jusqu''où, avec quoi, quand le point. À quel niveau (1 à 5) ?
- Quelle délégation avez-vous reprise à la première difficulté ? Qu''auriez-vous pu faire à la place ?

## Étape 5 — Mes priorités et mon temps (10 min)

- Sur la semaine passée, estimez la part de votre temps dans chaque case de la matrice importance / urgence.
- Quelles sont les trois causes récurrentes de vos urgences ? Pour chacune, quelle action « importante, pas urgente » les supprimerait ?
- Quelles sont vos trois priorités pour demain ?

## Étape 6 — Mon tableau de bord (20 min)

- Remplissez le gabarit 3 : cinq à sept indicateurs issus de vos objectifs (résultat, moyens, garde-fou), avec formule, source, fréquence, cible, alerte, responsable.
- Quand et où sera-t-il regardé ? Avec qui ? Quelle sera la règle (une action par écart) ?
- Quel indicateur risque de « devenir l''objectif » et d''être manipulé ? Quel garde-fou l''empêche ?

## Pour terminer

Notez, datée, la décision d''organisation la plus importante que vous prenez à l''issue de ce module, et la date à laquelle vous l''annoncerez à l''équipe. Un changement d''organisation s''annonce en réunion, s''explique, s''affiche. Vous verrez comment conduire cette réunion au module 3.

Vous pouvez maintenant passer au quiz du module 2.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 12;
  n := n + 1;

  -- 2.13-quiz.json
  update public.lecons l set contenu = '{"questions": [{"id": "m2q01", "enonce": "Selon Locke et Latham, quel type d''objectif produit les meilleurs résultats ?", "options": ["Un objectif volontairement vague, pour laisser à chacun la liberté de faire de son mieux", "Un objectif facile à atteindre, pour ne décourager personne", "Un objectif fixé rapidement par le manager, sans explication, pour gagner du temps", "Un objectif précis et difficile, auquel la personne adhère, avec un suivi régulier"], "bonnes": [3], "explication": "Précision, difficulté acceptée, adhésion (obtenue surtout en expliquant l''objectif) et retour d''information régulier : ce sont les résultats de Locke et Latham présentés en leçon 2.2."}, {"id": "m2q02", "enonce": "Lequel de ces objectifs est correctement formulé selon la méthode SMART ?", "options": ["D''ici le 31 décembre, zéro reprise pour défaut de finition sur les véhicules de flotte", "Améliorer nettement la qualité des finitions de l''atelier", "Augmenter le nombre de contrôles qualité réalisés par l''équipe dans les prochains mois", "Devenir, d''ici quelques années, le meilleur atelier de la région pour les flottes d''entreprise"], "bonnes": [0], "explication": "Spécifique (défaut de finition, véhicules de flotte), mesurable (zéro reprise), pertinent (enjeu client) et daté (31 décembre). Les autres formulations n''ont ni mesure précise ni échéance."}, {"id": "m2q03", "enonce": "Dans quel ordre fixe-t-on les objectifs d''une équipe ?", "options": ["Les objectifs individuels d''abord, puis on additionne pour obtenir l''objectif collectif", "Le collectif d''abord, en réunion, puis l''individuel, en entretien", "Uniquement des objectifs individuels, pour que chacun se sente personnellement responsable", "Uniquement des objectifs collectifs, pour éviter les comparaisons"], "bonnes": [1], "explication": "Le collectif crée le sens et la solidarité ; l''individuel crée la responsabilité. Commencer par l''individuel donne une somme de contributions, pas une équipe."}, {"id": "m2q04", "enonce": "Dans une matrice de compétences, que signale une compétence détenue par une seule personne au niveau 2 ou 3 ?", "options": ["Que cette personne est indispensable et qu''il faut éviter de la changer de poste", "Que la compétence est secondaire, puisqu''une seule personne suffit", "Un point de fragilité : l''activité s''arrête si cette personne est absente", "Que la matrice est mal remplie et doit être refaite"], "bonnes": [2], "explication": "C''est un risque : il appelle un binôme, une formation ou un recrutement. Une organisation ne doit jamais reposer sur une seule personne."}, {"id": "m2q05", "enonce": "Dans une matrice RACI, combien de « A » (approuve / répond du résultat) doit-on trouver sur chaque ligne ?", "options": ["Exactement un", "Aucun obligatoirement : le A est facultatif", "Au moins deux, pour que la décision soit partagée", "Autant que de personnes qui réalisent le travail"], "bonnes": [0], "explication": "Un seul A par ligne. Deux A = un conflit en réserve ; aucun A = personne ne répond du résultat."}, {"id": "m2q06", "enonce": "Parmi ces éléments, lesquels se délèguent ? (plusieurs réponses)", "options": ["Le contrôle technique d''une production", "La formation d''un nouvel arrivant", "L''évaluation et le recadrage des personnes", "La relation avec un fournisseur"], "bonnes": [0, 1, 3], "explication": "L''exécution et l''expertise se délèguent. Le cœur du rôle de manager (objectifs, arbitrages, évaluation, recadrage, sanction, crise) ne se délègue pas."}, {"id": "m2q07", "enonce": "Vous confiez une mission à un collaborateur expert, en lui disant « décide et tiens-moi informé ». À quel niveau de délégation cela correspond-il ?", "options": ["Niveau 1 : exécuter une consigne précise sous contrôle", "Niveau 2 : organiser et faire valider avant la fin", "Niveau 4 : décider seul et rendre compte après", "Niveau 5 : décider sans rendre compte"], "bonnes": [2], "explication": "Le niveau 4 convient à une personne autonome sur la tâche. Rester au niveau 1 ou 2 avec un expert est vécu comme de la défiance."}, {"id": "m2q08", "enonce": "Dans la matrice importance / urgence, quelle case est celle où « se joue le management » et qui disparaît si on ne la planifie pas ?", "options": ["Important et urgent", "Important et pas urgent", "Pas important et urgent", "Pas important et pas urgent"], "bonnes": [1], "explication": "Fixer des objectifs, former, organiser, faire des entretiens : rien n''est urgent, tout est important. Négliger cette case fabrique les urgences de demain."}, {"id": "m2q09", "enonce": "Quelle est la différence entre un indicateur de résultat et un indicateur de moyens ?", "options": ["Le premier est exprimé en euros, le second en heures ou en nombre d''opérations réalisées", "Le premier se suit chaque mois, le second une fois par an", "Le premier concerne le manager, le second les membres de l''équipe", "Le premier mesure ce qu''on veut obtenir, le second ce qu''on fait pour y arriver"], "bonnes": [3], "explication": "L''indicateur de résultat dit si l''on a réussi, souvent trop tard pour corriger ; l''indicateur de moyens dit si l''on est sur la bonne voie, à temps pour ajuster. Un bon tableau de bord combine les deux."}, {"id": "m2q10", "enonce": "Le taux d''interventions à l''heure d''une agence grimpe rapidement, mais les intervenantes écourtent les prestations pour y parvenir. De quoi s''agit-il et que faire ?", "options": ["La loi de Goodhart : ajouter un garde-fou, ne plus juger les personnes sur ce chiffre", "Une réussite : l''indicateur progresse, l''objectif est donc atteint", "Une fraude qu''il faut sanctionner individuellement, intervenante par intervenante", "Un indicateur mal calculé par le logiciel de planning, qu''il suffit de faire corriger par l''éditeur"], "bonnes": [0], "explication": "Quand une mesure devient une cible et sert à juger, elle est optimisée au détriment du résultat réel. Dans le podcast 2.9, Sandrine ajoute un garde-fou (durée réelle des interventions) et cherche les causes plutôt que les coupables."}, {"id": "m2q11", "enonce": "Un collaborateur vous informe qu''il a une reconnaissance de la qualité de travailleur handicapé (RQTH) et une restriction de port de charge. Quelle est la bonne réaction ?", "options": ["Lui demander son diagnostic pour bien comprendre ses limites", "L''écarter d''office de toutes les tâches physiques pour le protéger, sans lui demander son avis", "Organiser le travail selon la restriction préconisée, sans divulguer le motif", "Expliquer sa situation médicale à l''équipe pour que l''aménagement soit accepté"], "bonnes": [2], "explication": "Le médecin du travail préconise, le manager organise à partir de la restriction. Le diagnostic ne vous regarde pas et ne se divulgue jamais. Écarter la personne sans son avis serait une discrimination, même bien intentionnée."}, {"id": "m2q12", "enonce": "Concernant l''aménagement raisonnable du poste d''un travailleur handicapé, quelle affirmation est exacte ?", "options": ["Il n''est obligatoire que dans les entreprises d''au moins 250 salariés", "Il est laissé à la libre appréciation du manager de proximité", "Il est à la charge du salarié, qui doit financer lui-même le matériel dont il a besoin", "Il s''impose à l''employeur, sauf charge disproportionnée"], "bonnes": [3], "explication": "Code du travail, art. L5213-6 : l''employeur prend les mesures appropriées, sauf charge disproportionnée compte tenu des aides (Agefiph) ; le refus peut constituer une discrimination. Le seuil de 250 salariés concerne la désignation d''un référent handicap, pas l''aménagement."}, {"id": "m2q13", "enonce": "Comment un objectif individuel se présente-t-il en entretien pour être accepté ?", "options": ["Contexte, proposition, discussion, ajustement, suivi", "Par e-mail, pour que la personne ait une trace écrite", "En réunion d''équipe, devant tout le monde, pour plus de transparence", "La personne le fixe seule, le manager le valide sans discuter"], "bonnes": [0], "explication": "Un objectif individuel se fixe en entretien. La discussion (« qu''est-ce qui pourrait t''empêcher d''y arriver ? ») et l''ajustement créent l''adhésion ; le suivi convenu fait partie de la conversation."}, {"id": "m2q14", "enonce": "Dans la matrice de compétences, que signifie le niveau 3 ?", "options": ["Ne sait pas faire", "Sait faire avec aide", "Sait faire seul, sans aide, au niveau de qualité attendu", "Sait faire et peut former ou contrôler les autres"], "bonnes": [3], "explication": "Échelle 0-3 : 0 ne sait pas, 1 avec aide, 2 autonome, 3 peut former ou contrôler. Les niveaux 3 sont les tuteurs et contrôleurs naturels de l''équipe."}, {"id": "m2q15", "enonce": "Dans une matrice RACI, quelle est la différence entre « C » et « I » ?", "options": ["C réalise le travail, I l''approuve", "C tranche en cas de désaccord, I exécute la décision", "C est consulté avant, I est informé après", "C et I sont équivalents : ils reçoivent la même information"], "bonnes": [2], "explication": "Consulté avant (son avis compte), informé après (il doit savoir). Marc, mécanicien, est consulté chaque veille sur le planning : c''est un C, pas un I."}, {"id": "m2q16", "enonce": "Qu''est-ce qui ne se délègue pas ? (plusieurs réponses)", "options": ["Le recadrage d''un membre de l''équipe", "La commande des pièces", "La responsabilité finale du résultat", "L''organisation d''un chantier"], "bonnes": [0, 2], "explication": "On délègue l''exécution et l''expertise (commande des pièces, organisation d''un chantier), avec l''autorité nécessaire. Le cœur du rôle de manager (objectifs, arbitrages, évaluation, recadrage, sanction) et la responsabilité finale restent au manager."}, {"id": "m2q17", "enonce": "Que contient un contrat de délégation ?", "options": ["La seule description de la tâche à faire", "Un avenant au contrat de travail, signé par le salarié et par la direction de l''entreprise", "La méthode détaillée à suivre, étape par étape", "Le résultat attendu, le pourquoi, le périmètre, les moyens, le point de suivi"], "bonnes": [3], "explication": "Quoi, pourquoi, jusqu''où, avec quoi, quand : sans le périmètre et le point de suivi, la délégation devient soit un abandon, soit une reprise en main permanente. La méthode, elle, est laissée à la personne."}, {"id": "m2q18", "enonce": "Dans le podcast sur le tableau de bord, Sandrine a d''abord construit un tableau de 25 colonnes qu''elle a abandonné en trois semaines. Quelle leçon en tire-t-elle ?", "options": ["Qu''il lui fallait un logiciel plus puissant pour suivre tous les chiffres", "Que le pilotage au ressenti était finalement suffisant", "Qu''il faut partir des objectifs et se limiter à six ou sept indicateurs", "Qu''il valait mieux confier le tableau de bord à sa directrice"], "bonnes": [2], "explication": "« Vingt-cinq chiffres, c''est comme zéro chiffre. » Le tableau de bord découle des objectifs : quelques indicateurs de résultat et de moyens, plus un garde-fou, pas un inventaire."}, {"id": "m2q19", "enonce": "Karim vise 95 % de délais tenus. Dans son tableau de bord, quel indicateur sert de garde-fou ?", "options": ["Le taux d''heures supplémentaires", "Le chiffre d''affaires du mois", "Le nombre de véhicules reçus à l''atelier", "La note de l''atelier sur les sites d''avis"], "bonnes": [0], "explication": "Dans le tableau de bord de Karim (leçon 2.7), les heures supplémentaires sont le garde-fou : des délais tenus au prix de 15 % d''heures supplémentaires sont achetés à crédit sur la santé de l''équipe."}, {"id": "m2q20", "enonce": "Une tâche est urgente mais peu importante (une demande de document sans enjeu, à rendre aujourd''hui). Que fait le manager selon la matrice importance / urgence ?", "options": ["Il la traite lui-même en priorité, avant tout le reste", "Il la délègue ou l''expédie, sans y mettre son énergie", "Il la reporte au mois prochain, quand l''activité de l''atelier sera plus calme", "Il la refuse systématiquement"], "bonnes": [1], "explication": "L''urgent non important se délègue ou s''expédie. Le piège est d''y consacrer le temps qui devait aller à l''important non urgent (organiser, former, anticiper)."}], "seuil": 70, "tentatives_max": 3, "corrections": true, "consigne": "20 questions. Une seule bonne réponse par question, sauf mention « plusieurs réponses ». Seuil de réussite : 70 %."}'::jsonb, publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 13;
  n := n + 1;

  -- 2.2-fixer-des-objectifs.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Fixer un objectif s''apprend. Les règles sont connues depuis la fin des années 1960 et ont été testées dans un grand nombre d''études. Cette leçon vous les donne, puis montre comment les appliquer sans tomber dans le formalisme.

## Ce que dit la recherche

Deux psychologues américains, Edwin Locke et Gary Latham, ont passé plus de trente ans sur une question : quels objectifs font mieux travailler ? Ils ont publié leur théorie en 1990, puis une synthèse en 2002 : l''effet des objectifs précis et difficiles y est observé sur plus d''une centaine de tâches différentes, auprès de plus de 40 000 participants, dans au moins huit pays. Quatre résultats concernent directement le manager.

Les objectifs précis produisent de meilleurs résultats que les objectifs vagues. La consigne « faites de votre mieux », qui paraît bienveillante, donne des performances nettement inférieures à un objectif chiffré.

Les objectifs difficiles produisent de meilleurs résultats que les objectifs faciles, à condition que la personne y adhère et se sente capable de les atteindre. Un objectif jugé hors de portée ne mobilise plus personne.

Le retour d''information renforce l''effet. Un objectif accompagné d''un suivi régulier fonctionne mieux qu''un objectif seul : sans savoir où l''on en est, on ne peut ni accélérer ni changer de méthode.

L''adhésion se gagne surtout par l''explication. Dans les études de Locke et Latham, un objectif fixé par le manager mais expliqué donne d''aussi bons résultats qu''un objectif fixé ensemble ; c''est l''objectif imposé sèchement, sans raison donnée, qui fait baisser la performance. La participation apporte autre chose : les personnes connaissent souvent mieux que vous les obstacles et les solutions.

## La méthode SMART

En 1981, George T. Doran, consultant, publie dans la *Management Review* un court article qui propose un moyen mnémotechnique : un objectif bien écrit est SMART. Chez Doran, les cinq lettres signifient *specific, measurable, assignable* (attribué à quelqu''un), *realistic, time-related*. Les versions qui circulent aujourd''hui, en France notamment, ont remplacé « attribué » par « atteignable » et souvent « réaliste » par « pertinent ». C''est cette version courante que nous retenons :

- Spécifique : il décrit un résultat précis, pas une intention. « Réduire les reprises » est vague ; « aucune reprise pour défaut de finition sur les véhicules de flotte » est spécifique.
- Mesurable : on sait, à la fin, s''il est atteint ou non, avec un chiffre ou un fait observable.
- Atteignable : difficile mais possible avec les moyens disponibles. Au-delà, l''objectif décourage au lieu de stimuler.
- Pertinent (ou réaliste selon les versions) : relié à un enjeu réel de l''entreprise, que la personne comprend.
- Temporel : daté. Sans échéance, un objectif reste un vœu.

Le « A » d''origine mérite d''être gardé en tête : un objectif sans responsable désigné n''avance pas. Doran lui-même précisait que tous les objectifs ne peuvent pas être chiffrés et qu''il ne faut pas forcer la mesure là où elle n''a pas de sens.

Exemple complet : « D''ici le 31 décembre, 95 % des véhicules de flotte sont restitués à la date annoncée à l''assureur, contre 78 % au dernier trimestre. »

SMART est un filtre, pas une formule magique. Un objectif peut cocher les cinq cases et rester mauvais s''il mesure la mauvaise chose. « 100 % des véhicules restitués à la date annoncée » est SMART ; si l''atelier l''atteint en annonçant des délais trois fois trop longs, il n''a rien gagné. C''est pourquoi les objectifs vont par paires : un objectif de résultat (délai tenu) et son garde-fou (délai annoncé conforme au barème).

## Objectifs collectifs et objectifs individuels

Un objectif collectif porte sur le résultat de l''équipe : le taux de délais tenus, le nombre de reprises, la satisfaction client. Il crée de la solidarité et du sens : chacun voit que sa contribution compte pour un résultat commun.

Un objectif individuel porte sur la contribution d''une personne : le zéro défaut de finition de Julien, la transmission des demandes par Sophie. Il crée de la responsabilité : on sait ce qu''on attend de soi.

Les deux sont nécessaires, et dans cet ordre. Fixez d''abord les objectifs collectifs, en réunion, avec l''équipe. Déclinez ensuite les objectifs individuels, en entretien, avec chacun. Un manager qui commence par les objectifs individuels obtient une somme de contributions qui ne forment pas une équipe.

Trois à cinq objectifs collectifs par trimestre ou par semestre, un à trois objectifs individuels par personne : au-delà, personne ne sait plus ce qui compte.

## Les OKR, version simple

La méthode OKR (*Objectives and Key Results*) est née chez Intel dans les années 1970, sous l''impulsion d''Andy Grove, puis a été diffusée chez Google à partir de 1999 par l''investisseur John Doerr. Elle est associée aux grandes entreprises technologiques, mais l''idée de départ sert aussi dans une équipe de neuf personnes.

L''objectif (O) est qualitatif et motivant : il dit où l''on va, en une phrase qu''on peut afficher. « Devenir l''atelier le plus fiable du département pour les flottes. »

Les résultats clés (KR) sont les deux ou trois mesures qui prouvent qu''on y est. « 95 % de délais tenus », « au plus une reprise par mois », « note de satisfaction assureur supérieure à 4,5 sur 5 ».

L''intérêt de cette forme : elle sépare le sens (l''objectif, qu''on retient) de la mesure (les résultats clés, qu''on suit), et elle évite les listes d''objectifs interchangeables que personne ne mémorise. Une précaution, que Doerr souligne lui-même : les OKR sont un outil de pilotage, pas une grille de calcul des primes. Dès qu''ils servent à fixer la rémunération, chacun propose des résultats clés faciles à atteindre.

## Fixer un objectif avec quelqu''un : la conversation

Un objectif individuel se fixe en entretien, pas par e-mail. La trame, en cinq minutes :

- Le contexte : rappeler l''objectif collectif et pourquoi il compte.
- La proposition : formuler l''objectif individuel, SMART.
- La discussion : « Qu''est-ce qui pourrait t''empêcher d''y arriver ? De quoi as-tu besoin ? » C''est là que l''objectif devient accepté.
- L''ajustement : modifier si l''obstacle est réel, pas si c''est un simple inconfort.
- Le suivi : convenir de quand et comment on fera le point.

Ce que vous ne devez pas faire : négocier l''objectif à la baisse pour éviter la discussion, ou l''imposer sans écouter. Dans les deux cas, vous perdez l''engagement.

## Les pièges classiques

- L''objectif d''activité déguisé en objectif de résultat. « Faire dix contrôles qualité par jour » est une activité ; « zéro défaut livré » est un résultat. Mesurez le résultat, laissez de la liberté sur l''activité.
- L''objectif qui dépend d''autrui. Si Marc ne peut tenir son délai que si Sophie lui transmet les informations à temps, l''objectif de Marc doit intégrer cette dépendance, ou Sophie doit avoir l''objectif correspondant.
- L''objectif oublié. Fixé en janvier, jamais évoqué avant décembre. Le tableau de bord (leçon 2.7) et les points réguliers existent pour cela.
- L''objectif punitif. Un objectif fixé pour prendre quelqu''un en défaut se voit, et détruit la confiance.

## Le cas Garnier

Karim traduit les attentes de Michel en trois objectifs collectifs pour le trimestre, présentés en réunion d''équipe :

- Délais : 95 % des véhicules de flotte restitués à la date annoncée (78 % actuellement).
- Qualité : au plus une reprise par mois, toutes causes confondues (trois ce mois-ci).
- Autonomie : un planning du lendemain validé chaque soir à 17 h, sans intervention de Michel.

Puis, en entretien individuel : Julien, zéro défaut de finition sur les véhicules de flotte, avec contrôle systématique par Thierry pendant six semaines ; Sophie, transmission de toutes les demandes clients à Karim avant midi, sans consigne directe aux carrossiers ; Marc, consulté chaque veille sur le planning, s''engage sur la durée de ses interventions et prévient Karim avant midi de tout dépassement qui menace une restitution. Thierry n''a pas d''objectif individuel de production : le sien porte sur le contrôle qualité des finitions et l''accompagnement de Julien, ce qui reconnaît son expertise.

## À retenir

- Précis, difficile mais accepté, suivi, compris : les quatre conditions d''un objectif efficace.
- SMART est un filtre : spécifique, mesurable, atteignable, pertinent, daté.
- Objectifs collectifs d''abord, en réunion ; individuels ensuite, en entretien.
- Trois à cinq objectifs collectifs, un à trois par personne.
- Mesurez des résultats, pas des activités ; associez à chaque objectif son garde-fou.

## Sources

- Edwin A. Locke, Gary P. Latham, *A Theory of Goal Setting and Task Performance*, Prentice Hall, 1990.
- Edwin A. Locke, Gary P. Latham, « Building a Practically Useful Theory of Goal Setting and Task Motivation: A 35-Year Odyssey », *American Psychologist*, vol. 57, n° 9, 2002, p. 705-717.
- George T. Doran, « There''s a S.M.A.R.T. way to write management''s goals and objectives », *Management Review*, vol. 70, n° 11, novembre 1981, p. 35-36.
- Peter F. Drucker, *The Practice of Management*, Harper & Row, 1954 (direction par objectifs).
- Andrew S. Grove, *High Output Management*, Random House, 1983.
- John Doerr, *Measure What Matters*, Portfolio/Penguin, 2018 (OKR).
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Fixer un objectif s''apprend. Les règles sont connues depuis la fin des années 1960 et ont été testées dans un grand nombre d''études. Cette leçon vous les donne, puis montre comment les appliquer sans tomber dans le formalisme.

## Ce que dit la recherche

Deux psychologues américains, Edwin Locke et Gary Latham, ont passé plus de trente ans sur une question : quels objectifs font mieux travailler ? Ils ont publié leur théorie en 1990, puis une synthèse en 2002 : l''effet des objectifs précis et difficiles y est observé sur plus d''une centaine de tâches différentes, auprès de plus de 40 000 participants, dans au moins huit pays. Quatre résultats concernent directement le manager.

Les objectifs précis produisent de meilleurs résultats que les objectifs vagues. La consigne « faites de votre mieux », qui paraît bienveillante, donne des performances nettement inférieures à un objectif chiffré.

Les objectifs difficiles produisent de meilleurs résultats que les objectifs faciles, à condition que la personne y adhère et se sente capable de les atteindre. Un objectif jugé hors de portée ne mobilise plus personne.

Le retour d''information renforce l''effet. Un objectif accompagné d''un suivi régulier fonctionne mieux qu''un objectif seul : sans savoir où l''on en est, on ne peut ni accélérer ni changer de méthode.

L''adhésion se gagne surtout par l''explication. Dans les études de Locke et Latham, un objectif fixé par le manager mais expliqué donne d''aussi bons résultats qu''un objectif fixé ensemble ; c''est l''objectif imposé sèchement, sans raison donnée, qui fait baisser la performance. La participation apporte autre chose : les personnes connaissent souvent mieux que vous les obstacles et les solutions.

## La méthode SMART

En 1981, George T. Doran, consultant, publie dans la *Management Review* un court article qui propose un moyen mnémotechnique : un objectif bien écrit est SMART. Chez Doran, les cinq lettres signifient *specific, measurable, assignable* (attribué à quelqu''un), *realistic, time-related*. Les versions qui circulent aujourd''hui, en France notamment, ont remplacé « attribué » par « atteignable » et souvent « réaliste » par « pertinent ». C''est cette version courante que nous retenons :

- Spécifique : il décrit un résultat précis, pas une intention. « Réduire les reprises » est vague ; « aucune reprise pour défaut de finition sur les véhicules de flotte » est spécifique.
- Mesurable : on sait, à la fin, s''il est atteint ou non, avec un chiffre ou un fait observable.
- Atteignable : difficile mais possible avec les moyens disponibles. Au-delà, l''objectif décourage au lieu de stimuler.
- Pertinent (ou réaliste selon les versions) : relié à un enjeu réel de l''entreprise, que la personne comprend.
- Temporel : daté. Sans échéance, un objectif reste un vœu.

Le « A » d''origine mérite d''être gardé en tête : un objectif sans responsable désigné n''avance pas. Doran lui-même précisait que tous les objectifs ne peuvent pas être chiffrés et qu''il ne faut pas forcer la mesure là où elle n''a pas de sens.

Exemple complet : « D''ici le 31 décembre, 95 % des véhicules de flotte sont restitués à la date annoncée à l''assureur, contre 78 % au dernier trimestre. »

SMART est un filtre, pas une formule magique. Un objectif peut cocher les cinq cases et rester mauvais s''il mesure la mauvaise chose. « 100 % des véhicules restitués à la date annoncée » est SMART ; si l''atelier l''atteint en annonçant des délais trois fois trop longs, il n''a rien gagné. C''est pourquoi les objectifs vont par paires : un objectif de résultat (délai tenu) et son garde-fou (délai annoncé conforme au barème).

## Objectifs collectifs et objectifs individuels

Un objectif collectif porte sur le résultat de l''équipe : le taux de délais tenus, le nombre de reprises, la satisfaction client. Il crée de la solidarité et du sens : chacun voit que sa contribution compte pour un résultat commun.

Un objectif individuel porte sur la contribution d''une personne : le zéro défaut de finition de Julien, la transmission des demandes par Sophie. Il crée de la responsabilité : on sait ce qu''on attend de soi.

Les deux sont nécessaires, et dans cet ordre. Fixez d''abord les objectifs collectifs, en réunion, avec l''équipe. Déclinez ensuite les objectifs individuels, en entretien, avec chacun. Un manager qui commence par les objectifs individuels obtient une somme de contributions qui ne forment pas une équipe.

Trois à cinq objectifs collectifs par trimestre ou par semestre, un à trois objectifs individuels par personne : au-delà, personne ne sait plus ce qui compte.

## Les OKR, version simple

La méthode OKR (*Objectives and Key Results*) est née chez Intel dans les années 1970, sous l''impulsion d''Andy Grove, puis a été diffusée chez Google à partir de 1999 par l''investisseur John Doerr. Elle est associée aux grandes entreprises technologiques, mais l''idée de départ sert aussi dans une équipe de neuf personnes.

L''objectif (O) est qualitatif et motivant : il dit où l''on va, en une phrase qu''on peut afficher. « Devenir l''atelier le plus fiable du département pour les flottes. »

Les résultats clés (KR) sont les deux ou trois mesures qui prouvent qu''on y est. « 95 % de délais tenus », « au plus une reprise par mois », « note de satisfaction assureur supérieure à 4,5 sur 5 ».

L''intérêt de cette forme : elle sépare le sens (l''objectif, qu''on retient) de la mesure (les résultats clés, qu''on suit), et elle évite les listes d''objectifs interchangeables que personne ne mémorise. Une précaution, que Doerr souligne lui-même : les OKR sont un outil de pilotage, pas une grille de calcul des primes. Dès qu''ils servent à fixer la rémunération, chacun propose des résultats clés faciles à atteindre.

## Fixer un objectif avec quelqu''un : la conversation

Un objectif individuel se fixe en entretien, pas par e-mail. La trame, en cinq minutes :

- Le contexte : rappeler l''objectif collectif et pourquoi il compte.
- La proposition : formuler l''objectif individuel, SMART.
- La discussion : « Qu''est-ce qui pourrait t''empêcher d''y arriver ? De quoi as-tu besoin ? » C''est là que l''objectif devient accepté.
- L''ajustement : modifier si l''obstacle est réel, pas si c''est un simple inconfort.
- Le suivi : convenir de quand et comment on fera le point.

Ce que vous ne devez pas faire : négocier l''objectif à la baisse pour éviter la discussion, ou l''imposer sans écouter. Dans les deux cas, vous perdez l''engagement.

## Les pièges classiques

- L''objectif d''activité déguisé en objectif de résultat. « Faire dix contrôles qualité par jour » est une activité ; « zéro défaut livré » est un résultat. Mesurez le résultat, laissez de la liberté sur l''activité.
- L''objectif qui dépend d''autrui. Si Marc ne peut tenir son délai que si Sophie lui transmet les informations à temps, l''objectif de Marc doit intégrer cette dépendance, ou Sophie doit avoir l''objectif correspondant.
- L''objectif oublié. Fixé en janvier, jamais évoqué avant décembre. Le tableau de bord (leçon 2.7) et les points réguliers existent pour cela.
- L''objectif punitif. Un objectif fixé pour prendre quelqu''un en défaut se voit, et détruit la confiance.

## Le cas Garnier

Karim traduit les attentes de Michel en trois objectifs collectifs pour le trimestre, présentés en réunion d''équipe :

- Délais : 95 % des véhicules de flotte restitués à la date annoncée (78 % actuellement).
- Qualité : au plus une reprise par mois, toutes causes confondues (trois ce mois-ci).
- Autonomie : un planning du lendemain validé chaque soir à 17 h, sans intervention de Michel.

Puis, en entretien individuel : Julien, zéro défaut de finition sur les véhicules de flotte, avec contrôle systématique par Thierry pendant six semaines ; Sophie, transmission de toutes les demandes clients à Karim avant midi, sans consigne directe aux carrossiers ; Marc, consulté chaque veille sur le planning, s''engage sur la durée de ses interventions et prévient Karim avant midi de tout dépassement qui menace une restitution. Thierry n''a pas d''objectif individuel de production : le sien porte sur le contrôle qualité des finitions et l''accompagnement de Julien, ce qui reconnaît son expertise.

## À retenir

- Précis, difficile mais accepté, suivi, compris : les quatre conditions d''un objectif efficace.
- SMART est un filtre : spécifique, mesurable, atteignable, pertinent, daté.
- Objectifs collectifs d''abord, en réunion ; individuels ensuite, en entretien.
- Trois à cinq objectifs collectifs, un à trois par personne.
- Mesurez des résultats, pas des activités ; associez à chaque objectif son garde-fou.

## Sources

- Edwin A. Locke, Gary P. Latham, *A Theory of Goal Setting and Task Performance*, Prentice Hall, 1990.
- Edwin A. Locke, Gary P. Latham, « Building a Practically Useful Theory of Goal Setting and Task Motivation: A 35-Year Odyssey », *American Psychologist*, vol. 57, n° 9, 2002, p. 705-717.
- George T. Doran, « There''s a S.M.A.R.T. way to write management''s goals and objectives », *Management Review*, vol. 70, n° 11, novembre 1981, p. 35-36.
- Peter F. Drucker, *The Practice of Management*, Harper & Row, 1954 (direction par objectifs).
- Andrew S. Grove, *High Output Management*, Random House, 1983.
- John Doerr, *Measure What Matters*, Portfolio/Penguin, 2018 (OKR).
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 2;
  n := n + 1;

  -- 2.3-identifier-les-competences.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Avant de répartir le travail, il faut savoir de quelles compétences l''activité a besoin, et lesquelles l''équipe possède. C''est la première compétence du référentiel RS7377 « Animer une équipe de travail » : identifier les compétences nécessaires à la réalisation d''une activité, d''un service ou d''un projet. Les managers de proximité la pratiquent peu, parce qu''ils « connaissent leur équipe ». Ils la connaissent souvent moins bien qu''ils ne le croient, surtout quand ils en viennent, comme Karim.

## Trois notions à distinguer

Une compétence est la capacité à réaliser une tâche dans une situation donnée, avec le niveau de qualité attendu. Elle combine des savoirs (connaître les étapes d''une mise en peinture), des savoir-faire (les exécuter) et des savoir-être (la rigueur nécessaire pour ne pas sauter une étape). Une compétence s''observe : elle se juge sur le résultat, pas sur le diplôme.

Un poste est un ensemble de tâches confiées à une personne. Il est décrit par une fiche de poste : missions, activités, compétences requises, rattachement, moyens.

Une activité est ce que l''équipe produit : réparer des véhicules de flotte, tenir l''accueil, assurer la mécanique liée aux chocs. Une activité mobilise plusieurs postes et plusieurs compétences.

L''erreur classique consiste à raisonner par personnes (« Thierry fait la carrosserie ») au lieu de raisonner par activité (« la réparation d''un véhicule de flotte demande dix compétences, qui les détient ? »). La seconde approche fait apparaître les trous.

La méthode se déroule en quatre étapes.

## 1. Décrire l''activité

Listez les activités de l''équipe, puis découpez chacune en étapes. Pour un véhicule de flotte à l''atelier Garnier : réception et constat, devis et échange avec l''expert, commande des pièces, démontage et préparation, redressage et carrosserie, mécanique liée au choc, peinture, finition et remontage, contrôle qualité, nettoyage et restitution, facturation.

Ce découpage sert déjà à quelque chose : il fait apparaître des étapes que personne ne considère comme un vrai travail (le contrôle qualité, la commande des pièces) et qui sont pourtant celles où les problèmes naissent.

## 2. Lister les compétences par étape

Pour chaque étape, notez ce qu''il faut savoir faire. Restez concret : « réaliser un devis sur le logiciel de chiffrage » plutôt que « maîtriser l''administratif ». Vous obtenez une liste de dix à trente compétences pour une petite équipe.

Ajoutez les compétences transversales qui ne sont rattachées à aucune étape mais dont l''activité dépend : sécurité, relation client, utilisation des outils numériques, tutorat des apprentis.

## 3. Construire la matrice de compétences

La matrice croise les compétences (en lignes) et les personnes (en colonnes). Dans chaque case, un niveau. Une échelle simple à quatre niveaux suffit :

- 0 : ne sait pas faire
- 1 : sait faire avec aide ou supervision
- 2 : sait faire seul, au niveau attendu
- 3 : sait faire et peut former ou contrôler les autres

Remplissez-la avec les personnes concernées, pas dans votre coin : demandez à chacun de s''autoévaluer, puis confrontez à votre observation. Les écarts entre les deux vous donneront matière pour l''entretien de suivi (module 3).

## 4. Lire la matrice

La matrice répond à quatre questions.

Où sont les risques ? Toute compétence détenue par une seule personne au niveau 2 ou 3 est un point de fragilité : le jour où elle est absente, l''activité s''arrête. Chez Garnier, la peinture (Nadia seule) et l''administratif client (Sophie seule) sont deux risques majeurs.

Où sont les besoins de formation ? Une compétence nécessaire à l''activité, avec personne au niveau 3 pour la transmettre, appelle une formation externe. Une compétence avec un seul niveau 3 appelle un binôme interne.

Qui peut évoluer ? Une personne qui accumule des niveaux 3 est un formateur interne potentiel, ou un futur adjoint. Une personne qui n''a que des 1 depuis longtemps pose une question : manque de formation, ou mauvais poste ?

Faut-il recruter ? Si une compétence indispensable manque durablement et ne peut pas s''acquérir en interne dans un délai raisonnable, la matrice donne l''argument objectif pour demander un recrutement.

## Handicap et compétences

Un point que l''on oublie : les compétences se jugent sur le résultat attendu, pas sur la manière de l''atteindre. Fatou, avec sa restriction de port de charge, est au niveau 3 en préparation des surfaces : elle maîtrise le travail et peut le transmettre, à condition que l''organisation prévoie une aide pour la manutention lourde. La matrice doit noter la compétence réelle et, à part, l''aménagement nécessaire. Nous y reviendrons dans la leçon sur le handicap (2.8).

## La fiche de poste

La matrice vous donne ce que l''activité demande ; la fiche de poste dit ce que vous attendez d''une personne. Une fiche de poste utile tient sur une page : intitulé, rattachement, finalité du poste en une phrase, activités principales, compétences requises (avec le niveau attendu), relations de travail, moyens, indicateurs de réussite.

Elle sert à recruter, à intégrer, à évaluer, et à éviter les « ce n''est pas mon travail ». Elle n''est pas un carcan : elle décrit le cœur du poste, pas chaque geste. Et elle se met à jour : une fiche de poste de 2019 décrit un poste de 2019.

Karim n''a pas de fiche de poste. C''est la première qu''il devrait écrire, avec Michel, puisqu''elle formalise le cadrage vu au module 1.

## Le cas Garnier

La matrice de l''atelier fait apparaître quatre constats. La peinture repose sur Nadia seule : Julien, déjà au niveau 1 et intéressé, pourrait atteindre le niveau 2 en six mois, en binôme avec elle. Le contrôle qualité final n''est au niveau 3 que chez Thierry, et personne ne le pratique : c''est une compétence à installer, avec Thierry comme référent. La commande de pièces n''est maîtrisée que par Michel : Sophie doit y être formée. Lucas est au niveau 1 presque partout (il est autonome en préparation des surfaces), ce qui est normal en deuxième année d''apprentissage, mais personne n''a formalisé sa progression attendue.

## À retenir

- Raisonnez par activité et par étape, pas par personne.
- Une compétence s''observe sur le résultat ; l''échelle 0-3 suffit.
- La matrice se remplit avec les personnes, pas contre elles.
- Elle révèle les risques (compétence portée par une seule personne), les besoins de formation, les potentiels et les recrutements nécessaires.
- La fiche de poste tient sur une page et se met à jour.

## Sources

- France Compétences, fiche RS7377 « Animer une équipe de travail » (certificateur CCI France), compétence 1 — francecompetences.fr.
- Guy Le Boterf, *Construire les compétences individuelles et collectives*, Éditions d''Organisation, 2000 ; 5e éd., Eyrolles, 2010.
- Code du travail, art. L6321-1 (obligation pour l''employeur d''assurer l''adaptation des salariés à leur poste de travail) — legifrance.gouv.fr.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Avant de répartir le travail, il faut savoir de quelles compétences l''activité a besoin, et lesquelles l''équipe possède. C''est la première compétence du référentiel RS7377 « Animer une équipe de travail » : identifier les compétences nécessaires à la réalisation d''une activité, d''un service ou d''un projet. Les managers de proximité la pratiquent peu, parce qu''ils « connaissent leur équipe ». Ils la connaissent souvent moins bien qu''ils ne le croient, surtout quand ils en viennent, comme Karim.

## Trois notions à distinguer

Une compétence est la capacité à réaliser une tâche dans une situation donnée, avec le niveau de qualité attendu. Elle combine des savoirs (connaître les étapes d''une mise en peinture), des savoir-faire (les exécuter) et des savoir-être (la rigueur nécessaire pour ne pas sauter une étape). Une compétence s''observe : elle se juge sur le résultat, pas sur le diplôme.

Un poste est un ensemble de tâches confiées à une personne. Il est décrit par une fiche de poste : missions, activités, compétences requises, rattachement, moyens.

Une activité est ce que l''équipe produit : réparer des véhicules de flotte, tenir l''accueil, assurer la mécanique liée aux chocs. Une activité mobilise plusieurs postes et plusieurs compétences.

L''erreur classique consiste à raisonner par personnes (« Thierry fait la carrosserie ») au lieu de raisonner par activité (« la réparation d''un véhicule de flotte demande dix compétences, qui les détient ? »). La seconde approche fait apparaître les trous.

La méthode se déroule en quatre étapes.

## 1. Décrire l''activité

Listez les activités de l''équipe, puis découpez chacune en étapes. Pour un véhicule de flotte à l''atelier Garnier : réception et constat, devis et échange avec l''expert, commande des pièces, démontage et préparation, redressage et carrosserie, mécanique liée au choc, peinture, finition et remontage, contrôle qualité, nettoyage et restitution, facturation.

Ce découpage sert déjà à quelque chose : il fait apparaître des étapes que personne ne considère comme un vrai travail (le contrôle qualité, la commande des pièces) et qui sont pourtant celles où les problèmes naissent.

## 2. Lister les compétences par étape

Pour chaque étape, notez ce qu''il faut savoir faire. Restez concret : « réaliser un devis sur le logiciel de chiffrage » plutôt que « maîtriser l''administratif ». Vous obtenez une liste de dix à trente compétences pour une petite équipe.

Ajoutez les compétences transversales qui ne sont rattachées à aucune étape mais dont l''activité dépend : sécurité, relation client, utilisation des outils numériques, tutorat des apprentis.

## 3. Construire la matrice de compétences

La matrice croise les compétences (en lignes) et les personnes (en colonnes). Dans chaque case, un niveau. Une échelle simple à quatre niveaux suffit :

- 0 : ne sait pas faire
- 1 : sait faire avec aide ou supervision
- 2 : sait faire seul, au niveau attendu
- 3 : sait faire et peut former ou contrôler les autres

Remplissez-la avec les personnes concernées, pas dans votre coin : demandez à chacun de s''autoévaluer, puis confrontez à votre observation. Les écarts entre les deux vous donneront matière pour l''entretien de suivi (module 3).

## 4. Lire la matrice

La matrice répond à quatre questions.

Où sont les risques ? Toute compétence détenue par une seule personne au niveau 2 ou 3 est un point de fragilité : le jour où elle est absente, l''activité s''arrête. Chez Garnier, la peinture (Nadia seule) et l''administratif client (Sophie seule) sont deux risques majeurs.

Où sont les besoins de formation ? Une compétence nécessaire à l''activité, avec personne au niveau 3 pour la transmettre, appelle une formation externe. Une compétence avec un seul niveau 3 appelle un binôme interne.

Qui peut évoluer ? Une personne qui accumule des niveaux 3 est un formateur interne potentiel, ou un futur adjoint. Une personne qui n''a que des 1 depuis longtemps pose une question : manque de formation, ou mauvais poste ?

Faut-il recruter ? Si une compétence indispensable manque durablement et ne peut pas s''acquérir en interne dans un délai raisonnable, la matrice donne l''argument objectif pour demander un recrutement.

## Handicap et compétences

Un point que l''on oublie : les compétences se jugent sur le résultat attendu, pas sur la manière de l''atteindre. Fatou, avec sa restriction de port de charge, est au niveau 3 en préparation des surfaces : elle maîtrise le travail et peut le transmettre, à condition que l''organisation prévoie une aide pour la manutention lourde. La matrice doit noter la compétence réelle et, à part, l''aménagement nécessaire. Nous y reviendrons dans la leçon sur le handicap (2.8).

## La fiche de poste

La matrice vous donne ce que l''activité demande ; la fiche de poste dit ce que vous attendez d''une personne. Une fiche de poste utile tient sur une page : intitulé, rattachement, finalité du poste en une phrase, activités principales, compétences requises (avec le niveau attendu), relations de travail, moyens, indicateurs de réussite.

Elle sert à recruter, à intégrer, à évaluer, et à éviter les « ce n''est pas mon travail ». Elle n''est pas un carcan : elle décrit le cœur du poste, pas chaque geste. Et elle se met à jour : une fiche de poste de 2019 décrit un poste de 2019.

Karim n''a pas de fiche de poste. C''est la première qu''il devrait écrire, avec Michel, puisqu''elle formalise le cadrage vu au module 1.

## Le cas Garnier

La matrice de l''atelier fait apparaître quatre constats. La peinture repose sur Nadia seule : Julien, déjà au niveau 1 et intéressé, pourrait atteindre le niveau 2 en six mois, en binôme avec elle. Le contrôle qualité final n''est au niveau 3 que chez Thierry, et personne ne le pratique : c''est une compétence à installer, avec Thierry comme référent. La commande de pièces n''est maîtrisée que par Michel : Sophie doit y être formée. Lucas est au niveau 1 presque partout (il est autonome en préparation des surfaces), ce qui est normal en deuxième année d''apprentissage, mais personne n''a formalisé sa progression attendue.

## À retenir

- Raisonnez par activité et par étape, pas par personne.
- Une compétence s''observe sur le résultat ; l''échelle 0-3 suffit.
- La matrice se remplit avec les personnes, pas contre elles.
- Elle révèle les risques (compétence portée par une seule personne), les besoins de formation, les potentiels et les recrutements nécessaires.
- La fiche de poste tient sur une page et se met à jour.

## Sources

- France Compétences, fiche RS7377 « Animer une équipe de travail » (certificateur CCI France), compétence 1 — francecompetences.fr.
- Guy Le Boterf, *Construire les compétences individuelles et collectives*, Éditions d''Organisation, 2000 ; 5e éd., Eyrolles, 2010.
- Code du travail, art. L6321-1 (obligation pour l''employeur d''assurer l''adaptation des salariés à leur poste de travail) — legifrance.gouv.fr.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 3;
  n := n + 1;

  -- 2.4-repartir-les-roles.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'La matrice de compétences dit ce que l''activité demande et qui sait le faire. Reste à organiser le travail : qui fait quoi, qui décide, qui est informé. C''est la compétence 2 du référentiel RS7377 : structurer l''activité de l''équipe de travail en répartissant les rôles et missions.

Une grande partie des tensions que vous rencontrerez en tant que manager viennent d''une répartition floue : deux personnes qui pensent être responsables de la même chose, ou une tâche dont personne ne se sent responsable. Ce sont des problèmes d''organisation, pas de personnes, et ils se règlent par l''organisation.

## Rôle, mission, tâche

Une tâche est une action concrète : commander un pare-chocs, vérifier une finition.

Une mission est un ensemble de tâches qui produisent un résultat dont quelqu''un est responsable : « garantir qu''aucun véhicule ne sort sans contrôle qualité ».

Un rôle est une fonction stable dans l''équipe, indépendante de la personne qui l''occupe : le référent qualité, le tuteur des apprentis, le responsable du planning.

Répartir le travail, ce n''est pas distribuer des tâches chaque matin. C''est attribuer des missions et des rôles, puis laisser chacun organiser ses tâches dans ce cadre. Un manager qui distribue des tâches crée de la dépendance ; un manager qui attribue des missions crée de la responsabilité.

## La matrice RACI

Pour clarifier qui fait quoi sur une activité, l''outil de référence est la matrice RACI. On liste les activités ou les décisions en lignes, les personnes ou les rôles en colonnes, et l''on place dans chaque case une lettre :

- R, réalise : la personne qui fait le travail. Il peut y en avoir plusieurs.
- A, approuve (ou « accountable », responsable) : la personne qui répond du résultat et tranche. Une seule par ligne, toujours.
- C, consulté : la personne dont on prend l''avis avant de faire.
- I, informé : la personne que l''on tient au courant après.

Exemple à l''atelier Garnier, sur quatre activités où le flou crée des tensions :

| Activité | Karim | Sophie | Michel | Carrossiers | Marc |
|---|---|---|---|---|---|
| Fixer les priorités du planning | A / R | C | I | I | C |
| Transmettre une demande client urgente | I | A / R | I | — | — |
| Valider une reprise | A | I | I | R | — |
| Commander les pièces | I | R | A | C | C |

Trois règles de lecture. Chaque ligne a exactement un A : s''il y en a deux, vous avez un conflit en réserve ; s''il n''y en a aucun, vous avez un trou. Un R sans A est un travail que personne ne valide. Une colonne pleine de C et de I sans R ni A désigne une personne qui assiste à tout et ne fait rien : soit elle est mal utilisée, soit elle est de trop dans le circuit.

Une matrice RACI se construit avec les personnes concernées, en réunion, sur une heure. Elle se limite aux activités où le flou fait mal : inutile de « racifier » toute l''entreprise.

## Répartir équitablement

Une fois les rôles clairs, il reste la question de la charge : qui fait combien. L''équité ne signifie pas que tout le monde fait la même chose, mais que la répartition est explicable et acceptée. Quatre critères, à combiner :

- Les compétences : la matrice de la leçon précédente. On confie le travail à qui sait le faire, et l''on organise l''apprentissage pour le reste.
- La charge réelle : mesurée, pas ressentie. Le temps passé, le nombre de dossiers, les urgences absorbées. Sans mesure, ce sont les plus discrets qui portent le plus.
- Les contraintes : temps partiel, restrictions médicales, formation en cours. Elles s''intègrent dans l''organisation, elles ne se « compensent » pas en chargeant les autres sans le dire.
- Le développement : une mission nouvelle confiée à quelqu''un qui doit progresser, même s''il sera moins rapide au début.

L''erreur la plus répandue : surcharger les meilleurs parce qu''ils sont fiables. Ils tiennent, puis ils s''épuisent ou partent, et l''équipe découvre qu''elle avait construit son fonctionnement sur une personne. La matrice de compétences et le RACI servent précisément à ne pas dépendre d''une seule personne.

## Formaliser et faire vivre

L''organisation se formalise en trois documents courts : la matrice RACI des activités sensibles, les fiches de poste, et les règles de fonctionnement de l''équipe (horaires, circuits d''information, gestion des urgences, rituels). Un document de deux pages, affiché et relu en réunion, vaut mieux qu''un classeur que personne n''ouvre.

Puis elle se révise : à chaque arrivée ou départ, à chaque changement d''activité, et au minimum une fois par an. Une organisation qui n''a pas bougé depuis trois ans est probablement contournée en silence.

## Le cas Garnier

Karim propose, en réunion d''équipe, quatre rôles nouveaux : Thierry, référent qualité (contrôle final avant restitution, tutorat technique de Julien) ; Sophie, coordinatrice des demandes clients (guichet unique, transmission à Karim avant midi) ; Nadia, référente peinture et formatrice de Julien en peinture ; Karim, responsable du planning et des priorités, avec Marc consulté chaque veille.

Le RACI, affiché dans l''atelier, met fin au circuit parallèle Sophie-carrossiers sans que personne ne soit désigné coupable : c''est l''organisation qui change, pas les personnes. Thierry, qui « ne veut pas qu''on lui dise comment faire son boulot », se voit confier une responsabilité qui reconnaît son expertise. Sa résistance baisse d''un cran.

## Variante bureau

Dans un service administratif de six personnes, remplacez « contrôle qualité » par « relecture avant envoi », « planning » par « répartition des dossiers entrants », et « commande de pièces » par « validation des devis fournisseurs ». Les questions sont identiques : qui réalise, qui approuve, qui est consulté, qui est informé.

## À retenir

- Attribuez des missions et des rôles, pas des tâches quotidiennes.
- RACI : un seul A par ligne, un R pour chaque travail, C et I avec parcimonie.
- Équité : compétences, charge mesurée, contraintes intégrées, développement.
- Ne construisez jamais l''organisation sur une seule personne.
- Formalisez en deux pages, affichez, révisez à chaque changement.

## Sources

- France Compétences, fiche RS7377 « Animer une équipe de travail » (CCI France), compétence 2 — francecompetences.fr.
- Project Management Institute, *A Guide to the Project Management Body of Knowledge (PMBOK Guide)*, 6e éd., PMI, 2017, § 9.1.2.2 (matrice d''affectation des responsabilités, tableau RACI).
- Henry Mintzberg, *Structure et dynamique des organisations*, Éditions d''Organisation, 1982 — mécanismes de coordination.
- Anact, *Dix questions sur la charge de travail*, Anact, 2016 — anact.fr.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'La matrice de compétences dit ce que l''activité demande et qui sait le faire. Reste à organiser le travail : qui fait quoi, qui décide, qui est informé. C''est la compétence 2 du référentiel RS7377 : structurer l''activité de l''équipe de travail en répartissant les rôles et missions.

Une grande partie des tensions que vous rencontrerez en tant que manager viennent d''une répartition floue : deux personnes qui pensent être responsables de la même chose, ou une tâche dont personne ne se sent responsable. Ce sont des problèmes d''organisation, pas de personnes, et ils se règlent par l''organisation.

## Rôle, mission, tâche

Une tâche est une action concrète : commander un pare-chocs, vérifier une finition.

Une mission est un ensemble de tâches qui produisent un résultat dont quelqu''un est responsable : « garantir qu''aucun véhicule ne sort sans contrôle qualité ».

Un rôle est une fonction stable dans l''équipe, indépendante de la personne qui l''occupe : le référent qualité, le tuteur des apprentis, le responsable du planning.

Répartir le travail, ce n''est pas distribuer des tâches chaque matin. C''est attribuer des missions et des rôles, puis laisser chacun organiser ses tâches dans ce cadre. Un manager qui distribue des tâches crée de la dépendance ; un manager qui attribue des missions crée de la responsabilité.

## La matrice RACI

Pour clarifier qui fait quoi sur une activité, l''outil de référence est la matrice RACI. On liste les activités ou les décisions en lignes, les personnes ou les rôles en colonnes, et l''on place dans chaque case une lettre :

- R, réalise : la personne qui fait le travail. Il peut y en avoir plusieurs.
- A, approuve (ou « accountable », responsable) : la personne qui répond du résultat et tranche. Une seule par ligne, toujours.
- C, consulté : la personne dont on prend l''avis avant de faire.
- I, informé : la personne que l''on tient au courant après.

Exemple à l''atelier Garnier, sur quatre activités où le flou crée des tensions :

| Activité | Karim | Sophie | Michel | Carrossiers | Marc |
|---|---|---|---|---|---|
| Fixer les priorités du planning | A / R | C | I | I | C |
| Transmettre une demande client urgente | I | A / R | I | — | — |
| Valider une reprise | A | I | I | R | — |
| Commander les pièces | I | R | A | C | C |

Trois règles de lecture. Chaque ligne a exactement un A : s''il y en a deux, vous avez un conflit en réserve ; s''il n''y en a aucun, vous avez un trou. Un R sans A est un travail que personne ne valide. Une colonne pleine de C et de I sans R ni A désigne une personne qui assiste à tout et ne fait rien : soit elle est mal utilisée, soit elle est de trop dans le circuit.

Une matrice RACI se construit avec les personnes concernées, en réunion, sur une heure. Elle se limite aux activités où le flou fait mal : inutile de « racifier » toute l''entreprise.

## Répartir équitablement

Une fois les rôles clairs, il reste la question de la charge : qui fait combien. L''équité ne signifie pas que tout le monde fait la même chose, mais que la répartition est explicable et acceptée. Quatre critères, à combiner :

- Les compétences : la matrice de la leçon précédente. On confie le travail à qui sait le faire, et l''on organise l''apprentissage pour le reste.
- La charge réelle : mesurée, pas ressentie. Le temps passé, le nombre de dossiers, les urgences absorbées. Sans mesure, ce sont les plus discrets qui portent le plus.
- Les contraintes : temps partiel, restrictions médicales, formation en cours. Elles s''intègrent dans l''organisation, elles ne se « compensent » pas en chargeant les autres sans le dire.
- Le développement : une mission nouvelle confiée à quelqu''un qui doit progresser, même s''il sera moins rapide au début.

L''erreur la plus répandue : surcharger les meilleurs parce qu''ils sont fiables. Ils tiennent, puis ils s''épuisent ou partent, et l''équipe découvre qu''elle avait construit son fonctionnement sur une personne. La matrice de compétences et le RACI servent précisément à ne pas dépendre d''une seule personne.

## Formaliser et faire vivre

L''organisation se formalise en trois documents courts : la matrice RACI des activités sensibles, les fiches de poste, et les règles de fonctionnement de l''équipe (horaires, circuits d''information, gestion des urgences, rituels). Un document de deux pages, affiché et relu en réunion, vaut mieux qu''un classeur que personne n''ouvre.

Puis elle se révise : à chaque arrivée ou départ, à chaque changement d''activité, et au minimum une fois par an. Une organisation qui n''a pas bougé depuis trois ans est probablement contournée en silence.

## Le cas Garnier

Karim propose, en réunion d''équipe, quatre rôles nouveaux : Thierry, référent qualité (contrôle final avant restitution, tutorat technique de Julien) ; Sophie, coordinatrice des demandes clients (guichet unique, transmission à Karim avant midi) ; Nadia, référente peinture et formatrice de Julien en peinture ; Karim, responsable du planning et des priorités, avec Marc consulté chaque veille.

Le RACI, affiché dans l''atelier, met fin au circuit parallèle Sophie-carrossiers sans que personne ne soit désigné coupable : c''est l''organisation qui change, pas les personnes. Thierry, qui « ne veut pas qu''on lui dise comment faire son boulot », se voit confier une responsabilité qui reconnaît son expertise. Sa résistance baisse d''un cran.

## Variante bureau

Dans un service administratif de six personnes, remplacez « contrôle qualité » par « relecture avant envoi », « planning » par « répartition des dossiers entrants », et « commande de pièces » par « validation des devis fournisseurs ». Les questions sont identiques : qui réalise, qui approuve, qui est consulté, qui est informé.

## À retenir

- Attribuez des missions et des rôles, pas des tâches quotidiennes.
- RACI : un seul A par ligne, un R pour chaque travail, C et I avec parcimonie.
- Équité : compétences, charge mesurée, contraintes intégrées, développement.
- Ne construisez jamais l''organisation sur une seule personne.
- Formalisez en deux pages, affichez, révisez à chaque changement.

## Sources

- France Compétences, fiche RS7377 « Animer une équipe de travail » (CCI France), compétence 2 — francecompetences.fr.
- Project Management Institute, *A Guide to the Project Management Body of Knowledge (PMBOK Guide)*, 6e éd., PMI, 2017, § 9.1.2.2 (matrice d''affectation des responsabilités, tableau RACI).
- Henry Mintzberg, *Structure et dynamique des organisations*, Éditions d''Organisation, 1982 — mécanismes de coordination.
- Anact, *Dix questions sur la charge de travail*, Anact, 2016 — anact.fr.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 4;
  n := n + 1;

  -- 2.5-video-deleguer.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Déléguer sans lâcher

Déléguer, c''est le geste que les nouveaux managers redoutent le plus. Trop tôt, on a l''impression d''abandonner. Trop tard, on s''épuise. Et quand ça se passe mal, on se dit qu''on aurait mieux fait de le faire soi-même.

Pourtant, déléguer n''est pas une option. C''est le seul moyen de dégager du temps pour manager, et c''est le principal levier pour faire progresser les gens. Cette vidéo vous donne une méthode en quatre points.

## Ce qui se délègue, ce qui ne se délègue pas

Premier point : savoir quoi déléguer.

Se délègue tout ce qui relève de l''exécution et de l''expertise : les tâches que quelqu''un d''autre sait faire, ou peut apprendre à faire. La production, le contrôle technique, l''organisation d''un chantier, la formation d''un nouveau, la relation avec un fournisseur.

Ne se délègue pas ce qui fait le cœur du rôle de manager : fixer les objectifs, arbitrer les priorités, évaluer les personnes, recadrer, sanctionner, porter les décisions de la direction, gérer une crise. Vous pouvez vous faire aider sur ces sujets ; vous ne pouvez pas les confier.

Un test simple : si ça tourne mal, qui devra rendre des comptes ? Si c''est vous quoi qu''il arrive, vous pouvez déléguer l''exécution, mais vous gardez la responsabilité. On délègue le travail et l''autorité nécessaire pour le faire ; on ne délègue jamais la responsabilité finale.

## Les niveaux de délégation

Deuxième point : déléguer n''est pas tout ou rien. Il y a des niveaux, et le bon niveau dépend de l''autonomie de la personne sur cette tâche, ce que vous avez vu avec le leadership situationnel.

Niveau 1 : « Fais ceci, comme ceci, et montre-moi. » La personne exécute une consigne précise et vous vérifiez. C''est pour un débutant sur une tâche nouvelle.

Niveau 2 : « Fais ceci, et dis-moi avant de finaliser. » La personne organise le travail, vous validez avant la dernière étape.

Niveau 3 : « Fais ceci, propose-moi une solution, je décide. » La personne analyse et recommande ; vous tranchez.

Niveau 4 : « Décide, et tiens-moi informé. » La personne décide seule et vous rend compte après.

Niveau 5 : « C''est à toi. » La personne décide et ne rend compte que si un problème dépasse son périmètre.

L''erreur classique est de rester bloqué au niveau 1 ou 2 avec des gens qui sont prêts pour le niveau 4. Ils vivent ça comme de la défiance. L''erreur inverse, c''est de sauter au niveau 5 pour se débarrasser d''un sujet. Ça s''appelle abandonner, pas déléguer.

## Le contrat de délégation

Troisième point : une délégation se contractualise. Pas par écrit forcément, mais explicitement. Cinq questions à régler au moment où vous confiez la mission.

Quoi : le résultat attendu, pas la méthode. « Aucun véhicule ne sort sans contrôle de finition », plutôt que la liste des points à vérifier, que Thierry connaît mieux que vous.

Pourquoi : le sens. « Trois reprises ce mois-ci, le client menace de partir. »

Jusqu''où : le périmètre et les limites. « Tu peux bloquer une restitution ; tu ne peux pas refaire une pièce sans m''en parler. »

Avec quoi : les moyens. Du temps, un outil, une information, une autorité vis-à-vis des autres. Une délégation sans moyens est un piège.

Quand : le point de contrôle. « On fait le point chaque vendredi pendant six semaines, puis mensuellement. »

Et une sixième question, que le manager doit se poser à lui-même : est-ce que j''accepte que ce soit fait autrement que je l''aurais fait ? Si la réponse est non, ne déléguez pas, vous allez reprendre le travail par-dessus l''épaule de la personne et la démotiver.

## Suivre sans surveiller

Quatrième point : le suivi. Déléguer, ce n''est pas disparaître. C''est changer de mode de contrôle : de la vérification du travail au point sur le résultat.

Concrètement : des points fixés d''avance, pas des passages inopinés. Des questions sur les résultats et les difficultés, pas sur la méthode. Une disponibilité réelle si la personne a besoin d''aide, sans qu''elle se sente jugée de la demander.

Et une règle : quand quelque chose ne va pas, on traite le problème avec la personne, on ne reprend pas la mission. Reprendre une délégation à la première difficulté, c''est signaler à toute l''équipe que déléguer, chez vous, ne veut rien dire.

## À l''atelier Garnier

À l''atelier Garnier, Karim délègue le contrôle qualité final à Thierry. Le quoi : aucune restitution sans contrôle. Le pourquoi : les reprises et le client Ferrand. Le jusqu''où : Thierry peut bloquer un véhicule ; pour toute reprise de plus de deux heures, il prévient Karim. Les moyens : une demi-heure par jour dégagée de la production, une fiche de contrôle qu''ils rédigent ensemble, et l''annonce du rôle à toute l''équipe par Michel. Le suivi : cinq minutes chaque vendredi.

Niveau de délégation : 4, « décide et tiens-moi informé », parce que Thierry est expert. Ce que Karim ne fait pas : lui expliquer comment contrôler une finition.

Résultat, trois semaines plus tard : zéro reprise, et Thierry qui dit à Julien « viens voir, je te montre ce que je regarde ». La délégation a fait de lui un allié.

Déléguer, c''est un investissement. Les premières semaines, ça prend plus de temps que de faire soi-même. C''est normal. Ce temps, vous le récupérez au centuple, en temps de management et en compétence dans l''équipe.

À tout de suite pour la leçon sur les priorités.

## Sources
Paul Hersey et Kenneth Blanchard, *Management of Organizational Behavior*, Prentice Hall, 1969 (leadership situationnel) ; Robert Tannenbaum et Warren H. Schmidt, « How to Choose a Leadership Pattern », *Harvard Business Review*, 1958 (continuum de la délégation, dont l''échelle à cinq niveaux est une adaptation) ; Peter F. Drucker, *The Effective Executive*, Harper & Row, 1967 ; Linda A. Hill, *Becoming a Manager*, Harvard Business School Press, 2003.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Déléguer sans lâcher

Déléguer, c''est le geste que les nouveaux managers redoutent le plus. Trop tôt, on a l''impression d''abandonner. Trop tard, on s''épuise. Et quand ça se passe mal, on se dit qu''on aurait mieux fait de le faire soi-même.

Pourtant, déléguer n''est pas une option. C''est le seul moyen de dégager du temps pour manager, et c''est le principal levier pour faire progresser les gens. Cette vidéo vous donne une méthode en quatre points.

## Ce qui se délègue, ce qui ne se délègue pas

Premier point : savoir quoi déléguer.

Se délègue tout ce qui relève de l''exécution et de l''expertise : les tâches que quelqu''un d''autre sait faire, ou peut apprendre à faire. La production, le contrôle technique, l''organisation d''un chantier, la formation d''un nouveau, la relation avec un fournisseur.

Ne se délègue pas ce qui fait le cœur du rôle de manager : fixer les objectifs, arbitrer les priorités, évaluer les personnes, recadrer, sanctionner, porter les décisions de la direction, gérer une crise. Vous pouvez vous faire aider sur ces sujets ; vous ne pouvez pas les confier.

Un test simple : si ça tourne mal, qui devra rendre des comptes ? Si c''est vous quoi qu''il arrive, vous pouvez déléguer l''exécution, mais vous gardez la responsabilité. On délègue le travail et l''autorité nécessaire pour le faire ; on ne délègue jamais la responsabilité finale.

## Les niveaux de délégation

Deuxième point : déléguer n''est pas tout ou rien. Il y a des niveaux, et le bon niveau dépend de l''autonomie de la personne sur cette tâche, ce que vous avez vu avec le leadership situationnel.

Niveau 1 : « Fais ceci, comme ceci, et montre-moi. » La personne exécute une consigne précise et vous vérifiez. C''est pour un débutant sur une tâche nouvelle.

Niveau 2 : « Fais ceci, et dis-moi avant de finaliser. » La personne organise le travail, vous validez avant la dernière étape.

Niveau 3 : « Fais ceci, propose-moi une solution, je décide. » La personne analyse et recommande ; vous tranchez.

Niveau 4 : « Décide, et tiens-moi informé. » La personne décide seule et vous rend compte après.

Niveau 5 : « C''est à toi. » La personne décide et ne rend compte que si un problème dépasse son périmètre.

L''erreur classique est de rester bloqué au niveau 1 ou 2 avec des gens qui sont prêts pour le niveau 4. Ils vivent ça comme de la défiance. L''erreur inverse, c''est de sauter au niveau 5 pour se débarrasser d''un sujet. Ça s''appelle abandonner, pas déléguer.

## Le contrat de délégation

Troisième point : une délégation se contractualise. Pas par écrit forcément, mais explicitement. Cinq questions à régler au moment où vous confiez la mission.

Quoi : le résultat attendu, pas la méthode. « Aucun véhicule ne sort sans contrôle de finition », plutôt que la liste des points à vérifier, que Thierry connaît mieux que vous.

Pourquoi : le sens. « Trois reprises ce mois-ci, le client menace de partir. »

Jusqu''où : le périmètre et les limites. « Tu peux bloquer une restitution ; tu ne peux pas refaire une pièce sans m''en parler. »

Avec quoi : les moyens. Du temps, un outil, une information, une autorité vis-à-vis des autres. Une délégation sans moyens est un piège.

Quand : le point de contrôle. « On fait le point chaque vendredi pendant six semaines, puis mensuellement. »

Et une sixième question, que le manager doit se poser à lui-même : est-ce que j''accepte que ce soit fait autrement que je l''aurais fait ? Si la réponse est non, ne déléguez pas, vous allez reprendre le travail par-dessus l''épaule de la personne et la démotiver.

## Suivre sans surveiller

Quatrième point : le suivi. Déléguer, ce n''est pas disparaître. C''est changer de mode de contrôle : de la vérification du travail au point sur le résultat.

Concrètement : des points fixés d''avance, pas des passages inopinés. Des questions sur les résultats et les difficultés, pas sur la méthode. Une disponibilité réelle si la personne a besoin d''aide, sans qu''elle se sente jugée de la demander.

Et une règle : quand quelque chose ne va pas, on traite le problème avec la personne, on ne reprend pas la mission. Reprendre une délégation à la première difficulté, c''est signaler à toute l''équipe que déléguer, chez vous, ne veut rien dire.

## À l''atelier Garnier

À l''atelier Garnier, Karim délègue le contrôle qualité final à Thierry. Le quoi : aucune restitution sans contrôle. Le pourquoi : les reprises et le client Ferrand. Le jusqu''où : Thierry peut bloquer un véhicule ; pour toute reprise de plus de deux heures, il prévient Karim. Les moyens : une demi-heure par jour dégagée de la production, une fiche de contrôle qu''ils rédigent ensemble, et l''annonce du rôle à toute l''équipe par Michel. Le suivi : cinq minutes chaque vendredi.

Niveau de délégation : 4, « décide et tiens-moi informé », parce que Thierry est expert. Ce que Karim ne fait pas : lui expliquer comment contrôler une finition.

Résultat, trois semaines plus tard : zéro reprise, et Thierry qui dit à Julien « viens voir, je te montre ce que je regarde ». La délégation a fait de lui un allié.

Déléguer, c''est un investissement. Les premières semaines, ça prend plus de temps que de faire soi-même. C''est normal. Ce temps, vous le récupérez au centuple, en temps de management et en compétence dans l''équipe.

À tout de suite pour la leçon sur les priorités.

## Sources
Paul Hersey et Kenneth Blanchard, *Management of Organizational Behavior*, Prentice Hall, 1969 (leadership situationnel) ; Robert Tannenbaum et Warren H. Schmidt, « How to Choose a Leadership Pattern », *Harvard Business Review*, 1958 (continuum de la délégation, dont l''échelle à cinq niveaux est une adaptation) ; Peter F. Drucker, *The Effective Executive*, Harper & Row, 1967 ; Linda A. Hill, *Becoming a Manager*, Harvard Business School Press, 2003.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 5;
  n := n + 1;

  -- 2.6-prioriser.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Un manager de proximité reçoit chaque jour plus de demandes qu''il ne peut en traiter : un client qui appelle, un collaborateur qui a une question, la direction qui veut un chiffre, une panne, une livraison en retard. Sans méthode, il traite ce qui crie le plus fort. Avec une méthode, il traite ce qui compte. Cette leçon donne trois outils et une discipline.

## Urgent et important ne sont pas la même chose

L''outil de base porte le nom du président américain Dwight Eisenhower. En 1954, dans un discours à l''université Northwestern, il citait un ancien président d''université : « J''ai deux sortes de problèmes, les urgents et les importants. Les urgents ne sont pas importants, et les importants ne sont jamais urgents. » La matrice elle-même n''est pas de lui : elle a été popularisée en 1989 par Stephen Covey. Elle croise deux questions.

Est-ce important ? C''est-à-dire : cela contribue-t-il aux objectifs de l''équipe, ou cela a-t-il des conséquences sérieuses si ce n''est pas fait ?

Est-ce urgent ? C''est-à-dire : y a-t-il une échéance proche, au-delà de laquelle le problème s''aggrave ?

| | Urgent | Pas urgent |
|---|---|---|
| Important | À faire maintenant, soi-même | À planifier : c''est là que se joue le management |
| Pas important | À déléguer ou à traiter vite sans y investir | À supprimer ou à laisser |

La case qui distingue les bons managers est la deuxième : important mais pas urgent. Fixer des objectifs, former Julien, préparer la matrice de compétences, faire un point avec Nadia sur son évolution : rien de tout cela n''est urgent, et tout cela disparaît si vous ne le planifiez pas. Les managers débordés vivent dans la première case ; ils traitent les urgences que l''absence de travail dans la deuxième case a créées.

## La règle des trois priorités

Chaque matin, ou la veille au soir, notez les trois choses qui doivent absolument être faites dans la journée. Pas dix, trois. Elles viennent de vos objectifs et de la case « important ». Tout le reste est traité si le temps le permet, et sinon reporté sans culpabilité.

Cette règle a un effet secondaire : elle vous force à dire non, ou plus exactement « pas aujourd''hui », à ce qui n''est pas prioritaire. Un manager qui dit oui à tout ne priorise rien.

## Protéger le temps de l''équipe

Prioriser ne concerne pas que votre agenda. Votre équipe subit les mêmes interruptions, et une partie de votre travail consiste à les filtrer.

Les interruptions ont un coût, même quand il ne se voit pas dans la production. Dans une expérience menée en 2008 par Gloria Mark et ses collègues, les personnes interrompues terminaient leur tâche un peu plus vite, sans perte de qualité, mais au prix d''un stress, d''une frustration et d''un sentiment de pression nettement plus élevés. Autrement dit, on compense en accélérant, et c''est la personne qui paie. Sur un atelier, où une seconde d''inattention se voit sur une finition, le risque s''ajoute à la fatigue.

Trois mesures concrètes :

- Un guichet unique pour les demandes extérieures. C''est ce que Karim a mis en place avec Sophie : les clients passent par elle, elle passe par lui, les carrossiers ne sont pas dérangés.
- Des plages protégées. Un moment de la journée sans réunion ni sollicitation, où chacun avance sur son travail de fond.
- Une règle pour les vraies urgences. Ce qui justifie d''interrompre quelqu''un doit être défini : la sécurité, un client bloqué, une panne. Le reste attend le prochain point.

## Prioriser entre les demandes de l''équipe

Quand plusieurs collaborateurs vous sollicitent en même temps, ou que deux véhicules ne peuvent pas être finis le même jour, il faut arbitrer. Trois critères, dans l''ordre :

- L''impact : quelle conséquence si ce n''est pas fait aujourd''hui ? Un client de flotte qui immobilise un véhicule utilitaire coûte plus qu''un particulier qui attend sa voiture de loisir.
- L''engagement : à qui a-t-on promis quoi ? Une date annoncée à un assureur engage l''entreprise.
- L''effort : combien de temps pour finir ? À impact égal, terminer ce qui est presque fini libère de la capacité.

Puis on explique l''arbitrage. Une priorité subie sans explication crée du ressentiment ; une priorité expliquée, même désagréable, est acceptée.

## Le piège du manager pompier

Certains managers aiment les urgences. Elles donnent le sentiment d''être utile, indispensable, et elles dispensent de faire le travail de fond, qui est plus abstrait. Le problème est que ce manager fabrique lui-même ses urgences : parce qu''il n''a pas planifié, formé, organisé, tout arrive au dernier moment. Et son équipe apprend que la seule façon d''obtenir son attention est de créer une urgence.

Si vous passez plus de la moitié de votre temps en mode urgence depuis plus d''un mois, la question n''est pas « comment gérer les urgences », mais « qu''est-ce que je n''ai pas fait en amont ».

## Le cas Garnier

Pendant une semaine, Karim a noté ce qu''il faisait, heure par heure. Résultat : 60 % de son temps en urgences (clients au téléphone, pièce manquante, Michel qui demande un chiffre), 35 % en production, 5 % en management. La matrice d''Eisenhower lui montre que la plupart de ses urgences viennent de la même cause : pas de guichet unique, pas de planning validé la veille, pas de commande de pièces anticipée.

Il décide de trois priorités pour le mois : installer le circuit Sophie-Karim (qui supprime les appels directs), le planning validé à 17 h (qui supprime les arbitrages du matin), et la commande des pièces au moment du devis (qui supprime les attentes). Trois actions de la case « important, pas urgent », qui vident la case « urgent ».

## À retenir

- Important et urgent sont deux questions différentes ; le management se joue dans « important, pas urgent ».
- Trois priorités par jour, pas plus.
- Protégez le temps de l''équipe : guichet unique, plages protégées, définition des vraies urgences.
- Arbitrez avec trois critères (impact, engagement, effort) et expliquez.
- Trop d''urgences depuis trop longtemps signalent un défaut d''organisation en amont.

## Sources

- Dwight D. Eisenhower, discours à la deuxième assemblée du Conseil œcuménique des Églises, Evanston (Illinois), 19 août 1954.
- Stephen R. Covey, *The 7 Habits of Highly Effective People*, Free Press, 1989 ; trad. fr. *Les 7 habitudes de ceux qui réalisent tout ce qu''ils entreprennent*, First (matrice importance / urgence).
- Gloria Mark, Daniela Gudith, Ulrich Klocke, « The Cost of Interrupted Work: More Speed and Stress », *Proceedings of CHI 2008*, ACM, 2008, p. 107-110.
- Henry Mintzberg, *The Nature of Managerial Work*, Harper & Row, 1973 (fragmentation du travail managérial).
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Un manager de proximité reçoit chaque jour plus de demandes qu''il ne peut en traiter : un client qui appelle, un collaborateur qui a une question, la direction qui veut un chiffre, une panne, une livraison en retard. Sans méthode, il traite ce qui crie le plus fort. Avec une méthode, il traite ce qui compte. Cette leçon donne trois outils et une discipline.

## Urgent et important ne sont pas la même chose

L''outil de base porte le nom du président américain Dwight Eisenhower. En 1954, dans un discours à l''université Northwestern, il citait un ancien président d''université : « J''ai deux sortes de problèmes, les urgents et les importants. Les urgents ne sont pas importants, et les importants ne sont jamais urgents. » La matrice elle-même n''est pas de lui : elle a été popularisée en 1989 par Stephen Covey. Elle croise deux questions.

Est-ce important ? C''est-à-dire : cela contribue-t-il aux objectifs de l''équipe, ou cela a-t-il des conséquences sérieuses si ce n''est pas fait ?

Est-ce urgent ? C''est-à-dire : y a-t-il une échéance proche, au-delà de laquelle le problème s''aggrave ?

| | Urgent | Pas urgent |
|---|---|---|
| Important | À faire maintenant, soi-même | À planifier : c''est là que se joue le management |
| Pas important | À déléguer ou à traiter vite sans y investir | À supprimer ou à laisser |

La case qui distingue les bons managers est la deuxième : important mais pas urgent. Fixer des objectifs, former Julien, préparer la matrice de compétences, faire un point avec Nadia sur son évolution : rien de tout cela n''est urgent, et tout cela disparaît si vous ne le planifiez pas. Les managers débordés vivent dans la première case ; ils traitent les urgences que l''absence de travail dans la deuxième case a créées.

## La règle des trois priorités

Chaque matin, ou la veille au soir, notez les trois choses qui doivent absolument être faites dans la journée. Pas dix, trois. Elles viennent de vos objectifs et de la case « important ». Tout le reste est traité si le temps le permet, et sinon reporté sans culpabilité.

Cette règle a un effet secondaire : elle vous force à dire non, ou plus exactement « pas aujourd''hui », à ce qui n''est pas prioritaire. Un manager qui dit oui à tout ne priorise rien.

## Protéger le temps de l''équipe

Prioriser ne concerne pas que votre agenda. Votre équipe subit les mêmes interruptions, et une partie de votre travail consiste à les filtrer.

Les interruptions ont un coût, même quand il ne se voit pas dans la production. Dans une expérience menée en 2008 par Gloria Mark et ses collègues, les personnes interrompues terminaient leur tâche un peu plus vite, sans perte de qualité, mais au prix d''un stress, d''une frustration et d''un sentiment de pression nettement plus élevés. Autrement dit, on compense en accélérant, et c''est la personne qui paie. Sur un atelier, où une seconde d''inattention se voit sur une finition, le risque s''ajoute à la fatigue.

Trois mesures concrètes :

- Un guichet unique pour les demandes extérieures. C''est ce que Karim a mis en place avec Sophie : les clients passent par elle, elle passe par lui, les carrossiers ne sont pas dérangés.
- Des plages protégées. Un moment de la journée sans réunion ni sollicitation, où chacun avance sur son travail de fond.
- Une règle pour les vraies urgences. Ce qui justifie d''interrompre quelqu''un doit être défini : la sécurité, un client bloqué, une panne. Le reste attend le prochain point.

## Prioriser entre les demandes de l''équipe

Quand plusieurs collaborateurs vous sollicitent en même temps, ou que deux véhicules ne peuvent pas être finis le même jour, il faut arbitrer. Trois critères, dans l''ordre :

- L''impact : quelle conséquence si ce n''est pas fait aujourd''hui ? Un client de flotte qui immobilise un véhicule utilitaire coûte plus qu''un particulier qui attend sa voiture de loisir.
- L''engagement : à qui a-t-on promis quoi ? Une date annoncée à un assureur engage l''entreprise.
- L''effort : combien de temps pour finir ? À impact égal, terminer ce qui est presque fini libère de la capacité.

Puis on explique l''arbitrage. Une priorité subie sans explication crée du ressentiment ; une priorité expliquée, même désagréable, est acceptée.

## Le piège du manager pompier

Certains managers aiment les urgences. Elles donnent le sentiment d''être utile, indispensable, et elles dispensent de faire le travail de fond, qui est plus abstrait. Le problème est que ce manager fabrique lui-même ses urgences : parce qu''il n''a pas planifié, formé, organisé, tout arrive au dernier moment. Et son équipe apprend que la seule façon d''obtenir son attention est de créer une urgence.

Si vous passez plus de la moitié de votre temps en mode urgence depuis plus d''un mois, la question n''est pas « comment gérer les urgences », mais « qu''est-ce que je n''ai pas fait en amont ».

## Le cas Garnier

Pendant une semaine, Karim a noté ce qu''il faisait, heure par heure. Résultat : 60 % de son temps en urgences (clients au téléphone, pièce manquante, Michel qui demande un chiffre), 35 % en production, 5 % en management. La matrice d''Eisenhower lui montre que la plupart de ses urgences viennent de la même cause : pas de guichet unique, pas de planning validé la veille, pas de commande de pièces anticipée.

Il décide de trois priorités pour le mois : installer le circuit Sophie-Karim (qui supprime les appels directs), le planning validé à 17 h (qui supprime les arbitrages du matin), et la commande des pièces au moment du devis (qui supprime les attentes). Trois actions de la case « important, pas urgent », qui vident la case « urgent ».

## À retenir

- Important et urgent sont deux questions différentes ; le management se joue dans « important, pas urgent ».
- Trois priorités par jour, pas plus.
- Protégez le temps de l''équipe : guichet unique, plages protégées, définition des vraies urgences.
- Arbitrez avec trois critères (impact, engagement, effort) et expliquez.
- Trop d''urgences depuis trop longtemps signalent un défaut d''organisation en amont.

## Sources

- Dwight D. Eisenhower, discours à la deuxième assemblée du Conseil œcuménique des Églises, Evanston (Illinois), 19 août 1954.
- Stephen R. Covey, *The 7 Habits of Highly Effective People*, Free Press, 1989 ; trad. fr. *Les 7 habitudes de ceux qui réalisent tout ce qu''ils entreprennent*, First (matrice importance / urgence).
- Gloria Mark, Daniela Gudith, Ulrich Klocke, « The Cost of Interrupted Work: More Speed and Stress », *Proceedings of CHI 2008*, ACM, 2008, p. 107-110.
- Henry Mintzberg, *The Nature of Managerial Work*, Harper & Row, 1973 (fragmentation du travail managérial).
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 6;
  n := n + 1;

  -- 2.7-tableau-de-bord.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Un tableau de bord est un petit nombre d''indicateurs, suivis régulièrement, qui disent si l''équipe atteint ses objectifs et où elle doit agir. C''est la compétence 3 du référentiel RS7377 : mobiliser les outils de pilotage et d''évaluation de l''activité collective. Bien conçu, il tient sur une feuille et se lit en deux minutes. Mal conçu, c''est un fichier de quarante colonnes que personne n''ouvre.

## À quoi sert un tableau de bord

À trois choses, dans cet ordre : voir (où en est-on par rapport aux objectifs), comprendre (pourquoi l''écart), agir (que fait-on cette semaine). Un tableau de bord qui ne débouche pas sur des décisions est un rapport, pas un outil de pilotage.

Il sert aussi à communiquer : vers l''équipe, qui voit le résultat de ses efforts, et vers la hiérarchie, qui reçoit des faits plutôt que des impressions. C''est le support naturel du point régulier avec votre responsable, vu au module 1 (leçon 1.7).

## Indicateurs de résultat et indicateurs de moyens

Un indicateur de résultat mesure ce que l''on veut obtenir : le taux de délais tenus, le nombre de reprises, la satisfaction client, le chiffre d''affaires. Il dit si l''on a réussi, mais souvent trop tard pour corriger.

Un indicateur de moyens (ou d''activité, ou « avancé ») mesure ce que l''on fait pour y arriver : le nombre de contrôles qualité réalisés, le pourcentage de plannings validés la veille, le délai moyen de commande des pièces. Il dit si l''on est sur la bonne voie, à temps pour ajuster.

Un bon tableau de bord combine les deux. Piloter uniquement au résultat, c''est conduire en regardant dans le rétroviseur : on voit l''accident après l''avoir eu. Piloter uniquement aux moyens, c''est confondre l''activité et le résultat : on peut faire tous les contrôles et livrer quand même en retard.

## Choisir cinq à sept indicateurs

Le nombre est la règle la plus importante. Au-delà de sept indicateurs, le tableau de bord ne se lit plus, et surtout il ne dit plus ce qui compte. Pour choisir, partez des objectifs de l''équipe : chaque objectif donne un indicateur de résultat et un indicateur de moyens.

Pour chaque indicateur, définissez par écrit :

- Le nom et la définition exacte. « Délai tenu » : véhicule restitué au plus tard à la date annoncée à l''assureur ou au client, la date de référence étant celle du dernier devis validé.
- La formule. Nombre de véhicules restitués à la date ÷ nombre de véhicules restitués dans le mois.
- La source. Le logiciel de gestion d''atelier, une feuille tenue par Sophie.
- La fréquence. Hebdomadaire pour les moyens, mensuelle pour les résultats.
- La cible et le seuil d''alerte. Cible 95 %, alerte en dessous de 85 %.
- Le responsable de la mise à jour.

Une définition floue produit des débats interminables sur le chiffre au lieu de débats sur l''action.

## Le visuel

Un tableau de bord se regarde, il ne se lit pas. Quelques règles :

- Une ligne par indicateur : valeur du mois, valeur du mois précédent, cible, tendance (une flèche), état (vert, orange, rouge selon le seuil).
- Une courbe pour les indicateurs clés, sur six à douze périodes : la tendance compte plus que la valeur.
- Aucune décoration. Un tableau sobre sur fond clair vaut mieux qu''un graphique en trois dimensions.
- Affiché là où l''équipe passe : le mur de l''atelier, l''écran de la salle de pause, la première page du dossier partagé.

## Les pièges

- Mesurer ce qui est facile à mesurer plutôt que ce qui compte. Le nombre de véhicules traités est facile ; le taux de délais tenus demande de tenir une date de référence. C''est pourtant le second qui correspond à l''objectif.
- L''indicateur qui devient l''objectif. Quand un indicateur est utilisé pour juger les personnes, il finit par être optimisé au détriment du résultat : on annonce des délais trop longs pour les tenir, on ne compte pas les petites reprises. C''est ce qu''on appelle la loi de Goodhart, du nom de l''économiste britannique qui l''a formulée en 1975 à propos des indicateurs monétaires ; l''anthropologue Marilyn Strathern l''a résumée ainsi en 1997 : quand une mesure devient une cible, elle cesse d''être une bonne mesure. Le remède : des indicateurs collectifs, associés à leur garde-fou, et une discussion sur les causes plutôt qu''une sanction sur les chiffres.
- Le tableau de bord jamais discuté. Il doit être le premier point de la réunion d''équipe hebdomadaire : trois minutes de lecture, dix minutes d''analyse des écarts, une ou deux actions décidées.
- Le tableau de bord parfait. Commencez avec quatre indicateurs tenus à la main, faites vivre, améliorez. Un outil simple utilisé bat un outil complet abandonné.

## Le cas Garnier — le tableau de bord de l''atelier

Karim retient six indicateurs, présentés à l''équipe et mis à jour chaque vendredi par Sophie et lui.

| Indicateur | Type | Formule | Fréquence | Cible | Alerte |
|---|---|---|---|---|---|
| Délais tenus (flottes) | Résultat | Véhicules restitués à la date ÷ restitués | Mensuel | 95 % | < 85 % |
| Reprises | Résultat | Nombre de véhicules repris après restitution | Mensuel | ≤ 1 | ≥ 3 |
| Contrôles qualité réalisés | Moyens | Véhicules contrôlés avant restitution ÷ restitués | Hebdo | 100 % | < 90 % |
| Plannings validés la veille | Moyens | Jours avec planning validé à 17 h ÷ jours ouvrés | Hebdo | 100 % | < 80 % |
| Attente pièces | Moyens | Jours d''immobilisation pour pièce manquante | Hebdo | 0 | ≥ 3 |
| Heures supplémentaires | Garde-fou | Heures sup. de l''équipe ÷ heures travaillées | Mensuel | < 5 % | > 10 % |

Le dernier indicateur n''est pas un indicateur de production : c''est un garde-fou. Si les délais sont tenus au prix de 15 % d''heures supplémentaires, l''objectif n''est pas atteint, il est acheté à crédit sur la santé de l''équipe.

Au premier point hebdomadaire, le tableau montre 100 % de contrôles réalisés mais deux jours d''attente pièces : l''action de la semaine est la commande des pièces au moment du devis, pas un rappel à l''ordre des carrossiers.

## À retenir

- Voir, comprendre, agir : un tableau de bord sert à décider.
- Combinez indicateurs de résultat et de moyens ; ne pilotez pas au rétroviseur.
- Cinq à sept indicateurs, chacun défini par écrit (formule, source, fréquence, cible, alerte, responsable).
- Un visuel sobre, affiché, discuté chaque semaine.
- Méfiez-vous de l''indicateur qui devient l''objectif ; associez-lui un garde-fou.

## Sources

- France Compétences, fiche RS7377 « Animer une équipe de travail » (CCI France), compétence 3 — francecompetences.fr.
- Robert S. Kaplan, David P. Norton, *The Balanced Scorecard: Translating Strategy into Action*, Harvard Business School Press, 1996 (indicateurs de résultat et indicateurs avancés).
- Charles A. E. Goodhart, « Problems of Monetary Management: The U.K. Experience », *Papers in Monetary Economics*, Reserve Bank of Australia, 1975.
- Marilyn Strathern, « "Improving ratings": audit in the British University system », *European Review*, vol. 5, n° 3, 1997, p. 305-321.
- Alain Fernandez, *L''essentiel du tableau de bord*, Eyrolles, 5e éd., 2018.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Un tableau de bord est un petit nombre d''indicateurs, suivis régulièrement, qui disent si l''équipe atteint ses objectifs et où elle doit agir. C''est la compétence 3 du référentiel RS7377 : mobiliser les outils de pilotage et d''évaluation de l''activité collective. Bien conçu, il tient sur une feuille et se lit en deux minutes. Mal conçu, c''est un fichier de quarante colonnes que personne n''ouvre.

## À quoi sert un tableau de bord

À trois choses, dans cet ordre : voir (où en est-on par rapport aux objectifs), comprendre (pourquoi l''écart), agir (que fait-on cette semaine). Un tableau de bord qui ne débouche pas sur des décisions est un rapport, pas un outil de pilotage.

Il sert aussi à communiquer : vers l''équipe, qui voit le résultat de ses efforts, et vers la hiérarchie, qui reçoit des faits plutôt que des impressions. C''est le support naturel du point régulier avec votre responsable, vu au module 1 (leçon 1.7).

## Indicateurs de résultat et indicateurs de moyens

Un indicateur de résultat mesure ce que l''on veut obtenir : le taux de délais tenus, le nombre de reprises, la satisfaction client, le chiffre d''affaires. Il dit si l''on a réussi, mais souvent trop tard pour corriger.

Un indicateur de moyens (ou d''activité, ou « avancé ») mesure ce que l''on fait pour y arriver : le nombre de contrôles qualité réalisés, le pourcentage de plannings validés la veille, le délai moyen de commande des pièces. Il dit si l''on est sur la bonne voie, à temps pour ajuster.

Un bon tableau de bord combine les deux. Piloter uniquement au résultat, c''est conduire en regardant dans le rétroviseur : on voit l''accident après l''avoir eu. Piloter uniquement aux moyens, c''est confondre l''activité et le résultat : on peut faire tous les contrôles et livrer quand même en retard.

## Choisir cinq à sept indicateurs

Le nombre est la règle la plus importante. Au-delà de sept indicateurs, le tableau de bord ne se lit plus, et surtout il ne dit plus ce qui compte. Pour choisir, partez des objectifs de l''équipe : chaque objectif donne un indicateur de résultat et un indicateur de moyens.

Pour chaque indicateur, définissez par écrit :

- Le nom et la définition exacte. « Délai tenu » : véhicule restitué au plus tard à la date annoncée à l''assureur ou au client, la date de référence étant celle du dernier devis validé.
- La formule. Nombre de véhicules restitués à la date ÷ nombre de véhicules restitués dans le mois.
- La source. Le logiciel de gestion d''atelier, une feuille tenue par Sophie.
- La fréquence. Hebdomadaire pour les moyens, mensuelle pour les résultats.
- La cible et le seuil d''alerte. Cible 95 %, alerte en dessous de 85 %.
- Le responsable de la mise à jour.

Une définition floue produit des débats interminables sur le chiffre au lieu de débats sur l''action.

## Le visuel

Un tableau de bord se regarde, il ne se lit pas. Quelques règles :

- Une ligne par indicateur : valeur du mois, valeur du mois précédent, cible, tendance (une flèche), état (vert, orange, rouge selon le seuil).
- Une courbe pour les indicateurs clés, sur six à douze périodes : la tendance compte plus que la valeur.
- Aucune décoration. Un tableau sobre sur fond clair vaut mieux qu''un graphique en trois dimensions.
- Affiché là où l''équipe passe : le mur de l''atelier, l''écran de la salle de pause, la première page du dossier partagé.

## Les pièges

- Mesurer ce qui est facile à mesurer plutôt que ce qui compte. Le nombre de véhicules traités est facile ; le taux de délais tenus demande de tenir une date de référence. C''est pourtant le second qui correspond à l''objectif.
- L''indicateur qui devient l''objectif. Quand un indicateur est utilisé pour juger les personnes, il finit par être optimisé au détriment du résultat : on annonce des délais trop longs pour les tenir, on ne compte pas les petites reprises. C''est ce qu''on appelle la loi de Goodhart, du nom de l''économiste britannique qui l''a formulée en 1975 à propos des indicateurs monétaires ; l''anthropologue Marilyn Strathern l''a résumée ainsi en 1997 : quand une mesure devient une cible, elle cesse d''être une bonne mesure. Le remède : des indicateurs collectifs, associés à leur garde-fou, et une discussion sur les causes plutôt qu''une sanction sur les chiffres.
- Le tableau de bord jamais discuté. Il doit être le premier point de la réunion d''équipe hebdomadaire : trois minutes de lecture, dix minutes d''analyse des écarts, une ou deux actions décidées.
- Le tableau de bord parfait. Commencez avec quatre indicateurs tenus à la main, faites vivre, améliorez. Un outil simple utilisé bat un outil complet abandonné.

## Le cas Garnier — le tableau de bord de l''atelier

Karim retient six indicateurs, présentés à l''équipe et mis à jour chaque vendredi par Sophie et lui.

| Indicateur | Type | Formule | Fréquence | Cible | Alerte |
|---|---|---|---|---|---|
| Délais tenus (flottes) | Résultat | Véhicules restitués à la date ÷ restitués | Mensuel | 95 % | < 85 % |
| Reprises | Résultat | Nombre de véhicules repris après restitution | Mensuel | ≤ 1 | ≥ 3 |
| Contrôles qualité réalisés | Moyens | Véhicules contrôlés avant restitution ÷ restitués | Hebdo | 100 % | < 90 % |
| Plannings validés la veille | Moyens | Jours avec planning validé à 17 h ÷ jours ouvrés | Hebdo | 100 % | < 80 % |
| Attente pièces | Moyens | Jours d''immobilisation pour pièce manquante | Hebdo | 0 | ≥ 3 |
| Heures supplémentaires | Garde-fou | Heures sup. de l''équipe ÷ heures travaillées | Mensuel | < 5 % | > 10 % |

Le dernier indicateur n''est pas un indicateur de production : c''est un garde-fou. Si les délais sont tenus au prix de 15 % d''heures supplémentaires, l''objectif n''est pas atteint, il est acheté à crédit sur la santé de l''équipe.

Au premier point hebdomadaire, le tableau montre 100 % de contrôles réalisés mais deux jours d''attente pièces : l''action de la semaine est la commande des pièces au moment du devis, pas un rappel à l''ordre des carrossiers.

## À retenir

- Voir, comprendre, agir : un tableau de bord sert à décider.
- Combinez indicateurs de résultat et de moyens ; ne pilotez pas au rétroviseur.
- Cinq à sept indicateurs, chacun défini par écrit (formule, source, fréquence, cible, alerte, responsable).
- Un visuel sobre, affiché, discuté chaque semaine.
- Méfiez-vous de l''indicateur qui devient l''objectif ; associez-lui un garde-fou.

## Sources

- France Compétences, fiche RS7377 « Animer une équipe de travail » (CCI France), compétence 3 — francecompetences.fr.
- Robert S. Kaplan, David P. Norton, *The Balanced Scorecard: Translating Strategy into Action*, Harvard Business School Press, 1996 (indicateurs de résultat et indicateurs avancés).
- Charles A. E. Goodhart, « Problems of Monetary Management: The U.K. Experience », *Papers in Monetary Economics*, Reserve Bank of Australia, 1975.
- Marilyn Strathern, « "Improving ratings": audit in the British University system », *European Review*, vol. 5, n° 3, 1997, p. 305-321.
- Alain Fernandez, *L''essentiel du tableau de bord*, Eyrolles, 5e éd., 2018.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 7;
  n := n + 1;

  -- 2.8-handicap-organiser-sans-exclure.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'En 2024, les entreprises privées de 20 salariés et plus employaient 720 800 bénéficiaires de l''obligation d''emploi des travailleurs handicapés (DARES, 2025). Et ce chiffre ne compte que les personnes qui ont fait reconnaître leur situation et l''ont déclarée. Beaucoup de handicaps ne se voient pas : une atteinte du dos, une maladie chronique, une perte d''audition, un trouble dys, un trouble psychique. Vous managerez très probablement un jour une personne concernée, et c''est peut-être déjà le cas sans que vous le sachiez. Cette leçon correspond à la compétence 4 du référentiel RS7377 : traiter les éventuelles situations de handicap dans l''organisation et l''animation de l''équipe.

Avertissement : les repères juridiques ci-dessous sont à jour en octobre 2026. Ils vous donnent le cadre, pas une consultation. Pour toute situation concrète, l''interlocuteur est le médecin du travail ; l''employeur peut aussi s''appuyer sur Cap emploi et sur l''Agefiph.

## Le cadre légal

Cinq notions suffisent pour savoir qui fait quoi.

**1. La reconnaissance.** La reconnaissance de la qualité de travailleur handicapé (RQTH) est attribuée par la commission des droits et de l''autonomie des personnes handicapées (CDAPH), au sein de la MDPH, sur demande de la personne. Elle ouvre droit à des aides et à des aménagements. Le salarié n''est jamais obligé d''en informer son employeur : c''est une information liée à sa santé, donc protégée. S''il vous en parle, c''est un acte de confiance, et l''information ne doit pas circuler au-delà de ce qui est nécessaire pour organiser le travail.

**2. L''obligation d''emploi.** Toute entreprise d''au moins 20 salariés doit employer des travailleurs handicapés à hauteur de 6 % de son effectif (Code du travail, art. L5212-2). Si elle n''y parvient pas, elle verse une contribution annuelle, déclarée dans la DSN et recouvrée par l''Urssaf ou la MSA, qui la reversent à l''Agefiph ; certaines dépenses (contrats avec des entreprises adaptées, par exemple) en sont déductibles, et un accord agréé peut remplacer la contribution. En dessous de 20 salariés, il n''y a pas de taux à atteindre, mais la non-discrimination et l''obligation d''aménagement s''appliquent à toutes les entreprises. L''atelier Garnier, avec neuf personnes, est dans ce cas.

**3. L''aménagement raisonnable.** L''employeur prend « les mesures appropriées » pour permettre aux travailleurs handicapés d''accéder à un emploi ou de conserver un emploi correspondant à leur qualification, de l''exercer ou d''y progresser, sous réserve que la charge ne soit pas disproportionnée, compte tenu des aides qui peuvent la compenser (art. L5213-6). Le refus de prendre ces mesures peut être constitutif d''une discrimination (même article, dernier alinéa). Les aides de l''Agefiph servent précisément à alléger cette charge.

**4. Le médecin du travail.** Il peut proposer, par écrit et après échange avec le salarié et l''employeur, des aménagements du poste ou du temps de travail (art. L4624-3). L''employeur doit prendre ces propositions en considération ; s''il ne les suit pas, il fait connaître par écrit ses motifs au salarié et au médecin (art. L4624-6). Pour le manager, ces préconisations sont un cadre à appliquer, pas à discuter. Le salarié peut lui-même demander à voir le médecin du travail (art. R4624-34).

**5. Le référent handicap.** Sa désignation est obligatoire dans les entreprises d''au moins 250 salariés (art. L5213-6-1) et utile partout. Dans une PME, ce rôle revient souvent au dirigeant ou à la personne chargée des RH. Renseignez-vous : qui est l''interlocuteur dans votre entreprise ? (Les organismes de formation en désignent un aussi : celui d''IDEAFORMA est joignable à contact@ideaforma.fr, objet « Référent handicap ».)

## Ce que le manager peut et doit faire

Votre rôle n''est ni celui du médecin, ni celui des RH. Il est d''organiser le travail à partir des préconisations, et de veiller à ce que l''équipe fonctionne avec.

## Accueillir la parole

Si un collaborateur vous parle d''une difficulté de santé, écoutez, sans diagnostiquer et sans minimiser. Deux questions utiles : « Qu''est-ce qui te pose problème concrètement dans le travail ? » et « De quoi aurais-tu besoin ? » Puis proposez-lui de rencontrer le médecin du travail, c''est lui qui peut préconiser un aménagement. Ne demandez jamais le diagnostic : il ne vous regarde pas et vous n''en avez pas besoin pour organiser.

## Organiser à partir de la restriction, pas du handicap

Ce dont vous avez besoin, c''est de la restriction fonctionnelle : « pas de port de charges de plus de dix kilos », « pas de travail en hauteur », « pause toutes les deux heures », « pas d''horaires décalés ». Elle figure dans l''avis ou les préconisations écrites du médecin du travail, que l''employeur vous transmet sans le motif médical. À partir de là, vous organisez comme pour n''importe quelle contrainte : matrice de compétences, répartition des rôles, binômes.

Les aménagements les plus fréquents sont simples. Un outil : chariot, table réglable, logiciel de lecture d''écran. Une organisation : binôme pour la manutention, télétravail partiel, horaires aménagés. Du temps : une pause supplémentaire, un rythme progressif à la reprise après un arrêt. L''Agefiph peut financer une partie du matériel et des adaptations ; Cap emploi, organisme spécialisé membre du réseau pour l''emploi aux côtés de France Travail, conseille l''employeur et le salarié, en particulier pour le maintien dans l''emploi.

## Protéger la confidentialité

Vous expliquez à l''équipe l''organisation, jamais la raison. « Fatou ne porte pas les pare-chocs, Lucas s''en charge quand elle prépare » suffit. Si un collègue demande pourquoi, la réponse est « c''est organisé comme ça ». Divulguer une information de santé est une faute, et c''est aussi le plus sûr moyen que plus personne ne vous confie quoi que ce soit.

## Traiter l''équité, pas la faveur

Un aménagement peut susciter des remarques : « pourquoi elle et pas moi ? ». Elles se traitent par la règle, pas en justifiant le cas individuel : l''entreprise adapte les postes aux contraintes reconnues, pour tout le monde, dans le cadre prévu par la loi. Si vous laissez passer ces remarques, elles deviennent une habitude et peuvent glisser vers la mise à l''écart, voire le harcèlement. Expliquez la règle une fois, fermement.

## Anticiper la reprise

Après un arrêt long, la reprise est un moment sensible. La visite de reprise auprès du médecin du travail est obligatoire après un congé de maternité, une absence pour maladie professionnelle, une absence d''au moins 30 jours pour accident du travail ou d''au moins 60 jours pour maladie ou accident non professionnel (art. R4624-31). C''est l''employeur qui l''organise. De votre côté, préparez le retour : un échange au retour (ce qui a changé, ce qui est attendu, ce dont la personne a besoin), un poste éventuellement aménagé, et une charge progressive si le médecin la préconise. Cet échange est une bonne pratique, pas une obligation légale.

## Ce qu''il ne faut pas faire

- Décider seul qu''une personne « ne peut pas » faire une tâche à cause de son handicap : les restrictions relèvent du médecin du travail, l''organisation relève de vous.
- Écarter la personne de missions intéressantes « pour la protéger », sans lui demander son avis : c''est une discrimination, même bien intentionnée.
- Compenser l''aménagement en chargeant les autres sans le dire : l''organisation doit être explicite et équitable.
- Utiliser la restriction comme argument dans une évaluation : on évalue le travail réalisé dans le cadre prévu.

## Le cas Garnier

Fatou a une RQTH et une restriction de port de charge à dix kilos, préconisée par le médecin du travail. Karim ne connaît pas la raison médicale de cette restriction, et il n''a pas à la connaître. Jusqu''ici, « ça se gérait » : elle demandait de l''aide quand quelqu''un était disponible, et portait seule quand personne ne l''était. Karim intègre la restriction dans l''organisation. La manutention des éléments lourds (pare-chocs, capots, portières) est confiée à Lucas et à Julien, et inscrite au RACI. Un chariot de manutention est demandé : Michel, en tant qu''employeur, monte le dossier d''aide Agefiph avec le conseil de Cap emploi. Fatou devient référente de la préparation des surfaces, où elle est la meilleure de l''atelier. À l''équipe, Karim explique l''organisation, pas le dossier médical. Quand Lucas lâche « elle est ménagée », Karim lui répond en tête-à-tête que l''atelier adapte les postes aux contraintes reconnues, pour tout le monde, et que ce n''est pas un sujet de discussion.

## À retenir

- La RQTH relève de la vie privée et de la santé : le salarié n''est pas tenu de la déclarer, et vous ne la divulguez jamais.
- L''aménagement raisonnable est une obligation de l''employeur ; le refuser sans raison valable peut constituer une discrimination.
- Le médecin du travail préconise, le manager organise à partir de la restriction, jamais du diagnostic.
- Expliquez l''organisation à l''équipe, pas la raison ; traitez les remarques par la règle.
- L''Agefiph finance, Cap emploi conseille ; le médecin du travail reste votre premier interlocuteur.

## Sources

- Code du travail : art. L5212-1 et suivants (obligation d''emploi, dont L5212-2 pour le taux de 6 %), L5213-6 (aménagement raisonnable), L5213-6-1 (référent handicap), L1132-1 et L1133-3 (discrimination), L4624-3 et L4624-6 (propositions du médecin du travail), R4624-31 (visite de reprise), R4624-34 (visite à la demande du salarié) — legifrance.gouv.fr.
- Service-public.fr (Entreprendre), « Obligation d''emploi des travailleurs handicapés (OETH) », fiche F22523, mise à jour avril 2026 — entreprendre.service-public.gouv.fr.
- DARES, « L''obligation d''emploi des travailleurs handicapés en 2024 », *Dares Résultats* n° 56, novembre 2025 — dares.travail-emploi.gouv.fr.
- Défenseur des droits, *Emploi des personnes en situation de handicap et aménagement raisonnable*, guide, décembre 2017 — defenseurdesdroits.fr.
- Agefiph, « Aides et services aux employeurs », agefiph.fr ; réseau Cap emploi, capemploi.info.
- Loi n° 2023-1196 du 18 décembre 2023 pour le plein emploi (création du réseau pour l''emploi) — legifrance.gouv.fr.
- France Compétences, fiche RS7377 « Animer une équipe de travail » (certificateur CCI France), compétence 4 — francecompetences.fr.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'En 2024, les entreprises privées de 20 salariés et plus employaient 720 800 bénéficiaires de l''obligation d''emploi des travailleurs handicapés (DARES, 2025). Et ce chiffre ne compte que les personnes qui ont fait reconnaître leur situation et l''ont déclarée. Beaucoup de handicaps ne se voient pas : une atteinte du dos, une maladie chronique, une perte d''audition, un trouble dys, un trouble psychique. Vous managerez très probablement un jour une personne concernée, et c''est peut-être déjà le cas sans que vous le sachiez. Cette leçon correspond à la compétence 4 du référentiel RS7377 : traiter les éventuelles situations de handicap dans l''organisation et l''animation de l''équipe.

Avertissement : les repères juridiques ci-dessous sont à jour en octobre 2026. Ils vous donnent le cadre, pas une consultation. Pour toute situation concrète, l''interlocuteur est le médecin du travail ; l''employeur peut aussi s''appuyer sur Cap emploi et sur l''Agefiph.

## Le cadre légal

Cinq notions suffisent pour savoir qui fait quoi.

**1. La reconnaissance.** La reconnaissance de la qualité de travailleur handicapé (RQTH) est attribuée par la commission des droits et de l''autonomie des personnes handicapées (CDAPH), au sein de la MDPH, sur demande de la personne. Elle ouvre droit à des aides et à des aménagements. Le salarié n''est jamais obligé d''en informer son employeur : c''est une information liée à sa santé, donc protégée. S''il vous en parle, c''est un acte de confiance, et l''information ne doit pas circuler au-delà de ce qui est nécessaire pour organiser le travail.

**2. L''obligation d''emploi.** Toute entreprise d''au moins 20 salariés doit employer des travailleurs handicapés à hauteur de 6 % de son effectif (Code du travail, art. L5212-2). Si elle n''y parvient pas, elle verse une contribution annuelle, déclarée dans la DSN et recouvrée par l''Urssaf ou la MSA, qui la reversent à l''Agefiph ; certaines dépenses (contrats avec des entreprises adaptées, par exemple) en sont déductibles, et un accord agréé peut remplacer la contribution. En dessous de 20 salariés, il n''y a pas de taux à atteindre, mais la non-discrimination et l''obligation d''aménagement s''appliquent à toutes les entreprises. L''atelier Garnier, avec neuf personnes, est dans ce cas.

**3. L''aménagement raisonnable.** L''employeur prend « les mesures appropriées » pour permettre aux travailleurs handicapés d''accéder à un emploi ou de conserver un emploi correspondant à leur qualification, de l''exercer ou d''y progresser, sous réserve que la charge ne soit pas disproportionnée, compte tenu des aides qui peuvent la compenser (art. L5213-6). Le refus de prendre ces mesures peut être constitutif d''une discrimination (même article, dernier alinéa). Les aides de l''Agefiph servent précisément à alléger cette charge.

**4. Le médecin du travail.** Il peut proposer, par écrit et après échange avec le salarié et l''employeur, des aménagements du poste ou du temps de travail (art. L4624-3). L''employeur doit prendre ces propositions en considération ; s''il ne les suit pas, il fait connaître par écrit ses motifs au salarié et au médecin (art. L4624-6). Pour le manager, ces préconisations sont un cadre à appliquer, pas à discuter. Le salarié peut lui-même demander à voir le médecin du travail (art. R4624-34).

**5. Le référent handicap.** Sa désignation est obligatoire dans les entreprises d''au moins 250 salariés (art. L5213-6-1) et utile partout. Dans une PME, ce rôle revient souvent au dirigeant ou à la personne chargée des RH. Renseignez-vous : qui est l''interlocuteur dans votre entreprise ? (Les organismes de formation en désignent un aussi : celui d''IDEAFORMA est joignable à contact@ideaforma.fr, objet « Référent handicap ».)

## Ce que le manager peut et doit faire

Votre rôle n''est ni celui du médecin, ni celui des RH. Il est d''organiser le travail à partir des préconisations, et de veiller à ce que l''équipe fonctionne avec.

## Accueillir la parole

Si un collaborateur vous parle d''une difficulté de santé, écoutez, sans diagnostiquer et sans minimiser. Deux questions utiles : « Qu''est-ce qui te pose problème concrètement dans le travail ? » et « De quoi aurais-tu besoin ? » Puis proposez-lui de rencontrer le médecin du travail, c''est lui qui peut préconiser un aménagement. Ne demandez jamais le diagnostic : il ne vous regarde pas et vous n''en avez pas besoin pour organiser.

## Organiser à partir de la restriction, pas du handicap

Ce dont vous avez besoin, c''est de la restriction fonctionnelle : « pas de port de charges de plus de dix kilos », « pas de travail en hauteur », « pause toutes les deux heures », « pas d''horaires décalés ». Elle figure dans l''avis ou les préconisations écrites du médecin du travail, que l''employeur vous transmet sans le motif médical. À partir de là, vous organisez comme pour n''importe quelle contrainte : matrice de compétences, répartition des rôles, binômes.

Les aménagements les plus fréquents sont simples. Un outil : chariot, table réglable, logiciel de lecture d''écran. Une organisation : binôme pour la manutention, télétravail partiel, horaires aménagés. Du temps : une pause supplémentaire, un rythme progressif à la reprise après un arrêt. L''Agefiph peut financer une partie du matériel et des adaptations ; Cap emploi, organisme spécialisé membre du réseau pour l''emploi aux côtés de France Travail, conseille l''employeur et le salarié, en particulier pour le maintien dans l''emploi.

## Protéger la confidentialité

Vous expliquez à l''équipe l''organisation, jamais la raison. « Fatou ne porte pas les pare-chocs, Lucas s''en charge quand elle prépare » suffit. Si un collègue demande pourquoi, la réponse est « c''est organisé comme ça ». Divulguer une information de santé est une faute, et c''est aussi le plus sûr moyen que plus personne ne vous confie quoi que ce soit.

## Traiter l''équité, pas la faveur

Un aménagement peut susciter des remarques : « pourquoi elle et pas moi ? ». Elles se traitent par la règle, pas en justifiant le cas individuel : l''entreprise adapte les postes aux contraintes reconnues, pour tout le monde, dans le cadre prévu par la loi. Si vous laissez passer ces remarques, elles deviennent une habitude et peuvent glisser vers la mise à l''écart, voire le harcèlement. Expliquez la règle une fois, fermement.

## Anticiper la reprise

Après un arrêt long, la reprise est un moment sensible. La visite de reprise auprès du médecin du travail est obligatoire après un congé de maternité, une absence pour maladie professionnelle, une absence d''au moins 30 jours pour accident du travail ou d''au moins 60 jours pour maladie ou accident non professionnel (art. R4624-31). C''est l''employeur qui l''organise. De votre côté, préparez le retour : un échange au retour (ce qui a changé, ce qui est attendu, ce dont la personne a besoin), un poste éventuellement aménagé, et une charge progressive si le médecin la préconise. Cet échange est une bonne pratique, pas une obligation légale.

## Ce qu''il ne faut pas faire

- Décider seul qu''une personne « ne peut pas » faire une tâche à cause de son handicap : les restrictions relèvent du médecin du travail, l''organisation relève de vous.
- Écarter la personne de missions intéressantes « pour la protéger », sans lui demander son avis : c''est une discrimination, même bien intentionnée.
- Compenser l''aménagement en chargeant les autres sans le dire : l''organisation doit être explicite et équitable.
- Utiliser la restriction comme argument dans une évaluation : on évalue le travail réalisé dans le cadre prévu.

## Le cas Garnier

Fatou a une RQTH et une restriction de port de charge à dix kilos, préconisée par le médecin du travail. Karim ne connaît pas la raison médicale de cette restriction, et il n''a pas à la connaître. Jusqu''ici, « ça se gérait » : elle demandait de l''aide quand quelqu''un était disponible, et portait seule quand personne ne l''était. Karim intègre la restriction dans l''organisation. La manutention des éléments lourds (pare-chocs, capots, portières) est confiée à Lucas et à Julien, et inscrite au RACI. Un chariot de manutention est demandé : Michel, en tant qu''employeur, monte le dossier d''aide Agefiph avec le conseil de Cap emploi. Fatou devient référente de la préparation des surfaces, où elle est la meilleure de l''atelier. À l''équipe, Karim explique l''organisation, pas le dossier médical. Quand Lucas lâche « elle est ménagée », Karim lui répond en tête-à-tête que l''atelier adapte les postes aux contraintes reconnues, pour tout le monde, et que ce n''est pas un sujet de discussion.

## À retenir

- La RQTH relève de la vie privée et de la santé : le salarié n''est pas tenu de la déclarer, et vous ne la divulguez jamais.
- L''aménagement raisonnable est une obligation de l''employeur ; le refuser sans raison valable peut constituer une discrimination.
- Le médecin du travail préconise, le manager organise à partir de la restriction, jamais du diagnostic.
- Expliquez l''organisation à l''équipe, pas la raison ; traitez les remarques par la règle.
- L''Agefiph finance, Cap emploi conseille ; le médecin du travail reste votre premier interlocuteur.

## Sources

- Code du travail : art. L5212-1 et suivants (obligation d''emploi, dont L5212-2 pour le taux de 6 %), L5213-6 (aménagement raisonnable), L5213-6-1 (référent handicap), L1132-1 et L1133-3 (discrimination), L4624-3 et L4624-6 (propositions du médecin du travail), R4624-31 (visite de reprise), R4624-34 (visite à la demande du salarié) — legifrance.gouv.fr.
- Service-public.fr (Entreprendre), « Obligation d''emploi des travailleurs handicapés (OETH) », fiche F22523, mise à jour avril 2026 — entreprendre.service-public.gouv.fr.
- DARES, « L''obligation d''emploi des travailleurs handicapés en 2024 », *Dares Résultats* n° 56, novembre 2025 — dares.travail-emploi.gouv.fr.
- Défenseur des droits, *Emploi des personnes en situation de handicap et aménagement raisonnable*, guide, décembre 2017 — defenseurdesdroits.fr.
- Agefiph, « Aides et services aux employeurs », agefiph.fr ; réseau Cap emploi, capemploi.info.
- Loi n° 2023-1196 du 18 décembre 2023 pour le plein emploi (création du réseau pour l''emploi) — legifrance.gouv.fr.
- France Compétences, fiche RS7377 « Animer une équipe de travail » (certificateur CCI France), compétence 4 — francecompetences.fr.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 8;
  n := n + 1;

  -- 2.9-podcast-tableau-de-bord.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Version écrite de l''épisode (le texte de référence ; l''enregistrement peut le formuler autrement).

Conversation entre Claire, animatrice IDEAFORMA et Sandrine, responsable d''une agence de services à la personne (14 salariés), promue responsable après six ans comme intervenante (personnage fictif).

**Claire** — Bonjour à tous. Dans ce podcast, on parle pilotage, et surtout de ce qui se passe quand on n''en a pas. Sandrine, vous dirigez une agence de services à domicile depuis trois ans. Avant, vous étiez intervenante. Comment pilotiez-vous, au début ?

**Sandrine** — Au ressenti, honnêtement. Je connaissais les bénéficiaires, je connaissais les intervenantes, je savais « à peu près » où on en était. Quand ma directrice régionale me demandait un chiffre, je le cherchais pendant deux heures dans le logiciel et je lui envoyais un truc dont je n''étais pas sûre.

**Claire** — Et à quel moment ça a posé problème ?

**Sandrine** — Le jour où on a perdu un gros contrat avec une mutuelle. Ils nous ont dit : « Vos interventions sont en retard une fois sur cinq. » Et moi, je suis tombée des nues. J''avais l''impression que ça allait. En fait, je voyais les retards qu''on me signalait, pas ceux qu''on ne me signalait pas.

**Claire** — C''est exactement ce qu''on appelle piloter au rétroviseur. Vous voyez le problème quand il est déjà arrivé.

**Sandrine** — Pire que ça : je le voyais quand quelqu''un d''autre me le montrait. Ma directrice m''a dit une phrase que je n''ai pas oubliée : « Si tu ne mesures pas, tu ne sais pas. Et si tu ne sais pas, tu ne manages pas, tu espères. »

**Claire** — Qu''est-ce que vous avez fait ?

**Sandrine** — La première chose, c''est que j''ai voulu tout mesurer. J''ai sorti un tableau Excel avec vingt-cinq colonnes. Taux de retard, heures facturées, heures non facturées, absences, kilomètres, satisfaction, réclamations, taux de remplacement… Et j''ai tenu ça trois semaines.

**Claire** — Pourquoi trois semaines ?

**Sandrine** — Parce que ça me prenait deux heures chaque lundi, que personne ne le regardait, et que moi-même je ne savais plus ce qui était important dedans. Vingt-cinq chiffres, c''est comme zéro chiffre.

**Claire** — Donc vous êtes passée de rien à trop, et ensuite ?

**Sandrine** — Ensuite j''ai fait ce que j''aurais dû faire au départ : je suis partie de mes objectifs. Ma directrice attendait trois choses : les interventions à l''heure, les plannings remplis, et pas de départ d''intervenante. Trois objectifs, donc trois indicateurs de résultat. Le taux d''interventions à l''heure, le taux de remplissage des plannings, et le turnover.

**Claire** — Et vous avez ajouté des indicateurs de moyens ?

**Sandrine** — Oui, mais ça, je l''ai compris plus tard. Au début, je n''avais que les trois résultats, et je les regardais à la fin du mois. C''était mieux, mais c''était encore du rétroviseur. Le déclic, c''est quand j''ai cherché pourquoi les interventions étaient en retard. En fait, c''était presque toujours la même cause : les plannings de la semaine étaient envoyés aux intervenantes le lundi matin, elles découvraient leurs trajets au dernier moment, et le premier retard de la journée se propageait sur toute la journée.

**Claire** — Donc la cause était en amont.

**Sandrine** — La cause, c''était le vendredi, pas le lundi. J''ai ajouté un indicateur : le pourcentage de plannings envoyés le jeudi soir. Ça, c''est un indicateur de moyens. Et là, ça devient intéressant, parce que je peux agir dessus chaque semaine. Si jeudi soir j''ai 60 % des plannings envoyés, je sais que lundi il y aura des retards, et je peux encore faire quelque chose vendredi.

**Claire** — Combien d''indicateurs, au final ?

**Sandrine** — Six. Trois de résultat, trois de moyens. Plannings envoyés le jeudi, remplacements trouvés en moins de 24 heures, et entretiens individuels réalisés dans le trimestre, parce que le turnover, ça se prévient en parlant aux gens avant qu''elles partent.

**Claire** — Vous les regardez comment, ces six chiffres ?

**Sandrine** — Chaque lundi, en réunion de coordination, dix minutes. C''est le premier point de l''ordre du jour. Le tableau est affiché dans le bureau, avec les six lignes, la valeur de la semaine, la cible, et une couleur. Vert, orange, rouge. On ne commente pas le vert. On regarde l''orange et le rouge, on cherche la cause, on décide une action, une seule, pour la semaine.

**Claire** — Une seule ?

**Sandrine** — Une seule. Au début, j''en décidais cinq, il ne s''en faisait aucune. Une action, tenue, ça change les chiffres de la semaine suivante. Et ça, l''équipe le voit. C''est ça qui a changé le rapport aux chiffres : au début, elles vivaient le tableau comme de la surveillance. Quand elles ont vu que l''orange devenait vert parce qu''on avait changé quelque chose ensemble, c''est devenu leur tableau.

**Claire** — Il y a eu des effets pervers ? On parle souvent de l''indicateur qui devient l''objectif.

**Sandrine** — Oui, un beau. Le taux d''interventions à l''heure a grimpé très vite. Trop vite. Et j''ai découvert que les intervenantes écourtaient la fin de certaines interventions pour arriver à l''heure à la suivante. Le chiffre était bon, le service était moins bon.

**Claire** — Et vous avez fait quoi ?

**Sandrine** — J''ai ajouté un garde-fou : la durée réelle des interventions par rapport à la durée prévue. Si on est à l''heure mais qu''on fait quarante minutes au lieu d''une heure, c''est rouge. Et surtout, j''ai arrêté de parler du taux d''à-l''heure comme d''une performance individuelle. C''est un chiffre de l''agence. On cherche les causes ensemble, on ne cherche pas les coupables.

**Claire** — Ça, c''est un point important pour nos auditeurs : le tableau de bord sert à comprendre, pas à juger.

**Sandrine** — Dès que les gens sentent que le chiffre sert à les juger, ils le manipulent. Pas par malhonnêteté : par instinct de protection. Si vous voulez des chiffres vrais, il faut qu''ils ne coûtent rien à dire.

**Claire** — Et vis-à-vis de votre directrice, ça a changé quoi ?

**Sandrine** — Tout. Avant, elle m''appelait pour me demander des chiffres, et j''étais sur la défensive. Maintenant, elle reçoit mon tableau le lundi midi, avec trois lignes de commentaire : ce qui va, ce qui ne va pas, ce que je fais. Elle ne m''appelle plus pour savoir, elle m''appelle pour discuter. Et quand j''ai besoin de quelque chose, une intervenante en plus, un logiciel, j''ai un chiffre pour le justifier.

**Claire** — Si vous deviez donner trois conseils à quelqu''un qui construit son premier tableau de bord ?

**Sandrine** — Un : partez de vos objectifs, pas de ce que le logiciel sait sortir. Deux : pas plus de six ou sept indicateurs, et pour chacun, une définition écrite, sinon vous passerez vos réunions à discuter du chiffre au lieu de l''action. Trois : regardez-le chaque semaine avec l''équipe, et décidez une action. Un tableau qu''on regarde seul dans son bureau, c''est un journal intime.

**Claire** — Et le contrat avec la mutuelle ?

**Sandrine** — On l''a récupéré l''année suivante. Avec le tableau de bord dans le dossier de candidature.

**Claire** — Merci Sandrine. Pour résumer : sans mesure, on espère ; trop de mesure, on ne voit plus rien ; six ou sept indicateurs issus des objectifs, définis, affichés, discutés chaque semaine avec une action décidée, et un garde-fou dès qu''un chiffre progresse trop vite pour être vrai.

**Sandrine** — Et des chiffres qui ne servent jamais à punir.

**Claire** — Et des chiffres qui ne servent jamais à punir. À bientôt.

## Sources
indicateurs de résultat / de moyens (Robert S. Kaplan et David P. Norton, *The Balanced Scorecard*, Harvard Business School Press, 1996) ; loi de Goodhart (Charles Goodhart, 1975 ; formulation de Marilyn Strathern, 1997) ; rituel hebdomadaire de pilotage.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Version écrite de l''épisode (le texte de référence ; l''enregistrement peut le formuler autrement).

Conversation entre Claire, animatrice IDEAFORMA et Sandrine, responsable d''une agence de services à la personne (14 salariés), promue responsable après six ans comme intervenante (personnage fictif).

**Claire** — Bonjour à tous. Dans ce podcast, on parle pilotage, et surtout de ce qui se passe quand on n''en a pas. Sandrine, vous dirigez une agence de services à domicile depuis trois ans. Avant, vous étiez intervenante. Comment pilotiez-vous, au début ?

**Sandrine** — Au ressenti, honnêtement. Je connaissais les bénéficiaires, je connaissais les intervenantes, je savais « à peu près » où on en était. Quand ma directrice régionale me demandait un chiffre, je le cherchais pendant deux heures dans le logiciel et je lui envoyais un truc dont je n''étais pas sûre.

**Claire** — Et à quel moment ça a posé problème ?

**Sandrine** — Le jour où on a perdu un gros contrat avec une mutuelle. Ils nous ont dit : « Vos interventions sont en retard une fois sur cinq. » Et moi, je suis tombée des nues. J''avais l''impression que ça allait. En fait, je voyais les retards qu''on me signalait, pas ceux qu''on ne me signalait pas.

**Claire** — C''est exactement ce qu''on appelle piloter au rétroviseur. Vous voyez le problème quand il est déjà arrivé.

**Sandrine** — Pire que ça : je le voyais quand quelqu''un d''autre me le montrait. Ma directrice m''a dit une phrase que je n''ai pas oubliée : « Si tu ne mesures pas, tu ne sais pas. Et si tu ne sais pas, tu ne manages pas, tu espères. »

**Claire** — Qu''est-ce que vous avez fait ?

**Sandrine** — La première chose, c''est que j''ai voulu tout mesurer. J''ai sorti un tableau Excel avec vingt-cinq colonnes. Taux de retard, heures facturées, heures non facturées, absences, kilomètres, satisfaction, réclamations, taux de remplacement… Et j''ai tenu ça trois semaines.

**Claire** — Pourquoi trois semaines ?

**Sandrine** — Parce que ça me prenait deux heures chaque lundi, que personne ne le regardait, et que moi-même je ne savais plus ce qui était important dedans. Vingt-cinq chiffres, c''est comme zéro chiffre.

**Claire** — Donc vous êtes passée de rien à trop, et ensuite ?

**Sandrine** — Ensuite j''ai fait ce que j''aurais dû faire au départ : je suis partie de mes objectifs. Ma directrice attendait trois choses : les interventions à l''heure, les plannings remplis, et pas de départ d''intervenante. Trois objectifs, donc trois indicateurs de résultat. Le taux d''interventions à l''heure, le taux de remplissage des plannings, et le turnover.

**Claire** — Et vous avez ajouté des indicateurs de moyens ?

**Sandrine** — Oui, mais ça, je l''ai compris plus tard. Au début, je n''avais que les trois résultats, et je les regardais à la fin du mois. C''était mieux, mais c''était encore du rétroviseur. Le déclic, c''est quand j''ai cherché pourquoi les interventions étaient en retard. En fait, c''était presque toujours la même cause : les plannings de la semaine étaient envoyés aux intervenantes le lundi matin, elles découvraient leurs trajets au dernier moment, et le premier retard de la journée se propageait sur toute la journée.

**Claire** — Donc la cause était en amont.

**Sandrine** — La cause, c''était le vendredi, pas le lundi. J''ai ajouté un indicateur : le pourcentage de plannings envoyés le jeudi soir. Ça, c''est un indicateur de moyens. Et là, ça devient intéressant, parce que je peux agir dessus chaque semaine. Si jeudi soir j''ai 60 % des plannings envoyés, je sais que lundi il y aura des retards, et je peux encore faire quelque chose vendredi.

**Claire** — Combien d''indicateurs, au final ?

**Sandrine** — Six. Trois de résultat, trois de moyens. Plannings envoyés le jeudi, remplacements trouvés en moins de 24 heures, et entretiens individuels réalisés dans le trimestre, parce que le turnover, ça se prévient en parlant aux gens avant qu''elles partent.

**Claire** — Vous les regardez comment, ces six chiffres ?

**Sandrine** — Chaque lundi, en réunion de coordination, dix minutes. C''est le premier point de l''ordre du jour. Le tableau est affiché dans le bureau, avec les six lignes, la valeur de la semaine, la cible, et une couleur. Vert, orange, rouge. On ne commente pas le vert. On regarde l''orange et le rouge, on cherche la cause, on décide une action, une seule, pour la semaine.

**Claire** — Une seule ?

**Sandrine** — Une seule. Au début, j''en décidais cinq, il ne s''en faisait aucune. Une action, tenue, ça change les chiffres de la semaine suivante. Et ça, l''équipe le voit. C''est ça qui a changé le rapport aux chiffres : au début, elles vivaient le tableau comme de la surveillance. Quand elles ont vu que l''orange devenait vert parce qu''on avait changé quelque chose ensemble, c''est devenu leur tableau.

**Claire** — Il y a eu des effets pervers ? On parle souvent de l''indicateur qui devient l''objectif.

**Sandrine** — Oui, un beau. Le taux d''interventions à l''heure a grimpé très vite. Trop vite. Et j''ai découvert que les intervenantes écourtaient la fin de certaines interventions pour arriver à l''heure à la suivante. Le chiffre était bon, le service était moins bon.

**Claire** — Et vous avez fait quoi ?

**Sandrine** — J''ai ajouté un garde-fou : la durée réelle des interventions par rapport à la durée prévue. Si on est à l''heure mais qu''on fait quarante minutes au lieu d''une heure, c''est rouge. Et surtout, j''ai arrêté de parler du taux d''à-l''heure comme d''une performance individuelle. C''est un chiffre de l''agence. On cherche les causes ensemble, on ne cherche pas les coupables.

**Claire** — Ça, c''est un point important pour nos auditeurs : le tableau de bord sert à comprendre, pas à juger.

**Sandrine** — Dès que les gens sentent que le chiffre sert à les juger, ils le manipulent. Pas par malhonnêteté : par instinct de protection. Si vous voulez des chiffres vrais, il faut qu''ils ne coûtent rien à dire.

**Claire** — Et vis-à-vis de votre directrice, ça a changé quoi ?

**Sandrine** — Tout. Avant, elle m''appelait pour me demander des chiffres, et j''étais sur la défensive. Maintenant, elle reçoit mon tableau le lundi midi, avec trois lignes de commentaire : ce qui va, ce qui ne va pas, ce que je fais. Elle ne m''appelle plus pour savoir, elle m''appelle pour discuter. Et quand j''ai besoin de quelque chose, une intervenante en plus, un logiciel, j''ai un chiffre pour le justifier.

**Claire** — Si vous deviez donner trois conseils à quelqu''un qui construit son premier tableau de bord ?

**Sandrine** — Un : partez de vos objectifs, pas de ce que le logiciel sait sortir. Deux : pas plus de six ou sept indicateurs, et pour chacun, une définition écrite, sinon vous passerez vos réunions à discuter du chiffre au lieu de l''action. Trois : regardez-le chaque semaine avec l''équipe, et décidez une action. Un tableau qu''on regarde seul dans son bureau, c''est un journal intime.

**Claire** — Et le contrat avec la mutuelle ?

**Sandrine** — On l''a récupéré l''année suivante. Avec le tableau de bord dans le dossier de candidature.

**Claire** — Merci Sandrine. Pour résumer : sans mesure, on espère ; trop de mesure, on ne voit plus rien ; six ou sept indicateurs issus des objectifs, définis, affichés, discutés chaque semaine avec une action décidée, et un garde-fou dès qu''un chiffre progresse trop vite pour être vrai.

**Sandrine** — Et des chiffres qui ne servent jamais à punir.

**Claire** — Et des chiffres qui ne servent jamais à punir. À bientôt.

## Sources
indicateurs de résultat / de moyens (Robert S. Kaplan et David P. Norton, *The Balanced Scorecard*, Harvard Business School Press, 1996) ; loi de Goodhart (Charles Goodhart, 1975 ; formulation de Marilyn Strathern, 1997) ; rituel hebdomadaire de pilotage.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 9;
  n := n + 1;

  -- 3.1-video-communication-du-manager.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Module 3 — Communiquer, animer, conduire les entretiens

Bienvenue dans le module 3. Au module 1, vous avez vu que Mintzberg avait chronométré des managers : entre 60 et 80 % de leur temps passe en communication orale. Ce module est consacré à ce temps-là. Comment écouter, comment faire un retour, comment conduire un entretien, comment animer une réunion, comment parler à sa hiérarchie.

Commençons par une idée qui change tout : en tant que manager, vous ne communiquez jamais « pour rien ».

## Tout ce que vous faites est un message

Quand vous êtes salarié dans une équipe, vos paroles sont des paroles. Quand vous êtes manager, elles deviennent des signaux. Un silence après une erreur, une remarque en passant, un e-mail envoyé à 22 h, une réunion annulée : tout est interprété, parce que tout le monde essaie de comprendre ce que le chef pense et ce qu''il attend.

Cela a une conséquence : vous ne pouvez pas ne pas communiquer. Si vous ne dites rien sur le retard de Lucas, vous avez communiqué que les retards sont tolérés. Si vous ne félicitez pas Nadia pour une peinture parfaite, vous avez communiqué que la qualité est normale et ne mérite pas un mot.

Le manager qui « ne dit rien pour ne pas faire de vagues » fait, en réalité, beaucoup de vagues.

## Les quatre situations

Dans une semaine de manager, la communication prend quatre formes, et chacune a ses règles.

L''écrit : e-mails, messages, notes affichées, comptes rendus. Il trace, il informe, il ne convainc pas. On n''annonce pas une mauvaise nouvelle par écrit, on ne recadre pas par message, on ne règle pas un conflit par e-mail. L''écrit vient après l''oral, pour confirmer.

L''oral individuel : la conversation de couloir, le point de cinq minutes, l''entretien formel. C''est là que se joue la relation. Nous y consacrons quatre leçons : l''écoute active, le feedback, l''entretien de suivi et l''entretien de parcours professionnel.

La réunion : le moment collectif. Elle sert à aligner, décider, partager. Mal menée, elle coûte des heures et ne produit rien. La leçon 3.7 vous donne la méthode.

La hiérarchie : la communication vers le haut et depuis le haut. Vous en avez vu les principes au module 1 ; le podcast de ce module traite des situations difficiles : dire non, alerter, négocier.

## Trois principes qui traversent tout

Trois principes valent pour les quatre situations.

Premier principe : les faits d''abord. Ce que vous avez vu, entendu, mesuré. Pas ce que vous en pensez, pas ce que vous supposez des intentions. « Tu es arrivé à 8 h 20 trois fois cette semaine » est un fait. « Tu t''en fiches » est une interprétation. Les faits se discutent ; les interprétations se contestent.

Deuxième principe : le bon canal. Ce qui est délicat se dit en face, seul à seul. Ce qui concerne tout le monde se dit en réunion. Ce qui doit être retenu s''écrit. Inverser les canaux — recadrer en réunion, annoncer une réorganisation par e-mail — crée des dégâts que le contenu du message ne justifiait pas.

Troisième principe : l''écoute avant la parole. La plupart des managers parlent trop et écoutent peu. Ils arrivent en entretien avec leur conclusion. Or, ce que vous ne savez pas est presque toujours plus important que ce que vous voulez dire. La leçon suivante y est consacrée.

## À l''atelier Garnier

À l''atelier Garnier, ce module va suivre Karim dans trois situations : un retour à faire à Julien après ses reprises, un entretien avec Marc qui se sent oublié, un recadrage de Lucas sur ses retards. Et sa première réunion d''équipe, celle où l''organisation du module 2 est présentée.

Vous verrez qu''il n''y a pas de recette miracle, mais des méthodes simples qui évitent les erreurs qui coûtent cher.

À tout de suite pour l''écoute active.

## Sources
Henry Mintzberg, *The Nature of Managerial Work*, Harper & Row, 1973 ; Paul Watzlawick, Janet Helmick Beavin, Don D. Jackson, *Une logique de la communication*, Seuil, 1972 (éd. originale *Pragmatics of Human Communication*, 1967), « on ne peut pas ne pas communiquer ».
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Module 3 — Communiquer, animer, conduire les entretiens

Bienvenue dans le module 3. Au module 1, vous avez vu que Mintzberg avait chronométré des managers : entre 60 et 80 % de leur temps passe en communication orale. Ce module est consacré à ce temps-là. Comment écouter, comment faire un retour, comment conduire un entretien, comment animer une réunion, comment parler à sa hiérarchie.

Commençons par une idée qui change tout : en tant que manager, vous ne communiquez jamais « pour rien ».

## Tout ce que vous faites est un message

Quand vous êtes salarié dans une équipe, vos paroles sont des paroles. Quand vous êtes manager, elles deviennent des signaux. Un silence après une erreur, une remarque en passant, un e-mail envoyé à 22 h, une réunion annulée : tout est interprété, parce que tout le monde essaie de comprendre ce que le chef pense et ce qu''il attend.

Cela a une conséquence : vous ne pouvez pas ne pas communiquer. Si vous ne dites rien sur le retard de Lucas, vous avez communiqué que les retards sont tolérés. Si vous ne félicitez pas Nadia pour une peinture parfaite, vous avez communiqué que la qualité est normale et ne mérite pas un mot.

Le manager qui « ne dit rien pour ne pas faire de vagues » fait, en réalité, beaucoup de vagues.

## Les quatre situations

Dans une semaine de manager, la communication prend quatre formes, et chacune a ses règles.

L''écrit : e-mails, messages, notes affichées, comptes rendus. Il trace, il informe, il ne convainc pas. On n''annonce pas une mauvaise nouvelle par écrit, on ne recadre pas par message, on ne règle pas un conflit par e-mail. L''écrit vient après l''oral, pour confirmer.

L''oral individuel : la conversation de couloir, le point de cinq minutes, l''entretien formel. C''est là que se joue la relation. Nous y consacrons quatre leçons : l''écoute active, le feedback, l''entretien de suivi et l''entretien de parcours professionnel.

La réunion : le moment collectif. Elle sert à aligner, décider, partager. Mal menée, elle coûte des heures et ne produit rien. La leçon 3.7 vous donne la méthode.

La hiérarchie : la communication vers le haut et depuis le haut. Vous en avez vu les principes au module 1 ; le podcast de ce module traite des situations difficiles : dire non, alerter, négocier.

## Trois principes qui traversent tout

Trois principes valent pour les quatre situations.

Premier principe : les faits d''abord. Ce que vous avez vu, entendu, mesuré. Pas ce que vous en pensez, pas ce que vous supposez des intentions. « Tu es arrivé à 8 h 20 trois fois cette semaine » est un fait. « Tu t''en fiches » est une interprétation. Les faits se discutent ; les interprétations se contestent.

Deuxième principe : le bon canal. Ce qui est délicat se dit en face, seul à seul. Ce qui concerne tout le monde se dit en réunion. Ce qui doit être retenu s''écrit. Inverser les canaux — recadrer en réunion, annoncer une réorganisation par e-mail — crée des dégâts que le contenu du message ne justifiait pas.

Troisième principe : l''écoute avant la parole. La plupart des managers parlent trop et écoutent peu. Ils arrivent en entretien avec leur conclusion. Or, ce que vous ne savez pas est presque toujours plus important que ce que vous voulez dire. La leçon suivante y est consacrée.

## À l''atelier Garnier

À l''atelier Garnier, ce module va suivre Karim dans trois situations : un retour à faire à Julien après ses reprises, un entretien avec Marc qui se sent oublié, un recadrage de Lucas sur ses retards. Et sa première réunion d''équipe, celle où l''organisation du module 2 est présentée.

Vous verrez qu''il n''y a pas de recette miracle, mais des méthodes simples qui évitent les erreurs qui coûtent cher.

À tout de suite pour l''écoute active.

## Sources
Henry Mintzberg, *The Nature of Managerial Work*, Harper & Row, 1973 ; Paul Watzlawick, Janet Helmick Beavin, Don D. Jackson, *Une logique de la communication*, Seuil, 1972 (éd. originale *Pragmatics of Human Communication*, 1967), « on ne peut pas ne pas communiquer ».
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 1;
  n := n + 1;

  -- 3.10-cas-pratique-trois-entretiens-garnier.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Voici trois situations, et pour chacune un entretien à préparer par écrit avec les gabarits de la fiche 3.9. Travaillez d''abord seul, sans regarder le corrigé, une trentaine de minutes. Puis comparez : plusieurs formulations sont acceptables, mais certaines erreurs ne le sont pas.

## Situation A : Thierry et la réunion

Lors de la première réunion d''équipe (leçon 3.7), Thierry, carrossier depuis 28 ans, a parlé quinze minutes sur « comment on faisait avant », a coupé Nadia deux fois, et a conclu par : « De toute façon, les plannings, on en a vu passer, ça dure trois semaines. » Devant l''équipe, Karim a cadré poliment. Le lendemain, il constate que Thierry n''a pas fait le contrôle des finitions de Julien, alors que la décision a été prise en réunion.

Question A1. Karim doit-il faire un feedback à Thierry ? Sur quoi exactement : la prise de parole en réunion, le contrôle non fait, ou les deux ? Dans quel ordre ?

Question A2. Préparez le feedback avec le gabarit 1 (SBI). Rédigez les phrases que Karim prononce, y compris la question finale.

Question A3. Thierry répond : « Je ne suis pas contremaître, moi. Si tu veux un contrôleur, tu le paies. » Que répond Karim ?

## Situation B : L''entretien de suivi de Sophie

Sophie, secrétaire depuis 15 ans, vit mal le nouveau circuit des demandes (elle ne donne plus de priorités directement aux carrossiers ; elle passe par Karim). Elle l''a dit à Michel, pas à Karim. Michel en a parlé à Karim : « Sophie dit que tu la mets de côté. » C''est le premier entretien de suivi de Karim avec Sophie ; ils étaient collègues il y a deux mois.

Question B1. Comment Karim ouvre-t-il l''entretien ? Doit-il mentionner ce que Michel lui a rapporté ? Si oui, comment ?

Question B2. Rédigez trois questions ouvertes que Karim pose, et une reformulation possible d''une réponse de Sophie.

Question B3. Sophie dit : « Avant, quand un client appelait, je réglais ça en deux minutes avec Thierry. Maintenant il faut te trouver, et tu es sous une voiture. Les clients attendent. » Quel est le problème réel ? Quels engagements Karim peut-il prendre ?

## Situation C : Karim et Michel

Trois semaines après la réorganisation, les chiffres sont bons (délais tenus : 91 %, aucune reprise). Mais Michel a repris ses habitudes : mardi, il a changé le planning à 10 h sans prévenir pour faire passer un client ami, et vendredi il a crié sur Lucas devant tout le monde pour une pièce mal rangée. L''équipe regarde Karim.

Question C1. Karim doit-il parler à Michel ? Comment qualifiez-vous cette communication (feedback, alerte, négociation) ?

Question C2. Préparez l''échange avec le gabarit 5. Qu''est-ce que Karim demande à Michel de décider ?

Question C3. Michel répond : « C''est mon atelier, je fais ce que je veux. » Qu''est-ce que Karim dit, et qu''est-ce qu''il fait ensuite ?

---

# Corrigé

## Situation A

A1. Oui, et sur les deux sujets, mais pas dans le même entretien et pas dans le même ordre. Le contrôle non fait est le plus important : c''est une décision d''équipe non appliquée, avec un impact direct sur l''objectif « une reprise par mois au plus ». Il se traite en premier, le jour même. La prise de parole en réunion est un sujet relationnel ; il se traite ensuite, avec la méthode DESC, dans un entretien distinct ou au point de suivi suivant, sinon Thierry entend « on me reproche tout ».

A2. Feedback sur le contrôle, en privé, le jour même :

Situation : « Hier en réunion, on a décidé que chaque finition de Julien passait par ton contrôle avant restitution. Ce matin, la Mégane de Lanvin est sortie à 11 h. »
Comportement : « Elle n''a pas été contrôlée. Julien me l''a confirmé. »
Impact : « Si elle revient avec un défaut, on a une reprise, c''est exactement ce qu''on veut éviter. Et l''équipe a vu qu''une décision de réunion pouvait ne pas être appliquée dès le lendemain. »
Attente : « À partir de maintenant, aucune finition de Julien ne sort sans que tu l''aies vue. Ça prend dix minutes. Si tu n''es pas disponible, tu me le dis et je regarde moi-même. »
Question : « Qu''est-ce qui a fait que ça ne s''est pas fait ce matin ? »

Notez que la question ouverte aurait pu venir plus tôt, juste après les faits : c''est aussi une bonne option. Ce qui compte : des faits datés, pas de « tu ne veux pas jouer le jeu », un impact concret, une attente précise.

A3. Thierry soulève un vrai sujet, sous une forme agressive. Karim ne discute pas la forme sur le moment, il traite le fond :

« Tu as raison sur un point : contrôler, c''est une responsabilité en plus. Je l''ai proposé parce que tu es le seul, avec moi, à voir un défaut de finition avant le client. Ce n''est pas un poste de contremaître, c''est dix minutes par véhicule. Sur la reconnaissance, je ne décide pas de ta paie, mais j''en parle à Michel cette semaine. Et à ton entretien de parcours professionnel, ce rôle de référent qualité aura sa place dans les compétences qu''on note. Ce que je te demande aujourd''hui, c''est que le contrôle soit fait. Est-ce qu''on est d''accord là-dessus ? »

Il note : la demande implicite de Thierry (reconnaissance de son expertise, peut-être financière), à porter à Michel ; l''échange lui-même, daté. Si Thierry refuse net, ce n''est plus un feedback, c''est un refus d''appliquer une consigne : recadrage, puis remontée à Michel. Erreurs à éviter : promettre une augmentation ; céder (« bon, laisse tomber ») ; répondre sur le ton.

## Situation B

B1. Karim ouvre comme pour tout entretien de suivi : objet, durée, question ouverte. Il ne commence pas par ce que Michel a rapporté : Sophie se sentirait à la fois mise en cause et prise en faute d''être allée voir le patron. Il écoute d''abord. Si Sophie n''aborde pas le sujet d''elle-même, il l''introduit, en son nom à lui, sans citer Michel comme source d''une plainte : « J''ai le sentiment que le nouveau circuit des demandes te pèse. Je voudrais qu''on en parle. » Être transparent sur le fait que Michel lui a parlé n''est pas interdit, mais ce n''est utile que si Sophie le sait déjà ; sinon, cela crée un triangle.

B2. Questions ouvertes possibles : « Comment tu vis les deux mois qui viennent de passer ? » ; « Qu''est-ce qui a changé dans ta journée avec le nouveau circuit ? » ; « De quoi aurais-tu besoin pour que ça fonctionne, de ton côté ? » Reformulation d''une réponse possible : « Si je comprends bien, tu as l''impression qu''on t''a retiré quelque chose que tu faisais bien depuis quinze ans, et que personne ne t''a expliqué pourquoi. »

B3. Le problème réel n''est pas la fierté de Sophie, c''est que le circuit conçu au module 2 a un défaut : il fait passer toutes les demandes par une personne qui est souvent indisponible. Sophie a raison sur le fait ; Karim a raison sur le principe (une seule personne fixe les priorités). Engagements possibles : Karim s''engage à un créneau de disponibilité pour Sophie (à 8 h 30 et à 13 h 30, cinq minutes, chaque jour) et à répondre à un message dans les 15 minutes ; il lui reconnaît explicitement la gestion des demandes non urgentes en autonomie (délai supérieur à 48 h) ; Sophie s''engage à faire passer par lui les demandes qui touchent le planning du jour. Point dans quinze jours. Et Karim explique ce qu''il n''avait pas expliqué : pourquoi le circuit a changé (les interruptions de Julien, la coulure). L''erreur à éviter : défendre le circuit tel quel, ou le supprimer pour faire plaisir.

## Situation C

C1. Oui, il doit parler à Michel, et vite : l''équipe le regarde, et son silence serait un message (leçon 3.1). Les deux faits n''ont pas la même nature. Le planning changé sans prévenir est un manquement à une règle que Michel a lui-même validée : c''est un feedback vers le haut, avec des faits et un impact. Le cri sur Lucas est un comportement qui touche à la relation et à la dignité de l''apprenti : c''est un feedback plus délicat, en DESC, et, s''il se répétait, une alerte. Il n''y a pas de négociation ici, pas encore.

C2. Préparation :

Les faits : mardi 10 h, planning modifié pour la 3008 de M. Roux, sans passage par Karim ; vendredi 16 h, remontrances à Lucas devant l''équipe pour une pièce mal rangée.
L''impact : mardi, la Kangoo de Ferrand a été décalée d''un jour (délai non tenu, le premier depuis trois semaines) ; vendredi, Lucas a passé l''après-midi muet, Julien et Nadia ont commenté ; la règle « une seule personne fixe les priorités », affichée dans l''atelier, a été contredite par celui qui l''a signée.
Option 1 (recommandée) : les demandes de Michel passent par Karim, y compris ses clients personnels ; Michel s''engage à ne pas faire de remarque à un salarié devant les autres et à passer par Karim quand quelque chose ne va pas.
Option 2 : Michel garde la main sur le planning, et Karim cesse de le tenir, ce qui revient à la situation d''avant, avec ses résultats.
Ce que Karim demande : que Michel choisisse, et que ce soit clair pour l''équipe.
Formulation d''ouverture : « Michel, j''ai besoin de dix minutes. Les chiffres sont bons, 91 % de délais tenus, zéro reprise. Deux choses cette semaine risquent de tout défaire, et je préfère vous en parler maintenant. »

C3. Michel a le droit de dire cela : c''est son entreprise. Karim ne conteste pas ce droit ; il en tire les conséquences, calmement : « C''est votre atelier, et c''est vous qui décidez. Ce que je vous dis, c''est ce que ça produit : si les priorités changent sans passer par moi, je ne peux pas tenir les délais que vous m''avez demandés, et l''équipe ne saura plus qui commande. Si vous préférez reprendre le planning, dites-le-moi, et je le dis à l''équipe. Si vous voulez que je le tienne, il faut que vos demandes passent par moi. Ce n''est pas une question d''autorité, c''est une question de résultat. » Puis il confirme par écrit, en deux lignes, ce qui a été dit et décidé.

Sur Lucas, Karim ne lâche pas, mais il choisit son moment : « Et pour Lucas, je vous demande une chose : quand quelque chose ne va pas, dites-le-moi, et je le règle avec lui. Un apprenti qu''on reprend devant tout le monde apprend à se cacher, pas à ranger. » Ensuite, il va voir Lucas, seul : il ne désavoue pas Michel (« il a eu tort ») ; il traite le fond (le rangement, la règle) et il dit ce qu''il a fait (« j''en ai parlé avec Michel, la prochaine fois ça passe par moi »).

Erreurs à éviter : se taire, se plaindre de Michel devant l''équipe, menacer de partir, ou laisser Lucas seul avec ce qui s''est passé.

## Ce que ce cas illustre

Les trois entretiens utilisent la même matière : des faits datés, un impact concret, une attente ou une demande claire, une question, une trace. Ce qui change, c''est la direction (vers un collègue expérimenté, vers une ancienne collègue, vers le patron) et le dosage entre feedback, écoute et alerte. Avec cette base, la plupart des entretiens difficiles se préparent en un quart d''heure.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Voici trois situations, et pour chacune un entretien à préparer par écrit avec les gabarits de la fiche 3.9. Travaillez d''abord seul, sans regarder le corrigé, une trentaine de minutes. Puis comparez : plusieurs formulations sont acceptables, mais certaines erreurs ne le sont pas.

## Situation A : Thierry et la réunion

Lors de la première réunion d''équipe (leçon 3.7), Thierry, carrossier depuis 28 ans, a parlé quinze minutes sur « comment on faisait avant », a coupé Nadia deux fois, et a conclu par : « De toute façon, les plannings, on en a vu passer, ça dure trois semaines. » Devant l''équipe, Karim a cadré poliment. Le lendemain, il constate que Thierry n''a pas fait le contrôle des finitions de Julien, alors que la décision a été prise en réunion.

Question A1. Karim doit-il faire un feedback à Thierry ? Sur quoi exactement : la prise de parole en réunion, le contrôle non fait, ou les deux ? Dans quel ordre ?

Question A2. Préparez le feedback avec le gabarit 1 (SBI). Rédigez les phrases que Karim prononce, y compris la question finale.

Question A3. Thierry répond : « Je ne suis pas contremaître, moi. Si tu veux un contrôleur, tu le paies. » Que répond Karim ?

## Situation B : L''entretien de suivi de Sophie

Sophie, secrétaire depuis 15 ans, vit mal le nouveau circuit des demandes (elle ne donne plus de priorités directement aux carrossiers ; elle passe par Karim). Elle l''a dit à Michel, pas à Karim. Michel en a parlé à Karim : « Sophie dit que tu la mets de côté. » C''est le premier entretien de suivi de Karim avec Sophie ; ils étaient collègues il y a deux mois.

Question B1. Comment Karim ouvre-t-il l''entretien ? Doit-il mentionner ce que Michel lui a rapporté ? Si oui, comment ?

Question B2. Rédigez trois questions ouvertes que Karim pose, et une reformulation possible d''une réponse de Sophie.

Question B3. Sophie dit : « Avant, quand un client appelait, je réglais ça en deux minutes avec Thierry. Maintenant il faut te trouver, et tu es sous une voiture. Les clients attendent. » Quel est le problème réel ? Quels engagements Karim peut-il prendre ?

## Situation C : Karim et Michel

Trois semaines après la réorganisation, les chiffres sont bons (délais tenus : 91 %, aucune reprise). Mais Michel a repris ses habitudes : mardi, il a changé le planning à 10 h sans prévenir pour faire passer un client ami, et vendredi il a crié sur Lucas devant tout le monde pour une pièce mal rangée. L''équipe regarde Karim.

Question C1. Karim doit-il parler à Michel ? Comment qualifiez-vous cette communication (feedback, alerte, négociation) ?

Question C2. Préparez l''échange avec le gabarit 5. Qu''est-ce que Karim demande à Michel de décider ?

Question C3. Michel répond : « C''est mon atelier, je fais ce que je veux. » Qu''est-ce que Karim dit, et qu''est-ce qu''il fait ensuite ?

---

# Corrigé

## Situation A

A1. Oui, et sur les deux sujets, mais pas dans le même entretien et pas dans le même ordre. Le contrôle non fait est le plus important : c''est une décision d''équipe non appliquée, avec un impact direct sur l''objectif « une reprise par mois au plus ». Il se traite en premier, le jour même. La prise de parole en réunion est un sujet relationnel ; il se traite ensuite, avec la méthode DESC, dans un entretien distinct ou au point de suivi suivant, sinon Thierry entend « on me reproche tout ».

A2. Feedback sur le contrôle, en privé, le jour même :

Situation : « Hier en réunion, on a décidé que chaque finition de Julien passait par ton contrôle avant restitution. Ce matin, la Mégane de Lanvin est sortie à 11 h. »
Comportement : « Elle n''a pas été contrôlée. Julien me l''a confirmé. »
Impact : « Si elle revient avec un défaut, on a une reprise, c''est exactement ce qu''on veut éviter. Et l''équipe a vu qu''une décision de réunion pouvait ne pas être appliquée dès le lendemain. »
Attente : « À partir de maintenant, aucune finition de Julien ne sort sans que tu l''aies vue. Ça prend dix minutes. Si tu n''es pas disponible, tu me le dis et je regarde moi-même. »
Question : « Qu''est-ce qui a fait que ça ne s''est pas fait ce matin ? »

Notez que la question ouverte aurait pu venir plus tôt, juste après les faits : c''est aussi une bonne option. Ce qui compte : des faits datés, pas de « tu ne veux pas jouer le jeu », un impact concret, une attente précise.

A3. Thierry soulève un vrai sujet, sous une forme agressive. Karim ne discute pas la forme sur le moment, il traite le fond :

« Tu as raison sur un point : contrôler, c''est une responsabilité en plus. Je l''ai proposé parce que tu es le seul, avec moi, à voir un défaut de finition avant le client. Ce n''est pas un poste de contremaître, c''est dix minutes par véhicule. Sur la reconnaissance, je ne décide pas de ta paie, mais j''en parle à Michel cette semaine. Et à ton entretien de parcours professionnel, ce rôle de référent qualité aura sa place dans les compétences qu''on note. Ce que je te demande aujourd''hui, c''est que le contrôle soit fait. Est-ce qu''on est d''accord là-dessus ? »

Il note : la demande implicite de Thierry (reconnaissance de son expertise, peut-être financière), à porter à Michel ; l''échange lui-même, daté. Si Thierry refuse net, ce n''est plus un feedback, c''est un refus d''appliquer une consigne : recadrage, puis remontée à Michel. Erreurs à éviter : promettre une augmentation ; céder (« bon, laisse tomber ») ; répondre sur le ton.

## Situation B

B1. Karim ouvre comme pour tout entretien de suivi : objet, durée, question ouverte. Il ne commence pas par ce que Michel a rapporté : Sophie se sentirait à la fois mise en cause et prise en faute d''être allée voir le patron. Il écoute d''abord. Si Sophie n''aborde pas le sujet d''elle-même, il l''introduit, en son nom à lui, sans citer Michel comme source d''une plainte : « J''ai le sentiment que le nouveau circuit des demandes te pèse. Je voudrais qu''on en parle. » Être transparent sur le fait que Michel lui a parlé n''est pas interdit, mais ce n''est utile que si Sophie le sait déjà ; sinon, cela crée un triangle.

B2. Questions ouvertes possibles : « Comment tu vis les deux mois qui viennent de passer ? » ; « Qu''est-ce qui a changé dans ta journée avec le nouveau circuit ? » ; « De quoi aurais-tu besoin pour que ça fonctionne, de ton côté ? » Reformulation d''une réponse possible : « Si je comprends bien, tu as l''impression qu''on t''a retiré quelque chose que tu faisais bien depuis quinze ans, et que personne ne t''a expliqué pourquoi. »

B3. Le problème réel n''est pas la fierté de Sophie, c''est que le circuit conçu au module 2 a un défaut : il fait passer toutes les demandes par une personne qui est souvent indisponible. Sophie a raison sur le fait ; Karim a raison sur le principe (une seule personne fixe les priorités). Engagements possibles : Karim s''engage à un créneau de disponibilité pour Sophie (à 8 h 30 et à 13 h 30, cinq minutes, chaque jour) et à répondre à un message dans les 15 minutes ; il lui reconnaît explicitement la gestion des demandes non urgentes en autonomie (délai supérieur à 48 h) ; Sophie s''engage à faire passer par lui les demandes qui touchent le planning du jour. Point dans quinze jours. Et Karim explique ce qu''il n''avait pas expliqué : pourquoi le circuit a changé (les interruptions de Julien, la coulure). L''erreur à éviter : défendre le circuit tel quel, ou le supprimer pour faire plaisir.

## Situation C

C1. Oui, il doit parler à Michel, et vite : l''équipe le regarde, et son silence serait un message (leçon 3.1). Les deux faits n''ont pas la même nature. Le planning changé sans prévenir est un manquement à une règle que Michel a lui-même validée : c''est un feedback vers le haut, avec des faits et un impact. Le cri sur Lucas est un comportement qui touche à la relation et à la dignité de l''apprenti : c''est un feedback plus délicat, en DESC, et, s''il se répétait, une alerte. Il n''y a pas de négociation ici, pas encore.

C2. Préparation :

Les faits : mardi 10 h, planning modifié pour la 3008 de M. Roux, sans passage par Karim ; vendredi 16 h, remontrances à Lucas devant l''équipe pour une pièce mal rangée.
L''impact : mardi, la Kangoo de Ferrand a été décalée d''un jour (délai non tenu, le premier depuis trois semaines) ; vendredi, Lucas a passé l''après-midi muet, Julien et Nadia ont commenté ; la règle « une seule personne fixe les priorités », affichée dans l''atelier, a été contredite par celui qui l''a signée.
Option 1 (recommandée) : les demandes de Michel passent par Karim, y compris ses clients personnels ; Michel s''engage à ne pas faire de remarque à un salarié devant les autres et à passer par Karim quand quelque chose ne va pas.
Option 2 : Michel garde la main sur le planning, et Karim cesse de le tenir, ce qui revient à la situation d''avant, avec ses résultats.
Ce que Karim demande : que Michel choisisse, et que ce soit clair pour l''équipe.
Formulation d''ouverture : « Michel, j''ai besoin de dix minutes. Les chiffres sont bons, 91 % de délais tenus, zéro reprise. Deux choses cette semaine risquent de tout défaire, et je préfère vous en parler maintenant. »

C3. Michel a le droit de dire cela : c''est son entreprise. Karim ne conteste pas ce droit ; il en tire les conséquences, calmement : « C''est votre atelier, et c''est vous qui décidez. Ce que je vous dis, c''est ce que ça produit : si les priorités changent sans passer par moi, je ne peux pas tenir les délais que vous m''avez demandés, et l''équipe ne saura plus qui commande. Si vous préférez reprendre le planning, dites-le-moi, et je le dis à l''équipe. Si vous voulez que je le tienne, il faut que vos demandes passent par moi. Ce n''est pas une question d''autorité, c''est une question de résultat. » Puis il confirme par écrit, en deux lignes, ce qui a été dit et décidé.

Sur Lucas, Karim ne lâche pas, mais il choisit son moment : « Et pour Lucas, je vous demande une chose : quand quelque chose ne va pas, dites-le-moi, et je le règle avec lui. Un apprenti qu''on reprend devant tout le monde apprend à se cacher, pas à ranger. » Ensuite, il va voir Lucas, seul : il ne désavoue pas Michel (« il a eu tort ») ; il traite le fond (le rangement, la règle) et il dit ce qu''il a fait (« j''en ai parlé avec Michel, la prochaine fois ça passe par moi »).

Erreurs à éviter : se taire, se plaindre de Michel devant l''équipe, menacer de partir, ou laisser Lucas seul avec ce qui s''est passé.

## Ce que ce cas illustre

Les trois entretiens utilisent la même matière : des faits datés, un impact concret, une attente ou une demande claire, une question, une trace. Ce qui change, c''est la direction (vers un collègue expérimenté, vers une ancienne collègue, vers le patron) et le dosage entre feedback, écoute et alerte. Avec cette base, la plupart des entretiens difficiles se préparent en un quart d''heure.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 10;
  n := n + 1;

  -- 3.11-carnet-application.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Vous avez vu comment écouter, donner un feedback, conduire un entretien de suivi, distinguer l''entretien annuel de l''entretien de parcours professionnel, animer une réunion et communiquer vers votre hiérarchie. À vous de le faire pour votre équipe. Comptez 1 h 30 à 1 h 45. Utilisez les gabarits de la fiche outil (leçon 3.9).

Si vous n''encadrez pas d''équipe, travaillez sur une équipe que vous connaissez (actuelle ou passée), ou sur le cas Garnier en imaginant les situations de votre secteur.

## Étape 1 : Mon inventaire de communication (15 min)

- Sur la semaine écoulée, listez vos échanges de manager : combien d''écrits, combien de conversations individuelles, combien de réunions, combien d''échanges avec votre hiérarchie ? Un ordre de grandeur suffit.
- Pour chacune des quatre situations, notez une chose qui a bien fonctionné et une chose qui a coincé.
- Y a-t-il un message que vous avez envoyé par écrit et qui aurait dû se dire en face ? Un sujet que vous n''avez pas abordé et dont le silence a été « entendu » par l''équipe ?

## Étape 2 : Un feedback réel, préparé (20 min)

- Choisissez une situation récente où un retour s''imposait et n''a pas été fait, ou a été mal fait : un correctif et, obligatoirement, un positif.
- Préparez les deux avec le gabarit 1 : situation datée, comportement observable, impact, attente ou ce qu''il faut refaire, question finale, canal.
- Relisez : y a-t-il un jugement de personne caché dans le comportement (« brouillon », « pas motivé ») ? Remplacez-le par un fait.
- Fixez la date et le lieu où vous les donnerez cette semaine. Notez ici ce qui s''est passé après l''avoir fait.

## Étape 3 : Un entretien de suivi (25 min)

- Choisissez une personne de l''équipe avec qui vous n''avez pas eu de vrai temps individuel depuis longtemps. Préparez l''entretien avec le gabarit 2 : engagements précédents (s''il y en a), objectifs, un retour positif, questions.
- Rédigez vos trois questions ouvertes pour le temps « ressenti et besoins ».
- Planifiez pour le trimestre vos entretiens de suivi avec chacun : dates, durée, lieu. Combien d''heures par mois cela représente-t-il ? Est-ce tenable ? Sinon, qu''est-ce que vous retirez de votre agenda ?
- Vérifiez auprès de votre service RH (ou dans les dossiers) la date du dernier entretien de parcours professionnel de chaque membre de l''équipe et les échéances à venir (première année, puis tous les quatre ans, après la visite médicale de mi-carrière, avant 60 ans, état des lieux récapitulatif tous les huit ans). Notez les entretiens à programmer.

## Étape 4 : Ma prochaine réunion (20 min)

- Quel est l''objet de votre prochaine réunion d''équipe : informer, décider, résoudre ? Si vous ne savez pas répondre, faut-il la tenir ?
- Rédigez son ordre du jour avec le gabarit 4 : points formulés en résultats attendus, temps par point, décisions en premier, dernier point « qui fait quoi, pour quand ».
- Identifiez dans votre équipe un bavard, un silencieux, un négatif (il n''y en a pas toujours). Pour chacun, écrivez la phrase que vous utiliserez.
- Quels rituels votre équipe a-t-elle aujourd''hui (brief quotidien, point hebdo, réunion mensuelle) ? Lequel manque ? Lequel est inutile ?

## Étape 5 : Un message vers le haut (15 min)

- Identifiez un problème ou un besoin que vous n''avez pas encore remonté, ou que vous avez remonté sans obtenir de décision.
- Préparez-le avec le gabarit 5 : fait chiffré, impact, deux options, ce que vous demandez de décider, pour quand.
- Rédigez le message de confirmation écrite que vous enverrez après l''échange (« Comme convenu… »), en quatre lignes maximum.
- Y a-t-il un « on va faire au mieux » que vous avez prononcé récemment et qu''il faut transformer en « oui à ces conditions » ou en « non » ?

## Étape 6 : Bilan (10 min)

- Parmi les six savoir-faire travaillés dans ce module (écouter, faire un retour, conduire un entretien de suivi, préparer un entretien de parcours, animer une réunion, communiquer vers le haut), laquelle est votre point fort ? Laquelle est votre point faible ?
- Quelle est la première chose que vous faites dès demain ? Écrivez-la avec une date.
- Reprenez votre autopositionnement du module 0 : quelles réponses changeriez-vous ?

Conservez ce carnet : le module 4 (motiver, engager, faire progresser) s''appuiera sur les entretiens que vous aurez conduits entre-temps.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Vous avez vu comment écouter, donner un feedback, conduire un entretien de suivi, distinguer l''entretien annuel de l''entretien de parcours professionnel, animer une réunion et communiquer vers votre hiérarchie. À vous de le faire pour votre équipe. Comptez 1 h 30 à 1 h 45. Utilisez les gabarits de la fiche outil (leçon 3.9).

Si vous n''encadrez pas d''équipe, travaillez sur une équipe que vous connaissez (actuelle ou passée), ou sur le cas Garnier en imaginant les situations de votre secteur.

## Étape 1 : Mon inventaire de communication (15 min)

- Sur la semaine écoulée, listez vos échanges de manager : combien d''écrits, combien de conversations individuelles, combien de réunions, combien d''échanges avec votre hiérarchie ? Un ordre de grandeur suffit.
- Pour chacune des quatre situations, notez une chose qui a bien fonctionné et une chose qui a coincé.
- Y a-t-il un message que vous avez envoyé par écrit et qui aurait dû se dire en face ? Un sujet que vous n''avez pas abordé et dont le silence a été « entendu » par l''équipe ?

## Étape 2 : Un feedback réel, préparé (20 min)

- Choisissez une situation récente où un retour s''imposait et n''a pas été fait, ou a été mal fait : un correctif et, obligatoirement, un positif.
- Préparez les deux avec le gabarit 1 : situation datée, comportement observable, impact, attente ou ce qu''il faut refaire, question finale, canal.
- Relisez : y a-t-il un jugement de personne caché dans le comportement (« brouillon », « pas motivé ») ? Remplacez-le par un fait.
- Fixez la date et le lieu où vous les donnerez cette semaine. Notez ici ce qui s''est passé après l''avoir fait.

## Étape 3 : Un entretien de suivi (25 min)

- Choisissez une personne de l''équipe avec qui vous n''avez pas eu de vrai temps individuel depuis longtemps. Préparez l''entretien avec le gabarit 2 : engagements précédents (s''il y en a), objectifs, un retour positif, questions.
- Rédigez vos trois questions ouvertes pour le temps « ressenti et besoins ».
- Planifiez pour le trimestre vos entretiens de suivi avec chacun : dates, durée, lieu. Combien d''heures par mois cela représente-t-il ? Est-ce tenable ? Sinon, qu''est-ce que vous retirez de votre agenda ?
- Vérifiez auprès de votre service RH (ou dans les dossiers) la date du dernier entretien de parcours professionnel de chaque membre de l''équipe et les échéances à venir (première année, puis tous les quatre ans, après la visite médicale de mi-carrière, avant 60 ans, état des lieux récapitulatif tous les huit ans). Notez les entretiens à programmer.

## Étape 4 : Ma prochaine réunion (20 min)

- Quel est l''objet de votre prochaine réunion d''équipe : informer, décider, résoudre ? Si vous ne savez pas répondre, faut-il la tenir ?
- Rédigez son ordre du jour avec le gabarit 4 : points formulés en résultats attendus, temps par point, décisions en premier, dernier point « qui fait quoi, pour quand ».
- Identifiez dans votre équipe un bavard, un silencieux, un négatif (il n''y en a pas toujours). Pour chacun, écrivez la phrase que vous utiliserez.
- Quels rituels votre équipe a-t-elle aujourd''hui (brief quotidien, point hebdo, réunion mensuelle) ? Lequel manque ? Lequel est inutile ?

## Étape 5 : Un message vers le haut (15 min)

- Identifiez un problème ou un besoin que vous n''avez pas encore remonté, ou que vous avez remonté sans obtenir de décision.
- Préparez-le avec le gabarit 5 : fait chiffré, impact, deux options, ce que vous demandez de décider, pour quand.
- Rédigez le message de confirmation écrite que vous enverrez après l''échange (« Comme convenu… »), en quatre lignes maximum.
- Y a-t-il un « on va faire au mieux » que vous avez prononcé récemment et qu''il faut transformer en « oui à ces conditions » ou en « non » ?

## Étape 6 : Bilan (10 min)

- Parmi les six savoir-faire travaillés dans ce module (écouter, faire un retour, conduire un entretien de suivi, préparer un entretien de parcours, animer une réunion, communiquer vers le haut), laquelle est votre point fort ? Laquelle est votre point faible ?
- Quelle est la première chose que vous faites dès demain ? Écrivez-la avec une date.
- Reprenez votre autopositionnement du module 0 : quelles réponses changeriez-vous ?

Conservez ce carnet : le module 4 (motiver, engager, faire progresser) s''appuiera sur les entretiens que vous aurez conduits entre-temps.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 11;
  n := n + 1;

  -- 3.12-quiz.json
  update public.lecons l set contenu = '{"questions": [{"id": "m3q01", "enonce": "Un manager ne dit rien après le troisième retard d''un apprenti dans la semaine. Selon le principe de Watzlawick vu en leçon 3.1, que se passe-t-il ?", "options": ["Rien : tant qu''il ne dit rien, il ne communique pas", "L''apprenti comprendra tout seul qu''il exagère", "Il a communiqué que les retards sont tolérés", "Il a gagné du temps pour préparer une sanction"], "bonnes": [2], "explication": "« On ne peut pas ne pas communiquer » : le silence du manager est lu comme un message par toute l''équipe. Ici, il signifie que le retard passe."}, {"id": "m3q02", "enonce": "Laquelle de ces phrases est une reformulation, au sens de l''écoute active ?", "options": ["« Si je comprends bien, tu découvres les interventions au dernier moment et ça t''oblige à tout lâcher. »", "« Je comprends, moi aussi j''ai connu ça à mes débuts, quand j''étais encore carrossier à plein temps. »", "« Tu devrais en parler directement à Sophie, c''est elle qui reçoit les appels des clients. »", "« Ne t''inquiète pas, ça va s''arranger quand le nouveau planning sera en place. »"], "bonnes": [0], "explication": "Reformuler, c''est redire avec ses mots ce qu''on a compris pour le faire vérifier. Les autres réponses sont un récit de soi, un conseil et un réconfort prématuré, qui interrompent l''écoute."}, {"id": "m3q03", "enonce": "Quel biais consiste à expliquer les erreurs des autres par leur personnalité et les siennes par les circonstances ?", "options": ["L''effet de halo", "L''erreur fondamentale d''attribution", "Le biais de confirmation", "La projection"], "bonnes": [1], "explication": "C''est l''erreur fondamentale d''attribution, décrite par le psychologue Lee Ross en 1977. Le remède : chercher d''abord la cause dans la situation."}, {"id": "m3q04", "enonce": "Dans la méthode SBI, que désigne le « B » (Behavior, comportement) ?", "options": ["Ce que le manager pense de la personne, de son attitude et de sa motivation", "Le besoin exprimé par la personne pendant l''échange", "La bonne pratique que la personne devra adopter ensuite", "Ce que la personne a fait ou dit, observable, sans interprétation"], "bonnes": [3], "explication": "Le comportement est un fait observable. « Une coulure sur l''aile arrière, véhicule sorti sans contrôle » est un comportement ; « tu es brouillon » est une étiquette."}, {"id": "m3q05", "enonce": "Pourquoi le feedback « sandwich » (compliment, critique, compliment) est-il déconseillé ?", "options": ["Parce qu''il prend trop de temps à préparer et à délivrer", "Parce qu''il ne convient qu''aux salariés récemment arrivés", "Parce que le correctif se dilue et que les compliments deviennent suspects", "Parce que le Code du travail l''interdit dans les entretiens formels avec un salarié"], "bonnes": [2], "explication": "Le message correctif se perd ou se dilue, et les compliments deviennent suspects. Un correctif clair et respectueux, et des positifs sincères à d''autres moments, valent mieux."}, {"id": "m3q06", "enonce": "Plusieurs réponses. Quelles règles de forme s''appliquent à un feedback correctif ?", "options": ["Le donner rapidement après les faits", "Le donner en privé", "Regrouper plusieurs reproches pour n''avoir à le faire qu''une fois", "Terminer par une question ouverte"], "bonnes": [0, 1, 3], "explication": "Vite, en privé, un seul sujet à la fois, sur ce qui peut changer, avec une question. Regrouper six reproches n''en fait passer aucun."}, {"id": "m3q07", "enonce": "Dans la trame d''entretien individuel de suivi en cinq temps, à quoi sert le temps « ressenti et besoins » ?", "options": ["À détecter tôt une surcharge, une tension ou une démotivation", "À évaluer la personnalité du salarié et sa motivation profonde", "À préparer la négociation de la prochaine augmentation individuelle", "À remplir le compte rendu obligatoire de l''entretien de parcours professionnel"], "bonnes": [0], "explication": "C''est la partie que les managers sautent, et celle qui fait sortir les problèmes avant qu''ils ne coûtent cher. Le manager écoute et oriente si nécessaire ; il n''est ni médecin ni confident."}, {"id": "m3q08", "enonce": "Quelle est la différence essentielle entre l''entretien annuel d''évaluation et l''entretien de parcours professionnel ?", "options": ["Aucune : ce sont deux noms pour le même entretien, fixé par le Code du travail", "L''entretien annuel est imposé par la loi, l''entretien de parcours est laissé au choix de l''employeur", "L''entretien de parcours est réservé aux salariés qui ont passé la visite médicale de mi-carrière", "L''un, facultatif, évalue l''année ; l''autre, obligatoire, porte sur le parcours"], "bonnes": [3], "explication": "L''évaluation annuelle relève du pouvoir de direction (sauf accord). L''entretien de parcours professionnel est une obligation légale au contenu fixé (compétences, formation, évolution, CPF, CEP), avec un écrit remis au salarié."}, {"id": "m3q09", "enonce": "Depuis la loi du 24 octobre 2025, quelle est la périodicité de droit commun de l''entretien de parcours professionnel, en l''absence d''accord collectif prévoyant une autre périodicité ?", "options": ["Tous les ans, à la date anniversaire de l''embauche, avec un bilan écrit tous les cinq ans", "Dans la première année après l''embauche, puis tous les quatre ans, avec un état des lieux tous les huit ans", "Tous les deux ans, avec un état des lieux récapitulatif du parcours tous les six ans", "Uniquement au retour d''un congé long, et à la demande expresse du salarié"], "bonnes": [1], "explication": "C''est le rythme de l''article L6315-1. S''y ajoutent un entretien dans les deux mois suivant la visite médicale de mi-carrière et des points spécifiques lors du premier entretien dans les deux ans avant 60 ans. Un accord d''entreprise ou de branche peut prévoir une autre périodicité, sans dépasser quatre ans. Tous les deux ans et six ans : c''était l''ancien régime."}, {"id": "m3q10", "enonce": "Une réunion d''équipe de 30 minutes se termine sans qu''aucune décision ni action n''ait été formulée. Quelle est la conséquence principale ?", "options": ["Aucune : l''important est que l''équipe se soit vue", "Le manager doit reconvoquer l''équipe le jour même pour conclure", "L''équipe apprend que les réunions ne servent à rien", "Le compte rendu devient obligatoire et doit être transmis à la direction"], "bonnes": [2], "explication": "Chaque point doit finir par : décidé quoi, qui, pour quand. Le relevé de décisions, suivi à la réunion suivante, est ce qui donne aux réunions leur crédibilité."}, {"id": "m3q11", "enonce": "En réunion, un participant reste silencieux pendant qu''un autre monopolise la parole. Quelle est la bonne conduite de l''animateur ?", "options": ["Cadrer le bavard en notant son point, puis interroger le silencieux sur une question précise", "Laisser faire : le silencieux parlera s''il a vraiment quelque chose d''important à dire", "Interrompre le bavard devant tout le monde pour qu''il comprenne une bonne fois pour toutes", "Reporter la réunion et voir chacun en tête-à-tête pour recueillir les avis"], "bonnes": [0], "explication": "Le bavard se cadre sans humiliation (« merci, je note, je voudrais entendre les autres ») ; le silencieux se sollicite par son nom, sur une question concrète. Un tour de table court est l''outil le plus efficace."}, {"id": "m3q12", "enonce": "Votre directeur vous demande d''absorber une charge que votre équipe ne peut pas tenir. Quelle réponse relève d''une communication de manager vers sa hiérarchie ?", "options": ["« On va faire au mieux. »", "« C''est impossible avec l''équipe actuelle : il faudra vous débrouiller autrement, je ne peux rien faire de plus. »", "Accepter sans discuter, puis expliquer à l''équipe que c''est la direction qui l''impose", "« On tient la moitié ; pour le reste, deux renforts ou deux jours de retard. Que préférez-vous ? »"], "bonnes": [3], "explication": "Les faits, l''impact, des options, une décision demandée, puis une confirmation écrite « comme convenu ». « Faire au mieux » n''est ni un oui ni un non ; se défausser sur la direction devant l''équipe rompt la loyauté."}, {"id": "m3q13", "enonce": "À quoi sert l''écrit (e-mail, note, compte rendu) dans la communication du manager ?", "options": ["À recadrer un collaborateur sans avoir à le voir", "À tracer, informer et confirmer ce qui a été dit à l''oral", "À annoncer une réorganisation pour que tout le monde ait la même version", "À régler un conflit en évitant une confrontation directe"], "bonnes": [1], "explication": "L''écrit trace, il ne convainc pas. On ne recadre pas par message et on n''annonce pas une mauvaise nouvelle par e-mail : l''écrit vient après l''oral."}, {"id": "m3q14", "enonce": "« Pourquoi tu n''as pas vérifié ? » Quel est le problème avec cette question, et par quoi la remplacer ?", "options": ["Aucun problème : elle est directe, et la personne sait à quoi s''en tenir", "Elle est trop longue ; un simple « Alors ? » suffit à faire parler", "C''est un reproche déguisé ; mieux vaut demander ce qui a empêché le contrôle", "Elle doit être posée par écrit, pour garder une trace datée de la réponse du salarié"], "bonnes": [2], "explication": "« Pourquoi tu n''as pas vérifié ? » est une accusation avec un point d''interrogation. « Qu''est-ce qui a fait que le contrôle n''a pas été fait ? » cherche la cause dans la situation, au lieu de pousser la personne à se justifier."}, {"id": "m3q15", "enonce": "Qu''est-ce que l''effet de halo dans l''écoute d''un collaborateur ?", "options": ["Une impression générale, bonne ou mauvaise, qui colore tout ce que la personne dit", "Le fait de ne retenir que la première version des faits qu''on a entendue", "Le fait de supposer que l''autre ressent exactement ce que nous ressentirions à sa place", "L''habitude d''oublier de reformuler quand la personne parle longtemps"], "bonnes": [0], "explication": "Julien a fait deux reprises, donc tout ce qu''il dit sur l''organisation paraît suspect : c''est l''effet de halo. Remède : juger le fait, pas la personne."}, {"id": "m3q16", "enonce": "Quand utilise-t-on la méthode DESC plutôt que SBI ?", "options": ["Pour un retour positif devant l''équipe", "Pour conduire un entretien de parcours professionnel avec un salarié expérimenté", "Jamais : SBI couvre tous les cas de figure", "Quand le sujet touche à la relation, comme un manque de respect"], "bonnes": [3], "explication": "DESC : Décrire les faits, Exprimer en « je », Spécifier ce qu''on demande, Conclure sur les conséquences. On la prépare par écrit, une phrase par étape."}, {"id": "m3q17", "enonce": "Plusieurs réponses. Quels sont les bons réflexes quand on reçoit soi-même un feedback ?", "options": ["Se justifier immédiatement, point par point", "Remercier, même si ça pique", "Demander un exemple pour transformer un jugement en fait", "Dire ce qu''on va en faire"], "bonnes": [1, 2, 3], "explication": "Un manager qui reçoit mal les retours n''en reçoit plus, et pilote à l''aveugle. La justification peut venir plus tard, une fois le retour compris."}, {"id": "m3q18", "enonce": "Quel rythme réaliste la formation propose-t-elle pour les entretiens individuels de suivi d''un manager de proximité ?", "options": ["Une fois par an, à l''occasion de l''entretien annuel d''évaluation", "Cinq minutes par jour avec chacun, au moment du brief du matin", "30 minutes par personne toutes les quatre à six semaines, planifiées", "Uniquement quand un problème le justifie, pour ne pas alourdir l''agenda"], "bonnes": [2], "explication": "Pour huit personnes vues toutes les cinq semaines, cela fait moins d''une heure par semaine. Les dates sont posées à l''avance pour le trimestre, sinon il n''y a « jamais le temps »."}, {"id": "m3q19", "enonce": "Quelle trace l''entretien de parcours professionnel doit-il laisser ?", "options": ["Aucune, c''est un échange informel entre le salarié et son responsable", "Un document écrit, dont une copie est remise au salarié", "Une note dans le carnet personnel du manager", "Un e-mail de synthèse adressé à la direction uniquement"], "bonnes": [1], "explication": "L''article L6315-1 prévoit un document écrit dont une copie est remise au salarié. Le carnet du manager sert aux entretiens de suivi, pas à l''entretien de parcours."}, {"id": "m3q20", "enonce": "Dans une réunion où l''équipe doit prendre une décision, à quel moment le manager donne-t-il son avis ?", "options": ["En dernier, sinon personne ne dira autre chose que ce qu''il a dit", "En premier, pour cadrer le débat et gagner du temps", "Jamais : il laisse l''équipe décider seule pour ne pas l''influencer", "Par écrit, après la réunion, une fois les avis recueillis"], "bonnes": [0], "explication": "L''animateur tient l''objectif et le temps ; dans une décision, il parle en dernier pour ne pas étouffer les avis. Il conclut par : décidé quoi, qui, pour quand."}], "seuil": 70, "tentatives_max": 3, "corrections": true, "consigne": "20 questions. Une seule bonne réponse par question, sauf mention « plusieurs réponses ». Seuil de réussite : 70 %."}'::jsonb, publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 12;
  n := n + 1;

  -- 3.2-ecoute-active.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Écouter paraît naturel, et c''est bien le problème : personne ne pense avoir besoin de l''apprendre. Pendant que l''autre parle, la plupart d''entre nous préparons déjà notre réponse. Le manager qui écoute vraiment sait mieux ce qui se passe dans son équipe, on lui fait davantage confiance, et il récupère au passage des solutions auxquelles il n''aurait pas pensé.

## D''où vient l''écoute active

Le psychologue américain Carl Rogers a construit, dans les années 1940 et 1950, une approche de la relation d''aide « centrée sur la personne ». Il y décrit trois attitudes : l''empathie (comprendre le point de vue de l''autre de l''intérieur), la considération positive inconditionnelle (accueillir la personne sans la juger) et la congruence (être authentique). En 1957, avec Richard Farson, il transpose ces idées au monde du travail dans un texte intitulé « Active Listening » : écouter sans juger ni conseiller trop vite, et renvoyer à l''autre ce qu''on a compris pour le vérifier. Le terme d''écoute active vient de là. Pensée au départ pour la thérapie, la démarche s''est largement diffusée dans la formation des managers et la conduite d''entretien.

L''écoute active n''est pas de la complaisance : on peut écouter quelqu''un sans être d''accord avec lui. C''est une méthode pour comprendre avant de répondre.

L''écoute active repose sur quatre gestes, qui se travaillent séparément.

## 1. Le silence et la disponibilité

Écouter commence par se taire, et par montrer qu''on écoute : téléphone rangé, regard disponible, corps tourné vers la personne. Un manager qui écoute en consultant ses messages n''écoute pas, et tout le monde le sait.

Le silence est un outil. Après une réponse, laissez passer deux ou trois secondes : c''est souvent là que vient ce qui compte. Si vous remplissez ce blanc, vous ne saurez jamais ce qui allait suivre.

## 2. La reformulation

Reformuler, c''est redire avec vos mots ce que vous avez compris : « Si je comprends bien, tu n''as jamais l''information à temps, et ça t''oblige à improviser. » La personne se sent comprise ; si vous avez mal compris, elle corrige, et en général elle en dit un peu plus. La reformulation prouve que vous avez écouté, ce que « je comprends » ne prouve pas.

On reformule les faits, mais aussi le ressenti quand il est présent : « Tu as l''impression d''être la cinquième roue du carrosse. » Contrairement à une crainte répandue, nommer l''émotion ne l''amplifie pas : les travaux de Matthew Lieberman sur la mise en mots des émotions montrent plutôt qu''elle l''atténue.

## 3. Le questionnement

Une question ouverte appelle une réponse développée : « Comment ça se passe pour toi ? », « Qu''est-ce qui te manque ? », « Qu''est-ce que tu proposes ? ». Une question fermée appelle oui ou non : « Ça va ? », « Tu as le temps ? ». Les questions fermées ont leur utilité, pour vérifier un point précis ou conclure ; mais un entretien qui n''en contient que des fermées ne vous apprendra pas grand-chose.

Quelques questions qui servent presque à chaque fois : « Qu''est-ce qui s''est passé exactement ? » (les faits), « Qu''est-ce que tu as essayé ? » (les ressources de la personne), « De quoi aurais-tu besoin ? » (la solution vue par elle).

Évitez les questions qui sont des reproches déguisés : « Pourquoi tu n''as pas vérifié ? » n''est pas une question, c''est une accusation avec un point d''interrogation. Préférez : « Qu''est-ce qui a fait que le contrôle n''a pas été fait ? »

## 4. La suspension du jugement

C''est le plus difficile. Pendant l''écoute, on ne conseille pas, on ne juge pas, on ne raconte pas sa propre expérience, on ne rassure pas trop vite. Chacune de ces réactions, bien intentionnée, interrompt la personne et la ramène à votre point de vue. Le conseil viendra, plus tard, une fois que vous aurez compris. Et souvent, il ne sera plus nécessaire : la personne aura trouvé.

## Les biais d''interprétation

Écouter, c''est aussi se méfier de ce que notre cerveau ajoute. Quatre biais, bien documentés en psychologie sociale, faussent souvent l''écoute d''un manager :

- L''effet de halo : une bonne (ou mauvaise) impression générale colore tout ce que la personne dit. Julien a fait deux reprises, donc tout ce qu''il dit sur l''organisation est suspect.
- L''erreur fondamentale d''attribution : on explique les erreurs des autres par leur personnalité (« il est brouillon ») et les nôtres par la situation (« j''étais débordé »). Le remède : chercher d''abord la cause dans la situation.
- Le biais de confirmation : on retient ce qui confirme ce qu''on pensait déjà. Le remède : chercher activement ce qui contredit.
- La projection : on suppose que l''autre ressent ce que nous ressentirions à sa place. Le remède : demander.

## Écouter ne veut pas dire céder

Beaucoup de nouveaux managers le redoutent : « si j''écoute tout le monde, je ne déciderai plus rien ». C''est confondre écouter et obéir. On écoute pour comprendre, puis on décide, et la décision reste la vôtre. Et une décision prise après avoir écouté est mieux acceptée, même quand elle ne va pas dans le sens de la personne, parce qu''elle sait que son point de vue a été entendu.

La formule utile : « J''ai bien compris ta position. Voilà ce que je décide, et voilà pourquoi. »

## Le cas Garnier : l''entretien avec Marc

Marc, le mécanicien, est venu dire qu''il « en a marre d''être la cinquième roue du carrosse ». Version sans écoute : Karim répond « je vais faire attention », et rien ne change. Version avec écoute :

Karim : « Raconte-moi ce qui s''est passé cette semaine. » (question ouverte, faits)

Marc : « Mardi, j''apprends à 14 h que le Master de Ferrand doit passer en géométrie avant 17 h. Personne ne m''avait prévenu. J''étais sur la Kangoo. J''ai dû tout lâcher. »

Karim : « Donc tu découvres les interventions au dernier moment, et ça t''oblige à interrompre ce que tu fais. » (reformulation)

Marc : « Exactement. Et après, on me dit que je suis lent. »

Karim : « Tu as l''impression qu''on te reproche un retard qui vient de l''organisation. » (reformulation du ressenti)

Marc : « Oui. »

Karim : « Qu''est-ce qu''il te faudrait ? » (question ouverte, solution)

Marc : « Savoir la veille ce qui passe en méca le lendemain. Même approximativement. »

Ce que Karim n''a pas fait : se justifier, promettre, raconter que lui aussi est débordé. Ce qu''il a obtenu en cinq minutes : la cause réelle (le planning ne prévoit pas la mécanique) et la solution (consulter Marc chaque veille à 17 h), qui figurera dans le RACI.

## À retenir

- Se taire, laisser des silences, montrer qu''on écoute.
- Reformuler les faits et le ressenti : c''est la preuve de l''écoute.
- Questions ouvertes : « qu''est-ce qui s''est passé ? », « qu''est-ce que tu as essayé ? », « de quoi aurais-tu besoin ? ».
- Suspendre le jugement, le conseil et le récit de soi pendant l''écoute.
- Se méfier de ses biais : halo, attribution, confirmation, projection.
- Écouter n''est pas céder : comprendre, puis décider.

## Sources

- Carl R. Rogers, *Le développement de la personne*, Dunod, 1968 (éd. originale *On Becoming a Person*, Houghton Mifflin, 1961).
- Carl R. Rogers, Richard E. Farson, *Active Listening*, Industrial Relations Center, University of Chicago, 1957.
- Carl R. Rogers, « The Necessary and Sufficient Conditions of Therapeutic Personality Change », *Journal of Consulting Psychology*, vol. 21, n° 2, 1957.
- Matthew D. Lieberman et al., « Putting Feelings Into Words: Affect Labeling Disrupts Amygdala Activity in Response to Affective Stimuli », *Psychological Science*, vol. 18, n° 5, 2007.
- Daniel Kahneman, *Système 1 / Système 2. Les deux vitesses de la pensée*, Flammarion, 2012 (biais cognitifs).
- Lee Ross, « The Intuitive Psychologist and His Shortcomings: Distortions in the Attribution Process », *Advances in Experimental Social Psychology*, vol. 10, 1977 (erreur fondamentale d''attribution).
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Écouter paraît naturel, et c''est bien le problème : personne ne pense avoir besoin de l''apprendre. Pendant que l''autre parle, la plupart d''entre nous préparons déjà notre réponse. Le manager qui écoute vraiment sait mieux ce qui se passe dans son équipe, on lui fait davantage confiance, et il récupère au passage des solutions auxquelles il n''aurait pas pensé.

## D''où vient l''écoute active

Le psychologue américain Carl Rogers a construit, dans les années 1940 et 1950, une approche de la relation d''aide « centrée sur la personne ». Il y décrit trois attitudes : l''empathie (comprendre le point de vue de l''autre de l''intérieur), la considération positive inconditionnelle (accueillir la personne sans la juger) et la congruence (être authentique). En 1957, avec Richard Farson, il transpose ces idées au monde du travail dans un texte intitulé « Active Listening » : écouter sans juger ni conseiller trop vite, et renvoyer à l''autre ce qu''on a compris pour le vérifier. Le terme d''écoute active vient de là. Pensée au départ pour la thérapie, la démarche s''est largement diffusée dans la formation des managers et la conduite d''entretien.

L''écoute active n''est pas de la complaisance : on peut écouter quelqu''un sans être d''accord avec lui. C''est une méthode pour comprendre avant de répondre.

L''écoute active repose sur quatre gestes, qui se travaillent séparément.

## 1. Le silence et la disponibilité

Écouter commence par se taire, et par montrer qu''on écoute : téléphone rangé, regard disponible, corps tourné vers la personne. Un manager qui écoute en consultant ses messages n''écoute pas, et tout le monde le sait.

Le silence est un outil. Après une réponse, laissez passer deux ou trois secondes : c''est souvent là que vient ce qui compte. Si vous remplissez ce blanc, vous ne saurez jamais ce qui allait suivre.

## 2. La reformulation

Reformuler, c''est redire avec vos mots ce que vous avez compris : « Si je comprends bien, tu n''as jamais l''information à temps, et ça t''oblige à improviser. » La personne se sent comprise ; si vous avez mal compris, elle corrige, et en général elle en dit un peu plus. La reformulation prouve que vous avez écouté, ce que « je comprends » ne prouve pas.

On reformule les faits, mais aussi le ressenti quand il est présent : « Tu as l''impression d''être la cinquième roue du carrosse. » Contrairement à une crainte répandue, nommer l''émotion ne l''amplifie pas : les travaux de Matthew Lieberman sur la mise en mots des émotions montrent plutôt qu''elle l''atténue.

## 3. Le questionnement

Une question ouverte appelle une réponse développée : « Comment ça se passe pour toi ? », « Qu''est-ce qui te manque ? », « Qu''est-ce que tu proposes ? ». Une question fermée appelle oui ou non : « Ça va ? », « Tu as le temps ? ». Les questions fermées ont leur utilité, pour vérifier un point précis ou conclure ; mais un entretien qui n''en contient que des fermées ne vous apprendra pas grand-chose.

Quelques questions qui servent presque à chaque fois : « Qu''est-ce qui s''est passé exactement ? » (les faits), « Qu''est-ce que tu as essayé ? » (les ressources de la personne), « De quoi aurais-tu besoin ? » (la solution vue par elle).

Évitez les questions qui sont des reproches déguisés : « Pourquoi tu n''as pas vérifié ? » n''est pas une question, c''est une accusation avec un point d''interrogation. Préférez : « Qu''est-ce qui a fait que le contrôle n''a pas été fait ? »

## 4. La suspension du jugement

C''est le plus difficile. Pendant l''écoute, on ne conseille pas, on ne juge pas, on ne raconte pas sa propre expérience, on ne rassure pas trop vite. Chacune de ces réactions, bien intentionnée, interrompt la personne et la ramène à votre point de vue. Le conseil viendra, plus tard, une fois que vous aurez compris. Et souvent, il ne sera plus nécessaire : la personne aura trouvé.

## Les biais d''interprétation

Écouter, c''est aussi se méfier de ce que notre cerveau ajoute. Quatre biais, bien documentés en psychologie sociale, faussent souvent l''écoute d''un manager :

- L''effet de halo : une bonne (ou mauvaise) impression générale colore tout ce que la personne dit. Julien a fait deux reprises, donc tout ce qu''il dit sur l''organisation est suspect.
- L''erreur fondamentale d''attribution : on explique les erreurs des autres par leur personnalité (« il est brouillon ») et les nôtres par la situation (« j''étais débordé »). Le remède : chercher d''abord la cause dans la situation.
- Le biais de confirmation : on retient ce qui confirme ce qu''on pensait déjà. Le remède : chercher activement ce qui contredit.
- La projection : on suppose que l''autre ressent ce que nous ressentirions à sa place. Le remède : demander.

## Écouter ne veut pas dire céder

Beaucoup de nouveaux managers le redoutent : « si j''écoute tout le monde, je ne déciderai plus rien ». C''est confondre écouter et obéir. On écoute pour comprendre, puis on décide, et la décision reste la vôtre. Et une décision prise après avoir écouté est mieux acceptée, même quand elle ne va pas dans le sens de la personne, parce qu''elle sait que son point de vue a été entendu.

La formule utile : « J''ai bien compris ta position. Voilà ce que je décide, et voilà pourquoi. »

## Le cas Garnier : l''entretien avec Marc

Marc, le mécanicien, est venu dire qu''il « en a marre d''être la cinquième roue du carrosse ». Version sans écoute : Karim répond « je vais faire attention », et rien ne change. Version avec écoute :

Karim : « Raconte-moi ce qui s''est passé cette semaine. » (question ouverte, faits)

Marc : « Mardi, j''apprends à 14 h que le Master de Ferrand doit passer en géométrie avant 17 h. Personne ne m''avait prévenu. J''étais sur la Kangoo. J''ai dû tout lâcher. »

Karim : « Donc tu découvres les interventions au dernier moment, et ça t''oblige à interrompre ce que tu fais. » (reformulation)

Marc : « Exactement. Et après, on me dit que je suis lent. »

Karim : « Tu as l''impression qu''on te reproche un retard qui vient de l''organisation. » (reformulation du ressenti)

Marc : « Oui. »

Karim : « Qu''est-ce qu''il te faudrait ? » (question ouverte, solution)

Marc : « Savoir la veille ce qui passe en méca le lendemain. Même approximativement. »

Ce que Karim n''a pas fait : se justifier, promettre, raconter que lui aussi est débordé. Ce qu''il a obtenu en cinq minutes : la cause réelle (le planning ne prévoit pas la mécanique) et la solution (consulter Marc chaque veille à 17 h), qui figurera dans le RACI.

## À retenir

- Se taire, laisser des silences, montrer qu''on écoute.
- Reformuler les faits et le ressenti : c''est la preuve de l''écoute.
- Questions ouvertes : « qu''est-ce qui s''est passé ? », « qu''est-ce que tu as essayé ? », « de quoi aurais-tu besoin ? ».
- Suspendre le jugement, le conseil et le récit de soi pendant l''écoute.
- Se méfier de ses biais : halo, attribution, confirmation, projection.
- Écouter n''est pas céder : comprendre, puis décider.

## Sources

- Carl R. Rogers, *Le développement de la personne*, Dunod, 1968 (éd. originale *On Becoming a Person*, Houghton Mifflin, 1961).
- Carl R. Rogers, Richard E. Farson, *Active Listening*, Industrial Relations Center, University of Chicago, 1957.
- Carl R. Rogers, « The Necessary and Sufficient Conditions of Therapeutic Personality Change », *Journal of Consulting Psychology*, vol. 21, n° 2, 1957.
- Matthew D. Lieberman et al., « Putting Feelings Into Words: Affect Labeling Disrupts Amygdala Activity in Response to Affective Stimuli », *Psychological Science*, vol. 18, n° 5, 2007.
- Daniel Kahneman, *Système 1 / Système 2. Les deux vitesses de la pensée*, Flammarion, 2012 (biais cognitifs).
- Lee Ross, « The Intuitive Psychologist and His Shortcomings: Distortions in the Attribution Process », *Advances in Experimental Social Psychology*, vol. 10, 1977 (erreur fondamentale d''attribution).
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 2;
  n := n + 1;

  -- 3.3-feedback.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Le feedback, ou retour, est l''information que vous donnez à quelqu''un sur son travail ou son comportement. Il ne coûte rien, ne demande l''autorisation de personne, et pourtant c''est l''un des outils que les managers utilisent le moins bien : trop rarement, trop tard, en restant vague, ou au contraire de façon blessante. Il faut un peu de courage, et une méthode.

## Pourquoi on ne peut pas s''en passer

Sans retour, une personne ne peut pas ajuster. Elle continue à faire ce qu''elle fait, en supposant que c''est ce qu''on attend. Les enquêtes de Gallup sur l''engagement au travail rangent d''ailleurs parmi leurs questions de mesure le fait d''avoir reçu, au cours des sept derniers jours, une reconnaissance pour un travail bien fait : quelqu''un qui ne sait jamais s''il fait bien finit souvent par ne plus s''en soucier.

Le feedback a deux formes, aussi nécessaires l''une que l''autre. Le feedback positif dit ce qui est bien et pourquoi, pour que la personne le refasse. Le feedback correctif dit ce qui doit changer et comment. Un manager qui ne donne que des retours correctifs est vécu comme un censeur ; un manager qui ne donne que des retours positifs n''est pas cru.

Faut-il viser un « ratio » de positifs ? On voit circuler des chiffres précis (trois, cinq, voire 2,9 positifs pour un négatif) : ils viennent de travaux dont les calculs ont été sérieusement contestés, et aucun ne fait référence. Retenez plutôt l''idée défendue par Buckingham et Goodall : un retour positif précis apprend au moins autant qu''un correctif, parce qu''il dit exactement quoi reproduire. Dans la plupart des équipes, il en manque.

## La méthode SBI

Le Center for Creative Leadership (CCL), organisme américain de recherche et de formation au leadership, a popularisé une méthode très simple : SBI, pour Situation, Behavior (comportement), Impact.

- La situation : quand et où. « Hier, sur la Clio de Ferrand, à la restitution. »
- Le comportement : ce que la personne a fait, observable, sans interprétation. « Le vernis présentait une coulure sur l''aile arrière, et le véhicule est parti sans contrôle. »
- L''impact : la conséquence, sur le client, l''équipe, l''entreprise, vous. « Le client a fait une réclamation écrite, on a repris le véhicule deux jours, et Michel s''est énervé devant tout le monde. »

Puis, pour un feedback correctif, on ajoute ce qu''on attend : « À partir de maintenant, chaque finition passe par le contrôle de Thierry avant restitution. »

L''intérêt de SBI : elle sépare le fait de l''interprétation. « Tu es brouillon » est une étiquette qu''on ne peut que contester. « Une coulure sur l''aile arrière » est un fait qu''on peut regarder ensemble.

Le même schéma vaut pour le positif : « Ce matin, sur la Kangoo de Transports Ferrand, tu as repéré la fissure du pare-chocs que l''expert n''avait pas vue, tu l''as signalée à Sophie avant de commencer. Résultat : le complément de devis est passé sans discussion, et on n''a pas travaillé à perte. Continue à regarder comme ça. » Ce retour dit exactement quoi refaire.

## La méthode DESC pour les sujets sensibles

Quand le comportement à corriger touche à la relation (un manque de respect, une remarque déplacée, une consigne contournée), la méthode DESC, proposée en 1976 par Sharon Anthony Bower et le psychologue Gordon H. Bower dans un ouvrage consacré à l''affirmation de soi, est mieux adaptée. Elle ajoute une demande explicite et ce qu''on y gagnera :

- Décrire (*Describe*) les faits, comme dans SBI.
- Exprimer (*Express*) ce que cela vous fait ou fait à l''équipe, en « je » : « Quand tu dis devant Julien que tu ne vas pas te laisser dire comment faire ton travail, je ne peux plus tenir mon rôle. »
- Spécifier (*Specify*) ce que vous demandez, concrètement : « Quand tu n''es pas d''accord, tu me le dis en tête-à-tête. »
- Conclure sur les conséquences (*Consequences*), de préférence positives : « Comme ça, on peut discuter pour de vrai, et l''équipe n''est pas prise à témoin. »

DESC se prépare par écrit avant l''entretien : une phrase par étape suffit.

## Les règles de forme

- Vite. Un retour a d''autant plus d''effet qu''il est proche du fait. Un correctif attendu trois semaines est vécu comme un règlement de comptes ; un positif attendu trois semaines est oublié.
- En privé pour le correctif, en public si possible pour le positif, sauf si la personne n''aime pas être mise en avant.
- Un seul sujet à la fois. Le feedback qui liste six reproches n''en fait passer aucun.
- Sur ce que la personne peut changer. Un retour sur un trait de personnalité ne sert à rien ; un retour sur un comportement sert.
- Avec une question à la fin : « Comment tu vois ça ? » Le feedback est le début d''une conversation, pas une sentence.

## Le sandwich, et pourquoi il ne marche pas

Beaucoup de managers ont appris à « emballer » le correctif entre deux compliments : « Tu fais du bon boulot, mais il y a eu cette coulure, sinon continue comme ça. » Résultat : la personne ne retient que le « mais », ou pire, ne retient que les compliments et ne change rien. Et elle apprend à se méfier des compliments, qui annoncent une critique.

Mieux vaut un retour correctif clair et respectueux, construit avec SBI, et des retours positifs à d''autres moments, sincères et précis. Être clair avec quelqu''un, c''est aussi le respecter.

## Recevoir un feedback

Le manager donne des retours ; il doit aussi en recevoir, de son équipe et de sa hiérarchie. Quelques réflexes aident : remercier (même si ça pique), demander un exemple pour transformer un jugement en fait, ne pas se justifier sur-le-champ (on peut répondre plus tard), puis dire ce qu''on en fait. Un manager qui reçoit mal les retours n''en reçoit plus, et pilote à l''aveugle.

## Le cas Garnier : le retour à Julien

Ce qui s''est réellement passé : Michel a crié devant tout le monde, Karim n''a rien dit, et Julien, qui a perdu confiance, est déjà à deux reprises ce trimestre.

Version SBI, le lendemain, dans le bureau :

« Hier, à la restitution de la Clio de Ferrand, il y avait une coulure sur l''aile arrière et le véhicule est parti sans que personne ne la voie. Le client a écrit, on reprend le véhicule deux jours, et ça retombe sur toute l''équipe. Je veux que ça n''arrive plus, et je vais t''y aider : jusqu''à Noël, chaque finition que tu termines passe par Thierry avant de sortir. C''est pour que tu progresses, pas pour te punir. Comment tu vois ça ? »

Julien : « Je vais trop vite sur le vernis, je le sais. Avec Thierry, ça m''irait. »

Et trois semaines plus tard, le positif, devant Thierry : « Trois finitions cette semaine, zéro remarque au contrôle. Le vernis sur la C3 est propre. C''est exactement ce qu''on attend. »

## À retenir

- Sans retour, personne ne peut ajuster ; le positif apprend autant que le correctif.
- SBI : situation, comportement observable, impact, puis ce qu''on attend.
- DESC pour les sujets relationnels : décrire, exprimer en « je », spécifier, conclure.
- Vite, en privé pour le correctif, un sujet à la fois, sur ce qui peut changer, avec une question.
- Pas de sandwich : un correctif clair, des positifs à d''autres moments.
- Recevez les retours comme vous voulez qu''on reçoive les vôtres.

## Sources

- Center for Creative Leadership, *Feedback That Works: How to Build and Deliver Your Message*, 2e éd., CCL Press, 2019 (1re éd. Sloan R. Weitzel, 2000), méthode SBI.
- Sharon Anthony Bower, Gordon H. Bower, *Asserting Yourself: A Practical Guide for Positive Change*, Addison-Wesley, 1976, méthode DESC.
- Marcus Buckingham, Ashley Goodall, « The Feedback Fallacy », *Harvard Business Review*, mars-avril 2019.
- Nicholas J. L. Brown, Alan D. Sokal, Harris L. Friedman, « The Complex Dynamics of Wishful Thinking: The Critical Positivity Ratio », *American Psychologist*, vol. 68, n° 9, 2013 (critique du « ratio de positivité »).
- Gallup, questionnaire Q12 sur l''engagement des salariés, gallup.com.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Le feedback, ou retour, est l''information que vous donnez à quelqu''un sur son travail ou son comportement. Il ne coûte rien, ne demande l''autorisation de personne, et pourtant c''est l''un des outils que les managers utilisent le moins bien : trop rarement, trop tard, en restant vague, ou au contraire de façon blessante. Il faut un peu de courage, et une méthode.

## Pourquoi on ne peut pas s''en passer

Sans retour, une personne ne peut pas ajuster. Elle continue à faire ce qu''elle fait, en supposant que c''est ce qu''on attend. Les enquêtes de Gallup sur l''engagement au travail rangent d''ailleurs parmi leurs questions de mesure le fait d''avoir reçu, au cours des sept derniers jours, une reconnaissance pour un travail bien fait : quelqu''un qui ne sait jamais s''il fait bien finit souvent par ne plus s''en soucier.

Le feedback a deux formes, aussi nécessaires l''une que l''autre. Le feedback positif dit ce qui est bien et pourquoi, pour que la personne le refasse. Le feedback correctif dit ce qui doit changer et comment. Un manager qui ne donne que des retours correctifs est vécu comme un censeur ; un manager qui ne donne que des retours positifs n''est pas cru.

Faut-il viser un « ratio » de positifs ? On voit circuler des chiffres précis (trois, cinq, voire 2,9 positifs pour un négatif) : ils viennent de travaux dont les calculs ont été sérieusement contestés, et aucun ne fait référence. Retenez plutôt l''idée défendue par Buckingham et Goodall : un retour positif précis apprend au moins autant qu''un correctif, parce qu''il dit exactement quoi reproduire. Dans la plupart des équipes, il en manque.

## La méthode SBI

Le Center for Creative Leadership (CCL), organisme américain de recherche et de formation au leadership, a popularisé une méthode très simple : SBI, pour Situation, Behavior (comportement), Impact.

- La situation : quand et où. « Hier, sur la Clio de Ferrand, à la restitution. »
- Le comportement : ce que la personne a fait, observable, sans interprétation. « Le vernis présentait une coulure sur l''aile arrière, et le véhicule est parti sans contrôle. »
- L''impact : la conséquence, sur le client, l''équipe, l''entreprise, vous. « Le client a fait une réclamation écrite, on a repris le véhicule deux jours, et Michel s''est énervé devant tout le monde. »

Puis, pour un feedback correctif, on ajoute ce qu''on attend : « À partir de maintenant, chaque finition passe par le contrôle de Thierry avant restitution. »

L''intérêt de SBI : elle sépare le fait de l''interprétation. « Tu es brouillon » est une étiquette qu''on ne peut que contester. « Une coulure sur l''aile arrière » est un fait qu''on peut regarder ensemble.

Le même schéma vaut pour le positif : « Ce matin, sur la Kangoo de Transports Ferrand, tu as repéré la fissure du pare-chocs que l''expert n''avait pas vue, tu l''as signalée à Sophie avant de commencer. Résultat : le complément de devis est passé sans discussion, et on n''a pas travaillé à perte. Continue à regarder comme ça. » Ce retour dit exactement quoi refaire.

## La méthode DESC pour les sujets sensibles

Quand le comportement à corriger touche à la relation (un manque de respect, une remarque déplacée, une consigne contournée), la méthode DESC, proposée en 1976 par Sharon Anthony Bower et le psychologue Gordon H. Bower dans un ouvrage consacré à l''affirmation de soi, est mieux adaptée. Elle ajoute une demande explicite et ce qu''on y gagnera :

- Décrire (*Describe*) les faits, comme dans SBI.
- Exprimer (*Express*) ce que cela vous fait ou fait à l''équipe, en « je » : « Quand tu dis devant Julien que tu ne vas pas te laisser dire comment faire ton travail, je ne peux plus tenir mon rôle. »
- Spécifier (*Specify*) ce que vous demandez, concrètement : « Quand tu n''es pas d''accord, tu me le dis en tête-à-tête. »
- Conclure sur les conséquences (*Consequences*), de préférence positives : « Comme ça, on peut discuter pour de vrai, et l''équipe n''est pas prise à témoin. »

DESC se prépare par écrit avant l''entretien : une phrase par étape suffit.

## Les règles de forme

- Vite. Un retour a d''autant plus d''effet qu''il est proche du fait. Un correctif attendu trois semaines est vécu comme un règlement de comptes ; un positif attendu trois semaines est oublié.
- En privé pour le correctif, en public si possible pour le positif, sauf si la personne n''aime pas être mise en avant.
- Un seul sujet à la fois. Le feedback qui liste six reproches n''en fait passer aucun.
- Sur ce que la personne peut changer. Un retour sur un trait de personnalité ne sert à rien ; un retour sur un comportement sert.
- Avec une question à la fin : « Comment tu vois ça ? » Le feedback est le début d''une conversation, pas une sentence.

## Le sandwich, et pourquoi il ne marche pas

Beaucoup de managers ont appris à « emballer » le correctif entre deux compliments : « Tu fais du bon boulot, mais il y a eu cette coulure, sinon continue comme ça. » Résultat : la personne ne retient que le « mais », ou pire, ne retient que les compliments et ne change rien. Et elle apprend à se méfier des compliments, qui annoncent une critique.

Mieux vaut un retour correctif clair et respectueux, construit avec SBI, et des retours positifs à d''autres moments, sincères et précis. Être clair avec quelqu''un, c''est aussi le respecter.

## Recevoir un feedback

Le manager donne des retours ; il doit aussi en recevoir, de son équipe et de sa hiérarchie. Quelques réflexes aident : remercier (même si ça pique), demander un exemple pour transformer un jugement en fait, ne pas se justifier sur-le-champ (on peut répondre plus tard), puis dire ce qu''on en fait. Un manager qui reçoit mal les retours n''en reçoit plus, et pilote à l''aveugle.

## Le cas Garnier : le retour à Julien

Ce qui s''est réellement passé : Michel a crié devant tout le monde, Karim n''a rien dit, et Julien, qui a perdu confiance, est déjà à deux reprises ce trimestre.

Version SBI, le lendemain, dans le bureau :

« Hier, à la restitution de la Clio de Ferrand, il y avait une coulure sur l''aile arrière et le véhicule est parti sans que personne ne la voie. Le client a écrit, on reprend le véhicule deux jours, et ça retombe sur toute l''équipe. Je veux que ça n''arrive plus, et je vais t''y aider : jusqu''à Noël, chaque finition que tu termines passe par Thierry avant de sortir. C''est pour que tu progresses, pas pour te punir. Comment tu vois ça ? »

Julien : « Je vais trop vite sur le vernis, je le sais. Avec Thierry, ça m''irait. »

Et trois semaines plus tard, le positif, devant Thierry : « Trois finitions cette semaine, zéro remarque au contrôle. Le vernis sur la C3 est propre. C''est exactement ce qu''on attend. »

## À retenir

- Sans retour, personne ne peut ajuster ; le positif apprend autant que le correctif.
- SBI : situation, comportement observable, impact, puis ce qu''on attend.
- DESC pour les sujets relationnels : décrire, exprimer en « je », spécifier, conclure.
- Vite, en privé pour le correctif, un sujet à la fois, sur ce qui peut changer, avec une question.
- Pas de sandwich : un correctif clair, des positifs à d''autres moments.
- Recevez les retours comme vous voulez qu''on reçoive les vôtres.

## Sources

- Center for Creative Leadership, *Feedback That Works: How to Build and Deliver Your Message*, 2e éd., CCL Press, 2019 (1re éd. Sloan R. Weitzel, 2000), méthode SBI.
- Sharon Anthony Bower, Gordon H. Bower, *Asserting Yourself: A Practical Guide for Positive Change*, Addison-Wesley, 1976, méthode DESC.
- Marcus Buckingham, Ashley Goodall, « The Feedback Fallacy », *Harvard Business Review*, mars-avril 2019.
- Nicholas J. L. Brown, Alan D. Sokal, Harris L. Friedman, « The Complex Dynamics of Wishful Thinking: The Critical Positivity Ratio », *American Psychologist*, vol. 68, n° 9, 2013 (critique du « ratio de positivité »).
- Gallup, questionnaire Q12 sur l''engagement des salariés, gallup.com.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 3;
  n := n + 1;

  -- 3.4-video-feedback-en-pratique.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Le feedback en pratique

Vous connaissez la méthode SBI : situation, comportement, impact, attente. Voyons-la fonctionner dans trois situations réelles, avec à chaque fois la version qui échoue et la version qui marche.

## Situation 1 — Le retard répété

Lucas, apprenti, est arrivé en retard trois fois cette semaine. Personne n''a rien dit. Karim doit lui parler.

Version qui échoue, en passant, dans l''atelier, devant les autres :

« Lucas, faut arrêter d''arriver à la bourre, hein. »

« Ouais, désolé, c''est le bus. »

« Bon. »

Ce qui s''est passé : pas de faits précis, une excuse acceptée, aucune attente formulée, et tout ça en public. Lucas a compris que ce n''était pas grave.

Version qui marche, dans le bureau, cinq minutes :

« Lucas, cette semaine tu es arrivé à 8 h 20 lundi, 8 h 15 mercredi et 8 h 25 vendredi, pour une prise de poste à 8 h. »

« Ouais, c''est le bus, il est jamais à l''heure. »

« Quand tu n''es pas là à 8 h, Fatou ne peut pas démonter, parce que c''est toi qui portes les éléments lourds. Elle attend, et ça décale toute la matinée. Et l''équipe voit que le retard passe sans rien. »

« Je savais pas pour Fatou. »

« Maintenant tu le sais. Ce que j''attends : tu es à 8 h au poste, tous les jours. Si le bus ne le permet pas, tu prends celui d''avant. Si un jour il y a un vrai problème, tu m''envoies un message avant 7 h 45. On se revoit dans deux semaines pour faire le point. Comment tu vois ça ? »

« C''est bon, je prendrai celui d''avant. »

Ce qui a changé : des faits datés, un impact concret que Lucas ignorait, une attente précise avec une règle pour les exceptions, un point de suivi, et une question à la fin. Et Karim a noté la date et le contenu de l''entretien : si le retard continue, il aura la trace nécessaire pour alerter Michel.

## Situation 2 — L''erreur client

Julien a livré un véhicule avec une coulure de vernis. Le client a réclamé.

Version qui échoue, celle de Michel, devant toute l''équipe :

« C''est quoi ce travail ? Tu te fous du monde ? On a un client qui nous rend la voiture, tu crois qu''on peut se permettre ça ? »

Ce qui s''est passé : de l''humiliation publique, aucune méthode, et une question sans réponse possible. Julien a perdu confiance, et l''équipe a appris que les erreurs se paient en public. Prochaine erreur, on la cachera.

Version qui marche, le lendemain matin, seul à seul :

« Hier, à la restitution de la Clio de Ferrand, il y avait une coulure sur l''aile arrière, et le véhicule est parti sans contrôle. Le client a écrit, on reprend deux jours, et l''équipe encaisse. »

« Je sais. Je suis allé trop vite sur le vernis. »

« Qu''est-ce qui a fait que tu es allé trop vite ? »

« Il fallait rendre à 17 h, Sophie était venue deux fois me demander où j''en étais. »

« D''accord. Donc il y a un problème de finition et un problème de pression sur les délais. Le second, je m''en occupe : à partir de maintenant, les demandes de Sophie passent par moi. Le premier, on le règle ensemble : jusqu''à la fin de l''année, chaque finition passe par Thierry avant de sortir. Ce n''est pas une sanction, c''est comme ça qu''on apprend. Ça te va ? »

« Oui. Et je préfère que Thierry regarde, honnêtement. »

Notez la question ouverte : « qu''est-ce qui a fait que ». Elle a révélé une cause d''organisation, la pression de Sophie, que Karim n''aurait pas vue s''il s''était contenté de recadrer. Une erreur a presque toujours deux causes : une cause individuelle et une cause d''organisation. Le feedback traite la première ; le manager traite la seconde.

## Situation 3 — Le très bon travail

Nadia a réalisé une peinture complexe, un raccord de teinte nacrée, que le client a trouvée parfaite.

Version qui échoue : rien. Ou, en passant : « Nickel la 308. » Nadia n''a pas su ce qui était nickel, ni si quelqu''un l''avait vraiment regardé.

Version qui marche, à l''atelier, devant Julien qui apprend la peinture :

« Nadia, la 308 de ce matin. Le raccord sur la nacrée, on ne le voit pas, même sous le néon. Le client l''a dit à Sophie, et c''est ce genre de travail qui fait qu''on garde les flottes. Julien, viens voir, c''est ça qu''on vise. »

« C''est le dégradé sur trois passes, il faut prendre le temps. »

« Tu pourrais le montrer à Julien la semaine prochaine ? Une heure, sur la prochaine nacrée. »

« Oui, sans problème. »

Un retour positif précis fait trois choses : il dit exactement ce qui est bien, donc ce qu''il faut refaire ; il relie le travail à un enjeu, garder les flottes ; et il donne de la reconnaissance devant les autres. Et Karim en a profité pour lancer le binôme peinture identifié dans la matrice de compétences. Un bon feedback positif est aussi un outil d''organisation.

## Ce qu''il faut retenir

Dans les trois cas, la même trame : les faits, datés ; l''impact, concret ; l''attente, précise ; et une question. Dans les trois cas, le bon canal : le correctif en privé, le positif en public. Et dans les trois cas, une trace : Karim note dans son carnet la date et l''essentiel de l''échange.

Le feedback n''est pas un talent. C''est une méthode qui s''applique en cinq minutes, et qui, répétée, change une équipe.

À tout de suite pour l''entretien individuel de suivi.

## Sources
Center for Creative Leadership, *Feedback That Works: How to Build and Deliver Your Message*, 2e éd., CCL Press, 2019 (méthode SBI) ; Sharon Anthony Bower, Gordon H. Bower, *Asserting Yourself*, Addison-Wesley, 1976 (méthode DESC) ; Amy C. Edmondson, « Psychological Safety and Learning Behavior in Work Teams », *Administrative Science Quarterly*, vol. 44, n° 2, 1999 (sécurité psychologique : quand l''erreur est sanctionnée publiquement, on la signale moins).
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Le feedback en pratique

Vous connaissez la méthode SBI : situation, comportement, impact, attente. Voyons-la fonctionner dans trois situations réelles, avec à chaque fois la version qui échoue et la version qui marche.

## Situation 1 — Le retard répété

Lucas, apprenti, est arrivé en retard trois fois cette semaine. Personne n''a rien dit. Karim doit lui parler.

Version qui échoue, en passant, dans l''atelier, devant les autres :

« Lucas, faut arrêter d''arriver à la bourre, hein. »

« Ouais, désolé, c''est le bus. »

« Bon. »

Ce qui s''est passé : pas de faits précis, une excuse acceptée, aucune attente formulée, et tout ça en public. Lucas a compris que ce n''était pas grave.

Version qui marche, dans le bureau, cinq minutes :

« Lucas, cette semaine tu es arrivé à 8 h 20 lundi, 8 h 15 mercredi et 8 h 25 vendredi, pour une prise de poste à 8 h. »

« Ouais, c''est le bus, il est jamais à l''heure. »

« Quand tu n''es pas là à 8 h, Fatou ne peut pas démonter, parce que c''est toi qui portes les éléments lourds. Elle attend, et ça décale toute la matinée. Et l''équipe voit que le retard passe sans rien. »

« Je savais pas pour Fatou. »

« Maintenant tu le sais. Ce que j''attends : tu es à 8 h au poste, tous les jours. Si le bus ne le permet pas, tu prends celui d''avant. Si un jour il y a un vrai problème, tu m''envoies un message avant 7 h 45. On se revoit dans deux semaines pour faire le point. Comment tu vois ça ? »

« C''est bon, je prendrai celui d''avant. »

Ce qui a changé : des faits datés, un impact concret que Lucas ignorait, une attente précise avec une règle pour les exceptions, un point de suivi, et une question à la fin. Et Karim a noté la date et le contenu de l''entretien : si le retard continue, il aura la trace nécessaire pour alerter Michel.

## Situation 2 — L''erreur client

Julien a livré un véhicule avec une coulure de vernis. Le client a réclamé.

Version qui échoue, celle de Michel, devant toute l''équipe :

« C''est quoi ce travail ? Tu te fous du monde ? On a un client qui nous rend la voiture, tu crois qu''on peut se permettre ça ? »

Ce qui s''est passé : de l''humiliation publique, aucune méthode, et une question sans réponse possible. Julien a perdu confiance, et l''équipe a appris que les erreurs se paient en public. Prochaine erreur, on la cachera.

Version qui marche, le lendemain matin, seul à seul :

« Hier, à la restitution de la Clio de Ferrand, il y avait une coulure sur l''aile arrière, et le véhicule est parti sans contrôle. Le client a écrit, on reprend deux jours, et l''équipe encaisse. »

« Je sais. Je suis allé trop vite sur le vernis. »

« Qu''est-ce qui a fait que tu es allé trop vite ? »

« Il fallait rendre à 17 h, Sophie était venue deux fois me demander où j''en étais. »

« D''accord. Donc il y a un problème de finition et un problème de pression sur les délais. Le second, je m''en occupe : à partir de maintenant, les demandes de Sophie passent par moi. Le premier, on le règle ensemble : jusqu''à la fin de l''année, chaque finition passe par Thierry avant de sortir. Ce n''est pas une sanction, c''est comme ça qu''on apprend. Ça te va ? »

« Oui. Et je préfère que Thierry regarde, honnêtement. »

Notez la question ouverte : « qu''est-ce qui a fait que ». Elle a révélé une cause d''organisation, la pression de Sophie, que Karim n''aurait pas vue s''il s''était contenté de recadrer. Une erreur a presque toujours deux causes : une cause individuelle et une cause d''organisation. Le feedback traite la première ; le manager traite la seconde.

## Situation 3 — Le très bon travail

Nadia a réalisé une peinture complexe, un raccord de teinte nacrée, que le client a trouvée parfaite.

Version qui échoue : rien. Ou, en passant : « Nickel la 308. » Nadia n''a pas su ce qui était nickel, ni si quelqu''un l''avait vraiment regardé.

Version qui marche, à l''atelier, devant Julien qui apprend la peinture :

« Nadia, la 308 de ce matin. Le raccord sur la nacrée, on ne le voit pas, même sous le néon. Le client l''a dit à Sophie, et c''est ce genre de travail qui fait qu''on garde les flottes. Julien, viens voir, c''est ça qu''on vise. »

« C''est le dégradé sur trois passes, il faut prendre le temps. »

« Tu pourrais le montrer à Julien la semaine prochaine ? Une heure, sur la prochaine nacrée. »

« Oui, sans problème. »

Un retour positif précis fait trois choses : il dit exactement ce qui est bien, donc ce qu''il faut refaire ; il relie le travail à un enjeu, garder les flottes ; et il donne de la reconnaissance devant les autres. Et Karim en a profité pour lancer le binôme peinture identifié dans la matrice de compétences. Un bon feedback positif est aussi un outil d''organisation.

## Ce qu''il faut retenir

Dans les trois cas, la même trame : les faits, datés ; l''impact, concret ; l''attente, précise ; et une question. Dans les trois cas, le bon canal : le correctif en privé, le positif en public. Et dans les trois cas, une trace : Karim note dans son carnet la date et l''essentiel de l''échange.

Le feedback n''est pas un talent. C''est une méthode qui s''applique en cinq minutes, et qui, répétée, change une équipe.

À tout de suite pour l''entretien individuel de suivi.

## Sources
Center for Creative Leadership, *Feedback That Works: How to Build and Deliver Your Message*, 2e éd., CCL Press, 2019 (méthode SBI) ; Sharon Anthony Bower, Gordon H. Bower, *Asserting Yourself*, Addison-Wesley, 1976 (méthode DESC) ; Amy C. Edmondson, « Psychological Safety and Learning Behavior in Work Teams », *Administrative Science Quarterly*, vol. 44, n° 2, 1999 (sécurité psychologique : quand l''erreur est sanctionnée publiquement, on la signale moins).
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 4;
  n := n + 1;

  -- 3.5-entretien-individuel-de-suivi.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'L''entretien individuel de suivi est le rendez-vous régulier entre un manager et chaque membre de son équipe. Aucune loi ne l''impose, contrairement à l''entretien de parcours professionnel (leçon suivante), et c''est précisément pour cela qu''il saute dès que l''agenda se remplit. C''est pourtant là que vous apprenez ce que vos collaborateurs ne diront jamais en réunion.

## À quoi il sert

- Faire le point sur le travail : ce qui avance, ce qui bloque, ce dont la personne a besoin.
- Donner et recevoir du feedback, dans un cadre prévu plutôt qu''au détour d''un couloir.
- Suivre les objectifs individuels fixés au module 2.
- Détecter tôt les difficultés : surcharge, tension avec un collègue, démotivation, problème personnel qui déborde sur le travail.
- Construire la relation : quelqu''un à qui l''on réserve régulièrement une demi-heure, sans la déplacer, comprend qu''il compte.

Un rythme réaliste pour un manager de proximité : 30 minutes par personne toutes les quatre à six semaines, plus des points courts au fil de l''eau. Pour huit personnes vues toutes les cinq semaines, cela représente moins d''une heure par semaine. C''est peu, comparé au temps que coûte une crise qu''on a vue venir trop tard.

## Préparer

Dix minutes suffisent, à condition de les prendre. Relisez vos notes de l''entretien précédent (les engagements pris de part et d''autre), regardez les objectifs de la personne et ses indicateurs, notez un ou deux retours à faire (un positif au moins), et listez les questions que vous voulez poser.

Préparez aussi le cadre : un lieu fermé, un créneau respecté (un entretien déplacé trois fois dit « tu n''es pas prioritaire »), le téléphone en silencieux.

## Conduire : la trame en cinq temps

Les durées indiquées valent pour un entretien de trente minutes ; elles donnent un ordre de grandeur, pas un chronométrage.

## 1. Ouvrir (2 minutes)

Rappelez l''objet et la durée : « On a trente minutes pour faire le point sur ton travail, tes objectifs et ce dont tu as besoin. » Puis une question ouverte pour laisser la personne commencer : « Comment ça se passe pour toi en ce moment ? » Et vous écoutez, avec les outils de la leçon 3.2.

## 2. Les faits (10 minutes)

Passez en revue les objectifs et les engagements de la dernière fois. Pour chacun : où en est-on, avec des faits et des chiffres, pas des impressions. « Trois finitions sans remarque cette semaine » plutôt que « ça va mieux ». C''est le moment des retours, positifs et correctifs, avec la méthode SBI.

## 3. Le ressenti et les besoins (8 minutes)

« Qu''est-ce qui te pèse ? Qu''est-ce qui te plaît ? De quoi aurais-tu besoin pour mieux travailler ? » C''est la partie qu''on saute le plus volontiers, par gêne ou faute de temps, et c''est souvent elle qui fait apparaître une surcharge ou une tension pendant qu''il est encore temps d''agir. Si la personne évoque une difficulté personnelle ou de santé, écoutez sans creuser et orientez si nécessaire (service de prévention et de santé au travail, service social, RH) : vous n''êtes ni son médecin ni son confident.

## 4. Les engagements (7 minutes)

Décidez ensemble ce qui change d''ici la prochaine fois : ce que la personne fait, ce que vous faites. Deux ou trois engagements maximum, précis et datés. « Tu passes chaque finition par Thierry. Je règle le circuit des demandes de Sophie d''ici vendredi. »

## 5. Conclure (3 minutes)

Résumez les engagements à voix haute, fixez la date du prochain entretien, demandez : « Il y a quelque chose dont on n''a pas parlé et que tu voulais dire ? » Il n''est pas rare que ce soit à ce moment-là, la main sur la poignée de la porte, que sorte le vrai sujet.

## Tracer

Après l''entretien, cinq lignes dans votre carnet ou dans un fichier par personne : date, points abordés, engagements des deux côtés, date du prochain point. Il ne s''agit pas de surveiller, mais de garder la mémoire de la relation : c''est ce qui vous permet, six mois plus tard, de demander « en mars tu m''avais parlé de la peinture, où en es-tu ? ». C''est aussi la trace nécessaire si une situation se dégrade et doit remonter.

Rédigez ces notes comme si la personne devait les lire un jour, parce que c''est possible : des notes sur un salarié sont des données personnelles, et il peut en demander communication (droit d''accès prévu par le RGPD). Elles restent factuelles, sans jugement sur la personne, sans information de santé ni de vie privée au-delà du strict nécessaire (« absence prévue en juin » suffit).

## L''entretien de recadrage

Quand un comportement doit cesser (retards répétés, consigne contournée, manque de respect), l''entretien change de nature et devient un recadrage. Il garde la même exigence de faits et d''écoute, mais avec une structure resserrée :

- Les faits, datés, sans discussion possible sur leur réalité.
- La règle qui n''est pas respectée et pourquoi elle existe.
- L''écoute : « Qu''est-ce qui explique ça ? » On peut découvrir une cause réelle (un problème d''organisation, une difficulté personnelle) qui change la suite.
- L''attente, non négociable, et le délai.
- La conséquence si ça continue : « Si les retards se reproduisent, je devrai en informer Michel. » Dite calmement, comme une information et non comme une menace.
- La trace écrite, et un point de contrôle rapproché.

Rappel du module 1 : le recadrage relève du manager ; la sanction relève de l''employeur, avec sa procédure. Si une sanction devient un jour nécessaire, un recadrage daté et documenté permettra à l''employeur de la fonder sur des faits établis.

## Les erreurs classiques

- Transformer l''entretien en monologue : vous devriez parler moins de la moitié du temps.
- Ne parler que des problèmes : la personne finit par redouter les entretiens.
- Ne pas tenir ses propres engagements : la fois suivante, la personne ne s''engage plus.
- Le faire « quand on a le temps » : il n''y a jamais le temps. Les dates sont posées à l''avance pour le trimestre.
- Mélanger suivi et parcours professionnel : l''entretien de parcours a son propre cadre légal et sa propre trame (leçon suivante).

## Le cas Garnier

Karim installe un entretien de 30 minutes par personne toutes les six semaines avec les membres de l''atelier, planifié pour le trimestre, le mardi entre 13 h et 14 h. Il en propose aussi un à Sophie, avec l''accord de Michel, puisque le circuit des demandes les lie désormais. Le premier tour lui apprend trois choses qu''il ignorait : Nadia veut évoluer vers la formation (elle a aimé montrer la nacrée à Julien), Marc a une contrainte de garde d''enfant le mercredi qui explique une partie de ses tensions sur les horaires, et Sophie vit mal le nouveau circuit des demandes, qu''elle a compris comme une sanction. Aucun de ces sujets ne serait sorti en réunion.

## À retenir

- 30 minutes toutes les quatre à six semaines, planifiées, tenues.
- Préparer dix minutes : notes précédentes, objectifs, un retour positif au moins.
- Cinq temps : ouvrir, faits, ressenti et besoins, engagements, conclure.
- Tracer cinq lignes après chaque entretien.
- Le recadrage est un entretien à part : faits, règle, écoute, attente, conséquence, trace.

## Sources

- France compétences, Répertoire spécifique, fiche RS7377.
- Michael Bungay Stanier, *The Coaching Habit*, Box of Crayons Press, 2016 (questions d''entretien).
- Andrew S. Grove, *High Output Management*, Random House, 1983 (le « one-on-one » comme outil de management).
- Ministère du Travail, fiche « La sanction disciplinaire », code.travail.gouv.fr.
- CNIL, « L''évaluation annuelle des salariés : droits et obligations des employeurs », cnil.fr (commentaires objectifs, droit d''accès du salarié).
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'L''entretien individuel de suivi est le rendez-vous régulier entre un manager et chaque membre de son équipe. Aucune loi ne l''impose, contrairement à l''entretien de parcours professionnel (leçon suivante), et c''est précisément pour cela qu''il saute dès que l''agenda se remplit. C''est pourtant là que vous apprenez ce que vos collaborateurs ne diront jamais en réunion.

## À quoi il sert

- Faire le point sur le travail : ce qui avance, ce qui bloque, ce dont la personne a besoin.
- Donner et recevoir du feedback, dans un cadre prévu plutôt qu''au détour d''un couloir.
- Suivre les objectifs individuels fixés au module 2.
- Détecter tôt les difficultés : surcharge, tension avec un collègue, démotivation, problème personnel qui déborde sur le travail.
- Construire la relation : quelqu''un à qui l''on réserve régulièrement une demi-heure, sans la déplacer, comprend qu''il compte.

Un rythme réaliste pour un manager de proximité : 30 minutes par personne toutes les quatre à six semaines, plus des points courts au fil de l''eau. Pour huit personnes vues toutes les cinq semaines, cela représente moins d''une heure par semaine. C''est peu, comparé au temps que coûte une crise qu''on a vue venir trop tard.

## Préparer

Dix minutes suffisent, à condition de les prendre. Relisez vos notes de l''entretien précédent (les engagements pris de part et d''autre), regardez les objectifs de la personne et ses indicateurs, notez un ou deux retours à faire (un positif au moins), et listez les questions que vous voulez poser.

Préparez aussi le cadre : un lieu fermé, un créneau respecté (un entretien déplacé trois fois dit « tu n''es pas prioritaire »), le téléphone en silencieux.

## Conduire : la trame en cinq temps

Les durées indiquées valent pour un entretien de trente minutes ; elles donnent un ordre de grandeur, pas un chronométrage.

## 1. Ouvrir (2 minutes)

Rappelez l''objet et la durée : « On a trente minutes pour faire le point sur ton travail, tes objectifs et ce dont tu as besoin. » Puis une question ouverte pour laisser la personne commencer : « Comment ça se passe pour toi en ce moment ? » Et vous écoutez, avec les outils de la leçon 3.2.

## 2. Les faits (10 minutes)

Passez en revue les objectifs et les engagements de la dernière fois. Pour chacun : où en est-on, avec des faits et des chiffres, pas des impressions. « Trois finitions sans remarque cette semaine » plutôt que « ça va mieux ». C''est le moment des retours, positifs et correctifs, avec la méthode SBI.

## 3. Le ressenti et les besoins (8 minutes)

« Qu''est-ce qui te pèse ? Qu''est-ce qui te plaît ? De quoi aurais-tu besoin pour mieux travailler ? » C''est la partie qu''on saute le plus volontiers, par gêne ou faute de temps, et c''est souvent elle qui fait apparaître une surcharge ou une tension pendant qu''il est encore temps d''agir. Si la personne évoque une difficulté personnelle ou de santé, écoutez sans creuser et orientez si nécessaire (service de prévention et de santé au travail, service social, RH) : vous n''êtes ni son médecin ni son confident.

## 4. Les engagements (7 minutes)

Décidez ensemble ce qui change d''ici la prochaine fois : ce que la personne fait, ce que vous faites. Deux ou trois engagements maximum, précis et datés. « Tu passes chaque finition par Thierry. Je règle le circuit des demandes de Sophie d''ici vendredi. »

## 5. Conclure (3 minutes)

Résumez les engagements à voix haute, fixez la date du prochain entretien, demandez : « Il y a quelque chose dont on n''a pas parlé et que tu voulais dire ? » Il n''est pas rare que ce soit à ce moment-là, la main sur la poignée de la porte, que sorte le vrai sujet.

## Tracer

Après l''entretien, cinq lignes dans votre carnet ou dans un fichier par personne : date, points abordés, engagements des deux côtés, date du prochain point. Il ne s''agit pas de surveiller, mais de garder la mémoire de la relation : c''est ce qui vous permet, six mois plus tard, de demander « en mars tu m''avais parlé de la peinture, où en es-tu ? ». C''est aussi la trace nécessaire si une situation se dégrade et doit remonter.

Rédigez ces notes comme si la personne devait les lire un jour, parce que c''est possible : des notes sur un salarié sont des données personnelles, et il peut en demander communication (droit d''accès prévu par le RGPD). Elles restent factuelles, sans jugement sur la personne, sans information de santé ni de vie privée au-delà du strict nécessaire (« absence prévue en juin » suffit).

## L''entretien de recadrage

Quand un comportement doit cesser (retards répétés, consigne contournée, manque de respect), l''entretien change de nature et devient un recadrage. Il garde la même exigence de faits et d''écoute, mais avec une structure resserrée :

- Les faits, datés, sans discussion possible sur leur réalité.
- La règle qui n''est pas respectée et pourquoi elle existe.
- L''écoute : « Qu''est-ce qui explique ça ? » On peut découvrir une cause réelle (un problème d''organisation, une difficulté personnelle) qui change la suite.
- L''attente, non négociable, et le délai.
- La conséquence si ça continue : « Si les retards se reproduisent, je devrai en informer Michel. » Dite calmement, comme une information et non comme une menace.
- La trace écrite, et un point de contrôle rapproché.

Rappel du module 1 : le recadrage relève du manager ; la sanction relève de l''employeur, avec sa procédure. Si une sanction devient un jour nécessaire, un recadrage daté et documenté permettra à l''employeur de la fonder sur des faits établis.

## Les erreurs classiques

- Transformer l''entretien en monologue : vous devriez parler moins de la moitié du temps.
- Ne parler que des problèmes : la personne finit par redouter les entretiens.
- Ne pas tenir ses propres engagements : la fois suivante, la personne ne s''engage plus.
- Le faire « quand on a le temps » : il n''y a jamais le temps. Les dates sont posées à l''avance pour le trimestre.
- Mélanger suivi et parcours professionnel : l''entretien de parcours a son propre cadre légal et sa propre trame (leçon suivante).

## Le cas Garnier

Karim installe un entretien de 30 minutes par personne toutes les six semaines avec les membres de l''atelier, planifié pour le trimestre, le mardi entre 13 h et 14 h. Il en propose aussi un à Sophie, avec l''accord de Michel, puisque le circuit des demandes les lie désormais. Le premier tour lui apprend trois choses qu''il ignorait : Nadia veut évoluer vers la formation (elle a aimé montrer la nacrée à Julien), Marc a une contrainte de garde d''enfant le mercredi qui explique une partie de ses tensions sur les horaires, et Sophie vit mal le nouveau circuit des demandes, qu''elle a compris comme une sanction. Aucun de ces sujets ne serait sorti en réunion.

## À retenir

- 30 minutes toutes les quatre à six semaines, planifiées, tenues.
- Préparer dix minutes : notes précédentes, objectifs, un retour positif au moins.
- Cinq temps : ouvrir, faits, ressenti et besoins, engagements, conclure.
- Tracer cinq lignes après chaque entretien.
- Le recadrage est un entretien à part : faits, règle, écoute, attente, conséquence, trace.

## Sources

- France compétences, Répertoire spécifique, fiche RS7377.
- Michael Bungay Stanier, *The Coaching Habit*, Box of Crayons Press, 2016 (questions d''entretien).
- Andrew S. Grove, *High Output Management*, Random House, 1983 (le « one-on-one » comme outil de management).
- Ministère du Travail, fiche « La sanction disciplinaire », code.travail.gouv.fr.
- CNIL, « L''évaluation annuelle des salariés : droits et obligations des employeurs », cnil.fr (commentaires objectifs, droit d''accès du salarié).
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 5;
  n := n + 1;

  -- 3.6-entretien-annuel-vs-parcours-professionnel.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Deux entretiens portent des noms proches et se tiennent parfois le même jour, avec la même personne, dans le même bureau. Ils n''ont pourtant ni le même objet, ni le même cadre juridique, ni les mêmes conséquences si on les néglige. Sur le terrain, la confusion est courante, et c''est presque toujours l''entretien de parcours, le seul imposé par la loi, qui en fait les frais.

## L''entretien annuel d''évaluation : facultatif, mais encadré

L''entretien annuel d''évaluation (on dit aussi entretien d''appréciation, ou entretien de performance) n''est imposé par aucun texte de loi. Il relève du pouvoir de direction de l''employeur, qui peut décider de l''organiser ou non. Beaucoup de conventions collectives ou d''accords d''entreprise le prévoient ; dans ce cas, il devient obligatoire dans l''entreprise concernée.

Son objet : faire le bilan de l''année écoulée (résultats, objectifs atteints ou non, comportement professionnel) et fixer les objectifs de l''année suivante. C''est un entretien de management, tourné vers le travail. Il peut avoir des conséquences sur la rémunération variable, les primes, les augmentations individuelles.

Même facultatif, il obéit à des règles :

- Les informations demandées au salarié doivent avoir un lien direct avec l''évaluation de ses aptitudes professionnelles (Code du travail, art. L1222-2). Les méthodes et techniques d''évaluation doivent être pertinentes au regard de la finalité poursuivie, et le salarié doit en être expressément informé avant leur mise en œuvre (art. L1222-3). En clair : pas d''évaluation sur des critères qu''il découvre en entretien.
- Dans les entreprises d''au moins cinquante salariés, le comité social et économique (CSE) est informé et consulté avant la mise en place du dispositif d''évaluation (art. L2312-38).
- Les résultats sont confidentiels (art. L1222-3). Le salarié peut accéder aux données de son évaluation, commentaires compris, au titre du droit d''accès prévu par le RGPD : ces commentaires doivent donc rester objectifs et pertinents (CNIL).

L''entretien annuel n''est pas un procès : il ne remplace ni un recadrage, ni une procédure disciplinaire. Bien conduit, il ne contient aucune surprise. Si le salarié découvre en janvier un reproche sur un fait de mars, le problème vient du manager : le feedback de la leçon 3.3 aurait dû être donné en mars.

## L''entretien de parcours professionnel : obligatoire, avec un contenu fixé par la loi

Jusqu''en octobre 2025, la loi imposait un « entretien professionnel » tous les deux ans, avec un état des lieux récapitulatif tous les six ans. La loi n° 2025-989 du 24 octobre 2025 (relative à l''emploi des salariés expérimentés et à l''évolution du dialogue social, dite loi « seniors ») l''a remplacé par l''« entretien de parcours professionnel », à l''article L6315-1 du Code du travail. Le texte s''applique depuis le 26 octobre 2025, lendemain de sa publication au Journal officiel. L''article a été retouché depuis par la loi n° 2025-1403 du 30 décembre 2025, qui a ajouté le congé supplémentaire de naissance à la liste des retours d''absence.

Le rythme de droit commun :

- un premier entretien au cours de la première année qui suit l''embauche (le salarié en est informé dès son arrivée) ;
- puis un entretien tous les quatre ans (au lieu de deux auparavant) ;
- tous les huit ans (au lieu de six), un état des lieux récapitulatif du parcours ; le premier peut intervenir sept ans après le premier entretien ;
- un entretien dans les deux mois qui suivent la visite médicale de mi-carrière (organisée en principe l''année des 45 ans, sauf autre échéance fixée par accord de branche) : il porte sur l''adaptation du poste ou des missions, la prévention de l''usure professionnelle, les besoins de formation et les souhaits de mobilité ou de reconversion, en tenant compte des mesures éventuellement proposées par le médecin du travail ; l''employeur, lui, n''a pas accès aux données de santé ;
- lors du premier entretien qui intervient dans les deux ans précédant le soixantième anniversaire, on aborde en plus les conditions de maintien dans l''emploi et les aménagements de fin de carrière (temps partiel, retraite progressive).

Un accord d''entreprise ou, à défaut, de branche peut fixer une autre périodicité, sans dépasser quatre ans entre deux entretiens. Les accords conclus sous l''ancien régime doivent être renégociés : à partir du 1er octobre 2026, ils sont soumis à la nouvelle rédaction. Pour les salariés déjà dans un cycle, le ministère du Travail indique que le délai de quatre ans court à partir du dernier entretien réalisé. Vérifiez toujours auprès de votre service RH ce qui s''applique dans votre entreprise.

L''entretien est aussi proposé systématiquement au salarié qui reprend son activité après certaines absences, s''il n''a pas eu d''entretien de parcours dans les douze mois précédant sa reprise : congé de maternité, d''adoption ou de naissance supplémentaire, congé parental d''éducation (ou passage à temps partiel à ce titre), congé de proche aidant, congé sabbatique, période de mobilité volontaire sécurisée, arrêt longue maladie, mandat syndical. Le salarié peut aussi demander à l''avoir avant sa reprise.

Contenu obligatoire : l''entretien porte sur le parcours du salarié, pas sur ses résultats. Il aborde ses compétences et qualifications, sa situation et son parcours professionnels, ses besoins de formation, ses souhaits d''évolution (y compris une reconversion ou une VAE), l''activation de son compte personnel de formation (CPF) et les abondements possibles, et le conseil en évolution professionnelle (CEP). Il est organisé par l''employeur, conduit par un supérieur hiérarchique ou un représentant de la direction, pendant le temps de travail, et donne lieu à un document écrit dont une copie est remise au salarié. Dans les entreprises de moins de trois cents salariés, celui-ci peut se faire aider par un conseiller en évolution professionnelle pour le préparer.

Ce qu''il n''est pas : un entretien d''évaluation. L''article L6315-1 le dit en toutes lettres. On ne parle pas des objectifs de l''année, ni de la qualité du travail, ni de la prime. On parle de l''avenir professionnel de la personne.

Sanction : dans les entreprises d''au moins cinquante salariés, si l''état des lieux montre qu''au cours des huit années écoulées le salarié n''a pas bénéficié des entretiens prévus et n''a suivi aucune formation autre que celles qui conditionnent l''exercice de son poste (art. L6321-2), l''employeur doit abonder son CPF. Le montant reste fixé à 3 000 € (art. R6323-3). Les deux conditions sont cumulatives : la Cour de cassation l''a confirmé (Cass. soc., 21 janvier 2026, n° 24-12.972). Indépendamment de cette sanction, un salarié peut invoquer l''absence d''entretiens devant le juge pour démontrer un manquement de l''employeur à son obligation d''adaptation au poste et de maintien de la capacité à occuper un emploi (art. L6321-1).

## Les différences en un tableau

| | Entretien annuel d''évaluation | Entretien de parcours professionnel |
| --- | --- | --- |
| Base | Facultatif (sauf accord ou convention) | Obligatoire, art. L6315-1 C. trav. |
| Rythme | Annuel en général | 1re année, puis tous les 4 ans ; après la visite de mi-carrière ; avant 60 ans ; état des lieux tous les 8 ans |
| Objet | Le travail de l''année : résultats, objectifs, comportement | Le parcours : compétences, formation, évolution, CPF, CEP |
| Regard | Vers l''année écoulée et la suivante | Vers les années à venir |
| Conséquences | Rémunération variable, objectifs | Plan de formation, mobilité, employabilité |
| Trace | Selon procédure interne | Document écrit obligatoire, copie au salarié |

Peut-on tenir les deux le même jour ? Oui, à condition de les distinguer clairement : deux temps, deux documents.

## Le rôle du manager de proximité

Dans beaucoup d''entreprises, c''est le manager direct qui conduit les deux entretiens, avec des trames fournies par les RH. Son rôle diffère selon l''entretien.

Pour l''entretien annuel, il est l''évaluateur : il apporte les faits de l''année (ceux qu''il a notés dans ses entretiens de suivi), il écoute la lecture du salarié, il fixe les objectifs suivants avec la méthode du module 2. Il ne promet rien sur la rémunération qu''il ne maîtrise pas.

Pour l''entretien de parcours, il est un relais : il aide la personne à formuler ses souhaits, il apporte sa vision des compétences (la matrice du module 2 est une bonne base), il note les besoins de formation, et il transmet aux RH. Il ne décide ni des formations, ni des mobilités, mais son compte rendu pèse. Il doit connaître, au moins dans les grandes lignes, les dispositifs qu''il est censé évoquer : le CPF (compte alimenté en euros chaque année, que le salarié mobilise pour des formations éligibles, principalement certifiantes, un bilan de compétences ou une VAE), le CEP (accompagnement gratuit et externe : pour les salariés, par les opérateurs régionaux sélectionnés par France compétences ; l''APEC pour les cadres ; Cap emploi pour les personnes en situation de handicap), la validation des acquis de l''expérience (VAE), le plan de développement des compétences de l''entreprise.

Dans les deux cas, il applique les mêmes principes que pour l''entretien de suivi : préparer, écouter, tracer.

## Les pièges

- Faire les deux entretiens en un seul document, sans distinction : la trace de l''entretien de parcours n''est alors pas conforme et le salarié n''a pas eu l''espace prévu pour parler de son avenir.
- Ne pas faire l''entretien de parcours « parce que la personne ne veut pas évoluer » : l''obligation vaut pour tous, y compris pour celui qui veut rester à son poste. On note alors ce souhait.
- Laisser passer les échéances : un manager qui prend ses fonctions demande aux RH la date du dernier entretien de chaque membre de l''équipe.
- Promettre une formation ou une promotion qu''on ne maîtrise pas : on note le souhait, on dit ce qu''on va faire (transmettre, appuyer), pas ce que l''entreprise va décider.
- Aborder la santé de la personne au-delà de ce qu''elle choisit de dire, y compris dans l''entretien qui suit la visite de mi-carrière : les questions d''aptitude relèvent du médecin du travail, pas du manager.

## Le cas Garnier

Karim découvre, en demandant à Sophie, qu''aucun entretien professionnel n''a jamais été formalisé à l''atelier. Michel « discute avec tout le monde », mais rien n''est écrit. Thierry, 52 ans, vingt ans de maison, n''a jamais eu ni entretien professionnel ni état des lieux ; Fatou, dont le poste a été aménagé, n''a jamais eu d''entretien pour en parler. L''atelier compte moins de cinquante salariés : il échappe à l''abondement correctif, mais pas à l''obligation elle-même, ni au risque en cas de contentieux.

Karim propose à Michel un calendrier : un entretien de parcours pour chacun d''ici trois mois, avec une trame qui reprend les thèmes de l''article L6315-1 (l''OPCO de l''entreprise peut aider à la construire), et un compte rendu signé dont chacun garde une copie, l''original étant classé par Sophie. Michel conduit l''entretien de Sophie, qui ne dépend pas de Karim. Pour Thierry, l''entretien aborde la suite de sa carrière et la transmission de son savoir-faire ; pour Nadia, son souhait de former ; pour Lucas, la suite de son apprentissage ; pour Fatou, les conditions de son poste aménagé et ses souhaits d''évolution. Karim sépare ces entretiens des entretiens de suivi : deux rendez-vous, deux documents.

## À retenir

- L''entretien annuel d''évaluation est facultatif, tourné vers le travail de l''année ; il exige des méthodes pertinentes et connues à l''avance.
- L''entretien de parcours professionnel (art. L6315-1, issu de la loi du 24 octobre 2025) est obligatoire : dans la première année, puis tous les quatre ans, après la visite de mi-carrière, avant 60 ans, avec un état des lieux tous les huit ans.
- Il porte sur le parcours (compétences, formation, évolution, CPF, CEP), jamais sur l''évaluation, et donne lieu à un écrit remis au salarié.
- Le manager évalue dans l''un, relaie dans l''autre ; dans les deux, il prépare, écoute et trace.
- Un accord d''entreprise ou de branche peut aménager la périodicité, sans dépasser quatre ans : renseignez-vous auprès des RH.

## Sources

- Code du travail, art. L6315-1 (rédaction issue de la loi n° 2025-989 du 24 octobre 2025, art. 3, modifiée par la loi n° 2025-1403 du 30 décembre 2025, art. 99), L6321-1, L6321-2, R6323-3, L4624-2-2, L1222-2, L1222-3, L2312-38, legifrance.gouv.fr.
- Loi n° 2025-989 du 24 octobre 2025 portant transposition des accords nationaux interprofessionnels en faveur de l''emploi des salariés expérimentés et relatif à l''évolution du dialogue social, *Journal officiel* du 25 octobre 2025, legifrance.gouv.fr.
- Cour de cassation, chambre sociale, 21 janvier 2026, n° 24-12.972 (abondement correctif : conditions cumulatives).
- Service-public.fr, fiche F32040 « Qu''est-ce qu''un entretien de parcours professionnel (EPP) ? », mise à jour du 1er octobre 2026.
- Ministère du Travail, « L''entretien de parcours professionnel », code.travail.gouv.fr.
- CNIL, « L''évaluation annuelle des salariés : droits et obligations des employeurs », cnil.fr.
- France compétences, Répertoire spécifique, fiche RS7377.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Deux entretiens portent des noms proches et se tiennent parfois le même jour, avec la même personne, dans le même bureau. Ils n''ont pourtant ni le même objet, ni le même cadre juridique, ni les mêmes conséquences si on les néglige. Sur le terrain, la confusion est courante, et c''est presque toujours l''entretien de parcours, le seul imposé par la loi, qui en fait les frais.

## L''entretien annuel d''évaluation : facultatif, mais encadré

L''entretien annuel d''évaluation (on dit aussi entretien d''appréciation, ou entretien de performance) n''est imposé par aucun texte de loi. Il relève du pouvoir de direction de l''employeur, qui peut décider de l''organiser ou non. Beaucoup de conventions collectives ou d''accords d''entreprise le prévoient ; dans ce cas, il devient obligatoire dans l''entreprise concernée.

Son objet : faire le bilan de l''année écoulée (résultats, objectifs atteints ou non, comportement professionnel) et fixer les objectifs de l''année suivante. C''est un entretien de management, tourné vers le travail. Il peut avoir des conséquences sur la rémunération variable, les primes, les augmentations individuelles.

Même facultatif, il obéit à des règles :

- Les informations demandées au salarié doivent avoir un lien direct avec l''évaluation de ses aptitudes professionnelles (Code du travail, art. L1222-2). Les méthodes et techniques d''évaluation doivent être pertinentes au regard de la finalité poursuivie, et le salarié doit en être expressément informé avant leur mise en œuvre (art. L1222-3). En clair : pas d''évaluation sur des critères qu''il découvre en entretien.
- Dans les entreprises d''au moins cinquante salariés, le comité social et économique (CSE) est informé et consulté avant la mise en place du dispositif d''évaluation (art. L2312-38).
- Les résultats sont confidentiels (art. L1222-3). Le salarié peut accéder aux données de son évaluation, commentaires compris, au titre du droit d''accès prévu par le RGPD : ces commentaires doivent donc rester objectifs et pertinents (CNIL).

L''entretien annuel n''est pas un procès : il ne remplace ni un recadrage, ni une procédure disciplinaire. Bien conduit, il ne contient aucune surprise. Si le salarié découvre en janvier un reproche sur un fait de mars, le problème vient du manager : le feedback de la leçon 3.3 aurait dû être donné en mars.

## L''entretien de parcours professionnel : obligatoire, avec un contenu fixé par la loi

Jusqu''en octobre 2025, la loi imposait un « entretien professionnel » tous les deux ans, avec un état des lieux récapitulatif tous les six ans. La loi n° 2025-989 du 24 octobre 2025 (relative à l''emploi des salariés expérimentés et à l''évolution du dialogue social, dite loi « seniors ») l''a remplacé par l''« entretien de parcours professionnel », à l''article L6315-1 du Code du travail. Le texte s''applique depuis le 26 octobre 2025, lendemain de sa publication au Journal officiel. L''article a été retouché depuis par la loi n° 2025-1403 du 30 décembre 2025, qui a ajouté le congé supplémentaire de naissance à la liste des retours d''absence.

Le rythme de droit commun :

- un premier entretien au cours de la première année qui suit l''embauche (le salarié en est informé dès son arrivée) ;
- puis un entretien tous les quatre ans (au lieu de deux auparavant) ;
- tous les huit ans (au lieu de six), un état des lieux récapitulatif du parcours ; le premier peut intervenir sept ans après le premier entretien ;
- un entretien dans les deux mois qui suivent la visite médicale de mi-carrière (organisée en principe l''année des 45 ans, sauf autre échéance fixée par accord de branche) : il porte sur l''adaptation du poste ou des missions, la prévention de l''usure professionnelle, les besoins de formation et les souhaits de mobilité ou de reconversion, en tenant compte des mesures éventuellement proposées par le médecin du travail ; l''employeur, lui, n''a pas accès aux données de santé ;
- lors du premier entretien qui intervient dans les deux ans précédant le soixantième anniversaire, on aborde en plus les conditions de maintien dans l''emploi et les aménagements de fin de carrière (temps partiel, retraite progressive).

Un accord d''entreprise ou, à défaut, de branche peut fixer une autre périodicité, sans dépasser quatre ans entre deux entretiens. Les accords conclus sous l''ancien régime doivent être renégociés : à partir du 1er octobre 2026, ils sont soumis à la nouvelle rédaction. Pour les salariés déjà dans un cycle, le ministère du Travail indique que le délai de quatre ans court à partir du dernier entretien réalisé. Vérifiez toujours auprès de votre service RH ce qui s''applique dans votre entreprise.

L''entretien est aussi proposé systématiquement au salarié qui reprend son activité après certaines absences, s''il n''a pas eu d''entretien de parcours dans les douze mois précédant sa reprise : congé de maternité, d''adoption ou de naissance supplémentaire, congé parental d''éducation (ou passage à temps partiel à ce titre), congé de proche aidant, congé sabbatique, période de mobilité volontaire sécurisée, arrêt longue maladie, mandat syndical. Le salarié peut aussi demander à l''avoir avant sa reprise.

Contenu obligatoire : l''entretien porte sur le parcours du salarié, pas sur ses résultats. Il aborde ses compétences et qualifications, sa situation et son parcours professionnels, ses besoins de formation, ses souhaits d''évolution (y compris une reconversion ou une VAE), l''activation de son compte personnel de formation (CPF) et les abondements possibles, et le conseil en évolution professionnelle (CEP). Il est organisé par l''employeur, conduit par un supérieur hiérarchique ou un représentant de la direction, pendant le temps de travail, et donne lieu à un document écrit dont une copie est remise au salarié. Dans les entreprises de moins de trois cents salariés, celui-ci peut se faire aider par un conseiller en évolution professionnelle pour le préparer.

Ce qu''il n''est pas : un entretien d''évaluation. L''article L6315-1 le dit en toutes lettres. On ne parle pas des objectifs de l''année, ni de la qualité du travail, ni de la prime. On parle de l''avenir professionnel de la personne.

Sanction : dans les entreprises d''au moins cinquante salariés, si l''état des lieux montre qu''au cours des huit années écoulées le salarié n''a pas bénéficié des entretiens prévus et n''a suivi aucune formation autre que celles qui conditionnent l''exercice de son poste (art. L6321-2), l''employeur doit abonder son CPF. Le montant reste fixé à 3 000 € (art. R6323-3). Les deux conditions sont cumulatives : la Cour de cassation l''a confirmé (Cass. soc., 21 janvier 2026, n° 24-12.972). Indépendamment de cette sanction, un salarié peut invoquer l''absence d''entretiens devant le juge pour démontrer un manquement de l''employeur à son obligation d''adaptation au poste et de maintien de la capacité à occuper un emploi (art. L6321-1).

## Les différences en un tableau

| | Entretien annuel d''évaluation | Entretien de parcours professionnel |
| --- | --- | --- |
| Base | Facultatif (sauf accord ou convention) | Obligatoire, art. L6315-1 C. trav. |
| Rythme | Annuel en général | 1re année, puis tous les 4 ans ; après la visite de mi-carrière ; avant 60 ans ; état des lieux tous les 8 ans |
| Objet | Le travail de l''année : résultats, objectifs, comportement | Le parcours : compétences, formation, évolution, CPF, CEP |
| Regard | Vers l''année écoulée et la suivante | Vers les années à venir |
| Conséquences | Rémunération variable, objectifs | Plan de formation, mobilité, employabilité |
| Trace | Selon procédure interne | Document écrit obligatoire, copie au salarié |

Peut-on tenir les deux le même jour ? Oui, à condition de les distinguer clairement : deux temps, deux documents.

## Le rôle du manager de proximité

Dans beaucoup d''entreprises, c''est le manager direct qui conduit les deux entretiens, avec des trames fournies par les RH. Son rôle diffère selon l''entretien.

Pour l''entretien annuel, il est l''évaluateur : il apporte les faits de l''année (ceux qu''il a notés dans ses entretiens de suivi), il écoute la lecture du salarié, il fixe les objectifs suivants avec la méthode du module 2. Il ne promet rien sur la rémunération qu''il ne maîtrise pas.

Pour l''entretien de parcours, il est un relais : il aide la personne à formuler ses souhaits, il apporte sa vision des compétences (la matrice du module 2 est une bonne base), il note les besoins de formation, et il transmet aux RH. Il ne décide ni des formations, ni des mobilités, mais son compte rendu pèse. Il doit connaître, au moins dans les grandes lignes, les dispositifs qu''il est censé évoquer : le CPF (compte alimenté en euros chaque année, que le salarié mobilise pour des formations éligibles, principalement certifiantes, un bilan de compétences ou une VAE), le CEP (accompagnement gratuit et externe : pour les salariés, par les opérateurs régionaux sélectionnés par France compétences ; l''APEC pour les cadres ; Cap emploi pour les personnes en situation de handicap), la validation des acquis de l''expérience (VAE), le plan de développement des compétences de l''entreprise.

Dans les deux cas, il applique les mêmes principes que pour l''entretien de suivi : préparer, écouter, tracer.

## Les pièges

- Faire les deux entretiens en un seul document, sans distinction : la trace de l''entretien de parcours n''est alors pas conforme et le salarié n''a pas eu l''espace prévu pour parler de son avenir.
- Ne pas faire l''entretien de parcours « parce que la personne ne veut pas évoluer » : l''obligation vaut pour tous, y compris pour celui qui veut rester à son poste. On note alors ce souhait.
- Laisser passer les échéances : un manager qui prend ses fonctions demande aux RH la date du dernier entretien de chaque membre de l''équipe.
- Promettre une formation ou une promotion qu''on ne maîtrise pas : on note le souhait, on dit ce qu''on va faire (transmettre, appuyer), pas ce que l''entreprise va décider.
- Aborder la santé de la personne au-delà de ce qu''elle choisit de dire, y compris dans l''entretien qui suit la visite de mi-carrière : les questions d''aptitude relèvent du médecin du travail, pas du manager.

## Le cas Garnier

Karim découvre, en demandant à Sophie, qu''aucun entretien professionnel n''a jamais été formalisé à l''atelier. Michel « discute avec tout le monde », mais rien n''est écrit. Thierry, 52 ans, vingt ans de maison, n''a jamais eu ni entretien professionnel ni état des lieux ; Fatou, dont le poste a été aménagé, n''a jamais eu d''entretien pour en parler. L''atelier compte moins de cinquante salariés : il échappe à l''abondement correctif, mais pas à l''obligation elle-même, ni au risque en cas de contentieux.

Karim propose à Michel un calendrier : un entretien de parcours pour chacun d''ici trois mois, avec une trame qui reprend les thèmes de l''article L6315-1 (l''OPCO de l''entreprise peut aider à la construire), et un compte rendu signé dont chacun garde une copie, l''original étant classé par Sophie. Michel conduit l''entretien de Sophie, qui ne dépend pas de Karim. Pour Thierry, l''entretien aborde la suite de sa carrière et la transmission de son savoir-faire ; pour Nadia, son souhait de former ; pour Lucas, la suite de son apprentissage ; pour Fatou, les conditions de son poste aménagé et ses souhaits d''évolution. Karim sépare ces entretiens des entretiens de suivi : deux rendez-vous, deux documents.

## À retenir

- L''entretien annuel d''évaluation est facultatif, tourné vers le travail de l''année ; il exige des méthodes pertinentes et connues à l''avance.
- L''entretien de parcours professionnel (art. L6315-1, issu de la loi du 24 octobre 2025) est obligatoire : dans la première année, puis tous les quatre ans, après la visite de mi-carrière, avant 60 ans, avec un état des lieux tous les huit ans.
- Il porte sur le parcours (compétences, formation, évolution, CPF, CEP), jamais sur l''évaluation, et donne lieu à un écrit remis au salarié.
- Le manager évalue dans l''un, relaie dans l''autre ; dans les deux, il prépare, écoute et trace.
- Un accord d''entreprise ou de branche peut aménager la périodicité, sans dépasser quatre ans : renseignez-vous auprès des RH.

## Sources

- Code du travail, art. L6315-1 (rédaction issue de la loi n° 2025-989 du 24 octobre 2025, art. 3, modifiée par la loi n° 2025-1403 du 30 décembre 2025, art. 99), L6321-1, L6321-2, R6323-3, L4624-2-2, L1222-2, L1222-3, L2312-38, legifrance.gouv.fr.
- Loi n° 2025-989 du 24 octobre 2025 portant transposition des accords nationaux interprofessionnels en faveur de l''emploi des salariés expérimentés et relatif à l''évolution du dialogue social, *Journal officiel* du 25 octobre 2025, legifrance.gouv.fr.
- Cour de cassation, chambre sociale, 21 janvier 2026, n° 24-12.972 (abondement correctif : conditions cumulatives).
- Service-public.fr, fiche F32040 « Qu''est-ce qu''un entretien de parcours professionnel (EPP) ? », mise à jour du 1er octobre 2026.
- Ministère du Travail, « L''entretien de parcours professionnel », code.travail.gouv.fr.
- CNIL, « L''évaluation annuelle des salariés : droits et obligations des employeurs », cnil.fr.
- France compétences, Répertoire spécifique, fiche RS7377.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 6;
  n := n + 1;

  -- 3.7-animer-une-reunion.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Trop longue, sans ordre du jour, sans décision, monopolisée par deux personnes pendant que les autres regardent leur téléphone : tout le monde a subi ce genre de réunion. Pourtant, une équipe qui ne se réunit jamais finit par n''être qu''une addition de personnes qui travaillent au même endroit. Le vrai sujet est donc moins le nombre de réunions que ce qu''elles produisent.

## À quoi sert une réunion

Avant de convoquer, demandez-vous ce que la réunion doit produire. En pratique, on retrouve presque toujours l''un de ces trois objets :

- Informer : donner à tous la même information en même temps, avec la possibilité de poser des questions. Si personne n''a de question à poser, un écrit suffisait.
- Décider : trancher ensemble une question, ou faire trancher par le manager après avoir entendu l''équipe.
- Résoudre : chercher ensemble une solution à un problème que personne ne peut résoudre seul.

Si vous ne trouvez pas l''objet, annulez. Et si l''ordre du jour se résume à des « points divers », réécrivez-le.

## Les rituels : fixer le rythme

Des réunions courtes, régulières et prévisibles valent généralement mieux que de grandes réunions espacées. Pour une équipe de proximité, trois rituels couvrent la plupart des besoins :

| Rituel | Durée | Objet | Format |
| --- | --- | --- | --- |
| Brief quotidien | 5 à 10 min | Priorités du jour, difficultés immédiates, absents | Debout, devant le planning, à heure fixe |
| Point hebdomadaire | 30 min | Tableau de bord, semaine écoulée, semaine à venir, un sujet | Assis, ordre du jour fixe, relevé de décisions |
| Réunion mensuelle | 1 h | Résultats du mois, sujet de fond, retour de l''équipe | Préparée, avec un support, compte rendu écrit |

Dans un atelier ou un service, c''est souvent le brief quotidien qui change le plus les choses : cinq minutes à 8 h devant le planning, et chacun sait ce qu''il fait, ce qui presse, qui manque. Autant de questions qu''on ne viendra plus vous poser une par une dans la journée.

## Préparer : l''ordre du jour

Pour préparer, posez-vous trois questions : pourquoi (l''objectif), quoi (les points, dans l''ordre, avec un temps pour chacun), qui (les participants nécessaires, et seulement eux). L''ordre du jour est envoyé ou affiché avant, avec les documents à lire s''il y en a.

Règles d''un bon ordre du jour :

- Chaque point est formulé comme une question ou un résultat attendu : « Décider du circuit des demandes urgentes » plutôt que « Demandes urgentes ».
- Les points qui demandent de l''énergie (décisions, désaccords) se traitent en début de réunion, pas à la fin.
- Le temps par point est indiqué. Dans une réunion de 30 minutes, on traite deux ou trois points, rarement plus.
- Le dernier point est toujours : « Décisions prises, qui fait quoi, pour quand. »

## Conduire : les rôles

L''animateur, souvent le manager, tient l''objectif et le temps. Il ouvre en rappelant l''objet et la durée, il donne la parole, il recentre quand on s''écarte, il fait formuler les décisions, il conclut. Il ne monopolise pas la parole : dans une réunion de décision, le manager parle en dernier, sinon personne ne dira autre chose que ce qu''il a dit.

Le rapporteur note les décisions et les actions, pas les débats. Ce rôle peut tourner dans l''équipe, ce qui responsabilise et évite que le manager fasse tout.

Le gardien du temps, si la réunion est longue, signale les dépassements. Dans une réunion de 30 minutes, l''animateur s''en charge.

## Les participants difficiles

Le bavard : il parle longtemps, revient sur ce qui est réglé, coupe les autres. On ne l''humilie pas ; on le cadre. « Merci Thierry, je note ton point. Je voudrais entendre les autres : Nadia ? » Si ça persiste, on lui en parle en tête-à-tête, avec la méthode SBI de la leçon 3.3.

Le silencieux : il ne dit rien, et on croit qu''il est d''accord. Il ne l''est pas toujours. On lui donne la parole nommément, sur une question précise, sans le mettre en difficulté : « Marc, sur le planning méca, tu le vis comment ? » Les tours de table courts, où chacun dit une phrase, aident beaucoup les plus discrets à prendre la parole.

Le négatif : il commence chaque phrase par « ça ne marchera jamais ». On ne discute pas la posture ; on demande le fait : « Qu''est-ce qui, concrètement, empêcherait que ça marche ? » Parfois il a raison, et c''est utile. Parfois il n''a rien de concret, et il s''en rend compte devant les autres.

Le hors-sujet : il amène un sujet qui n''est pas à l''ordre du jour. On le note « pour une prochaine fois » sur un coin du tableau, visiblement, et on revient au point.

Le téléphone : on pose la règle une fois, au début, pour tout le monde, et on la tient. Un manager qui consulte le sien en réunion a perdu le droit de la faire respecter.

## Décider et tracer

Une réunion qui ne débouche sur aucune décision ni action n''a été qu''une conversation. Pour chaque point, l''animateur fait formuler à voix haute : ce qui est décidé, qui s''en charge, pour quand. Le relevé de décisions tient en une dizaine de lignes, il est diffusé dans la journée (affiché, envoyé, ou noté dans le cahier de l''équipe), et il ouvre la réunion suivante : « On avait décidé ça, où en est-on ? »

C''est le suivi des décisions qui donne aux réunions leur crédibilité. Une décision jamais suivie enseigne à l''équipe que les réunions ne servent à rien.

## La réunion à distance

Quand une partie de l''équipe est en visioconférence (équipes éclatées, télétravail, plusieurs sites), quelques règles supplémentaires : caméras allumées si possible (sans en faire une obligation), un ordre du jour encore plus serré et une durée plus courte qu''en présentiel, des tours de parole explicites parce que personne ne peut « prendre » la parole naturellement, un document partagé où le rapporteur note en direct, et une attention particulière à ceux qui sont à distance quand d''autres sont dans la même salle : ils sont les premiers oubliés.

## La première réunion d''un nouveau manager

Tout le monde l''attend et l''observe. Évitez d''en faire une série d''annonces. Elle peut s''organiser ainsi : ce que vous avez compris de l''équipe et de sa situation (les faits, pas les jugements), ce que vous attendez et ce que l''équipe peut attendre de vous, et un tour de table où chacun dit ce qui, selon lui, doit changer en premier. Vous ne promettez rien ce jour-là, vous notez, et vous revenez avec des décisions à la réunion suivante.

## Le cas Garnier : la première réunion de Karim

Karim convoque l''équipe un mardi à 16 h 30, 45 minutes, dans le bureau devant le planning. Ordre du jour affiché la veille : où on en est (les trois objectifs et les chiffres du mois, 10 min) ; la nouvelle organisation (planning validé à 17 h, circuit des demandes de Sophie, contrôle finition par Thierry, 20 min) ; ce qui manque pour que ça marche, tour de table (10 min) ; décisions et prochaine réunion (5 min).

Thierry commence à raconter comment on faisait « avant » ; Karim le remercie, note, et donne la parole à Nadia. Marc, sollicité nommément, dit qu''il a besoin de connaître la veille les passages en mécanique : Karim le note comme décision. Lucas ne dit rien ; Karim lui demande ce qui le gêne le plus le matin ; il répond que les pièces ne sont pas prêtes. Décision : Fatou prépare les pièces la veille, et la manutention des éléments lourds reste confiée à Lucas et Julien, comme prévu au RACI du module 2. Relevé de décisions affiché le soir même, à côté du planning. Michel, qui assistait, n''a rien dit ; Karim lui avait demandé avant.

## À retenir

- Une réunion sert à informer, décider ou résoudre ; sans objet, on annule.
- Trois rituels : brief quotidien (5 à 10 min), point hebdo (30 min), réunion mensuelle (1 h).
- Ordre du jour formulé en résultats attendus, temps par point, décisions en premier.
- L''animateur tient l''objectif et le temps, parle en dernier dans une décision.
- Bavard : cadrer. Silencieux : nommer. Négatif : demander le fait. Hors-sujet : parquer.
- Chaque point finit par : décidé quoi, qui, pour quand. Le relevé ouvre la réunion suivante.

## Sources

- France compétences, Répertoire spécifique, fiche RS7377.
- Patrick Lencioni, *Death by Meeting*, Jossey-Bass, 2004 (rituels de réunion).
- Steven G. Rogelberg, *The Surprising Science of Meetings*, Oxford University Press, 2019 (recherche sur l''efficacité des réunions).
- INRS, dossier « Télétravail », inrs.fr.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Trop longue, sans ordre du jour, sans décision, monopolisée par deux personnes pendant que les autres regardent leur téléphone : tout le monde a subi ce genre de réunion. Pourtant, une équipe qui ne se réunit jamais finit par n''être qu''une addition de personnes qui travaillent au même endroit. Le vrai sujet est donc moins le nombre de réunions que ce qu''elles produisent.

## À quoi sert une réunion

Avant de convoquer, demandez-vous ce que la réunion doit produire. En pratique, on retrouve presque toujours l''un de ces trois objets :

- Informer : donner à tous la même information en même temps, avec la possibilité de poser des questions. Si personne n''a de question à poser, un écrit suffisait.
- Décider : trancher ensemble une question, ou faire trancher par le manager après avoir entendu l''équipe.
- Résoudre : chercher ensemble une solution à un problème que personne ne peut résoudre seul.

Si vous ne trouvez pas l''objet, annulez. Et si l''ordre du jour se résume à des « points divers », réécrivez-le.

## Les rituels : fixer le rythme

Des réunions courtes, régulières et prévisibles valent généralement mieux que de grandes réunions espacées. Pour une équipe de proximité, trois rituels couvrent la plupart des besoins :

| Rituel | Durée | Objet | Format |
| --- | --- | --- | --- |
| Brief quotidien | 5 à 10 min | Priorités du jour, difficultés immédiates, absents | Debout, devant le planning, à heure fixe |
| Point hebdomadaire | 30 min | Tableau de bord, semaine écoulée, semaine à venir, un sujet | Assis, ordre du jour fixe, relevé de décisions |
| Réunion mensuelle | 1 h | Résultats du mois, sujet de fond, retour de l''équipe | Préparée, avec un support, compte rendu écrit |

Dans un atelier ou un service, c''est souvent le brief quotidien qui change le plus les choses : cinq minutes à 8 h devant le planning, et chacun sait ce qu''il fait, ce qui presse, qui manque. Autant de questions qu''on ne viendra plus vous poser une par une dans la journée.

## Préparer : l''ordre du jour

Pour préparer, posez-vous trois questions : pourquoi (l''objectif), quoi (les points, dans l''ordre, avec un temps pour chacun), qui (les participants nécessaires, et seulement eux). L''ordre du jour est envoyé ou affiché avant, avec les documents à lire s''il y en a.

Règles d''un bon ordre du jour :

- Chaque point est formulé comme une question ou un résultat attendu : « Décider du circuit des demandes urgentes » plutôt que « Demandes urgentes ».
- Les points qui demandent de l''énergie (décisions, désaccords) se traitent en début de réunion, pas à la fin.
- Le temps par point est indiqué. Dans une réunion de 30 minutes, on traite deux ou trois points, rarement plus.
- Le dernier point est toujours : « Décisions prises, qui fait quoi, pour quand. »

## Conduire : les rôles

L''animateur, souvent le manager, tient l''objectif et le temps. Il ouvre en rappelant l''objet et la durée, il donne la parole, il recentre quand on s''écarte, il fait formuler les décisions, il conclut. Il ne monopolise pas la parole : dans une réunion de décision, le manager parle en dernier, sinon personne ne dira autre chose que ce qu''il a dit.

Le rapporteur note les décisions et les actions, pas les débats. Ce rôle peut tourner dans l''équipe, ce qui responsabilise et évite que le manager fasse tout.

Le gardien du temps, si la réunion est longue, signale les dépassements. Dans une réunion de 30 minutes, l''animateur s''en charge.

## Les participants difficiles

Le bavard : il parle longtemps, revient sur ce qui est réglé, coupe les autres. On ne l''humilie pas ; on le cadre. « Merci Thierry, je note ton point. Je voudrais entendre les autres : Nadia ? » Si ça persiste, on lui en parle en tête-à-tête, avec la méthode SBI de la leçon 3.3.

Le silencieux : il ne dit rien, et on croit qu''il est d''accord. Il ne l''est pas toujours. On lui donne la parole nommément, sur une question précise, sans le mettre en difficulté : « Marc, sur le planning méca, tu le vis comment ? » Les tours de table courts, où chacun dit une phrase, aident beaucoup les plus discrets à prendre la parole.

Le négatif : il commence chaque phrase par « ça ne marchera jamais ». On ne discute pas la posture ; on demande le fait : « Qu''est-ce qui, concrètement, empêcherait que ça marche ? » Parfois il a raison, et c''est utile. Parfois il n''a rien de concret, et il s''en rend compte devant les autres.

Le hors-sujet : il amène un sujet qui n''est pas à l''ordre du jour. On le note « pour une prochaine fois » sur un coin du tableau, visiblement, et on revient au point.

Le téléphone : on pose la règle une fois, au début, pour tout le monde, et on la tient. Un manager qui consulte le sien en réunion a perdu le droit de la faire respecter.

## Décider et tracer

Une réunion qui ne débouche sur aucune décision ni action n''a été qu''une conversation. Pour chaque point, l''animateur fait formuler à voix haute : ce qui est décidé, qui s''en charge, pour quand. Le relevé de décisions tient en une dizaine de lignes, il est diffusé dans la journée (affiché, envoyé, ou noté dans le cahier de l''équipe), et il ouvre la réunion suivante : « On avait décidé ça, où en est-on ? »

C''est le suivi des décisions qui donne aux réunions leur crédibilité. Une décision jamais suivie enseigne à l''équipe que les réunions ne servent à rien.

## La réunion à distance

Quand une partie de l''équipe est en visioconférence (équipes éclatées, télétravail, plusieurs sites), quelques règles supplémentaires : caméras allumées si possible (sans en faire une obligation), un ordre du jour encore plus serré et une durée plus courte qu''en présentiel, des tours de parole explicites parce que personne ne peut « prendre » la parole naturellement, un document partagé où le rapporteur note en direct, et une attention particulière à ceux qui sont à distance quand d''autres sont dans la même salle : ils sont les premiers oubliés.

## La première réunion d''un nouveau manager

Tout le monde l''attend et l''observe. Évitez d''en faire une série d''annonces. Elle peut s''organiser ainsi : ce que vous avez compris de l''équipe et de sa situation (les faits, pas les jugements), ce que vous attendez et ce que l''équipe peut attendre de vous, et un tour de table où chacun dit ce qui, selon lui, doit changer en premier. Vous ne promettez rien ce jour-là, vous notez, et vous revenez avec des décisions à la réunion suivante.

## Le cas Garnier : la première réunion de Karim

Karim convoque l''équipe un mardi à 16 h 30, 45 minutes, dans le bureau devant le planning. Ordre du jour affiché la veille : où on en est (les trois objectifs et les chiffres du mois, 10 min) ; la nouvelle organisation (planning validé à 17 h, circuit des demandes de Sophie, contrôle finition par Thierry, 20 min) ; ce qui manque pour que ça marche, tour de table (10 min) ; décisions et prochaine réunion (5 min).

Thierry commence à raconter comment on faisait « avant » ; Karim le remercie, note, et donne la parole à Nadia. Marc, sollicité nommément, dit qu''il a besoin de connaître la veille les passages en mécanique : Karim le note comme décision. Lucas ne dit rien ; Karim lui demande ce qui le gêne le plus le matin ; il répond que les pièces ne sont pas prêtes. Décision : Fatou prépare les pièces la veille, et la manutention des éléments lourds reste confiée à Lucas et Julien, comme prévu au RACI du module 2. Relevé de décisions affiché le soir même, à côté du planning. Michel, qui assistait, n''a rien dit ; Karim lui avait demandé avant.

## À retenir

- Une réunion sert à informer, décider ou résoudre ; sans objet, on annule.
- Trois rituels : brief quotidien (5 à 10 min), point hebdo (30 min), réunion mensuelle (1 h).
- Ordre du jour formulé en résultats attendus, temps par point, décisions en premier.
- L''animateur tient l''objectif et le temps, parle en dernier dans une décision.
- Bavard : cadrer. Silencieux : nommer. Négatif : demander le fait. Hors-sujet : parquer.
- Chaque point finit par : décidé quoi, qui, pour quand. Le relevé ouvre la réunion suivante.

## Sources

- France compétences, Répertoire spécifique, fiche RS7377.
- Patrick Lencioni, *Death by Meeting*, Jossey-Bass, 2004 (rituels de réunion).
- Steven G. Rogelberg, *The Surprising Science of Meetings*, Oxford University Press, 2019 (recherche sur l''efficacité des réunions).
- INRS, dossier « Télétravail », inrs.fr.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 7;
  n := n + 1;

  -- 3.8-podcast-dire-non-alerter-negocier.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Version écrite de l''épisode (le texte de référence ; l''enregistrement peut le formuler autrement).

Conversation entre Claire, animatrice IDEAFORMA et David, responsable d''équipe logistique dans une plateforme de distribution (22 salariés, trois chefs d''équipe ; au-dessus de lui, un directeur de site), en poste depuis quatre ans après avoir été cariste puis chef de quai (personnage fictif).

**Claire** — Bonjour à tous. Aujourd''hui, on parle d''une communication dont les formations de management parlent peu : celle qui va vers le haut. Comment on dit non à son directeur, comment on lui remonte un problème sans passer pour celui qui râle, comment on obtient des moyens. David, vous encadrez une équipe logistique depuis quatre ans. Est-ce que vous vous souvenez de la première fois où vous avez dû dire non à votre hiérarchie ?

**David** — Très bien. Et je ne l''ai pas dit. C''était trois mois après ma prise de poste. Mon directeur de site m''annonce qu''on va absorber les flux d''un autre entrepôt pendant deux semaines, sans renfort. Je savais que c''était impossible avec mes effectifs. J''ai dit « on va faire au mieux ».

**Claire** — Et ?

**David** — Et on n''a pas fait au mieux. On a fait des heures, on a eu deux arrêts de travail, on a livré en retard, et à la fin le directeur m''a demandé pourquoi je ne l''avais pas prévenu. Ce qui m''a rendu fou, parce que j''avais l''impression de l''avoir prévenu.

**Claire** — Vous aviez dit « on va faire au mieux ».

**David** — Oui. Et pour lui, ça voulait dire « c''est bon ». Pour moi, ça voulait dire « c''est impossible mais je n''ose pas le dire ». C''est là que j''ai compris que « faire au mieux », pour un manager, c''est la pire réponse possible. Ce n''est ni un oui, ni un non, et tout le monde entend ce qui l''arrange.

**Claire** — Alors qu''est-ce qu''il aurait fallu dire ?

**David** — Avec le recul, quelque chose comme : « Avec l''équipe actuelle, on peut absorber la moitié du flux en tenant les délais. Pour absorber tout, il me faut trois intérimaires sur deux semaines, ou on accepte deux jours de retard sur les commandes non prioritaires. Qu''est-ce que vous préférez ? »

**Claire** — C''est intéressant, parce que ce n''est pas un non.

**David** — Non, c''est mieux qu''un non. Un non sec, à un directeur, ça ne passe pas, et ça ne devrait pas passer, d''ailleurs : c''est lui qui décide. Mais un « oui, à ces conditions » ou un « oui, avec ces conséquences », c''est du management. Vous lui donnez les faits, vous lui donnez des options, et vous lui laissez la décision. Et si sa décision c''est « on absorbe tout sans renfort et on tient les délais », là vous dites : « Je ne sais pas le faire. Je vais essayer, mais je vous dis maintenant que ça ne tiendra pas, et je vous le redirai par écrit. »

**Claire** — On va revenir sur l''écrit. Mais d''abord, cette idée d''options. Pourquoi c''est si important ?

**David** — Parce qu''un chef qui reçoit un problème sans option se retrouve avec le problème sur les bras, et il n''aime pas ça. Il a vingt problèmes déjà. Si vous arrivez avec « j''ai un problème », vous en êtes un de plus. Si vous arrivez avec « j''ai un problème, voilà deux façons de le régler, je recommande la première, j''ai besoin de votre accord », vous êtes une solution.

**Claire** — C''est ce qu''on appelle parfois « monter avec une solution ».

**David** — Oui, mais attention à un piège : il ne faut pas attendre d''avoir la solution parfaite pour remonter le problème. J''ai vu des chefs d''équipe garder un problème trois semaines parce qu''ils cherchaient la solution, et quand ils l''ont remonté, c''était trop tard. La règle que je donne à mes chefs d''équipe : un problème se remonte dans les 24 heures, avec ce qu''on sait, avec ce qu''on ne sait pas, et avec ce qu''on propose, même si c''est imparfait.

**Claire** — Vous avez dit « sans passer pour celui qui râle ». C''est une vraie peur chez les managers de proximité.

**David** — C''est la peur principale. On a l''impression que remonter un problème, c''est se plaindre, ou avouer qu''on ne gère pas. Alors on se tait, et on gère seul, et un jour ça explose, et là on est vraiment celui qui ne gère pas.

**Claire** — Comment on fait la différence entre alerter et se plaindre ?

**David** — Se plaindre, c''est parler de soi et de ce qu''on ressent : « c''est ingérable, on n''en peut plus, on n''a jamais les moyens ». Alerter, c''est parler des faits et des conséquences pour l''entreprise : « on est à 82 % de délais tenus au lieu de 95 %, la cause principale c''est l''absence de cariste le samedi, si ça continue on perd le contrat X ». Le premier message, votre chef l''entend comme du bruit. Le second, il l''entend comme un risque, et les chefs sont là pour gérer les risques.

**Claire** — Donc les faits, encore. C''est le même principe que pour le feedback à l''équipe.

**David** — C''est exactement le même. Vers le bas, vers le haut, c''est la même méthode : les faits, l''impact, ce qu''on propose. La seule différence, c''est qu''en montant, vous ne donnez pas une consigne, vous demandez une décision.

**Claire** — Vous avez évoqué l''écrit. Quand est-ce qu''on écrit à sa hiérarchie ?

**David** — Toujours après l''oral, jamais à la place. Je dis d''abord les choses en face, et ensuite je confirme par un message court : « Comme convenu ce matin, on absorbe le flux de l''entrepôt B avec deux intérimaires à partir de lundi ; sans renfort, je vous confirme que les délais ne tiendront pas sur les commandes non prioritaires. » Ce n''est pas pour me couvrir, enfin pas seulement. C''est pour que la décision soit claire, pour lui comme pour moi.

**Claire** — Mais ça sert aussi à se couvrir.

**David** — Oui. Et il faut le dire sans gêne : un manager qui a alerté par écrit et à qui on a dit de continuer quand même n''est pas dans la même position que celui qui n''a rien dit. Pour la sécurité, en particulier, c''est essentiel. Si mon directeur me demande de faire tourner un chariot dont le contrôle périodique est dépassé, je dis non, je le dis par écrit, et là c''est un vrai non. Il y a des sujets où « oui à ces conditions » n''existe pas : la sécurité, la légalité, la dignité des gens. Là, le non est net, et il est écrit.

**Claire** — Vous encadrez trois chefs d''équipe. Vous leur apprenez ça ?

**David** — J''essaie. Et je leur dis surtout une chose : je préfère un chef d''équipe qui me dit non avec des arguments qu''un chef d''équipe qui me dit oui et qui ne livre pas. Le premier me fait gagner du temps. Le second m''en fait perdre, et il perd ma confiance.

**Claire** — Passons à la négociation. Obtenir des moyens : un poste, du matériel, du budget de formation. Comment vous vous y prenez ?

**David** — Je prépare comme un dossier. Ça paraît lourd, mais un directeur qui reçoit une demande de poste doit lui-même la défendre au-dessus de lui, donc il a besoin de mes arguments. Le dossier, c''est une page : le besoin, chiffré ; ce que ça coûte ; ce que ça rapporte ou ce que ça évite ; ce qui se passe si on ne le fait pas ; et ce que je propose comme alternative si le budget n''est pas là.

**Claire** — Donnez-nous un exemple.

**David** — Le cariste du samedi. Ma demande : un poste à temps partiel, 8 heures le samedi. Le coût : environ 12 000 euros par an chargés. Ce que ça évite : les heures supplémentaires actuelles, qui coûtent déjà 7 000, et les retards du lundi, qui nous ont valu deux pénalités à 3 000 euros chacune l''année dernière. Donc le poste se paie tout seul. L''alternative si on refuse : je décale les commandes du samedi au lundi, et on accepte un délai de plus sur ces commandes-là. Avec ça, mon directeur a tout ce qu''il faut pour décider, et pour défendre le poste auprès de la direction régionale.

**Claire** — Vous parlez le langage de la direction.

**David** — Le langage de la direction, c''est les chiffres et les risques. Pas parce que les directeurs sont insensibles, mais parce que c''est comme ça qu''ils arbitrent entre vingt demandes. Si je dis « mon équipe est fatiguée », c''est vrai, mais ça ne pèse rien face à une autre demande chiffrée. Si je dis « la fatigue nous coûte deux arrêts de travail par trimestre, soit tant de jours perdus », ça pèse.

**Claire** — Et quand la réponse est non ?

**David** — D''abord, je demande pourquoi. Pas pour contester, pour comprendre. Souvent, le non a une raison que je ne connaissais pas : un gel des embauches, une autre priorité. Ensuite, je demande ce qui pourrait faire changer la réponse : « À quelles conditions ce serait envisageable ? Dans quel délai ? » Et je reviens trois mois plus tard avec les chiffres mis à jour. Un non aujourd''hui n''est pas un non pour toujours.

**Claire** — Et vis-à-vis de l''équipe, quand vous revenez avec un non ?

**David** — C''est le moment le plus délicat. La tentation, c''est de dire « j''ai demandé, ils ont refusé, c''est pas moi ». Et c''est une catastrophe, parce que vous vous mettez du côté de l''équipe contre la direction, et vous n''êtes plus manager. Je dis : « J''ai demandé un cariste le samedi. La réponse est non pour cette année, parce que les embauches sont gelées. Voilà ce qu''on fait en attendant. Et je redemande en janvier. » Je porte la décision, même si je ne la partage pas. Ce que j''en pense, je l''ai dit à mon directeur, pas à l''équipe.

**Claire** — C''est la loyauté dont on parle au module 1.

**David** — Oui. Loyal vers le haut, ça veut dire : je conteste avant, en face, avec des arguments ; et une fois que c''est décidé, je porte. Loyal vers le bas, ça veut dire : je ne cache pas les décisions, je ne fais pas semblant de les avoir prises quand je ne les ai pas prises, et je dis ce que je fais pour l''équipe.

**Claire** — Il y a un autre sujet difficile : le manager qui doit alerter sur un problème qui concerne sa hiérarchie elle-même. Un directeur qui prend de mauvaises décisions, ou qui a un comportement inapproprié.

**David** — C''est rare, mais ça arrive, et il faut savoir quoi faire. Pour une mauvaise décision, c''est ce qu''on a dit : les faits, l''impact, les options, en face, puis par écrit. Si ça ne suffit pas et que le risque est grave, on monte d''un niveau, en le disant : « Je vais en parler à la direction régionale, je vous en informe. » Ce n''est pas de la trahison, c''est de l''alerte.

**Claire** — Et pour un comportement ?

**David** — Là, on ne gère pas seul. Si un supérieur a un comportement de harcèlement, de discrimination, ou met les gens en danger, il y a des circuits prévus : les ressources humaines, le CSE, le médecin du travail, le référent harcèlement, et, si l''entreprise ne réagit pas, l''inspection du travail. Un manager de proximité qui constate ça a l''obligation de le remonter, et il a une protection légale quand il le fait de bonne foi. Ce n''est pas un sujet de négociation.

**Claire** — Pour terminer, si vous deviez donner trois conseils à un nouveau manager sur la communication vers le haut ?

**David** — Un : ne dites jamais « on va faire au mieux ». Dites « oui », « non », ou « oui à ces conditions », et dites-le avec des faits. Deux : remontez les problèmes dans les 24 heures, avec ce que vous savez et ce que vous proposez, même imparfait ; votre chef préfère un problème tôt qu''une catastrophe tard. Trois : quand vous revenez vers l''équipe, portez la décision. Vous avez le droit de la contester avant, en face ; vous n''avez pas le droit de la désavouer après, devant l''équipe.

**Claire** — Et le quatrième, que vous n''avez pas dit : l''écrit après l''oral.

**David** — Toujours. Court, factuel, « comme convenu ». Ça protège tout le monde, à commencer par la décision elle-même.

**Claire** — Merci David. Dans la fiche outil qui suit, vous trouverez la trame de l''entretien de suivi et un modèle d''ordre du jour. Et dans le cas pratique, Karim va devoir, lui aussi, parler à Michel.

## Sources
Henry Mintzberg, *The Nature of Managerial Work*, Harper & Row, 1973 (rôles interpersonnels et informationnels) ; Code du travail, art. L1152-2 et L1153-3 (protection des salariés qui témoignent de faits de harcèlement moral ou sexuel ou les relatent), L1132-3 (protection des témoins de discrimination), L1132-3-3 (lanceurs d''alerte), L1153-5-1 et L2314-1 (référents harcèlement sexuel), L4122-1 (obligation de sécurité du salarié), legifrance.gouv.fr ; Roger Fisher, William Ury, *Comment réussir une négociation*, Seuil, 1982 (éd. originale *Getting to Yes*, Houghton Mifflin, 1981), négociation sur les intérêts.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Version écrite de l''épisode (le texte de référence ; l''enregistrement peut le formuler autrement).

Conversation entre Claire, animatrice IDEAFORMA et David, responsable d''équipe logistique dans une plateforme de distribution (22 salariés, trois chefs d''équipe ; au-dessus de lui, un directeur de site), en poste depuis quatre ans après avoir été cariste puis chef de quai (personnage fictif).

**Claire** — Bonjour à tous. Aujourd''hui, on parle d''une communication dont les formations de management parlent peu : celle qui va vers le haut. Comment on dit non à son directeur, comment on lui remonte un problème sans passer pour celui qui râle, comment on obtient des moyens. David, vous encadrez une équipe logistique depuis quatre ans. Est-ce que vous vous souvenez de la première fois où vous avez dû dire non à votre hiérarchie ?

**David** — Très bien. Et je ne l''ai pas dit. C''était trois mois après ma prise de poste. Mon directeur de site m''annonce qu''on va absorber les flux d''un autre entrepôt pendant deux semaines, sans renfort. Je savais que c''était impossible avec mes effectifs. J''ai dit « on va faire au mieux ».

**Claire** — Et ?

**David** — Et on n''a pas fait au mieux. On a fait des heures, on a eu deux arrêts de travail, on a livré en retard, et à la fin le directeur m''a demandé pourquoi je ne l''avais pas prévenu. Ce qui m''a rendu fou, parce que j''avais l''impression de l''avoir prévenu.

**Claire** — Vous aviez dit « on va faire au mieux ».

**David** — Oui. Et pour lui, ça voulait dire « c''est bon ». Pour moi, ça voulait dire « c''est impossible mais je n''ose pas le dire ». C''est là que j''ai compris que « faire au mieux », pour un manager, c''est la pire réponse possible. Ce n''est ni un oui, ni un non, et tout le monde entend ce qui l''arrange.

**Claire** — Alors qu''est-ce qu''il aurait fallu dire ?

**David** — Avec le recul, quelque chose comme : « Avec l''équipe actuelle, on peut absorber la moitié du flux en tenant les délais. Pour absorber tout, il me faut trois intérimaires sur deux semaines, ou on accepte deux jours de retard sur les commandes non prioritaires. Qu''est-ce que vous préférez ? »

**Claire** — C''est intéressant, parce que ce n''est pas un non.

**David** — Non, c''est mieux qu''un non. Un non sec, à un directeur, ça ne passe pas, et ça ne devrait pas passer, d''ailleurs : c''est lui qui décide. Mais un « oui, à ces conditions » ou un « oui, avec ces conséquences », c''est du management. Vous lui donnez les faits, vous lui donnez des options, et vous lui laissez la décision. Et si sa décision c''est « on absorbe tout sans renfort et on tient les délais », là vous dites : « Je ne sais pas le faire. Je vais essayer, mais je vous dis maintenant que ça ne tiendra pas, et je vous le redirai par écrit. »

**Claire** — On va revenir sur l''écrit. Mais d''abord, cette idée d''options. Pourquoi c''est si important ?

**David** — Parce qu''un chef qui reçoit un problème sans option se retrouve avec le problème sur les bras, et il n''aime pas ça. Il a vingt problèmes déjà. Si vous arrivez avec « j''ai un problème », vous en êtes un de plus. Si vous arrivez avec « j''ai un problème, voilà deux façons de le régler, je recommande la première, j''ai besoin de votre accord », vous êtes une solution.

**Claire** — C''est ce qu''on appelle parfois « monter avec une solution ».

**David** — Oui, mais attention à un piège : il ne faut pas attendre d''avoir la solution parfaite pour remonter le problème. J''ai vu des chefs d''équipe garder un problème trois semaines parce qu''ils cherchaient la solution, et quand ils l''ont remonté, c''était trop tard. La règle que je donne à mes chefs d''équipe : un problème se remonte dans les 24 heures, avec ce qu''on sait, avec ce qu''on ne sait pas, et avec ce qu''on propose, même si c''est imparfait.

**Claire** — Vous avez dit « sans passer pour celui qui râle ». C''est une vraie peur chez les managers de proximité.

**David** — C''est la peur principale. On a l''impression que remonter un problème, c''est se plaindre, ou avouer qu''on ne gère pas. Alors on se tait, et on gère seul, et un jour ça explose, et là on est vraiment celui qui ne gère pas.

**Claire** — Comment on fait la différence entre alerter et se plaindre ?

**David** — Se plaindre, c''est parler de soi et de ce qu''on ressent : « c''est ingérable, on n''en peut plus, on n''a jamais les moyens ». Alerter, c''est parler des faits et des conséquences pour l''entreprise : « on est à 82 % de délais tenus au lieu de 95 %, la cause principale c''est l''absence de cariste le samedi, si ça continue on perd le contrat X ». Le premier message, votre chef l''entend comme du bruit. Le second, il l''entend comme un risque, et les chefs sont là pour gérer les risques.

**Claire** — Donc les faits, encore. C''est le même principe que pour le feedback à l''équipe.

**David** — C''est exactement le même. Vers le bas, vers le haut, c''est la même méthode : les faits, l''impact, ce qu''on propose. La seule différence, c''est qu''en montant, vous ne donnez pas une consigne, vous demandez une décision.

**Claire** — Vous avez évoqué l''écrit. Quand est-ce qu''on écrit à sa hiérarchie ?

**David** — Toujours après l''oral, jamais à la place. Je dis d''abord les choses en face, et ensuite je confirme par un message court : « Comme convenu ce matin, on absorbe le flux de l''entrepôt B avec deux intérimaires à partir de lundi ; sans renfort, je vous confirme que les délais ne tiendront pas sur les commandes non prioritaires. » Ce n''est pas pour me couvrir, enfin pas seulement. C''est pour que la décision soit claire, pour lui comme pour moi.

**Claire** — Mais ça sert aussi à se couvrir.

**David** — Oui. Et il faut le dire sans gêne : un manager qui a alerté par écrit et à qui on a dit de continuer quand même n''est pas dans la même position que celui qui n''a rien dit. Pour la sécurité, en particulier, c''est essentiel. Si mon directeur me demande de faire tourner un chariot dont le contrôle périodique est dépassé, je dis non, je le dis par écrit, et là c''est un vrai non. Il y a des sujets où « oui à ces conditions » n''existe pas : la sécurité, la légalité, la dignité des gens. Là, le non est net, et il est écrit.

**Claire** — Vous encadrez trois chefs d''équipe. Vous leur apprenez ça ?

**David** — J''essaie. Et je leur dis surtout une chose : je préfère un chef d''équipe qui me dit non avec des arguments qu''un chef d''équipe qui me dit oui et qui ne livre pas. Le premier me fait gagner du temps. Le second m''en fait perdre, et il perd ma confiance.

**Claire** — Passons à la négociation. Obtenir des moyens : un poste, du matériel, du budget de formation. Comment vous vous y prenez ?

**David** — Je prépare comme un dossier. Ça paraît lourd, mais un directeur qui reçoit une demande de poste doit lui-même la défendre au-dessus de lui, donc il a besoin de mes arguments. Le dossier, c''est une page : le besoin, chiffré ; ce que ça coûte ; ce que ça rapporte ou ce que ça évite ; ce qui se passe si on ne le fait pas ; et ce que je propose comme alternative si le budget n''est pas là.

**Claire** — Donnez-nous un exemple.

**David** — Le cariste du samedi. Ma demande : un poste à temps partiel, 8 heures le samedi. Le coût : environ 12 000 euros par an chargés. Ce que ça évite : les heures supplémentaires actuelles, qui coûtent déjà 7 000, et les retards du lundi, qui nous ont valu deux pénalités à 3 000 euros chacune l''année dernière. Donc le poste se paie tout seul. L''alternative si on refuse : je décale les commandes du samedi au lundi, et on accepte un délai de plus sur ces commandes-là. Avec ça, mon directeur a tout ce qu''il faut pour décider, et pour défendre le poste auprès de la direction régionale.

**Claire** — Vous parlez le langage de la direction.

**David** — Le langage de la direction, c''est les chiffres et les risques. Pas parce que les directeurs sont insensibles, mais parce que c''est comme ça qu''ils arbitrent entre vingt demandes. Si je dis « mon équipe est fatiguée », c''est vrai, mais ça ne pèse rien face à une autre demande chiffrée. Si je dis « la fatigue nous coûte deux arrêts de travail par trimestre, soit tant de jours perdus », ça pèse.

**Claire** — Et quand la réponse est non ?

**David** — D''abord, je demande pourquoi. Pas pour contester, pour comprendre. Souvent, le non a une raison que je ne connaissais pas : un gel des embauches, une autre priorité. Ensuite, je demande ce qui pourrait faire changer la réponse : « À quelles conditions ce serait envisageable ? Dans quel délai ? » Et je reviens trois mois plus tard avec les chiffres mis à jour. Un non aujourd''hui n''est pas un non pour toujours.

**Claire** — Et vis-à-vis de l''équipe, quand vous revenez avec un non ?

**David** — C''est le moment le plus délicat. La tentation, c''est de dire « j''ai demandé, ils ont refusé, c''est pas moi ». Et c''est une catastrophe, parce que vous vous mettez du côté de l''équipe contre la direction, et vous n''êtes plus manager. Je dis : « J''ai demandé un cariste le samedi. La réponse est non pour cette année, parce que les embauches sont gelées. Voilà ce qu''on fait en attendant. Et je redemande en janvier. » Je porte la décision, même si je ne la partage pas. Ce que j''en pense, je l''ai dit à mon directeur, pas à l''équipe.

**Claire** — C''est la loyauté dont on parle au module 1.

**David** — Oui. Loyal vers le haut, ça veut dire : je conteste avant, en face, avec des arguments ; et une fois que c''est décidé, je porte. Loyal vers le bas, ça veut dire : je ne cache pas les décisions, je ne fais pas semblant de les avoir prises quand je ne les ai pas prises, et je dis ce que je fais pour l''équipe.

**Claire** — Il y a un autre sujet difficile : le manager qui doit alerter sur un problème qui concerne sa hiérarchie elle-même. Un directeur qui prend de mauvaises décisions, ou qui a un comportement inapproprié.

**David** — C''est rare, mais ça arrive, et il faut savoir quoi faire. Pour une mauvaise décision, c''est ce qu''on a dit : les faits, l''impact, les options, en face, puis par écrit. Si ça ne suffit pas et que le risque est grave, on monte d''un niveau, en le disant : « Je vais en parler à la direction régionale, je vous en informe. » Ce n''est pas de la trahison, c''est de l''alerte.

**Claire** — Et pour un comportement ?

**David** — Là, on ne gère pas seul. Si un supérieur a un comportement de harcèlement, de discrimination, ou met les gens en danger, il y a des circuits prévus : les ressources humaines, le CSE, le médecin du travail, le référent harcèlement, et, si l''entreprise ne réagit pas, l''inspection du travail. Un manager de proximité qui constate ça a l''obligation de le remonter, et il a une protection légale quand il le fait de bonne foi. Ce n''est pas un sujet de négociation.

**Claire** — Pour terminer, si vous deviez donner trois conseils à un nouveau manager sur la communication vers le haut ?

**David** — Un : ne dites jamais « on va faire au mieux ». Dites « oui », « non », ou « oui à ces conditions », et dites-le avec des faits. Deux : remontez les problèmes dans les 24 heures, avec ce que vous savez et ce que vous proposez, même imparfait ; votre chef préfère un problème tôt qu''une catastrophe tard. Trois : quand vous revenez vers l''équipe, portez la décision. Vous avez le droit de la contester avant, en face ; vous n''avez pas le droit de la désavouer après, devant l''équipe.

**Claire** — Et le quatrième, que vous n''avez pas dit : l''écrit après l''oral.

**David** — Toujours. Court, factuel, « comme convenu ». Ça protège tout le monde, à commencer par la décision elle-même.

**Claire** — Merci David. Dans la fiche outil qui suit, vous trouverez la trame de l''entretien de suivi et un modèle d''ordre du jour. Et dans le cas pratique, Karim va devoir, lui aussi, parler à Michel.

## Sources
Henry Mintzberg, *The Nature of Managerial Work*, Harper & Row, 1973 (rôles interpersonnels et informationnels) ; Code du travail, art. L1152-2 et L1153-3 (protection des salariés qui témoignent de faits de harcèlement moral ou sexuel ou les relatent), L1132-3 (protection des témoins de discrimination), L1132-3-3 (lanceurs d''alerte), L1153-5-1 et L2314-1 (référents harcèlement sexuel), L4122-1 (obligation de sécurité du salarié), legifrance.gouv.fr ; Roger Fisher, William Ury, *Comment réussir une négociation*, Seuil, 1982 (éd. originale *Getting to Yes*, Houghton Mifflin, 1981), négociation sur les intérêts.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 8;
  n := n + 1;

  -- 3.9-fiche-trame-entretien-ordre-du-jour.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Cinq gabarits à recopier ou à imprimer (PDF à générer, mise en page IDEAFORMA, fond clair). Ils servent au carnet de bord du module (leçon 3.11) et, ensuite, au quotidien.

---

## Gabarit 1 : Préparer un feedback (méthode SBI)

À remplir avant l''entretien, en cinq minutes. Une seule situation par fiche.

| Étape | Ce que j''écris | Contrôle |
|---|---|---|
| Situation (quand, où) | | Datée ? Précise ? |
| Comportement observé (ce que la personne a fait ou dit) | | Un fait, pas une interprétation ni un trait de caractère ? |
| Impact (sur le client, l''équipe, l''entreprise, moi) | | Concret ? Vérifiable ? |
| Attente (ce que je demande, pour quand), feedback correctif | | Réalisable ? Datée ? |
| Ce qu''il faut refaire, feedback positif | | Précis ? |
| Question finale | « Comment tu vois ça ? » | |
| Canal | En privé (correctif) / en public (positif, si la personne l''accepte) | |
| Délai depuis les faits | | Moins de 48 h ? |
| Point de suivi | Date : | |

Pour un sujet relationnel (méthode DESC), ajouter : ce que cela me fait, en « je » : ____________________ ; ce que je demande : ____________________ ; ce que cela permettra : ____________________.

---

## Gabarit 2 : Trame d''entretien individuel de suivi (30 min)

Entretien avec : ____________________ Date : ________ Précédent entretien : ________

Préparation (10 min avant) :

| Élément | Notes |
|---|---|
| Engagements pris la dernière fois (les siens, les miens) | |
| Objectifs individuels et indicateurs, où en est-on | |
| Un retour positif à faire (obligatoire) | |
| Un retour correctif éventuel (préparé avec le gabarit 1) | |
| Questions que je veux poser | |

Conduite :

| Temps | Durée | Contenu | Notes prises pendant |
|---|---|---|---|
| 1. Ouvrir | 2 min | Objet, durée, puis « Comment ça se passe pour toi en ce moment ? » | |
| 2. Les faits | 10 min | Objectifs, engagements, indicateurs ; retours positifs et correctifs | |
| 3. Ressenti et besoins | 8 min | « Qu''est-ce qui te pèse ? Qu''est-ce qui te plaît ? De quoi as-tu besoin ? » | |
| 4. Engagements | 7 min | Deux ou trois, précis, datés ; les siens, les miens | |
| 5. Conclure | 3 min | Résumé à voix haute, date du prochain point, « Quelque chose dont on n''a pas parlé ? » | |

Trace (5 lignes, après l''entretien) :

| Date | Points abordés | Engagements de la personne | Mes engagements | Prochain point |
|---|---|---|---|---|
| | | | | |

Rappel : pas d''information de santé ni de vie privée au-delà du strictement utile. Ces notes sont des données personnelles : le salarié peut en demander communication (RGPD). Écrivez-les en conséquence, factuelles et sans jugement.

---

## Gabarit 3 : Trame d''entretien de recadrage

À utiliser quand un comportement doit cesser. Préparer par écrit, conduire en privé, tracer.

| Étape | Contenu préparé |
|---|---|
| Les faits, datés | |
| La règle non respectée et pourquoi elle existe | |
| Écoute : « Qu''est-ce qui explique ça ? » (noter la réponse) | |
| L''attente, non négociable, et le délai | |
| La conséquence si cela continue (information, pas menace) | |
| Point de contrôle rapproché : date | |
| Trace écrite : date, faits, attente, délai ; transmise à la hiérarchie si nécessaire | |

Rappel : le recadrage relève du manager ; la sanction relève de l''employeur et de sa procédure (module 1).

---

## Gabarit 4 : Ordre du jour type et relevé de décisions

Réunion : ____________________ Date et heure : ________ Durée : ________ Lieu : ________
Participants : ____________________ Animateur : ________ Rapporteur : ________

Objectif de la réunion (une phrase, informer / décider / résoudre) : ____________________

| N° | Point (formulé comme un résultat attendu) | Type | Qui présente | Durée |
|---|---|---|---|---|
| 1 | Suivi des décisions de la dernière réunion | Informer | Animateur | 5 min |
| 2 | | Décider | | |
| 3 | | Résoudre | | |
| 4 | | Informer | | |
| 5 | Décisions prises, qui fait quoi, pour quand ; date de la prochaine réunion | | Animateur | 5 min |

Relevé de décisions (diffusé dans la journée) :

| Décision ou action | Responsable | Échéance | Suivi (fait / en cours / non fait) |
|---|---|---|---|
| | | | |
| | | | |
| | | | |

Sujets parqués pour une prochaine fois : ____________________

---

## Gabarit 5 : Préparer une alerte ou une demande à sa hiérarchie (une page)

| Rubrique | Contenu |
|---|---|
| Le fait ou le besoin, chiffré | |
| L''impact si rien ne change (délais, coûts, risque, personnes) | |
| Option 1 (recommandée) : ce qu''elle coûte, ce qu''elle évite | |
| Option 2 : ce qu''elle coûte, ce qu''elle évite | |
| Ce que je demande à ma hiérarchie de décider, et pour quand | |
| Confirmation écrite après l''échange (« comme convenu ») : date | |

---

## Rappels d''usage

- Un feedback se donne dans les 48 heures ; un entretien de suivi se planifie pour le trimestre ; une réunion sans objet s''annule.
- Toute trace reste factuelle et professionnelle : la personne, la hiérarchie ou un juge peuvent un jour la lire.
- Les gabarits sont des supports, pas des scripts : l''écoute (leçon 3.2) passe avant la trame.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Cinq gabarits à recopier ou à imprimer (PDF à générer, mise en page IDEAFORMA, fond clair). Ils servent au carnet de bord du module (leçon 3.11) et, ensuite, au quotidien.

---

## Gabarit 1 : Préparer un feedback (méthode SBI)

À remplir avant l''entretien, en cinq minutes. Une seule situation par fiche.

| Étape | Ce que j''écris | Contrôle |
|---|---|---|
| Situation (quand, où) | | Datée ? Précise ? |
| Comportement observé (ce que la personne a fait ou dit) | | Un fait, pas une interprétation ni un trait de caractère ? |
| Impact (sur le client, l''équipe, l''entreprise, moi) | | Concret ? Vérifiable ? |
| Attente (ce que je demande, pour quand), feedback correctif | | Réalisable ? Datée ? |
| Ce qu''il faut refaire, feedback positif | | Précis ? |
| Question finale | « Comment tu vois ça ? » | |
| Canal | En privé (correctif) / en public (positif, si la personne l''accepte) | |
| Délai depuis les faits | | Moins de 48 h ? |
| Point de suivi | Date : | |

Pour un sujet relationnel (méthode DESC), ajouter : ce que cela me fait, en « je » : ____________________ ; ce que je demande : ____________________ ; ce que cela permettra : ____________________.

---

## Gabarit 2 : Trame d''entretien individuel de suivi (30 min)

Entretien avec : ____________________ Date : ________ Précédent entretien : ________

Préparation (10 min avant) :

| Élément | Notes |
|---|---|
| Engagements pris la dernière fois (les siens, les miens) | |
| Objectifs individuels et indicateurs, où en est-on | |
| Un retour positif à faire (obligatoire) | |
| Un retour correctif éventuel (préparé avec le gabarit 1) | |
| Questions que je veux poser | |

Conduite :

| Temps | Durée | Contenu | Notes prises pendant |
|---|---|---|---|
| 1. Ouvrir | 2 min | Objet, durée, puis « Comment ça se passe pour toi en ce moment ? » | |
| 2. Les faits | 10 min | Objectifs, engagements, indicateurs ; retours positifs et correctifs | |
| 3. Ressenti et besoins | 8 min | « Qu''est-ce qui te pèse ? Qu''est-ce qui te plaît ? De quoi as-tu besoin ? » | |
| 4. Engagements | 7 min | Deux ou trois, précis, datés ; les siens, les miens | |
| 5. Conclure | 3 min | Résumé à voix haute, date du prochain point, « Quelque chose dont on n''a pas parlé ? » | |

Trace (5 lignes, après l''entretien) :

| Date | Points abordés | Engagements de la personne | Mes engagements | Prochain point |
|---|---|---|---|---|
| | | | | |

Rappel : pas d''information de santé ni de vie privée au-delà du strictement utile. Ces notes sont des données personnelles : le salarié peut en demander communication (RGPD). Écrivez-les en conséquence, factuelles et sans jugement.

---

## Gabarit 3 : Trame d''entretien de recadrage

À utiliser quand un comportement doit cesser. Préparer par écrit, conduire en privé, tracer.

| Étape | Contenu préparé |
|---|---|
| Les faits, datés | |
| La règle non respectée et pourquoi elle existe | |
| Écoute : « Qu''est-ce qui explique ça ? » (noter la réponse) | |
| L''attente, non négociable, et le délai | |
| La conséquence si cela continue (information, pas menace) | |
| Point de contrôle rapproché : date | |
| Trace écrite : date, faits, attente, délai ; transmise à la hiérarchie si nécessaire | |

Rappel : le recadrage relève du manager ; la sanction relève de l''employeur et de sa procédure (module 1).

---

## Gabarit 4 : Ordre du jour type et relevé de décisions

Réunion : ____________________ Date et heure : ________ Durée : ________ Lieu : ________
Participants : ____________________ Animateur : ________ Rapporteur : ________

Objectif de la réunion (une phrase, informer / décider / résoudre) : ____________________

| N° | Point (formulé comme un résultat attendu) | Type | Qui présente | Durée |
|---|---|---|---|---|
| 1 | Suivi des décisions de la dernière réunion | Informer | Animateur | 5 min |
| 2 | | Décider | | |
| 3 | | Résoudre | | |
| 4 | | Informer | | |
| 5 | Décisions prises, qui fait quoi, pour quand ; date de la prochaine réunion | | Animateur | 5 min |

Relevé de décisions (diffusé dans la journée) :

| Décision ou action | Responsable | Échéance | Suivi (fait / en cours / non fait) |
|---|---|---|---|
| | | | |
| | | | |
| | | | |

Sujets parqués pour une prochaine fois : ____________________

---

## Gabarit 5 : Préparer une alerte ou une demande à sa hiérarchie (une page)

| Rubrique | Contenu |
|---|---|
| Le fait ou le besoin, chiffré | |
| L''impact si rien ne change (délais, coûts, risque, personnes) | |
| Option 1 (recommandée) : ce qu''elle coûte, ce qu''elle évite | |
| Option 2 : ce qu''elle coûte, ce qu''elle évite | |
| Ce que je demande à ma hiérarchie de décider, et pour quand | |
| Confirmation écrite après l''échange (« comme convenu ») : date | |

---

## Rappels d''usage

- Un feedback se donne dans les 48 heures ; un entretien de suivi se planifie pour le trimestre ; une réunion sans objet s''annule.
- Toute trace reste factuelle et professionnelle : la personne, la hiérarchie ou un juge peuvent un jour la lire.
- Les gabarits sont des supports, pas des scripts : l''écoute (leçon 3.2) passe avant la trame.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 9;
  n := n + 1;

  -- 4.1-video-motivation.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Module 4 — Motiver, engager, faire progresser

Bienvenue dans le module 4. Vous savez maintenant organiser le travail et communiquer avec votre équipe. Reste une question que tous les managers se posent, souvent à voix basse : comment faire pour que les gens aient envie ?

Commençons par démonter une idée reçue. La plupart des managers pensent que la motivation, c''est une affaire de prime, de salaire, de « carotte ». Ce n''est pas faux, mais c''est très incomplet. Et si vous ne comptez que là-dessus, vous serez vite à court de moyens, parce qu''un manager de proximité ne décide ni des salaires ni des primes.

Trois travaux de recherche, à trois époques, ont éclairé ce qui motive au travail. Leurs conclusions se complètent, et elles donnent au manager des leviers qu''il peut actionner sans budget.

## Herzberg : deux familles de facteurs

Le premier est Frederick Herzberg, psychologue américain. À la fin des années 1950, il a interrogé environ deux cents ingénieurs et comptables en leur demandant de raconter un moment où ils s''étaient sentis exceptionnellement bien au travail, et un moment où ils s''étaient sentis exceptionnellement mal.

Il s''attendait à trouver les mêmes causes, dans un sens et dans l''autre. Ce n''est pas ce qu''il a trouvé.

Les mauvais moments étaient liés à ce qu''il a appelé les facteurs d''hygiène : le salaire, les conditions de travail, la relation avec le supérieur, les règles de l''entreprise. Quand ces facteurs sont mauvais, les gens sont insatisfaits. Mais quand ils sont bons, les gens ne sont pas motivés pour autant : ils ne sont simplement plus insatisfaits.

Les bons moments, eux, étaient liés à une autre famille : l''accomplissement, la reconnaissance, l''intérêt du travail lui-même, la responsabilité, le fait de progresser. Ce sont les facteurs de motivation.

Ce que cela signifie pour vous : le salaire et les conditions de travail sont indispensables, mais ils ne créent pas l''engagement. Ils évitent le désengagement. Une augmentation fait plaisir un temps. Un travail intéressant, une responsabilité confiée, une progression visible font effet pendant des années. Et ces leviers-là, c''est vous qui les tenez.

## Deci et Ryan : trois besoins

Le deuxième éclairage vient d''Edward Deci et Richard Ryan, psychologues américains, avec la théorie de l''autodétermination, développée à partir des années 1980. Ils ont montré, expériences à l''appui, que la motivation la plus solide, celle qui dure et qui produit de la qualité, vient de l''intérieur de la personne, et qu''elle se nourrit de trois besoins.

L''autonomie : avoir une marge de décision sur la façon de faire son travail. Pas l''absence de cadre, mais un espace à l''intérieur du cadre.

La compétence : sentir qu''on maîtrise ce qu''on fait et qu''on progresse. Être mis en situation de réussir, avec des défis à sa mesure.

Le lien : se sentir relié aux autres, appartenir à une équipe, compter pour quelqu''un.

Quand ces trois besoins sont nourris, les gens s''engagent d''eux-mêmes. Quand ils sont frustrés, aucune prime ne compense. Deci a même montré quelque chose de contre-intuitif : dans certaines conditions, récompenser financièrement une activité que les gens aimaient faire diminuait leur intérêt pour cette activité. La récompense externe avait remplacé le plaisir interne.

Pour le manager, la traduction est simple : à chaque décision, demandez-vous si elle augmente ou diminue l''autonomie, la compétence et le lien de la personne concernée.

## Amabile et Kramer : le principe du progrès

Le troisième éclairage est le plus récent. Teresa Amabile, professeure à Harvard, et le psychologue Steven Kramer ont demandé à plus de deux cents personnes, dans sept entreprises, de tenir un journal quotidien de leur journée de travail pendant plusieurs mois. Près de douze mille journées analysées.

Leur question : qu''est-ce qui distingue une bonne journée d''une mauvaise, du point de vue de la motivation ?

La réponse, publiée en 2011, tient en une phrase : ce qui compte le plus, c''est le sentiment d''avancer dans un travail qui a du sens. Pas les grandes victoires. Les petits progrès. Une pièce terminée, un problème résolu, un client satisfait. Et à l''inverse, ce qui plombe le plus une journée, c''est le sentiment de reculer : un travail refait, une décision annulée, un obstacle qui bloque.

**Le principe du progrès : les petites victoires quotidiennes nourrissent la motivation plus que les grandes récompenses.**

Ce que cela signifie pour vous : votre rôle est de rendre le progrès possible et visible. Enlever les obstacles, donner les moyens, fixer des objectifs qui permettent de constater qu''on avance, et dire quand ça avance. Un manager qui ne relève que ce qui ne va pas fabrique des journées de recul.

## Ce que le manager peut faire, sans budget

Rassemblons. Trois modèles, un même message : la motivation ne s''achète pas, elle se construit dans le travail lui-même. Et voici ce que vous pouvez faire dès demain.

Donner de l''autonomie : déléguer, comme au module 2, avec un vrai espace de décision. Laisser choisir la méthode quand le résultat est clair.

Faire progresser : confier des tâches un peu au-dessus du niveau actuel, former, mettre en binôme. La leçon 4.4 y est consacrée.

Reconnaître : dire ce qui est bien, précisément, à temps. La leçon 4.3.

Rendre le progrès visible : un tableau de bord partagé, un point quotidien où l''on dit ce qui a avancé, une réunion qui commence par les réussites.

Enlever les obstacles : c''est peut-être le plus important et le moins vu. Chaque fois que vous réglez un problème d''outil, de pièce manquante, d''information qui n''arrive pas, vous fabriquez une bonne journée.

Et protéger le lien : une équipe où l''on peut parler, où l''on n''est pas humilié, où l''on compte. C''est la sécurité psychologique, la leçon suivante.

## À l''atelier Garnier

À l''atelier Garnier, deux histoires illustrent tout cela. Marc, le mécanicien, était démotivé. Pas à cause de son salaire : à cause du sentiment de reculer chaque jour, en découvrant les interventions au dernier moment, et de ne compter pour personne. Le jour où Karim l''a consulté chaque soir pour le planning du lendemain, Marc a retrouvé de l''autonomie, du lien, et des journées qui avancent.

Julien, lui, s''était éteint après avoir été humilié devant tout le monde pour une coulure. Le binôme peinture avec Nadia lui a rendu la compétence ; le retour positif trois semaines plus tard lui a rendu la reconnaissance. Aucun des deux n''a eu un euro de plus.

La motivation n''est pas un mystère. C''est le résultat de conditions que vous pouvez créer.

À tout de suite pour la sécurité psychologique.

## Sources
Frederick Herzberg, Bernard Mausner, Barbara Snyderman, *The Motivation to Work*, Wiley, 1959 ; Frederick Herzberg, « One More Time: How Do You Motivate Employees? », *Harvard Business Review*, 1968 ; Edward L. Deci, « Effects of Externally Mediated Rewards on Intrinsic Motivation », *Journal of Personality and Social Psychology*, vol. 18, n° 1, 1971 ; Edward L. Deci, Richard M. Ryan, *Intrinsic Motivation and Self-Determination in Human Behavior*, Plenum, 1985 ; Richard M. Ryan, Edward L. Deci, « Self-Determination Theory and the Facilitation of Intrinsic Motivation, Social Development, and Well-Being », *American Psychologist*, vol. 55, n° 1, 2000 ; Teresa Amabile, Steven Kramer, *The Progress Principle*, Harvard Business Review Press, 2011.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Module 4 — Motiver, engager, faire progresser

Bienvenue dans le module 4. Vous savez maintenant organiser le travail et communiquer avec votre équipe. Reste une question que tous les managers se posent, souvent à voix basse : comment faire pour que les gens aient envie ?

Commençons par démonter une idée reçue. La plupart des managers pensent que la motivation, c''est une affaire de prime, de salaire, de « carotte ». Ce n''est pas faux, mais c''est très incomplet. Et si vous ne comptez que là-dessus, vous serez vite à court de moyens, parce qu''un manager de proximité ne décide ni des salaires ni des primes.

Trois travaux de recherche, à trois époques, ont éclairé ce qui motive au travail. Leurs conclusions se complètent, et elles donnent au manager des leviers qu''il peut actionner sans budget.

## Herzberg : deux familles de facteurs

Le premier est Frederick Herzberg, psychologue américain. À la fin des années 1950, il a interrogé environ deux cents ingénieurs et comptables en leur demandant de raconter un moment où ils s''étaient sentis exceptionnellement bien au travail, et un moment où ils s''étaient sentis exceptionnellement mal.

Il s''attendait à trouver les mêmes causes, dans un sens et dans l''autre. Ce n''est pas ce qu''il a trouvé.

Les mauvais moments étaient liés à ce qu''il a appelé les facteurs d''hygiène : le salaire, les conditions de travail, la relation avec le supérieur, les règles de l''entreprise. Quand ces facteurs sont mauvais, les gens sont insatisfaits. Mais quand ils sont bons, les gens ne sont pas motivés pour autant : ils ne sont simplement plus insatisfaits.

Les bons moments, eux, étaient liés à une autre famille : l''accomplissement, la reconnaissance, l''intérêt du travail lui-même, la responsabilité, le fait de progresser. Ce sont les facteurs de motivation.

Ce que cela signifie pour vous : le salaire et les conditions de travail sont indispensables, mais ils ne créent pas l''engagement. Ils évitent le désengagement. Une augmentation fait plaisir un temps. Un travail intéressant, une responsabilité confiée, une progression visible font effet pendant des années. Et ces leviers-là, c''est vous qui les tenez.

## Deci et Ryan : trois besoins

Le deuxième éclairage vient d''Edward Deci et Richard Ryan, psychologues américains, avec la théorie de l''autodétermination, développée à partir des années 1980. Ils ont montré, expériences à l''appui, que la motivation la plus solide, celle qui dure et qui produit de la qualité, vient de l''intérieur de la personne, et qu''elle se nourrit de trois besoins.

L''autonomie : avoir une marge de décision sur la façon de faire son travail. Pas l''absence de cadre, mais un espace à l''intérieur du cadre.

La compétence : sentir qu''on maîtrise ce qu''on fait et qu''on progresse. Être mis en situation de réussir, avec des défis à sa mesure.

Le lien : se sentir relié aux autres, appartenir à une équipe, compter pour quelqu''un.

Quand ces trois besoins sont nourris, les gens s''engagent d''eux-mêmes. Quand ils sont frustrés, aucune prime ne compense. Deci a même montré quelque chose de contre-intuitif : dans certaines conditions, récompenser financièrement une activité que les gens aimaient faire diminuait leur intérêt pour cette activité. La récompense externe avait remplacé le plaisir interne.

Pour le manager, la traduction est simple : à chaque décision, demandez-vous si elle augmente ou diminue l''autonomie, la compétence et le lien de la personne concernée.

## Amabile et Kramer : le principe du progrès

Le troisième éclairage est le plus récent. Teresa Amabile, professeure à Harvard, et le psychologue Steven Kramer ont demandé à plus de deux cents personnes, dans sept entreprises, de tenir un journal quotidien de leur journée de travail pendant plusieurs mois. Près de douze mille journées analysées.

Leur question : qu''est-ce qui distingue une bonne journée d''une mauvaise, du point de vue de la motivation ?

La réponse, publiée en 2011, tient en une phrase : ce qui compte le plus, c''est le sentiment d''avancer dans un travail qui a du sens. Pas les grandes victoires. Les petits progrès. Une pièce terminée, un problème résolu, un client satisfait. Et à l''inverse, ce qui plombe le plus une journée, c''est le sentiment de reculer : un travail refait, une décision annulée, un obstacle qui bloque.

**Le principe du progrès : les petites victoires quotidiennes nourrissent la motivation plus que les grandes récompenses.**

Ce que cela signifie pour vous : votre rôle est de rendre le progrès possible et visible. Enlever les obstacles, donner les moyens, fixer des objectifs qui permettent de constater qu''on avance, et dire quand ça avance. Un manager qui ne relève que ce qui ne va pas fabrique des journées de recul.

## Ce que le manager peut faire, sans budget

Rassemblons. Trois modèles, un même message : la motivation ne s''achète pas, elle se construit dans le travail lui-même. Et voici ce que vous pouvez faire dès demain.

Donner de l''autonomie : déléguer, comme au module 2, avec un vrai espace de décision. Laisser choisir la méthode quand le résultat est clair.

Faire progresser : confier des tâches un peu au-dessus du niveau actuel, former, mettre en binôme. La leçon 4.4 y est consacrée.

Reconnaître : dire ce qui est bien, précisément, à temps. La leçon 4.3.

Rendre le progrès visible : un tableau de bord partagé, un point quotidien où l''on dit ce qui a avancé, une réunion qui commence par les réussites.

Enlever les obstacles : c''est peut-être le plus important et le moins vu. Chaque fois que vous réglez un problème d''outil, de pièce manquante, d''information qui n''arrive pas, vous fabriquez une bonne journée.

Et protéger le lien : une équipe où l''on peut parler, où l''on n''est pas humilié, où l''on compte. C''est la sécurité psychologique, la leçon suivante.

## À l''atelier Garnier

À l''atelier Garnier, deux histoires illustrent tout cela. Marc, le mécanicien, était démotivé. Pas à cause de son salaire : à cause du sentiment de reculer chaque jour, en découvrant les interventions au dernier moment, et de ne compter pour personne. Le jour où Karim l''a consulté chaque soir pour le planning du lendemain, Marc a retrouvé de l''autonomie, du lien, et des journées qui avancent.

Julien, lui, s''était éteint après avoir été humilié devant tout le monde pour une coulure. Le binôme peinture avec Nadia lui a rendu la compétence ; le retour positif trois semaines plus tard lui a rendu la reconnaissance. Aucun des deux n''a eu un euro de plus.

La motivation n''est pas un mystère. C''est le résultat de conditions que vous pouvez créer.

À tout de suite pour la sécurité psychologique.

## Sources
Frederick Herzberg, Bernard Mausner, Barbara Snyderman, *The Motivation to Work*, Wiley, 1959 ; Frederick Herzberg, « One More Time: How Do You Motivate Employees? », *Harvard Business Review*, 1968 ; Edward L. Deci, « Effects of Externally Mediated Rewards on Intrinsic Motivation », *Journal of Personality and Social Psychology*, vol. 18, n° 1, 1971 ; Edward L. Deci, Richard M. Ryan, *Intrinsic Motivation and Self-Determination in Human Behavior*, Plenum, 1985 ; Richard M. Ryan, Edward L. Deci, « Self-Determination Theory and the Facilitation of Intrinsic Motivation, Social Development, and Well-Being », *American Psychologist*, vol. 55, n° 1, 2000 ; Teresa Amabile, Steven Kramer, *The Progress Principle*, Harvard Business Review Press, 2011.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 5 and l.ordre = 1;
  n := n + 1;

  -- 4.10-carnet-application.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Vous avez vu ce qui motive au travail, la sécurité psychologique, la reconnaissance, le développement des compétences, l''intégration, le cadre de travail soutenable et la prévention des risques psychosociaux. À vous de l''appliquer à votre équipe. Comptez un peu moins de deux heures. Utilisez les gabarits de la fiche outil (leçon 4.9).

Si vous n''encadrez pas d''équipe, travaillez sur une équipe que vous connaissez, ou sur l''atelier Garnier en imaginant les situations de votre secteur.

## Étape 1 — Diagnostic motivation (15 min)

- Pour chaque membre de l''équipe, notez en une ligne ce qui, selon vous, le motive et ce qui le freine, en vous appuyant sur les trois besoins de Deci et Ryan (autonomie, compétence, lien) et sur le principe du progrès. Soyez concret : « découvre les interventions au dernier moment », pas « manque de reconnaissance ».
- Pour deux personnes, identifiez une décision qui dépend de vous et qui augmenterait leur autonomie, leur compétence ou leur lien. Datez-la.
- Quels obstacles au progrès quotidien (outil, information, pièce, validation) pourriez-vous lever cette semaine ? Choisissez-en un.

## Étape 2 — Diagnostic sécurité psychologique (20 min)

- Remplissez le gabarit 3 pour vous-même. Si vous le pouvez, proposez-le à l''équipe de façon anonyme (une boîte, un formulaire) et comparez.
- Repensez à la dernière fois où quelqu''un vous a signalé une erreur, contesté une décision ou posé une question « bête ». Qu''avez-vous fait dans les dix secondes qui ont suivi ? Que retient l''équipe de ce moment ?
- Notez vos cinq comportements de 1 à 5. Choisissez celui que vous allez travailler en premier et la situation précise où vous l''appliquerez cette semaine.
- Y a-t-il dans l''équipe une habitude (moquerie, coupure de parole, mépris) que vous laissez passer ? Écrivez la phrase que vous direz la prochaine fois.

## Étape 3 — Reconnaissance (15 min)

- Pour chaque membre de l''équipe, notez la date du dernier retour positif précis que vous lui avez fait. Qui est à plus de quinze jours ?
- Pour ces personnes, trouvez une reconnaissance sincère et précise, en variant les formes (personne, manière de faire, effort, résultat). Écrivez la phrase, et le moment où vous la direz.
- Quelle reconnaissance existentielle manque dans votre équipe (informer avant, consulter, saluer chacun) ? Que changez-vous ?

## Étape 4 — Plan de développement d''un collaborateur (20 min)

- Choisissez une personne : soit une compétence critique qu''elle est seule à détenir (à transmettre), soit un souhait d''évolution qu''elle a exprimé, soit un plafonnement.
- Préparez l''entretien GROW : vos questions pour chaque temps (objectif, réalité, options, engagement).
- Remplissez le gabarit 1 (PDI) tel que vous l''imaginez ; vous le corrigerez avec la personne en entretien. Un seul objectif.
- Quel dispositif mobiliser (plan de développement des compétences, OPCO, formation interne ; ou, si la personne le souhaite, son CPF ou une VAE, qui restent à son initiative) ? Auprès de qui vous renseignez-vous ?

## Étape 5 — Charge de travail et cadre (15 min)

- Qui, dans l''équipe, absorbe les imprévus et les heures supplémentaires ? Qui n''en fait jamais, et pourquoi ? Est-ce équitable ? Est-ce connu et expliqué ?
- Passez en revue les attributions de l''année (missions intéressantes, formations, horaires, primes si vous en décidez) : reposent-elles toutes sur un critère objectif ? Y a-t-il une personne systématiquement écartée sans raison dite ?
- Vérifiez les limites légales de durée du travail et de repos dans votre équipe : y a-t-il un dépassement toléré ? Que faites-vous ?
- Vos propres messages : à quelle heure envoyez-vous le dernier ? Que changez-vous ?
- Si votre équipe compte des télétravailleurs : l''entretien annuel sur les conditions d''activité et la charge (L1222-10) est-il fait ? Les plages de joignabilité sont-elles fixées ? Les personnes à distance ont-elles le même accès à l''information et aux missions ?

## Étape 6 — Signaux d''alerte (15 min)

- Pour chaque membre de l''équipe, y a-t-il un changement de comportement récent (irritabilité, repli, présence excessive, erreurs inhabituelles, absences courtes) ? Notez les faits, pas une interprétation.
- Pour l''une de ces personnes, si vous en avez repéré une, préparez l''entretien : la phrase d''ouverture factuelle, ce que vous écoutez, ce sur quoi vous pouvez agir dans le travail, les relais que vous rappellerez (médecin du travail, visite à la demande, autres).
- Connaissez-vous le nom et les coordonnées du médecin du travail de votre entreprise, du référent harcèlement s''il existe, des représentants du personnel ? Sinon, trouvez-les cette semaine.
- Et vous-même : lequel de ces signaux vous concerne ? À qui pouvez-vous en parler ?

## Étape 7 — Bilan (10 min)

- Parmi les sept thèmes du module (motivation, sécurité psychologique, reconnaissance, développement des compétences, intégration, cadre de travail, prévention des RPS), lequel est votre point fort ? Lequel est votre point faible ?
- Quelle est la première chose que vous faites dès demain ? Écrivez-la avec une date.
- Que retirez-vous du diagnostic de sécurité psychologique qui vous a surpris ?

Conservez ce carnet : le module 5 (tensions et conflits) reprend la sécurité psychologique comme base de la prévention des conflits.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Vous avez vu ce qui motive au travail, la sécurité psychologique, la reconnaissance, le développement des compétences, l''intégration, le cadre de travail soutenable et la prévention des risques psychosociaux. À vous de l''appliquer à votre équipe. Comptez un peu moins de deux heures. Utilisez les gabarits de la fiche outil (leçon 4.9).

Si vous n''encadrez pas d''équipe, travaillez sur une équipe que vous connaissez, ou sur l''atelier Garnier en imaginant les situations de votre secteur.

## Étape 1 — Diagnostic motivation (15 min)

- Pour chaque membre de l''équipe, notez en une ligne ce qui, selon vous, le motive et ce qui le freine, en vous appuyant sur les trois besoins de Deci et Ryan (autonomie, compétence, lien) et sur le principe du progrès. Soyez concret : « découvre les interventions au dernier moment », pas « manque de reconnaissance ».
- Pour deux personnes, identifiez une décision qui dépend de vous et qui augmenterait leur autonomie, leur compétence ou leur lien. Datez-la.
- Quels obstacles au progrès quotidien (outil, information, pièce, validation) pourriez-vous lever cette semaine ? Choisissez-en un.

## Étape 2 — Diagnostic sécurité psychologique (20 min)

- Remplissez le gabarit 3 pour vous-même. Si vous le pouvez, proposez-le à l''équipe de façon anonyme (une boîte, un formulaire) et comparez.
- Repensez à la dernière fois où quelqu''un vous a signalé une erreur, contesté une décision ou posé une question « bête ». Qu''avez-vous fait dans les dix secondes qui ont suivi ? Que retient l''équipe de ce moment ?
- Notez vos cinq comportements de 1 à 5. Choisissez celui que vous allez travailler en premier et la situation précise où vous l''appliquerez cette semaine.
- Y a-t-il dans l''équipe une habitude (moquerie, coupure de parole, mépris) que vous laissez passer ? Écrivez la phrase que vous direz la prochaine fois.

## Étape 3 — Reconnaissance (15 min)

- Pour chaque membre de l''équipe, notez la date du dernier retour positif précis que vous lui avez fait. Qui est à plus de quinze jours ?
- Pour ces personnes, trouvez une reconnaissance sincère et précise, en variant les formes (personne, manière de faire, effort, résultat). Écrivez la phrase, et le moment où vous la direz.
- Quelle reconnaissance existentielle manque dans votre équipe (informer avant, consulter, saluer chacun) ? Que changez-vous ?

## Étape 4 — Plan de développement d''un collaborateur (20 min)

- Choisissez une personne : soit une compétence critique qu''elle est seule à détenir (à transmettre), soit un souhait d''évolution qu''elle a exprimé, soit un plafonnement.
- Préparez l''entretien GROW : vos questions pour chaque temps (objectif, réalité, options, engagement).
- Remplissez le gabarit 1 (PDI) tel que vous l''imaginez ; vous le corrigerez avec la personne en entretien. Un seul objectif.
- Quel dispositif mobiliser (plan de développement des compétences, OPCO, formation interne ; ou, si la personne le souhaite, son CPF ou une VAE, qui restent à son initiative) ? Auprès de qui vous renseignez-vous ?

## Étape 5 — Charge de travail et cadre (15 min)

- Qui, dans l''équipe, absorbe les imprévus et les heures supplémentaires ? Qui n''en fait jamais, et pourquoi ? Est-ce équitable ? Est-ce connu et expliqué ?
- Passez en revue les attributions de l''année (missions intéressantes, formations, horaires, primes si vous en décidez) : reposent-elles toutes sur un critère objectif ? Y a-t-il une personne systématiquement écartée sans raison dite ?
- Vérifiez les limites légales de durée du travail et de repos dans votre équipe : y a-t-il un dépassement toléré ? Que faites-vous ?
- Vos propres messages : à quelle heure envoyez-vous le dernier ? Que changez-vous ?
- Si votre équipe compte des télétravailleurs : l''entretien annuel sur les conditions d''activité et la charge (L1222-10) est-il fait ? Les plages de joignabilité sont-elles fixées ? Les personnes à distance ont-elles le même accès à l''information et aux missions ?

## Étape 6 — Signaux d''alerte (15 min)

- Pour chaque membre de l''équipe, y a-t-il un changement de comportement récent (irritabilité, repli, présence excessive, erreurs inhabituelles, absences courtes) ? Notez les faits, pas une interprétation.
- Pour l''une de ces personnes, si vous en avez repéré une, préparez l''entretien : la phrase d''ouverture factuelle, ce que vous écoutez, ce sur quoi vous pouvez agir dans le travail, les relais que vous rappellerez (médecin du travail, visite à la demande, autres).
- Connaissez-vous le nom et les coordonnées du médecin du travail de votre entreprise, du référent harcèlement s''il existe, des représentants du personnel ? Sinon, trouvez-les cette semaine.
- Et vous-même : lequel de ces signaux vous concerne ? À qui pouvez-vous en parler ?

## Étape 7 — Bilan (10 min)

- Parmi les sept thèmes du module (motivation, sécurité psychologique, reconnaissance, développement des compétences, intégration, cadre de travail, prévention des RPS), lequel est votre point fort ? Lequel est votre point faible ?
- Quelle est la première chose que vous faites dès demain ? Écrivez-la avec une date.
- Que retirez-vous du diagnostic de sécurité psychologique qui vous a surpris ?

Conservez ce carnet : le module 5 (tensions et conflits) reprend la sécurité psychologique comme base de la prévention des conflits.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 5 and l.ordre = 10;
  n := n + 1;

  raise notice 'Contenus importés : % leçons', n;
end $$;
