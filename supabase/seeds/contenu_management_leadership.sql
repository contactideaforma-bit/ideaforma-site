-- ============================================================
-- IDEAFORMA — import du contenu des leçons : management-leadership
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
      then jsonb_build_object('texte', 'Type : vidéo avatar · Ton : chaleureux, direct, vouvoiement · Débit : 140 mots/min
Indications visuelles entre crochets. Sous-titres à générer depuis ce texte.

---

[Plan : avatar en pied, fond clair, logo IDEAFORMA discret]

Bonjour, et bienvenue.

Vous venez d''ouvrir la formation « Management & Leadership » d''IDEAFORMA. Que vous soyez déjà responsable d''une équipe, sur le point de le devenir, ou que vous prépariez un poste avec des responsabilités d''encadrement, vous êtes au bon endroit.

Je vais prendre quelques minutes pour vous expliquer ce que vous allez apprendre, comment la formation est organisée, et comment en tirer le meilleur.

[Titre à l''écran : « Pourquoi cette formation ? »]

Commençons par une idée simple. On ne naît pas manager. On le devient, et on l''apprend. La plupart des personnes qui encadrent une équipe pour la première fois ont été nommées parce qu''elles étaient bonnes dans leur métier : bon technicien, bonne vendeuse, bon comptable. Et du jour au lendemain, on leur demande autre chose : organiser le travail des autres, fixer des objectifs, faire des retours, gérer des tensions, rendre des comptes à la direction.

Ce sont des compétences. Elles s''apprennent, elles se travaillent, et c''est exactement ce que nous allons faire ensemble.

[Titre à l''écran : « Ce que vous saurez faire à la fin »]

À la fin de ce parcours, vous serez capable de huit choses.

Un : situer votre rôle de manager, vos responsabilités, y compris légales, et adopter la bonne posture selon la situation et les personnes.

Deux : identifier les compétences dont votre activité a besoin, structurer le travail et répartir les rôles.

Trois : fixer des objectifs et construire un tableau de bord simple pour piloter l''activité.

Quatre : conduire les entretiens et les réunions clés, et bien communiquer avec votre hiérarchie.

Cinq : mettre en place un cadre de travail respectueux, soutenable et équitable, y compris pour les personnes en situation de handicap.

Six : soutenir la motivation et la progression de chacun.

Sept : prévenir et résoudre les tensions et les conflits.

Huit : évaluer les résultats, améliorer en continu et accompagner le changement.

[Schéma : 8 modules alignés, du module 0 au module 7]

Ces huit capacités correspondent aux compétences attendues d''un manager de proximité en France aujourd''hui. Nous nous sommes appuyés sur le référentiel officiel « Animer une équipe de travail », enregistré par France Compétences, pour construire ce programme. Autrement dit : ce que vous allez apprendre ici, c''est ce que le marché du travail attend réellement d''un responsable d''équipe.

[Titre à l''écran : « Comment c''est organisé »]

La formation compte huit modules, pour environ trente-cinq heures de travail.

Le module zéro, celui que vous commencez maintenant, vous met en selle : la méthode, un questionnaire de départ, et la présentation du cas que nous suivrons tout au long du parcours.

Le module un vous fait entrer dans le rôle du manager : ce qu''il fait vraiment, les styles de leadership, la légitimité, et vos responsabilités légales.

Le module deux porte sur l''organisation du travail : objectifs, compétences, répartition des rôles, délégation, tableau de bord.

Le module trois traite de la communication : écoute, feedback, entretiens, réunions, relation avec la hiérarchie.

Le module quatre parle de motivation, d''engagement et de progression : ce qui motive vraiment, la sécurité psychologique, la reconnaissance, le développement des compétences, la prévention des risques psychosociaux.

Le module cinq est consacré aux tensions et aux conflits.

Le module six, au pilotage de la performance et à la conduite du changement.

Et le module sept termine par une évaluation finale et votre plan d''action personnel.

[Titre à l''écran : « Un cas fil rouge »]

Pour que tout cela reste concret, nous suivrons une seule et même histoire du début à la fin : celle de l''atelier Garnier, une petite entreprise de carrosserie de neuf personnes, où un technicien vient d''être promu chef d''atelier. À chaque module, nous verrons comment il applique les outils, ses réussites et ses erreurs. Puis, à chaque fois, vous transposerez à votre propre situation.

Si vous ne travaillez pas dans l''automobile, aucune inquiétude : les situations sont universelles, et des variantes en commerce, en bureau ou en service sont proposées régulièrement.

[Titre à l''écran : « Les formats »]

Chaque module mélange plusieurs formats. Des vidéos courtes, comme celle-ci, pour poser l''essentiel. Des cours écrits, pour approfondir les concepts et les méthodes, avec leurs sources. Des podcasts, sous forme de conversation, pour entendre des retours d''expérience et des nuances. Des fiches outils, que vous pourrez réutiliser au travail. Des cas pratiques corrigés. Et un quiz à la fin de chaque module, pour vérifier que l''essentiel est acquis.

[Titre à l''écran : « Quelques règles »]

Trois règles simples.

Première règle : allez à votre rythme, mais gardez le rythme. Nous vous conseillons deux séances d''une heure par semaine, pendant douze semaines. Votre accès à la formation a une date de fin, que vous voyez sur votre tableau de bord.

Deuxième règle : les contenus de cette plateforme sont personnels. Ils sont protégés : pas de téléchargement, pas de copie, pas de diffusion. Chaque page porte un filigrane à votre nom. C''est ce qui nous permet de vous proposer des contenus de qualité à un prix accessible.

Troisième règle : vous n''êtes pas seul. Si vous avez une question, une difficulté technique ou un besoin d''aménagement, par exemple en cas de situation de handicap, contactez IDEAFORMA : les coordonnées sont dans la leçon suivante et dans votre espace. Nous répondons sous vingt-quatre heures ouvrées.

[Plan : avatar en plan rapproché]

Une dernière chose avant de commencer. Vous allez apprendre des méthodes, des modèles, des outils. Mais le management, ce n''est pas réciter des modèles. C''est prendre des décisions, avec des personnes réelles, dans des situations qui ne ressemblent jamais tout à fait aux exemples. Les modèles sont là pour vous aider à réfléchir, pas pour réfléchir à votre place.

Alors gardez toujours cette question en tête, à chaque leçon : « Et moi, dans mon équipe, qu''est-ce que je ferais ? »

C''est parti. Rendez-vous dans la leçon suivante pour la méthode de travail.

[Fondu, logo IDEAFORMA]
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Type : vidéo avatar · Ton : chaleureux, direct, vouvoiement · Débit : 140 mots/min
Indications visuelles entre crochets. Sous-titres à générer depuis ce texte.

---

[Plan : avatar en pied, fond clair, logo IDEAFORMA discret]

Bonjour, et bienvenue.

Vous venez d''ouvrir la formation « Management & Leadership » d''IDEAFORMA. Que vous soyez déjà responsable d''une équipe, sur le point de le devenir, ou que vous prépariez un poste avec des responsabilités d''encadrement, vous êtes au bon endroit.

Je vais prendre quelques minutes pour vous expliquer ce que vous allez apprendre, comment la formation est organisée, et comment en tirer le meilleur.

[Titre à l''écran : « Pourquoi cette formation ? »]

Commençons par une idée simple. On ne naît pas manager. On le devient, et on l''apprend. La plupart des personnes qui encadrent une équipe pour la première fois ont été nommées parce qu''elles étaient bonnes dans leur métier : bon technicien, bonne vendeuse, bon comptable. Et du jour au lendemain, on leur demande autre chose : organiser le travail des autres, fixer des objectifs, faire des retours, gérer des tensions, rendre des comptes à la direction.

Ce sont des compétences. Elles s''apprennent, elles se travaillent, et c''est exactement ce que nous allons faire ensemble.

[Titre à l''écran : « Ce que vous saurez faire à la fin »]

À la fin de ce parcours, vous serez capable de huit choses.

Un : situer votre rôle de manager, vos responsabilités, y compris légales, et adopter la bonne posture selon la situation et les personnes.

Deux : identifier les compétences dont votre activité a besoin, structurer le travail et répartir les rôles.

Trois : fixer des objectifs et construire un tableau de bord simple pour piloter l''activité.

Quatre : conduire les entretiens et les réunions clés, et bien communiquer avec votre hiérarchie.

Cinq : mettre en place un cadre de travail respectueux, soutenable et équitable, y compris pour les personnes en situation de handicap.

Six : soutenir la motivation et la progression de chacun.

Sept : prévenir et résoudre les tensions et les conflits.

Huit : évaluer les résultats, améliorer en continu et accompagner le changement.

[Schéma : 8 modules alignés, du module 0 au module 7]

Ces huit capacités correspondent aux compétences attendues d''un manager de proximité en France aujourd''hui. Nous nous sommes appuyés sur le référentiel officiel « Animer une équipe de travail », enregistré par France Compétences, pour construire ce programme. Autrement dit : ce que vous allez apprendre ici, c''est ce que le marché du travail attend réellement d''un responsable d''équipe.

[Titre à l''écran : « Comment c''est organisé »]

La formation compte huit modules, pour environ trente-cinq heures de travail.

Le module zéro, celui que vous commencez maintenant, vous met en selle : la méthode, un questionnaire de départ, et la présentation du cas que nous suivrons tout au long du parcours.

Le module un vous fait entrer dans le rôle du manager : ce qu''il fait vraiment, les styles de leadership, la légitimité, et vos responsabilités légales.

Le module deux porte sur l''organisation du travail : objectifs, compétences, répartition des rôles, délégation, tableau de bord.

Le module trois traite de la communication : écoute, feedback, entretiens, réunions, relation avec la hiérarchie.

Le module quatre parle de motivation, d''engagement et de progression : ce qui motive vraiment, la sécurité psychologique, la reconnaissance, le développement des compétences, la prévention des risques psychosociaux.

Le module cinq est consacré aux tensions et aux conflits.

Le module six, au pilotage de la performance et à la conduite du changement.

Et le module sept termine par une évaluation finale et votre plan d''action personnel.

[Titre à l''écran : « Un cas fil rouge »]

Pour que tout cela reste concret, nous suivrons une seule et même histoire du début à la fin : celle de l''atelier Garnier, une petite entreprise de carrosserie de neuf personnes, où un technicien vient d''être promu chef d''atelier. À chaque module, nous verrons comment il applique les outils, ses réussites et ses erreurs. Puis, à chaque fois, vous transposerez à votre propre situation.

Si vous ne travaillez pas dans l''automobile, aucune inquiétude : les situations sont universelles, et des variantes en commerce, en bureau ou en service sont proposées régulièrement.

[Titre à l''écran : « Les formats »]

Chaque module mélange plusieurs formats. Des vidéos courtes, comme celle-ci, pour poser l''essentiel. Des cours écrits, pour approfondir les concepts et les méthodes, avec leurs sources. Des podcasts, sous forme de conversation, pour entendre des retours d''expérience et des nuances. Des fiches outils, que vous pourrez réutiliser au travail. Des cas pratiques corrigés. Et un quiz à la fin de chaque module, pour vérifier que l''essentiel est acquis.

[Titre à l''écran : « Quelques règles »]

Trois règles simples.

Première règle : allez à votre rythme, mais gardez le rythme. Nous vous conseillons deux séances d''une heure par semaine, pendant douze semaines. Votre accès à la formation a une date de fin, que vous voyez sur votre tableau de bord.

Deuxième règle : les contenus de cette plateforme sont personnels. Ils sont protégés : pas de téléchargement, pas de copie, pas de diffusion. Chaque page porte un filigrane à votre nom. C''est ce qui nous permet de vous proposer des contenus de qualité à un prix accessible.

Troisième règle : vous n''êtes pas seul. Si vous avez une question, une difficulté technique ou un besoin d''aménagement, par exemple en cas de situation de handicap, contactez IDEAFORMA : les coordonnées sont dans la leçon suivante et dans votre espace. Nous répondons sous vingt-quatre heures ouvrées.

[Plan : avatar en plan rapproché]

Une dernière chose avant de commencer. Vous allez apprendre des méthodes, des modèles, des outils. Mais le management, ce n''est pas réciter des modèles. C''est prendre des décisions, avec des personnes réelles, dans des situations qui ne ressemblent jamais tout à fait aux exemples. Les modèles sont là pour vous aider à réfléchir, pas pour réfléchir à votre place.

Alors gardez toujours cette question en tête, à chaque leçon : « Et moi, dans mon équipe, qu''est-ce que je ferais ? »

C''est parti. Rendez-vous dans la leçon suivante pour la méthode de travail.

[Fondu, logo IDEAFORMA]
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 1 and l.ordre = 1;
  n := n + 1;

  -- 0.2-methode.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Cette formation représente environ 35 heures de travail. C''est à la fois beaucoup et peu : beaucoup si vous avancez au hasard, peu si vous suivez une méthode. Cette leçon vous donne la nôtre.

## Le rythme conseillé

Nous vous recommandons deux séances d''une heure par semaine, sur douze semaines. Ce rythme a trois avantages : il tient dans un emploi du temps chargé, il laisse le temps d''appliquer ce que vous apprenez entre deux séances, et il évite l''effet « gavage » où l''on lit tout en trois jours et où l''on ne retient rien.

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

Chaque module se termine par un quiz de douze questions. Le seuil de réussite est de 70 %, avec trois tentatives possibles. Ces quiz ne sont pas là pour vous piéger : ils vérifient que l''essentiel est acquis avant de passer à la suite. Si vous échouez, relisez les leçons concernées avant de retenter.

Le module 7 comporte une évaluation finale sous forme d''étude de cas : vingt-cinq situations concrètes qui couvrent l''ensemble du parcours. Seuil de 70 %, deux tentatives.

Au début et à la fin de la formation, un questionnaire d''autopositionnement de vingt questions vous permet de mesurer votre progression. Il n''est pas noté : répondez sincèrement, c''est le seul moyen qu''il vous serve.

Vos résultats sont conservés. Ils constituent, avec votre temps de connexion et votre progression, les preuves de réalisation de la formation, que nous devons pouvoir présenter en cas de contrôle (par votre financeur ou dans le cadre de notre certification Qualiopi).

## L''attestation de fin de formation

Lorsque vous avez terminé toutes les leçons et réussi l''évaluation finale, IDEAFORMA vous délivre une attestation de réalisation qui précise les compétences travaillées.

Soyons précis sur un point : cette formation prépare aux compétences du certificat « Animer une équipe de travail » (RS7377, CCI France), mais elle ne délivre pas ce certificat. Si vous souhaitez le passer, nous vous indiquerons la marche à suivre à la fin du parcours.

## Les sources

Tout ce que vous lirez ici s''appuie sur des sources identifiées : textes de loi (Code du travail), organismes publics (INRS, ANACT, France Compétences), et travaux de référence en management et en psychologie du travail. Chaque cours cite ses sources en fin de leçon.

Pourquoi c''est important : en management, on entend beaucoup d''affirmations séduisantes et fausses. Savoir d''où vient une idée, c''est aussi savoir jusqu''où on peut lui faire confiance. Nous vous encourageons à faire de même dans votre pratique.

## Accessibilité et aménagements

Toutes les vidéos sont sous-titrées et les podcasts disposent d''une transcription. La plateforme se navigue au clavier.

Si vous êtes en situation de handicap, ou si une difficulté particulière (dyslexie, fatigue, contraintes de temps) rend certains formats difficiles, contactez notre référent handicap. Nous pouvons adapter la durée d''accès, proposer des supports alternatifs ou aménager les modalités d''évaluation. Cette demande reste confidentielle.

## Nous contacter

- Questions sur le contenu, difficultés techniques, aménagements : contact.ideaforma@gmail.com — réponse sous 24 heures ouvrées.
- Téléphone : 06 25 16 13 93, du lundi au vendredi, de 9 h à 18 h.
- Pour changer votre mot de passe : menu « Mon compte ».

## À retenir

- Deux séances d''une heure par semaine, dans l''ordre des modules.
- Tenez un carnet de bord : il devient votre plan d''action.
- Quiz à 70 %, trois tentatives ; évaluation finale, deux tentatives.
- Répondez sincèrement à l''autopositionnement.
- En cas de difficulté, écrivez-nous avant la date de fin d''accès.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Cette formation représente environ 35 heures de travail. C''est à la fois beaucoup et peu : beaucoup si vous avancez au hasard, peu si vous suivez une méthode. Cette leçon vous donne la nôtre.

## Le rythme conseillé

Nous vous recommandons deux séances d''une heure par semaine, sur douze semaines. Ce rythme a trois avantages : il tient dans un emploi du temps chargé, il laisse le temps d''appliquer ce que vous apprenez entre deux séances, et il évite l''effet « gavage » où l''on lit tout en trois jours et où l''on ne retient rien.

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

Chaque module se termine par un quiz de douze questions. Le seuil de réussite est de 70 %, avec trois tentatives possibles. Ces quiz ne sont pas là pour vous piéger : ils vérifient que l''essentiel est acquis avant de passer à la suite. Si vous échouez, relisez les leçons concernées avant de retenter.

Le module 7 comporte une évaluation finale sous forme d''étude de cas : vingt-cinq situations concrètes qui couvrent l''ensemble du parcours. Seuil de 70 %, deux tentatives.

Au début et à la fin de la formation, un questionnaire d''autopositionnement de vingt questions vous permet de mesurer votre progression. Il n''est pas noté : répondez sincèrement, c''est le seul moyen qu''il vous serve.

Vos résultats sont conservés. Ils constituent, avec votre temps de connexion et votre progression, les preuves de réalisation de la formation, que nous devons pouvoir présenter en cas de contrôle (par votre financeur ou dans le cadre de notre certification Qualiopi).

## L''attestation de fin de formation

Lorsque vous avez terminé toutes les leçons et réussi l''évaluation finale, IDEAFORMA vous délivre une attestation de réalisation qui précise les compétences travaillées.

Soyons précis sur un point : cette formation prépare aux compétences du certificat « Animer une équipe de travail » (RS7377, CCI France), mais elle ne délivre pas ce certificat. Si vous souhaitez le passer, nous vous indiquerons la marche à suivre à la fin du parcours.

## Les sources

Tout ce que vous lirez ici s''appuie sur des sources identifiées : textes de loi (Code du travail), organismes publics (INRS, ANACT, France Compétences), et travaux de référence en management et en psychologie du travail. Chaque cours cite ses sources en fin de leçon.

Pourquoi c''est important : en management, on entend beaucoup d''affirmations séduisantes et fausses. Savoir d''où vient une idée, c''est aussi savoir jusqu''où on peut lui faire confiance. Nous vous encourageons à faire de même dans votre pratique.

## Accessibilité et aménagements

Toutes les vidéos sont sous-titrées et les podcasts disposent d''une transcription. La plateforme se navigue au clavier.

Si vous êtes en situation de handicap, ou si une difficulté particulière (dyslexie, fatigue, contraintes de temps) rend certains formats difficiles, contactez notre référent handicap. Nous pouvons adapter la durée d''accès, proposer des supports alternatifs ou aménager les modalités d''évaluation. Cette demande reste confidentielle.

## Nous contacter

- Questions sur le contenu, difficultés techniques, aménagements : contact.ideaforma@gmail.com — réponse sous 24 heures ouvrées.
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
- Thierry, 52 ans, carrossier, vingt ans de maison. Très compétent, plutôt taiseux, n''aime pas qu''on change ses habitudes. Il a été pressenti pour le poste de chef d''atelier il y a quelques années et l''a refusé.
- Nadia, 29 ans, peintre. Rigoureuse, autonome, elle gère seule la cabine de peinture. Elle aimerait évoluer, sans savoir vers quoi.
- Julien, 26 ans, carrossier arrivé il y a dix-huit mois. Motivé, rapide, mais parfois brouillon ; deux reprises pour défaut de finition ce trimestre.
- Lucas, 20 ans, apprenti carrossier en deuxième année. Très à l''aise avec les outils numériques, moins avec la ponctualité.
- Fatou, 45 ans, préparatrice : démontage, préparation des surfaces, nettoyage des véhicules avant restitution. Discrète, fiable, jamais absente. Elle a une reconnaissance de la qualité de travailleur handicapé (RQTH) pour une pathologie lombaire : elle ne doit pas porter plus de dix kilos.
- Marc, 38 ans, mécanicien, chargé des interventions mécaniques liées aux chocs (géométrie, trains roulants, climatisation). Il travaille souvent seul et se plaint de ne jamais être prévenu des priorités.

## La situation

Il y a trois semaines, Michel Garnier a réuni l''équipe et annoncé que Karim devenait chef d''atelier. Ses mots : « Karim, tu connais le boulot mieux que personne. Tu organises l''atelier, tu gères les priorités, tu me fais remonter ce qui ne va pas. Moi je m''occupe des clients et de la boutique. »

Il n''y a pas eu de fiche de poste. Karim garde une partie de son activité de carrossier « pour ne pas perdre la main » et parce que l''atelier a besoin de bras. Sa rémunération a augmenté de 180 euros brut par mois.

Depuis trois semaines, voici ce qui s''est passé.

Thierry a dit à Karim, devant Julien : « Tu vas pas commencer à me dire comment faire mon boulot, quand même. » Karim n''a rien répondu.

Sophie continue de donner directement les priorités aux carrossiers quand un client appelle, comme elle l''a toujours fait. Deux fois, Karim a découvert qu''un véhicule qu''il avait planifié pour le lendemain avait été commencé dans la journée.

Julien a rendu un véhicule avec une coulure de vernis. Le client de la flotte a fait une réclamation. Michel a engueulé Julien devant tout le monde, puis a dit à Karim : « C''est à toi de contrôler. »

Marc est venu voir Karim pour lui dire qu''il n''a jamais les infos à temps et qu''il « en a marre d''être la cinquième roue du carrosse ».

Lucas est arrivé en retard trois fois. Personne ne lui a rien dit.

Karim fait toujours ses huit heures de carrosserie et gère « le reste » entre deux voitures, souvent le soir. Il rentre chez lui fatigué et se demande s''il a bien fait d''accepter.

## Ce que dit Michel Garnier

« L''atelier est bon, on a des clients, le problème c''est l''organisation. Je veux qu''on tienne les délais annoncés aux assurances, qu''on arrête les reprises, et que je n''aie plus à intervenir tous les jours. Karim a six mois pour mettre ça en place. Je le soutiens. »

## Ce que nous allons faire avec ce cas

À chaque module, nous reprendrons l''atelier Garnier là où nous l''avons laissé :

- Module 1 : Karim clarifie son rôle, prend conscience de ses responsabilités et choisit comment se positionner face à Thierry, à Sophie et à Michel.
- Module 2 : il organise l''atelier — compétences, rôles, priorités, tableau de bord — et intègre les contraintes de poste de Fatou.
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
- Thierry, 52 ans, carrossier, vingt ans de maison. Très compétent, plutôt taiseux, n''aime pas qu''on change ses habitudes. Il a été pressenti pour le poste de chef d''atelier il y a quelques années et l''a refusé.
- Nadia, 29 ans, peintre. Rigoureuse, autonome, elle gère seule la cabine de peinture. Elle aimerait évoluer, sans savoir vers quoi.
- Julien, 26 ans, carrossier arrivé il y a dix-huit mois. Motivé, rapide, mais parfois brouillon ; deux reprises pour défaut de finition ce trimestre.
- Lucas, 20 ans, apprenti carrossier en deuxième année. Très à l''aise avec les outils numériques, moins avec la ponctualité.
- Fatou, 45 ans, préparatrice : démontage, préparation des surfaces, nettoyage des véhicules avant restitution. Discrète, fiable, jamais absente. Elle a une reconnaissance de la qualité de travailleur handicapé (RQTH) pour une pathologie lombaire : elle ne doit pas porter plus de dix kilos.
- Marc, 38 ans, mécanicien, chargé des interventions mécaniques liées aux chocs (géométrie, trains roulants, climatisation). Il travaille souvent seul et se plaint de ne jamais être prévenu des priorités.

## La situation

Il y a trois semaines, Michel Garnier a réuni l''équipe et annoncé que Karim devenait chef d''atelier. Ses mots : « Karim, tu connais le boulot mieux que personne. Tu organises l''atelier, tu gères les priorités, tu me fais remonter ce qui ne va pas. Moi je m''occupe des clients et de la boutique. »

Il n''y a pas eu de fiche de poste. Karim garde une partie de son activité de carrossier « pour ne pas perdre la main » et parce que l''atelier a besoin de bras. Sa rémunération a augmenté de 180 euros brut par mois.

Depuis trois semaines, voici ce qui s''est passé.

Thierry a dit à Karim, devant Julien : « Tu vas pas commencer à me dire comment faire mon boulot, quand même. » Karim n''a rien répondu.

Sophie continue de donner directement les priorités aux carrossiers quand un client appelle, comme elle l''a toujours fait. Deux fois, Karim a découvert qu''un véhicule qu''il avait planifié pour le lendemain avait été commencé dans la journée.

Julien a rendu un véhicule avec une coulure de vernis. Le client de la flotte a fait une réclamation. Michel a engueulé Julien devant tout le monde, puis a dit à Karim : « C''est à toi de contrôler. »

Marc est venu voir Karim pour lui dire qu''il n''a jamais les infos à temps et qu''il « en a marre d''être la cinquième roue du carrosse ».

Lucas est arrivé en retard trois fois. Personne ne lui a rien dit.

Karim fait toujours ses huit heures de carrosserie et gère « le reste » entre deux voitures, souvent le soir. Il rentre chez lui fatigué et se demande s''il a bien fait d''accepter.

## Ce que dit Michel Garnier

« L''atelier est bon, on a des clients, le problème c''est l''organisation. Je veux qu''on tienne les délais annoncés aux assurances, qu''on arrête les reprises, et que je n''aie plus à intervenir tous les jours. Karim a six mois pour mettre ça en place. Je le soutiens. »

## Ce que nous allons faire avec ce cas

À chaque module, nous reprendrons l''atelier Garnier là où nous l''avons laissé :

- Module 1 : Karim clarifie son rôle, prend conscience de ses responsabilités et choisit comment se positionner face à Thierry, à Sophie et à Michel.
- Module 2 : il organise l''atelier — compétences, rôles, priorités, tableau de bord — et intègre les contraintes de poste de Fatou.
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
      then jsonb_build_object('texte', 'Type : vidéo avatar · Débit : 140 mots/min · Indications visuelles entre crochets

---

[Plan : avatar, fond clair. Titre : « Module 1 — Comprendre le rôle du manager »]

Trois mots reviennent sans arrêt dès qu''on parle d''encadrement : chef, manager, leader. On les emploie souvent comme des synonymes. Ils ne le sont pas, et la différence n''est pas une question de vocabulaire : elle change ce que vous faites chaque jour.

[Titre : « Le chef »]

Commençons par le plus ancien : le chef. Le chef, c''est une position. On est chef parce qu''on a été nommé, et l''on tire son autorité de cette nomination. Le chef donne des ordres et contrôle qu''ils sont exécutés.

Cette position existe toujours, et elle est nécessaire : dans une équipe, quelqu''un doit pouvoir trancher. Mais si votre seule ressource est « c''est moi le chef », vous obtiendrez au mieux de l''obéissance, jamais de l''engagement. Et vous le paierez le jour où vous aurez besoin que quelqu''un fasse un effort que vous n''avez pas demandé.

[Titre : « Le manager »]

Le manager, c''est une fonction. Le mot vient de l''italien maneggiare, « manier, conduire », et il désigne celui qui fait fonctionner une organisation.

En 1916, un ingénieur français, Henri Fayol, a été le premier à décrire ce que fait un manager. Il a identifié cinq activités : prévoir, organiser, commander, coordonner, contrôler. Plus d''un siècle après, la liste a été un peu reformulée, mais elle tient toujours.

[Schéma : 5 cases — Planifier · Organiser · Animer · Contrôler · Développer]

Dans cette formation, nous retiendrons cinq fonctions : planifier, organiser, animer, contrôler, développer. Nous les détaillerons dans la leçon suivante.

Dans les années 1970, un chercheur canadien, Henry Mintzberg, a fait quelque chose de très simple et de très rare : il a suivi des managers pendant des semaines, un chronomètre à la main, pour voir ce qu''ils faisaient vraiment. Sa conclusion a surpris tout le monde. Le manager ne passe pas ses journées à planifier calmement dans son bureau. Il est interrompu toutes les neuf minutes. Il gère des dizaines de sujets courts. Il passe l''essentiel de son temps à parler : écouter, informer, négocier, décider.

[Schéma : les 10 rôles de Mintzberg en trois groupes — Relations (symbole, leader, agent de liaison) · Information (observateur, diffuseur, porte-parole) · Décision (entrepreneur, régulateur, répartiteur de ressources, négociateur)]

Mintzberg a décrit dix rôles, regroupés en trois familles. Les rôles de relations : représenter l''équipe, l''animer, faire le lien avec l''extérieur. Les rôles d''information : observer ce qui se passe, diffuser l''information à l''équipe, parler au nom de l''équipe vers la hiérarchie. Et les rôles de décision : lancer des améliorations, régler les problèmes, répartir les ressources, négocier.

Retenez l''idée principale : manager, c''est un métier de relations et d''information au moins autant qu''un métier de décision.

[Titre : « Le leader »]

Et le leader, alors ? Le leader, ce n''est ni une position ni une fonction : c''est une influence. On est leader parce que les autres choisissent de vous suivre. Cette influence ne se décrète pas ; elle se construit, par ce que vous faites, ce que vous dites, et la cohérence entre les deux.

En 1990, un professeur de Harvard, John Kotter, a proposé une distinction qui fait toujours référence. Le management, dit-il, sert à gérer la complexité : planifier, budgéter, organiser, contrôler, pour que les choses se passent comme prévu. Le leadership sert à gérer le changement : donner une direction, mobiliser les gens, les motiver, pour que les choses se passent autrement qu''avant.

[Schéma : deux colonnes — Management : « faire fonctionner » / Leadership : « faire évoluer »]

Le management fait fonctionner. Le leadership fait évoluer. Et la conclusion de Kotter est importante : une organisation a besoin des deux, et la plupart des managers sont trop faibles en leadership, pas l''inverse.

[Titre : « Et vous ? »]

Alors, où vous situez-vous ?

Si vous venez d''être nommé, vous êtes chef : vous avez la position. C''est le point de départ, pas l''arrivée.

Votre travail, dès les premières semaines, c''est de devenir manager : prendre en main les cinq fonctions, tenir les dix rôles, faire fonctionner l''équipe. Ça s''apprend, et c''est l''objet de cette formation.

Et votre ambition, sur la durée, c''est de devenir leader : que votre équipe vous suive parce qu''elle vous fait confiance, pas parce qu''elle y est obligée.

[Plan : reprise du cas]

Prenons Karim, à l''atelier Garnier. Il a été nommé chef d''atelier : il a la position. Mais il ne l''exerce pas encore comme manager : il n''a pas planifié, pas organisé, il subit les priorités que Sophie donne à sa place. Et son leadership est fragile : Thierry, le carrossier expérimenté, le lui a fait sentir devant Julien.

Que doit faire Karim ? Pas choisir entre les trois. Assumer la position, qui est la sienne. Prendre en main la fonction, méthodiquement. Et construire l''influence, jour après jour, en commençant par la cohérence : dire ce qu''il va faire, et le faire.

[Titre : « Trois erreurs classiques »]

Terminons par trois erreurs de débutant, que vous reconnaîtrez peut-être.

Première erreur : rester expert. Continuer à faire le travail soi-même parce qu''on le fait mieux et plus vite. C''est la tentation de Karim, qui fait toujours ses huit heures de carrosserie. Le problème, c''est qu''on ne peut pas manager entre deux voitures.

Deuxième erreur : se réfugier dans la position. « C''est moi qui décide, point. » Ça marche une fois. Puis les gens se taisent, et vous perdez l''information dont vous avez besoin pour décider.

Troisième erreur : vouloir être aimé. Éviter tout ce qui pourrait déplaire : les retours difficiles, les arbitrages, les non. On se croit leader ; on est seulement absent.

[Plan rapproché]

Dans les prochaines leçons, nous allons entrer dans le détail : ce que fait vraiment un manager de proximité, les six styles de leadership, comment adapter votre style à chaque personne, et ce que vous engagez légalement en prenant ce poste.

À tout de suite.

[Fondu, logo]

---

Sources citées : Fayol, *Administration industrielle et générale* (1916) ; Mintzberg, *The Nature of Managerial Work* (1973) ; Kotter, « What Leaders Really Do », *Harvard Business Review* (1990).
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Type : vidéo avatar · Débit : 140 mots/min · Indications visuelles entre crochets

---

[Plan : avatar, fond clair. Titre : « Module 1 — Comprendre le rôle du manager »]

Trois mots reviennent sans arrêt dès qu''on parle d''encadrement : chef, manager, leader. On les emploie souvent comme des synonymes. Ils ne le sont pas, et la différence n''est pas une question de vocabulaire : elle change ce que vous faites chaque jour.

[Titre : « Le chef »]

Commençons par le plus ancien : le chef. Le chef, c''est une position. On est chef parce qu''on a été nommé, et l''on tire son autorité de cette nomination. Le chef donne des ordres et contrôle qu''ils sont exécutés.

Cette position existe toujours, et elle est nécessaire : dans une équipe, quelqu''un doit pouvoir trancher. Mais si votre seule ressource est « c''est moi le chef », vous obtiendrez au mieux de l''obéissance, jamais de l''engagement. Et vous le paierez le jour où vous aurez besoin que quelqu''un fasse un effort que vous n''avez pas demandé.

[Titre : « Le manager »]

Le manager, c''est une fonction. Le mot vient de l''italien maneggiare, « manier, conduire », et il désigne celui qui fait fonctionner une organisation.

En 1916, un ingénieur français, Henri Fayol, a été le premier à décrire ce que fait un manager. Il a identifié cinq activités : prévoir, organiser, commander, coordonner, contrôler. Plus d''un siècle après, la liste a été un peu reformulée, mais elle tient toujours.

[Schéma : 5 cases — Planifier · Organiser · Animer · Contrôler · Développer]

Dans cette formation, nous retiendrons cinq fonctions : planifier, organiser, animer, contrôler, développer. Nous les détaillerons dans la leçon suivante.

Dans les années 1970, un chercheur canadien, Henry Mintzberg, a fait quelque chose de très simple et de très rare : il a suivi des managers pendant des semaines, un chronomètre à la main, pour voir ce qu''ils faisaient vraiment. Sa conclusion a surpris tout le monde. Le manager ne passe pas ses journées à planifier calmement dans son bureau. Il est interrompu toutes les neuf minutes. Il gère des dizaines de sujets courts. Il passe l''essentiel de son temps à parler : écouter, informer, négocier, décider.

[Schéma : les 10 rôles de Mintzberg en trois groupes — Relations (symbole, leader, agent de liaison) · Information (observateur, diffuseur, porte-parole) · Décision (entrepreneur, régulateur, répartiteur de ressources, négociateur)]

Mintzberg a décrit dix rôles, regroupés en trois familles. Les rôles de relations : représenter l''équipe, l''animer, faire le lien avec l''extérieur. Les rôles d''information : observer ce qui se passe, diffuser l''information à l''équipe, parler au nom de l''équipe vers la hiérarchie. Et les rôles de décision : lancer des améliorations, régler les problèmes, répartir les ressources, négocier.

Retenez l''idée principale : manager, c''est un métier de relations et d''information au moins autant qu''un métier de décision.

[Titre : « Le leader »]

Et le leader, alors ? Le leader, ce n''est ni une position ni une fonction : c''est une influence. On est leader parce que les autres choisissent de vous suivre. Cette influence ne se décrète pas ; elle se construit, par ce que vous faites, ce que vous dites, et la cohérence entre les deux.

En 1990, un professeur de Harvard, John Kotter, a proposé une distinction qui fait toujours référence. Le management, dit-il, sert à gérer la complexité : planifier, budgéter, organiser, contrôler, pour que les choses se passent comme prévu. Le leadership sert à gérer le changement : donner une direction, mobiliser les gens, les motiver, pour que les choses se passent autrement qu''avant.

[Schéma : deux colonnes — Management : « faire fonctionner » / Leadership : « faire évoluer »]

Le management fait fonctionner. Le leadership fait évoluer. Et la conclusion de Kotter est importante : une organisation a besoin des deux, et la plupart des managers sont trop faibles en leadership, pas l''inverse.

[Titre : « Et vous ? »]

Alors, où vous situez-vous ?

Si vous venez d''être nommé, vous êtes chef : vous avez la position. C''est le point de départ, pas l''arrivée.

Votre travail, dès les premières semaines, c''est de devenir manager : prendre en main les cinq fonctions, tenir les dix rôles, faire fonctionner l''équipe. Ça s''apprend, et c''est l''objet de cette formation.

Et votre ambition, sur la durée, c''est de devenir leader : que votre équipe vous suive parce qu''elle vous fait confiance, pas parce qu''elle y est obligée.

[Plan : reprise du cas]

Prenons Karim, à l''atelier Garnier. Il a été nommé chef d''atelier : il a la position. Mais il ne l''exerce pas encore comme manager : il n''a pas planifié, pas organisé, il subit les priorités que Sophie donne à sa place. Et son leadership est fragile : Thierry, le carrossier expérimenté, le lui a fait sentir devant Julien.

Que doit faire Karim ? Pas choisir entre les trois. Assumer la position, qui est la sienne. Prendre en main la fonction, méthodiquement. Et construire l''influence, jour après jour, en commençant par la cohérence : dire ce qu''il va faire, et le faire.

[Titre : « Trois erreurs classiques »]

Terminons par trois erreurs de débutant, que vous reconnaîtrez peut-être.

Première erreur : rester expert. Continuer à faire le travail soi-même parce qu''on le fait mieux et plus vite. C''est la tentation de Karim, qui fait toujours ses huit heures de carrosserie. Le problème, c''est qu''on ne peut pas manager entre deux voitures.

Deuxième erreur : se réfugier dans la position. « C''est moi qui décide, point. » Ça marche une fois. Puis les gens se taisent, et vous perdez l''information dont vous avez besoin pour décider.

Troisième erreur : vouloir être aimé. Éviter tout ce qui pourrait déplaire : les retours difficiles, les arbitrages, les non. On se croit leader ; on est seulement absent.

[Plan rapproché]

Dans les prochaines leçons, nous allons entrer dans le détail : ce que fait vraiment un manager de proximité, les six styles de leadership, comment adapter votre style à chaque personne, et ce que vous engagez légalement en prenant ce poste.

À tout de suite.

[Fondu, logo]

---

Sources citées : Fayol, *Administration industrielle et générale* (1916) ; Mintzberg, *The Nature of Managerial Work* (1973) ; Kotter, « What Leaders Really Do », *Harvard Business Review* (1990).
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 2 and l.ordre = 1;
  n := n + 1;

  -- 1.10-quiz.json
  update public.lecons l set contenu = '{"questions": [{"id": "m1q01", "enonce": "Selon la distinction proposée par John Kotter (1990), à quoi sert le leadership, par opposition au management ?", "options": ["À planifier, budgéter et contrôler pour que les choses se passent comme prévu", "À donner une direction, mobiliser et motiver pour que les choses évoluent", "À représenter l''équipe auprès de la direction", "À sanctionner les écarts de comportement"], "bonnes": [1], "explication": "Pour Kotter, le management gère la complexité (faire fonctionner) et le leadership gère le changement (faire évoluer). Une organisation a besoin des deux."}, {"id": "m1q02", "enonce": "Henry Mintzberg a observé des managers au travail. Quelle est la conclusion la plus juste de ses observations ?", "options": ["Les managers passent l''essentiel de leur temps à planifier dans leur bureau", "Les managers sont interrompus rarement et travaillent sur peu de sujets à la fois", "Les managers passent la majeure partie de leur temps en communication orale, sur de nombreux sujets courts", "Les managers ne prennent presque jamais de décision"], "bonnes": [2], "explication": "Mintzberg a montré un travail fragmenté, fait d''interruptions fréquentes et dominé par la communication orale (60 à 80 % du temps)."}, {"id": "m1q03", "enonce": "Parmi les cinq fonctions du manager, laquelle est le plus souvent négligée parce que ses résultats ne se voient qu''à long terme ?", "options": ["Planifier", "Animer", "Contrôler", "Développer"], "bonnes": [3], "explication": "Développer les personnes et l''équipe est la première fonction sacrifiée quand le temps manque : il faut la protéger en la mettant à l''agenda."}, {"id": "m1q04", "enonce": "Un nouveau manager continue à assurer une production personnelle à temps plein et gère l''équipe « entre deux tâches ». Dans quel piège tombe-t-il ?", "options": ["Tout changer tout de suite", "Rester dans la production", "Ne rien changer du tout", "Faire seul"], "bonnes": [1], "explication": "C''est le piège de l''expert promu : il n''a pas de temps pour manager. Le temps de management doit être négocié et protégé."}, {"id": "m1q05", "enonce": "D''après l''étude reprise par Daniel Goleman (2000), quels styles de leadership dégradent le climat de l''équipe lorsqu''ils sont utilisés régulièrement ? (plusieurs réponses)", "options": ["Directif", "Visionnaire", "Chef de file", "Coach"], "bonnes": [0, 2], "explication": "Directif et chef de file sont utiles ponctuellement (crise, équipe d''experts très motivés) mais toxiques en usage courant. Visionnaire, participatif, coach et collaboratif ont un effet positif."}, {"id": "m1q06", "enonce": "Quel style de leadership consiste à donner une direction claire et un sens (« venez avec moi ») en laissant la liberté des moyens ?", "options": ["Participatif", "Collaboratif", "Visionnaire", "Directif"], "bonnes": [2], "explication": "Le style visionnaire est, selon l''étude, celui qui a l''effet le plus positif sur le climat dans la plupart des situations."}, {"id": "m1q07", "enonce": "Dans le leadership situationnel (Hersey & Blanchard), un collaborateur compétent sur une tâche mais qui hésite à prendre l''initiative relève de quel style ?", "options": ["Diriger (beaucoup de direction, peu de soutien)", "Entraîner (beaucoup de direction, beaucoup de soutien)", "Épauler (peu de direction, beaucoup de soutien)", "Déléguer (peu de direction, peu de soutien)"], "bonnes": [2], "explication": "Compétence forte et engagement variable = niveau A3 : on n''explique plus comment faire, on écoute, on rassure, on consulte."}, {"id": "m1q08", "enonce": "Quelle affirmation sur le niveau d''autonomie est exacte ?", "options": ["Le niveau d''autonomie est une caractéristique stable de la personne", "Le niveau d''autonomie dépend de la tâche et évolue dans le temps", "Un expert est autonome sur toutes les tâches", "Le niveau d''autonomie se déduit de l''ancienneté"], "bonnes": [1], "explication": "On manage une personne sur une tâche donnée. Un excellent carrossier peut être débutant sur un logiciel de devis. Le style doit évoluer avec le niveau."}, {"id": "m1q09", "enonce": "Un ancien collègue conteste votre légitimité par des remarques devant l''équipe. Quelle est la réaction la plus appropriée ?", "options": ["L''ignorer : cela passera avec le temps", "Le recadrer publiquement pour montrer que vous êtes le chef", "Le recevoir en entretien, reconnaître son expérience, nommer les faits et fixer la règle : désaccord en privé, pas devant l''équipe", "Demander à la direction de le sanctionner"], "bonnes": [2], "explication": "Ni affrontement ni évitement : un entretien individuel qui reconnaît la place de la personne et pose la règle. Les contestations non traitées s''installent."}, {"id": "m1q10", "enonce": "Concernant l''obligation de sécurité (Code du travail, L4121-1), quelle affirmation est exacte ?", "options": ["Elle ne concerne que les risques physiques", "Elle pèse sur l''employeur et couvre la santé physique et mentale ; le manager la met en œuvre au quotidien", "Elle pèse uniquement sur le salarié, responsable de sa propre sécurité", "Elle ne s''applique qu''aux entreprises de plus de 50 salariés"], "bonnes": [1], "explication": "L''employeur doit prendre les mesures nécessaires pour protéger la santé physique et mentale. Le manager en est le relais ; il peut être personnellement responsable en cas de délégation de pouvoirs."}, {"id": "m1q11", "enonce": "Un salarié vous signale des faits qui pourraient constituer du harcèlement de la part d''un collègue. Que devez-vous faire ?", "options": ["Mener vous-même une enquête discrète avant d''en parler", "Attendre d''avoir des preuves solides pour ne pas accuser à tort", "Prendre le signalement au sérieux et le transmettre sans délai à la hiérarchie ou aux RH, par écrit", "Organiser une confrontation entre les deux personnes"], "bonnes": [2], "explication": "L''employeur doit agir dès qu''il est informé. Le manager ne minimise pas, n''enquête pas seul et transmet immédiatement ; l''inaction engage la responsabilité de l''entreprise et la sienne."}, {"id": "m1q12", "enonce": "Votre direction vous demande de livrer huit véhicules pour vendredi, ce qui est irréaliste avec l''équipe actuelle. Quelle réponse correspond à la méthode vue dans le module ?", "options": ["« D''accord, on va y arriver » puis livrer en retard", "« C''est impossible » sans autre précision", "« C''est possible si nous décalons les deux véhicules de particuliers ; sinon il faut deux jours d''intérim. Que préférez-vous ? »", "Transmettre la demande à l''équipe telle quelle en précisant que la direction l''exige"], "bonnes": [2], "explication": "« Oui, à ces conditions » : rendre visibles les conséquences et laisser la décision à qui elle appartient, plutôt qu''un oui intenable ou un non sans argument."}], "seuil": 70, "tentatives_max": 3, "corrections": true, "consigne": "12 questions. Une seule bonne réponse par question, sauf mention « plusieurs réponses ». Seuil de réussite : 70 %."}'::jsonb, publie = true
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

Mintzberg l''a mesuré : un manager passe entre 60 et 80 % de son temps en communication orale. Si vous vous sentez « tout le temps en train de parler », c''est normal : c''est le travail.

## 4. Contrôler

Contrôler, c''est vérifier que ce qui devait être fait a été fait, au niveau de qualité attendu, et agir sur les écarts. Le mot a mauvaise presse, mais la fonction est indispensable : une équipe qu''on ne contrôle pas est une équipe qu''on abandonne. Le contrôle donne aussi de la reconnaissance : on ne peut pas féliciter un travail qu''on n''a pas regardé.

La question n''est pas de contrôler ou non, mais comment : sur quoi, à quelle fréquence, avec quelle transparence. Nous y reviendrons au module 2 avec le tableau de bord.

## 5. Développer

Développer, c''est faire progresser les personnes et l''équipe : repérer les potentiels, former, déléguer pour faire grandir, préparer l''avenir. C''est la fonction la plus souvent négligée, parce que ses résultats se voient à long terme. C''est aussi celle qui distingue un manager qui fait tourner de celui qui construit.

## Comment se répartit le temps

Il n''existe pas de répartition idéale, mais un repère utile pour un manager de proximité qui encadre cinq à quinze personnes :

- Animer : 40 à 50 % (échanges, réunions, présence terrain, régulation)
- Planifier et organiser : 20 à 25 %
- Contrôler : 15 à 20 %
- Développer : 10 à 15 %

Deux points de vigilance.

Premier point : ce temps de management doit exister. Un manager qui conserve une activité opérationnelle à temps plein ne manage pas ; il fait des heures supplémentaires. C''est la situation de Karim, qui gère « le reste » entre deux voitures et le soir. Si vous encadrez une équipe tout en gardant une production personnelle, négociez explicitement la part de votre temps consacrée au management. Pour une équipe de neuf personnes comme celle de l''atelier Garnier, la moitié du temps est un minimum réaliste.

Second point : la fonction « développer » est la première sacrifiée quand le temps manque. Protégez-la en la mettant à l''agenda, par exemple un entretien de progression par personne et par trimestre.

## Les pièges de la première prise de poste

Linda Hill, professeure à Harvard, a suivi pendant un an des managers nouvellement nommés. Son livre, *Becoming a Manager*, décrit ce qu''ils découvrent, souvent douloureusement.

Le premier constat : les nouveaux managers imaginent que le poste leur donne du pouvoir. Ils découvrent qu''il leur donne des dépendances : ils dépendent désormais de leur équipe, de leur hiérarchie, des autres services. Leur autorité formelle compte moins que leur capacité à obtenir la coopération.

Le second constat : ils pensent que leur travail est de gérer des individus. Ils découvrent qu''il est de construire une équipe, c''est-à-dire un collectif qui fonctionne aussi quand ils ne sont pas là.

Le troisième : ils croient que leur légitimité vient de leur expertise technique. Elle vient de leur capacité à faire réussir les autres.

De ces observations, on peut tirer quatre pièges classiques.

Piège 1 — Rester dans la production. Le nouveau manager continue à faire le travail lui-même, parce qu''il le fait bien, parce que ça le rassure, parce que l''équipe manque de bras. Résultat : il n''a pas le temps de manager, et l''équipe ne progresse pas.

Piège 2 — Tout changer tout de suite. Pour marquer son territoire, le nouveau manager réorganise dès la première semaine. Il ne connaît pas encore les raisons de l''organisation existante, et il se met l''équipe à dos. Prenez le temps d''observer : les 90 premiers jours servent à comprendre, pas à bouleverser.

Piège 3 — Ne rien changer du tout. À l''inverse, par peur de déplaire, le nouveau manager laisse tout en l''état, y compris ce qui dysfonctionne. L''équipe conclut que rien ne changera, et les problèmes s''installent. C''est le cas de Karim avec les retards de Lucas : personne ne dit rien.

Piège 4 — Faire seul. Le nouveau manager ne demande pas d''aide, ni à sa hiérarchie ni à ses pairs, parce qu''il pense qu''on l''a nommé pour se débrouiller. Or son propre manager a une responsabilité dans sa réussite. Demander un point hebdomadaire de 30 minutes avec sa hiérarchie pendant les trois premiers mois n''est pas un aveu de faiblesse : c''est de l''organisation.

## Le cas Garnier

Reprenons les cinq fonctions et regardons où en est Karim après trois semaines.

Planifier : il planifie les véhicules du lendemain, mais Sophie bouleverse le planning en donnant directement des priorités. La planification existe mais elle n''est pas respectée, parce que le circuit de décision n''a pas été clarifié.

Organiser : rien n''a été formalisé. Pas de fiche de poste pour Karim, pas de règle sur qui fixe les priorités, pas de circuit d''information vers Marc, le mécanicien.

Animer : Karim est présent à l''atelier, mais en tant que carrossier. Il n''a pas tenu de réunion d''équipe, n''a pas répondu à Thierry, n''a pas parlé à Lucas.

Contrôler : le contrôle qualité avant restitution n''existe pas (la coulure de vernis de Julien est arrivée jusqu''au client). Michel a dit « c''est à toi de contrôler » sans que l''on sache comment.

Développer : rien pour l''instant, ce qui est normal à trois semaines.

Le diagnostic est clair : Karim a la position, pas encore la fonction. Sa priorité n''est pas de mieux faire de la carrosserie, ni de « recadrer Thierry ». C''est de clarifier son rôle avec Michel — temps consacré au management, périmètre de décision, circuit des priorités — puis d''organiser.

Nous verrons à la fin de ce module, dans la fiche outil « feuille de route des 90 premiers jours », comment structurer cette prise de poste.

## Variante commerce

Remplacez l''atelier par un magasin de huit vendeurs, et Karim par Inès, meilleure vendeuse promue responsable adjointe. Elle continue de faire ses ventes (sa prime en dépend), la directrice régionale donne des consignes directement aux vendeurs par téléphone, et un vendeur senior lui a lancé : « Tu vas pas m''apprendre à vendre. » Les fonctions, les pièges et le diagnostic sont exactement les mêmes.

## À retenir

- Cinq fonctions : planifier, organiser, animer, contrôler, développer.
- Animer prend la moitié du temps ; c''est normal.
- Le temps de management doit être négocié et protégé, surtout si vous gardez une activité de production.
- Quatre pièges : rester dans la production, tout changer, ne rien changer, faire seul.
- Votre légitimité viendra de la réussite de l''équipe, pas de votre expertise.

## Sources

- Henri Fayol, *Administration industrielle et générale*, 1916.
- Henry Mintzberg, *The Nature of Managerial Work*, Harper & Row, 1973 ; *Manager : ce que font vraiment les managers*, Vuibert, 2011.
- Linda A. Hill, *Becoming a Manager: How New Managers Master the Challenges of Leadership*, Harvard Business School Press, 2e éd., 2003.
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

Mintzberg l''a mesuré : un manager passe entre 60 et 80 % de son temps en communication orale. Si vous vous sentez « tout le temps en train de parler », c''est normal : c''est le travail.

## 4. Contrôler

Contrôler, c''est vérifier que ce qui devait être fait a été fait, au niveau de qualité attendu, et agir sur les écarts. Le mot a mauvaise presse, mais la fonction est indispensable : une équipe qu''on ne contrôle pas est une équipe qu''on abandonne. Le contrôle donne aussi de la reconnaissance : on ne peut pas féliciter un travail qu''on n''a pas regardé.

La question n''est pas de contrôler ou non, mais comment : sur quoi, à quelle fréquence, avec quelle transparence. Nous y reviendrons au module 2 avec le tableau de bord.

## 5. Développer

Développer, c''est faire progresser les personnes et l''équipe : repérer les potentiels, former, déléguer pour faire grandir, préparer l''avenir. C''est la fonction la plus souvent négligée, parce que ses résultats se voient à long terme. C''est aussi celle qui distingue un manager qui fait tourner de celui qui construit.

## Comment se répartit le temps

Il n''existe pas de répartition idéale, mais un repère utile pour un manager de proximité qui encadre cinq à quinze personnes :

- Animer : 40 à 50 % (échanges, réunions, présence terrain, régulation)
- Planifier et organiser : 20 à 25 %
- Contrôler : 15 à 20 %
- Développer : 10 à 15 %

Deux points de vigilance.

Premier point : ce temps de management doit exister. Un manager qui conserve une activité opérationnelle à temps plein ne manage pas ; il fait des heures supplémentaires. C''est la situation de Karim, qui gère « le reste » entre deux voitures et le soir. Si vous encadrez une équipe tout en gardant une production personnelle, négociez explicitement la part de votre temps consacrée au management. Pour une équipe de neuf personnes comme celle de l''atelier Garnier, la moitié du temps est un minimum réaliste.

Second point : la fonction « développer » est la première sacrifiée quand le temps manque. Protégez-la en la mettant à l''agenda, par exemple un entretien de progression par personne et par trimestre.

## Les pièges de la première prise de poste

Linda Hill, professeure à Harvard, a suivi pendant un an des managers nouvellement nommés. Son livre, *Becoming a Manager*, décrit ce qu''ils découvrent, souvent douloureusement.

Le premier constat : les nouveaux managers imaginent que le poste leur donne du pouvoir. Ils découvrent qu''il leur donne des dépendances : ils dépendent désormais de leur équipe, de leur hiérarchie, des autres services. Leur autorité formelle compte moins que leur capacité à obtenir la coopération.

Le second constat : ils pensent que leur travail est de gérer des individus. Ils découvrent qu''il est de construire une équipe, c''est-à-dire un collectif qui fonctionne aussi quand ils ne sont pas là.

Le troisième : ils croient que leur légitimité vient de leur expertise technique. Elle vient de leur capacité à faire réussir les autres.

De ces observations, on peut tirer quatre pièges classiques.

Piège 1 — Rester dans la production. Le nouveau manager continue à faire le travail lui-même, parce qu''il le fait bien, parce que ça le rassure, parce que l''équipe manque de bras. Résultat : il n''a pas le temps de manager, et l''équipe ne progresse pas.

Piège 2 — Tout changer tout de suite. Pour marquer son territoire, le nouveau manager réorganise dès la première semaine. Il ne connaît pas encore les raisons de l''organisation existante, et il se met l''équipe à dos. Prenez le temps d''observer : les 90 premiers jours servent à comprendre, pas à bouleverser.

Piège 3 — Ne rien changer du tout. À l''inverse, par peur de déplaire, le nouveau manager laisse tout en l''état, y compris ce qui dysfonctionne. L''équipe conclut que rien ne changera, et les problèmes s''installent. C''est le cas de Karim avec les retards de Lucas : personne ne dit rien.

Piège 4 — Faire seul. Le nouveau manager ne demande pas d''aide, ni à sa hiérarchie ni à ses pairs, parce qu''il pense qu''on l''a nommé pour se débrouiller. Or son propre manager a une responsabilité dans sa réussite. Demander un point hebdomadaire de 30 minutes avec sa hiérarchie pendant les trois premiers mois n''est pas un aveu de faiblesse : c''est de l''organisation.

## Le cas Garnier

Reprenons les cinq fonctions et regardons où en est Karim après trois semaines.

Planifier : il planifie les véhicules du lendemain, mais Sophie bouleverse le planning en donnant directement des priorités. La planification existe mais elle n''est pas respectée, parce que le circuit de décision n''a pas été clarifié.

Organiser : rien n''a été formalisé. Pas de fiche de poste pour Karim, pas de règle sur qui fixe les priorités, pas de circuit d''information vers Marc, le mécanicien.

Animer : Karim est présent à l''atelier, mais en tant que carrossier. Il n''a pas tenu de réunion d''équipe, n''a pas répondu à Thierry, n''a pas parlé à Lucas.

Contrôler : le contrôle qualité avant restitution n''existe pas (la coulure de vernis de Julien est arrivée jusqu''au client). Michel a dit « c''est à toi de contrôler » sans que l''on sache comment.

Développer : rien pour l''instant, ce qui est normal à trois semaines.

Le diagnostic est clair : Karim a la position, pas encore la fonction. Sa priorité n''est pas de mieux faire de la carrosserie, ni de « recadrer Thierry ». C''est de clarifier son rôle avec Michel — temps consacré au management, périmètre de décision, circuit des priorités — puis d''organiser.

Nous verrons à la fin de ce module, dans la fiche outil « feuille de route des 90 premiers jours », comment structurer cette prise de poste.

## Variante commerce

Remplacez l''atelier par un magasin de huit vendeurs, et Karim par Inès, meilleure vendeuse promue responsable adjointe. Elle continue de faire ses ventes (sa prime en dépend), la directrice régionale donne des consignes directement aux vendeurs par téléphone, et un vendeur senior lui a lancé : « Tu vas pas m''apprendre à vendre. » Les fonctions, les pièges et le diagnostic sont exactement les mêmes.

## À retenir

- Cinq fonctions : planifier, organiser, animer, contrôler, développer.
- Animer prend la moitié du temps ; c''est normal.
- Le temps de management doit être négocié et protégé, surtout si vous gardez une activité de production.
- Quatre pièges : rester dans la production, tout changer, ne rien changer, faire seul.
- Votre légitimité viendra de la réussite de l''équipe, pas de votre expertise.

## Sources

- Henri Fayol, *Administration industrielle et générale*, 1916.
- Henry Mintzberg, *The Nature of Managerial Work*, Harper & Row, 1973 ; *Manager : ce que font vraiment les managers*, Vuibert, 2011.
- Linda A. Hill, *Becoming a Manager: How New Managers Master the Challenges of Leadership*, Harvard Business School Press, 2e éd., 2003.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 2 and l.ordre = 2;
  n := n + 1;

  -- 1.3-six-styles-de-leadership.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'En 2000, le psychologue Daniel Goleman a publié dans la *Harvard Business Review* un article devenu une référence : « Leadership That Gets Results ». Il s''appuyait sur une étude du cabinet Hay/McBer portant sur 3 871 cadres dirigeants. La question était simple : quels comportements de leadership produisent des résultats, et dans quelles conditions ?

La réponse tient en une idée : il n''existe pas un bon style de leadership, mais six, et les managers les plus efficaces sont ceux qui savent passer de l''un à l''autre selon la situation.

## Les six styles

## 1. Le style directif (« Faites ce que je dis »)

Le manager décide seul et attend l''exécution immédiate. Il contrôle étroitement et sanctionne les écarts.

Quand il est efficace : en situation de crise (accident, urgence client, sécurité), avec un collaborateur en difficulté grave, ou pour arrêter une dérive nette.

Son effet à long terme : c''est le style qui dégrade le plus le climat de l''équipe. Utilisé au quotidien, il tue l''initiative, l''information ne remonte plus, et les meilleurs partent.

## 2. Le style chef de file (« Faites comme moi, tout de suite »)

Le manager fixe des standards très élevés, montre l''exemple et attend que chacun suive. Il remplace ceux qui ne suivent pas plutôt que de les aider.

Quand il est efficace : avec une équipe très compétente et très motivée, qui a besoin de peu d''encadrement (des experts, des commerciaux confirmés).

Son effet à long terme : les collaborateurs se sentent dépassés, ne comprennent pas ce qu''on attend d''eux, et le climat se dégrade. C''est le style naturel de beaucoup d''experts promus managers, comme Karim ou Inès : « je fais mieux, donc je montre ». Il est rarement efficace avec une équipe hétérogène.

## 3. Le style visionnaire (« Venez avec moi »)

Le manager donne une direction claire et un sens : voici où nous allons et pourquoi. Il laisse à chacun la liberté des moyens.

Quand il est efficace : presque toujours, et particulièrement lorsqu''une équipe a besoin d''une nouvelle direction (nouveau manager, réorganisation, changement de stratégie).

Son effet à long terme : c''est, selon l''étude, le style qui a l''impact le plus positif sur le climat. Il échoue seulement avec une équipe d''experts plus compétents que le manager, qui peuvent trouver la « vision » prétentieuse.

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

Deux résultats sont à retenir.

Premier résultat : quatre styles ont un effet positif sur le climat de l''équipe (visionnaire, participatif, coach, collaboratif), deux ont un effet négatif s''ils sont utilisés régulièrement (directif, chef de file). Or, le climat explique environ un tiers des résultats d''une équipe.

Second résultat : les managers qui obtiennent les meilleurs résultats maîtrisent au moins quatre styles, en particulier le visionnaire, le participatif, le coach et le collaboratif, et ils passent de l''un à l''autre avec souplesse selon la situation, parfois dans la même journée.

Goleman utilise l''image des clubs de golf : chaque style est un club différent ; le bon joueur choisit le club selon le coup à jouer. Un manager qui n''a qu''un style est un golfeur qui joue tout au putter.

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

Ce dont l''atelier a besoin dans les trois prochains mois : du visionnaire d''abord (dire clairement où l''on va : tenir les délais, arrêter les reprises, et pourquoi c''est vital pour l''entreprise) ; du participatif pour construire les nouvelles règles avec l''équipe, y compris Thierry ; du coach pour Julien et Lucas ; et une dose de directif, ponctuelle et assumée, sur la sécurité et sur les retards répétés.

## À retenir

- Six styles : directif, chef de file, visionnaire, participatif, coach, collaboratif.
- Directif et chef de file sont utiles ponctuellement, toxiques en usage courant.
- Le visionnaire est le plus efficace dans la plupart des situations.
- Les meilleurs managers maîtrisent au moins quatre styles et en changent selon la situation.
- Identifiez votre style dominant et travaillez ceux que vous n''utilisez pas.

## Sources

- Daniel Goleman, « Leadership That Gets Results », *Harvard Business Review*, mars-avril 2000.
- Daniel Goleman, Richard Boyatzis, Annie McKee, *Primal Leadership*, Harvard Business School Press, 2002 (trad. fr. *L''intelligence émotionnelle au travail*).
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'En 2000, le psychologue Daniel Goleman a publié dans la *Harvard Business Review* un article devenu une référence : « Leadership That Gets Results ». Il s''appuyait sur une étude du cabinet Hay/McBer portant sur 3 871 cadres dirigeants. La question était simple : quels comportements de leadership produisent des résultats, et dans quelles conditions ?

La réponse tient en une idée : il n''existe pas un bon style de leadership, mais six, et les managers les plus efficaces sont ceux qui savent passer de l''un à l''autre selon la situation.

## Les six styles

## 1. Le style directif (« Faites ce que je dis »)

Le manager décide seul et attend l''exécution immédiate. Il contrôle étroitement et sanctionne les écarts.

Quand il est efficace : en situation de crise (accident, urgence client, sécurité), avec un collaborateur en difficulté grave, ou pour arrêter une dérive nette.

Son effet à long terme : c''est le style qui dégrade le plus le climat de l''équipe. Utilisé au quotidien, il tue l''initiative, l''information ne remonte plus, et les meilleurs partent.

## 2. Le style chef de file (« Faites comme moi, tout de suite »)

Le manager fixe des standards très élevés, montre l''exemple et attend que chacun suive. Il remplace ceux qui ne suivent pas plutôt que de les aider.

Quand il est efficace : avec une équipe très compétente et très motivée, qui a besoin de peu d''encadrement (des experts, des commerciaux confirmés).

Son effet à long terme : les collaborateurs se sentent dépassés, ne comprennent pas ce qu''on attend d''eux, et le climat se dégrade. C''est le style naturel de beaucoup d''experts promus managers, comme Karim ou Inès : « je fais mieux, donc je montre ». Il est rarement efficace avec une équipe hétérogène.

## 3. Le style visionnaire (« Venez avec moi »)

Le manager donne une direction claire et un sens : voici où nous allons et pourquoi. Il laisse à chacun la liberté des moyens.

Quand il est efficace : presque toujours, et particulièrement lorsqu''une équipe a besoin d''une nouvelle direction (nouveau manager, réorganisation, changement de stratégie).

Son effet à long terme : c''est, selon l''étude, le style qui a l''impact le plus positif sur le climat. Il échoue seulement avec une équipe d''experts plus compétents que le manager, qui peuvent trouver la « vision » prétentieuse.

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

Deux résultats sont à retenir.

Premier résultat : quatre styles ont un effet positif sur le climat de l''équipe (visionnaire, participatif, coach, collaboratif), deux ont un effet négatif s''ils sont utilisés régulièrement (directif, chef de file). Or, le climat explique environ un tiers des résultats d''une équipe.

Second résultat : les managers qui obtiennent les meilleurs résultats maîtrisent au moins quatre styles, en particulier le visionnaire, le participatif, le coach et le collaboratif, et ils passent de l''un à l''autre avec souplesse selon la situation, parfois dans la même journée.

Goleman utilise l''image des clubs de golf : chaque style est un club différent ; le bon joueur choisit le club selon le coup à jouer. Un manager qui n''a qu''un style est un golfeur qui joue tout au putter.

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

Ce dont l''atelier a besoin dans les trois prochains mois : du visionnaire d''abord (dire clairement où l''on va : tenir les délais, arrêter les reprises, et pourquoi c''est vital pour l''entreprise) ; du participatif pour construire les nouvelles règles avec l''équipe, y compris Thierry ; du coach pour Julien et Lucas ; et une dose de directif, ponctuelle et assumée, sur la sécurité et sur les retards répétés.

## À retenir

- Six styles : directif, chef de file, visionnaire, participatif, coach, collaboratif.
- Directif et chef de file sont utiles ponctuellement, toxiques en usage courant.
- Le visionnaire est le plus efficace dans la plupart des situations.
- Les meilleurs managers maîtrisent au moins quatre styles et en changent selon la situation.
- Identifiez votre style dominant et travaillez ceux que vous n''utilisez pas.

## Sources

- Daniel Goleman, « Leadership That Gets Results », *Harvard Business Review*, mars-avril 2000.
- Daniel Goleman, Richard Boyatzis, Annie McKee, *Primal Leadership*, Harvard Business School Press, 2002 (trad. fr. *L''intelligence émotionnelle au travail*).
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 2 and l.ordre = 3;
  n := n + 1;

  -- 1.4-video-leadership-situationnel.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Type : vidéo avatar · Débit : 140 mots/min · Indications visuelles entre crochets

---

[Plan : avatar, fond clair. Titre : « Le leadership situationnel »]

Dans la leçon précédente, vous avez vu qu''un bon manager change de style selon la situation. Mais selon quoi, exactement ? Comment savoir, face à une personne donnée, sur une tâche donnée, s''il faut diriger, accompagner ou laisser faire ?

À la fin des années 1960, deux chercheurs américains, Paul Hersey et Kenneth Blanchard, ont proposé une réponse simple et robuste, qu''on appelle le leadership situationnel. Elle est enseignée dans le monde entier depuis cinquante ans, et elle tient en une idée : adaptez votre style au niveau d''autonomie de la personne sur la tâche.

[Titre : « Deux ingrédients »]

Le niveau d''autonomie, c''est la combinaison de deux ingrédients.

Le premier, c''est la compétence : est-ce que la personne sait faire cette tâche précise ? Pas « est-elle compétente en général », mais « sait-elle faire cela ». Un excellent carrossier peut être incompétent pour rédiger un devis.

Le second, c''est l''engagement : a-t-elle envie de le faire, et se sent-elle capable ? La motivation et la confiance en soi.

[Schéma : matrice 2×2 — axe horizontal Compétence (faible → forte), axe vertical Engagement (faible → fort). Quatre cases numérotées A1 à A4]

En croisant les deux, on obtient quatre niveaux d''autonomie.

A1 : compétence faible, engagement fort. C''est le débutant enthousiaste. Il ne sait pas encore, mais il a envie. Pensez à Lucas, l''apprenti, sur une tâche nouvelle.

A2 : compétence faible ou moyenne, engagement faible. C''est l''apprenant déçu. Il a essayé, il a vu que c''était plus dur que prévu, il doute. Pensez à Julien après sa deuxième reprise.

A3 : compétence forte, engagement variable. C''est le collaborateur compétent mais prudent : il sait faire, mais il hésite à prendre l''initiative, ou il a un coup de mou. Pensez à Nadia, qui gère seule la cabine mais ne sait pas vers quoi évoluer.

A4 : compétence forte, engagement fort. C''est l''expert autonome. Il sait, il veut, il fait. Pensez à Thierry sur son cœur de métier.

[Titre : « Quatre styles pour quatre niveaux »]

À chaque niveau correspond un style de management, défini par deux dosages : combien je dirige, c''est-à-dire combien j''explique, je cadre, je contrôle ; et combien je soutiens, c''est-à-dire combien j''écoute, j''encourage, je fais participer.

[Schéma : les quatre styles S1 à S4 en face des niveaux A1 à A4]

Style 1, diriger : beaucoup de direction, peu de soutien. Je dis quoi faire, comment, quand ; je montre ; je contrôle de près. C''est ce qu''il faut pour A1, le débutant enthousiaste. Il n''a pas besoin qu''on le motive, il l''est déjà ; il a besoin qu''on lui apprenne.

Style 2, entraîner : beaucoup de direction, beaucoup de soutien. Je continue à cadrer et à expliquer, mais j''écoute ses difficultés, j''encourage, je valorise les progrès. C''est ce qu''il faut pour A2, l''apprenant déçu : il a besoin des deux, du savoir-faire et de la confiance.

Style 3, épauler : peu de direction, beaucoup de soutien. Je ne lui explique plus comment faire, il sait. Mais je l''écoute, je le consulte, je le rassure sur sa capacité à décider. C''est ce qu''il faut pour A3, le compétent prudent.

Style 4, déléguer : peu de direction, peu de soutien. Je fixe le résultat attendu et je laisse faire. Je reste disponible, je fais le point de temps en temps, mais je n''interviens pas. C''est ce qu''il faut pour A4, l''expert autonome.

[Titre : « Trois règles d''usage »]

Trois règles pour utiliser ce modèle sans se tromper.

Première règle : le niveau d''autonomie est lié à une tâche, pas à une personne. Thierry est A4 en carrosserie et probablement A1 sur un nouveau logiciel de devis. Vous ne managez pas « Thierry » : vous managez Thierry sur telle tâche.

Deuxième règle : le niveau évolue, et votre style doit évoluer avec lui. L''objectif, c''est de faire monter chacun vers A4 sur le maximum de tâches, et donc de passer progressivement de diriger à déléguer. Un manager qui dirige encore quelqu''un qui est devenu compétent l''infantilise. Un manager qui délègue à quelqu''un qui ne sait pas encore l''abandonne.

Troisième règle : quand vous hésitez, demandez. « Sur ce sujet, tu préfères que je te montre, ou tu vois comment faire ? » Cette question, à elle seule, évite la plupart des erreurs de dosage.

[Titre : « Les deux erreurs les plus fréquentes »]

Les deux erreurs les plus fréquentes sont symétriques.

La première : sur-diriger les compétents. C''est le manager qui explique à un expert comment faire son travail. L''expert le vit comme un manque de confiance, et se désengage. C''est exactement ce que Thierry redoute de Karim.

La seconde : sous-diriger les débutants, par bienveillance ou par manque de temps. On confie une tâche nouvelle en disant « tu verras, c''est facile », et on découvre le résultat trop tard. C''est ce qui est arrivé avec Julien et la coulure de vernis : personne n''a contrôlé un carrossier qui n''était pas encore autonome sur la finition.

[Plan : reprise du cas]

Appliquons à l''atelier Garnier.

Thierry, sur la carrosserie : déléguer. Karim n''a rien à lui apprendre ; il lui fixe le résultat et le délai, et il lui fiche la paix. En revanche, sur les nouvelles règles d''organisation, Thierry est A1 ou A2 : il faudra expliquer, et écouter.

Julien : entraîner. Expliquer à nouveau les points de contrôle de la finition, vérifier avec lui pendant quelques semaines, et surtout valoriser ce qui est bien, parce qu''il est en train de perdre confiance.

Lucas : diriger, franchement. Sur la ponctualité comme sur les tâches : des consignes claires, un contrôle rapproché, sans agressivité mais sans flou.

Nadia : épauler. Elle est autonome en peinture ; ce dont elle a besoin, c''est qu''on l''écoute sur son envie d''évoluer, et qu''on lui confie une responsabilité qui le lui permette.

[Plan rapproché]

Vous voyez le principe : même équipe, même manager, quatre styles différents, parce que quatre situations différentes. Ce n''est pas de l''incohérence, c''est de l''adaptation. Et c''est ce que les gens attendent d''un manager : qu''il les traite selon ce dont ils ont besoin, pas tous pareil.

Dans le podcast qui suit, nous parlerons d''une situation particulière et très fréquente : passer de collègue à manager dans la même équipe.

[Fondu, logo]

---

Sources : Hersey & Blanchard, *Management of Organizational Behavior*, 1969 (rééd. Prentice Hall) ; Blanchard, *Leadership and the One Minute Manager*, 1985 (modèle SLII, terminologie « diriger / entraîner / épauler / déléguer »).
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Type : vidéo avatar · Débit : 140 mots/min · Indications visuelles entre crochets

---

[Plan : avatar, fond clair. Titre : « Le leadership situationnel »]

Dans la leçon précédente, vous avez vu qu''un bon manager change de style selon la situation. Mais selon quoi, exactement ? Comment savoir, face à une personne donnée, sur une tâche donnée, s''il faut diriger, accompagner ou laisser faire ?

À la fin des années 1960, deux chercheurs américains, Paul Hersey et Kenneth Blanchard, ont proposé une réponse simple et robuste, qu''on appelle le leadership situationnel. Elle est enseignée dans le monde entier depuis cinquante ans, et elle tient en une idée : adaptez votre style au niveau d''autonomie de la personne sur la tâche.

[Titre : « Deux ingrédients »]

Le niveau d''autonomie, c''est la combinaison de deux ingrédients.

Le premier, c''est la compétence : est-ce que la personne sait faire cette tâche précise ? Pas « est-elle compétente en général », mais « sait-elle faire cela ». Un excellent carrossier peut être incompétent pour rédiger un devis.

Le second, c''est l''engagement : a-t-elle envie de le faire, et se sent-elle capable ? La motivation et la confiance en soi.

[Schéma : matrice 2×2 — axe horizontal Compétence (faible → forte), axe vertical Engagement (faible → fort). Quatre cases numérotées A1 à A4]

En croisant les deux, on obtient quatre niveaux d''autonomie.

A1 : compétence faible, engagement fort. C''est le débutant enthousiaste. Il ne sait pas encore, mais il a envie. Pensez à Lucas, l''apprenti, sur une tâche nouvelle.

A2 : compétence faible ou moyenne, engagement faible. C''est l''apprenant déçu. Il a essayé, il a vu que c''était plus dur que prévu, il doute. Pensez à Julien après sa deuxième reprise.

A3 : compétence forte, engagement variable. C''est le collaborateur compétent mais prudent : il sait faire, mais il hésite à prendre l''initiative, ou il a un coup de mou. Pensez à Nadia, qui gère seule la cabine mais ne sait pas vers quoi évoluer.

A4 : compétence forte, engagement fort. C''est l''expert autonome. Il sait, il veut, il fait. Pensez à Thierry sur son cœur de métier.

[Titre : « Quatre styles pour quatre niveaux »]

À chaque niveau correspond un style de management, défini par deux dosages : combien je dirige, c''est-à-dire combien j''explique, je cadre, je contrôle ; et combien je soutiens, c''est-à-dire combien j''écoute, j''encourage, je fais participer.

[Schéma : les quatre styles S1 à S4 en face des niveaux A1 à A4]

Style 1, diriger : beaucoup de direction, peu de soutien. Je dis quoi faire, comment, quand ; je montre ; je contrôle de près. C''est ce qu''il faut pour A1, le débutant enthousiaste. Il n''a pas besoin qu''on le motive, il l''est déjà ; il a besoin qu''on lui apprenne.

Style 2, entraîner : beaucoup de direction, beaucoup de soutien. Je continue à cadrer et à expliquer, mais j''écoute ses difficultés, j''encourage, je valorise les progrès. C''est ce qu''il faut pour A2, l''apprenant déçu : il a besoin des deux, du savoir-faire et de la confiance.

Style 3, épauler : peu de direction, beaucoup de soutien. Je ne lui explique plus comment faire, il sait. Mais je l''écoute, je le consulte, je le rassure sur sa capacité à décider. C''est ce qu''il faut pour A3, le compétent prudent.

Style 4, déléguer : peu de direction, peu de soutien. Je fixe le résultat attendu et je laisse faire. Je reste disponible, je fais le point de temps en temps, mais je n''interviens pas. C''est ce qu''il faut pour A4, l''expert autonome.

[Titre : « Trois règles d''usage »]

Trois règles pour utiliser ce modèle sans se tromper.

Première règle : le niveau d''autonomie est lié à une tâche, pas à une personne. Thierry est A4 en carrosserie et probablement A1 sur un nouveau logiciel de devis. Vous ne managez pas « Thierry » : vous managez Thierry sur telle tâche.

Deuxième règle : le niveau évolue, et votre style doit évoluer avec lui. L''objectif, c''est de faire monter chacun vers A4 sur le maximum de tâches, et donc de passer progressivement de diriger à déléguer. Un manager qui dirige encore quelqu''un qui est devenu compétent l''infantilise. Un manager qui délègue à quelqu''un qui ne sait pas encore l''abandonne.

Troisième règle : quand vous hésitez, demandez. « Sur ce sujet, tu préfères que je te montre, ou tu vois comment faire ? » Cette question, à elle seule, évite la plupart des erreurs de dosage.

[Titre : « Les deux erreurs les plus fréquentes »]

Les deux erreurs les plus fréquentes sont symétriques.

La première : sur-diriger les compétents. C''est le manager qui explique à un expert comment faire son travail. L''expert le vit comme un manque de confiance, et se désengage. C''est exactement ce que Thierry redoute de Karim.

La seconde : sous-diriger les débutants, par bienveillance ou par manque de temps. On confie une tâche nouvelle en disant « tu verras, c''est facile », et on découvre le résultat trop tard. C''est ce qui est arrivé avec Julien et la coulure de vernis : personne n''a contrôlé un carrossier qui n''était pas encore autonome sur la finition.

[Plan : reprise du cas]

Appliquons à l''atelier Garnier.

Thierry, sur la carrosserie : déléguer. Karim n''a rien à lui apprendre ; il lui fixe le résultat et le délai, et il lui fiche la paix. En revanche, sur les nouvelles règles d''organisation, Thierry est A1 ou A2 : il faudra expliquer, et écouter.

Julien : entraîner. Expliquer à nouveau les points de contrôle de la finition, vérifier avec lui pendant quelques semaines, et surtout valoriser ce qui est bien, parce qu''il est en train de perdre confiance.

Lucas : diriger, franchement. Sur la ponctualité comme sur les tâches : des consignes claires, un contrôle rapproché, sans agressivité mais sans flou.

Nadia : épauler. Elle est autonome en peinture ; ce dont elle a besoin, c''est qu''on l''écoute sur son envie d''évoluer, et qu''on lui confie une responsabilité qui le lui permette.

[Plan rapproché]

Vous voyez le principe : même équipe, même manager, quatre styles différents, parce que quatre situations différentes. Ce n''est pas de l''incohérence, c''est de l''adaptation. Et c''est ce que les gens attendent d''un manager : qu''il les traite selon ce dont ils ont besoin, pas tous pareil.

Dans le podcast qui suit, nous parlerons d''une situation particulière et très fréquente : passer de collègue à manager dans la même équipe.

[Fondu, logo]

---

Sources : Hersey & Blanchard, *Management of Organizational Behavior*, 1969 (rééd. Prentice Hall) ; Blanchard, *Leadership and the One Minute Manager*, 1985 (modèle SLII, terminologie « diriger / entraîner / épauler / déléguer »).
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 2 and l.ordre = 4;
  n := n + 1;

  -- 1.5-podcast-de-collegue-a-manager.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Format : conversation à deux voix. **CLAIRE** = animatrice IDEAFORMA. **DAVID** = manager invité, responsable d''un atelier de 12 personnes dans une PME industrielle, promu en interne il y a quatre ans (personnage fictif inspiré de situations réelles). Débit : 150 mots/min. Voix distinctes pour la synthèse (ElevenLabs / NotebookLM).

---

**CLAIRE** — Bonjour et bienvenue dans ce podcast IDEAFORMA. Aujourd''hui, on parle d''un moment que beaucoup d''entre vous vivent ou vont vivre : le jour où l''on devient le manager de ses anciens collègues. Pour en parler, j''ai avec moi David, qui est passé par là. David, bonjour.

**DAVID** — Bonjour Claire.

**CLAIRE** — Vous encadrez aujourd''hui une équipe de douze personnes. Racontez-nous comment ça a commencé.

**DAVID** — J''étais technicien de maintenance dans l''atelier depuis sept ans. Mon chef est parti à la retraite, et le directeur m''a proposé le poste. J''ai dit oui en une soirée. Je pensais que ce serait la même chose avec un peu plus de responsabilités. Ça n''avait rien à voir.

**CLAIRE** — Qu''est-ce qui a changé, concrètement, le premier jour ?

**DAVID** — Le premier jour, rien. Les gens m''ont félicité. Le problème est arrivé la deuxième semaine, quand j''ai dû demander à un collègue, avec qui je déjeunais tous les jours depuis des années, de refaire un travail qui n''était pas conforme. Il m''a regardé et il m''a dit : « Ah, c''est comme ça maintenant ? » Et là j''ai compris que la relation avait changé, que je le veuille ou non.

**CLAIRE** — C''est ce qu''on appelle la question de la légitimité. Vous aviez été nommé, donc légitime sur le papier. Mais visiblement ça ne suffisait pas.

**DAVID** — Non. La nomination vous donne le droit de décider. Elle ne vous donne pas le fait que les gens l''acceptent. Ça, il faut le construire. Et le piège, quand on est promu en interne, c''est qu''on croit que l''ancienne relation va faire le travail à notre place. « Ils me connaissent, ils m''aiment bien, ça va passer. » En réalité, c''est presque l''inverse : ils vous connaissent comme collègue, donc ils ont du mal à vous voir comme manager.

**CLAIRE** — Il y a une expression qu''on entend souvent : trouver la « bonne distance ». Vous, vous l''avez trouvée comment ?

**DAVID** — Par erreurs, honnêtement. Ma première erreur, ça a été de ne rien changer. Je continuais à déjeuner avec les mêmes, à plaisanter sur le chef comme avant, sauf que le chef c''était moi. Au bout d''un mois, j''ai réalisé que les trois personnes avec qui je déjeunais étaient perçues comme mes protégés par les neuf autres. Alors que je n''avais rien décidé.

**CLAIRE** — Donc la proximité avec certains devient un problème d''équité pour les autres.

**DAVID** — Exactement. Et ça, on ne le voit pas de l''intérieur. Il a fallu qu''une collègue me le dise. Ensuite, deuxième erreur, j''ai surcorrigé. Je me suis mis à manger seul dans mon bureau, à vouvoyer les gens. Ridicule. Ils ont cru que la promotion m''était montée à la tête.

**CLAIRE** — Et la bonne distance, finalement ?

**DAVID** — Ce que j''ai compris, c''est que la distance, ce n''est pas une question de tutoiement ou de pause-café. C''est une question de rôle. Je peux déjeuner avec l''équipe, plaisanter, être proche. Mais quand il s''agit du travail, je tiens mon rôle : je décide, je fais des retours, je tranche, et je le fais pareil avec tout le monde. Y compris avec mes anciens amis. Surtout avec mes anciens amis, en fait.

**CLAIRE** — C''est ça qui construit la légitimité : la constance.

**DAVID** — La constance et l''équité. Les gens ne vous suivent pas parce que vous êtes sympa. Ils vous suivent parce qu''ils savent à quoi s''attendre avec vous. Ce que vous avez dit lundi, vous le tenez vendredi. Ce que vous demandez à l''un, vous le demandez à l''autre. C''est presque ennuyeux à dire, mais c''est ça.

**CLAIRE** — Parlons de la situation la plus délicate : l''ancien collègue qui voulait le poste, ou qui pense qu''il le méritait plus que vous. Vous avez eu ça ?

**DAVID** — Oui. Un technicien plus ancien que moi, très compétent, qui ne l''a jamais dit clairement mais qui le faisait sentir. Des remarques devant les autres, des « moi je ferais pas comme ça », des silences dans les réunions.

**CLAIRE** — Et qu''est-ce que vous avez fait ?

**DAVID** — D''abord, pendant deux mois, rien. J''espérais que ça passe. Ça ne passe pas. Ça s''installe, et les autres regardent comment vous réagissez. Puis j''ai fait ce que j''aurais dû faire dès le début : je l''ai pris en entretien, seul à seul.

**CLAIRE** — Vous lui avez dit quoi ?

**DAVID** — Trois choses. La première : que je savais qu''il avait plus d''expérience que moi sur la partie technique, et que j''avais besoin de lui pour ça. C''était vrai, ce n''était pas de la flatterie. La deuxième : que j''avais remarqué les remarques devant l''équipe, avec deux exemples précis, et que ça ne pouvait pas continuer, parce que ça mettait tout le monde mal à l''aise, lui compris. La troisième : qu''il avait le droit de ne pas être d''accord avec mes décisions, et que je voulais qu''il me le dise, mais en entretien, pas devant les autres.

**CLAIRE** — Et il a réagi comment ?

**DAVID** — Il a d''abord nié. Puis il a dit que de toute façon il n''avait pas voulu du poste. Et à la fin, il m''a dit : « Bon, on fait comment pour la ligne 3 ? » C''est-à-dire qu''il est revenu au travail. Ce n''est pas devenu mon meilleur ami. Mais les remarques publiques ont cessé, et deux ans plus tard c''est lui qui forme les nouveaux.

**CLAIRE** — Ce que je retiens, c''est que vous ne l''avez pas affronté, vous ne l''avez pas ignoré non plus. Vous lui avez donné une place.

**DAVID** — C''est exactement ça. Les gens qui contestent votre légitimité ont souvent besoin qu''on reconnaisse la leur. Un ancien qui râle, c''est souvent quelqu''un qui a peur de ne plus compter.

**CLAIRE** — Passons à un autre point délicat : la relation avec la hiérarchie. Quand on est promu en interne, on a souvent l''impression d''être coincé entre l''équipe et la direction.

**DAVID** — C''est le cas. Et il faut l''accepter : c''est le poste. Le manager de proximité, c''est celui qui traduit dans les deux sens. Vers le bas, il explique les décisions de la direction, même celles qu''il n''a pas choisies. Vers le haut, il fait remonter ce que l''équipe vit, même ce que la direction n''a pas envie d''entendre.

**CLAIRE** — Le piège, c''est de choisir un camp.

**DAVID** — Oui. Il y a le manager qui devient le porte-parole de la direction : « c''est comme ça, c''est décidé en haut, je n''y peux rien ». L''équipe le lâche. Et il y a le manager qui devient le syndicaliste de son équipe : « moi je suis avec vous, c''est eux le problème ». La direction ne lui fait plus confiance, et il ne peut plus rien obtenir pour son équipe. Dans les deux cas, il a perdu.

**CLAIRE** — Alors comment on fait ?

**DAVID** — Une règle simple : je défends mon équipe devant la direction, et je défends les décisions de la direction devant mon équipe. Quand je ne suis pas d''accord avec une décision, je le dis à mon directeur, en entretien, avec des arguments. Une fois que c''est tranché, je porte la décision devant l''équipe. Je peux dire « j''ai exprimé des réserves », mais pas « je suis contre ». Ce serait me défausser.

**CLAIRE** — On a évoqué dans une leçon précédente le cas de Karim, promu chef d''atelier dans une carrosserie, et qui découvre que la secrétaire continue à donner les priorités directement aux carrossiers, et que son patron intervient encore tous les jours. Qu''est-ce que vous lui diriez ?

**DAVID** — Qu''il a un problème de clarification avant d''avoir un problème de légitimité. Personne n''a dit à l''équipe ce que le chef d''atelier décide et ce qu''il ne décide pas. Donc chacun continue comme avant, et ce n''est même pas de la mauvaise volonté. Je lui dirais d''aller voir son patron avec une feuille : voilà ce que je propose de décider, voilà comment les priorités circulent, voilà ce que je vous remonte et à quel rythme. Et de demander que ce soit annoncé à l''équipe par le patron lui-même.

**CLAIRE** — Pourquoi par le patron ?

**DAVID** — Parce que la légitimité, au début, elle vient d''en haut. Si Karim annonce lui-même « désormais c''est moi qui fixe les priorités », ça ressemble à une prise de pouvoir. Si Michel Garnier le dit devant l''équipe, ça devient une organisation. Ensuite, à Karim de la faire vivre.

**CLAIRE** — On arrive vers la fin. Si vous deviez donner trois conseils à quelqu''un qui devient manager de ses collègues la semaine prochaine ?

**DAVID** — Premier conseil : parlez-en, individuellement, avec chaque personne de l''équipe, dans les quinze premiers jours. Pas une grande réunion, des entretiens de vingt minutes. « Comment tu vois les choses, qu''est-ce qui marche, qu''est-ce qui ne marche pas, qu''est-ce que tu attends de moi. » Vous apprenez énormément, et vous montrez que le rôle a changé sans avoir à le dire.

**CLAIRE** — Deuxième ?

**DAVID** — Ne changez rien de structurel pendant un mois, mais réglez immédiatement ce qui est inacceptable. Les retards, les manques de sécurité, les manques de respect. Si vous laissez passer ça au début, vous avez perdu, parce que tout le monde regarde.

**CLAIRE** — Et le troisième ?

**DAVID** — Acceptez de ne plus être « l''un d''entre eux ». Ce n''est pas une perte. Vous n''êtes plus un collègue ; vous êtes la personne qui va leur permettre de bien travailler. Si vous faites bien ce travail, vous aurez quelque chose de mieux que l''amitié : la confiance.

**CLAIRE** — Merci David. Pour résumer : la légitimité ne vient pas de la nomination mais de la constance et de l''équité ; les contestations se traitent en entretien, en donnant une place ; le manager traduit dans les deux sens sans choisir de camp ; et les quinze premiers jours servent à écouter chacun.

**DAVID** — Et à régler tout de suite ce qui est inacceptable.

**CLAIRE** — Et à régler tout de suite ce qui est inacceptable. À bientôt dans la suite du module.

---

Repères théoriques mobilisés : Linda Hill, *Becoming a Manager* (2003), sur la découverte du rôle par les nouveaux managers ; Mintzberg (1973), rôles d''agent de liaison et de porte-parole ; Kotter (1990), management vs leadership.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Format : conversation à deux voix. **CLAIRE** = animatrice IDEAFORMA. **DAVID** = manager invité, responsable d''un atelier de 12 personnes dans une PME industrielle, promu en interne il y a quatre ans (personnage fictif inspiré de situations réelles). Débit : 150 mots/min. Voix distinctes pour la synthèse (ElevenLabs / NotebookLM).

---

**CLAIRE** — Bonjour et bienvenue dans ce podcast IDEAFORMA. Aujourd''hui, on parle d''un moment que beaucoup d''entre vous vivent ou vont vivre : le jour où l''on devient le manager de ses anciens collègues. Pour en parler, j''ai avec moi David, qui est passé par là. David, bonjour.

**DAVID** — Bonjour Claire.

**CLAIRE** — Vous encadrez aujourd''hui une équipe de douze personnes. Racontez-nous comment ça a commencé.

**DAVID** — J''étais technicien de maintenance dans l''atelier depuis sept ans. Mon chef est parti à la retraite, et le directeur m''a proposé le poste. J''ai dit oui en une soirée. Je pensais que ce serait la même chose avec un peu plus de responsabilités. Ça n''avait rien à voir.

**CLAIRE** — Qu''est-ce qui a changé, concrètement, le premier jour ?

**DAVID** — Le premier jour, rien. Les gens m''ont félicité. Le problème est arrivé la deuxième semaine, quand j''ai dû demander à un collègue, avec qui je déjeunais tous les jours depuis des années, de refaire un travail qui n''était pas conforme. Il m''a regardé et il m''a dit : « Ah, c''est comme ça maintenant ? » Et là j''ai compris que la relation avait changé, que je le veuille ou non.

**CLAIRE** — C''est ce qu''on appelle la question de la légitimité. Vous aviez été nommé, donc légitime sur le papier. Mais visiblement ça ne suffisait pas.

**DAVID** — Non. La nomination vous donne le droit de décider. Elle ne vous donne pas le fait que les gens l''acceptent. Ça, il faut le construire. Et le piège, quand on est promu en interne, c''est qu''on croit que l''ancienne relation va faire le travail à notre place. « Ils me connaissent, ils m''aiment bien, ça va passer. » En réalité, c''est presque l''inverse : ils vous connaissent comme collègue, donc ils ont du mal à vous voir comme manager.

**CLAIRE** — Il y a une expression qu''on entend souvent : trouver la « bonne distance ». Vous, vous l''avez trouvée comment ?

**DAVID** — Par erreurs, honnêtement. Ma première erreur, ça a été de ne rien changer. Je continuais à déjeuner avec les mêmes, à plaisanter sur le chef comme avant, sauf que le chef c''était moi. Au bout d''un mois, j''ai réalisé que les trois personnes avec qui je déjeunais étaient perçues comme mes protégés par les neuf autres. Alors que je n''avais rien décidé.

**CLAIRE** — Donc la proximité avec certains devient un problème d''équité pour les autres.

**DAVID** — Exactement. Et ça, on ne le voit pas de l''intérieur. Il a fallu qu''une collègue me le dise. Ensuite, deuxième erreur, j''ai surcorrigé. Je me suis mis à manger seul dans mon bureau, à vouvoyer les gens. Ridicule. Ils ont cru que la promotion m''était montée à la tête.

**CLAIRE** — Et la bonne distance, finalement ?

**DAVID** — Ce que j''ai compris, c''est que la distance, ce n''est pas une question de tutoiement ou de pause-café. C''est une question de rôle. Je peux déjeuner avec l''équipe, plaisanter, être proche. Mais quand il s''agit du travail, je tiens mon rôle : je décide, je fais des retours, je tranche, et je le fais pareil avec tout le monde. Y compris avec mes anciens amis. Surtout avec mes anciens amis, en fait.

**CLAIRE** — C''est ça qui construit la légitimité : la constance.

**DAVID** — La constance et l''équité. Les gens ne vous suivent pas parce que vous êtes sympa. Ils vous suivent parce qu''ils savent à quoi s''attendre avec vous. Ce que vous avez dit lundi, vous le tenez vendredi. Ce que vous demandez à l''un, vous le demandez à l''autre. C''est presque ennuyeux à dire, mais c''est ça.

**CLAIRE** — Parlons de la situation la plus délicate : l''ancien collègue qui voulait le poste, ou qui pense qu''il le méritait plus que vous. Vous avez eu ça ?

**DAVID** — Oui. Un technicien plus ancien que moi, très compétent, qui ne l''a jamais dit clairement mais qui le faisait sentir. Des remarques devant les autres, des « moi je ferais pas comme ça », des silences dans les réunions.

**CLAIRE** — Et qu''est-ce que vous avez fait ?

**DAVID** — D''abord, pendant deux mois, rien. J''espérais que ça passe. Ça ne passe pas. Ça s''installe, et les autres regardent comment vous réagissez. Puis j''ai fait ce que j''aurais dû faire dès le début : je l''ai pris en entretien, seul à seul.

**CLAIRE** — Vous lui avez dit quoi ?

**DAVID** — Trois choses. La première : que je savais qu''il avait plus d''expérience que moi sur la partie technique, et que j''avais besoin de lui pour ça. C''était vrai, ce n''était pas de la flatterie. La deuxième : que j''avais remarqué les remarques devant l''équipe, avec deux exemples précis, et que ça ne pouvait pas continuer, parce que ça mettait tout le monde mal à l''aise, lui compris. La troisième : qu''il avait le droit de ne pas être d''accord avec mes décisions, et que je voulais qu''il me le dise, mais en entretien, pas devant les autres.

**CLAIRE** — Et il a réagi comment ?

**DAVID** — Il a d''abord nié. Puis il a dit que de toute façon il n''avait pas voulu du poste. Et à la fin, il m''a dit : « Bon, on fait comment pour la ligne 3 ? » C''est-à-dire qu''il est revenu au travail. Ce n''est pas devenu mon meilleur ami. Mais les remarques publiques ont cessé, et deux ans plus tard c''est lui qui forme les nouveaux.

**CLAIRE** — Ce que je retiens, c''est que vous ne l''avez pas affronté, vous ne l''avez pas ignoré non plus. Vous lui avez donné une place.

**DAVID** — C''est exactement ça. Les gens qui contestent votre légitimité ont souvent besoin qu''on reconnaisse la leur. Un ancien qui râle, c''est souvent quelqu''un qui a peur de ne plus compter.

**CLAIRE** — Passons à un autre point délicat : la relation avec la hiérarchie. Quand on est promu en interne, on a souvent l''impression d''être coincé entre l''équipe et la direction.

**DAVID** — C''est le cas. Et il faut l''accepter : c''est le poste. Le manager de proximité, c''est celui qui traduit dans les deux sens. Vers le bas, il explique les décisions de la direction, même celles qu''il n''a pas choisies. Vers le haut, il fait remonter ce que l''équipe vit, même ce que la direction n''a pas envie d''entendre.

**CLAIRE** — Le piège, c''est de choisir un camp.

**DAVID** — Oui. Il y a le manager qui devient le porte-parole de la direction : « c''est comme ça, c''est décidé en haut, je n''y peux rien ». L''équipe le lâche. Et il y a le manager qui devient le syndicaliste de son équipe : « moi je suis avec vous, c''est eux le problème ». La direction ne lui fait plus confiance, et il ne peut plus rien obtenir pour son équipe. Dans les deux cas, il a perdu.

**CLAIRE** — Alors comment on fait ?

**DAVID** — Une règle simple : je défends mon équipe devant la direction, et je défends les décisions de la direction devant mon équipe. Quand je ne suis pas d''accord avec une décision, je le dis à mon directeur, en entretien, avec des arguments. Une fois que c''est tranché, je porte la décision devant l''équipe. Je peux dire « j''ai exprimé des réserves », mais pas « je suis contre ». Ce serait me défausser.

**CLAIRE** — On a évoqué dans une leçon précédente le cas de Karim, promu chef d''atelier dans une carrosserie, et qui découvre que la secrétaire continue à donner les priorités directement aux carrossiers, et que son patron intervient encore tous les jours. Qu''est-ce que vous lui diriez ?

**DAVID** — Qu''il a un problème de clarification avant d''avoir un problème de légitimité. Personne n''a dit à l''équipe ce que le chef d''atelier décide et ce qu''il ne décide pas. Donc chacun continue comme avant, et ce n''est même pas de la mauvaise volonté. Je lui dirais d''aller voir son patron avec une feuille : voilà ce que je propose de décider, voilà comment les priorités circulent, voilà ce que je vous remonte et à quel rythme. Et de demander que ce soit annoncé à l''équipe par le patron lui-même.

**CLAIRE** — Pourquoi par le patron ?

**DAVID** — Parce que la légitimité, au début, elle vient d''en haut. Si Karim annonce lui-même « désormais c''est moi qui fixe les priorités », ça ressemble à une prise de pouvoir. Si Michel Garnier le dit devant l''équipe, ça devient une organisation. Ensuite, à Karim de la faire vivre.

**CLAIRE** — On arrive vers la fin. Si vous deviez donner trois conseils à quelqu''un qui devient manager de ses collègues la semaine prochaine ?

**DAVID** — Premier conseil : parlez-en, individuellement, avec chaque personne de l''équipe, dans les quinze premiers jours. Pas une grande réunion, des entretiens de vingt minutes. « Comment tu vois les choses, qu''est-ce qui marche, qu''est-ce qui ne marche pas, qu''est-ce que tu attends de moi. » Vous apprenez énormément, et vous montrez que le rôle a changé sans avoir à le dire.

**CLAIRE** — Deuxième ?

**DAVID** — Ne changez rien de structurel pendant un mois, mais réglez immédiatement ce qui est inacceptable. Les retards, les manques de sécurité, les manques de respect. Si vous laissez passer ça au début, vous avez perdu, parce que tout le monde regarde.

**CLAIRE** — Et le troisième ?

**DAVID** — Acceptez de ne plus être « l''un d''entre eux ». Ce n''est pas une perte. Vous n''êtes plus un collègue ; vous êtes la personne qui va leur permettre de bien travailler. Si vous faites bien ce travail, vous aurez quelque chose de mieux que l''amitié : la confiance.

**CLAIRE** — Merci David. Pour résumer : la légitimité ne vient pas de la nomination mais de la constance et de l''équité ; les contestations se traitent en entretien, en donnant une place ; le manager traduit dans les deux sens sans choisir de camp ; et les quinze premiers jours servent à écouter chacun.

**DAVID** — Et à régler tout de suite ce qui est inacceptable.

**CLAIRE** — Et à régler tout de suite ce qui est inacceptable. À bientôt dans la suite du module.

---

Repères théoriques mobilisés : Linda Hill, *Becoming a Manager* (2003), sur la découverte du rôle par les nouveaux managers ; Mintzberg (1973), rôles d''agent de liaison et de porte-parole ; Kotter (1990), management vs leadership.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 2 and l.ordre = 5;
  n := n + 1;

  -- 1.6-responsabilites-legales.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Devenir manager, ce n''est pas seulement changer de fonction : c''est engager sa responsabilité. En droit français, la plupart des obligations pèsent sur l''employeur, c''est-à-dire l''entreprise et son dirigeant. Mais le manager de proximité est celui qui les applique au quotidien, et il peut, dans certains cas, être personnellement mis en cause. Cette leçon décrit les six domaines que tout manager doit connaître.

Avertissement : cette leçon donne les repères essentiels, à jour à la date de rédaction (septembre 2026). Elle ne remplace ni la convention collective de votre secteur, ni le règlement intérieur de votre entreprise, ni l''avis d''un juriste sur une situation précise. En cas de doute, la bonne réaction est toujours la même : alerter votre hiérarchie ou le service RH, par écrit.

## 1. La santé et la sécurité

C''est l''obligation la plus lourde. L''article L4121-1 du Code du travail impose à l''employeur de « prendre les mesures nécessaires pour assurer la sécurité et protéger la santé physique et mentale des travailleurs ». Ces mesures comprennent la prévention des risques, l''information et la formation, et une organisation et des moyens adaptés. L''article L4121-2 fixe les principes de prévention : éviter les risques, les évaluer, les combattre à la source, adapter le travail à la personne, donner la priorité à la protection collective, donner les instructions appropriées.

La santé mentale est explicitement incluse : les risques psychosociaux (stress, harcèlement, violence, épuisement) relèvent de la même obligation que les risques physiques.

Ce que cela signifie pour vous : vous êtes le relais de cette obligation dans votre équipe. Vous devez faire respecter les consignes de sécurité, arrêter un travail dangereux, signaler un risque que vous constatez, et ne jamais demander à quelqu''un d''accomplir une tâche pour laquelle il n''est ni formé ni équipé. À l''atelier Garnier, faire porter à Fatou une charge de plus de dix kilos malgré sa restriction médicale serait une faute.

Chaque salarié a de son côté une obligation de prendre soin de sa sécurité et de celle des autres (L4122-1), et un droit de retrait s''il a un motif raisonnable de penser qu''une situation présente un danger grave et imminent (L4131-1). Un manager ne peut ni sanctionner ni retenir sur salaire un salarié qui a exercé ce droit de manière légitime.

Le point clé sur votre responsabilité personnelle : la délégation de pouvoirs. Dans une entreprise, le dirigeant peut déléguer sa responsabilité pénale en matière de sécurité à un salarié, à trois conditions posées par la jurisprudence : que ce salarié ait la compétence, l''autorité et les moyens nécessaires. Si vous recevez une délégation de pouvoirs écrite, vous pouvez être poursuivi personnellement en cas d''accident lié à un manquement. Si on vous demande d''en signer une, lisez-la, vérifiez que vous avez réellement l''autorité et les moyens qu''elle suppose, et demandez la formation correspondante.

## 2. Le harcèlement

Le harcèlement moral est défini à l''article L1152-1 : des agissements répétés qui ont pour objet ou pour effet une dégradation des conditions de travail susceptible de porter atteinte aux droits et à la dignité, d''altérer la santé physique ou mentale ou de compromettre l''avenir professionnel. Le harcèlement sexuel est défini à l''article L1153-1. Les deux sont aussi des délits pénaux (articles 222-33-2 et 222-33 du Code pénal), punis jusqu''à deux ans d''emprisonnement et 30 000 euros d''amende.

L''employeur a l''obligation de prévenir le harcèlement (L1152-4 et L1153-5), et la jurisprudence lui impose d''agir dès qu''il est informé de faits susceptibles d''en constituer.

Deux points pour le manager.

D''une part, vous pouvez être l''auteur. Le harcèlement moral managérial existe : critiques systématiques, humiliations en public, objectifs inatteignables, mise à l''écart, surveillance excessive. Un « management par la pression » qui se répète peut être qualifié de harcèlement, même sans intention de nuire : c''est l''effet qui compte. Engueuler Julien devant toute l''équipe, comme l''a fait Michel Garnier, n''est pas du harcèlement s''il s''agit d''un fait isolé ; si cela devient une habitude, cela peut le devenir.

D''autre part, vous êtes un maillon de la prévention. Si un salarié vous signale des faits de harcèlement, ou si vous en êtes témoin, vous devez agir : prendre le signalement au sérieux, ne pas minimiser, ne pas enquêter seul, et transmettre sans délai à votre hiérarchie ou aux RH. Rester inactif engage la responsabilité de l''entreprise, et la vôtre. Notez qu''aucun salarié ne peut être sanctionné pour avoir signalé ou témoigné de faits de harcèlement (L1152-2).

## 3. La discrimination et l''égalité de traitement

L''article L1132-1 interdit toute discrimination, directe ou indirecte, fondée sur une liste de critères : origine, sexe, mœurs, orientation sexuelle, identité de genre, âge, situation de famille, grossesse, caractéristiques génétiques, appartenance vraie ou supposée à une ethnie, une nation ou une prétendue race, opinions politiques, activités syndicales, convictions religieuses, apparence physique, nom de famille, lieu de résidence, domiciliation bancaire, état de santé, perte d''autonomie, handicap, capacité à s''exprimer dans une langue autre que le français, et quelques autres. La discrimination est également un délit (Code pénal, articles 225-1 et suivants).

Pour le manager, cela concerne toutes les décisions du quotidien : répartition des tâches, attribution des primes, choix des personnes formées, horaires, évaluation. Une décision doit toujours pouvoir être justifiée par des éléments objectifs liés au travail. En cas de litige, c''est à l''employeur de prouver que sa décision repose sur des éléments objectifs étrangers à toute discrimination (L1134-1) : d''où l''importance de tracer les raisons de vos décisions.

Le handicap fait l''objet d''une obligation supplémentaire : l''employeur doit prendre les « mesures appropriées » pour permettre à un travailleur handicapé d''accéder à un emploi, de l''exercer et d''y progresser (L5213-6). Le refus de ces mesures peut constituer une discrimination. Nous y consacrerons une leçon complète au module 2.

## 4. Le temps de travail et le droit à la déconnexion

Le manager est souvent celui qui organise les horaires, valide les heures supplémentaires et sollicite les salariés en dehors du travail. Il doit connaître les limites légales, sous réserve des dispositions de la convention collective :

- durée légale : 35 heures par semaine (L3121-27) ; au-delà, heures supplémentaires majorées ;
- durée maximale : 10 heures par jour (L3121-18), 48 heures sur une semaine et 44 heures en moyenne sur 12 semaines (L3121-20 et L3121-22) ;
- repos : 11 heures consécutives entre deux journées (L3131-1), 35 heures consécutives par semaine (L3132-2), 20 minutes de pause dès 6 heures de travail (L3121-16).

Le droit à la déconnexion (L2242-17) impose aux entreprises dotées de délégués syndicaux de négocier les modalités d''exercice de ce droit, et à toutes les entreprises de respecter les temps de repos. Concrètement : un manager ne doit pas attendre de réponse à un message envoyé le soir ou le week-end, et doit lui-même s''abstenir de solliciter son équipe en dehors des horaires, sauf urgence réelle et prévue.

Enfin, l''employeur doit décompter le temps de travail des salariés (L3171-2 et suivants). Un manager qui « ferme les yeux » sur des heures non déclarées expose l''entreprise à des rappels de salaire et à des sanctions, et le salarié à un risque pour sa santé. Karim, qui gère l''atelier le soir sans que ces heures soient comptées, est lui-même dans cette situation.

## 5. Le pouvoir disciplinaire et ses limites

Sanctionner un salarié (avertissement, mise à pied, mutation, licenciement) est un pouvoir de l''employeur, encadré par une procédure (L1331-1 et suivants, L1332-1 à L1332-3) : convocation, entretien préalable pour toute sanction ayant une incidence sur la présence, la fonction ou la rémunération, délai de réflexion, notification écrite et motivée. Une sanction ne peut être prononcée plus de deux mois après que l''employeur a eu connaissance des faits (L1332-4). Les sanctions pécuniaires sont interdites (L1331-2).

Ce que cela signifie pour le manager de proximité : sauf délégation expresse, vous ne prononcez pas de sanction. Votre rôle est en amont : recadrer, tracer les faits (date, nature, témoins, ce qui a été dit), alerter la hiérarchie si les faits se répètent. Un recadrage oral n''est pas une sanction disciplinaire ; un « avertissement » écrit, même informel, peut en être une et déclencher la procédure. Le module 5 traite en détail la différence entre recadrage et sanction.

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

Les interlocuteurs externes que vous pouvez recommander à un salarié : le médecin du travail (tenu au secret médical, que le salarié peut solliciter à tout moment), le CSE quand il existe, l''inspection du travail, le Défenseur des droits pour les discriminations.

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

- Code du travail : L4121-1 à L4121-5, L4122-1, L4131-1 ; L1152-1 à L1152-4, L1153-1 à L1153-5 ; L1132-1, L1134-1, L5213-6 ; L3121-16, L3121-18, L3121-20, L3121-22, L3121-27, L3131-1, L3132-2, L3171-2, L2242-17 ; L1331-1 à L1332-4 ; L1121-1, L1222-4 — legifrance.gouv.fr.
- Code pénal : articles 222-33, 222-33-2, 225-1 à 225-4.
- Cour de cassation, chambre criminelle, 11 mars 1993 (conditions de validité de la délégation de pouvoirs) ; chambre sociale, 25 novembre 2015, n° 14-24.444 (portée de l''obligation de sécurité).
- INRS, « Managers : agissez pour prévenir les risques psychosociaux », inrs.fr.
- Ministère du Travail, « Harcèlement moral » et « Harcèlement sexuel », fiches pratiques, travail-emploi.gouv.fr.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Devenir manager, ce n''est pas seulement changer de fonction : c''est engager sa responsabilité. En droit français, la plupart des obligations pèsent sur l''employeur, c''est-à-dire l''entreprise et son dirigeant. Mais le manager de proximité est celui qui les applique au quotidien, et il peut, dans certains cas, être personnellement mis en cause. Cette leçon décrit les six domaines que tout manager doit connaître.

Avertissement : cette leçon donne les repères essentiels, à jour à la date de rédaction (septembre 2026). Elle ne remplace ni la convention collective de votre secteur, ni le règlement intérieur de votre entreprise, ni l''avis d''un juriste sur une situation précise. En cas de doute, la bonne réaction est toujours la même : alerter votre hiérarchie ou le service RH, par écrit.

## 1. La santé et la sécurité

C''est l''obligation la plus lourde. L''article L4121-1 du Code du travail impose à l''employeur de « prendre les mesures nécessaires pour assurer la sécurité et protéger la santé physique et mentale des travailleurs ». Ces mesures comprennent la prévention des risques, l''information et la formation, et une organisation et des moyens adaptés. L''article L4121-2 fixe les principes de prévention : éviter les risques, les évaluer, les combattre à la source, adapter le travail à la personne, donner la priorité à la protection collective, donner les instructions appropriées.

La santé mentale est explicitement incluse : les risques psychosociaux (stress, harcèlement, violence, épuisement) relèvent de la même obligation que les risques physiques.

Ce que cela signifie pour vous : vous êtes le relais de cette obligation dans votre équipe. Vous devez faire respecter les consignes de sécurité, arrêter un travail dangereux, signaler un risque que vous constatez, et ne jamais demander à quelqu''un d''accomplir une tâche pour laquelle il n''est ni formé ni équipé. À l''atelier Garnier, faire porter à Fatou une charge de plus de dix kilos malgré sa restriction médicale serait une faute.

Chaque salarié a de son côté une obligation de prendre soin de sa sécurité et de celle des autres (L4122-1), et un droit de retrait s''il a un motif raisonnable de penser qu''une situation présente un danger grave et imminent (L4131-1). Un manager ne peut ni sanctionner ni retenir sur salaire un salarié qui a exercé ce droit de manière légitime.

Le point clé sur votre responsabilité personnelle : la délégation de pouvoirs. Dans une entreprise, le dirigeant peut déléguer sa responsabilité pénale en matière de sécurité à un salarié, à trois conditions posées par la jurisprudence : que ce salarié ait la compétence, l''autorité et les moyens nécessaires. Si vous recevez une délégation de pouvoirs écrite, vous pouvez être poursuivi personnellement en cas d''accident lié à un manquement. Si on vous demande d''en signer une, lisez-la, vérifiez que vous avez réellement l''autorité et les moyens qu''elle suppose, et demandez la formation correspondante.

## 2. Le harcèlement

Le harcèlement moral est défini à l''article L1152-1 : des agissements répétés qui ont pour objet ou pour effet une dégradation des conditions de travail susceptible de porter atteinte aux droits et à la dignité, d''altérer la santé physique ou mentale ou de compromettre l''avenir professionnel. Le harcèlement sexuel est défini à l''article L1153-1. Les deux sont aussi des délits pénaux (articles 222-33-2 et 222-33 du Code pénal), punis jusqu''à deux ans d''emprisonnement et 30 000 euros d''amende.

L''employeur a l''obligation de prévenir le harcèlement (L1152-4 et L1153-5), et la jurisprudence lui impose d''agir dès qu''il est informé de faits susceptibles d''en constituer.

Deux points pour le manager.

D''une part, vous pouvez être l''auteur. Le harcèlement moral managérial existe : critiques systématiques, humiliations en public, objectifs inatteignables, mise à l''écart, surveillance excessive. Un « management par la pression » qui se répète peut être qualifié de harcèlement, même sans intention de nuire : c''est l''effet qui compte. Engueuler Julien devant toute l''équipe, comme l''a fait Michel Garnier, n''est pas du harcèlement s''il s''agit d''un fait isolé ; si cela devient une habitude, cela peut le devenir.

D''autre part, vous êtes un maillon de la prévention. Si un salarié vous signale des faits de harcèlement, ou si vous en êtes témoin, vous devez agir : prendre le signalement au sérieux, ne pas minimiser, ne pas enquêter seul, et transmettre sans délai à votre hiérarchie ou aux RH. Rester inactif engage la responsabilité de l''entreprise, et la vôtre. Notez qu''aucun salarié ne peut être sanctionné pour avoir signalé ou témoigné de faits de harcèlement (L1152-2).

## 3. La discrimination et l''égalité de traitement

L''article L1132-1 interdit toute discrimination, directe ou indirecte, fondée sur une liste de critères : origine, sexe, mœurs, orientation sexuelle, identité de genre, âge, situation de famille, grossesse, caractéristiques génétiques, appartenance vraie ou supposée à une ethnie, une nation ou une prétendue race, opinions politiques, activités syndicales, convictions religieuses, apparence physique, nom de famille, lieu de résidence, domiciliation bancaire, état de santé, perte d''autonomie, handicap, capacité à s''exprimer dans une langue autre que le français, et quelques autres. La discrimination est également un délit (Code pénal, articles 225-1 et suivants).

Pour le manager, cela concerne toutes les décisions du quotidien : répartition des tâches, attribution des primes, choix des personnes formées, horaires, évaluation. Une décision doit toujours pouvoir être justifiée par des éléments objectifs liés au travail. En cas de litige, c''est à l''employeur de prouver que sa décision repose sur des éléments objectifs étrangers à toute discrimination (L1134-1) : d''où l''importance de tracer les raisons de vos décisions.

Le handicap fait l''objet d''une obligation supplémentaire : l''employeur doit prendre les « mesures appropriées » pour permettre à un travailleur handicapé d''accéder à un emploi, de l''exercer et d''y progresser (L5213-6). Le refus de ces mesures peut constituer une discrimination. Nous y consacrerons une leçon complète au module 2.

## 4. Le temps de travail et le droit à la déconnexion

Le manager est souvent celui qui organise les horaires, valide les heures supplémentaires et sollicite les salariés en dehors du travail. Il doit connaître les limites légales, sous réserve des dispositions de la convention collective :

- durée légale : 35 heures par semaine (L3121-27) ; au-delà, heures supplémentaires majorées ;
- durée maximale : 10 heures par jour (L3121-18), 48 heures sur une semaine et 44 heures en moyenne sur 12 semaines (L3121-20 et L3121-22) ;
- repos : 11 heures consécutives entre deux journées (L3131-1), 35 heures consécutives par semaine (L3132-2), 20 minutes de pause dès 6 heures de travail (L3121-16).

Le droit à la déconnexion (L2242-17) impose aux entreprises dotées de délégués syndicaux de négocier les modalités d''exercice de ce droit, et à toutes les entreprises de respecter les temps de repos. Concrètement : un manager ne doit pas attendre de réponse à un message envoyé le soir ou le week-end, et doit lui-même s''abstenir de solliciter son équipe en dehors des horaires, sauf urgence réelle et prévue.

Enfin, l''employeur doit décompter le temps de travail des salariés (L3171-2 et suivants). Un manager qui « ferme les yeux » sur des heures non déclarées expose l''entreprise à des rappels de salaire et à des sanctions, et le salarié à un risque pour sa santé. Karim, qui gère l''atelier le soir sans que ces heures soient comptées, est lui-même dans cette situation.

## 5. Le pouvoir disciplinaire et ses limites

Sanctionner un salarié (avertissement, mise à pied, mutation, licenciement) est un pouvoir de l''employeur, encadré par une procédure (L1331-1 et suivants, L1332-1 à L1332-3) : convocation, entretien préalable pour toute sanction ayant une incidence sur la présence, la fonction ou la rémunération, délai de réflexion, notification écrite et motivée. Une sanction ne peut être prononcée plus de deux mois après que l''employeur a eu connaissance des faits (L1332-4). Les sanctions pécuniaires sont interdites (L1331-2).

Ce que cela signifie pour le manager de proximité : sauf délégation expresse, vous ne prononcez pas de sanction. Votre rôle est en amont : recadrer, tracer les faits (date, nature, témoins, ce qui a été dit), alerter la hiérarchie si les faits se répètent. Un recadrage oral n''est pas une sanction disciplinaire ; un « avertissement » écrit, même informel, peut en être une et déclencher la procédure. Le module 5 traite en détail la différence entre recadrage et sanction.

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

Les interlocuteurs externes que vous pouvez recommander à un salarié : le médecin du travail (tenu au secret médical, que le salarié peut solliciter à tout moment), le CSE quand il existe, l''inspection du travail, le Défenseur des droits pour les discriminations.

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

- Code du travail : L4121-1 à L4121-5, L4122-1, L4131-1 ; L1152-1 à L1152-4, L1153-1 à L1153-5 ; L1132-1, L1134-1, L5213-6 ; L3121-16, L3121-18, L3121-20, L3121-22, L3121-27, L3131-1, L3132-2, L3171-2, L2242-17 ; L1331-1 à L1332-4 ; L1121-1, L1222-4 — legifrance.gouv.fr.
- Code pénal : articles 222-33, 222-33-2, 225-1 à 225-4.
- Cour de cassation, chambre criminelle, 11 mars 1993 (conditions de validité de la délégation de pouvoirs) ; chambre sociale, 25 novembre 2015, n° 14-24.444 (portée de l''obligation de sécurité).
- INRS, « Managers : agissez pour prévenir les risques psychosociaux », inrs.fr.
- Ministère du Travail, « Harcèlement moral » et « Harcèlement sexuel », fiches pratiques, travail-emploi.gouv.fr.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 2 and l.ordre = 6;
  n := n + 1;

  -- 1.7-communication-avec-la-hierarchie.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Le manager de proximité occupe une position unique dans l''entreprise : il est le seul à être en contact direct, chaque jour, à la fois avec ceux qui font le travail et avec ceux qui le décident. Cette position fait de lui le point de passage de toute l''information utile. C''est aussi ce qui le fatigue le plus, s''il ne l''organise pas.

Cette leçon traite des deux sens de cette communication : descendante (de la direction vers l''équipe) et ascendante (de l''équipe vers la direction). Elle correspond à la compétence 10 du référentiel « Animer une équipe de travail » : assurer la communication ascendante et descendante entre l''équipe et la hiérarchie.

## La communication descendante : relayer, pas répéter

Une décision de la direction arrive : nouveau logiciel, changement d''horaires, objectif revu à la hausse, refus d''une embauche. Votre travail est de la transmettre à l''équipe. Il y a une mauvaise et une bonne façon de le faire.

La mauvaise : transférer. « La direction a décidé que… voilà, c''est comme ça. » Vous vous mettez hors jeu, vous laissez l''équipe seule face à une décision qu''elle n''a pas comprise, et vous perdez en crédibilité : un manager qui se contente de transmettre n''est plus qu''une boîte aux lettres.

La bonne : relayer. Relayer, c''est reprendre la décision à votre compte en lui donnant du sens. Quatre éléments :

- Le contexte : pourquoi cette décision, quel problème elle règle, quelles contraintes l''expliquent.
- Le contenu : ce qui change précisément, pour qui, à partir de quand.
- Les conséquences : ce que cela implique pour l''équipe, ce qui ne change pas.
- La suite : comment on va faire, ce que vous attendez de chacun, quand vous ferez le point.

Si vous n''êtes pas d''accord avec la décision, vous l''avez dit à votre hiérarchie avant, en entretien. Devant l''équipe, vous la portez. Vous pouvez reconnaître qu''elle est difficile, vous pouvez dire que vous avez exprimé des réserves ; vous ne pouvez pas dire « je suis contre, mais on n''a pas le choix ». Ce serait vous défausser, et l''équipe le sentirait.

Un cas particulier : quand vous ne connaissez pas les raisons de la décision. Ne les inventez pas. Dites que vous allez les demander, et faites-le. L''équipe préfère un « je ne sais pas, je me renseigne » à une explication improvisée qui sera démentie la semaine suivante.

## La communication ascendante : ce que votre hiérarchie attend

Votre responsable a besoin de trois choses de vous, et il ne les obtient que si vous les organisez.

Premièrement, de l''information fiable sur l''activité : où en est-on, quels sont les résultats, quels sont les écarts. C''est le reporting. Il doit être régulier (un rythme convenu, hebdomadaire ou mensuel selon l''activité), court (une page, cinq chiffres, trois faits marquants) et honnête : les mauvaises nouvelles en premier, pas cachées en bas de page.

Deuxièmement, des alertes à temps. Un problème remonté tôt est un problème qu''on peut résoudre ; le même problème remonté trop tard est une crise. La règle : vous alertez dès que vous identifiez un risque que vous ne pouvez pas traiter seul, ou qui dépasse votre périmètre. Vous n''attendez pas d''être sûr, vous n''attendez pas d''avoir la solution.

Troisièmement, des propositions. Un manager qui ne remonte que des problèmes finit par n''être plus écouté. Un manager qui remonte des problèmes avec des options finit par obtenir des moyens. Pour chaque problème remonté, essayez d''apporter : ce que vous avez déjà fait, ce que vous proposez, ce dont vous avez besoin.

## Comment remonter un problème : la méthode en quatre temps

- Les faits : ce qui s''est passé, avec des chiffres et des dates, sans interprétation. « Trois reprises ce mois-ci sur des véhicules de flotte, contre une en moyenne les mois précédents. »
- L''impact : ce que cela coûte ou risque de coûter. « Le client Transports Ferrand a fait une réclamation écrite ; nous perdons environ six heures de main-d''œuvre par reprise. »
- L''analyse : ce que vous en comprenez. « Deux des trois reprises concernent la finition de Julien, qui n''est pas encore autonome sur cette étape et n''est pas contrôlé avant restitution. »
- La proposition : ce que vous comptez faire et ce que vous demandez. « Je mets en place un contrôle avant restitution dès lundi. J''ai besoin de votre accord pour que Thierry y consacre une demi-heure par jour. »

Cette structure tient en trois minutes à l''oral ou en dix lignes à l''écrit. Elle transforme une plainte en décision.

## Dire non, poser ses limites

Il arrive que la hiérarchie demande quelque chose d''irréaliste : un délai impossible, un objectif sans les moyens, une tâche supplémentaire pour une équipe déjà saturée. Trois réponses sont possibles, et une seule est bonne.

Dire oui et ne pas tenir : vous perdez votre crédibilité et vous épuisez l''équipe.

Dire non sans argument : vous passez pour quelqu''un qui n''a pas envie.

Dire « oui, à ces conditions » ou « non, et voici ce que je propose à la place » : vous montrez que vous avez compris l''enjeu, vous chiffrez ce que la demande implique, et vous laissez la décision à qui elle appartient. « Livrer les huit véhicules vendredi est possible si nous décalons les deux particuliers à la semaine prochaine ; sinon, il faudrait deux jours d''intérim. Que préférez-vous ? »

Négocier avec sa hiérarchie, c''est cela : ne pas dire non à la demande, mais rendre visibles ses conséquences.

## Protéger son équipe sans la couvrir

Défendre son équipe devant la direction est une partie du rôle. Mais il y a une différence entre protéger et couvrir.

Protéger : obtenir des moyens, du temps, de la reconnaissance ; refuser qu''un salarié soit réprimandé publiquement par un supérieur ; expliquer les contraintes réelles du terrain.

Couvrir : cacher une erreur, minimiser un incident, présenter une situation sous un jour meilleur qu''elle n''est. C''est une mauvaise idée, toujours : la vérité finit par sortir, et c''est votre parole qui est alors mise en cause.

L''entretien de Karim avec Michel, après l''épisode de Julien réprimandé devant tout le monde, relève de la protection : « Je comprends que la reprise vous ait mis en colère, et j''ai mis en place un contrôle. Mais j''ai besoin que les remarques individuelles passent par moi, en privé. Sinon, je ne pourrai pas tenir mon rôle. » Ce n''est pas une critique publique de Michel ; c''est une demande d''organisation, en tête-à-tête.

## Organiser la relation avec son responsable

Ne laissez pas cette relation au hasard des couloirs. Trois pratiques :

- Un point régulier, à date fixe : 30 minutes par semaine les trois premiers mois, puis toutes les deux semaines. Ordre du jour stable : résultats, alertes, décisions à prendre, besoins.
- Un canal pour l''urgent, distinct du reste : ce qui ne peut pas attendre le point régulier passe par téléphone ou message, et uniquement cela.
- Une trace écrite des décisions : après chaque point, un courriel de trois lignes qui résume ce qui a été décidé. Ce n''est pas de la méfiance ; c''est ce qui évite les « je n''avais pas compris ça ».

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

- Henry Mintzberg, *The Nature of Managerial Work* (1973) — rôles de diffuseur, de porte-parole et de négociateur.
- Linda A. Hill, *Becoming a Manager* (2003) — la découverte des dépendances hiérarchiques par les nouveaux managers.
- Roger Fisher, William Ury, *Getting to Yes* (1981) — négociation sur les intérêts, applicable à la relation avec la hiérarchie.
- France Compétences, référentiel RS7377, compétence 10.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Le manager de proximité occupe une position unique dans l''entreprise : il est le seul à être en contact direct, chaque jour, à la fois avec ceux qui font le travail et avec ceux qui le décident. Cette position fait de lui le point de passage de toute l''information utile. C''est aussi ce qui le fatigue le plus, s''il ne l''organise pas.

Cette leçon traite des deux sens de cette communication : descendante (de la direction vers l''équipe) et ascendante (de l''équipe vers la direction). Elle correspond à la compétence 10 du référentiel « Animer une équipe de travail » : assurer la communication ascendante et descendante entre l''équipe et la hiérarchie.

## La communication descendante : relayer, pas répéter

Une décision de la direction arrive : nouveau logiciel, changement d''horaires, objectif revu à la hausse, refus d''une embauche. Votre travail est de la transmettre à l''équipe. Il y a une mauvaise et une bonne façon de le faire.

La mauvaise : transférer. « La direction a décidé que… voilà, c''est comme ça. » Vous vous mettez hors jeu, vous laissez l''équipe seule face à une décision qu''elle n''a pas comprise, et vous perdez en crédibilité : un manager qui se contente de transmettre n''est plus qu''une boîte aux lettres.

La bonne : relayer. Relayer, c''est reprendre la décision à votre compte en lui donnant du sens. Quatre éléments :

- Le contexte : pourquoi cette décision, quel problème elle règle, quelles contraintes l''expliquent.
- Le contenu : ce qui change précisément, pour qui, à partir de quand.
- Les conséquences : ce que cela implique pour l''équipe, ce qui ne change pas.
- La suite : comment on va faire, ce que vous attendez de chacun, quand vous ferez le point.

Si vous n''êtes pas d''accord avec la décision, vous l''avez dit à votre hiérarchie avant, en entretien. Devant l''équipe, vous la portez. Vous pouvez reconnaître qu''elle est difficile, vous pouvez dire que vous avez exprimé des réserves ; vous ne pouvez pas dire « je suis contre, mais on n''a pas le choix ». Ce serait vous défausser, et l''équipe le sentirait.

Un cas particulier : quand vous ne connaissez pas les raisons de la décision. Ne les inventez pas. Dites que vous allez les demander, et faites-le. L''équipe préfère un « je ne sais pas, je me renseigne » à une explication improvisée qui sera démentie la semaine suivante.

## La communication ascendante : ce que votre hiérarchie attend

Votre responsable a besoin de trois choses de vous, et il ne les obtient que si vous les organisez.

Premièrement, de l''information fiable sur l''activité : où en est-on, quels sont les résultats, quels sont les écarts. C''est le reporting. Il doit être régulier (un rythme convenu, hebdomadaire ou mensuel selon l''activité), court (une page, cinq chiffres, trois faits marquants) et honnête : les mauvaises nouvelles en premier, pas cachées en bas de page.

Deuxièmement, des alertes à temps. Un problème remonté tôt est un problème qu''on peut résoudre ; le même problème remonté trop tard est une crise. La règle : vous alertez dès que vous identifiez un risque que vous ne pouvez pas traiter seul, ou qui dépasse votre périmètre. Vous n''attendez pas d''être sûr, vous n''attendez pas d''avoir la solution.

Troisièmement, des propositions. Un manager qui ne remonte que des problèmes finit par n''être plus écouté. Un manager qui remonte des problèmes avec des options finit par obtenir des moyens. Pour chaque problème remonté, essayez d''apporter : ce que vous avez déjà fait, ce que vous proposez, ce dont vous avez besoin.

## Comment remonter un problème : la méthode en quatre temps

- Les faits : ce qui s''est passé, avec des chiffres et des dates, sans interprétation. « Trois reprises ce mois-ci sur des véhicules de flotte, contre une en moyenne les mois précédents. »
- L''impact : ce que cela coûte ou risque de coûter. « Le client Transports Ferrand a fait une réclamation écrite ; nous perdons environ six heures de main-d''œuvre par reprise. »
- L''analyse : ce que vous en comprenez. « Deux des trois reprises concernent la finition de Julien, qui n''est pas encore autonome sur cette étape et n''est pas contrôlé avant restitution. »
- La proposition : ce que vous comptez faire et ce que vous demandez. « Je mets en place un contrôle avant restitution dès lundi. J''ai besoin de votre accord pour que Thierry y consacre une demi-heure par jour. »

Cette structure tient en trois minutes à l''oral ou en dix lignes à l''écrit. Elle transforme une plainte en décision.

## Dire non, poser ses limites

Il arrive que la hiérarchie demande quelque chose d''irréaliste : un délai impossible, un objectif sans les moyens, une tâche supplémentaire pour une équipe déjà saturée. Trois réponses sont possibles, et une seule est bonne.

Dire oui et ne pas tenir : vous perdez votre crédibilité et vous épuisez l''équipe.

Dire non sans argument : vous passez pour quelqu''un qui n''a pas envie.

Dire « oui, à ces conditions » ou « non, et voici ce que je propose à la place » : vous montrez que vous avez compris l''enjeu, vous chiffrez ce que la demande implique, et vous laissez la décision à qui elle appartient. « Livrer les huit véhicules vendredi est possible si nous décalons les deux particuliers à la semaine prochaine ; sinon, il faudrait deux jours d''intérim. Que préférez-vous ? »

Négocier avec sa hiérarchie, c''est cela : ne pas dire non à la demande, mais rendre visibles ses conséquences.

## Protéger son équipe sans la couvrir

Défendre son équipe devant la direction est une partie du rôle. Mais il y a une différence entre protéger et couvrir.

Protéger : obtenir des moyens, du temps, de la reconnaissance ; refuser qu''un salarié soit réprimandé publiquement par un supérieur ; expliquer les contraintes réelles du terrain.

Couvrir : cacher une erreur, minimiser un incident, présenter une situation sous un jour meilleur qu''elle n''est. C''est une mauvaise idée, toujours : la vérité finit par sortir, et c''est votre parole qui est alors mise en cause.

L''entretien de Karim avec Michel, après l''épisode de Julien réprimandé devant tout le monde, relève de la protection : « Je comprends que la reprise vous ait mis en colère, et j''ai mis en place un contrôle. Mais j''ai besoin que les remarques individuelles passent par moi, en privé. Sinon, je ne pourrai pas tenir mon rôle. » Ce n''est pas une critique publique de Michel ; c''est une demande d''organisation, en tête-à-tête.

## Organiser la relation avec son responsable

Ne laissez pas cette relation au hasard des couloirs. Trois pratiques :

- Un point régulier, à date fixe : 30 minutes par semaine les trois premiers mois, puis toutes les deux semaines. Ordre du jour stable : résultats, alertes, décisions à prendre, besoins.
- Un canal pour l''urgent, distinct du reste : ce qui ne peut pas attendre le point régulier passe par téléphone ou message, et uniquement cela.
- Une trace écrite des décisions : après chaque point, un courriel de trois lignes qui résume ce qui a été décidé. Ce n''est pas de la méfiance ; c''est ce qui évite les « je n''avais pas compris ça ».

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

- Henry Mintzberg, *The Nature of Managerial Work* (1973) — rôles de diffuseur, de porte-parole et de négociateur.
- Linda A. Hill, *Becoming a Manager* (2003) — la découverte des dépendances hiérarchiques par les nouveaux managers.
- Roger Fisher, William Ury, *Getting to Yes* (1981) — négociation sur les intérêts, applicable à la relation avec la hiérarchie.
- France Compétences, référentiel RS7377, compétence 10.
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

### Phase 1 — Jours 1 à 30 : comprendre

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

### Phase 2 — Jours 31 à 60 : organiser

Objectif de la phase : clarifier les rôles, les règles et les indicateurs ; installer les rituels.

- Rôles et missions clarifiés (qui fait quoi) : fait le ____ / ____
- Règles de fonctionnement partagées avec l''équipe (horaires, priorités, qualité, sécurité) : fait le ____ / ____
- Tableau de bord : mes 5 indicateurs — 1. __________ 2. __________ 3. __________ 4. __________ 5. __________
- Rituel d''équipe mis en place (fréquence, durée, format) : ______________________
- Premier feedback individuel donné à chaque personne : ☐ oui ☐ non
- Mon style dominant (leçon 1.3) : __________ Les 2 styles que je travaille : __________ / __________
- Niveau d''autonomie de chacun sur ses tâches clés (leçon 1.4) : noté dans mon carnet ☐

### Phase 3 — Jours 61 à 90 : consolider

Objectif de la phase : vérifier que l''organisation tient sans moi, ajuster, préparer la suite.

- Ce qui fonctionne et que je conserve : ___________________________________
- Ce que j''ajuste : _____________________________________________________
- Première délégation significative confiée à : __________ sur : __________
- Point de bilan à 90 jours avec mon responsable : date ____ / ____ — mes 3 messages : 1. __________ 2. __________ 3. __________
- Mes priorités pour les 3 mois suivants : 1. __________ 2. __________ 3. __________

### Mes garde-fous

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
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Cette fiche est un gabarit à remplir. Sur la plateforme, elle est proposée en PDF (à générer depuis ce contenu, mise en page IDEAFORMA, fond clair, encadrés à bordure noire). Le texte ci-dessous en est la source ; le texte d''accompagnement de la leçon figure en fin de fichier.

---

## MA FEUILLE DE ROUTE — 90 PREMIERS JOURS

Nom : ______________________ Poste : ______________________ Date de prise de poste : ____ / ____ / ______
Équipe : ______ personnes Mon responsable : ______________________

### Phase 1 — Jours 1 à 30 : comprendre

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

### Phase 2 — Jours 31 à 60 : organiser

Objectif de la phase : clarifier les rôles, les règles et les indicateurs ; installer les rituels.

- Rôles et missions clarifiés (qui fait quoi) : fait le ____ / ____
- Règles de fonctionnement partagées avec l''équipe (horaires, priorités, qualité, sécurité) : fait le ____ / ____
- Tableau de bord : mes 5 indicateurs — 1. __________ 2. __________ 3. __________ 4. __________ 5. __________
- Rituel d''équipe mis en place (fréquence, durée, format) : ______________________
- Premier feedback individuel donné à chaque personne : ☐ oui ☐ non
- Mon style dominant (leçon 1.3) : __________ Les 2 styles que je travaille : __________ / __________
- Niveau d''autonomie de chacun sur ses tâches clés (leçon 1.4) : noté dans mon carnet ☐

### Phase 3 — Jours 61 à 90 : consolider

Objectif de la phase : vérifier que l''organisation tient sans moi, ajuster, préparer la suite.

- Ce qui fonctionne et que je conserve : ___________________________________
- Ce que j''ajuste : _____________________________________________________
- Première délégation significative confiée à : __________ sur : __________
- Point de bilan à 90 jours avec mon responsable : date ____ / ____ — mes 3 messages : 1. __________ 2. __________ 3. __________
- Mes priorités pour les 3 mois suivants : 1. __________ 2. __________ 3. __________

### Mes garde-fous

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

  raise notice 'Contenus importés : % leçons', n;
end $$;
