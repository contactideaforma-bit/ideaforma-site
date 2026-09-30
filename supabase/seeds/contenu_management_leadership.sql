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
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.
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
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.
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
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

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
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

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
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

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
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

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
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

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
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

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

  -- 2.1-video-strategie-objectifs.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Type : vidéo avatar · Débit : 140 mots/min · Indications visuelles entre crochets
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

[Plan : avatar, fond clair. Titre : « Module 2 — Organiser et structurer le travail de l''équipe »]

Bienvenue dans le module 2. Le module 1 vous a situé dans votre rôle. Celui-ci vous donne la méthode pour organiser le travail : objectifs, compétences, répartition des rôles, délégation, priorités, tableau de bord, et prise en compte du handicap.

On commence par la question qui conditionne tout le reste : à quoi sert un objectif ?

[Titre : « Pourquoi un objectif »]

Imaginez une équipe sans objectif. Chacun fait de son mieux, selon sa propre idée de ce qui compte. Le carrossier soigne la finition, la secrétaire répond vite aux clients, le mécanicien sécurise ses interventions. Tout le monde travaille, et pourtant les délais ne sont pas tenus, parce que personne n''a dit que le délai était la priorité.

Un objectif, c''est ce qui aligne les efforts. Il répond à trois questions : où allons-nous, comment saurons-nous que nous y sommes, et pour quand.

[Schéma : cascade en 4 niveaux — Stratégie de l''entreprise → Objectifs du service → Objectifs de l''équipe → Objectifs individuels]

Les objectifs ne naissent pas dans l''équipe. Ils descendent d''une cascade.

Tout en haut, la stratégie de l''entreprise : ce que la direction veut obtenir cette année. Chez Garnier, Michel l''a dit : tenir les délais annoncés aux assurances, arrêter les reprises, ne plus dépendre de lui au quotidien.

Ensuite, les objectifs du service ou de l''atelier : la traduction de cette stratégie dans votre périmètre. Par exemple : 95 % des véhicules livrés à la date annoncée, moins d''une reprise par mois.

Puis les objectifs de l''équipe : ce que vous vous engagez collectivement à faire pour y arriver. Par exemple : un contrôle qualité systématique avant restitution, un planning validé chaque veille au soir.

Et enfin, les objectifs individuels : la contribution de chacun. Julien : zéro défaut de finition sur le trimestre. Sophie : toutes les demandes clients transmises au chef d''atelier avant midi.

[Titre : « Le rôle du manager dans la cascade »]

Votre rôle, c''est de faire la traduction entre le niveau du dessus et celui du dessous. Deux erreurs à éviter.

La première : transmettre l''objectif de l''entreprise tel quel. « Il faut tenir les délais. » C''est vrai, mais ça ne dit à personne quoi faire lundi matin. Un objectif que l''équipe ne peut pas relier à son travail concret ne change rien.

La seconde : fixer des objectifs d''équipe qui ne se rattachent à rien. « Ranger l''atelier » est peut-être utile, mais si personne ne voit le lien avec les délais ou la qualité, l''objectif sera vécu comme un caprice du chef.

Un bon objectif d''équipe, c''est un objectif dont chacun peut dire : je vois pourquoi on le fait, et je vois ce que j''y fais.

[Titre : « Trois pièges »]

Trois pièges fréquents, que vous verrez dans la leçon suivante avec la méthode SMART.

Trop d''objectifs. Au-delà de trois à cinq objectifs pour une équipe, plus personne ne sait ce qui compte. La priorité se dilue.

Des objectifs qu''on ne mesure pas. « Améliorer la qualité » n''est pas un objectif, c''est un souhait. « Moins d''une reprise par mois » est un objectif : à la fin du mois, on sait.

Des objectifs imposés sans explication. Un objectif accepté vaut dix fois un objectif subi. Cela ne veut pas dire que l''équipe choisit ses objectifs, mais qu''elle comprend d''où ils viennent et qu''elle a pu discuter des moyens.

[Plan : reprise du cas]

À l''atelier Garnier, Karim va transformer les trois attentes de Michel en objectifs d''équipe pour le trimestre. Vous verrez comment dans les leçons suivantes, et vous ferez le même exercice pour votre équipe dans le carnet de bord.

À tout de suite pour la méthode.

[Fondu, logo]

---

Sources : Peter Drucker, *The Practice of Management* (1954) — management par objectifs ; Locke & Latham (1990) — théorie de la fixation d''objectifs.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Type : vidéo avatar · Débit : 140 mots/min · Indications visuelles entre crochets
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

[Plan : avatar, fond clair. Titre : « Module 2 — Organiser et structurer le travail de l''équipe »]

Bienvenue dans le module 2. Le module 1 vous a situé dans votre rôle. Celui-ci vous donne la méthode pour organiser le travail : objectifs, compétences, répartition des rôles, délégation, priorités, tableau de bord, et prise en compte du handicap.

On commence par la question qui conditionne tout le reste : à quoi sert un objectif ?

[Titre : « Pourquoi un objectif »]

Imaginez une équipe sans objectif. Chacun fait de son mieux, selon sa propre idée de ce qui compte. Le carrossier soigne la finition, la secrétaire répond vite aux clients, le mécanicien sécurise ses interventions. Tout le monde travaille, et pourtant les délais ne sont pas tenus, parce que personne n''a dit que le délai était la priorité.

Un objectif, c''est ce qui aligne les efforts. Il répond à trois questions : où allons-nous, comment saurons-nous que nous y sommes, et pour quand.

[Schéma : cascade en 4 niveaux — Stratégie de l''entreprise → Objectifs du service → Objectifs de l''équipe → Objectifs individuels]

Les objectifs ne naissent pas dans l''équipe. Ils descendent d''une cascade.

Tout en haut, la stratégie de l''entreprise : ce que la direction veut obtenir cette année. Chez Garnier, Michel l''a dit : tenir les délais annoncés aux assurances, arrêter les reprises, ne plus dépendre de lui au quotidien.

Ensuite, les objectifs du service ou de l''atelier : la traduction de cette stratégie dans votre périmètre. Par exemple : 95 % des véhicules livrés à la date annoncée, moins d''une reprise par mois.

Puis les objectifs de l''équipe : ce que vous vous engagez collectivement à faire pour y arriver. Par exemple : un contrôle qualité systématique avant restitution, un planning validé chaque veille au soir.

Et enfin, les objectifs individuels : la contribution de chacun. Julien : zéro défaut de finition sur le trimestre. Sophie : toutes les demandes clients transmises au chef d''atelier avant midi.

[Titre : « Le rôle du manager dans la cascade »]

Votre rôle, c''est de faire la traduction entre le niveau du dessus et celui du dessous. Deux erreurs à éviter.

La première : transmettre l''objectif de l''entreprise tel quel. « Il faut tenir les délais. » C''est vrai, mais ça ne dit à personne quoi faire lundi matin. Un objectif que l''équipe ne peut pas relier à son travail concret ne change rien.

La seconde : fixer des objectifs d''équipe qui ne se rattachent à rien. « Ranger l''atelier » est peut-être utile, mais si personne ne voit le lien avec les délais ou la qualité, l''objectif sera vécu comme un caprice du chef.

Un bon objectif d''équipe, c''est un objectif dont chacun peut dire : je vois pourquoi on le fait, et je vois ce que j''y fais.

[Titre : « Trois pièges »]

Trois pièges fréquents, que vous verrez dans la leçon suivante avec la méthode SMART.

Trop d''objectifs. Au-delà de trois à cinq objectifs pour une équipe, plus personne ne sait ce qui compte. La priorité se dilue.

Des objectifs qu''on ne mesure pas. « Améliorer la qualité » n''est pas un objectif, c''est un souhait. « Moins d''une reprise par mois » est un objectif : à la fin du mois, on sait.

Des objectifs imposés sans explication. Un objectif accepté vaut dix fois un objectif subi. Cela ne veut pas dire que l''équipe choisit ses objectifs, mais qu''elle comprend d''où ils viennent et qu''elle a pu discuter des moyens.

[Plan : reprise du cas]

À l''atelier Garnier, Karim va transformer les trois attentes de Michel en objectifs d''équipe pour le trimestre. Vous verrez comment dans les leçons suivantes, et vous ferez le même exercice pour votre équipe dans le carnet de bord.

À tout de suite pour la méthode.

[Fondu, logo]

---

Sources : Peter Drucker, *The Practice of Management* (1954) — management par objectifs ; Locke & Latham (1990) — théorie de la fixation d''objectifs.
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

Aménagements à prévoir (restrictions prescrites par le médecin du travail, sans mention du motif) : ____________________________

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

Aménagements à prévoir (restrictions prescrites par le médecin du travail, sans mention du motif) : ____________________________

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

Ce qu''il faut voir : trois compétences portées par une seule personne (pièces, peinture, mécanique), une compétence absente (contrôle qualité), et une compétence à consolider (finition de Julien). Le plan de formation du trimestre découle directement de cette lecture. Une erreur fréquente : noter Fatou au niveau 1 en préparation à cause de sa restriction. Non : elle est au niveau 3 sur la compétence ; la restriction est une contrainte d''organisation, traitée à part.

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

Ce qu''il faut voir : trois compétences portées par une seule personne (pièces, peinture, mécanique), une compétence absente (contrôle qualité), et une compétence à consolider (finition de Julien). Le plan de formation du trimestre découle directement de cette lecture. Une erreur fréquente : noter Fatou au niveau 1 en préparation à cause de sa restriction. Non : elle est au niveau 3 sur la compétence ; la restriction est une contrainte d''organisation, traitée à part.

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
  update public.lecons l set contenu = '{"questions": [{"id": "m2q01", "enonce": "Selon Locke et Latham, quel type d''objectif produit les meilleurs résultats ?", "options": ["Un objectif vague qui laisse toute liberté (« faites de votre mieux »)", "Un objectif facile, pour ne décourager personne", "Un objectif précis et difficile, accepté par la personne et suivi régulièrement", "Un objectif fixé sans discussion, pour gagner du temps"], "bonnes": [2], "explication": "Précis, difficile mais accepté, avec un retour d''information régulier : ce sont les quatre conditions établies par la recherche sur la fixation d''objectifs."}, {"id": "m2q02", "enonce": "Lequel de ces objectifs est correctement formulé selon la méthode SMART ?", "options": ["Améliorer la qualité des finitions", "Faire plus de contrôles qualité", "D''ici le 31 décembre, aucune reprise pour défaut de finition sur les véhicules de flotte (3 ce trimestre)", "Être le meilleur atelier de la région"], "bonnes": [2], "explication": "Spécifique, mesurable (aucune reprise, contre 3), atteignable, pertinent (lié à l''enjeu client) et daté (31 décembre)."}, {"id": "m2q03", "enonce": "Dans quel ordre fixe-t-on les objectifs d''une équipe ?", "options": ["Les objectifs individuels d''abord, puis on additionne pour obtenir l''objectif collectif", "Les objectifs collectifs d''abord, en réunion, puis les objectifs individuels, en entretien", "Uniquement des objectifs individuels, pour responsabiliser chacun", "Uniquement des objectifs collectifs, pour éviter les comparaisons"], "bonnes": [1], "explication": "Le collectif crée le sens et la solidarité ; l''individuel crée la responsabilité. Commencer par l''individuel donne une somme de contributions, pas une équipe."}, {"id": "m2q04", "enonce": "Dans une matrice de compétences, que signale une compétence détenue par une seule personne au niveau 2 ou 3 ?", "options": ["Que cette personne est indispensable et doit être augmentée", "Un point de fragilité : l''activité s''arrête si elle est absente", "Que la compétence n''est pas importante", "Qu''il faut retirer cette compétence de la matrice"], "bonnes": [1], "explication": "C''est un risque : il appelle un binôme, une formation ou un recrutement. Une organisation ne doit jamais reposer sur une seule personne."}, {"id": "m2q05", "enonce": "Dans une matrice RACI, combien de « A » (approuve / répond du résultat) doit-on trouver sur chaque ligne ?", "options": ["Aucun, c''est facultatif", "Exactement un", "Au moins deux, pour se couvrir", "Autant que de personnes impliquées"], "bonnes": [1], "explication": "Un seul A par ligne. Deux A = un conflit en réserve ; aucun A = personne ne répond du résultat."}, {"id": "m2q06", "enonce": "Parmi ces éléments, lesquels se délèguent ? (plusieurs réponses)", "options": ["Le contrôle technique d''une production", "La formation d''un nouvel arrivant", "L''évaluation et le recadrage des personnes", "La relation avec un fournisseur"], "bonnes": [0, 1, 3], "explication": "L''exécution et l''expertise se délèguent. Le cœur du rôle de manager (objectifs, arbitrages, évaluation, recadrage, sanction, crise) ne se délègue pas."}, {"id": "m2q07", "enonce": "Vous confiez une mission à un collaborateur expert, en lui disant « décide et tiens-moi informé ». À quel niveau de délégation cela correspond-il ?", "options": ["Niveau 1 : exécuter une consigne précise sous contrôle", "Niveau 2 : organiser et faire valider avant la fin", "Niveau 4 : décider seul et rendre compte après", "Niveau 5 : décider sans rendre compte"], "bonnes": [2], "explication": "Le niveau 4 convient à une personne autonome sur la tâche. Rester au niveau 1 ou 2 avec un expert est vécu comme de la défiance."}, {"id": "m2q08", "enonce": "Dans la matrice importance / urgence, quelle case est celle où « se joue le management » et qui disparaît si on ne la planifie pas ?", "options": ["Important et urgent", "Important et pas urgent", "Pas important et urgent", "Pas important et pas urgent"], "bonnes": [1], "explication": "Fixer des objectifs, former, organiser, faire des entretiens : rien n''est urgent, tout est important. Négliger cette case fabrique les urgences de demain."}, {"id": "m2q09", "enonce": "Quelle est la différence entre un indicateur de résultat et un indicateur de moyens ?", "options": ["Le premier est financier, le second ne l''est pas", "Le premier mesure ce qu''on veut obtenir (souvent trop tard pour corriger), le second mesure ce qu''on fait pour y arriver (à temps pour ajuster)", "Le premier est mensuel, le second est annuel", "Il n''y a pas de différence, ce sont deux noms pour la même chose"], "bonnes": [1], "explication": "Un bon tableau de bord combine les deux : le résultat dit si l''on a réussi, les moyens disent si l''on est sur la bonne voie."}, {"id": "m2q10", "enonce": "Le taux d''interventions à l''heure d''une agence grimpe rapidement, mais les intervenantes écourtent les prestations pour y parvenir. De quoi s''agit-il et que faire ?", "options": ["D''une réussite : l''objectif est atteint", "De la loi de Goodhart : l''indicateur est devenu l''objectif ; il faut ajouter un garde-fou (durée réelle des interventions) et cesser d''utiliser le chiffre pour juger les personnes", "D''une fraude à sanctionner individuellement", "D''un problème de logiciel"], "bonnes": [1], "explication": "Quand un indicateur sert à juger, il est optimisé au détriment du résultat réel. Garde-fou, indicateurs collectifs et recherche des causes plutôt que des coupables."}, {"id": "m2q11", "enonce": "Un collaborateur vous informe qu''il a une reconnaissance de travailleur handicapé et une restriction de port de charge. Quelle est la bonne réaction ?", "options": ["Lui demander son diagnostic pour comprendre", "Organiser le travail à partir de la restriction prescrite par le médecin du travail, sans divulguer le motif à l''équipe", "L''écarter des tâches physiques « pour le protéger », sans lui demander son avis", "Informer l''équipe de sa situation médicale pour expliquer l''aménagement"], "bonnes": [1], "explication": "Le médecin du travail prescrit, le manager organise à partir de la restriction. Le diagnostic ne vous regarde pas et ne se divulgue jamais. L''écarter sans son avis serait une discrimination « bienveillante »."}, {"id": "m2q12", "enonce": "Concernant l''aménagement raisonnable du poste d''un travailleur handicapé, quelle affirmation est exacte ?", "options": ["Il n''est obligatoire que dans les entreprises de plus de 250 salariés", "L''employeur doit prendre les mesures appropriées, sauf charge disproportionnée ; un refus non motivé peut constituer une discrimination", "Il est laissé à la libre appréciation du manager", "Il est entièrement financé par le salarié"], "bonnes": [1], "explication": "Code du travail L5213-6 : obligation d''aménagement raisonnable, sous réserve de charge disproportionnée ; l''Agefiph aide à financer. Le refus doit être motivé par écrit."}], "seuil": 70, "tentatives_max": 3, "corrections": true, "consigne": "12 questions. Une seule bonne réponse par question, sauf mention « plusieurs réponses ». Seuil de réussite : 70 %."}'::jsonb, publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 13;
  n := n + 1;

  -- 2.2-fixer-des-objectifs.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Fixer un objectif est une compétence technique, avec des règles connues depuis quarante ans et confirmées par des centaines d''études. Cette leçon vous les donne, puis vous montre comment les appliquer sans tomber dans le formalisme.

## Ce que dit la recherche

Deux psychologues, Edwin Locke et Gary Latham, ont consacré leur carrière à une question simple : quels objectifs font travailler mieux ? Leur synthèse de 1990 repose sur plus de 400 études. Les résultats tiennent en quatre points.

Les objectifs précis produisent de meilleurs résultats que les objectifs vagues. « Faites de votre mieux » est la consigne la moins efficace qui existe.

Les objectifs difficiles produisent de meilleurs résultats que les objectifs faciles, à une condition : que la personne les accepte et se sente capable de les atteindre. Un objectif jugé impossible démotive.

Le retour d''information est indispensable. Un objectif sans suivi régulier perd son effet en quelques semaines : on ne peut pas ajuster son effort si l''on ne sait pas où l''on en est.

L''engagement compte. Un objectif est plus efficace quand la personne a participé à sa fixation, ou au moins compris ses raisons.

## La méthode SMART

En 1981, George Doran a proposé un aide-mémoire devenu universel : un objectif doit être SMART.

- Spécifique : il décrit un résultat précis, pas une intention. « Réduire les reprises » est vague ; « aucune reprise pour défaut de finition sur les véhicules de flotte » est spécifique.
- Mesurable : on sait, à la fin, s''il est atteint ou non, avec un chiffre ou un fait observable.
- Atteignable : difficile mais possible avec les moyens disponibles. Un objectif inatteignable n''est pas ambitieux, il est démobilisateur.
- Réaliste, ou pertinent selon les versions : relié à un enjeu réel de l''entreprise, que la personne comprend.
- Temporel : daté. Sans échéance, un objectif est un vœu.

Exemple complet : « D''ici le 31 décembre, 95 % des véhicules de flotte sont restitués à la date annoncée à l''assureur, contre 78 % au dernier trimestre. »

SMART est un filtre, pas une formule magique. Un objectif peut cocher les cinq cases et rester mauvais s''il mesure la mauvaise chose. « 100 % des véhicules restitués à la date annoncée » est SMART ; si l''atelier l''atteint en annonçant des délais trois fois trop longs, il n''a rien gagné. C''est pourquoi les objectifs vont par paires : un objectif de résultat (délai tenu) et son garde-fou (délai annoncé conforme au barème).

## Objectifs collectifs et objectifs individuels

Un objectif collectif porte sur le résultat de l''équipe : le taux de délais tenus, le nombre de reprises, la satisfaction client. Il crée de la solidarité et du sens : chacun voit que sa contribution compte pour un résultat commun.

Un objectif individuel porte sur la contribution d''une personne : le zéro défaut de finition de Julien, la transmission des demandes par Sophie. Il crée de la responsabilité : on sait ce qu''on attend de soi.

Les deux sont nécessaires, et dans cet ordre. Fixez d''abord les objectifs collectifs, en réunion, avec l''équipe. Déclinez ensuite les objectifs individuels, en entretien, avec chacun. Un manager qui commence par les objectifs individuels obtient une somme de contributions qui ne forment pas une équipe.

Trois à cinq objectifs collectifs par trimestre ou par semestre, un à trois objectifs individuels par personne : au-delà, personne ne sait plus ce qui compte.

## Les OKR, version simple

Les grandes entreprises technologiques ont popularisé une variante appelée OKR, pour Objectives and Key Results. L''idée est utile même pour une petite équipe.

L''objectif (O) est qualitatif et motivant : il dit où l''on va, en une phrase qu''on peut afficher. « Devenir l''atelier le plus fiable du département pour les flottes. »

Les résultats clés (KR) sont les deux ou trois mesures qui prouvent qu''on y est. « 95 % de délais tenus », « moins d''une reprise par mois », « note de satisfaction assureur supérieure à 4,5 sur 5 ».

L''avantage de cette forme : elle sépare le sens (l''objectif, qu''on retient) de la mesure (les résultats clés, qu''on suit). Elle évite les listes d''objectifs interchangeables que personne ne mémorise.

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

Puis, en entretien individuel : Julien, zéro défaut de finition sur les véhicules de flotte, avec contrôle systématique par Thierry pendant six semaines ; Sophie, transmission de toutes les demandes clients à Karim avant midi, sans consigne directe aux carrossiers ; Marc, information des interventions mécaniques planifiées la veille à 17 h. Thierry n''a pas d''objectif individuel de production : il en a un de transmission, le contrôle qualité des finitions, ce qui reconnaît son expertise.

## À retenir

- Précis, difficile mais accepté, suivi, compris : les quatre conditions d''un objectif efficace.
- SMART est un filtre : spécifique, mesurable, atteignable, pertinent, daté.
- Objectifs collectifs d''abord, en réunion ; individuels ensuite, en entretien.
- Trois à cinq objectifs collectifs, un à trois par personne.
- Mesurez des résultats, pas des activités ; associez à chaque objectif son garde-fou.

## Sources

- Edwin A. Locke, Gary P. Latham, *A Theory of Goal Setting and Task Performance*, Prentice Hall, 1990 ; « Building a Practically Useful Theory of Goal Setting and Task Motivation », *American Psychologist*, 2002.
- George T. Doran, « There''s a S.M.A.R.T. way to write management''s goals and objectives », *Management Review*, vol. 70, n° 11, 1981.
- Peter Drucker, *The Practice of Management*, 1954.
- John Doerr, *Measure What Matters*, 2018 (OKR).
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Fixer un objectif est une compétence technique, avec des règles connues depuis quarante ans et confirmées par des centaines d''études. Cette leçon vous les donne, puis vous montre comment les appliquer sans tomber dans le formalisme.

## Ce que dit la recherche

Deux psychologues, Edwin Locke et Gary Latham, ont consacré leur carrière à une question simple : quels objectifs font travailler mieux ? Leur synthèse de 1990 repose sur plus de 400 études. Les résultats tiennent en quatre points.

Les objectifs précis produisent de meilleurs résultats que les objectifs vagues. « Faites de votre mieux » est la consigne la moins efficace qui existe.

Les objectifs difficiles produisent de meilleurs résultats que les objectifs faciles, à une condition : que la personne les accepte et se sente capable de les atteindre. Un objectif jugé impossible démotive.

Le retour d''information est indispensable. Un objectif sans suivi régulier perd son effet en quelques semaines : on ne peut pas ajuster son effort si l''on ne sait pas où l''on en est.

L''engagement compte. Un objectif est plus efficace quand la personne a participé à sa fixation, ou au moins compris ses raisons.

## La méthode SMART

En 1981, George Doran a proposé un aide-mémoire devenu universel : un objectif doit être SMART.

- Spécifique : il décrit un résultat précis, pas une intention. « Réduire les reprises » est vague ; « aucune reprise pour défaut de finition sur les véhicules de flotte » est spécifique.
- Mesurable : on sait, à la fin, s''il est atteint ou non, avec un chiffre ou un fait observable.
- Atteignable : difficile mais possible avec les moyens disponibles. Un objectif inatteignable n''est pas ambitieux, il est démobilisateur.
- Réaliste, ou pertinent selon les versions : relié à un enjeu réel de l''entreprise, que la personne comprend.
- Temporel : daté. Sans échéance, un objectif est un vœu.

Exemple complet : « D''ici le 31 décembre, 95 % des véhicules de flotte sont restitués à la date annoncée à l''assureur, contre 78 % au dernier trimestre. »

SMART est un filtre, pas une formule magique. Un objectif peut cocher les cinq cases et rester mauvais s''il mesure la mauvaise chose. « 100 % des véhicules restitués à la date annoncée » est SMART ; si l''atelier l''atteint en annonçant des délais trois fois trop longs, il n''a rien gagné. C''est pourquoi les objectifs vont par paires : un objectif de résultat (délai tenu) et son garde-fou (délai annoncé conforme au barème).

## Objectifs collectifs et objectifs individuels

Un objectif collectif porte sur le résultat de l''équipe : le taux de délais tenus, le nombre de reprises, la satisfaction client. Il crée de la solidarité et du sens : chacun voit que sa contribution compte pour un résultat commun.

Un objectif individuel porte sur la contribution d''une personne : le zéro défaut de finition de Julien, la transmission des demandes par Sophie. Il crée de la responsabilité : on sait ce qu''on attend de soi.

Les deux sont nécessaires, et dans cet ordre. Fixez d''abord les objectifs collectifs, en réunion, avec l''équipe. Déclinez ensuite les objectifs individuels, en entretien, avec chacun. Un manager qui commence par les objectifs individuels obtient une somme de contributions qui ne forment pas une équipe.

Trois à cinq objectifs collectifs par trimestre ou par semestre, un à trois objectifs individuels par personne : au-delà, personne ne sait plus ce qui compte.

## Les OKR, version simple

Les grandes entreprises technologiques ont popularisé une variante appelée OKR, pour Objectives and Key Results. L''idée est utile même pour une petite équipe.

L''objectif (O) est qualitatif et motivant : il dit où l''on va, en une phrase qu''on peut afficher. « Devenir l''atelier le plus fiable du département pour les flottes. »

Les résultats clés (KR) sont les deux ou trois mesures qui prouvent qu''on y est. « 95 % de délais tenus », « moins d''une reprise par mois », « note de satisfaction assureur supérieure à 4,5 sur 5 ».

L''avantage de cette forme : elle sépare le sens (l''objectif, qu''on retient) de la mesure (les résultats clés, qu''on suit). Elle évite les listes d''objectifs interchangeables que personne ne mémorise.

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

Puis, en entretien individuel : Julien, zéro défaut de finition sur les véhicules de flotte, avec contrôle systématique par Thierry pendant six semaines ; Sophie, transmission de toutes les demandes clients à Karim avant midi, sans consigne directe aux carrossiers ; Marc, information des interventions mécaniques planifiées la veille à 17 h. Thierry n''a pas d''objectif individuel de production : il en a un de transmission, le contrôle qualité des finitions, ce qui reconnaît son expertise.

## À retenir

- Précis, difficile mais accepté, suivi, compris : les quatre conditions d''un objectif efficace.
- SMART est un filtre : spécifique, mesurable, atteignable, pertinent, daté.
- Objectifs collectifs d''abord, en réunion ; individuels ensuite, en entretien.
- Trois à cinq objectifs collectifs, un à trois par personne.
- Mesurez des résultats, pas des activités ; associez à chaque objectif son garde-fou.

## Sources

- Edwin A. Locke, Gary P. Latham, *A Theory of Goal Setting and Task Performance*, Prentice Hall, 1990 ; « Building a Practically Useful Theory of Goal Setting and Task Motivation », *American Psychologist*, 2002.
- George T. Doran, « There''s a S.M.A.R.T. way to write management''s goals and objectives », *Management Review*, vol. 70, n° 11, 1981.
- Peter Drucker, *The Practice of Management*, 1954.
- John Doerr, *Measure What Matters*, 2018 (OKR).
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 2;
  n := n + 1;

  -- 2.3-identifier-les-competences.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Avant de répartir le travail, il faut savoir de quelles compétences l''activité a besoin, et lesquelles l''équipe possède. C''est la première compétence du référentiel « Animer une équipe de travail » : identifier les compétences nécessaires à la réalisation d''une activité, d''un service ou d''un projet. C''est aussi celle que les managers de proximité pratiquent le moins, parce qu''ils « connaissent leur équipe ». Ils la connaissent souvent moins bien qu''ils ne le croient.

## Trois notions à distinguer

Une compétence est la capacité à réaliser une tâche dans une situation donnée, avec le niveau de qualité attendu. Elle combine des savoirs (connaître les étapes d''une mise en peinture), des savoir-faire (les exécuter) et des savoir-être (la rigueur nécessaire pour ne pas sauter une étape). Une compétence s''observe : elle se juge sur le résultat, pas sur le diplôme.

Un poste est un ensemble de tâches confiées à une personne. Il est décrit par une fiche de poste : missions, activités, compétences requises, rattachement, moyens.

Une activité est ce que l''équipe produit : réparer des véhicules de flotte, tenir l''accueil, assurer la mécanique liée aux chocs. Une activité mobilise plusieurs postes et plusieurs compétences.

L''erreur classique consiste à raisonner par personnes (« Thierry fait la carrosserie ») au lieu de raisonner par activité (« la réparation d''un véhicule de flotte demande dix compétences, qui les détient ? »). La seconde approche fait apparaître les trous.

## La méthode en quatre étapes

## 1. Décrire l''activité

Listez les activités de l''équipe, puis découpez chacune en étapes. Pour un véhicule de flotte à l''atelier Garnier : réception et constat, devis et échange avec l''expert, commande des pièces, démontage et préparation, redressage et carrosserie, mécanique liée au choc, peinture, finition et remontage, contrôle qualité, nettoyage et restitution, facturation.

Ce découpage est déjà utile en soi : il fait apparaître des étapes que personne ne considère comme un vrai travail (le contrôle qualité, la commande des pièces) et qui sont pourtant celles où les problèmes naissent.

## 2. Lister les compétences par étape

Pour chaque étape, notez ce qu''il faut savoir faire. Restez concret : « réaliser un devis sur le logiciel de chiffrage » plutôt que « maîtriser l''administratif ». Vous obtenez une liste de dix à trente compétences pour une petite équipe.

Ajoutez les compétences transversales qui ne sont rattachées à aucune étape mais dont l''activité dépend : sécurité, relation client, utilisation des outils numériques, tutorat des apprentis.

## 3. Construire la matrice de compétences

La matrice croise les compétences (en lignes) et les personnes (en colonnes). Dans chaque case, un niveau. Une échelle simple à quatre niveaux suffit :

- 0 : ne sait pas faire
- 1 : sait faire avec aide ou supervision
- 2 : sait faire seul, au niveau attendu
- 3 : sait faire et peut former ou contrôler les autres

Remplissez-la avec les personnes concernées, pas dans votre coin : demandez à chacun de s''autoévaluer, puis confrontez à votre observation. Les écarts entre les deux sont une information précieuse pour l''entretien de progression.

## 4. Lire la matrice

La matrice répond à quatre questions.

Où sont les risques ? Toute compétence détenue par une seule personne au niveau 2 ou 3 est un point de fragilité : le jour où elle est absente, l''activité s''arrête. Chez Garnier, la peinture (Nadia seule) et l''administratif client (Sophie seule) sont deux risques majeurs.

Où sont les besoins de formation ? Une compétence nécessaire à l''activité, avec personne au niveau 3 pour la transmettre, appelle une formation externe. Une compétence avec un seul niveau 3 appelle un binôme interne.

Qui peut évoluer ? Une personne qui accumule des niveaux 3 est un formateur interne potentiel, ou un futur adjoint. Une personne qui n''a que des 1 depuis longtemps pose une question : manque de formation, ou mauvais poste ?

Faut-il recruter ? Si une compétence indispensable manque durablement et ne peut pas s''acquérir en interne dans un délai raisonnable, la matrice donne l''argument objectif pour demander un recrutement.

## Handicap et compétences

Un point que l''on oublie : les compétences se jugent sur le résultat attendu, pas sur la manière de l''atteindre. Fatou, avec sa restriction de port de charge, est au niveau 2 en préparation des surfaces : elle sait faire, à condition que l''organisation prévoie une aide pour la manutention lourde. La matrice doit noter la compétence réelle et, à part, l''aménagement nécessaire. Nous y reviendrons dans la leçon sur le handicap (2.8).

## La fiche de poste

La matrice vous donne ce que l''activité demande ; la fiche de poste dit ce que vous attendez d''une personne. Une fiche de poste utile tient sur une page : intitulé, rattachement, finalité du poste en une phrase, activités principales, compétences requises (avec le niveau attendu), relations de travail, moyens, indicateurs de réussite.

Elle sert à recruter, à intégrer, à évaluer, et à éviter les « ce n''est pas mon travail ». Elle n''est pas un carcan : elle décrit le cœur du poste, pas chaque geste. Et elle se met à jour : une fiche de poste de 2019 décrit un poste de 2019.

Karim n''a pas de fiche de poste. C''est la première qu''il devrait écrire, avec Michel, puisqu''elle formalise le cadrage vu au module 1.

## Le cas Garnier

La matrice de l''atelier fait apparaître quatre constats. La peinture repose sur Nadia seule : Julien, intéressé, pourrait monter au niveau 1 en six mois avec elle. Le contrôle qualité final n''est au niveau 3 que chez Thierry, et personne ne le pratique : c''est une compétence à installer, avec Thierry comme référent. La commande de pièces n''est maîtrisée que par Michel : Sophie doit y être formée. Lucas est au niveau 1 partout, ce qui est normal en deuxième année, mais personne n''a formalisé sa progression attendue.

## À retenir

- Raisonnez par activité et par étape, pas par personne.
- Une compétence s''observe sur le résultat ; l''échelle 0-3 suffit.
- La matrice se remplit avec les personnes, pas contre elles.
- Elle révèle les risques (compétence portée par une seule personne), les besoins de formation, les potentiels et les recrutements nécessaires.
- La fiche de poste tient sur une page et se met à jour.

## Sources

- France Compétences, référentiel RS7377 « Animer une équipe de travail », compétence 1.
- Guy Le Boterf, *Construire les compétences individuelles et collectives*, Eyrolles, 2000 (6e éd. 2015).
- ANACT, « Gestion des compétences et organisation du travail », ressources en ligne, anact.fr.
- INRS, « Polyvalence et organisation du travail », inrs.fr.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Avant de répartir le travail, il faut savoir de quelles compétences l''activité a besoin, et lesquelles l''équipe possède. C''est la première compétence du référentiel « Animer une équipe de travail » : identifier les compétences nécessaires à la réalisation d''une activité, d''un service ou d''un projet. C''est aussi celle que les managers de proximité pratiquent le moins, parce qu''ils « connaissent leur équipe ». Ils la connaissent souvent moins bien qu''ils ne le croient.

## Trois notions à distinguer

Une compétence est la capacité à réaliser une tâche dans une situation donnée, avec le niveau de qualité attendu. Elle combine des savoirs (connaître les étapes d''une mise en peinture), des savoir-faire (les exécuter) et des savoir-être (la rigueur nécessaire pour ne pas sauter une étape). Une compétence s''observe : elle se juge sur le résultat, pas sur le diplôme.

Un poste est un ensemble de tâches confiées à une personne. Il est décrit par une fiche de poste : missions, activités, compétences requises, rattachement, moyens.

Une activité est ce que l''équipe produit : réparer des véhicules de flotte, tenir l''accueil, assurer la mécanique liée aux chocs. Une activité mobilise plusieurs postes et plusieurs compétences.

L''erreur classique consiste à raisonner par personnes (« Thierry fait la carrosserie ») au lieu de raisonner par activité (« la réparation d''un véhicule de flotte demande dix compétences, qui les détient ? »). La seconde approche fait apparaître les trous.

## La méthode en quatre étapes

## 1. Décrire l''activité

Listez les activités de l''équipe, puis découpez chacune en étapes. Pour un véhicule de flotte à l''atelier Garnier : réception et constat, devis et échange avec l''expert, commande des pièces, démontage et préparation, redressage et carrosserie, mécanique liée au choc, peinture, finition et remontage, contrôle qualité, nettoyage et restitution, facturation.

Ce découpage est déjà utile en soi : il fait apparaître des étapes que personne ne considère comme un vrai travail (le contrôle qualité, la commande des pièces) et qui sont pourtant celles où les problèmes naissent.

## 2. Lister les compétences par étape

Pour chaque étape, notez ce qu''il faut savoir faire. Restez concret : « réaliser un devis sur le logiciel de chiffrage » plutôt que « maîtriser l''administratif ». Vous obtenez une liste de dix à trente compétences pour une petite équipe.

Ajoutez les compétences transversales qui ne sont rattachées à aucune étape mais dont l''activité dépend : sécurité, relation client, utilisation des outils numériques, tutorat des apprentis.

## 3. Construire la matrice de compétences

La matrice croise les compétences (en lignes) et les personnes (en colonnes). Dans chaque case, un niveau. Une échelle simple à quatre niveaux suffit :

- 0 : ne sait pas faire
- 1 : sait faire avec aide ou supervision
- 2 : sait faire seul, au niveau attendu
- 3 : sait faire et peut former ou contrôler les autres

Remplissez-la avec les personnes concernées, pas dans votre coin : demandez à chacun de s''autoévaluer, puis confrontez à votre observation. Les écarts entre les deux sont une information précieuse pour l''entretien de progression.

## 4. Lire la matrice

La matrice répond à quatre questions.

Où sont les risques ? Toute compétence détenue par une seule personne au niveau 2 ou 3 est un point de fragilité : le jour où elle est absente, l''activité s''arrête. Chez Garnier, la peinture (Nadia seule) et l''administratif client (Sophie seule) sont deux risques majeurs.

Où sont les besoins de formation ? Une compétence nécessaire à l''activité, avec personne au niveau 3 pour la transmettre, appelle une formation externe. Une compétence avec un seul niveau 3 appelle un binôme interne.

Qui peut évoluer ? Une personne qui accumule des niveaux 3 est un formateur interne potentiel, ou un futur adjoint. Une personne qui n''a que des 1 depuis longtemps pose une question : manque de formation, ou mauvais poste ?

Faut-il recruter ? Si une compétence indispensable manque durablement et ne peut pas s''acquérir en interne dans un délai raisonnable, la matrice donne l''argument objectif pour demander un recrutement.

## Handicap et compétences

Un point que l''on oublie : les compétences se jugent sur le résultat attendu, pas sur la manière de l''atteindre. Fatou, avec sa restriction de port de charge, est au niveau 2 en préparation des surfaces : elle sait faire, à condition que l''organisation prévoie une aide pour la manutention lourde. La matrice doit noter la compétence réelle et, à part, l''aménagement nécessaire. Nous y reviendrons dans la leçon sur le handicap (2.8).

## La fiche de poste

La matrice vous donne ce que l''activité demande ; la fiche de poste dit ce que vous attendez d''une personne. Une fiche de poste utile tient sur une page : intitulé, rattachement, finalité du poste en une phrase, activités principales, compétences requises (avec le niveau attendu), relations de travail, moyens, indicateurs de réussite.

Elle sert à recruter, à intégrer, à évaluer, et à éviter les « ce n''est pas mon travail ». Elle n''est pas un carcan : elle décrit le cœur du poste, pas chaque geste. Et elle se met à jour : une fiche de poste de 2019 décrit un poste de 2019.

Karim n''a pas de fiche de poste. C''est la première qu''il devrait écrire, avec Michel, puisqu''elle formalise le cadrage vu au module 1.

## Le cas Garnier

La matrice de l''atelier fait apparaître quatre constats. La peinture repose sur Nadia seule : Julien, intéressé, pourrait monter au niveau 1 en six mois avec elle. Le contrôle qualité final n''est au niveau 3 que chez Thierry, et personne ne le pratique : c''est une compétence à installer, avec Thierry comme référent. La commande de pièces n''est maîtrisée que par Michel : Sophie doit y être formée. Lucas est au niveau 1 partout, ce qui est normal en deuxième année, mais personne n''a formalisé sa progression attendue.

## À retenir

- Raisonnez par activité et par étape, pas par personne.
- Une compétence s''observe sur le résultat ; l''échelle 0-3 suffit.
- La matrice se remplit avec les personnes, pas contre elles.
- Elle révèle les risques (compétence portée par une seule personne), les besoins de formation, les potentiels et les recrutements nécessaires.
- La fiche de poste tient sur une page et se met à jour.

## Sources

- France Compétences, référentiel RS7377 « Animer une équipe de travail », compétence 1.
- Guy Le Boterf, *Construire les compétences individuelles et collectives*, Eyrolles, 2000 (6e éd. 2015).
- ANACT, « Gestion des compétences et organisation du travail », ressources en ligne, anact.fr.
- INRS, « Polyvalence et organisation du travail », inrs.fr.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 3;
  n := n + 1;

  -- 2.4-repartir-les-roles.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Vous savez maintenant quelles compétences l''activité demande et qui les détient. Reste à organiser le travail : qui fait quoi, qui décide, qui est informé. C''est la compétence 2 du référentiel : structurer l''activité de l''équipe de travail en répartissant les rôles et missions.

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

Exemple pour « fixer les priorités du planning du lendemain » à l''atelier Garnier :

| Activité | Karim | Sophie | Michel | Carrossiers | Marc |
|---|---|---|---|---|---|
| Fixer les priorités du planning | A / R | C | I | I | C |
| Transmettre une demande client urgente | I | R | I | — | — |
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

Karim propose, en réunion d''équipe, quatre rôles nouveaux : Thierry, référent qualité (contrôle final avant restitution, tutorat technique de Julien) ; Sophie, coordinatrice des demandes clients (guichet unique, transmission à Karim avant midi) ; Nadia, référente peinture et formatrice de Julien sur la préparation ; Karim, responsable du planning et des priorités, avec Marc consulté chaque veille.

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

- France Compétences, référentiel RS7377, compétence 2.
- Project Management Institute, *PMBOK Guide*, 7e éd., 2021 — matrice d''affectation des responsabilités (RACI).
- Henry Mintzberg, *Structure et dynamique des organisations*, Éditions d''Organisation, 1982 — mécanismes de coordination.
- ANACT, « Charge de travail : de quoi parle-t-on ? », anact.fr.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Vous savez maintenant quelles compétences l''activité demande et qui les détient. Reste à organiser le travail : qui fait quoi, qui décide, qui est informé. C''est la compétence 2 du référentiel : structurer l''activité de l''équipe de travail en répartissant les rôles et missions.

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

Exemple pour « fixer les priorités du planning du lendemain » à l''atelier Garnier :

| Activité | Karim | Sophie | Michel | Carrossiers | Marc |
|---|---|---|---|---|---|
| Fixer les priorités du planning | A / R | C | I | I | C |
| Transmettre une demande client urgente | I | R | I | — | — |
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

Karim propose, en réunion d''équipe, quatre rôles nouveaux : Thierry, référent qualité (contrôle final avant restitution, tutorat technique de Julien) ; Sophie, coordinatrice des demandes clients (guichet unique, transmission à Karim avant midi) ; Nadia, référente peinture et formatrice de Julien sur la préparation ; Karim, responsable du planning et des priorités, avec Marc consulté chaque veille.

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

- France Compétences, référentiel RS7377, compétence 2.
- Project Management Institute, *PMBOK Guide*, 7e éd., 2021 — matrice d''affectation des responsabilités (RACI).
- Henry Mintzberg, *Structure et dynamique des organisations*, Éditions d''Organisation, 1982 — mécanismes de coordination.
- ANACT, « Charge de travail : de quoi parle-t-on ? », anact.fr.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 4;
  n := n + 1;

  -- 2.5-video-deleguer.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Type : vidéo avatar · Débit : 140 mots/min · Indications visuelles entre crochets
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

[Plan : avatar, fond clair. Titre : « Déléguer sans lâcher »]

Déléguer, c''est le geste que les nouveaux managers redoutent le plus. Trop tôt, on a l''impression d''abandonner. Trop tard, on s''épuise. Et quand ça se passe mal, on se dit qu''on aurait mieux fait de le faire soi-même.

Pourtant, déléguer n''est pas une option. C''est le seul moyen de dégager du temps pour manager, et c''est le principal levier pour faire progresser les gens. Cette vidéo vous donne une méthode en quatre points.

[Titre : « Ce qui se délègue, ce qui ne se délègue pas »]

Premier point : savoir quoi déléguer.

Se délègue tout ce qui relève de l''exécution et de l''expertise : les tâches que quelqu''un d''autre sait faire, ou peut apprendre à faire. La production, le contrôle technique, l''organisation d''un chantier, la formation d''un nouveau, la relation avec un fournisseur.

Ne se délègue pas ce qui fait le cœur du rôle de manager : fixer les objectifs, arbitrer les priorités, évaluer les personnes, recadrer, sanctionner, porter les décisions de la direction, gérer une crise. Vous pouvez vous faire aider sur ces sujets ; vous ne pouvez pas les confier.

Un test simple : si ça tourne mal, qui devra rendre des comptes ? Si c''est vous quoi qu''il arrive, vous pouvez déléguer l''exécution, mais vous gardez la responsabilité. On délègue le travail et l''autorité nécessaire pour le faire ; on ne délègue jamais la responsabilité finale.

[Titre : « Les niveaux de délégation »]

Deuxième point : déléguer n''est pas tout ou rien. Il y a des niveaux, et le bon niveau dépend de l''autonomie de la personne sur cette tâche, ce que vous avez vu avec le leadership situationnel.

[Schéma : échelle à 5 niveaux]

Niveau 1 : « Fais ceci, comme ceci, et montre-moi. » La personne exécute une consigne précise et vous vérifiez. C''est pour un débutant sur une tâche nouvelle.

Niveau 2 : « Fais ceci, et dis-moi avant de finaliser. » La personne organise le travail, vous validez avant la dernière étape.

Niveau 3 : « Fais ceci, propose-moi une solution, je décide. » La personne analyse et recommande ; vous tranchez.

Niveau 4 : « Décide, et tiens-moi informé. » La personne décide seule et vous rend compte après.

Niveau 5 : « C''est à toi. » La personne décide et ne rend compte que si un problème dépasse son périmètre.

L''erreur classique est de rester bloqué au niveau 1 ou 2 avec des gens qui sont prêts pour le niveau 4. Ils vivent ça comme de la défiance. L''erreur inverse, c''est de sauter au niveau 5 pour se débarrasser d''un sujet. Ça s''appelle abandonner, pas déléguer.

[Titre : « Le contrat de délégation »]

Troisième point : une délégation se contractualise. Pas par écrit forcément, mais explicitement. Cinq questions à régler au moment où vous confiez la mission.

Quoi : le résultat attendu, pas la méthode. « Aucun véhicule ne sort sans contrôle de finition », plutôt que la liste des points à vérifier, que Thierry connaît mieux que vous.

Pourquoi : le sens. « Trois reprises ce mois-ci, le client menace de partir. »

Jusqu''où : le périmètre et les limites. « Tu peux bloquer une restitution ; tu ne peux pas refaire une pièce sans m''en parler. »

Avec quoi : les moyens. Du temps, un outil, une information, une autorité vis-à-vis des autres. Une délégation sans moyens est un piège.

Quand : le point de contrôle. « On fait le point chaque vendredi pendant six semaines, puis mensuellement. »

Et une sixième question, que le manager doit se poser à lui-même : est-ce que j''accepte que ce soit fait autrement que je l''aurais fait ? Si la réponse est non, ne déléguez pas, vous allez reprendre le travail par-dessus l''épaule de la personne et la démotiver.

[Titre : « Suivre sans surveiller »]

Quatrième point : le suivi. Déléguer, ce n''est pas disparaître. C''est changer de mode de contrôle : de la vérification du travail au point sur le résultat.

Concrètement : des points fixés d''avance, pas des passages inopinés. Des questions sur les résultats et les difficultés, pas sur la méthode. Une disponibilité réelle si la personne a besoin d''aide, sans qu''elle se sente jugée de la demander.

Et une règle : quand quelque chose ne va pas, on traite le problème avec la personne, on ne reprend pas la mission. Reprendre une délégation à la première difficulté, c''est signaler à toute l''équipe que déléguer, chez vous, ne veut rien dire.

[Plan : reprise du cas]

À l''atelier Garnier, Karim délègue le contrôle qualité final à Thierry. Le quoi : aucune restitution sans contrôle. Le pourquoi : les reprises et le client Ferrand. Le jusqu''où : Thierry peut bloquer un véhicule ; pour toute reprise de plus de deux heures, il prévient Karim. Les moyens : une demi-heure par jour dégagée de la production, une fiche de contrôle qu''ils rédigent ensemble, et l''annonce du rôle à toute l''équipe par Michel. Le suivi : cinq minutes chaque vendredi.

Niveau de délégation : 4, « décide et tiens-moi informé », parce que Thierry est expert. Ce que Karim ne fait pas : lui expliquer comment contrôler une finition.

Résultat, trois semaines plus tard : zéro reprise, et Thierry qui dit à Julien « viens voir, je te montre ce que je regarde ». La délégation a fait de lui un allié.

[Plan rapproché]

Déléguer, c''est un investissement. Les premières semaines, ça prend plus de temps que de faire soi-même. C''est normal. Ce temps, vous le récupérez au centuple, en temps de management et en compétence dans l''équipe.

À tout de suite pour la leçon sur les priorités.

[Fondu, logo]

---

Sources : Hersey & Blanchard (leadership situationnel) ; Peter Drucker, *The Effective Executive* (1967) ; Linda Hill, *Becoming a Manager* (2003).
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Type : vidéo avatar · Débit : 140 mots/min · Indications visuelles entre crochets
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

[Plan : avatar, fond clair. Titre : « Déléguer sans lâcher »]

Déléguer, c''est le geste que les nouveaux managers redoutent le plus. Trop tôt, on a l''impression d''abandonner. Trop tard, on s''épuise. Et quand ça se passe mal, on se dit qu''on aurait mieux fait de le faire soi-même.

Pourtant, déléguer n''est pas une option. C''est le seul moyen de dégager du temps pour manager, et c''est le principal levier pour faire progresser les gens. Cette vidéo vous donne une méthode en quatre points.

[Titre : « Ce qui se délègue, ce qui ne se délègue pas »]

Premier point : savoir quoi déléguer.

Se délègue tout ce qui relève de l''exécution et de l''expertise : les tâches que quelqu''un d''autre sait faire, ou peut apprendre à faire. La production, le contrôle technique, l''organisation d''un chantier, la formation d''un nouveau, la relation avec un fournisseur.

Ne se délègue pas ce qui fait le cœur du rôle de manager : fixer les objectifs, arbitrer les priorités, évaluer les personnes, recadrer, sanctionner, porter les décisions de la direction, gérer une crise. Vous pouvez vous faire aider sur ces sujets ; vous ne pouvez pas les confier.

Un test simple : si ça tourne mal, qui devra rendre des comptes ? Si c''est vous quoi qu''il arrive, vous pouvez déléguer l''exécution, mais vous gardez la responsabilité. On délègue le travail et l''autorité nécessaire pour le faire ; on ne délègue jamais la responsabilité finale.

[Titre : « Les niveaux de délégation »]

Deuxième point : déléguer n''est pas tout ou rien. Il y a des niveaux, et le bon niveau dépend de l''autonomie de la personne sur cette tâche, ce que vous avez vu avec le leadership situationnel.

[Schéma : échelle à 5 niveaux]

Niveau 1 : « Fais ceci, comme ceci, et montre-moi. » La personne exécute une consigne précise et vous vérifiez. C''est pour un débutant sur une tâche nouvelle.

Niveau 2 : « Fais ceci, et dis-moi avant de finaliser. » La personne organise le travail, vous validez avant la dernière étape.

Niveau 3 : « Fais ceci, propose-moi une solution, je décide. » La personne analyse et recommande ; vous tranchez.

Niveau 4 : « Décide, et tiens-moi informé. » La personne décide seule et vous rend compte après.

Niveau 5 : « C''est à toi. » La personne décide et ne rend compte que si un problème dépasse son périmètre.

L''erreur classique est de rester bloqué au niveau 1 ou 2 avec des gens qui sont prêts pour le niveau 4. Ils vivent ça comme de la défiance. L''erreur inverse, c''est de sauter au niveau 5 pour se débarrasser d''un sujet. Ça s''appelle abandonner, pas déléguer.

[Titre : « Le contrat de délégation »]

Troisième point : une délégation se contractualise. Pas par écrit forcément, mais explicitement. Cinq questions à régler au moment où vous confiez la mission.

Quoi : le résultat attendu, pas la méthode. « Aucun véhicule ne sort sans contrôle de finition », plutôt que la liste des points à vérifier, que Thierry connaît mieux que vous.

Pourquoi : le sens. « Trois reprises ce mois-ci, le client menace de partir. »

Jusqu''où : le périmètre et les limites. « Tu peux bloquer une restitution ; tu ne peux pas refaire une pièce sans m''en parler. »

Avec quoi : les moyens. Du temps, un outil, une information, une autorité vis-à-vis des autres. Une délégation sans moyens est un piège.

Quand : le point de contrôle. « On fait le point chaque vendredi pendant six semaines, puis mensuellement. »

Et une sixième question, que le manager doit se poser à lui-même : est-ce que j''accepte que ce soit fait autrement que je l''aurais fait ? Si la réponse est non, ne déléguez pas, vous allez reprendre le travail par-dessus l''épaule de la personne et la démotiver.

[Titre : « Suivre sans surveiller »]

Quatrième point : le suivi. Déléguer, ce n''est pas disparaître. C''est changer de mode de contrôle : de la vérification du travail au point sur le résultat.

Concrètement : des points fixés d''avance, pas des passages inopinés. Des questions sur les résultats et les difficultés, pas sur la méthode. Une disponibilité réelle si la personne a besoin d''aide, sans qu''elle se sente jugée de la demander.

Et une règle : quand quelque chose ne va pas, on traite le problème avec la personne, on ne reprend pas la mission. Reprendre une délégation à la première difficulté, c''est signaler à toute l''équipe que déléguer, chez vous, ne veut rien dire.

[Plan : reprise du cas]

À l''atelier Garnier, Karim délègue le contrôle qualité final à Thierry. Le quoi : aucune restitution sans contrôle. Le pourquoi : les reprises et le client Ferrand. Le jusqu''où : Thierry peut bloquer un véhicule ; pour toute reprise de plus de deux heures, il prévient Karim. Les moyens : une demi-heure par jour dégagée de la production, une fiche de contrôle qu''ils rédigent ensemble, et l''annonce du rôle à toute l''équipe par Michel. Le suivi : cinq minutes chaque vendredi.

Niveau de délégation : 4, « décide et tiens-moi informé », parce que Thierry est expert. Ce que Karim ne fait pas : lui expliquer comment contrôler une finition.

Résultat, trois semaines plus tard : zéro reprise, et Thierry qui dit à Julien « viens voir, je te montre ce que je regarde ». La délégation a fait de lui un allié.

[Plan rapproché]

Déléguer, c''est un investissement. Les premières semaines, ça prend plus de temps que de faire soi-même. C''est normal. Ce temps, vous le récupérez au centuple, en temps de management et en compétence dans l''équipe.

À tout de suite pour la leçon sur les priorités.

[Fondu, logo]

---

Sources : Hersey & Blanchard (leadership situationnel) ; Peter Drucker, *The Effective Executive* (1967) ; Linda Hill, *Becoming a Manager* (2003).
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 5;
  n := n + 1;

  -- 2.6-prioriser.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Un manager de proximité reçoit chaque jour plus de demandes qu''il ne peut en traiter : un client qui appelle, un collaborateur qui a une question, la direction qui veut un chiffre, une panne, une livraison en retard. Sans méthode, il traite ce qui crie le plus fort. Avec une méthode, il traite ce qui compte. Cette leçon donne trois outils et une discipline.

## Urgent et important ne sont pas la même chose

L''outil de base porte le nom du président américain Dwight Eisenhower, qui aurait dit : « Ce qui est important est rarement urgent, et ce qui est urgent est rarement important. » La matrice croise deux questions.

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

Les interruptions coûtent cher : après une interruption, il faut plusieurs minutes pour retrouver sa concentration sur une tâche complexe. Un carrossier interrompu trois fois par heure pour une question client ne fait pas trois fois moins, il fait moitié moins, et il fait des erreurs.

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

Karim tenait un carnet de ses journées pendant une semaine. Résultat : 60 % de son temps en urgences (clients au téléphone, pièce manquante, Michel qui demande un chiffre), 35 % en production, 5 % en management. La matrice d''Eisenhower lui montre que la plupart de ses urgences viennent de la même cause : pas de guichet unique, pas de planning validé la veille, pas de commande de pièces anticipée.

Il décide de trois priorités pour le mois : installer le circuit Sophie-Karim (qui supprime les appels directs), le planning validé à 17 h (qui supprime les arbitrages du matin), et la commande des pièces au moment du devis (qui supprime les attentes). Trois actions de la case « important, pas urgent », qui vident la case « urgent ».

## À retenir

- Important et urgent sont deux questions différentes ; le management se joue dans « important, pas urgent ».
- Trois priorités par jour, pas plus.
- Protégez le temps de l''équipe : guichet unique, plages protégées, définition des vraies urgences.
- Arbitrez avec trois critères (impact, engagement, effort) et expliquez.
- Trop d''urgences depuis trop longtemps signalent un défaut d''organisation en amont.

## Sources

- Stephen R. Covey, *Les 7 habitudes de ceux qui réalisent tout ce qu''ils entreprennent*, 1989 — matrice importance / urgence.
- Gloria Mark et al., « The Cost of Interrupted Work », *CHI Conference*, 2008 — coût des interruptions.
- Henry Mintzberg, *The Nature of Managerial Work*, 1973 — fragmentation du travail managérial.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Un manager de proximité reçoit chaque jour plus de demandes qu''il ne peut en traiter : un client qui appelle, un collaborateur qui a une question, la direction qui veut un chiffre, une panne, une livraison en retard. Sans méthode, il traite ce qui crie le plus fort. Avec une méthode, il traite ce qui compte. Cette leçon donne trois outils et une discipline.

## Urgent et important ne sont pas la même chose

L''outil de base porte le nom du président américain Dwight Eisenhower, qui aurait dit : « Ce qui est important est rarement urgent, et ce qui est urgent est rarement important. » La matrice croise deux questions.

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

Les interruptions coûtent cher : après une interruption, il faut plusieurs minutes pour retrouver sa concentration sur une tâche complexe. Un carrossier interrompu trois fois par heure pour une question client ne fait pas trois fois moins, il fait moitié moins, et il fait des erreurs.

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

Karim tenait un carnet de ses journées pendant une semaine. Résultat : 60 % de son temps en urgences (clients au téléphone, pièce manquante, Michel qui demande un chiffre), 35 % en production, 5 % en management. La matrice d''Eisenhower lui montre que la plupart de ses urgences viennent de la même cause : pas de guichet unique, pas de planning validé la veille, pas de commande de pièces anticipée.

Il décide de trois priorités pour le mois : installer le circuit Sophie-Karim (qui supprime les appels directs), le planning validé à 17 h (qui supprime les arbitrages du matin), et la commande des pièces au moment du devis (qui supprime les attentes). Trois actions de la case « important, pas urgent », qui vident la case « urgent ».

## À retenir

- Important et urgent sont deux questions différentes ; le management se joue dans « important, pas urgent ».
- Trois priorités par jour, pas plus.
- Protégez le temps de l''équipe : guichet unique, plages protégées, définition des vraies urgences.
- Arbitrez avec trois critères (impact, engagement, effort) et expliquez.
- Trop d''urgences depuis trop longtemps signalent un défaut d''organisation en amont.

## Sources

- Stephen R. Covey, *Les 7 habitudes de ceux qui réalisent tout ce qu''ils entreprennent*, 1989 — matrice importance / urgence.
- Gloria Mark et al., « The Cost of Interrupted Work », *CHI Conference*, 2008 — coût des interruptions.
- Henry Mintzberg, *The Nature of Managerial Work*, 1973 — fragmentation du travail managérial.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 6;
  n := n + 1;

  -- 2.7-tableau-de-bord.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Un tableau de bord est un petit nombre d''indicateurs, suivis régulièrement, qui disent si l''équipe atteint ses objectifs et où elle doit agir. C''est la compétence 3 du référentiel : mobiliser les outils de pilotage et d''évaluation de l''activité collective. Bien conçu, il tient sur une feuille et se lit en deux minutes. Mal conçu, c''est un fichier de quarante colonnes que personne n''ouvre.

## À quoi sert un tableau de bord

À trois choses, dans cet ordre : voir (où en est-on par rapport aux objectifs), comprendre (pourquoi l''écart), agir (que fait-on cette semaine). Un tableau de bord qui ne débouche pas sur des décisions est un rapport, pas un outil de pilotage.

Il sert aussi à communiquer : vers l''équipe, qui voit le résultat de ses efforts, et vers la hiérarchie, qui reçoit des faits plutôt que des impressions. C''est le support naturel du point hebdomadaire avec votre responsable, vu au module 1.

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
- L''indicateur qui devient l''objectif. Quand un indicateur est utilisé pour juger les personnes, il finit par être optimisé au détriment du résultat : on annonce des délais trop longs pour les tenir, on ne compte pas les petites reprises. C''est la loi de Goodhart. Le remède : des indicateurs collectifs, associés à leur garde-fou, et une discussion sur les causes plutôt qu''une sanction sur les chiffres.
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
| Heures supplémentaires | Moyens | Heures sup. de l''équipe ÷ heures travaillées | Mensuel | < 5 % | > 10 % |

Le dernier indicateur n''est pas un indicateur de production : c''est un garde-fou. Si les délais sont tenus au prix de 15 % d''heures supplémentaires, l''objectif n''est pas atteint, il est acheté à crédit sur la santé de l''équipe.

Au premier point hebdomadaire, le tableau montre 100 % de contrôles réalisés mais deux jours d''attente pièces : l''action de la semaine est la commande des pièces au moment du devis, pas un rappel à l''ordre des carrossiers.

## À retenir

- Voir, comprendre, agir : un tableau de bord sert à décider.
- Combinez indicateurs de résultat et de moyens ; ne pilotez pas au rétroviseur.
- Cinq à sept indicateurs, chacun défini par écrit (formule, source, fréquence, cible, alerte, responsable).
- Un visuel sobre, affiché, discuté chaque semaine.
- Méfiez-vous de l''indicateur qui devient l''objectif ; associez-lui un garde-fou.

## Sources

- France Compétences, référentiel RS7377, compétence 3.
- Robert S. Kaplan, David P. Norton, *The Balanced Scorecard*, Harvard Business School Press, 1996.
- Charles Goodhart, « Problems of Monetary Management », 1975 — loi de Goodhart ; Marilyn Strathern, 1997, pour la formulation courante.
- Alain Fernandez, *L''essentiel du tableau de bord*, Eyrolles, 5e éd., 2018.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Un tableau de bord est un petit nombre d''indicateurs, suivis régulièrement, qui disent si l''équipe atteint ses objectifs et où elle doit agir. C''est la compétence 3 du référentiel : mobiliser les outils de pilotage et d''évaluation de l''activité collective. Bien conçu, il tient sur une feuille et se lit en deux minutes. Mal conçu, c''est un fichier de quarante colonnes que personne n''ouvre.

## À quoi sert un tableau de bord

À trois choses, dans cet ordre : voir (où en est-on par rapport aux objectifs), comprendre (pourquoi l''écart), agir (que fait-on cette semaine). Un tableau de bord qui ne débouche pas sur des décisions est un rapport, pas un outil de pilotage.

Il sert aussi à communiquer : vers l''équipe, qui voit le résultat de ses efforts, et vers la hiérarchie, qui reçoit des faits plutôt que des impressions. C''est le support naturel du point hebdomadaire avec votre responsable, vu au module 1.

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
- L''indicateur qui devient l''objectif. Quand un indicateur est utilisé pour juger les personnes, il finit par être optimisé au détriment du résultat : on annonce des délais trop longs pour les tenir, on ne compte pas les petites reprises. C''est la loi de Goodhart. Le remède : des indicateurs collectifs, associés à leur garde-fou, et une discussion sur les causes plutôt qu''une sanction sur les chiffres.
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
| Heures supplémentaires | Moyens | Heures sup. de l''équipe ÷ heures travaillées | Mensuel | < 5 % | > 10 % |

Le dernier indicateur n''est pas un indicateur de production : c''est un garde-fou. Si les délais sont tenus au prix de 15 % d''heures supplémentaires, l''objectif n''est pas atteint, il est acheté à crédit sur la santé de l''équipe.

Au premier point hebdomadaire, le tableau montre 100 % de contrôles réalisés mais deux jours d''attente pièces : l''action de la semaine est la commande des pièces au moment du devis, pas un rappel à l''ordre des carrossiers.

## À retenir

- Voir, comprendre, agir : un tableau de bord sert à décider.
- Combinez indicateurs de résultat et de moyens ; ne pilotez pas au rétroviseur.
- Cinq à sept indicateurs, chacun défini par écrit (formule, source, fréquence, cible, alerte, responsable).
- Un visuel sobre, affiché, discuté chaque semaine.
- Méfiez-vous de l''indicateur qui devient l''objectif ; associez-lui un garde-fou.

## Sources

- France Compétences, référentiel RS7377, compétence 3.
- Robert S. Kaplan, David P. Norton, *The Balanced Scorecard*, Harvard Business School Press, 1996.
- Charles Goodhart, « Problems of Monetary Management », 1975 — loi de Goodhart ; Marilyn Strathern, 1997, pour la formulation courante.
- Alain Fernandez, *L''essentiel du tableau de bord*, Eyrolles, 5e éd., 2018.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 7;
  n := n + 1;

  -- 2.8-handicap-organiser-sans-exclure.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Un salarié sur huit en France est en situation de handicap au sens large, et dans 80 % des cas ce handicap est invisible : maladie chronique, trouble du dos, déficience auditive, trouble dys, trouble psychique. La probabilité que vous manageriez un jour une personne concernée est donc très élevée ; vous le faites peut-être déjà sans le savoir. Cette leçon correspond à la compétence 4 du référentiel : traiter les éventuelles situations de handicap dans l''organisation et l''animation de l''équipe.

Avertissement : les repères ci-dessous sont à jour en septembre 2026 ; la personne ressource sur toute situation concrète est le médecin du travail, avec l''appui de Cap emploi et de l''Agefiph.

## Le cadre en cinq points

## 1. La reconnaissance

La reconnaissance de la qualité de travailleur handicapé (RQTH) est attribuée par la commission des droits et de l''autonomie (CDAPH) de la MDPH, sur demande de la personne. Elle ouvre droit à des aides et à des aménagements. Le salarié n''est jamais obligé d''en informer son employeur : c''est une donnée de santé, protégée. S''il vous en informe, c''est un acte de confiance, et cette information ne doit pas circuler au-delà de ce qui est nécessaire pour l''organiser.

## 2. L''obligation d''emploi

Toute entreprise d''au moins 20 salariés doit employer des travailleurs handicapés à hauteur de 6 % de son effectif (Code du travail, L5212-2), ou verser une contribution à l''Agefiph. La déclaration se fait via la DSN. En dessous de 20 salariés, il n''y a pas d''obligation chiffrée, mais les obligations de non-discrimination et d''aménagement s''appliquent à tous.

## 3. L''aménagement raisonnable

L''employeur doit prendre « les mesures appropriées pour permettre aux travailleurs handicapés d''accéder à un emploi ou de conserver un emploi correspondant à leur qualification, de l''exercer ou d''y progresser », sous réserve que ces mesures n''entraînent pas de charge disproportionnée (L5213-6). Le refus de prendre ces mesures peut constituer une discrimination (L5213-6, dernier alinéa, et L1133-3). Les aides de l''Agefiph existent précisément pour que la charge ne soit pas disproportionnée.

## 4. Le médecin du travail

C''est lui qui prescrit les aménagements de poste, par écrit, à l''issue d''une visite (L4624-3). L''employeur doit les prendre en considération ; s''il refuse, il doit motiver son refus par écrit. Pour le manager, la prescription du médecin du travail est un cadre à appliquer, pas à discuter. Le salarié peut demander une visite à tout moment, sans passer par l''employeur.

## 5. Le référent handicap

Obligatoire dans les entreprises d''au moins 250 salariés (L5213-6-1), il est recommandé partout. Dans une PME, c''est souvent le dirigeant ou la personne chargée des RH. IDEAFORMA a le sien pour ses stagiaires ; votre entreprise doit savoir qui est le sien.

## Ce que le manager peut et doit faire

## Accueillir la parole

Si un collaborateur vous parle d''une difficulté de santé, écoutez, sans diagnostiquer et sans minimiser. Deux questions utiles : « Qu''est-ce qui te pose problème concrètement dans le travail ? » et « De quoi aurais-tu besoin ? » Puis proposez la visite auprès du médecin du travail, qui est le seul habilité à prescrire un aménagement. Ne demandez jamais le diagnostic : il ne vous regarde pas et vous n''en avez pas besoin pour organiser.

## Organiser à partir de la restriction, pas du handicap

Ce dont vous avez besoin, c''est de la restriction fonctionnelle : « pas de port de charge supérieure à dix kilos », « pas de travail en hauteur », « pauses toutes les deux heures », « pas d''horaires décalés ». Elle figure sur l''avis du médecin du travail. À partir de là, vous organisez, exactement comme pour n''importe quelle contrainte : matrice de compétences, répartition des rôles, binômes.

Les aménagements les plus fréquents sont simples : un outil (chariot, table réglable, logiciel de lecture d''écran), une organisation (binôme pour la manutention, télétravail partiel, horaires aménagés), du temps (une pause supplémentaire, un rythme adapté en reprise d''arrêt). L''Agefiph finance une partie du matériel et des adaptations, et Cap emploi accompagne l''entreprise dans les démarches.

## Protéger la confidentialité

Vous expliquez à l''équipe l''organisation, jamais la raison. « Fatou ne porte pas les pare-chocs, Lucas s''en charge quand elle prépare » suffit. Si un collègue demande pourquoi, la réponse est « c''est organisé comme ça ». Divulguer une information de santé est une faute, et c''est aussi le meilleur moyen que plus personne ne vous fasse confiance.

## Traiter l''équité, pas la faveur

Un aménagement peut susciter des remarques : « pourquoi elle et pas moi ? ». Elles se traitent par la règle, pas par la justification individuelle : l''entreprise adapte les postes aux contraintes reconnues, pour tout le monde, dans le cadre prévu par la loi. Le manager qui laisse passer ces remarques laisse s''installer une discrimination ; celui qui explique la règle une fois, fermement, la fait cesser.

## Anticiper la reprise

Après un arrêt long, la reprise est un moment sensible. La visite de reprise auprès du médecin du travail est obligatoire après un arrêt maladie de 60 jours ou tout arrêt pour accident du travail de 30 jours (R4624-31). Le manager prépare le retour : un entretien de reprise (ce qui a changé, ce qui est attendu, ce dont la personne a besoin), un poste éventuellement aménagé, et une charge progressive si le médecin le prescrit.

## Ce qu''il ne faut pas faire

- Décider seul qu''une personne « ne peut pas » faire une tâche à cause de son handicap : c''est au médecin du travail d''établir les restrictions, et au manager d''organiser.
- Écarter la personne de missions intéressantes « pour la protéger » : c''est une discrimination bienveillante, qui reste une discrimination.
- Compenser l''aménagement en chargeant silencieusement les autres : l''organisation doit être explicite et équitable.
- Utiliser la restriction comme argument dans une évaluation : on évalue le travail réalisé dans le cadre prévu.

## Le cas Garnier

Fatou a une RQTH pour une pathologie lombaire et une restriction de port de charge à dix kilos, prescrite par le médecin du travail. Jusqu''ici, « ça se gérait » : elle demandait de l''aide quand elle pouvait, et portait quand elle ne pouvait pas. Karim intègre la restriction dans l''organisation : la manutention des éléments lourds (pare-chocs, capots, portières) est confiée à Lucas et à Julien, inscrite au RACI ; un chariot de manutention est demandé, avec un dossier d''aide Agefiph monté par Michel avec Cap emploi ; Fatou devient référente de la préparation des surfaces, où elle est la meilleure. À l''équipe, Karim explique l''organisation, pas le dossier médical. Lucas, qui avait lâché « elle est ménagée », se voit répondre que l''atelier adapte les postes aux contraintes reconnues, point, et que sa propre contrainte à lui est d''arriver à l''heure.

## À retenir

- La RQTH est une donnée de santé : le salarié n''est pas tenu de la déclarer, et vous ne la divulguez jamais.
- L''aménagement raisonnable est une obligation ; son refus non motivé est une discrimination.
- Le médecin du travail prescrit, le manager organise à partir de la restriction, jamais du diagnostic.
- Expliquez l''organisation à l''équipe, pas la raison ; traitez les remarques par la règle.
- Agefiph et Cap emploi financent et accompagnent.

## Sources

- Code du travail : L5212-1 et suivants (obligation d''emploi), L5213-6 et L5213-6-1 (aménagements raisonnables, référent handicap), L1132-1 et L1133-3 (discrimination), L4624-3 (mesures proposées par le médecin du travail), R4624-31 (visite de reprise).
- Agefiph, « Aides et services aux entreprises », agefiph.fr ; Cap emploi, capemploi.info.
- Défenseur des droits, *Guide « Emploi des personnes en situation de handicap et aménagement raisonnable »*, 2017.
- DARES, « L''emploi des personnes handicapées », données 2023-2024.
- France Compétences, référentiel RS7377, compétence 4.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Un salarié sur huit en France est en situation de handicap au sens large, et dans 80 % des cas ce handicap est invisible : maladie chronique, trouble du dos, déficience auditive, trouble dys, trouble psychique. La probabilité que vous manageriez un jour une personne concernée est donc très élevée ; vous le faites peut-être déjà sans le savoir. Cette leçon correspond à la compétence 4 du référentiel : traiter les éventuelles situations de handicap dans l''organisation et l''animation de l''équipe.

Avertissement : les repères ci-dessous sont à jour en septembre 2026 ; la personne ressource sur toute situation concrète est le médecin du travail, avec l''appui de Cap emploi et de l''Agefiph.

## Le cadre en cinq points

## 1. La reconnaissance

La reconnaissance de la qualité de travailleur handicapé (RQTH) est attribuée par la commission des droits et de l''autonomie (CDAPH) de la MDPH, sur demande de la personne. Elle ouvre droit à des aides et à des aménagements. Le salarié n''est jamais obligé d''en informer son employeur : c''est une donnée de santé, protégée. S''il vous en informe, c''est un acte de confiance, et cette information ne doit pas circuler au-delà de ce qui est nécessaire pour l''organiser.

## 2. L''obligation d''emploi

Toute entreprise d''au moins 20 salariés doit employer des travailleurs handicapés à hauteur de 6 % de son effectif (Code du travail, L5212-2), ou verser une contribution à l''Agefiph. La déclaration se fait via la DSN. En dessous de 20 salariés, il n''y a pas d''obligation chiffrée, mais les obligations de non-discrimination et d''aménagement s''appliquent à tous.

## 3. L''aménagement raisonnable

L''employeur doit prendre « les mesures appropriées pour permettre aux travailleurs handicapés d''accéder à un emploi ou de conserver un emploi correspondant à leur qualification, de l''exercer ou d''y progresser », sous réserve que ces mesures n''entraînent pas de charge disproportionnée (L5213-6). Le refus de prendre ces mesures peut constituer une discrimination (L5213-6, dernier alinéa, et L1133-3). Les aides de l''Agefiph existent précisément pour que la charge ne soit pas disproportionnée.

## 4. Le médecin du travail

C''est lui qui prescrit les aménagements de poste, par écrit, à l''issue d''une visite (L4624-3). L''employeur doit les prendre en considération ; s''il refuse, il doit motiver son refus par écrit. Pour le manager, la prescription du médecin du travail est un cadre à appliquer, pas à discuter. Le salarié peut demander une visite à tout moment, sans passer par l''employeur.

## 5. Le référent handicap

Obligatoire dans les entreprises d''au moins 250 salariés (L5213-6-1), il est recommandé partout. Dans une PME, c''est souvent le dirigeant ou la personne chargée des RH. IDEAFORMA a le sien pour ses stagiaires ; votre entreprise doit savoir qui est le sien.

## Ce que le manager peut et doit faire

## Accueillir la parole

Si un collaborateur vous parle d''une difficulté de santé, écoutez, sans diagnostiquer et sans minimiser. Deux questions utiles : « Qu''est-ce qui te pose problème concrètement dans le travail ? » et « De quoi aurais-tu besoin ? » Puis proposez la visite auprès du médecin du travail, qui est le seul habilité à prescrire un aménagement. Ne demandez jamais le diagnostic : il ne vous regarde pas et vous n''en avez pas besoin pour organiser.

## Organiser à partir de la restriction, pas du handicap

Ce dont vous avez besoin, c''est de la restriction fonctionnelle : « pas de port de charge supérieure à dix kilos », « pas de travail en hauteur », « pauses toutes les deux heures », « pas d''horaires décalés ». Elle figure sur l''avis du médecin du travail. À partir de là, vous organisez, exactement comme pour n''importe quelle contrainte : matrice de compétences, répartition des rôles, binômes.

Les aménagements les plus fréquents sont simples : un outil (chariot, table réglable, logiciel de lecture d''écran), une organisation (binôme pour la manutention, télétravail partiel, horaires aménagés), du temps (une pause supplémentaire, un rythme adapté en reprise d''arrêt). L''Agefiph finance une partie du matériel et des adaptations, et Cap emploi accompagne l''entreprise dans les démarches.

## Protéger la confidentialité

Vous expliquez à l''équipe l''organisation, jamais la raison. « Fatou ne porte pas les pare-chocs, Lucas s''en charge quand elle prépare » suffit. Si un collègue demande pourquoi, la réponse est « c''est organisé comme ça ». Divulguer une information de santé est une faute, et c''est aussi le meilleur moyen que plus personne ne vous fasse confiance.

## Traiter l''équité, pas la faveur

Un aménagement peut susciter des remarques : « pourquoi elle et pas moi ? ». Elles se traitent par la règle, pas par la justification individuelle : l''entreprise adapte les postes aux contraintes reconnues, pour tout le monde, dans le cadre prévu par la loi. Le manager qui laisse passer ces remarques laisse s''installer une discrimination ; celui qui explique la règle une fois, fermement, la fait cesser.

## Anticiper la reprise

Après un arrêt long, la reprise est un moment sensible. La visite de reprise auprès du médecin du travail est obligatoire après un arrêt maladie de 60 jours ou tout arrêt pour accident du travail de 30 jours (R4624-31). Le manager prépare le retour : un entretien de reprise (ce qui a changé, ce qui est attendu, ce dont la personne a besoin), un poste éventuellement aménagé, et une charge progressive si le médecin le prescrit.

## Ce qu''il ne faut pas faire

- Décider seul qu''une personne « ne peut pas » faire une tâche à cause de son handicap : c''est au médecin du travail d''établir les restrictions, et au manager d''organiser.
- Écarter la personne de missions intéressantes « pour la protéger » : c''est une discrimination bienveillante, qui reste une discrimination.
- Compenser l''aménagement en chargeant silencieusement les autres : l''organisation doit être explicite et équitable.
- Utiliser la restriction comme argument dans une évaluation : on évalue le travail réalisé dans le cadre prévu.

## Le cas Garnier

Fatou a une RQTH pour une pathologie lombaire et une restriction de port de charge à dix kilos, prescrite par le médecin du travail. Jusqu''ici, « ça se gérait » : elle demandait de l''aide quand elle pouvait, et portait quand elle ne pouvait pas. Karim intègre la restriction dans l''organisation : la manutention des éléments lourds (pare-chocs, capots, portières) est confiée à Lucas et à Julien, inscrite au RACI ; un chariot de manutention est demandé, avec un dossier d''aide Agefiph monté par Michel avec Cap emploi ; Fatou devient référente de la préparation des surfaces, où elle est la meilleure. À l''équipe, Karim explique l''organisation, pas le dossier médical. Lucas, qui avait lâché « elle est ménagée », se voit répondre que l''atelier adapte les postes aux contraintes reconnues, point, et que sa propre contrainte à lui est d''arriver à l''heure.

## À retenir

- La RQTH est une donnée de santé : le salarié n''est pas tenu de la déclarer, et vous ne la divulguez jamais.
- L''aménagement raisonnable est une obligation ; son refus non motivé est une discrimination.
- Le médecin du travail prescrit, le manager organise à partir de la restriction, jamais du diagnostic.
- Expliquez l''organisation à l''équipe, pas la raison ; traitez les remarques par la règle.
- Agefiph et Cap emploi financent et accompagnent.

## Sources

- Code du travail : L5212-1 et suivants (obligation d''emploi), L5213-6 et L5213-6-1 (aménagements raisonnables, référent handicap), L1132-1 et L1133-3 (discrimination), L4624-3 (mesures proposées par le médecin du travail), R4624-31 (visite de reprise).
- Agefiph, « Aides et services aux entreprises », agefiph.fr ; Cap emploi, capemploi.info.
- Défenseur des droits, *Guide « Emploi des personnes en situation de handicap et aménagement raisonnable »*, 2017.
- DARES, « L''emploi des personnes handicapées », données 2023-2024.
- France Compétences, référentiel RS7377, compétence 4.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 8;
  n := n + 1;

  -- 2.9-podcast-tableau-de-bord.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Format : conversation à deux voix. **CLAIRE** = animatrice IDEAFORMA. **SANDRINE** = responsable d''une agence de services à la personne (14 salariés), promue responsable après six ans comme intervenante (personnage fictif). Débit : 150 mots/min.
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

**CLAIRE** — Bonjour à tous. Dans ce podcast, on parle pilotage, et surtout de ce qui se passe quand on n''en a pas. Sandrine, vous dirigez une agence de services à domicile depuis trois ans. Avant, vous étiez intervenante. Comment pilotiez-vous, au début ?

**SANDRINE** — Au ressenti, honnêtement. Je connaissais les bénéficiaires, je connaissais les intervenantes, je savais « à peu près » où on en était. Quand ma directrice régionale me demandait un chiffre, je le cherchais pendant deux heures dans le logiciel et je lui envoyais un truc dont je n''étais pas sûre.

**CLAIRE** — Et à quel moment ça a posé problème ?

**SANDRINE** — Le jour où on a perdu un gros contrat avec une mutuelle. Ils nous ont dit : « Vos interventions sont en retard une fois sur cinq. » Et moi, je suis tombée des nues. J''avais l''impression que ça allait. En fait, je voyais les retards qu''on me signalait, pas ceux qu''on ne me signalait pas.

**CLAIRE** — C''est exactement ce qu''on appelle piloter au rétroviseur. Vous voyez le problème quand il est déjà arrivé.

**SANDRINE** — Pire que ça : je le voyais quand quelqu''un d''autre me le montrait. Ma directrice m''a dit une phrase que je n''ai pas oubliée : « Si tu ne mesures pas, tu ne sais pas. Et si tu ne sais pas, tu ne manages pas, tu espères. »

**CLAIRE** — Qu''est-ce que vous avez fait ?

**SANDRINE** — La première chose, c''est que j''ai voulu tout mesurer. J''ai sorti un tableau Excel avec vingt-cinq colonnes. Taux de retard, heures facturées, heures non facturées, absences, kilomètres, satisfaction, réclamations, taux de remplacement… Et j''ai tenu ça trois semaines.

**CLAIRE** — Pourquoi trois semaines ?

**SANDRINE** — Parce que ça me prenait deux heures chaque lundi, que personne ne le regardait, et que moi-même je ne savais plus ce qui était important dedans. Vingt-cinq chiffres, c''est comme zéro chiffre.

**CLAIRE** — Donc vous êtes passée de rien à trop, et ensuite ?

**SANDRINE** — Ensuite j''ai fait ce que j''aurais dû faire au départ : je suis partie de mes objectifs. Ma directrice attendait trois choses : les interventions à l''heure, les plannings remplis, et pas de départ d''intervenante. Trois objectifs, donc trois indicateurs de résultat. Le taux d''interventions à l''heure, le taux de remplissage des plannings, et le turnover.

**CLAIRE** — Et vous avez ajouté des indicateurs de moyens ?

**SANDRINE** — Oui, mais ça, je l''ai compris plus tard. Au début, je n''avais que les trois résultats, et je les regardais à la fin du mois. C''était mieux, mais c''était encore du rétroviseur. Le déclic, c''est quand j''ai cherché pourquoi les interventions étaient en retard. En fait, c''était presque toujours la même cause : les plannings de la semaine étaient envoyés aux intervenantes le lundi matin, elles découvraient leurs trajets au dernier moment, et le premier retard de la journée se propageait sur toute la journée.

**CLAIRE** — Donc la cause était en amont.

**SANDRINE** — La cause, c''était le vendredi, pas le lundi. J''ai ajouté un indicateur : le pourcentage de plannings envoyés le jeudi soir. Ça, c''est un indicateur de moyens. Et là, ça devient intéressant, parce que je peux agir dessus chaque semaine. Si jeudi soir j''ai 60 % des plannings envoyés, je sais que lundi il y aura des retards, et je peux encore faire quelque chose vendredi.

**CLAIRE** — Combien d''indicateurs, au final ?

**SANDRINE** — Six. Trois de résultat, trois de moyens. Plannings envoyés le jeudi, remplacements trouvés en moins de 24 heures, et entretiens individuels réalisés dans le trimestre, parce que le turnover, ça se prévient en parlant aux gens avant qu''elles partent.

**CLAIRE** — Vous les regardez comment, ces six chiffres ?

**SANDRINE** — Chaque lundi, en réunion de coordination, dix minutes. C''est le premier point de l''ordre du jour. Le tableau est affiché dans le bureau, avec les six lignes, la valeur de la semaine, la cible, et une couleur. Vert, orange, rouge. On ne commente pas le vert. On regarde l''orange et le rouge, on cherche la cause, on décide une action, une seule, pour la semaine.

**CLAIRE** — Une seule ?

**SANDRINE** — Une seule. Au début, j''en décidais cinq, il ne s''en faisait aucune. Une action, tenue, ça change les chiffres de la semaine suivante. Et ça, l''équipe le voit. C''est ça qui a changé le rapport aux chiffres : au début, elles vivaient le tableau comme de la surveillance. Quand elles ont vu que l''orange devenait vert parce qu''on avait changé quelque chose ensemble, c''est devenu leur tableau.

**CLAIRE** — Il y a eu des effets pervers ? On parle souvent de l''indicateur qui devient l''objectif.

**SANDRINE** — Oui, un beau. Le taux d''interventions à l''heure a grimpé très vite. Trop vite. Et j''ai découvert que les intervenantes écourtaient la fin de certaines interventions pour arriver à l''heure à la suivante. Le chiffre était bon, le service était moins bon.

**CLAIRE** — Et vous avez fait quoi ?

**SANDRINE** — J''ai ajouté un garde-fou : la durée réelle des interventions par rapport à la durée prévue. Si on est à l''heure mais qu''on fait quarante minutes au lieu d''une heure, c''est rouge. Et surtout, j''ai arrêté de parler du taux d''à-l''heure comme d''une performance individuelle. C''est un chiffre de l''agence. On cherche les causes ensemble, on ne cherche pas les coupables.

**CLAIRE** — Ça, c''est un point important pour nos auditeurs : le tableau de bord sert à comprendre, pas à juger.

**SANDRINE** — Dès que les gens sentent que le chiffre sert à les juger, ils le manipulent. Pas par malhonnêteté : par instinct de protection. Si vous voulez des chiffres vrais, il faut qu''ils ne coûtent rien à dire.

**CLAIRE** — Et vis-à-vis de votre directrice, ça a changé quoi ?

**SANDRINE** — Tout. Avant, elle m''appelait pour me demander des chiffres, et j''étais sur la défensive. Maintenant, elle reçoit mon tableau le lundi midi, avec trois lignes de commentaire : ce qui va, ce qui ne va pas, ce que je fais. Elle ne m''appelle plus pour savoir, elle m''appelle pour discuter. Et quand j''ai besoin de quelque chose, une intervenante en plus, un logiciel, j''ai un chiffre pour le justifier.

**CLAIRE** — Si vous deviez donner trois conseils à quelqu''un qui construit son premier tableau de bord ?

**SANDRINE** — Un : partez de vos objectifs, pas de ce que le logiciel sait sortir. Deux : pas plus de six ou sept indicateurs, et pour chacun, une définition écrite, sinon vous passerez vos réunions à discuter du chiffre au lieu de l''action. Trois : regardez-le chaque semaine avec l''équipe, et décidez une action. Un tableau qu''on regarde seul dans son bureau, c''est un journal intime.

**CLAIRE** — Et le contrat avec la mutuelle ?

**SANDRINE** — On l''a récupéré l''année suivante. Avec le tableau de bord dans le dossier de candidature.

**CLAIRE** — Merci Sandrine. Pour résumer : sans mesure, on espère ; trop de mesure, on ne voit plus rien ; six indicateurs issus des objectifs, définis, affichés, discutés chaque semaine avec une action décidée, et un garde-fou pour chaque indicateur de résultat.

**SANDRINE** — Et des chiffres qui ne servent jamais à punir.

**CLAIRE** — Et des chiffres qui ne servent jamais à punir. À bientôt.

---

Repères mobilisés : indicateurs de résultat / de moyens (Kaplan & Norton, 1996) ; loi de Goodhart ; rituel hebdomadaire de pilotage.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Format : conversation à deux voix. **CLAIRE** = animatrice IDEAFORMA. **SANDRINE** = responsable d''une agence de services à la personne (14 salariés), promue responsable après six ans comme intervenante (personnage fictif). Débit : 150 mots/min.
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

**CLAIRE** — Bonjour à tous. Dans ce podcast, on parle pilotage, et surtout de ce qui se passe quand on n''en a pas. Sandrine, vous dirigez une agence de services à domicile depuis trois ans. Avant, vous étiez intervenante. Comment pilotiez-vous, au début ?

**SANDRINE** — Au ressenti, honnêtement. Je connaissais les bénéficiaires, je connaissais les intervenantes, je savais « à peu près » où on en était. Quand ma directrice régionale me demandait un chiffre, je le cherchais pendant deux heures dans le logiciel et je lui envoyais un truc dont je n''étais pas sûre.

**CLAIRE** — Et à quel moment ça a posé problème ?

**SANDRINE** — Le jour où on a perdu un gros contrat avec une mutuelle. Ils nous ont dit : « Vos interventions sont en retard une fois sur cinq. » Et moi, je suis tombée des nues. J''avais l''impression que ça allait. En fait, je voyais les retards qu''on me signalait, pas ceux qu''on ne me signalait pas.

**CLAIRE** — C''est exactement ce qu''on appelle piloter au rétroviseur. Vous voyez le problème quand il est déjà arrivé.

**SANDRINE** — Pire que ça : je le voyais quand quelqu''un d''autre me le montrait. Ma directrice m''a dit une phrase que je n''ai pas oubliée : « Si tu ne mesures pas, tu ne sais pas. Et si tu ne sais pas, tu ne manages pas, tu espères. »

**CLAIRE** — Qu''est-ce que vous avez fait ?

**SANDRINE** — La première chose, c''est que j''ai voulu tout mesurer. J''ai sorti un tableau Excel avec vingt-cinq colonnes. Taux de retard, heures facturées, heures non facturées, absences, kilomètres, satisfaction, réclamations, taux de remplacement… Et j''ai tenu ça trois semaines.

**CLAIRE** — Pourquoi trois semaines ?

**SANDRINE** — Parce que ça me prenait deux heures chaque lundi, que personne ne le regardait, et que moi-même je ne savais plus ce qui était important dedans. Vingt-cinq chiffres, c''est comme zéro chiffre.

**CLAIRE** — Donc vous êtes passée de rien à trop, et ensuite ?

**SANDRINE** — Ensuite j''ai fait ce que j''aurais dû faire au départ : je suis partie de mes objectifs. Ma directrice attendait trois choses : les interventions à l''heure, les plannings remplis, et pas de départ d''intervenante. Trois objectifs, donc trois indicateurs de résultat. Le taux d''interventions à l''heure, le taux de remplissage des plannings, et le turnover.

**CLAIRE** — Et vous avez ajouté des indicateurs de moyens ?

**SANDRINE** — Oui, mais ça, je l''ai compris plus tard. Au début, je n''avais que les trois résultats, et je les regardais à la fin du mois. C''était mieux, mais c''était encore du rétroviseur. Le déclic, c''est quand j''ai cherché pourquoi les interventions étaient en retard. En fait, c''était presque toujours la même cause : les plannings de la semaine étaient envoyés aux intervenantes le lundi matin, elles découvraient leurs trajets au dernier moment, et le premier retard de la journée se propageait sur toute la journée.

**CLAIRE** — Donc la cause était en amont.

**SANDRINE** — La cause, c''était le vendredi, pas le lundi. J''ai ajouté un indicateur : le pourcentage de plannings envoyés le jeudi soir. Ça, c''est un indicateur de moyens. Et là, ça devient intéressant, parce que je peux agir dessus chaque semaine. Si jeudi soir j''ai 60 % des plannings envoyés, je sais que lundi il y aura des retards, et je peux encore faire quelque chose vendredi.

**CLAIRE** — Combien d''indicateurs, au final ?

**SANDRINE** — Six. Trois de résultat, trois de moyens. Plannings envoyés le jeudi, remplacements trouvés en moins de 24 heures, et entretiens individuels réalisés dans le trimestre, parce que le turnover, ça se prévient en parlant aux gens avant qu''elles partent.

**CLAIRE** — Vous les regardez comment, ces six chiffres ?

**SANDRINE** — Chaque lundi, en réunion de coordination, dix minutes. C''est le premier point de l''ordre du jour. Le tableau est affiché dans le bureau, avec les six lignes, la valeur de la semaine, la cible, et une couleur. Vert, orange, rouge. On ne commente pas le vert. On regarde l''orange et le rouge, on cherche la cause, on décide une action, une seule, pour la semaine.

**CLAIRE** — Une seule ?

**SANDRINE** — Une seule. Au début, j''en décidais cinq, il ne s''en faisait aucune. Une action, tenue, ça change les chiffres de la semaine suivante. Et ça, l''équipe le voit. C''est ça qui a changé le rapport aux chiffres : au début, elles vivaient le tableau comme de la surveillance. Quand elles ont vu que l''orange devenait vert parce qu''on avait changé quelque chose ensemble, c''est devenu leur tableau.

**CLAIRE** — Il y a eu des effets pervers ? On parle souvent de l''indicateur qui devient l''objectif.

**SANDRINE** — Oui, un beau. Le taux d''interventions à l''heure a grimpé très vite. Trop vite. Et j''ai découvert que les intervenantes écourtaient la fin de certaines interventions pour arriver à l''heure à la suivante. Le chiffre était bon, le service était moins bon.

**CLAIRE** — Et vous avez fait quoi ?

**SANDRINE** — J''ai ajouté un garde-fou : la durée réelle des interventions par rapport à la durée prévue. Si on est à l''heure mais qu''on fait quarante minutes au lieu d''une heure, c''est rouge. Et surtout, j''ai arrêté de parler du taux d''à-l''heure comme d''une performance individuelle. C''est un chiffre de l''agence. On cherche les causes ensemble, on ne cherche pas les coupables.

**CLAIRE** — Ça, c''est un point important pour nos auditeurs : le tableau de bord sert à comprendre, pas à juger.

**SANDRINE** — Dès que les gens sentent que le chiffre sert à les juger, ils le manipulent. Pas par malhonnêteté : par instinct de protection. Si vous voulez des chiffres vrais, il faut qu''ils ne coûtent rien à dire.

**CLAIRE** — Et vis-à-vis de votre directrice, ça a changé quoi ?

**SANDRINE** — Tout. Avant, elle m''appelait pour me demander des chiffres, et j''étais sur la défensive. Maintenant, elle reçoit mon tableau le lundi midi, avec trois lignes de commentaire : ce qui va, ce qui ne va pas, ce que je fais. Elle ne m''appelle plus pour savoir, elle m''appelle pour discuter. Et quand j''ai besoin de quelque chose, une intervenante en plus, un logiciel, j''ai un chiffre pour le justifier.

**CLAIRE** — Si vous deviez donner trois conseils à quelqu''un qui construit son premier tableau de bord ?

**SANDRINE** — Un : partez de vos objectifs, pas de ce que le logiciel sait sortir. Deux : pas plus de six ou sept indicateurs, et pour chacun, une définition écrite, sinon vous passerez vos réunions à discuter du chiffre au lieu de l''action. Trois : regardez-le chaque semaine avec l''équipe, et décidez une action. Un tableau qu''on regarde seul dans son bureau, c''est un journal intime.

**CLAIRE** — Et le contrat avec la mutuelle ?

**SANDRINE** — On l''a récupéré l''année suivante. Avec le tableau de bord dans le dossier de candidature.

**CLAIRE** — Merci Sandrine. Pour résumer : sans mesure, on espère ; trop de mesure, on ne voit plus rien ; six indicateurs issus des objectifs, définis, affichés, discutés chaque semaine avec une action décidée, et un garde-fou pour chaque indicateur de résultat.

**SANDRINE** — Et des chiffres qui ne servent jamais à punir.

**CLAIRE** — Et des chiffres qui ne servent jamais à punir. À bientôt.

---

Repères mobilisés : indicateurs de résultat / de moyens (Kaplan & Norton, 1996) ; loi de Goodhart ; rituel hebdomadaire de pilotage.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 9;
  n := n + 1;

  -- 3.1-video-communication-du-manager.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Type : vidéo avatar · Débit : 140 mots/min · Indications visuelles entre crochets
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

[Plan : avatar, fond clair. Titre : « Module 3 — Communiquer, animer, conduire les entretiens »]

Bienvenue dans le module 3. Au module 1, vous avez vu que Mintzberg avait chronométré des managers : entre 60 et 80 % de leur temps passe en communication orale. Ce module est consacré à ce temps-là. Comment écouter, comment faire un retour, comment conduire un entretien, comment animer une réunion, comment parler à sa hiérarchie.

Commençons par une idée qui change tout : en tant que manager, vous ne communiquez jamais « pour rien ».

[Titre : « Tout ce que vous faites est un message »]

Quand vous êtes salarié dans une équipe, vos paroles sont des paroles. Quand vous êtes manager, elles deviennent des signaux. Un silence après une erreur, une remarque en passant, un e-mail envoyé à 22 h, une réunion annulée : tout est interprété, parce que tout le monde essaie de comprendre ce que le chef pense et ce qu''il attend.

Cela a une conséquence : vous ne pouvez pas ne pas communiquer. Si vous ne dites rien sur le retard de Lucas, vous avez communiqué que les retards sont tolérés. Si vous ne félicitez pas Nadia pour une peinture parfaite, vous avez communiqué que la qualité est normale et ne mérite pas un mot.

Le manager qui « ne dit rien pour ne pas faire de vagues » fait, en réalité, beaucoup de vagues.

[Titre : « Les quatre situations »]

Dans une semaine de manager, la communication prend quatre formes, et chacune a ses règles.

[Schéma : 4 cases — Écrit · Oral individuel · Réunion · Hiérarchie]

L''écrit : e-mails, messages, notes affichées, comptes rendus. Il trace, il informe, il ne convainc pas. On n''annonce pas une mauvaise nouvelle par écrit, on ne recadre pas par message, on ne règle pas un conflit par e-mail. L''écrit vient après l''oral, pour confirmer.

L''oral individuel : la conversation de couloir, le point de cinq minutes, l''entretien formel. C''est là que se joue la relation. Nous y consacrons quatre leçons : l''écoute active, le feedback, l''entretien de suivi et l''entretien de parcours professionnel.

La réunion : le moment collectif. Elle sert à aligner, décider, partager. Mal menée, elle coûte des heures et ne produit rien. La leçon 3.7 vous donne la méthode.

La hiérarchie : la communication vers le haut et depuis le haut. Vous en avez vu les principes au module 1 ; le podcast de ce module traite des situations difficiles : dire non, alerter, négocier.

[Titre : « Trois principes qui traversent tout »]

Trois principes valent pour les quatre situations.

Premier principe : les faits d''abord. Ce que vous avez vu, entendu, mesuré. Pas ce que vous en pensez, pas ce que vous supposez des intentions. « Tu es arrivé à 8 h 20 trois fois cette semaine » est un fait. « Tu t''en fiches » est une interprétation. Les faits se discutent ; les interprétations se contestent.

Deuxième principe : le bon canal. Ce qui est délicat se dit en face, seul à seul. Ce qui concerne tout le monde se dit en réunion. Ce qui doit être retenu s''écrit. Inverser les canaux — recadrer en réunion, annoncer une réorganisation par e-mail — crée des dégâts que le contenu du message ne justifiait pas.

Troisième principe : l''écoute avant la parole. La plupart des managers parlent trop et écoutent peu. Ils arrivent en entretien avec leur conclusion. Or, ce que vous ne savez pas est presque toujours plus important que ce que vous voulez dire. La leçon suivante y est consacrée.

[Plan : reprise du cas]

À l''atelier Garnier, ce module va suivre Karim dans trois situations : un retour à faire à Julien après ses reprises, un entretien avec Marc qui se sent oublié, un recadrage de Lucas sur ses retards. Et sa première réunion d''équipe, celle où l''organisation du module 2 est présentée.

Vous verrez qu''il n''y a pas de recette miracle, mais des méthodes simples qui évitent les erreurs qui coûtent cher.

À tout de suite pour l''écoute active.

[Fondu, logo]

---

Sources : Mintzberg (1973) ; Paul Watzlawick, *Une logique de la communication* (1967) — « on ne peut pas ne pas communiquer ».
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Type : vidéo avatar · Débit : 140 mots/min · Indications visuelles entre crochets
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

[Plan : avatar, fond clair. Titre : « Module 3 — Communiquer, animer, conduire les entretiens »]

Bienvenue dans le module 3. Au module 1, vous avez vu que Mintzberg avait chronométré des managers : entre 60 et 80 % de leur temps passe en communication orale. Ce module est consacré à ce temps-là. Comment écouter, comment faire un retour, comment conduire un entretien, comment animer une réunion, comment parler à sa hiérarchie.

Commençons par une idée qui change tout : en tant que manager, vous ne communiquez jamais « pour rien ».

[Titre : « Tout ce que vous faites est un message »]

Quand vous êtes salarié dans une équipe, vos paroles sont des paroles. Quand vous êtes manager, elles deviennent des signaux. Un silence après une erreur, une remarque en passant, un e-mail envoyé à 22 h, une réunion annulée : tout est interprété, parce que tout le monde essaie de comprendre ce que le chef pense et ce qu''il attend.

Cela a une conséquence : vous ne pouvez pas ne pas communiquer. Si vous ne dites rien sur le retard de Lucas, vous avez communiqué que les retards sont tolérés. Si vous ne félicitez pas Nadia pour une peinture parfaite, vous avez communiqué que la qualité est normale et ne mérite pas un mot.

Le manager qui « ne dit rien pour ne pas faire de vagues » fait, en réalité, beaucoup de vagues.

[Titre : « Les quatre situations »]

Dans une semaine de manager, la communication prend quatre formes, et chacune a ses règles.

[Schéma : 4 cases — Écrit · Oral individuel · Réunion · Hiérarchie]

L''écrit : e-mails, messages, notes affichées, comptes rendus. Il trace, il informe, il ne convainc pas. On n''annonce pas une mauvaise nouvelle par écrit, on ne recadre pas par message, on ne règle pas un conflit par e-mail. L''écrit vient après l''oral, pour confirmer.

L''oral individuel : la conversation de couloir, le point de cinq minutes, l''entretien formel. C''est là que se joue la relation. Nous y consacrons quatre leçons : l''écoute active, le feedback, l''entretien de suivi et l''entretien de parcours professionnel.

La réunion : le moment collectif. Elle sert à aligner, décider, partager. Mal menée, elle coûte des heures et ne produit rien. La leçon 3.7 vous donne la méthode.

La hiérarchie : la communication vers le haut et depuis le haut. Vous en avez vu les principes au module 1 ; le podcast de ce module traite des situations difficiles : dire non, alerter, négocier.

[Titre : « Trois principes qui traversent tout »]

Trois principes valent pour les quatre situations.

Premier principe : les faits d''abord. Ce que vous avez vu, entendu, mesuré. Pas ce que vous en pensez, pas ce que vous supposez des intentions. « Tu es arrivé à 8 h 20 trois fois cette semaine » est un fait. « Tu t''en fiches » est une interprétation. Les faits se discutent ; les interprétations se contestent.

Deuxième principe : le bon canal. Ce qui est délicat se dit en face, seul à seul. Ce qui concerne tout le monde se dit en réunion. Ce qui doit être retenu s''écrit. Inverser les canaux — recadrer en réunion, annoncer une réorganisation par e-mail — crée des dégâts que le contenu du message ne justifiait pas.

Troisième principe : l''écoute avant la parole. La plupart des managers parlent trop et écoutent peu. Ils arrivent en entretien avec leur conclusion. Or, ce que vous ne savez pas est presque toujours plus important que ce que vous voulez dire. La leçon suivante y est consacrée.

[Plan : reprise du cas]

À l''atelier Garnier, ce module va suivre Karim dans trois situations : un retour à faire à Julien après ses reprises, un entretien avec Marc qui se sent oublié, un recadrage de Lucas sur ses retards. Et sa première réunion d''équipe, celle où l''organisation du module 2 est présentée.

Vous verrez qu''il n''y a pas de recette miracle, mais des méthodes simples qui évitent les erreurs qui coûtent cher.

À tout de suite pour l''écoute active.

[Fondu, logo]

---

Sources : Mintzberg (1973) ; Paul Watzlawick, *Une logique de la communication* (1967) — « on ne peut pas ne pas communiquer ».
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 1;
  n := n + 1;

  -- 3.10-cas-pratique-trois-entretiens-garnier.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Trois situations, trois entretiens à préparer par écrit, avec les gabarits de la fiche 3.9. Travaillez d''abord seul, sans regarder le corrigé. Comptez 30 minutes. Puis comparez : il n''y a pas une seule bonne formulation, mais il y a des erreurs qu''il faut avoir évitées.

## Situation A — Thierry et la réunion

Lors de la première réunion d''équipe (leçon 3.7), Thierry, carrossier depuis 28 ans, a parlé quinze minutes sur « comment on faisait avant », a coupé Nadia deux fois, et a conclu par : « De toute façon, les plannings, on en a vu passer, ça dure trois semaines. » Devant l''équipe, Karim a cadré poliment. Le lendemain, il constate que Thierry n''a pas fait le contrôle des finitions de Julien, alors que la décision a été prise en réunion.

Question A1 — Karim doit-il faire un feedback à Thierry ? Sur quoi exactement : la prise de parole en réunion, le contrôle non fait, ou les deux ? Dans quel ordre ?

Question A2 — Préparez le feedback avec le gabarit 1 (SBI). Rédigez les phrases que Karim prononce, y compris la question finale.

Question A3 — Thierry répond : « Je ne suis pas contremaître, moi. Si tu veux un contrôleur, tu le paies. » Que répond Karim ?

## Situation B — L''entretien de suivi de Sophie

Sophie, secrétaire depuis 15 ans, vit mal le nouveau circuit des demandes (elle ne donne plus de priorités directement aux carrossiers ; elle passe par Karim). Elle l''a dit à Michel, pas à Karim. Michel en a parlé à Karim : « Sophie dit que tu la mets de côté. » C''est le premier entretien de suivi de Karim avec Sophie ; ils étaient collègues il y a deux mois.

Question B1 — Comment Karim ouvre-t-il l''entretien ? Doit-il mentionner ce que Michel lui a rapporté ? Si oui, comment ?

Question B2 — Rédigez trois questions ouvertes que Karim pose, et une reformulation possible d''une réponse de Sophie.

Question B3 — Sophie dit : « Avant, quand un client appelait, je réglais ça en deux minutes avec Thierry. Maintenant il faut te trouver, et tu es sous une voiture. Les clients attendent. » Quel est le problème réel ? Quels engagements Karim peut-il prendre ?

## Situation C — Karim et Michel

Trois semaines après la réorganisation, les chiffres sont bons (délais tenus : 91 %, aucune reprise). Mais Michel a repris ses habitudes : mardi, il a changé le planning à 10 h sans prévenir pour faire passer un client ami, et vendredi il a crié sur Lucas devant tout le monde pour une pièce mal rangée. L''équipe regarde Karim.

Question C1 — Karim doit-il parler à Michel ? Comment qualifiez-vous cette communication (feedback, alerte, négociation) ?

Question C2 — Préparez l''échange avec le gabarit 5. Qu''est-ce que Karim demande à Michel de décider ?

Question C3 — Michel répond : « C''est mon atelier, je fais ce que je veux. » Qu''est-ce que Karim dit, et qu''est-ce qu''il fait ensuite ?

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

« Tu as raison sur un point : contrôler, c''est une responsabilité en plus. Je l''ai proposé parce que tu es le seul, avec moi, à voir un défaut de finition avant le client. Ce n''est pas un poste de contremaître, c''est dix minutes par véhicule. Sur la reconnaissance, je ne décide pas de ta paie, mais j''en parle à Michel à l''entretien de parcours : ton rôle de référent qualité doit y figurer. Ce que je te demande aujourd''hui, c''est que le contrôle soit fait. Est-ce qu''on est d''accord là-dessus ? »

Il note : la demande implicite de Thierry (reconnaissance de son expertise, peut-être financière), à porter à Michel ; l''échange lui-même, daté. Si Thierry refuse net, ce n''est plus un feedback, c''est un refus d''appliquer une consigne : recadrage, puis remontée à Michel. Erreurs à éviter : promettre une augmentation ; céder (« bon, laisse tomber ») ; répondre sur le ton.

## Situation B

B1. Karim ouvre comme pour tout entretien de suivi : objet, durée, question ouverte. Il ne commence pas par ce que Michel a rapporté, ce qui mettrait Sophie en position d''accusée et de rapporteuse. Il écoute d''abord. Si Sophie n''aborde pas le sujet d''elle-même, il l''introduit, en son nom à lui, sans citer Michel comme source d''une plainte : « J''ai le sentiment que le nouveau circuit des demandes te pèse. Je voudrais qu''on en parle. » Être transparent sur le fait que Michel lui a parlé n''est pas interdit, mais ce n''est utile que si Sophie le sait déjà ; sinon, cela crée un triangle.

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

Erreurs à éviter : se taire ; se plaindre de Michel devant l''équipe ; menacer de partir ; laisser Lucas seul avec ce qui s''est passé.

## Ce que ce cas illustre

Les trois entretiens utilisent la même matière : des faits datés, un impact concret, une attente ou une demande claire, une question, une trace. Ce qui change, c''est la direction (vers un collègue expérimenté, vers une ancienne collègue, vers le patron) et le dosage entre feedback, écoute et alerte. Un manager qui maîtrise cette matière peut affronter la plupart des situations sans improviser.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Trois situations, trois entretiens à préparer par écrit, avec les gabarits de la fiche 3.9. Travaillez d''abord seul, sans regarder le corrigé. Comptez 30 minutes. Puis comparez : il n''y a pas une seule bonne formulation, mais il y a des erreurs qu''il faut avoir évitées.

## Situation A — Thierry et la réunion

Lors de la première réunion d''équipe (leçon 3.7), Thierry, carrossier depuis 28 ans, a parlé quinze minutes sur « comment on faisait avant », a coupé Nadia deux fois, et a conclu par : « De toute façon, les plannings, on en a vu passer, ça dure trois semaines. » Devant l''équipe, Karim a cadré poliment. Le lendemain, il constate que Thierry n''a pas fait le contrôle des finitions de Julien, alors que la décision a été prise en réunion.

Question A1 — Karim doit-il faire un feedback à Thierry ? Sur quoi exactement : la prise de parole en réunion, le contrôle non fait, ou les deux ? Dans quel ordre ?

Question A2 — Préparez le feedback avec le gabarit 1 (SBI). Rédigez les phrases que Karim prononce, y compris la question finale.

Question A3 — Thierry répond : « Je ne suis pas contremaître, moi. Si tu veux un contrôleur, tu le paies. » Que répond Karim ?

## Situation B — L''entretien de suivi de Sophie

Sophie, secrétaire depuis 15 ans, vit mal le nouveau circuit des demandes (elle ne donne plus de priorités directement aux carrossiers ; elle passe par Karim). Elle l''a dit à Michel, pas à Karim. Michel en a parlé à Karim : « Sophie dit que tu la mets de côté. » C''est le premier entretien de suivi de Karim avec Sophie ; ils étaient collègues il y a deux mois.

Question B1 — Comment Karim ouvre-t-il l''entretien ? Doit-il mentionner ce que Michel lui a rapporté ? Si oui, comment ?

Question B2 — Rédigez trois questions ouvertes que Karim pose, et une reformulation possible d''une réponse de Sophie.

Question B3 — Sophie dit : « Avant, quand un client appelait, je réglais ça en deux minutes avec Thierry. Maintenant il faut te trouver, et tu es sous une voiture. Les clients attendent. » Quel est le problème réel ? Quels engagements Karim peut-il prendre ?

## Situation C — Karim et Michel

Trois semaines après la réorganisation, les chiffres sont bons (délais tenus : 91 %, aucune reprise). Mais Michel a repris ses habitudes : mardi, il a changé le planning à 10 h sans prévenir pour faire passer un client ami, et vendredi il a crié sur Lucas devant tout le monde pour une pièce mal rangée. L''équipe regarde Karim.

Question C1 — Karim doit-il parler à Michel ? Comment qualifiez-vous cette communication (feedback, alerte, négociation) ?

Question C2 — Préparez l''échange avec le gabarit 5. Qu''est-ce que Karim demande à Michel de décider ?

Question C3 — Michel répond : « C''est mon atelier, je fais ce que je veux. » Qu''est-ce que Karim dit, et qu''est-ce qu''il fait ensuite ?

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

« Tu as raison sur un point : contrôler, c''est une responsabilité en plus. Je l''ai proposé parce que tu es le seul, avec moi, à voir un défaut de finition avant le client. Ce n''est pas un poste de contremaître, c''est dix minutes par véhicule. Sur la reconnaissance, je ne décide pas de ta paie, mais j''en parle à Michel à l''entretien de parcours : ton rôle de référent qualité doit y figurer. Ce que je te demande aujourd''hui, c''est que le contrôle soit fait. Est-ce qu''on est d''accord là-dessus ? »

Il note : la demande implicite de Thierry (reconnaissance de son expertise, peut-être financière), à porter à Michel ; l''échange lui-même, daté. Si Thierry refuse net, ce n''est plus un feedback, c''est un refus d''appliquer une consigne : recadrage, puis remontée à Michel. Erreurs à éviter : promettre une augmentation ; céder (« bon, laisse tomber ») ; répondre sur le ton.

## Situation B

B1. Karim ouvre comme pour tout entretien de suivi : objet, durée, question ouverte. Il ne commence pas par ce que Michel a rapporté, ce qui mettrait Sophie en position d''accusée et de rapporteuse. Il écoute d''abord. Si Sophie n''aborde pas le sujet d''elle-même, il l''introduit, en son nom à lui, sans citer Michel comme source d''une plainte : « J''ai le sentiment que le nouveau circuit des demandes te pèse. Je voudrais qu''on en parle. » Être transparent sur le fait que Michel lui a parlé n''est pas interdit, mais ce n''est utile que si Sophie le sait déjà ; sinon, cela crée un triangle.

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

Erreurs à éviter : se taire ; se plaindre de Michel devant l''équipe ; menacer de partir ; laisser Lucas seul avec ce qui s''est passé.

## Ce que ce cas illustre

Les trois entretiens utilisent la même matière : des faits datés, un impact concret, une attente ou une demande claire, une question, une trace. Ce qui change, c''est la direction (vers un collègue expérimenté, vers une ancienne collègue, vers le patron) et le dosage entre feedback, écoute et alerte. Un manager qui maîtrise cette matière peut affronter la plupart des situations sans improviser.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 10;
  n := n + 1;

  -- 3.11-carnet-application.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Vous avez vu comment écouter, donner un feedback, conduire un entretien de suivi, distinguer l''entretien annuel de l''entretien de parcours professionnel, animer une réunion et communiquer vers votre hiérarchie. À vous de le faire pour votre équipe. Comptez 1 h 30 à 1 h 45. Utilisez les gabarits de la fiche outil (leçon 3.9).

Si vous n''encadrez pas d''équipe, travaillez sur une équipe que vous connaissez (actuelle ou passée), ou sur le cas Garnier en imaginant les situations de votre secteur.

## Étape 1 — Mon inventaire de communication (15 min)

- Sur la semaine écoulée, listez vos échanges de manager : combien d''écrits, combien de conversations individuelles, combien de réunions, combien d''échanges avec votre hiérarchie ? Un ordre de grandeur suffit.
- Pour chacune des quatre situations, notez une chose qui a bien fonctionné et une chose qui a coincé.
- Y a-t-il un message que vous avez envoyé par écrit et qui aurait dû se dire en face ? Un sujet que vous n''avez pas abordé et dont le silence a été « entendu » par l''équipe ?

## Étape 2 — Un feedback réel, préparé (20 min)

- Choisissez une situation récente où un retour s''imposait et n''a pas été fait, ou a été mal fait : un correctif et, obligatoirement, un positif.
- Préparez les deux avec le gabarit 1 : situation datée, comportement observable, impact, attente ou ce qu''il faut refaire, question finale, canal.
- Relisez : y a-t-il un jugement de personne caché dans le comportement (« brouillon », « pas motivé ») ? Remplacez-le par un fait.
- Fixez la date et le lieu où vous les donnerez cette semaine. Notez ici ce qui s''est passé après l''avoir fait.

## Étape 3 — Un entretien de suivi (25 min)

- Choisissez une personne de l''équipe avec qui vous n''avez pas eu de vrai temps individuel depuis longtemps. Préparez l''entretien avec le gabarit 2 : engagements précédents (s''il y en a), objectifs, un retour positif, questions.
- Rédigez vos trois questions ouvertes pour le temps « ressenti et besoins ».
- Planifiez pour le trimestre vos entretiens de suivi avec chacun : dates, durée, lieu. Combien d''heures par mois cela représente-t-il ? Est-ce tenable ? Sinon, qu''est-ce que vous retirez de votre agenda ?
- Vérifiez auprès de votre service RH (ou dans les dossiers) la date du dernier entretien de parcours professionnel de chaque membre de l''équipe et les échéances à venir (première année, quatre ans, 45 ans, avant 60 ans, bilan à huit ans). Notez les entretiens à programmer.

## Étape 4 — Ma prochaine réunion (20 min)

- Quel est l''objet de votre prochaine réunion d''équipe : informer, décider, résoudre ? Si vous ne savez pas répondre, faut-il la tenir ?
- Rédigez son ordre du jour avec le gabarit 4 : points formulés en résultats attendus, temps par point, décisions en premier, dernier point « qui fait quoi, pour quand ».
- Identifiez dans votre équipe un bavard, un silencieux, un négatif (il n''y en a pas toujours). Pour chacun, écrivez la phrase que vous utiliserez.
- Quels rituels votre équipe a-t-elle aujourd''hui (brief quotidien, point hebdo, réunion mensuelle) ? Lequel manque ? Lequel est inutile ?

## Étape 5 — Un message vers le haut (15 min)

- Identifiez un problème ou un besoin que vous n''avez pas encore remonté, ou que vous avez remonté sans obtenir de décision.
- Préparez-le avec le gabarit 5 : fait chiffré, impact, deux options, ce que vous demandez de décider, pour quand.
- Rédigez le message de confirmation écrite que vous enverrez après l''échange (« Comme convenu… »), en quatre lignes maximum.
- Y a-t-il un « on va faire au mieux » que vous avez prononcé récemment et qu''il faut transformer en « oui à ces conditions » ou en « non » ?

## Étape 6 — Bilan (10 min)

- Parmi les six compétences du module (écouter, faire un retour, conduire un entretien de suivi, entretien de parcours, animer une réunion, communiquer vers le haut), laquelle est votre point fort ? Laquelle est votre point faible ?
- Quelle est la première chose que vous faites dès demain ? Écrivez-la avec une date.
- Reprenez votre autopositionnement du module 0 : quelles réponses changeriez-vous ?

Conservez ce carnet : le module 4 (motivation, cohésion, conflits) s''appuiera sur les entretiens que vous aurez conduits entre-temps.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Vous avez vu comment écouter, donner un feedback, conduire un entretien de suivi, distinguer l''entretien annuel de l''entretien de parcours professionnel, animer une réunion et communiquer vers votre hiérarchie. À vous de le faire pour votre équipe. Comptez 1 h 30 à 1 h 45. Utilisez les gabarits de la fiche outil (leçon 3.9).

Si vous n''encadrez pas d''équipe, travaillez sur une équipe que vous connaissez (actuelle ou passée), ou sur le cas Garnier en imaginant les situations de votre secteur.

## Étape 1 — Mon inventaire de communication (15 min)

- Sur la semaine écoulée, listez vos échanges de manager : combien d''écrits, combien de conversations individuelles, combien de réunions, combien d''échanges avec votre hiérarchie ? Un ordre de grandeur suffit.
- Pour chacune des quatre situations, notez une chose qui a bien fonctionné et une chose qui a coincé.
- Y a-t-il un message que vous avez envoyé par écrit et qui aurait dû se dire en face ? Un sujet que vous n''avez pas abordé et dont le silence a été « entendu » par l''équipe ?

## Étape 2 — Un feedback réel, préparé (20 min)

- Choisissez une situation récente où un retour s''imposait et n''a pas été fait, ou a été mal fait : un correctif et, obligatoirement, un positif.
- Préparez les deux avec le gabarit 1 : situation datée, comportement observable, impact, attente ou ce qu''il faut refaire, question finale, canal.
- Relisez : y a-t-il un jugement de personne caché dans le comportement (« brouillon », « pas motivé ») ? Remplacez-le par un fait.
- Fixez la date et le lieu où vous les donnerez cette semaine. Notez ici ce qui s''est passé après l''avoir fait.

## Étape 3 — Un entretien de suivi (25 min)

- Choisissez une personne de l''équipe avec qui vous n''avez pas eu de vrai temps individuel depuis longtemps. Préparez l''entretien avec le gabarit 2 : engagements précédents (s''il y en a), objectifs, un retour positif, questions.
- Rédigez vos trois questions ouvertes pour le temps « ressenti et besoins ».
- Planifiez pour le trimestre vos entretiens de suivi avec chacun : dates, durée, lieu. Combien d''heures par mois cela représente-t-il ? Est-ce tenable ? Sinon, qu''est-ce que vous retirez de votre agenda ?
- Vérifiez auprès de votre service RH (ou dans les dossiers) la date du dernier entretien de parcours professionnel de chaque membre de l''équipe et les échéances à venir (première année, quatre ans, 45 ans, avant 60 ans, bilan à huit ans). Notez les entretiens à programmer.

## Étape 4 — Ma prochaine réunion (20 min)

- Quel est l''objet de votre prochaine réunion d''équipe : informer, décider, résoudre ? Si vous ne savez pas répondre, faut-il la tenir ?
- Rédigez son ordre du jour avec le gabarit 4 : points formulés en résultats attendus, temps par point, décisions en premier, dernier point « qui fait quoi, pour quand ».
- Identifiez dans votre équipe un bavard, un silencieux, un négatif (il n''y en a pas toujours). Pour chacun, écrivez la phrase que vous utiliserez.
- Quels rituels votre équipe a-t-elle aujourd''hui (brief quotidien, point hebdo, réunion mensuelle) ? Lequel manque ? Lequel est inutile ?

## Étape 5 — Un message vers le haut (15 min)

- Identifiez un problème ou un besoin que vous n''avez pas encore remonté, ou que vous avez remonté sans obtenir de décision.
- Préparez-le avec le gabarit 5 : fait chiffré, impact, deux options, ce que vous demandez de décider, pour quand.
- Rédigez le message de confirmation écrite que vous enverrez après l''échange (« Comme convenu… »), en quatre lignes maximum.
- Y a-t-il un « on va faire au mieux » que vous avez prononcé récemment et qu''il faut transformer en « oui à ces conditions » ou en « non » ?

## Étape 6 — Bilan (10 min)

- Parmi les six compétences du module (écouter, faire un retour, conduire un entretien de suivi, entretien de parcours, animer une réunion, communiquer vers le haut), laquelle est votre point fort ? Laquelle est votre point faible ?
- Quelle est la première chose que vous faites dès demain ? Écrivez-la avec une date.
- Reprenez votre autopositionnement du module 0 : quelles réponses changeriez-vous ?

Conservez ce carnet : le module 4 (motivation, cohésion, conflits) s''appuiera sur les entretiens que vous aurez conduits entre-temps.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 11;
  n := n + 1;

  -- 3.12-quiz.json
  update public.lecons l set contenu = '{"questions": [{"id": "m3q01", "enonce": "Un manager ne dit rien après le troisième retard d''un apprenti dans la semaine. Selon le principe de Watzlawick vu en leçon 3.1, que se passe-t-il ?", "options": ["Rien : le silence n''est pas une communication", "Il a communiqué que les retards sont tolérés", "L''apprenti comprendra tout seul qu''il exagère", "Il a gagné du temps pour préparer une sanction"], "bonnes": [1], "explication": "« On ne peut pas ne pas communiquer » : le silence du manager est lu comme un message par toute l''équipe. Ici, il signifie que le retard passe."}, {"id": "m3q02", "enonce": "Laquelle de ces phrases est une reformulation, au sens de l''écoute active ?", "options": ["« Je comprends, moi aussi j''ai connu ça à mes débuts. »", "« Tu devrais en parler à Sophie directement. »", "« Si je comprends bien, tu découvres les interventions au dernier moment et ça t''oblige à tout lâcher. »", "« Ne t''inquiète pas, ça va s''arranger. »"], "bonnes": [2], "explication": "Reformuler, c''est redire avec ses mots ce qu''on a compris pour le faire vérifier. Les autres réponses sont un récit de soi, un conseil et un réconfort prématuré, qui interrompent l''écoute."}, {"id": "m3q03", "enonce": "Quel biais consiste à expliquer les erreurs des autres par leur personnalité et les siennes par les circonstances ?", "options": ["L''effet de halo", "Le biais de confirmation", "La projection", "L''erreur fondamentale d''attribution"], "bonnes": [3], "explication": "C''est l''erreur fondamentale d''attribution décrite par Lee Ross. Le remède : chercher d''abord la cause dans la situation."}, {"id": "m3q04", "enonce": "Dans la méthode SBI, que désigne le « B » (Behavior, comportement) ?", "options": ["Ce que la personne a fait ou dit, observable, sans interprétation", "Ce que le manager pense de la personne", "Le besoin de la personne", "La bonne pratique à adopter"], "bonnes": [0], "explication": "Le comportement est un fait observable. « Une coulure sur l''aile arrière, véhicule sorti sans contrôle » est un comportement ; « tu es brouillon » est une étiquette."}, {"id": "m3q05", "enonce": "Pourquoi le feedback « sandwich » (compliment, critique, compliment) est-il déconseillé ?", "options": ["Parce qu''il est trop long", "Parce que la personne ne retient que le « mais », ou ne retient que les compliments, et apprend à se méfier des compliments", "Parce qu''il est interdit par le Code du travail", "Parce qu''il ne fonctionne qu''avec les nouveaux"], "bonnes": [1], "explication": "Le message correctif se perd ou se dilue, et les compliments deviennent suspects. Un correctif clair et respectueux, et des positifs sincères à d''autres moments, valent mieux."}, {"id": "m3q06", "enonce": "Plusieurs réponses. Quelles règles de forme s''appliquent à un feedback correctif ?", "options": ["Le donner rapidement après les faits", "Le donner en privé", "Regrouper plusieurs reproches pour n''avoir à le faire qu''une fois", "Terminer par une question ouverte"], "bonnes": [0, 1, 3], "explication": "Vite, en privé, un seul sujet à la fois, sur ce qui peut changer, avec une question. Regrouper six reproches n''en fait passer aucun."}, {"id": "m3q07", "enonce": "Dans la trame d''entretien individuel de suivi en cinq temps, à quoi sert le temps « ressenti et besoins » ?", "options": ["À évaluer la personnalité du salarié", "À détecter tôt les difficultés (surcharge, tensions, démotivation) avant qu''elles n''explosent", "À négocier une augmentation", "À remplir le compte rendu obligatoire de l''entretien de parcours professionnel"], "bonnes": [1], "explication": "C''est la partie que les managers sautent, et celle qui fait sortir les problèmes avant qu''ils ne coûtent cher. Le manager écoute et oriente si nécessaire ; il n''est ni médecin ni confident."}, {"id": "m3q08", "enonce": "Quelle est la différence essentielle entre l''entretien annuel d''évaluation et l''entretien de parcours professionnel ?", "options": ["Il n''y en a pas : ce sont deux noms pour le même entretien", "L''entretien annuel est obligatoire, l''entretien de parcours est facultatif", "L''entretien annuel, facultatif, porte sur le travail de l''année ; l''entretien de parcours, obligatoire (art. L6315-1), porte sur l''avenir professionnel et ne doit pas être une évaluation", "L''entretien de parcours est réservé aux salariés de plus de 45 ans"], "bonnes": [2], "explication": "L''évaluation annuelle relève du pouvoir de direction (sauf accord). L''entretien de parcours professionnel est une obligation légale au contenu fixé (compétences, formation, évolution, CPF, CEP), avec un écrit remis au salarié."}, {"id": "m3q09", "enonce": "Depuis la loi du 24 octobre 2025, quelle est la périodicité de droit commun de l''entretien de parcours professionnel, hors accord plus favorable ?", "options": ["Tous les ans", "Tous les deux ans, avec un bilan tous les six ans", "Dans la première année après l''embauche, puis tous les quatre ans, avec un état des lieux tous les huit ans, plus des entretiens à 45 ans et avant 60 ans", "Uniquement au retour d''un congé long"], "bonnes": [2], "explication": "C''est le nouveau rythme de l''article L6315-1. La convention collective ou un accord d''entreprise peut l''aménager : vérifiez toujours auprès des RH."}, {"id": "m3q10", "enonce": "Une réunion d''équipe de 30 minutes se termine sans qu''aucune décision ni action n''ait été formulée. Quelle est la conséquence principale ?", "options": ["Aucune : l''important est que l''équipe se soit vue", "L''équipe apprend que les réunions ne servent à rien, et les suivantes perdent leur crédibilité", "Le manager doit reconvoquer immédiatement", "Le CSE doit être informé"], "bonnes": [1], "explication": "Chaque point doit finir par : décidé quoi, qui, pour quand. Le relevé de décisions, suivi à la réunion suivante, est ce qui donne aux réunions leur crédibilité."}, {"id": "m3q11", "enonce": "En réunion, un participant reste silencieux pendant qu''un autre monopolise la parole. Quelle est la bonne conduite de l''animateur ?", "options": ["Laisser faire : le silencieux parlera s''il a quelque chose à dire", "Recadrer le bavard poliment en notant son point, et donner la parole nommément au silencieux sur une question précise", "Interrompre sèchement le bavard devant tout le monde", "Reporter la réunion"], "bonnes": [1], "explication": "Le bavard se cadre sans humiliation (« merci, je note, je voudrais entendre les autres ») ; le silencieux se sollicite par son nom, sur une question concrète. Un tour de table court est l''outil le plus efficace."}, {"id": "m3q12", "enonce": "Votre directeur vous demande d''absorber une charge que votre équipe ne peut pas tenir. Quelle réponse relève d''une communication de manager vers sa hiérarchie ?", "options": ["« On va faire au mieux. »", "« C''est impossible, débrouillez-vous. »", "« Avec l''équipe actuelle on tient la moitié en respectant les délais ; pour tout absorber il faut deux renforts ou accepter deux jours de retard sur le non prioritaire. Que préférez-vous ? » puis confirmation écrite", "Accepter, puis expliquer à l''équipe que c''est la faute de la direction"], "bonnes": [2], "explication": "Les faits, l''impact, des options, une décision demandée, puis l''écrit « comme convenu ». « Faire au mieux » n''est ni un oui ni un non ; désavouer la direction devant l''équipe rompt la loyauté."}], "seuil": 70, "tentatives_max": 3, "corrections": true, "consigne": "12 questions. Une seule bonne réponse par question, sauf mention « plusieurs réponses ». Seuil de réussite : 70 %."}'::jsonb, publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 12;
  n := n + 1;

  -- 3.2-ecoute-active.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Écouter est la compétence de management la plus sous-estimée. Elle paraît naturelle ; elle ne l''est pas. La plupart d''entre nous, pendant que l''autre parle, préparons notre réponse. Un manager qui écoute vraiment obtient trois choses que les autres n''ont pas : l''information réelle sur ce qui se passe, la confiance des personnes, et des solutions qu''il n''aurait pas trouvées seul.

## D''où vient l''écoute active

Le psychologue Carl Rogers, dans les années 1950, a décrit une attitude d''écoute qu''il appelait la considération positive inconditionnelle : accueillir ce que dit l''autre sans juger, sans interpréter, sans conseiller, et lui renvoyer ce qu''on a compris pour vérifier. Il l''a conçue pour la relation d''aide ; elle est devenue la base de tout entretien professionnel.

L''écoute active n''est pas de la complaisance : on peut écouter quelqu''un sans être d''accord avec lui. C''est une méthode pour comprendre avant de répondre.

## Les quatre composantes

## 1. Le silence et la disponibilité

Écouter commence par se taire, et par montrer qu''on écoute : téléphone rangé, regard disponible, corps tourné vers la personne. Un manager qui écoute en consultant ses messages n''écoute pas, et tout le monde le sait.

Le silence est un outil. Après une réponse, laissez deux ou trois secondes : c''est souvent là que vient ce qui compte. La plupart des managers remplissent ce silence et perdent l''information.

## 2. La reformulation

Reformuler, c''est redire avec vos mots ce que vous avez compris : « Si je comprends bien, tu n''as jamais l''information à temps, et ça t''oblige à improviser. » Trois effets : la personne se sent comprise, elle corrige si vous avez mal compris, et elle précise. La reformulation est la preuve que vous avez écouté ; elle vaut mieux que « je comprends », qui ne prouve rien.

On reformule les faits, mais aussi le ressenti quand il est présent : « Tu as l''impression d''être la cinquième roue du carrosse. » Nommer l''émotion ne l''amplifie pas ; ça la fait baisser.

## 3. Le questionnement

Les questions ouvertes ouvrent : « Comment ça se passe pour toi ? », « Qu''est-ce qui te manque ? », « Qu''est-ce que tu proposes ? ». Les questions fermées ferment : « Ça va ? », « Tu as le temps ? ». Un entretien conduit avec des questions fermées produit des oui et des non ; avec des questions ouvertes, il produit de l''information.

Trois questions particulièrement utiles : « Qu''est-ce qui s''est passé exactement ? » (les faits), « Qu''est-ce que tu as essayé ? » (les ressources de la personne), « De quoi aurais-tu besoin ? » (la solution vue par elle).

Évitez les questions qui sont des reproches déguisés : « Pourquoi tu n''as pas vérifié ? » n''est pas une question, c''est une accusation avec un point d''interrogation. Préférez : « Qu''est-ce qui a fait que le contrôle n''a pas été fait ? »

## 4. La suspension du jugement

C''est la partie difficile. Pendant l''écoute, on ne conseille pas, on ne juge pas, on ne raconte pas sa propre expérience, on ne rassure pas trop vite. Chacune de ces réactions, bien intentionnée, interrompt la personne et la ramène à votre point de vue. Le conseil viendra, plus tard, une fois que vous aurez compris. Et souvent, il ne sera plus nécessaire : la personne aura trouvé.

## Les biais d''interprétation

Écouter, c''est aussi se méfier de ce que notre cerveau ajoute. Quatre biais reviennent sans cesse chez les managers :

- L''effet de halo : une bonne (ou mauvaise) impression générale colore tout ce que la personne dit. Julien a fait deux reprises, donc tout ce qu''il dit sur l''organisation est suspect.
- L''attribution : on explique les erreurs des autres par leur personnalité (« il est brouillon ») et les nôtres par la situation (« j''étais débordé »). Le remède : chercher d''abord la cause dans la situation.
- La confirmation : on retient ce qui confirme ce qu''on pensait déjà. Le remède : chercher activement ce qui contredit.
- La projection : on suppose que l''autre ressent ce que nous ressentirions à sa place. Le remède : demander.

## Écouter ne veut pas dire céder

Une inquiétude fréquente : « si j''écoute tout le monde, je ne déciderai plus rien ». C''est confondre écouter et obéir. Écouter, c''est comprendre avant de décider. La décision reste la vôtre. Et une décision prise après avoir écouté est mieux acceptée, même quand elle ne va pas dans le sens de la personne, parce qu''elle sait que son point de vue a été entendu.

La formule utile : « J''ai bien compris ta position. Voilà ce que je décide, et voilà pourquoi. »

## Le cas Garnier — l''entretien avec Marc

Marc, le mécanicien, est venu dire qu''il « en a marre d''être la cinquième roue du carrosse ». Version sans écoute : Karim répond « je vais faire attention », et rien ne change. Version avec écoute :

Karim : « Raconte-moi ce qui s''est passé cette semaine. » (question ouverte, faits)

Marc : « Mardi, j''apprends à 14 h que la Clio de Ferrand doit passer en géométrie avant 17 h. Personne ne m''avait prévenu. J''étais sur la Kangoo. J''ai dû tout lâcher. »

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
- Questions ouvertes : « qu''est-ce qui s''est passé », « qu''est-ce que tu as essayé », « de quoi as-tu besoin ».
- Suspendre le jugement, le conseil et le récit de soi pendant l''écoute.
- Se méfier de ses biais : halo, attribution, confirmation, projection.
- Écouter n''est pas céder : comprendre, puis décider.

## Sources

- Carl R. Rogers, *Le développement de la personne*, Dunod, 1968 (éd. originale 1961).
- Carl Rogers, Richard Farson, « Active Listening », University of Chicago, 1957.
- Daniel Kahneman, *Système 1 / Système 2*, Flammarion, 2012 — biais cognitifs.
- Lee Ross, « The Intuitive Psychologist and His Shortcomings », 1977 — erreur fondamentale d''attribution.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Écouter est la compétence de management la plus sous-estimée. Elle paraît naturelle ; elle ne l''est pas. La plupart d''entre nous, pendant que l''autre parle, préparons notre réponse. Un manager qui écoute vraiment obtient trois choses que les autres n''ont pas : l''information réelle sur ce qui se passe, la confiance des personnes, et des solutions qu''il n''aurait pas trouvées seul.

## D''où vient l''écoute active

Le psychologue Carl Rogers, dans les années 1950, a décrit une attitude d''écoute qu''il appelait la considération positive inconditionnelle : accueillir ce que dit l''autre sans juger, sans interpréter, sans conseiller, et lui renvoyer ce qu''on a compris pour vérifier. Il l''a conçue pour la relation d''aide ; elle est devenue la base de tout entretien professionnel.

L''écoute active n''est pas de la complaisance : on peut écouter quelqu''un sans être d''accord avec lui. C''est une méthode pour comprendre avant de répondre.

## Les quatre composantes

## 1. Le silence et la disponibilité

Écouter commence par se taire, et par montrer qu''on écoute : téléphone rangé, regard disponible, corps tourné vers la personne. Un manager qui écoute en consultant ses messages n''écoute pas, et tout le monde le sait.

Le silence est un outil. Après une réponse, laissez deux ou trois secondes : c''est souvent là que vient ce qui compte. La plupart des managers remplissent ce silence et perdent l''information.

## 2. La reformulation

Reformuler, c''est redire avec vos mots ce que vous avez compris : « Si je comprends bien, tu n''as jamais l''information à temps, et ça t''oblige à improviser. » Trois effets : la personne se sent comprise, elle corrige si vous avez mal compris, et elle précise. La reformulation est la preuve que vous avez écouté ; elle vaut mieux que « je comprends », qui ne prouve rien.

On reformule les faits, mais aussi le ressenti quand il est présent : « Tu as l''impression d''être la cinquième roue du carrosse. » Nommer l''émotion ne l''amplifie pas ; ça la fait baisser.

## 3. Le questionnement

Les questions ouvertes ouvrent : « Comment ça se passe pour toi ? », « Qu''est-ce qui te manque ? », « Qu''est-ce que tu proposes ? ». Les questions fermées ferment : « Ça va ? », « Tu as le temps ? ». Un entretien conduit avec des questions fermées produit des oui et des non ; avec des questions ouvertes, il produit de l''information.

Trois questions particulièrement utiles : « Qu''est-ce qui s''est passé exactement ? » (les faits), « Qu''est-ce que tu as essayé ? » (les ressources de la personne), « De quoi aurais-tu besoin ? » (la solution vue par elle).

Évitez les questions qui sont des reproches déguisés : « Pourquoi tu n''as pas vérifié ? » n''est pas une question, c''est une accusation avec un point d''interrogation. Préférez : « Qu''est-ce qui a fait que le contrôle n''a pas été fait ? »

## 4. La suspension du jugement

C''est la partie difficile. Pendant l''écoute, on ne conseille pas, on ne juge pas, on ne raconte pas sa propre expérience, on ne rassure pas trop vite. Chacune de ces réactions, bien intentionnée, interrompt la personne et la ramène à votre point de vue. Le conseil viendra, plus tard, une fois que vous aurez compris. Et souvent, il ne sera plus nécessaire : la personne aura trouvé.

## Les biais d''interprétation

Écouter, c''est aussi se méfier de ce que notre cerveau ajoute. Quatre biais reviennent sans cesse chez les managers :

- L''effet de halo : une bonne (ou mauvaise) impression générale colore tout ce que la personne dit. Julien a fait deux reprises, donc tout ce qu''il dit sur l''organisation est suspect.
- L''attribution : on explique les erreurs des autres par leur personnalité (« il est brouillon ») et les nôtres par la situation (« j''étais débordé »). Le remède : chercher d''abord la cause dans la situation.
- La confirmation : on retient ce qui confirme ce qu''on pensait déjà. Le remède : chercher activement ce qui contredit.
- La projection : on suppose que l''autre ressent ce que nous ressentirions à sa place. Le remède : demander.

## Écouter ne veut pas dire céder

Une inquiétude fréquente : « si j''écoute tout le monde, je ne déciderai plus rien ». C''est confondre écouter et obéir. Écouter, c''est comprendre avant de décider. La décision reste la vôtre. Et une décision prise après avoir écouté est mieux acceptée, même quand elle ne va pas dans le sens de la personne, parce qu''elle sait que son point de vue a été entendu.

La formule utile : « J''ai bien compris ta position. Voilà ce que je décide, et voilà pourquoi. »

## Le cas Garnier — l''entretien avec Marc

Marc, le mécanicien, est venu dire qu''il « en a marre d''être la cinquième roue du carrosse ». Version sans écoute : Karim répond « je vais faire attention », et rien ne change. Version avec écoute :

Karim : « Raconte-moi ce qui s''est passé cette semaine. » (question ouverte, faits)

Marc : « Mardi, j''apprends à 14 h que la Clio de Ferrand doit passer en géométrie avant 17 h. Personne ne m''avait prévenu. J''étais sur la Kangoo. J''ai dû tout lâcher. »

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
- Questions ouvertes : « qu''est-ce qui s''est passé », « qu''est-ce que tu as essayé », « de quoi as-tu besoin ».
- Suspendre le jugement, le conseil et le récit de soi pendant l''écoute.
- Se méfier de ses biais : halo, attribution, confirmation, projection.
- Écouter n''est pas céder : comprendre, puis décider.

## Sources

- Carl R. Rogers, *Le développement de la personne*, Dunod, 1968 (éd. originale 1961).
- Carl Rogers, Richard Farson, « Active Listening », University of Chicago, 1957.
- Daniel Kahneman, *Système 1 / Système 2*, Flammarion, 2012 — biais cognitifs.
- Lee Ross, « The Intuitive Psychologist and His Shortcomings », 1977 — erreur fondamentale d''attribution.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 2;
  n := n + 1;

  -- 3.3-feedback.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Le feedback, ou retour, est l''information que vous donnez à quelqu''un sur son travail ou son comportement. C''est l''outil de management le plus puissant et le moins cher : il ne demande ni budget ni autorisation, seulement du courage et une méthode. Il est aussi le plus mal utilisé : trop rare, trop vague, trop tardif, ou blessant.

## Pourquoi le feedback est indispensable

Sans retour, une personne ne peut pas ajuster. Elle continue à faire ce qu''elle fait, en supposant que c''est ce qu''on attend. Les études sur l''engagement au travail montrent régulièrement que le manque de retour est l''une des premières causes de désengagement : les gens ne savent pas s''ils font bien, et ils finissent par ne plus s''en soucier.

Le feedback a deux formes, aussi nécessaires l''une que l''autre. Le feedback positif dit ce qui est bien et pourquoi, pour que la personne le refasse. Le feedback correctif dit ce qui doit changer et comment. Un manager qui ne donne que des retours correctifs est vécu comme un censeur ; un manager qui ne donne que des retours positifs n''est pas cru.

Le ratio compte. Les travaux sur les équipes performantes suggèrent qu''il faut nettement plus de retours positifs que de correctifs, non par gentillesse, mais parce qu''un retour positif précis apprend autant qu''un retour correctif : il dit quoi reproduire.

## La méthode SBI

Le Center for Creative Leadership, organisme de recherche américain sur le leadership, a formalisé la méthode la plus simple et la plus robuste : SBI, pour Situation, Behavior (comportement), Impact.

- La situation : quand et où. « Hier, sur la Clio de Ferrand, à la restitution. »
- Le comportement : ce que la personne a fait, observable, sans interprétation. « Le vernis présentait une coulure sur l''aile arrière, et le véhicule est parti sans contrôle. »
- L''impact : la conséquence, sur le client, l''équipe, l''entreprise, vous. « Le client a fait une réclamation écrite, on a repris le véhicule deux jours, et Michel s''est énervé devant tout le monde. »

Puis, pour un feedback correctif, on ajoute ce qu''on attend : « À partir de maintenant, chaque finition passe par le contrôle de Thierry avant restitution. »

La force de SBI, c''est qu''elle sépare le fait de l''interprétation. « Tu es brouillon » est une étiquette qu''on ne peut que contester. « Une coulure sur l''aile arrière » est un fait qu''on peut regarder ensemble.

Le même schéma vaut pour le positif : « Ce matin, sur la Kangoo, tu as repéré la fissure du pare-chocs que l''expert n''avait pas vue, tu l''as signalée à Sophie avant de commencer. Résultat : le complément de devis est passé sans discussion, et on n''a pas travaillé à perte. Continue à regarder comme ça. » Ce retour dit exactement quoi refaire.

## La méthode DESC pour les sujets sensibles

Quand le comportement à corriger touche à la relation (un manque de respect, une remarque déplacée, une consigne contournée), la méthode DESC, proposée par les psychologues Sharon et Gordon Bower, ajoute une étape de négociation :

- Décrire les faits (comme dans SBI).
- Exprimer ce que cela vous fait ou fait à l''équipe, en « je » : « Quand tu dis devant Julien que tu ne vas pas te laisser dire comment faire ton travail, je ne peux plus tenir mon rôle. »
- Spécifier ce que vous demandez, concrètement : « Quand tu n''es pas d''accord, tu me le dis en tête-à-tête. »
- Conclure sur les conséquences positives : « Comme ça, on peut discuter pour de vrai, et l''équipe n''est pas prise à témoin. »

DESC se prépare par écrit avant l''entretien. Les quatre phrases, pas plus.

## Les règles de forme

- Vite. Un retour a d''autant plus d''effet qu''il est proche du fait. Un correctif attendu trois semaines est vécu comme un règlement de comptes ; un positif attendu trois semaines est oublié.
- En privé pour le correctif, en public si possible pour le positif, sauf si la personne n''aime pas être mise en avant.
- Un seul sujet à la fois. Le feedback qui liste six reproches n''en fait passer aucun.
- Sur ce que la personne peut changer. Un retour sur un trait de personnalité ne sert à rien ; un retour sur un comportement sert.
- Avec une question à la fin : « Comment tu vois ça ? » Le feedback est le début d''une conversation, pas une sentence.

## Le sandwich, et pourquoi il ne marche pas

Beaucoup de managers ont appris à « emballer » le correctif entre deux compliments : « Tu fais du bon boulot, mais il y a eu cette coulure, sinon continue comme ça. » Résultat : la personne ne retient que le « mais », ou pire, ne retient que les compliments et ne change rien. Et elle apprend à se méfier des compliments, qui annoncent une critique.

Il vaut mieux un retour correctif clair, respectueux, avec la méthode SBI, et des retours positifs à d''autres moments, sincères et précis. La clarté est une forme de respect.

## Recevoir un feedback

Le manager donne des retours ; il doit aussi en recevoir, de son équipe et de sa hiérarchie. Quatre réflexes : remercier (même si ça pique), demander un exemple (pour transformer un jugement en fait), ne pas se justifier sur-le-champ (on peut répondre plus tard), et dire ce qu''on en fait. Un manager qui reçoit mal les retours n''en reçoit plus, et pilote à l''aveugle.

## Le cas Garnier — le retour à Julien

Version sans méthode (ce qui s''est passé) : Michel a crié devant tout le monde, Karim n''a rien dit, Julien a perdu confiance et fait sa deuxième reprise trois semaines plus tard.

Version SBI, le lendemain, dans le bureau :

« Hier, à la restitution de la Clio de Ferrand, il y avait une coulure sur l''aile arrière et le véhicule est parti sans que personne ne la voie. Le client a écrit, on reprend le véhicule deux jours, et ça retombe sur toute l''équipe. Je veux que ça n''arrive plus, et je vais t''y aider : jusqu''à Noël, chaque finition que tu termines passe par Thierry avant de sortir. Ce n''est pas une punition, c''est de l''apprentissage. Comment tu vois ça ? »

Julien : « Je vais trop vite sur le vernis, je le sais. Avec Thierry, ça m''irait. »

Et trois semaines plus tard, le positif, devant Thierry : « Trois finitions cette semaine, zéro remarque au contrôle. Le vernis sur la 308 est propre. C''est exactement ce qu''on attend. »

## À retenir

- Sans retour, personne ne peut ajuster ; le positif apprend autant que le correctif.
- SBI : situation, comportement observable, impact, puis ce qu''on attend.
- DESC pour les sujets relationnels : décrire, exprimer en « je », spécifier, conclure.
- Vite, en privé pour le correctif, un sujet à la fois, sur ce qui peut changer, avec une question.
- Pas de sandwich : la clarté est une forme de respect.
- Recevez les retours comme vous voulez qu''on reçoive les vôtres.

## Sources

- Center for Creative Leadership, *Feedback That Works: How to Build and Deliver Your Message*, 2e éd., 2019 — méthode SBI.
- Sharon A. Bower, Gordon H. Bower, *Asserting Yourself*, Addison-Wesley, 1976 — méthode DESC.
- Marcus Buckingham, Ashley Goodall, « The Feedback Fallacy », *Harvard Business Review*, mars-avril 2019.
- Gallup, *State of the Global Workplace*, éditions annuelles — feedback et engagement.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Le feedback, ou retour, est l''information que vous donnez à quelqu''un sur son travail ou son comportement. C''est l''outil de management le plus puissant et le moins cher : il ne demande ni budget ni autorisation, seulement du courage et une méthode. Il est aussi le plus mal utilisé : trop rare, trop vague, trop tardif, ou blessant.

## Pourquoi le feedback est indispensable

Sans retour, une personne ne peut pas ajuster. Elle continue à faire ce qu''elle fait, en supposant que c''est ce qu''on attend. Les études sur l''engagement au travail montrent régulièrement que le manque de retour est l''une des premières causes de désengagement : les gens ne savent pas s''ils font bien, et ils finissent par ne plus s''en soucier.

Le feedback a deux formes, aussi nécessaires l''une que l''autre. Le feedback positif dit ce qui est bien et pourquoi, pour que la personne le refasse. Le feedback correctif dit ce qui doit changer et comment. Un manager qui ne donne que des retours correctifs est vécu comme un censeur ; un manager qui ne donne que des retours positifs n''est pas cru.

Le ratio compte. Les travaux sur les équipes performantes suggèrent qu''il faut nettement plus de retours positifs que de correctifs, non par gentillesse, mais parce qu''un retour positif précis apprend autant qu''un retour correctif : il dit quoi reproduire.

## La méthode SBI

Le Center for Creative Leadership, organisme de recherche américain sur le leadership, a formalisé la méthode la plus simple et la plus robuste : SBI, pour Situation, Behavior (comportement), Impact.

- La situation : quand et où. « Hier, sur la Clio de Ferrand, à la restitution. »
- Le comportement : ce que la personne a fait, observable, sans interprétation. « Le vernis présentait une coulure sur l''aile arrière, et le véhicule est parti sans contrôle. »
- L''impact : la conséquence, sur le client, l''équipe, l''entreprise, vous. « Le client a fait une réclamation écrite, on a repris le véhicule deux jours, et Michel s''est énervé devant tout le monde. »

Puis, pour un feedback correctif, on ajoute ce qu''on attend : « À partir de maintenant, chaque finition passe par le contrôle de Thierry avant restitution. »

La force de SBI, c''est qu''elle sépare le fait de l''interprétation. « Tu es brouillon » est une étiquette qu''on ne peut que contester. « Une coulure sur l''aile arrière » est un fait qu''on peut regarder ensemble.

Le même schéma vaut pour le positif : « Ce matin, sur la Kangoo, tu as repéré la fissure du pare-chocs que l''expert n''avait pas vue, tu l''as signalée à Sophie avant de commencer. Résultat : le complément de devis est passé sans discussion, et on n''a pas travaillé à perte. Continue à regarder comme ça. » Ce retour dit exactement quoi refaire.

## La méthode DESC pour les sujets sensibles

Quand le comportement à corriger touche à la relation (un manque de respect, une remarque déplacée, une consigne contournée), la méthode DESC, proposée par les psychologues Sharon et Gordon Bower, ajoute une étape de négociation :

- Décrire les faits (comme dans SBI).
- Exprimer ce que cela vous fait ou fait à l''équipe, en « je » : « Quand tu dis devant Julien que tu ne vas pas te laisser dire comment faire ton travail, je ne peux plus tenir mon rôle. »
- Spécifier ce que vous demandez, concrètement : « Quand tu n''es pas d''accord, tu me le dis en tête-à-tête. »
- Conclure sur les conséquences positives : « Comme ça, on peut discuter pour de vrai, et l''équipe n''est pas prise à témoin. »

DESC se prépare par écrit avant l''entretien. Les quatre phrases, pas plus.

## Les règles de forme

- Vite. Un retour a d''autant plus d''effet qu''il est proche du fait. Un correctif attendu trois semaines est vécu comme un règlement de comptes ; un positif attendu trois semaines est oublié.
- En privé pour le correctif, en public si possible pour le positif, sauf si la personne n''aime pas être mise en avant.
- Un seul sujet à la fois. Le feedback qui liste six reproches n''en fait passer aucun.
- Sur ce que la personne peut changer. Un retour sur un trait de personnalité ne sert à rien ; un retour sur un comportement sert.
- Avec une question à la fin : « Comment tu vois ça ? » Le feedback est le début d''une conversation, pas une sentence.

## Le sandwich, et pourquoi il ne marche pas

Beaucoup de managers ont appris à « emballer » le correctif entre deux compliments : « Tu fais du bon boulot, mais il y a eu cette coulure, sinon continue comme ça. » Résultat : la personne ne retient que le « mais », ou pire, ne retient que les compliments et ne change rien. Et elle apprend à se méfier des compliments, qui annoncent une critique.

Il vaut mieux un retour correctif clair, respectueux, avec la méthode SBI, et des retours positifs à d''autres moments, sincères et précis. La clarté est une forme de respect.

## Recevoir un feedback

Le manager donne des retours ; il doit aussi en recevoir, de son équipe et de sa hiérarchie. Quatre réflexes : remercier (même si ça pique), demander un exemple (pour transformer un jugement en fait), ne pas se justifier sur-le-champ (on peut répondre plus tard), et dire ce qu''on en fait. Un manager qui reçoit mal les retours n''en reçoit plus, et pilote à l''aveugle.

## Le cas Garnier — le retour à Julien

Version sans méthode (ce qui s''est passé) : Michel a crié devant tout le monde, Karim n''a rien dit, Julien a perdu confiance et fait sa deuxième reprise trois semaines plus tard.

Version SBI, le lendemain, dans le bureau :

« Hier, à la restitution de la Clio de Ferrand, il y avait une coulure sur l''aile arrière et le véhicule est parti sans que personne ne la voie. Le client a écrit, on reprend le véhicule deux jours, et ça retombe sur toute l''équipe. Je veux que ça n''arrive plus, et je vais t''y aider : jusqu''à Noël, chaque finition que tu termines passe par Thierry avant de sortir. Ce n''est pas une punition, c''est de l''apprentissage. Comment tu vois ça ? »

Julien : « Je vais trop vite sur le vernis, je le sais. Avec Thierry, ça m''irait. »

Et trois semaines plus tard, le positif, devant Thierry : « Trois finitions cette semaine, zéro remarque au contrôle. Le vernis sur la 308 est propre. C''est exactement ce qu''on attend. »

## À retenir

- Sans retour, personne ne peut ajuster ; le positif apprend autant que le correctif.
- SBI : situation, comportement observable, impact, puis ce qu''on attend.
- DESC pour les sujets relationnels : décrire, exprimer en « je », spécifier, conclure.
- Vite, en privé pour le correctif, un sujet à la fois, sur ce qui peut changer, avec une question.
- Pas de sandwich : la clarté est une forme de respect.
- Recevez les retours comme vous voulez qu''on reçoive les vôtres.

## Sources

- Center for Creative Leadership, *Feedback That Works: How to Build and Deliver Your Message*, 2e éd., 2019 — méthode SBI.
- Sharon A. Bower, Gordon H. Bower, *Asserting Yourself*, Addison-Wesley, 1976 — méthode DESC.
- Marcus Buckingham, Ashley Goodall, « The Feedback Fallacy », *Harvard Business Review*, mars-avril 2019.
- Gallup, *State of the Global Workplace*, éditions annuelles — feedback et engagement.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 3;
  n := n + 1;

  -- 3.4-video-feedback-en-pratique.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Type : vidéo avatar, avec trois séquences jouées (voix off + texte à l''écran, ou second avatar). Débit : 140 mots/min.
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

[Plan : avatar. Titre : « Le feedback en pratique »]

Vous connaissez la méthode SBI : situation, comportement, impact, attente. Voyons-la fonctionner dans trois situations réelles, avec à chaque fois la version qui échoue et la version qui marche.

[Titre : « Situation 1 — Le retard répété »]

Lucas, apprenti, est arrivé en retard trois fois cette semaine. Personne n''a rien dit. Karim doit lui parler.

Version qui échoue, en passant, dans l''atelier, devant les autres :

[Texte à l''écran, voix off]
« Lucas, faut arrêter d''arriver à la bourre, hein. »
« Ouais, désolé, c''est le bus. »
« Bon. »

Ce qui s''est passé : pas de faits précis, une excuse acceptée, aucune attente formulée, et tout ça en public. Lucas a compris que ce n''était pas grave.

Version qui marche, dans le bureau, cinq minutes :

[Séquence jouée]
« Lucas, cette semaine tu es arrivé à 8 h 20 lundi, 8 h 15 mercredi et 8 h 25 vendredi, pour une prise de poste à 8 h. »
« Ouais, c''est le bus, il est jamais à l''heure. »
« Quand tu n''es pas là à 8 h, Fatou ne peut pas démonter, parce que c''est toi qui portes les éléments lourds. Elle attend, et ça décale toute la matinée. Et l''équipe voit que le retard passe sans rien. »
« Je savais pas pour Fatou. »
« Maintenant tu le sais. Ce que j''attends : tu es à 8 h au poste, tous les jours. Si le bus ne le permet pas, tu prends celui d''avant. Si un jour il y a un vrai problème, tu m''envoies un message avant 7 h 45. On se revoit dans deux semaines pour faire le point. Comment tu vois ça ? »
« C''est bon, je prendrai celui d''avant. »

[Retour avatar]
Ce qui a changé : des faits datés, un impact concret que Lucas ignorait, une attente précise avec une règle pour les exceptions, un point de suivi, et une question à la fin. Et Karim a noté la date et le contenu de l''entretien : si le retard continue, il aura la trace nécessaire pour alerter Michel.

[Titre : « Situation 2 — L''erreur client »]

Julien a livré un véhicule avec une coulure de vernis. Le client a réclamé.

Version qui échoue, celle de Michel, devant toute l''équipe :

[Texte à l''écran]
« C''est quoi ce travail ? Tu te fous du monde ? On a un client qui nous rend la voiture, tu crois qu''on peut se permettre ça ? »

Ce qui s''est passé : de l''humiliation publique, aucune méthode, et une question sans réponse possible. Julien a perdu confiance, et l''équipe a appris que les erreurs se paient en public. Prochaine erreur, on la cachera.

Version qui marche, le lendemain matin, seul à seul :

[Séquence jouée]
« Hier, à la restitution de la Clio de Ferrand, il y avait une coulure sur l''aile arrière, et le véhicule est parti sans contrôle. Le client a écrit, on reprend deux jours, et l''équipe encaisse. »
« Je sais. Je suis allé trop vite sur le vernis. »
« Qu''est-ce qui a fait que tu es allé trop vite ? »
« Il fallait rendre à 17 h, Sophie était venue deux fois me demander où j''en étais. »
« D''accord. Donc il y a un problème de finition et un problème de pression sur les délais. Le second, je m''en occupe : à partir de maintenant, les demandes de Sophie passent par moi. Le premier, on le règle ensemble : jusqu''à la fin de l''année, chaque finition passe par Thierry avant de sortir. Ce n''est pas une sanction, c''est comme ça qu''on apprend. Ça te va ? »
« Oui. Et je préfère que Thierry regarde, honnêtement. »

[Retour avatar]
Notez la question ouverte : « qu''est-ce qui a fait que ». Elle a révélé une cause d''organisation, la pression de Sophie, que Karim n''aurait pas vue s''il s''était contenté de recadrer. Une erreur a presque toujours deux causes : une cause individuelle et une cause d''organisation. Le feedback traite la première ; le manager traite la seconde.

[Titre : « Situation 3 — Le très bon travail »]

Nadia a réalisé une peinture complexe, un raccord de teinte nacrée, que le client a trouvée parfaite.

Version qui échoue : rien. Ou, en passant : « Nickel la 308. » Nadia n''a pas su ce qui était nickel, ni si quelqu''un l''avait vraiment regardé.

Version qui marche, à l''atelier, devant Julien qui apprend la peinture :

[Séquence jouée]
« Nadia, la 308 de ce matin. Le raccord sur la nacrée, on ne le voit pas, même sous le néon. Le client l''a dit à Sophie, et c''est ce genre de travail qui fait qu''on garde les flottes. Julien, viens voir, c''est ça qu''on vise. »
« C''est le dégradé sur trois passes, il faut prendre le temps. »
« Tu pourrais le montrer à Julien la semaine prochaine ? Une heure, sur la prochaine nacrée. »
« Oui, sans problème. »

[Retour avatar]
Un retour positif précis fait trois choses : il dit exactement ce qui est bien, donc ce qu''il faut refaire ; il relie le travail à un enjeu, garder les flottes ; et il donne de la reconnaissance devant les autres. Et Karim en a profité pour lancer le binôme peinture identifié dans la matrice de compétences. Un bon feedback positif est aussi un outil d''organisation.

[Titre : « Ce qu''il faut retenir »]

Dans les trois cas, la même trame : les faits, datés ; l''impact, concret ; l''attente, précise ; et une question. Dans les trois cas, le bon canal : le correctif en privé, le positif en public. Et dans les trois cas, une trace : Karim note dans son carnet la date et l''essentiel de l''échange.

Le feedback n''est pas un talent. C''est une méthode qui s''applique en cinq minutes, et qui, répétée, change une équipe.

À tout de suite pour l''entretien individuel de suivi.

[Fondu, logo]

---

Sources : Center for Creative Leadership, méthode SBI ; Bower & Bower, méthode DESC ; Edmondson (1999) sur les conséquences de l''humiliation publique des erreurs.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Type : vidéo avatar, avec trois séquences jouées (voix off + texte à l''écran, ou second avatar). Débit : 140 mots/min.
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

[Plan : avatar. Titre : « Le feedback en pratique »]

Vous connaissez la méthode SBI : situation, comportement, impact, attente. Voyons-la fonctionner dans trois situations réelles, avec à chaque fois la version qui échoue et la version qui marche.

[Titre : « Situation 1 — Le retard répété »]

Lucas, apprenti, est arrivé en retard trois fois cette semaine. Personne n''a rien dit. Karim doit lui parler.

Version qui échoue, en passant, dans l''atelier, devant les autres :

[Texte à l''écran, voix off]
« Lucas, faut arrêter d''arriver à la bourre, hein. »
« Ouais, désolé, c''est le bus. »
« Bon. »

Ce qui s''est passé : pas de faits précis, une excuse acceptée, aucune attente formulée, et tout ça en public. Lucas a compris que ce n''était pas grave.

Version qui marche, dans le bureau, cinq minutes :

[Séquence jouée]
« Lucas, cette semaine tu es arrivé à 8 h 20 lundi, 8 h 15 mercredi et 8 h 25 vendredi, pour une prise de poste à 8 h. »
« Ouais, c''est le bus, il est jamais à l''heure. »
« Quand tu n''es pas là à 8 h, Fatou ne peut pas démonter, parce que c''est toi qui portes les éléments lourds. Elle attend, et ça décale toute la matinée. Et l''équipe voit que le retard passe sans rien. »
« Je savais pas pour Fatou. »
« Maintenant tu le sais. Ce que j''attends : tu es à 8 h au poste, tous les jours. Si le bus ne le permet pas, tu prends celui d''avant. Si un jour il y a un vrai problème, tu m''envoies un message avant 7 h 45. On se revoit dans deux semaines pour faire le point. Comment tu vois ça ? »
« C''est bon, je prendrai celui d''avant. »

[Retour avatar]
Ce qui a changé : des faits datés, un impact concret que Lucas ignorait, une attente précise avec une règle pour les exceptions, un point de suivi, et une question à la fin. Et Karim a noté la date et le contenu de l''entretien : si le retard continue, il aura la trace nécessaire pour alerter Michel.

[Titre : « Situation 2 — L''erreur client »]

Julien a livré un véhicule avec une coulure de vernis. Le client a réclamé.

Version qui échoue, celle de Michel, devant toute l''équipe :

[Texte à l''écran]
« C''est quoi ce travail ? Tu te fous du monde ? On a un client qui nous rend la voiture, tu crois qu''on peut se permettre ça ? »

Ce qui s''est passé : de l''humiliation publique, aucune méthode, et une question sans réponse possible. Julien a perdu confiance, et l''équipe a appris que les erreurs se paient en public. Prochaine erreur, on la cachera.

Version qui marche, le lendemain matin, seul à seul :

[Séquence jouée]
« Hier, à la restitution de la Clio de Ferrand, il y avait une coulure sur l''aile arrière, et le véhicule est parti sans contrôle. Le client a écrit, on reprend deux jours, et l''équipe encaisse. »
« Je sais. Je suis allé trop vite sur le vernis. »
« Qu''est-ce qui a fait que tu es allé trop vite ? »
« Il fallait rendre à 17 h, Sophie était venue deux fois me demander où j''en étais. »
« D''accord. Donc il y a un problème de finition et un problème de pression sur les délais. Le second, je m''en occupe : à partir de maintenant, les demandes de Sophie passent par moi. Le premier, on le règle ensemble : jusqu''à la fin de l''année, chaque finition passe par Thierry avant de sortir. Ce n''est pas une sanction, c''est comme ça qu''on apprend. Ça te va ? »
« Oui. Et je préfère que Thierry regarde, honnêtement. »

[Retour avatar]
Notez la question ouverte : « qu''est-ce qui a fait que ». Elle a révélé une cause d''organisation, la pression de Sophie, que Karim n''aurait pas vue s''il s''était contenté de recadrer. Une erreur a presque toujours deux causes : une cause individuelle et une cause d''organisation. Le feedback traite la première ; le manager traite la seconde.

[Titre : « Situation 3 — Le très bon travail »]

Nadia a réalisé une peinture complexe, un raccord de teinte nacrée, que le client a trouvée parfaite.

Version qui échoue : rien. Ou, en passant : « Nickel la 308. » Nadia n''a pas su ce qui était nickel, ni si quelqu''un l''avait vraiment regardé.

Version qui marche, à l''atelier, devant Julien qui apprend la peinture :

[Séquence jouée]
« Nadia, la 308 de ce matin. Le raccord sur la nacrée, on ne le voit pas, même sous le néon. Le client l''a dit à Sophie, et c''est ce genre de travail qui fait qu''on garde les flottes. Julien, viens voir, c''est ça qu''on vise. »
« C''est le dégradé sur trois passes, il faut prendre le temps. »
« Tu pourrais le montrer à Julien la semaine prochaine ? Une heure, sur la prochaine nacrée. »
« Oui, sans problème. »

[Retour avatar]
Un retour positif précis fait trois choses : il dit exactement ce qui est bien, donc ce qu''il faut refaire ; il relie le travail à un enjeu, garder les flottes ; et il donne de la reconnaissance devant les autres. Et Karim en a profité pour lancer le binôme peinture identifié dans la matrice de compétences. Un bon feedback positif est aussi un outil d''organisation.

[Titre : « Ce qu''il faut retenir »]

Dans les trois cas, la même trame : les faits, datés ; l''impact, concret ; l''attente, précise ; et une question. Dans les trois cas, le bon canal : le correctif en privé, le positif en public. Et dans les trois cas, une trace : Karim note dans son carnet la date et l''essentiel de l''échange.

Le feedback n''est pas un talent. C''est une méthode qui s''applique en cinq minutes, et qui, répétée, change une équipe.

À tout de suite pour l''entretien individuel de suivi.

[Fondu, logo]

---

Sources : Center for Creative Leadership, méthode SBI ; Bower & Bower, méthode DESC ; Edmondson (1999) sur les conséquences de l''humiliation publique des erreurs.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 4;
  n := n + 1;

  -- 3.5-entretien-individuel-de-suivi.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'L''entretien individuel de suivi est le rendez-vous régulier entre un manager et chaque membre de son équipe. Il n''a rien d''obligatoire légalement, contrairement à l''entretien de parcours professionnel (leçon suivante), et c''est justement pour cela qu''il est souvent négligé. Or c''est lui qui fait la différence entre un manager qui gère des personnes et un manager qui les connaît.

## À quoi il sert

- Faire le point sur le travail : ce qui avance, ce qui bloque, ce dont la personne a besoin.
- Donner et recevoir du feedback, dans un cadre prévu plutôt qu''au détour d''un couloir.
- Suivre les objectifs individuels fixés au module 2.
- Détecter tôt les difficultés : surcharge, tension avec un collègue, démotivation, problème personnel qui déborde sur le travail.
- Construire la relation : quelqu''un à qui l''on consacre trente minutes par mois sait qu''il compte.

Un rythme réaliste pour un manager de proximité : 30 minutes par personne toutes les quatre à six semaines, plus des points courts au fil de l''eau. Pour une équipe de neuf, c''est environ une heure par semaine. Ce n''est pas du temps perdu : c''est le temps qui évite les heures de gestion de crise.

## Préparer

Dix minutes suffisent, à condition de les prendre. Relisez vos notes de l''entretien précédent (les engagements pris de part et d''autre), regardez les objectifs de la personne et ses indicateurs, notez un ou deux retours à faire (un positif au moins), et listez les questions que vous voulez poser.

Préparez aussi le cadre : un lieu fermé, un créneau respecté (un entretien déplacé trois fois dit « tu n''es pas prioritaire »), le téléphone en silencieux.

## Conduire : la trame en cinq temps

## 1. Ouvrir (2 minutes)

Rappelez l''objet et la durée : « On a trente minutes pour faire le point sur ton travail, tes objectifs et ce dont tu as besoin. » Puis une question ouverte pour laisser la personne commencer : « Comment ça se passe pour toi en ce moment ? » Et vous écoutez, avec les outils de la leçon 3.2.

## 2. Les faits (10 minutes)

Passez en revue les objectifs et les engagements de la dernière fois. Pour chacun : où en est-on, avec des faits et des chiffres, pas des impressions. « Trois finitions sans remarque cette semaine » plutôt que « ça va mieux ». C''est le moment des retours, positifs et correctifs, avec la méthode SBI.

## 3. Le ressenti et les besoins (8 minutes)

« Qu''est-ce qui te pèse ? Qu''est-ce qui te plaît ? De quoi aurais-tu besoin pour mieux travailler ? » Cette partie est celle que les managers sautent, par gêne ou par manque de temps. C''est celle qui détecte les problèmes avant qu''ils n''explosent. Si la personne évoque une difficulté personnelle, écoutez sans creuser, et orientez si nécessaire (médecin du travail, assistante sociale, RH) ; vous n''êtes ni son médecin ni son confident.

## 4. Les engagements (7 minutes)

Décidez ensemble ce qui change d''ici la prochaine fois : ce que la personne fait, ce que vous faites. Deux ou trois engagements maximum, précis et datés. « Tu passes chaque finition par Thierry. Je règle le circuit des demandes de Sophie d''ici vendredi. »

## 5. Conclure (3 minutes)

Résumez les engagements à voix haute, fixez la date du prochain entretien, demandez : « Il y a quelque chose dont on n''a pas parlé et que tu voulais dire ? » Cette dernière question est souvent celle qui fait sortir l''essentiel.

## Tracer

Après l''entretien, cinq lignes dans votre carnet ou dans un fichier par personne : date, points abordés, engagements des deux côtés, date du prochain point. Ce n''est pas de la surveillance ; c''est la mémoire de la relation, et c''est ce qui vous permet, dans six mois, de dire « en mars tu m''avais parlé de la peinture, où en es-tu ? ». C''est aussi la trace nécessaire si une situation se dégrade et doit remonter.

Ces notes sont personnelles au manager. Elles ne contiennent pas d''information de santé ni de vie privée au-delà de ce qui est strictement utile (« absence prévue en juin » suffit).

## L''entretien de recadrage

Quand un comportement doit cesser (retards répétés, consigne contournée, manque de respect), l''entretien change de nature : ce n''est plus un point de suivi, c''est un recadrage. Il garde la même exigence de faits et d''écoute, mais avec une structure resserrée :

- Les faits, datés, sans discussion possible sur leur réalité.
- La règle qui n''est pas respectée et pourquoi elle existe.
- L''écoute : « Qu''est-ce qui explique ça ? » On peut découvrir une cause réelle (un problème d''organisation, une difficulté personnelle) qui change la suite.
- L''attente, non négociable, et le délai.
- La conséquence si ça continue : « Si les retards se reproduisent, je devrai en informer Michel. » Sans menace, comme une information.
- La trace écrite, et un point de contrôle rapproché.

Rappel du module 1 : le recadrage relève du manager ; la sanction relève de l''employeur, avec sa procédure. Un recadrage documenté est ce qui rend une sanction ultérieure possible et juste.

## Les erreurs classiques

- Transformer l''entretien en monologue : vous devriez parler moins de la moitié du temps.
- Ne parler que des problèmes : la personne finit par redouter les entretiens.
- Ne pas tenir ses propres engagements : la fois suivante, la personne ne s''engage plus.
- Le faire « quand on a le temps » : il n''y a jamais le temps. Les dates sont posées à l''avance pour le trimestre.
- Mélanger suivi et parcours professionnel : l''entretien de parcours a son propre cadre légal et sa propre trame (leçon suivante).

## Le cas Garnier

Karim installe un entretien de 30 minutes par personne toutes les six semaines, planifié pour le trimestre, le mardi entre 13 h et 14 h. Le premier tour lui apprend trois choses qu''il ignorait : Nadia veut évoluer vers la formation (elle a aimé montrer la nacrée à Julien), Marc a une contrainte de garde d''enfant le mercredi qui explique une partie de ses tensions sur les horaires, et Sophie vit mal le nouveau circuit des demandes, qu''elle a compris comme une sanction. Trois sujets qu''aucune réunion n''aurait fait sortir.

## À retenir

- 30 minutes toutes les quatre à six semaines, planifiées, tenues.
- Préparer dix minutes : notes précédentes, objectifs, un retour positif au moins.
- Cinq temps : ouvrir, faits, ressenti et besoins, engagements, conclure.
- Tracer cinq lignes après chaque entretien.
- Le recadrage est un entretien à part : faits, règle, écoute, attente, conséquence, trace.

## Sources

- France Compétences, référentiel RS7377, compétence 6.
- Michael Bungay Stanier, *The Coaching Habit*, 2016 — questions d''entretien.
- Andy Grove, *High Output Management*, 1983 — le « one-on-one » comme outil de management.
- Ministère du Travail, « Le pouvoir disciplinaire de l''employeur », travail-emploi.gouv.fr.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'L''entretien individuel de suivi est le rendez-vous régulier entre un manager et chaque membre de son équipe. Il n''a rien d''obligatoire légalement, contrairement à l''entretien de parcours professionnel (leçon suivante), et c''est justement pour cela qu''il est souvent négligé. Or c''est lui qui fait la différence entre un manager qui gère des personnes et un manager qui les connaît.

## À quoi il sert

- Faire le point sur le travail : ce qui avance, ce qui bloque, ce dont la personne a besoin.
- Donner et recevoir du feedback, dans un cadre prévu plutôt qu''au détour d''un couloir.
- Suivre les objectifs individuels fixés au module 2.
- Détecter tôt les difficultés : surcharge, tension avec un collègue, démotivation, problème personnel qui déborde sur le travail.
- Construire la relation : quelqu''un à qui l''on consacre trente minutes par mois sait qu''il compte.

Un rythme réaliste pour un manager de proximité : 30 minutes par personne toutes les quatre à six semaines, plus des points courts au fil de l''eau. Pour une équipe de neuf, c''est environ une heure par semaine. Ce n''est pas du temps perdu : c''est le temps qui évite les heures de gestion de crise.

## Préparer

Dix minutes suffisent, à condition de les prendre. Relisez vos notes de l''entretien précédent (les engagements pris de part et d''autre), regardez les objectifs de la personne et ses indicateurs, notez un ou deux retours à faire (un positif au moins), et listez les questions que vous voulez poser.

Préparez aussi le cadre : un lieu fermé, un créneau respecté (un entretien déplacé trois fois dit « tu n''es pas prioritaire »), le téléphone en silencieux.

## Conduire : la trame en cinq temps

## 1. Ouvrir (2 minutes)

Rappelez l''objet et la durée : « On a trente minutes pour faire le point sur ton travail, tes objectifs et ce dont tu as besoin. » Puis une question ouverte pour laisser la personne commencer : « Comment ça se passe pour toi en ce moment ? » Et vous écoutez, avec les outils de la leçon 3.2.

## 2. Les faits (10 minutes)

Passez en revue les objectifs et les engagements de la dernière fois. Pour chacun : où en est-on, avec des faits et des chiffres, pas des impressions. « Trois finitions sans remarque cette semaine » plutôt que « ça va mieux ». C''est le moment des retours, positifs et correctifs, avec la méthode SBI.

## 3. Le ressenti et les besoins (8 minutes)

« Qu''est-ce qui te pèse ? Qu''est-ce qui te plaît ? De quoi aurais-tu besoin pour mieux travailler ? » Cette partie est celle que les managers sautent, par gêne ou par manque de temps. C''est celle qui détecte les problèmes avant qu''ils n''explosent. Si la personne évoque une difficulté personnelle, écoutez sans creuser, et orientez si nécessaire (médecin du travail, assistante sociale, RH) ; vous n''êtes ni son médecin ni son confident.

## 4. Les engagements (7 minutes)

Décidez ensemble ce qui change d''ici la prochaine fois : ce que la personne fait, ce que vous faites. Deux ou trois engagements maximum, précis et datés. « Tu passes chaque finition par Thierry. Je règle le circuit des demandes de Sophie d''ici vendredi. »

## 5. Conclure (3 minutes)

Résumez les engagements à voix haute, fixez la date du prochain entretien, demandez : « Il y a quelque chose dont on n''a pas parlé et que tu voulais dire ? » Cette dernière question est souvent celle qui fait sortir l''essentiel.

## Tracer

Après l''entretien, cinq lignes dans votre carnet ou dans un fichier par personne : date, points abordés, engagements des deux côtés, date du prochain point. Ce n''est pas de la surveillance ; c''est la mémoire de la relation, et c''est ce qui vous permet, dans six mois, de dire « en mars tu m''avais parlé de la peinture, où en es-tu ? ». C''est aussi la trace nécessaire si une situation se dégrade et doit remonter.

Ces notes sont personnelles au manager. Elles ne contiennent pas d''information de santé ni de vie privée au-delà de ce qui est strictement utile (« absence prévue en juin » suffit).

## L''entretien de recadrage

Quand un comportement doit cesser (retards répétés, consigne contournée, manque de respect), l''entretien change de nature : ce n''est plus un point de suivi, c''est un recadrage. Il garde la même exigence de faits et d''écoute, mais avec une structure resserrée :

- Les faits, datés, sans discussion possible sur leur réalité.
- La règle qui n''est pas respectée et pourquoi elle existe.
- L''écoute : « Qu''est-ce qui explique ça ? » On peut découvrir une cause réelle (un problème d''organisation, une difficulté personnelle) qui change la suite.
- L''attente, non négociable, et le délai.
- La conséquence si ça continue : « Si les retards se reproduisent, je devrai en informer Michel. » Sans menace, comme une information.
- La trace écrite, et un point de contrôle rapproché.

Rappel du module 1 : le recadrage relève du manager ; la sanction relève de l''employeur, avec sa procédure. Un recadrage documenté est ce qui rend une sanction ultérieure possible et juste.

## Les erreurs classiques

- Transformer l''entretien en monologue : vous devriez parler moins de la moitié du temps.
- Ne parler que des problèmes : la personne finit par redouter les entretiens.
- Ne pas tenir ses propres engagements : la fois suivante, la personne ne s''engage plus.
- Le faire « quand on a le temps » : il n''y a jamais le temps. Les dates sont posées à l''avance pour le trimestre.
- Mélanger suivi et parcours professionnel : l''entretien de parcours a son propre cadre légal et sa propre trame (leçon suivante).

## Le cas Garnier

Karim installe un entretien de 30 minutes par personne toutes les six semaines, planifié pour le trimestre, le mardi entre 13 h et 14 h. Le premier tour lui apprend trois choses qu''il ignorait : Nadia veut évoluer vers la formation (elle a aimé montrer la nacrée à Julien), Marc a une contrainte de garde d''enfant le mercredi qui explique une partie de ses tensions sur les horaires, et Sophie vit mal le nouveau circuit des demandes, qu''elle a compris comme une sanction. Trois sujets qu''aucune réunion n''aurait fait sortir.

## À retenir

- 30 minutes toutes les quatre à six semaines, planifiées, tenues.
- Préparer dix minutes : notes précédentes, objectifs, un retour positif au moins.
- Cinq temps : ouvrir, faits, ressenti et besoins, engagements, conclure.
- Tracer cinq lignes après chaque entretien.
- Le recadrage est un entretien à part : faits, règle, écoute, attente, conséquence, trace.

## Sources

- France Compétences, référentiel RS7377, compétence 6.
- Michael Bungay Stanier, *The Coaching Habit*, 2016 — questions d''entretien.
- Andy Grove, *High Output Management*, 1983 — le « one-on-one » comme outil de management.
- Ministère du Travail, « Le pouvoir disciplinaire de l''employeur », travail-emploi.gouv.fr.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 5;
  n := n + 1;

  -- 3.6-entretien-annuel-vs-parcours-professionnel.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Deux entretiens portent des noms proches et se tiennent parfois le même jour, avec la même personne, dans le même bureau. Ils n''ont pourtant ni le même objet, ni le même cadre juridique, ni les mêmes conséquences si on les néglige. Les confondre est l''une des erreurs les plus fréquentes des managers de proximité, et l''une de celles qui coûtent le plus cher à l''employeur.

## L''entretien annuel d''évaluation : facultatif, mais encadré

L''entretien annuel d''évaluation (on dit aussi entretien d''appréciation, ou entretien de performance) n''est imposé par aucun texte de loi. Il relève du pouvoir de direction de l''employeur, qui peut décider de l''organiser ou non. Beaucoup de conventions collectives ou d''accords d''entreprise le prévoient ; dans ce cas, il devient obligatoire dans l''entreprise concernée.

Son objet : faire le bilan de l''année écoulée (résultats, objectifs atteints ou non, comportement professionnel) et fixer les objectifs de l''année suivante. C''est un entretien de management, tourné vers le travail. Il peut avoir des conséquences sur la rémunération variable, les primes, les augmentations individuelles.

Trois règles s''appliquent, même s''il est facultatif :

- Les critères d''évaluation doivent être objectifs, pertinents au regard du poste, et connus des salariés à l''avance (Code du travail, art. L1222-2 et L1222-3). Un salarié ne peut pas être évalué sur des critères qu''il découvre en entretien.
- Le dispositif d''évaluation doit être présenté au comité social et économique (CSE) avant sa mise en place, quand l''entreprise en a un (art. L2312-38).
- Le salarié doit pouvoir accéder aux résultats de son évaluation et les contester. L''entretien annuel n''est pas un procès : il ne remplace ni un recadrage, ni une procédure disciplinaire.

Un entretien annuel bien conduit ne contient aucune surprise. Si le salarié découvre en janvier un reproche sur un fait de mars, c''est le manager qui a failli, pas le salarié : le feedback de la leçon 3.3 aurait dû être donné en mars.

## L''entretien de parcours professionnel : obligatoire, avec un contenu fixé par la loi

Jusqu''en 2025, la loi imposait un « entretien professionnel » tous les deux ans. La loi n° 2025-989 du 24 octobre 2025 (dite loi « seniors », relative à l''emploi des salariés expérimentés et au dialogue social) a transformé ce dispositif en « entretien de parcours professionnel », inscrit à l''article L6315-1 du Code du travail. Les règles ci-dessous sont celles de ce nouveau texte ; vérifiez toujours auprès de votre service RH ou de votre convention collective, un accord d''entreprise pouvant aménager la périodicité, et les accords antérieurs devant être mis en conformité avant le 1er octobre 2026.

Périodicité :

- un premier entretien dans l''année qui suit l''embauche ;
- puis un entretien tous les quatre ans (au lieu de deux auparavant) ;
- un entretien renforcé autour de 45 ans, dit de mi-carrière, articulé avec la visite médicale de mi-carrière, qui aborde l''adaptation du poste et la prévention de l''usure professionnelle ;
- un entretien dans les deux années qui précèdent le soixantième anniversaire, sur les conditions de maintien dans l''emploi et les aménagements de fin de carrière ;
- un état des lieux récapitulatif du parcours tous les huit ans (au lieu de six).

L''entretien est aussi proposé systématiquement au retour de certaines absences longues : congé de maternité, congé parental, congé d''adoption, congé sabbatique, arrêt maladie de longue durée, mandat syndical.

Contenu obligatoire : l''entretien porte sur le parcours du salarié, pas sur ses résultats. Il aborde ses compétences et leur évolution, sa situation professionnelle et ses perspectives, ses besoins de formation, ses souhaits d''évolution, et l''information sur le compte personnel de formation (CPF), ses abondements et le conseil en évolution professionnelle (CEP). Il donne lieu à un compte rendu écrit dont une copie est remise au salarié.

Ce qu''il n''est pas : un entretien d''évaluation. La loi le dit expressément. On ne parle pas des objectifs de l''année, ni de la qualité du travail, ni de la prime. On parle de l''avenir professionnel de la personne.

Sanction : dans les entreprises d''au moins cinquante salariés, si le salarié n''a pas bénéficié des entretiens prévus et d''au moins une formation autre que celles obligatoires au cours de la période de référence, l''employeur doit verser un abondement correctif sur son CPF (3 000 € dans le dispositif antérieur ; le montant et les modalités applicables au nouveau dispositif sont fixés par décret, à vérifier). Et au-delà de la sanction, l''absence d''entretien de parcours est un argument régulièrement retenu par les juges dans les contentieux pour manquement à l''obligation d''adaptation et de maintien de l''employabilité (art. L6321-1).

## Les différences en un tableau

| | Entretien annuel d''évaluation | Entretien de parcours professionnel |
| --- | --- | --- |
| Base | Facultatif (sauf accord ou convention) | Obligatoire, art. L6315-1 C. trav. |
| Rythme | Annuel en général | 1re année, puis tous les 4 ans ; 45 ans ; avant 60 ans ; bilan à 8 ans |
| Objet | Le travail de l''année : résultats, objectifs, comportement | Le parcours : compétences, formation, évolution, CPF, CEP |
| Regard | Vers l''année écoulée et la suivante | Vers les années à venir |
| Conséquences | Rémunération variable, objectifs | Plan de formation, mobilité, employabilité |
| Trace | Selon procédure interne | Compte rendu écrit obligatoire, copie au salarié |
| Peut-on les tenir le même jour ? | Oui, à condition de les distinguer clairement, avec deux temps et deux documents | |

## Le rôle du manager de proximité

Dans beaucoup d''entreprises, c''est le manager direct qui conduit les deux entretiens, avec des trames fournies par les RH. Son rôle diffère selon l''entretien.

Pour l''entretien annuel, il est l''évaluateur : il apporte les faits de l''année (ceux qu''il a notés dans ses entretiens de suivi), il écoute la lecture du salarié, il fixe les objectifs suivants avec la méthode du module 2. Il ne promet rien sur la rémunération qu''il ne maîtrise pas.

Pour l''entretien de parcours, il est un relais : il aide la personne à formuler ses souhaits, il apporte sa vision des compétences (la matrice du module 2 est une base précieuse), il note les besoins de formation, et il transmet aux RH. Il ne décide ni des formations, ni des mobilités, mais son compte rendu pèse. Il doit connaître, au moins dans les grandes lignes, les dispositifs qu''il est censé évoquer : le CPF (compte alimenté en euros chaque année, mobilisable par le salarié pour une formation certifiante), le CEP (accompagnement gratuit et externe, notamment par France Travail, l''APEC ou les opérateurs régionaux), la validation des acquis de l''expérience (VAE), le plan de développement des compétences de l''entreprise.

Dans les deux cas, il applique les mêmes principes que pour l''entretien de suivi : préparer, écouter, tracer.

## Les pièges

- Faire les deux entretiens en un seul document, sans distinction : la trace de l''entretien de parcours n''est alors pas conforme et le salarié n''a pas eu l''espace prévu pour parler de son avenir.
- Ne pas faire l''entretien de parcours « parce que la personne ne veut pas évoluer » : l''obligation vaut pour tous, y compris pour celui qui veut rester à son poste. On note alors ce souhait.
- Laisser passer les échéances : un manager qui prend ses fonctions doit demander aux RH la date du dernier entretien de parcours de chaque membre de l''équipe.
- Promettre une formation ou une promotion qu''on ne maîtrise pas : on note le souhait, on dit ce qu''on va faire (transmettre, appuyer), pas ce que l''entreprise va décider.
- Aborder la santé de la personne au-delà de ce qu''elle choisit de dire : les questions d''aptitude relèvent du médecin du travail, pas du manager.

## Le cas Garnier

Karim découvre, en demandant à Sophie, qu''aucun entretien de parcours n''a jamais été formalisé à l''atelier. Michel « discute avec tout le monde », mais rien n''est écrit. Thierry, 52 ans, avec 28 ans d''ancienneté, n''a jamais eu ni entretien de mi-carrière ni état des lieux ; Fatou, dont le poste a été aménagé, n''a pas eu d''entretien au retour de son arrêt. L''atelier a huit salariés : il échappe à l''abondement correctif, mais pas à l''obligation elle-même, ni au risque en cas de contentieux.

Karim propose à Michel un calendrier : un entretien de parcours pour chacun d''ici trois mois, avec la trame de la fiche 3.9, et un compte rendu signé conservé par Sophie. Pour Thierry, l''entretien aborde la suite de sa carrière et la transmission de son savoir-faire ; pour Nadia, son souhait de former ; pour Lucas, la suite de son apprentissage ; pour Fatou, les conditions de son poste aménagé et ses souhaits d''évolution. Karim sépare ces entretiens des entretiens de suivi : deux rendez-vous, deux documents.

## À retenir

- L''entretien annuel d''évaluation est facultatif, tourné vers le travail de l''année ; il exige des critères objectifs connus à l''avance.
- L''entretien de parcours professionnel (loi du 24 octobre 2025, art. L6315-1) est obligatoire : dans la première année, puis tous les quatre ans, à 45 ans, avant 60 ans, avec un état des lieux tous les huit ans.
- Il porte sur le parcours (compétences, formation, évolution, CPF, CEP), jamais sur l''évaluation, et donne lieu à un écrit remis au salarié.
- Le manager évalue dans l''un, relaie dans l''autre ; dans les deux, il prépare, écoute et trace.
- Vérifiez la convention collective et l''accord d''entreprise : ils peuvent aménager la périodicité.

## Sources

- Code du travail, art. L6315-1 (rédaction issue de la loi n° 2025-989 du 24 octobre 2025), L1222-2, L1222-3, L2312-38, L6321-1 — legifrance.gouv.fr.
- Ministère du Travail, « L''entretien de parcours professionnel », travail-emploi.gouv.fr.
- Service-public.fr, fiche « Entretien professionnel » (mise à jour 2025-2026).
- France Compétences, référentiel RS7377, compétence 6.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Deux entretiens portent des noms proches et se tiennent parfois le même jour, avec la même personne, dans le même bureau. Ils n''ont pourtant ni le même objet, ni le même cadre juridique, ni les mêmes conséquences si on les néglige. Les confondre est l''une des erreurs les plus fréquentes des managers de proximité, et l''une de celles qui coûtent le plus cher à l''employeur.

## L''entretien annuel d''évaluation : facultatif, mais encadré

L''entretien annuel d''évaluation (on dit aussi entretien d''appréciation, ou entretien de performance) n''est imposé par aucun texte de loi. Il relève du pouvoir de direction de l''employeur, qui peut décider de l''organiser ou non. Beaucoup de conventions collectives ou d''accords d''entreprise le prévoient ; dans ce cas, il devient obligatoire dans l''entreprise concernée.

Son objet : faire le bilan de l''année écoulée (résultats, objectifs atteints ou non, comportement professionnel) et fixer les objectifs de l''année suivante. C''est un entretien de management, tourné vers le travail. Il peut avoir des conséquences sur la rémunération variable, les primes, les augmentations individuelles.

Trois règles s''appliquent, même s''il est facultatif :

- Les critères d''évaluation doivent être objectifs, pertinents au regard du poste, et connus des salariés à l''avance (Code du travail, art. L1222-2 et L1222-3). Un salarié ne peut pas être évalué sur des critères qu''il découvre en entretien.
- Le dispositif d''évaluation doit être présenté au comité social et économique (CSE) avant sa mise en place, quand l''entreprise en a un (art. L2312-38).
- Le salarié doit pouvoir accéder aux résultats de son évaluation et les contester. L''entretien annuel n''est pas un procès : il ne remplace ni un recadrage, ni une procédure disciplinaire.

Un entretien annuel bien conduit ne contient aucune surprise. Si le salarié découvre en janvier un reproche sur un fait de mars, c''est le manager qui a failli, pas le salarié : le feedback de la leçon 3.3 aurait dû être donné en mars.

## L''entretien de parcours professionnel : obligatoire, avec un contenu fixé par la loi

Jusqu''en 2025, la loi imposait un « entretien professionnel » tous les deux ans. La loi n° 2025-989 du 24 octobre 2025 (dite loi « seniors », relative à l''emploi des salariés expérimentés et au dialogue social) a transformé ce dispositif en « entretien de parcours professionnel », inscrit à l''article L6315-1 du Code du travail. Les règles ci-dessous sont celles de ce nouveau texte ; vérifiez toujours auprès de votre service RH ou de votre convention collective, un accord d''entreprise pouvant aménager la périodicité, et les accords antérieurs devant être mis en conformité avant le 1er octobre 2026.

Périodicité :

- un premier entretien dans l''année qui suit l''embauche ;
- puis un entretien tous les quatre ans (au lieu de deux auparavant) ;
- un entretien renforcé autour de 45 ans, dit de mi-carrière, articulé avec la visite médicale de mi-carrière, qui aborde l''adaptation du poste et la prévention de l''usure professionnelle ;
- un entretien dans les deux années qui précèdent le soixantième anniversaire, sur les conditions de maintien dans l''emploi et les aménagements de fin de carrière ;
- un état des lieux récapitulatif du parcours tous les huit ans (au lieu de six).

L''entretien est aussi proposé systématiquement au retour de certaines absences longues : congé de maternité, congé parental, congé d''adoption, congé sabbatique, arrêt maladie de longue durée, mandat syndical.

Contenu obligatoire : l''entretien porte sur le parcours du salarié, pas sur ses résultats. Il aborde ses compétences et leur évolution, sa situation professionnelle et ses perspectives, ses besoins de formation, ses souhaits d''évolution, et l''information sur le compte personnel de formation (CPF), ses abondements et le conseil en évolution professionnelle (CEP). Il donne lieu à un compte rendu écrit dont une copie est remise au salarié.

Ce qu''il n''est pas : un entretien d''évaluation. La loi le dit expressément. On ne parle pas des objectifs de l''année, ni de la qualité du travail, ni de la prime. On parle de l''avenir professionnel de la personne.

Sanction : dans les entreprises d''au moins cinquante salariés, si le salarié n''a pas bénéficié des entretiens prévus et d''au moins une formation autre que celles obligatoires au cours de la période de référence, l''employeur doit verser un abondement correctif sur son CPF (3 000 € dans le dispositif antérieur ; le montant et les modalités applicables au nouveau dispositif sont fixés par décret, à vérifier). Et au-delà de la sanction, l''absence d''entretien de parcours est un argument régulièrement retenu par les juges dans les contentieux pour manquement à l''obligation d''adaptation et de maintien de l''employabilité (art. L6321-1).

## Les différences en un tableau

| | Entretien annuel d''évaluation | Entretien de parcours professionnel |
| --- | --- | --- |
| Base | Facultatif (sauf accord ou convention) | Obligatoire, art. L6315-1 C. trav. |
| Rythme | Annuel en général | 1re année, puis tous les 4 ans ; 45 ans ; avant 60 ans ; bilan à 8 ans |
| Objet | Le travail de l''année : résultats, objectifs, comportement | Le parcours : compétences, formation, évolution, CPF, CEP |
| Regard | Vers l''année écoulée et la suivante | Vers les années à venir |
| Conséquences | Rémunération variable, objectifs | Plan de formation, mobilité, employabilité |
| Trace | Selon procédure interne | Compte rendu écrit obligatoire, copie au salarié |
| Peut-on les tenir le même jour ? | Oui, à condition de les distinguer clairement, avec deux temps et deux documents | |

## Le rôle du manager de proximité

Dans beaucoup d''entreprises, c''est le manager direct qui conduit les deux entretiens, avec des trames fournies par les RH. Son rôle diffère selon l''entretien.

Pour l''entretien annuel, il est l''évaluateur : il apporte les faits de l''année (ceux qu''il a notés dans ses entretiens de suivi), il écoute la lecture du salarié, il fixe les objectifs suivants avec la méthode du module 2. Il ne promet rien sur la rémunération qu''il ne maîtrise pas.

Pour l''entretien de parcours, il est un relais : il aide la personne à formuler ses souhaits, il apporte sa vision des compétences (la matrice du module 2 est une base précieuse), il note les besoins de formation, et il transmet aux RH. Il ne décide ni des formations, ni des mobilités, mais son compte rendu pèse. Il doit connaître, au moins dans les grandes lignes, les dispositifs qu''il est censé évoquer : le CPF (compte alimenté en euros chaque année, mobilisable par le salarié pour une formation certifiante), le CEP (accompagnement gratuit et externe, notamment par France Travail, l''APEC ou les opérateurs régionaux), la validation des acquis de l''expérience (VAE), le plan de développement des compétences de l''entreprise.

Dans les deux cas, il applique les mêmes principes que pour l''entretien de suivi : préparer, écouter, tracer.

## Les pièges

- Faire les deux entretiens en un seul document, sans distinction : la trace de l''entretien de parcours n''est alors pas conforme et le salarié n''a pas eu l''espace prévu pour parler de son avenir.
- Ne pas faire l''entretien de parcours « parce que la personne ne veut pas évoluer » : l''obligation vaut pour tous, y compris pour celui qui veut rester à son poste. On note alors ce souhait.
- Laisser passer les échéances : un manager qui prend ses fonctions doit demander aux RH la date du dernier entretien de parcours de chaque membre de l''équipe.
- Promettre une formation ou une promotion qu''on ne maîtrise pas : on note le souhait, on dit ce qu''on va faire (transmettre, appuyer), pas ce que l''entreprise va décider.
- Aborder la santé de la personne au-delà de ce qu''elle choisit de dire : les questions d''aptitude relèvent du médecin du travail, pas du manager.

## Le cas Garnier

Karim découvre, en demandant à Sophie, qu''aucun entretien de parcours n''a jamais été formalisé à l''atelier. Michel « discute avec tout le monde », mais rien n''est écrit. Thierry, 52 ans, avec 28 ans d''ancienneté, n''a jamais eu ni entretien de mi-carrière ni état des lieux ; Fatou, dont le poste a été aménagé, n''a pas eu d''entretien au retour de son arrêt. L''atelier a huit salariés : il échappe à l''abondement correctif, mais pas à l''obligation elle-même, ni au risque en cas de contentieux.

Karim propose à Michel un calendrier : un entretien de parcours pour chacun d''ici trois mois, avec la trame de la fiche 3.9, et un compte rendu signé conservé par Sophie. Pour Thierry, l''entretien aborde la suite de sa carrière et la transmission de son savoir-faire ; pour Nadia, son souhait de former ; pour Lucas, la suite de son apprentissage ; pour Fatou, les conditions de son poste aménagé et ses souhaits d''évolution. Karim sépare ces entretiens des entretiens de suivi : deux rendez-vous, deux documents.

## À retenir

- L''entretien annuel d''évaluation est facultatif, tourné vers le travail de l''année ; il exige des critères objectifs connus à l''avance.
- L''entretien de parcours professionnel (loi du 24 octobre 2025, art. L6315-1) est obligatoire : dans la première année, puis tous les quatre ans, à 45 ans, avant 60 ans, avec un état des lieux tous les huit ans.
- Il porte sur le parcours (compétences, formation, évolution, CPF, CEP), jamais sur l''évaluation, et donne lieu à un écrit remis au salarié.
- Le manager évalue dans l''un, relaie dans l''autre ; dans les deux, il prépare, écoute et trace.
- Vérifiez la convention collective et l''accord d''entreprise : ils peuvent aménager la périodicité.

## Sources

- Code du travail, art. L6315-1 (rédaction issue de la loi n° 2025-989 du 24 octobre 2025), L1222-2, L1222-3, L2312-38, L6321-1 — legifrance.gouv.fr.
- Ministère du Travail, « L''entretien de parcours professionnel », travail-emploi.gouv.fr.
- Service-public.fr, fiche « Entretien professionnel » (mise à jour 2025-2026).
- France Compétences, référentiel RS7377, compétence 6.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 6;
  n := n + 1;

  -- 3.7-animer-une-reunion.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'La réunion est l''outil de management le plus critiqué et le plus mal utilisé. Trop longue, sans ordre du jour, sans décision, monopolisée par deux personnes pendant que les autres regardent leur téléphone : chacun en a connu. Et pourtant, une équipe qui ne se réunit jamais n''est pas une équipe ; c''est une somme de personnes qui travaillent au même endroit. La question n''est pas de faire moins de réunions, mais de faire des réunions qui servent à quelque chose.

## Une réunion sert à trois choses, pas plus

Avant de convoquer, demandez-vous ce que la réunion doit produire. Il n''y a que trois réponses possibles :

- Informer : donner à tous la même information en même temps, avec la possibilité de poser des questions. Si personne n''a de question à poser, un écrit suffisait.
- Décider : trancher ensemble une question, ou faire trancher par le manager après avoir entendu l''équipe.
- Résoudre : chercher ensemble une solution à un problème que personne ne peut résoudre seul.

Une réunion sans objet identifiable est une réunion à annuler. Un ordre du jour qui liste des « points divers » est un ordre du jour à réécrire.

## Les rituels : fixer le rythme

Une équipe fonctionne mieux avec des réunions régulières, courtes et prévisibles qu''avec des réunions rares et longues. Trois rituels suffisent à la plupart des équipes de proximité :

| Rituel | Durée | Objet | Format |
| --- | --- | --- | --- |
| Brief quotidien | 5 à 10 min | Priorités du jour, difficultés immédiates, absents | Debout, devant le planning, à heure fixe |
| Point hebdomadaire | 30 min | Tableau de bord, semaine écoulée, semaine à venir, un sujet | Assis, ordre du jour fixe, relevé de décisions |
| Réunion mensuelle | 1 h | Résultats du mois, sujet de fond, retour de l''équipe | Préparée, avec un support, compte rendu écrit |

Le brief quotidien est celui qui change le plus la vie d''un atelier ou d''un service : cinq minutes à 8 h devant le planning, et chacun sait ce qu''il fait, ce qui presse, qui manque. Il remplace des dizaines d''interruptions dans la journée.

## Préparer : l''ordre du jour

Une réunion se prépare en trois questions : pourquoi (l''objectif), quoi (les points, dans l''ordre, avec un temps pour chacun), qui (les participants nécessaires, et seulement eux). L''ordre du jour est envoyé ou affiché avant, avec les documents à lire s''il y en a.

Règles d''un bon ordre du jour :

- Chaque point est formulé comme une question ou un résultat attendu : « Décider du circuit des demandes urgentes » plutôt que « Demandes urgentes ».
- Les points qui demandent de l''énergie (décisions, désaccords) se traitent en début de réunion, pas à la fin.
- Le temps par point est indiqué. Une réunion de 30 minutes contient trois points, pas huit.
- Le dernier point est toujours : « Décisions prises, qui fait quoi, pour quand. »

## Conduire : les rôles

L''animateur, souvent le manager, tient l''objectif et le temps. Il ouvre en rappelant l''objet et la durée, il donne la parole, il recentre quand on s''écarte, il fait formuler les décisions, il conclut. Il ne monopolise pas la parole : dans une réunion de décision, le manager parle en dernier, sinon personne ne dira autre chose que ce qu''il a dit.

Le rapporteur note les décisions et les actions, pas les débats. Ce rôle peut tourner dans l''équipe, ce qui responsabilise et évite que le manager fasse tout.

Le gardien du temps, si la réunion est longue, signale les dépassements. Dans une réunion de 30 minutes, l''animateur s''en charge.

## Les participants difficiles

Le bavard : il parle longtemps, revient sur ce qui est réglé, coupe les autres. On ne l''humilie pas ; on le cadre. « Merci Thierry, je note ton point. Je voudrais entendre les autres : Nadia ? » Si ça persiste, on lui en parle en tête-à-tête, avec la méthode SBI de la leçon 3.3.

Le silencieux : il ne dit rien, et on croit qu''il est d''accord. Il ne l''est pas toujours. On lui donne la parole nommément, sur une question précise, sans le mettre en difficulté : « Marc, sur le planning méca, tu le vis comment ? » Les tours de table courts, où chacun dit une phrase, sont l''outil le plus efficace pour faire parler les silencieux.

Le négatif : il commence chaque phrase par « ça ne marchera jamais ». On ne discute pas la posture ; on demande le fait : « Qu''est-ce qui, concrètement, empêcherait que ça marche ? » Parfois il a raison, et c''est utile. Parfois il n''a rien de concret, et il s''en rend compte devant les autres.

Le hors-sujet : il amène un sujet qui n''est pas à l''ordre du jour. On le note « pour une prochaine fois » sur un coin du tableau, visiblement, et on revient au point.

Le téléphone : on pose la règle une fois, au début, pour tout le monde, et on la tient. Un manager qui consulte le sien en réunion a perdu le droit de la faire respecter.

## Décider et tracer

Une réunion qui ne débouche sur aucune décision ni action est une conversation. Pour chaque point, l''animateur fait formuler à voix haute : ce qui est décidé, qui s''en charge, pour quand. Le relevé de décisions tient en dix lignes, il est diffusé dans la journée (affiché, envoyé, ou noté dans le cahier de l''équipe), et il ouvre la réunion suivante : « On avait décidé ça, où en est-on ? »

C''est le suivi des décisions qui donne aux réunions leur crédibilité. Une décision jamais suivie enseigne à l''équipe que les réunions ne servent à rien.

## La réunion à distance

Quand une partie de l''équipe est en visioconférence (équipes éclatées, télétravail, plusieurs sites), quelques règles supplémentaires : caméras allumées si possible, un ordre du jour encore plus serré (45 minutes maximum), des tours de parole explicites parce que personne ne peut « prendre » la parole naturellement, un document partagé où le rapporteur note en direct, et une attention particulière à ceux qui sont à distance quand d''autres sont dans la même salle : ils sont les premiers oubliés.

## La première réunion d''un nouveau manager

Elle est attendue et observée. Elle ne doit pas être une réunion d''annonces. Trois temps suffisent : ce que vous avez compris de l''équipe et de sa situation (les faits, pas les jugements), ce que vous attendez et ce que l''équipe peut attendre de vous, et un tour de table où chacun dit ce qui, selon lui, doit changer en premier. Vous ne promettez rien ce jour-là, vous notez, et vous revenez avec des décisions à la réunion suivante.

## Le cas Garnier — la première réunion de Karim

Karim convoque l''équipe un mardi à 16 h 30, 45 minutes, dans le bureau devant le planning. Ordre du jour affiché la veille : où on en est (les trois objectifs et les chiffres du mois, 10 min) ; la nouvelle organisation (planning validé à 17 h, circuit des demandes de Sophie, contrôle finition par Thierry, 20 min) ; ce qui manque pour que ça marche, tour de table (10 min) ; décisions et prochaine réunion (5 min).

Thierry commence à raconter comment on faisait « avant » ; Karim le remercie, note, et donne la parole à Nadia. Marc, sollicité nommément, dit qu''il a besoin de connaître la veille les passages en mécanique : Karim le note comme décision. Lucas ne dit rien ; Karim lui demande ce qui le gêne le plus le matin ; il répond que les pièces ne sont pas prêtes. Décision : Fatou prépare les pièces la veille, ce qui entre dans son poste aménagé. Relevé de décisions affiché le soir même, à côté du planning. Michel, qui assistait, n''a rien dit ; Karim lui avait demandé avant.

## À retenir

- Une réunion sert à informer, décider ou résoudre ; sans objet, on annule.
- Trois rituels : brief quotidien (5 à 10 min), point hebdo (30 min), réunion mensuelle (1 h).
- Ordre du jour formulé en résultats attendus, temps par point, décisions en premier.
- L''animateur tient l''objectif et le temps, parle en dernier dans une décision.
- Bavard : cadrer. Silencieux : nommer. Négatif : demander le fait. Hors-sujet : parquer.
- Chaque point finit par : décidé quoi, qui, pour quand. Le relevé ouvre la réunion suivante.

## Sources

- France Compétences, référentiel RS7377, compétence 6.
- Patrick Lencioni, *Death by Meeting*, Jossey-Bass, 2004 — rituels de réunion.
- Steven Rogelberg, *The Surprising Science of Meetings*, Oxford University Press, 2019 — recherche sur l''efficacité des réunions.
- INRS, « Télétravail et management à distance », inrs.fr.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'La réunion est l''outil de management le plus critiqué et le plus mal utilisé. Trop longue, sans ordre du jour, sans décision, monopolisée par deux personnes pendant que les autres regardent leur téléphone : chacun en a connu. Et pourtant, une équipe qui ne se réunit jamais n''est pas une équipe ; c''est une somme de personnes qui travaillent au même endroit. La question n''est pas de faire moins de réunions, mais de faire des réunions qui servent à quelque chose.

## Une réunion sert à trois choses, pas plus

Avant de convoquer, demandez-vous ce que la réunion doit produire. Il n''y a que trois réponses possibles :

- Informer : donner à tous la même information en même temps, avec la possibilité de poser des questions. Si personne n''a de question à poser, un écrit suffisait.
- Décider : trancher ensemble une question, ou faire trancher par le manager après avoir entendu l''équipe.
- Résoudre : chercher ensemble une solution à un problème que personne ne peut résoudre seul.

Une réunion sans objet identifiable est une réunion à annuler. Un ordre du jour qui liste des « points divers » est un ordre du jour à réécrire.

## Les rituels : fixer le rythme

Une équipe fonctionne mieux avec des réunions régulières, courtes et prévisibles qu''avec des réunions rares et longues. Trois rituels suffisent à la plupart des équipes de proximité :

| Rituel | Durée | Objet | Format |
| --- | --- | --- | --- |
| Brief quotidien | 5 à 10 min | Priorités du jour, difficultés immédiates, absents | Debout, devant le planning, à heure fixe |
| Point hebdomadaire | 30 min | Tableau de bord, semaine écoulée, semaine à venir, un sujet | Assis, ordre du jour fixe, relevé de décisions |
| Réunion mensuelle | 1 h | Résultats du mois, sujet de fond, retour de l''équipe | Préparée, avec un support, compte rendu écrit |

Le brief quotidien est celui qui change le plus la vie d''un atelier ou d''un service : cinq minutes à 8 h devant le planning, et chacun sait ce qu''il fait, ce qui presse, qui manque. Il remplace des dizaines d''interruptions dans la journée.

## Préparer : l''ordre du jour

Une réunion se prépare en trois questions : pourquoi (l''objectif), quoi (les points, dans l''ordre, avec un temps pour chacun), qui (les participants nécessaires, et seulement eux). L''ordre du jour est envoyé ou affiché avant, avec les documents à lire s''il y en a.

Règles d''un bon ordre du jour :

- Chaque point est formulé comme une question ou un résultat attendu : « Décider du circuit des demandes urgentes » plutôt que « Demandes urgentes ».
- Les points qui demandent de l''énergie (décisions, désaccords) se traitent en début de réunion, pas à la fin.
- Le temps par point est indiqué. Une réunion de 30 minutes contient trois points, pas huit.
- Le dernier point est toujours : « Décisions prises, qui fait quoi, pour quand. »

## Conduire : les rôles

L''animateur, souvent le manager, tient l''objectif et le temps. Il ouvre en rappelant l''objet et la durée, il donne la parole, il recentre quand on s''écarte, il fait formuler les décisions, il conclut. Il ne monopolise pas la parole : dans une réunion de décision, le manager parle en dernier, sinon personne ne dira autre chose que ce qu''il a dit.

Le rapporteur note les décisions et les actions, pas les débats. Ce rôle peut tourner dans l''équipe, ce qui responsabilise et évite que le manager fasse tout.

Le gardien du temps, si la réunion est longue, signale les dépassements. Dans une réunion de 30 minutes, l''animateur s''en charge.

## Les participants difficiles

Le bavard : il parle longtemps, revient sur ce qui est réglé, coupe les autres. On ne l''humilie pas ; on le cadre. « Merci Thierry, je note ton point. Je voudrais entendre les autres : Nadia ? » Si ça persiste, on lui en parle en tête-à-tête, avec la méthode SBI de la leçon 3.3.

Le silencieux : il ne dit rien, et on croit qu''il est d''accord. Il ne l''est pas toujours. On lui donne la parole nommément, sur une question précise, sans le mettre en difficulté : « Marc, sur le planning méca, tu le vis comment ? » Les tours de table courts, où chacun dit une phrase, sont l''outil le plus efficace pour faire parler les silencieux.

Le négatif : il commence chaque phrase par « ça ne marchera jamais ». On ne discute pas la posture ; on demande le fait : « Qu''est-ce qui, concrètement, empêcherait que ça marche ? » Parfois il a raison, et c''est utile. Parfois il n''a rien de concret, et il s''en rend compte devant les autres.

Le hors-sujet : il amène un sujet qui n''est pas à l''ordre du jour. On le note « pour une prochaine fois » sur un coin du tableau, visiblement, et on revient au point.

Le téléphone : on pose la règle une fois, au début, pour tout le monde, et on la tient. Un manager qui consulte le sien en réunion a perdu le droit de la faire respecter.

## Décider et tracer

Une réunion qui ne débouche sur aucune décision ni action est une conversation. Pour chaque point, l''animateur fait formuler à voix haute : ce qui est décidé, qui s''en charge, pour quand. Le relevé de décisions tient en dix lignes, il est diffusé dans la journée (affiché, envoyé, ou noté dans le cahier de l''équipe), et il ouvre la réunion suivante : « On avait décidé ça, où en est-on ? »

C''est le suivi des décisions qui donne aux réunions leur crédibilité. Une décision jamais suivie enseigne à l''équipe que les réunions ne servent à rien.

## La réunion à distance

Quand une partie de l''équipe est en visioconférence (équipes éclatées, télétravail, plusieurs sites), quelques règles supplémentaires : caméras allumées si possible, un ordre du jour encore plus serré (45 minutes maximum), des tours de parole explicites parce que personne ne peut « prendre » la parole naturellement, un document partagé où le rapporteur note en direct, et une attention particulière à ceux qui sont à distance quand d''autres sont dans la même salle : ils sont les premiers oubliés.

## La première réunion d''un nouveau manager

Elle est attendue et observée. Elle ne doit pas être une réunion d''annonces. Trois temps suffisent : ce que vous avez compris de l''équipe et de sa situation (les faits, pas les jugements), ce que vous attendez et ce que l''équipe peut attendre de vous, et un tour de table où chacun dit ce qui, selon lui, doit changer en premier. Vous ne promettez rien ce jour-là, vous notez, et vous revenez avec des décisions à la réunion suivante.

## Le cas Garnier — la première réunion de Karim

Karim convoque l''équipe un mardi à 16 h 30, 45 minutes, dans le bureau devant le planning. Ordre du jour affiché la veille : où on en est (les trois objectifs et les chiffres du mois, 10 min) ; la nouvelle organisation (planning validé à 17 h, circuit des demandes de Sophie, contrôle finition par Thierry, 20 min) ; ce qui manque pour que ça marche, tour de table (10 min) ; décisions et prochaine réunion (5 min).

Thierry commence à raconter comment on faisait « avant » ; Karim le remercie, note, et donne la parole à Nadia. Marc, sollicité nommément, dit qu''il a besoin de connaître la veille les passages en mécanique : Karim le note comme décision. Lucas ne dit rien ; Karim lui demande ce qui le gêne le plus le matin ; il répond que les pièces ne sont pas prêtes. Décision : Fatou prépare les pièces la veille, ce qui entre dans son poste aménagé. Relevé de décisions affiché le soir même, à côté du planning. Michel, qui assistait, n''a rien dit ; Karim lui avait demandé avant.

## À retenir

- Une réunion sert à informer, décider ou résoudre ; sans objet, on annule.
- Trois rituels : brief quotidien (5 à 10 min), point hebdo (30 min), réunion mensuelle (1 h).
- Ordre du jour formulé en résultats attendus, temps par point, décisions en premier.
- L''animateur tient l''objectif et le temps, parle en dernier dans une décision.
- Bavard : cadrer. Silencieux : nommer. Négatif : demander le fait. Hors-sujet : parquer.
- Chaque point finit par : décidé quoi, qui, pour quand. Le relevé ouvre la réunion suivante.

## Sources

- France Compétences, référentiel RS7377, compétence 6.
- Patrick Lencioni, *Death by Meeting*, Jossey-Bass, 2004 — rituels de réunion.
- Steven Rogelberg, *The Surprising Science of Meetings*, Oxford University Press, 2019 — recherche sur l''efficacité des réunions.
- INRS, « Télétravail et management à distance », inrs.fr.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 7;
  n := n + 1;

  -- 3.8-podcast-dire-non-alerter-negocier.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Format : conversation à deux voix. **CLAIRE** = animatrice IDEAFORMA. **DAVID** = responsable d''équipe logistique dans une plateforme de distribution (22 salariés, trois chefs d''équipe au-dessus de lui un directeur de site), en poste depuis quatre ans après avoir été cariste puis chef de quai (personnage fictif). Débit : 150 mots/min.
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

**CLAIRE** — Bonjour à tous. Aujourd''hui, on parle d''une communication dont les formations de management parlent peu : celle qui va vers le haut. Comment on dit non à son directeur, comment on lui remonte un problème sans passer pour celui qui râle, comment on obtient des moyens. David, vous encadrez une équipe logistique depuis quatre ans. Est-ce que vous vous souvenez de la première fois où vous avez dû dire non à votre hiérarchie ?

**DAVID** — Très bien. Et je ne l''ai pas dit. C''était trois mois après ma prise de poste. Mon directeur de site m''annonce qu''on va absorber les flux d''un autre entrepôt pendant deux semaines, sans renfort. Je savais que c''était impossible avec mes effectifs. J''ai dit « on va faire au mieux ».

**CLAIRE** — Et ?

**DAVID** — Et on n''a pas fait au mieux. On a fait des heures, on a eu deux arrêts de travail, on a livré en retard, et à la fin le directeur m''a demandé pourquoi je ne l''avais pas prévenu. Ce qui m''a rendu fou, parce que j''avais l''impression de l''avoir prévenu.

**CLAIRE** — Vous aviez dit « on va faire au mieux ».

**DAVID** — Oui. Et pour lui, ça voulait dire « c''est bon ». Pour moi, ça voulait dire « c''est impossible mais je n''ose pas le dire ». C''est là que j''ai compris que « faire au mieux », pour un manager, c''est la pire réponse possible. Ce n''est ni un oui, ni un non, et tout le monde entend ce qui l''arrange.

**CLAIRE** — Alors qu''est-ce qu''il aurait fallu dire ?

**DAVID** — Avec le recul, quelque chose comme : « Avec l''équipe actuelle, on peut absorber la moitié du flux en tenant les délais. Pour absorber tout, il me faut trois intérimaires sur deux semaines, ou on accepte deux jours de retard sur les commandes non prioritaires. Qu''est-ce que vous préférez ? »

**CLAIRE** — C''est intéressant, parce que ce n''est pas un non.

**DAVID** — Non, c''est mieux qu''un non. Un non sec, à un directeur, ça ne passe pas, et ça ne devrait pas passer, d''ailleurs : c''est lui qui décide. Mais un « oui, à ces conditions » ou un « oui, avec ces conséquences », c''est du management. Vous lui donnez les faits, vous lui donnez des options, et vous lui laissez la décision. Et si sa décision c''est « on absorbe tout sans renfort et on tient les délais », là vous dites : « Je ne sais pas le faire. Je vais essayer, mais je vous dis maintenant que ça ne tiendra pas, et je vous le redirai par écrit. »

**CLAIRE** — On va revenir sur l''écrit. Mais d''abord, cette idée d''options. Pourquoi c''est si important ?

**DAVID** — Parce qu''un chef qui reçoit un problème sans option se retrouve avec le problème sur les bras, et il n''aime pas ça. Il a vingt problèmes déjà. Si vous arrivez avec « j''ai un problème », vous en êtes un de plus. Si vous arrivez avec « j''ai un problème, voilà deux façons de le régler, je recommande la première, j''ai besoin de votre accord », vous êtes une solution.

**CLAIRE** — C''est ce qu''on appelle parfois « monter avec une solution ».

**DAVID** — Oui, mais attention à un piège : il ne faut pas attendre d''avoir la solution parfaite pour remonter le problème. J''ai vu des chefs d''équipe garder un problème trois semaines parce qu''ils cherchaient la solution, et quand ils l''ont remonté, c''était trop tard. La règle que je donne à mes chefs d''équipe : un problème se remonte dans les 24 heures, avec ce qu''on sait, avec ce qu''on ne sait pas, et avec ce qu''on propose, même si c''est imparfait.

**CLAIRE** — Vous avez dit « sans passer pour celui qui râle ». C''est une vraie peur chez les managers de proximité.

**DAVID** — C''est la peur principale. On a l''impression que remonter un problème, c''est se plaindre, ou avouer qu''on ne gère pas. Alors on se tait, et on gère seul, et un jour ça explose, et là on est vraiment celui qui ne gère pas.

**CLAIRE** — Comment on fait la différence entre alerter et se plaindre ?

**DAVID** — Se plaindre, c''est parler de soi et de ce qu''on ressent : « c''est ingérable, on n''en peut plus, on n''a jamais les moyens ». Alerter, c''est parler des faits et des conséquences pour l''entreprise : « on est à 82 % de délais tenus au lieu de 95 %, la cause principale c''est l''absence de cariste le samedi, si ça continue on perd le contrat X ». Le premier message, votre chef l''entend comme du bruit. Le second, il l''entend comme un risque, et les chefs sont là pour gérer les risques.

**CLAIRE** — Donc les faits, encore. C''est le même principe que pour le feedback à l''équipe.

**DAVID** — C''est exactement le même. Vers le bas, vers le haut, c''est la même méthode : les faits, l''impact, ce qu''on propose. La seule différence, c''est qu''en montant, vous ne donnez pas une consigne, vous demandez une décision.

**CLAIRE** — Vous avez évoqué l''écrit. Quand est-ce qu''on écrit à sa hiérarchie ?

**DAVID** — Toujours après l''oral, jamais à la place. Je dis d''abord les choses en face, et ensuite je confirme par un message court : « Comme convenu ce matin, on absorbe le flux de l''entrepôt B avec deux intérimaires à partir de lundi ; sans renfort, je vous confirme que les délais ne tiendront pas sur les commandes non prioritaires. » Ce n''est pas pour me couvrir, enfin pas seulement. C''est pour que la décision soit claire, pour lui comme pour moi.

**CLAIRE** — Mais ça sert aussi à se couvrir.

**DAVID** — Oui. Et il faut le dire sans gêne : un manager qui a alerté par écrit et à qui on a dit de continuer quand même n''est pas dans la même position que celui qui n''a rien dit. Pour la sécurité, en particulier, c''est essentiel. Si mon directeur me demande de faire tourner un chariot dont le contrôle périodique est dépassé, je dis non, je le dis par écrit, et là c''est un vrai non. Il y a des sujets où « oui à ces conditions » n''existe pas : la sécurité, la légalité, la dignité des gens. Là, le non est net, et il est écrit.

**CLAIRE** — Vous encadrez trois chefs d''équipe. Vous leur apprenez ça ?

**DAVID** — J''essaie. Et je leur dis surtout une chose : je préfère un chef d''équipe qui me dit non avec des arguments qu''un chef d''équipe qui me dit oui et qui ne livre pas. Le premier me fait gagner du temps. Le second m''en fait perdre, et il perd ma confiance.

**CLAIRE** — Passons à la négociation. Obtenir des moyens : un poste, du matériel, du budget de formation. Comment vous vous y prenez ?

**DAVID** — Je prépare comme un dossier. Ça paraît lourd, mais un directeur qui reçoit une demande de poste doit lui-même la défendre au-dessus de lui, donc il a besoin de mes arguments. Le dossier, c''est une page : le besoin, chiffré ; ce que ça coûte ; ce que ça rapporte ou ce que ça évite ; ce qui se passe si on ne le fait pas ; et ce que je propose comme alternative si le budget n''est pas là.

**CLAIRE** — Donnez-nous un exemple.

**DAVID** — Le cariste du samedi. Ma demande : un poste à temps partiel, 8 heures le samedi. Le coût : environ 12 000 euros par an chargés. Ce que ça évite : les heures supplémentaires actuelles, qui coûtent déjà 7 000, et les retards du lundi, qui nous ont valu deux pénalités à 3 000 euros chacune l''année dernière. Donc le poste se paie tout seul. L''alternative si on refuse : je décale les commandes du samedi au lundi, et on accepte un délai de plus sur ces commandes-là. Avec ça, mon directeur a tout ce qu''il faut pour décider, et pour défendre le poste auprès de la direction régionale.

**CLAIRE** — Vous parlez le langage de la direction.

**DAVID** — Le langage de la direction, c''est les chiffres et les risques. Pas parce que les directeurs sont insensibles, mais parce que c''est comme ça qu''ils arbitrent entre vingt demandes. Si je dis « mon équipe est fatiguée », c''est vrai, mais ça ne pèse rien face à une autre demande chiffrée. Si je dis « la fatigue nous coûte deux arrêts de travail par trimestre, soit tant de jours perdus », ça pèse.

**CLAIRE** — Et quand la réponse est non ?

**DAVID** — D''abord, je demande pourquoi. Pas pour contester, pour comprendre. Souvent, le non a une raison que je ne connaissais pas : un gel des embauches, une autre priorité. Ensuite, je demande ce qui pourrait faire changer la réponse : « À quelles conditions ce serait envisageable ? Dans quel délai ? » Et je reviens trois mois plus tard avec les chiffres mis à jour. Un non aujourd''hui n''est pas un non pour toujours.

**CLAIRE** — Et vis-à-vis de l''équipe, quand vous revenez avec un non ?

**DAVID** — C''est le moment le plus délicat. La tentation, c''est de dire « j''ai demandé, ils ont refusé, c''est pas moi ». Et c''est une catastrophe, parce que vous vous mettez du côté de l''équipe contre la direction, et vous n''êtes plus manager. Je dis : « J''ai demandé un cariste le samedi. La réponse est non pour cette année, parce que les embauches sont gelées. Voilà ce qu''on fait en attendant. Et je redemande en janvier. » Je porte la décision, même si je ne la partage pas. Ce que j''en pense, je l''ai dit à mon directeur, pas à l''équipe.

**CLAIRE** — C''est la loyauté dont on parle au module 1.

**DAVID** — Oui. Loyal vers le haut, ça veut dire : je conteste avant, en face, avec des arguments ; et une fois que c''est décidé, je porte. Loyal vers le bas, ça veut dire : je ne cache pas les décisions, je ne fais pas semblant de les avoir prises quand je ne les ai pas prises, et je dis ce que je fais pour l''équipe.

**CLAIRE** — Il y a un autre sujet difficile : le manager qui doit alerter sur un problème qui concerne sa hiérarchie elle-même. Un directeur qui prend de mauvaises décisions, ou qui a un comportement inapproprié.

**DAVID** — C''est rare, mais ça arrive, et il faut savoir quoi faire. Pour une mauvaise décision, c''est ce qu''on a dit : les faits, l''impact, les options, en face, puis par écrit. Si ça ne suffit pas et que le risque est grave, on monte d''un niveau, en le disant : « Je vais en parler à la direction régionale, je vous en informe. » Ce n''est pas de la trahison, c''est de l''alerte.

**CLAIRE** — Et pour un comportement ?

**DAVID** — Là, on ne gère pas seul. Si un supérieur a un comportement de harcèlement, de discrimination, ou met les gens en danger, il y a des circuits prévus : les ressources humaines, le CSE, le médecin du travail, le référent harcèlement, et, si l''entreprise ne réagit pas, l''inspection du travail. Un manager de proximité qui constate ça a l''obligation de le remonter, et il a une protection légale quand il le fait de bonne foi. Ce n''est pas un sujet de négociation.

**CLAIRE** — Pour terminer, si vous deviez donner trois conseils à un nouveau manager sur la communication vers le haut ?

**DAVID** — Un : ne dites jamais « on va faire au mieux ». Dites « oui », « non », ou « oui à ces conditions », et dites-le avec des faits. Deux : remontez les problèmes dans les 24 heures, avec ce que vous savez et ce que vous proposez, même imparfait ; votre chef préfère un problème tôt qu''une catastrophe tard. Trois : quand vous revenez vers l''équipe, portez la décision. Vous avez le droit de la contester avant, en face ; vous n''avez pas le droit de la désavouer après, devant l''équipe.

**CLAIRE** — Et le quatrième, que vous n''avez pas dit : l''écrit après l''oral.

**DAVID** — Toujours. Court, factuel, « comme convenu ». Ça protège tout le monde, à commencer par la décision elle-même.

**CLAIRE** — Merci David. Dans la fiche outil qui suit, vous trouverez la trame de l''entretien de suivi et un modèle d''ordre du jour. Et dans le cas pratique, Karim va devoir, lui aussi, parler à Michel.

---

Sources : Mintzberg (1973) sur les rôles de liaison ; Code du travail, art. L1152-2 et L1132-3-3 (protection des salariés qui relatent des faits de harcèlement ou de discrimination), art. L4122-1 (obligation de sécurité du salarié) ; Roger Fisher, William Ury, *Comment réussir une négociation*, Seuil, 1982 (éd. originale *Getting to Yes*, 1981) — négociation sur les intérêts.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Format : conversation à deux voix. **CLAIRE** = animatrice IDEAFORMA. **DAVID** = responsable d''équipe logistique dans une plateforme de distribution (22 salariés, trois chefs d''équipe au-dessus de lui un directeur de site), en poste depuis quatre ans après avoir été cariste puis chef de quai (personnage fictif). Débit : 150 mots/min.
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

**CLAIRE** — Bonjour à tous. Aujourd''hui, on parle d''une communication dont les formations de management parlent peu : celle qui va vers le haut. Comment on dit non à son directeur, comment on lui remonte un problème sans passer pour celui qui râle, comment on obtient des moyens. David, vous encadrez une équipe logistique depuis quatre ans. Est-ce que vous vous souvenez de la première fois où vous avez dû dire non à votre hiérarchie ?

**DAVID** — Très bien. Et je ne l''ai pas dit. C''était trois mois après ma prise de poste. Mon directeur de site m''annonce qu''on va absorber les flux d''un autre entrepôt pendant deux semaines, sans renfort. Je savais que c''était impossible avec mes effectifs. J''ai dit « on va faire au mieux ».

**CLAIRE** — Et ?

**DAVID** — Et on n''a pas fait au mieux. On a fait des heures, on a eu deux arrêts de travail, on a livré en retard, et à la fin le directeur m''a demandé pourquoi je ne l''avais pas prévenu. Ce qui m''a rendu fou, parce que j''avais l''impression de l''avoir prévenu.

**CLAIRE** — Vous aviez dit « on va faire au mieux ».

**DAVID** — Oui. Et pour lui, ça voulait dire « c''est bon ». Pour moi, ça voulait dire « c''est impossible mais je n''ose pas le dire ». C''est là que j''ai compris que « faire au mieux », pour un manager, c''est la pire réponse possible. Ce n''est ni un oui, ni un non, et tout le monde entend ce qui l''arrange.

**CLAIRE** — Alors qu''est-ce qu''il aurait fallu dire ?

**DAVID** — Avec le recul, quelque chose comme : « Avec l''équipe actuelle, on peut absorber la moitié du flux en tenant les délais. Pour absorber tout, il me faut trois intérimaires sur deux semaines, ou on accepte deux jours de retard sur les commandes non prioritaires. Qu''est-ce que vous préférez ? »

**CLAIRE** — C''est intéressant, parce que ce n''est pas un non.

**DAVID** — Non, c''est mieux qu''un non. Un non sec, à un directeur, ça ne passe pas, et ça ne devrait pas passer, d''ailleurs : c''est lui qui décide. Mais un « oui, à ces conditions » ou un « oui, avec ces conséquences », c''est du management. Vous lui donnez les faits, vous lui donnez des options, et vous lui laissez la décision. Et si sa décision c''est « on absorbe tout sans renfort et on tient les délais », là vous dites : « Je ne sais pas le faire. Je vais essayer, mais je vous dis maintenant que ça ne tiendra pas, et je vous le redirai par écrit. »

**CLAIRE** — On va revenir sur l''écrit. Mais d''abord, cette idée d''options. Pourquoi c''est si important ?

**DAVID** — Parce qu''un chef qui reçoit un problème sans option se retrouve avec le problème sur les bras, et il n''aime pas ça. Il a vingt problèmes déjà. Si vous arrivez avec « j''ai un problème », vous en êtes un de plus. Si vous arrivez avec « j''ai un problème, voilà deux façons de le régler, je recommande la première, j''ai besoin de votre accord », vous êtes une solution.

**CLAIRE** — C''est ce qu''on appelle parfois « monter avec une solution ».

**DAVID** — Oui, mais attention à un piège : il ne faut pas attendre d''avoir la solution parfaite pour remonter le problème. J''ai vu des chefs d''équipe garder un problème trois semaines parce qu''ils cherchaient la solution, et quand ils l''ont remonté, c''était trop tard. La règle que je donne à mes chefs d''équipe : un problème se remonte dans les 24 heures, avec ce qu''on sait, avec ce qu''on ne sait pas, et avec ce qu''on propose, même si c''est imparfait.

**CLAIRE** — Vous avez dit « sans passer pour celui qui râle ». C''est une vraie peur chez les managers de proximité.

**DAVID** — C''est la peur principale. On a l''impression que remonter un problème, c''est se plaindre, ou avouer qu''on ne gère pas. Alors on se tait, et on gère seul, et un jour ça explose, et là on est vraiment celui qui ne gère pas.

**CLAIRE** — Comment on fait la différence entre alerter et se plaindre ?

**DAVID** — Se plaindre, c''est parler de soi et de ce qu''on ressent : « c''est ingérable, on n''en peut plus, on n''a jamais les moyens ». Alerter, c''est parler des faits et des conséquences pour l''entreprise : « on est à 82 % de délais tenus au lieu de 95 %, la cause principale c''est l''absence de cariste le samedi, si ça continue on perd le contrat X ». Le premier message, votre chef l''entend comme du bruit. Le second, il l''entend comme un risque, et les chefs sont là pour gérer les risques.

**CLAIRE** — Donc les faits, encore. C''est le même principe que pour le feedback à l''équipe.

**DAVID** — C''est exactement le même. Vers le bas, vers le haut, c''est la même méthode : les faits, l''impact, ce qu''on propose. La seule différence, c''est qu''en montant, vous ne donnez pas une consigne, vous demandez une décision.

**CLAIRE** — Vous avez évoqué l''écrit. Quand est-ce qu''on écrit à sa hiérarchie ?

**DAVID** — Toujours après l''oral, jamais à la place. Je dis d''abord les choses en face, et ensuite je confirme par un message court : « Comme convenu ce matin, on absorbe le flux de l''entrepôt B avec deux intérimaires à partir de lundi ; sans renfort, je vous confirme que les délais ne tiendront pas sur les commandes non prioritaires. » Ce n''est pas pour me couvrir, enfin pas seulement. C''est pour que la décision soit claire, pour lui comme pour moi.

**CLAIRE** — Mais ça sert aussi à se couvrir.

**DAVID** — Oui. Et il faut le dire sans gêne : un manager qui a alerté par écrit et à qui on a dit de continuer quand même n''est pas dans la même position que celui qui n''a rien dit. Pour la sécurité, en particulier, c''est essentiel. Si mon directeur me demande de faire tourner un chariot dont le contrôle périodique est dépassé, je dis non, je le dis par écrit, et là c''est un vrai non. Il y a des sujets où « oui à ces conditions » n''existe pas : la sécurité, la légalité, la dignité des gens. Là, le non est net, et il est écrit.

**CLAIRE** — Vous encadrez trois chefs d''équipe. Vous leur apprenez ça ?

**DAVID** — J''essaie. Et je leur dis surtout une chose : je préfère un chef d''équipe qui me dit non avec des arguments qu''un chef d''équipe qui me dit oui et qui ne livre pas. Le premier me fait gagner du temps. Le second m''en fait perdre, et il perd ma confiance.

**CLAIRE** — Passons à la négociation. Obtenir des moyens : un poste, du matériel, du budget de formation. Comment vous vous y prenez ?

**DAVID** — Je prépare comme un dossier. Ça paraît lourd, mais un directeur qui reçoit une demande de poste doit lui-même la défendre au-dessus de lui, donc il a besoin de mes arguments. Le dossier, c''est une page : le besoin, chiffré ; ce que ça coûte ; ce que ça rapporte ou ce que ça évite ; ce qui se passe si on ne le fait pas ; et ce que je propose comme alternative si le budget n''est pas là.

**CLAIRE** — Donnez-nous un exemple.

**DAVID** — Le cariste du samedi. Ma demande : un poste à temps partiel, 8 heures le samedi. Le coût : environ 12 000 euros par an chargés. Ce que ça évite : les heures supplémentaires actuelles, qui coûtent déjà 7 000, et les retards du lundi, qui nous ont valu deux pénalités à 3 000 euros chacune l''année dernière. Donc le poste se paie tout seul. L''alternative si on refuse : je décale les commandes du samedi au lundi, et on accepte un délai de plus sur ces commandes-là. Avec ça, mon directeur a tout ce qu''il faut pour décider, et pour défendre le poste auprès de la direction régionale.

**CLAIRE** — Vous parlez le langage de la direction.

**DAVID** — Le langage de la direction, c''est les chiffres et les risques. Pas parce que les directeurs sont insensibles, mais parce que c''est comme ça qu''ils arbitrent entre vingt demandes. Si je dis « mon équipe est fatiguée », c''est vrai, mais ça ne pèse rien face à une autre demande chiffrée. Si je dis « la fatigue nous coûte deux arrêts de travail par trimestre, soit tant de jours perdus », ça pèse.

**CLAIRE** — Et quand la réponse est non ?

**DAVID** — D''abord, je demande pourquoi. Pas pour contester, pour comprendre. Souvent, le non a une raison que je ne connaissais pas : un gel des embauches, une autre priorité. Ensuite, je demande ce qui pourrait faire changer la réponse : « À quelles conditions ce serait envisageable ? Dans quel délai ? » Et je reviens trois mois plus tard avec les chiffres mis à jour. Un non aujourd''hui n''est pas un non pour toujours.

**CLAIRE** — Et vis-à-vis de l''équipe, quand vous revenez avec un non ?

**DAVID** — C''est le moment le plus délicat. La tentation, c''est de dire « j''ai demandé, ils ont refusé, c''est pas moi ». Et c''est une catastrophe, parce que vous vous mettez du côté de l''équipe contre la direction, et vous n''êtes plus manager. Je dis : « J''ai demandé un cariste le samedi. La réponse est non pour cette année, parce que les embauches sont gelées. Voilà ce qu''on fait en attendant. Et je redemande en janvier. » Je porte la décision, même si je ne la partage pas. Ce que j''en pense, je l''ai dit à mon directeur, pas à l''équipe.

**CLAIRE** — C''est la loyauté dont on parle au module 1.

**DAVID** — Oui. Loyal vers le haut, ça veut dire : je conteste avant, en face, avec des arguments ; et une fois que c''est décidé, je porte. Loyal vers le bas, ça veut dire : je ne cache pas les décisions, je ne fais pas semblant de les avoir prises quand je ne les ai pas prises, et je dis ce que je fais pour l''équipe.

**CLAIRE** — Il y a un autre sujet difficile : le manager qui doit alerter sur un problème qui concerne sa hiérarchie elle-même. Un directeur qui prend de mauvaises décisions, ou qui a un comportement inapproprié.

**DAVID** — C''est rare, mais ça arrive, et il faut savoir quoi faire. Pour une mauvaise décision, c''est ce qu''on a dit : les faits, l''impact, les options, en face, puis par écrit. Si ça ne suffit pas et que le risque est grave, on monte d''un niveau, en le disant : « Je vais en parler à la direction régionale, je vous en informe. » Ce n''est pas de la trahison, c''est de l''alerte.

**CLAIRE** — Et pour un comportement ?

**DAVID** — Là, on ne gère pas seul. Si un supérieur a un comportement de harcèlement, de discrimination, ou met les gens en danger, il y a des circuits prévus : les ressources humaines, le CSE, le médecin du travail, le référent harcèlement, et, si l''entreprise ne réagit pas, l''inspection du travail. Un manager de proximité qui constate ça a l''obligation de le remonter, et il a une protection légale quand il le fait de bonne foi. Ce n''est pas un sujet de négociation.

**CLAIRE** — Pour terminer, si vous deviez donner trois conseils à un nouveau manager sur la communication vers le haut ?

**DAVID** — Un : ne dites jamais « on va faire au mieux ». Dites « oui », « non », ou « oui à ces conditions », et dites-le avec des faits. Deux : remontez les problèmes dans les 24 heures, avec ce que vous savez et ce que vous proposez, même imparfait ; votre chef préfère un problème tôt qu''une catastrophe tard. Trois : quand vous revenez vers l''équipe, portez la décision. Vous avez le droit de la contester avant, en face ; vous n''avez pas le droit de la désavouer après, devant l''équipe.

**CLAIRE** — Et le quatrième, que vous n''avez pas dit : l''écrit après l''oral.

**DAVID** — Toujours. Court, factuel, « comme convenu ». Ça protège tout le monde, à commencer par la décision elle-même.

**CLAIRE** — Merci David. Dans la fiche outil qui suit, vous trouverez la trame de l''entretien de suivi et un modèle d''ordre du jour. Et dans le cas pratique, Karim va devoir, lui aussi, parler à Michel.

---

Sources : Mintzberg (1973) sur les rôles de liaison ; Code du travail, art. L1152-2 et L1132-3-3 (protection des salariés qui relatent des faits de harcèlement ou de discrimination), art. L4122-1 (obligation de sécurité du salarié) ; Roger Fisher, William Ury, *Comment réussir une négociation*, Seuil, 1982 (éd. originale *Getting to Yes*, 1981) — négociation sur les intérêts.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 8;
  n := n + 1;

  -- 3.9-fiche-trame-entretien-ordre-du-jour.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Quatre gabarits à recopier ou à imprimer (PDF à générer, mise en page IDEAFORMA, fond clair). Ils servent au carnet de bord du module (leçon 3.11) et, ensuite, au quotidien.

---

## GABARIT 1 — Préparer un feedback (méthode SBI)

À remplir avant l''entretien, en cinq minutes. Une seule situation par fiche.

| Étape | Ce que j''écris | Contrôle |
|---|---|---|
| Situation (quand, où) | | Datée ? Précise ? |
| Comportement observé (ce que la personne a fait ou dit) | | Un fait, pas une interprétation ni un trait de caractère ? |
| Impact (sur le client, l''équipe, l''entreprise, moi) | | Concret ? Vérifiable ? |
| Attente (ce que je demande, pour quand) — feedback correctif | | Réalisable ? Datée ? |
| Ce qu''il faut refaire — feedback positif | | Précis ? |
| Question finale | « Comment tu vois ça ? » | |
| Canal | En privé (correctif) / en public (positif, si la personne l''accepte) | |
| Délai depuis les faits | | Moins de 48 h ? |
| Point de suivi | Date : | |

Pour un sujet relationnel (méthode DESC), ajouter : ce que cela me fait, en « je » : ____________________ ; ce que je demande : ____________________ ; ce que cela permettra : ____________________.

---

## GABARIT 2 — Trame d''entretien individuel de suivi (30 min)

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

Rappel : pas d''information de santé ni de vie privée au-delà du strictement utile. Ces notes sont celles du manager, pas un document RH.

---

## GABARIT 3 — Trame d''entretien de recadrage

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

## GABARIT 4 — Ordre du jour type et relevé de décisions

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

## GABARIT 5 — Préparer une alerte ou une demande à sa hiérarchie (une page)

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
- Toute trace reste factuelle et professionnelle : elle peut être lue un jour par la personne, par la hiérarchie, ou par un juge.
- Les gabarits sont des supports, pas des scripts : l''écoute (leçon 3.2) passe avant la trame.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Quatre gabarits à recopier ou à imprimer (PDF à générer, mise en page IDEAFORMA, fond clair). Ils servent au carnet de bord du module (leçon 3.11) et, ensuite, au quotidien.

---

## GABARIT 1 — Préparer un feedback (méthode SBI)

À remplir avant l''entretien, en cinq minutes. Une seule situation par fiche.

| Étape | Ce que j''écris | Contrôle |
|---|---|---|
| Situation (quand, où) | | Datée ? Précise ? |
| Comportement observé (ce que la personne a fait ou dit) | | Un fait, pas une interprétation ni un trait de caractère ? |
| Impact (sur le client, l''équipe, l''entreprise, moi) | | Concret ? Vérifiable ? |
| Attente (ce que je demande, pour quand) — feedback correctif | | Réalisable ? Datée ? |
| Ce qu''il faut refaire — feedback positif | | Précis ? |
| Question finale | « Comment tu vois ça ? » | |
| Canal | En privé (correctif) / en public (positif, si la personne l''accepte) | |
| Délai depuis les faits | | Moins de 48 h ? |
| Point de suivi | Date : | |

Pour un sujet relationnel (méthode DESC), ajouter : ce que cela me fait, en « je » : ____________________ ; ce que je demande : ____________________ ; ce que cela permettra : ____________________.

---

## GABARIT 2 — Trame d''entretien individuel de suivi (30 min)

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

Rappel : pas d''information de santé ni de vie privée au-delà du strictement utile. Ces notes sont celles du manager, pas un document RH.

---

## GABARIT 3 — Trame d''entretien de recadrage

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

## GABARIT 4 — Ordre du jour type et relevé de décisions

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

## GABARIT 5 — Préparer une alerte ou une demande à sa hiérarchie (une page)

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
- Toute trace reste factuelle et professionnelle : elle peut être lue un jour par la personne, par la hiérarchie, ou par un juge.
- Les gabarits sont des supports, pas des scripts : l''écoute (leçon 3.2) passe avant la trame.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 4 and l.ordre = 9;
  n := n + 1;

  -- 4.1-video-motivation.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Type : vidéo avatar · Débit : 140 mots/min · Indications visuelles entre crochets
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

[Plan : avatar, fond clair. Titre : « Module 4 — Motiver, engager, faire progresser »]

Bienvenue dans le module 4. Vous savez maintenant organiser le travail et communiquer avec votre équipe. Reste une question que tous les managers se posent, souvent à voix basse : comment faire pour que les gens aient envie ?

Commençons par démonter une idée reçue. La plupart des managers pensent que la motivation, c''est une affaire de prime, de salaire, de « carotte ». Ce n''est pas faux, mais c''est très incomplet. Et si vous ne comptez que là-dessus, vous serez vite à court de moyens, parce qu''un manager de proximité ne décide ni des salaires ni des primes.

Trois chercheurs, à trois époques, ont éclairé ce qui motive au travail. Leurs conclusions se complètent, et elles donnent au manager des leviers qu''il peut actionner sans budget.

[Titre : « Herzberg : deux familles de facteurs »]

Le premier est Frederick Herzberg, psychologue américain. À la fin des années 1950, il a interrogé des centaines de salariés en leur demandant de raconter un moment où ils s''étaient sentis exceptionnellement bien au travail, et un moment où ils s''étaient sentis exceptionnellement mal.

Il s''attendait à trouver les mêmes causes, dans un sens et dans l''autre. Ce n''est pas ce qu''il a trouvé.

[Schéma : deux colonnes. Gauche « Facteurs d''hygiène » : salaire, conditions de travail, relations avec le chef, politique de l''entreprise, sécurité de l''emploi. Droite « Facteurs de motivation » : accomplissement, reconnaissance, intérêt du travail, responsabilité, progression.]

Les mauvais moments étaient liés à ce qu''il a appelé les facteurs d''hygiène : le salaire, les conditions de travail, la relation avec le supérieur, les règles de l''entreprise. Quand ces facteurs sont mauvais, les gens sont insatisfaits. Mais quand ils sont bons, les gens ne sont pas motivés pour autant : ils ne sont simplement plus insatisfaits.

Les bons moments, eux, étaient liés à une autre famille : l''accomplissement, la reconnaissance, l''intérêt du travail lui-même, la responsabilité, le fait de progresser. Ce sont les facteurs de motivation.

Ce que cela signifie pour vous : le salaire et les conditions de travail sont indispensables, mais ils ne créent pas l''engagement. Ils évitent le désengagement. Une augmentation fait plaisir trois semaines. Un travail intéressant, une responsabilité confiée, une progression visible font effet pendant des années. Et ces leviers-là, c''est vous qui les tenez.

[Titre : « Deci et Ryan : trois besoins »]

Le deuxième éclairage vient d''Edward Deci et Richard Ryan, psychologues américains, avec la théorie de l''autodétermination, développée à partir des années 1980. Ils ont montré, expériences à l''appui, que la motivation la plus solide, celle qui dure et qui produit de la qualité, vient de l''intérieur de la personne, et qu''elle se nourrit de trois besoins.

[Schéma : trois cercles : Autonomie · Compétence · Lien]

L''autonomie : avoir une marge de décision sur la façon de faire son travail. Pas l''absence de cadre, mais un espace à l''intérieur du cadre.

La compétence : sentir qu''on maîtrise ce qu''on fait et qu''on progresse. Être mis en situation de réussir, avec des défis à sa mesure.

Le lien : se sentir relié aux autres, appartenir à une équipe, compter pour quelqu''un.

Quand ces trois besoins sont nourris, les gens s''engagent d''eux-mêmes. Quand ils sont frustrés, aucune prime ne compense. Deci a même montré quelque chose de contre-intuitif : dans certaines conditions, récompenser financièrement une activité que les gens aimaient faire diminuait leur intérêt pour cette activité. La récompense externe avait remplacé le plaisir interne.

Pour le manager, la traduction est simple : à chaque décision, demandez-vous si elle augmente ou diminue l''autonomie, la compétence et le lien de la personne concernée.

[Titre : « Amabile et Kramer : le principe du progrès »]

Le troisième éclairage est le plus récent. Teresa Amabile et Steven Kramer, chercheurs à Harvard, ont demandé à plus de deux cents personnes, dans sept entreprises, de tenir un journal quotidien de leur journée de travail pendant plusieurs mois. Près de douze mille journées analysées.

Leur question : qu''est-ce qui distingue une bonne journée d''une mauvaise, du point de vue de la motivation ?

La réponse, publiée en 2011, tient en une phrase : ce qui compte le plus, c''est le sentiment d''avancer dans un travail qui a du sens. Pas les grandes victoires. Les petits progrès. Une pièce terminée, un problème résolu, un client satisfait. Et à l''inverse, ce qui plombe le plus une journée, c''est le sentiment de reculer : un travail refait, une décision annulée, un obstacle qui bloque.

[Texte à l''écran : « Le principe du progrès : les petites victoires quotidiennes nourrissent la motivation plus que les grandes récompenses. »]

Ce que cela signifie pour vous : votre rôle est de rendre le progrès possible et visible. Enlever les obstacles, donner les moyens, fixer des objectifs qui permettent de constater qu''on avance, et dire quand ça avance. Un manager qui ne relève que ce qui ne va pas fabrique des journées de recul.

[Titre : « Ce que le manager peut faire, sans budget »]

Rassemblons. Trois modèles, un même message : la motivation ne s''achète pas, elle se construit dans le travail lui-même. Et voici ce que vous pouvez faire dès demain.

Donner de l''autonomie : déléguer, comme au module 2, avec un vrai espace de décision. Laisser choisir la méthode quand le résultat est clair.

Faire progresser : confier des tâches un peu au-dessus du niveau actuel, former, mettre en binôme. La leçon 4.4 y est consacrée.

Reconnaître : dire ce qui est bien, précisément, à temps. La leçon 4.3.

Rendre le progrès visible : un tableau de bord partagé, un point quotidien où l''on dit ce qui a avancé, une réunion qui commence par les réussites.

Enlever les obstacles : c''est peut-être le plus important et le moins vu. Chaque fois que vous réglez un problème d''outil, de pièce manquante, d''information qui n''arrive pas, vous fabriquez une bonne journée.

Et protéger le lien : une équipe où l''on peut parler, où l''on n''est pas humilié, où l''on compte. C''est la sécurité psychologique, la leçon suivante.

[Plan : reprise du cas]

À l''atelier Garnier, deux histoires illustrent tout cela. Marc, le mécanicien, était démotivé. Pas à cause de son salaire : à cause du sentiment de reculer chaque jour, en découvrant les interventions au dernier moment, et de ne compter pour personne. Le jour où Karim l''a consulté chaque soir pour le planning du lendemain, Marc a retrouvé de l''autonomie, du lien, et des journées qui avancent.

Julien, lui, s''était éteint après avoir été humilié devant tout le monde pour une coulure. Le binôme avec Thierry lui a rendu la compétence ; le retour positif trois semaines plus tard lui a rendu la reconnaissance. Aucun des deux n''a eu un euro de plus.

La motivation n''est pas un mystère. C''est le résultat de conditions que vous pouvez créer.

À tout de suite pour la sécurité psychologique.

[Fondu, logo]

---

Sources : Frederick Herzberg, Bernard Mausner, Barbara Snyderman, *The Motivation to Work*, 1959 ; Herzberg, « One More Time: How Do You Motivate Employees? », *Harvard Business Review*, 1968 ; Edward Deci, Richard Ryan, *Intrinsic Motivation and Self-Determination in Human Behavior*, 1985, et « Self-Determination Theory », *American Psychologist*, 2000 ; Teresa Amabile, Steven Kramer, *The Progress Principle*, Harvard Business Review Press, 2011.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Type : vidéo avatar · Débit : 140 mots/min · Indications visuelles entre crochets
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

[Plan : avatar, fond clair. Titre : « Module 4 — Motiver, engager, faire progresser »]

Bienvenue dans le module 4. Vous savez maintenant organiser le travail et communiquer avec votre équipe. Reste une question que tous les managers se posent, souvent à voix basse : comment faire pour que les gens aient envie ?

Commençons par démonter une idée reçue. La plupart des managers pensent que la motivation, c''est une affaire de prime, de salaire, de « carotte ». Ce n''est pas faux, mais c''est très incomplet. Et si vous ne comptez que là-dessus, vous serez vite à court de moyens, parce qu''un manager de proximité ne décide ni des salaires ni des primes.

Trois chercheurs, à trois époques, ont éclairé ce qui motive au travail. Leurs conclusions se complètent, et elles donnent au manager des leviers qu''il peut actionner sans budget.

[Titre : « Herzberg : deux familles de facteurs »]

Le premier est Frederick Herzberg, psychologue américain. À la fin des années 1950, il a interrogé des centaines de salariés en leur demandant de raconter un moment où ils s''étaient sentis exceptionnellement bien au travail, et un moment où ils s''étaient sentis exceptionnellement mal.

Il s''attendait à trouver les mêmes causes, dans un sens et dans l''autre. Ce n''est pas ce qu''il a trouvé.

[Schéma : deux colonnes. Gauche « Facteurs d''hygiène » : salaire, conditions de travail, relations avec le chef, politique de l''entreprise, sécurité de l''emploi. Droite « Facteurs de motivation » : accomplissement, reconnaissance, intérêt du travail, responsabilité, progression.]

Les mauvais moments étaient liés à ce qu''il a appelé les facteurs d''hygiène : le salaire, les conditions de travail, la relation avec le supérieur, les règles de l''entreprise. Quand ces facteurs sont mauvais, les gens sont insatisfaits. Mais quand ils sont bons, les gens ne sont pas motivés pour autant : ils ne sont simplement plus insatisfaits.

Les bons moments, eux, étaient liés à une autre famille : l''accomplissement, la reconnaissance, l''intérêt du travail lui-même, la responsabilité, le fait de progresser. Ce sont les facteurs de motivation.

Ce que cela signifie pour vous : le salaire et les conditions de travail sont indispensables, mais ils ne créent pas l''engagement. Ils évitent le désengagement. Une augmentation fait plaisir trois semaines. Un travail intéressant, une responsabilité confiée, une progression visible font effet pendant des années. Et ces leviers-là, c''est vous qui les tenez.

[Titre : « Deci et Ryan : trois besoins »]

Le deuxième éclairage vient d''Edward Deci et Richard Ryan, psychologues américains, avec la théorie de l''autodétermination, développée à partir des années 1980. Ils ont montré, expériences à l''appui, que la motivation la plus solide, celle qui dure et qui produit de la qualité, vient de l''intérieur de la personne, et qu''elle se nourrit de trois besoins.

[Schéma : trois cercles : Autonomie · Compétence · Lien]

L''autonomie : avoir une marge de décision sur la façon de faire son travail. Pas l''absence de cadre, mais un espace à l''intérieur du cadre.

La compétence : sentir qu''on maîtrise ce qu''on fait et qu''on progresse. Être mis en situation de réussir, avec des défis à sa mesure.

Le lien : se sentir relié aux autres, appartenir à une équipe, compter pour quelqu''un.

Quand ces trois besoins sont nourris, les gens s''engagent d''eux-mêmes. Quand ils sont frustrés, aucune prime ne compense. Deci a même montré quelque chose de contre-intuitif : dans certaines conditions, récompenser financièrement une activité que les gens aimaient faire diminuait leur intérêt pour cette activité. La récompense externe avait remplacé le plaisir interne.

Pour le manager, la traduction est simple : à chaque décision, demandez-vous si elle augmente ou diminue l''autonomie, la compétence et le lien de la personne concernée.

[Titre : « Amabile et Kramer : le principe du progrès »]

Le troisième éclairage est le plus récent. Teresa Amabile et Steven Kramer, chercheurs à Harvard, ont demandé à plus de deux cents personnes, dans sept entreprises, de tenir un journal quotidien de leur journée de travail pendant plusieurs mois. Près de douze mille journées analysées.

Leur question : qu''est-ce qui distingue une bonne journée d''une mauvaise, du point de vue de la motivation ?

La réponse, publiée en 2011, tient en une phrase : ce qui compte le plus, c''est le sentiment d''avancer dans un travail qui a du sens. Pas les grandes victoires. Les petits progrès. Une pièce terminée, un problème résolu, un client satisfait. Et à l''inverse, ce qui plombe le plus une journée, c''est le sentiment de reculer : un travail refait, une décision annulée, un obstacle qui bloque.

[Texte à l''écran : « Le principe du progrès : les petites victoires quotidiennes nourrissent la motivation plus que les grandes récompenses. »]

Ce que cela signifie pour vous : votre rôle est de rendre le progrès possible et visible. Enlever les obstacles, donner les moyens, fixer des objectifs qui permettent de constater qu''on avance, et dire quand ça avance. Un manager qui ne relève que ce qui ne va pas fabrique des journées de recul.

[Titre : « Ce que le manager peut faire, sans budget »]

Rassemblons. Trois modèles, un même message : la motivation ne s''achète pas, elle se construit dans le travail lui-même. Et voici ce que vous pouvez faire dès demain.

Donner de l''autonomie : déléguer, comme au module 2, avec un vrai espace de décision. Laisser choisir la méthode quand le résultat est clair.

Faire progresser : confier des tâches un peu au-dessus du niveau actuel, former, mettre en binôme. La leçon 4.4 y est consacrée.

Reconnaître : dire ce qui est bien, précisément, à temps. La leçon 4.3.

Rendre le progrès visible : un tableau de bord partagé, un point quotidien où l''on dit ce qui a avancé, une réunion qui commence par les réussites.

Enlever les obstacles : c''est peut-être le plus important et le moins vu. Chaque fois que vous réglez un problème d''outil, de pièce manquante, d''information qui n''arrive pas, vous fabriquez une bonne journée.

Et protéger le lien : une équipe où l''on peut parler, où l''on n''est pas humilié, où l''on compte. C''est la sécurité psychologique, la leçon suivante.

[Plan : reprise du cas]

À l''atelier Garnier, deux histoires illustrent tout cela. Marc, le mécanicien, était démotivé. Pas à cause de son salaire : à cause du sentiment de reculer chaque jour, en découvrant les interventions au dernier moment, et de ne compter pour personne. Le jour où Karim l''a consulté chaque soir pour le planning du lendemain, Marc a retrouvé de l''autonomie, du lien, et des journées qui avancent.

Julien, lui, s''était éteint après avoir été humilié devant tout le monde pour une coulure. Le binôme avec Thierry lui a rendu la compétence ; le retour positif trois semaines plus tard lui a rendu la reconnaissance. Aucun des deux n''a eu un euro de plus.

La motivation n''est pas un mystère. C''est le résultat de conditions que vous pouvez créer.

À tout de suite pour la sécurité psychologique.

[Fondu, logo]

---

Sources : Frederick Herzberg, Bernard Mausner, Barbara Snyderman, *The Motivation to Work*, 1959 ; Herzberg, « One More Time: How Do You Motivate Employees? », *Harvard Business Review*, 1968 ; Edward Deci, Richard Ryan, *Intrinsic Motivation and Self-Determination in Human Behavior*, 1985, et « Self-Determination Theory », *American Psychologist*, 2000 ; Teresa Amabile, Steven Kramer, *The Progress Principle*, Harvard Business Review Press, 2011.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 5 and l.ordre = 1;
  n := n + 1;

  -- 4.10-carnet-application.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Vous avez vu ce qui motive au travail, la sécurité psychologique, la reconnaissance, le développement des compétences, l''intégration, le cadre de travail soutenable et la prévention des risques psychosociaux. À vous de l''appliquer à votre équipe. Comptez 1 h 45 à 2 h. Utilisez les gabarits de la fiche outil (leçon 4.9).

Si vous n''encadrez pas d''équipe, travaillez sur une équipe que vous connaissez, ou sur l''atelier Garnier en imaginant les situations de votre secteur.

## Étape 1 — Diagnostic motivation (20 min)

- Pour chaque membre de l''équipe, notez en une ligne ce qui, selon vous, le motive et ce qui le freine, en vous appuyant sur les trois besoins de Deci et Ryan (autonomie, compétence, lien) et sur le principe du progrès. Soyez concret : « découvre les interventions au dernier moment », pas « manque de reconnaissance ».
- Pour deux personnes, identifiez une décision qui dépend de vous et qui augmenterait leur autonomie, leur compétence ou leur lien. Datez-la.
- Quels obstacles au progrès quotidien (outil, information, pièce, validation) pourriez-vous lever cette semaine ? Choisissez-en un.

## Étape 2 — Diagnostic sécurité psychologique (25 min)

- Remplissez le gabarit 3 pour vous-même. Si vous le pouvez, proposez-le à l''équipe de façon anonyme (une boîte, un formulaire) et comparez.
- Repensez à la dernière fois où quelqu''un vous a signalé une erreur, contesté une décision ou posé une question « bête ». Qu''avez-vous fait dans les dix secondes qui ont suivi ? Que retient l''équipe de ce moment ?
- Notez vos cinq comportements de 1 à 5. Choisissez celui que vous allez travailler en premier et la situation précise où vous l''appliquerez cette semaine.
- Y a-t-il dans l''équipe une habitude (moquerie, coupure de parole, mépris) que vous laissez passer ? Écrivez la phrase que vous direz la prochaine fois.

## Étape 3 — Reconnaissance (15 min)

- Pour chaque membre de l''équipe, notez la date du dernier retour positif précis que vous lui avez fait. Qui est à plus de quinze jours ?
- Pour ces personnes, trouvez une reconnaissance sincère et précise, en variant les formes (personne, manière de faire, effort, résultat). Écrivez la phrase, et le moment où vous la direz.
- Quelle reconnaissance existentielle manque dans votre équipe (informer avant, consulter, saluer chacun) ? Que changez-vous ?

## Étape 4 — Plan de développement d''un collaborateur (25 min)

- Choisissez une personne : soit une compétence critique qu''elle est seule à détenir (à transmettre), soit un souhait d''évolution qu''elle a exprimé, soit un plafonnement.
- Préparez l''entretien GROW : vos questions pour chaque temps (objectif, réalité, options, engagement).
- Remplissez le gabarit 1 (PDI) tel que vous l''imaginez ; vous le corrigerez avec la personne en entretien. Un seul objectif.
- Quel dispositif mobiliser (plan de développement des compétences, OPCO, CPF, VAE, formation interne) ? Auprès de qui vous renseignez-vous ?

## Étape 5 — Charge de travail et cadre (20 min)

- Qui, dans l''équipe, absorbe les imprévus et les heures supplémentaires ? Qui n''en fait jamais, et pourquoi ? Est-ce équitable ? Est-ce connu et expliqué ?
- Passez en revue les attributions de l''année (missions intéressantes, formations, horaires, primes si vous en décidez) : reposent-elles toutes sur un critère objectif ? Y a-t-il une personne systématiquement écartée sans raison dite ?
- Vérifiez les limites légales de durée du travail et de repos dans votre équipe : y a-t-il un dépassement toléré ? Que faites-vous ?
- Vos propres messages : à quelle heure envoyez-vous le dernier ? Que changez-vous ?
- Si votre équipe compte des télétravailleurs : l''entretien annuel sur la charge est-il fait ? Les plages de joignabilité sont-elles fixées ? Les personnes à distance ont-elles le même accès à l''information et aux missions ?

## Étape 6 — Signaux d''alerte (15 min)

- Pour chaque membre de l''équipe, y a-t-il un changement de comportement récent (irritabilité, repli, présence excessive, erreurs inhabituelles, absences courtes) ? Notez les faits, pas une interprétation.
- Pour l''une de ces personnes, si vous en avez repéré une, préparez l''entretien : la phrase d''ouverture factuelle, ce que vous écoutez, ce sur quoi vous pouvez agir dans le travail, les relais que vous rappellerez (médecin du travail, visite à la demande, autres).
- Connaissez-vous le nom et les coordonnées du médecin du travail de votre entreprise, du référent harcèlement s''il existe, des représentants du personnel ? Sinon, trouvez-les cette semaine.
- Et vous-même : lequel de ces signaux vous concerne ? À qui pouvez-vous en parler ?

## Étape 7 — Bilan (10 min)

- Parmi les sept compétences du module, laquelle est votre point fort ? Laquelle est votre point faible ?
- Quelle est la première chose que vous faites dès demain ? Écrivez-la avec une date.
- Que retirez-vous du diagnostic de sécurité psychologique qui vous a surpris ?

Conservez ce carnet : le module 5 (tensions et conflits) reprend la sécurité psychologique comme base de la prévention des conflits.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Vous avez vu ce qui motive au travail, la sécurité psychologique, la reconnaissance, le développement des compétences, l''intégration, le cadre de travail soutenable et la prévention des risques psychosociaux. À vous de l''appliquer à votre équipe. Comptez 1 h 45 à 2 h. Utilisez les gabarits de la fiche outil (leçon 4.9).

Si vous n''encadrez pas d''équipe, travaillez sur une équipe que vous connaissez, ou sur l''atelier Garnier en imaginant les situations de votre secteur.

## Étape 1 — Diagnostic motivation (20 min)

- Pour chaque membre de l''équipe, notez en une ligne ce qui, selon vous, le motive et ce qui le freine, en vous appuyant sur les trois besoins de Deci et Ryan (autonomie, compétence, lien) et sur le principe du progrès. Soyez concret : « découvre les interventions au dernier moment », pas « manque de reconnaissance ».
- Pour deux personnes, identifiez une décision qui dépend de vous et qui augmenterait leur autonomie, leur compétence ou leur lien. Datez-la.
- Quels obstacles au progrès quotidien (outil, information, pièce, validation) pourriez-vous lever cette semaine ? Choisissez-en un.

## Étape 2 — Diagnostic sécurité psychologique (25 min)

- Remplissez le gabarit 3 pour vous-même. Si vous le pouvez, proposez-le à l''équipe de façon anonyme (une boîte, un formulaire) et comparez.
- Repensez à la dernière fois où quelqu''un vous a signalé une erreur, contesté une décision ou posé une question « bête ». Qu''avez-vous fait dans les dix secondes qui ont suivi ? Que retient l''équipe de ce moment ?
- Notez vos cinq comportements de 1 à 5. Choisissez celui que vous allez travailler en premier et la situation précise où vous l''appliquerez cette semaine.
- Y a-t-il dans l''équipe une habitude (moquerie, coupure de parole, mépris) que vous laissez passer ? Écrivez la phrase que vous direz la prochaine fois.

## Étape 3 — Reconnaissance (15 min)

- Pour chaque membre de l''équipe, notez la date du dernier retour positif précis que vous lui avez fait. Qui est à plus de quinze jours ?
- Pour ces personnes, trouvez une reconnaissance sincère et précise, en variant les formes (personne, manière de faire, effort, résultat). Écrivez la phrase, et le moment où vous la direz.
- Quelle reconnaissance existentielle manque dans votre équipe (informer avant, consulter, saluer chacun) ? Que changez-vous ?

## Étape 4 — Plan de développement d''un collaborateur (25 min)

- Choisissez une personne : soit une compétence critique qu''elle est seule à détenir (à transmettre), soit un souhait d''évolution qu''elle a exprimé, soit un plafonnement.
- Préparez l''entretien GROW : vos questions pour chaque temps (objectif, réalité, options, engagement).
- Remplissez le gabarit 1 (PDI) tel que vous l''imaginez ; vous le corrigerez avec la personne en entretien. Un seul objectif.
- Quel dispositif mobiliser (plan de développement des compétences, OPCO, CPF, VAE, formation interne) ? Auprès de qui vous renseignez-vous ?

## Étape 5 — Charge de travail et cadre (20 min)

- Qui, dans l''équipe, absorbe les imprévus et les heures supplémentaires ? Qui n''en fait jamais, et pourquoi ? Est-ce équitable ? Est-ce connu et expliqué ?
- Passez en revue les attributions de l''année (missions intéressantes, formations, horaires, primes si vous en décidez) : reposent-elles toutes sur un critère objectif ? Y a-t-il une personne systématiquement écartée sans raison dite ?
- Vérifiez les limites légales de durée du travail et de repos dans votre équipe : y a-t-il un dépassement toléré ? Que faites-vous ?
- Vos propres messages : à quelle heure envoyez-vous le dernier ? Que changez-vous ?
- Si votre équipe compte des télétravailleurs : l''entretien annuel sur la charge est-il fait ? Les plages de joignabilité sont-elles fixées ? Les personnes à distance ont-elles le même accès à l''information et aux missions ?

## Étape 6 — Signaux d''alerte (15 min)

- Pour chaque membre de l''équipe, y a-t-il un changement de comportement récent (irritabilité, repli, présence excessive, erreurs inhabituelles, absences courtes) ? Notez les faits, pas une interprétation.
- Pour l''une de ces personnes, si vous en avez repéré une, préparez l''entretien : la phrase d''ouverture factuelle, ce que vous écoutez, ce sur quoi vous pouvez agir dans le travail, les relais que vous rappellerez (médecin du travail, visite à la demande, autres).
- Connaissez-vous le nom et les coordonnées du médecin du travail de votre entreprise, du référent harcèlement s''il existe, des représentants du personnel ? Sinon, trouvez-les cette semaine.
- Et vous-même : lequel de ces signaux vous concerne ? À qui pouvez-vous en parler ?

## Étape 7 — Bilan (10 min)

- Parmi les sept compétences du module, laquelle est votre point fort ? Laquelle est votre point faible ?
- Quelle est la première chose que vous faites dès demain ? Écrivez-la avec une date.
- Que retirez-vous du diagnostic de sécurité psychologique qui vous a surpris ?

Conservez ce carnet : le module 5 (tensions et conflits) reprend la sécurité psychologique comme base de la prévention des conflits.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 5 and l.ordre = 10;
  n := n + 1;

  -- 4.11-quiz.json
  update public.lecons l set contenu = '{"questions": [{"id": "m4q01", "enonce": "Selon Herzberg, qu''est-ce qu''un facteur d''hygiène (salaire, conditions de travail, relation avec le chef) ?", "options": ["Un facteur qui crée la motivation quand il est bon", "Un facteur dont l''absence crée de l''insatisfaction, mais dont la présence ne crée pas de motivation durable", "Un facteur sans aucun effet sur les salariés", "Un facteur réservé aux métiers physiques"], "bonnes": [1], "explication": "Les facteurs d''hygiène évitent le désengagement ; ce sont les facteurs de motivation (accomplissement, reconnaissance, intérêt du travail, responsabilité, progression) qui créent l''engagement."}, {"id": "m4q02", "enonce": "Quels sont les trois besoins de la théorie de l''autodétermination de Deci et Ryan ?", "options": ["Salaire, sécurité, statut", "Autonomie, compétence, lien", "Pouvoir, réussite, affiliation", "Reconnaissance, prime, promotion"], "bonnes": [1], "explication": "Quand l''autonomie, la compétence et le lien sont nourris, la motivation vient de l''intérieur ; quand ils sont frustrés, aucune prime ne compense."}, {"id": "m4q03", "enonce": "D''après Amabile et Kramer (principe du progrès), qu''est-ce qui distingue le plus une bonne journée de travail d''une mauvaise ?", "options": ["Le montant de la prime du mois", "Le nombre d''heures travaillées", "Le sentiment d''avancer dans un travail qui a du sens, même par de petits progrès", "L''absence totale de difficulté"], "bonnes": [2], "explication": "Les petites victoires quotidiennes nourrissent la motivation plus que les grandes récompenses ; le sentiment de reculer (travail refait, obstacle) est ce qui la plombe."}, {"id": "m4q04", "enonce": "Qu''est-ce que la sécurité psychologique au sens d''Amy Edmondson ?", "options": ["Une équipe où tout le monde est d''accord et où l''on évite les sujets difficiles", "La conviction partagée que l''on peut poser une question, admettre une erreur, proposer ou contester sans être puni ni humilié", "Un dispositif de sécurité physique obligatoire dans les ateliers", "L''absence de toute exigence de la part du manager"], "bonnes": [1], "explication": "La sécurité psychologique se combine avec l''exigence : c''est ce qui permet de se dire les choses difficiles, pas de les éviter."}, {"id": "m4q05", "enonce": "Dans l''étude d''Edmondson en milieu hospitalier, pourquoi les meilleures équipes déclaraient-elles plus d''erreurs ?", "options": ["Parce qu''elles en faisaient réellement plus", "Parce qu''elles osaient les signaler, alors que les autres les cachaient", "Parce qu''elles étaient moins compétentes", "Parce qu''elles y étaient obligées par la direction"], "bonnes": [1], "explication": "Les erreurs existaient partout ; seules les équipes psychologiquement sûres les signalaient, ce qui permettait de les traiter."}, {"id": "m4q06", "enonce": "Plusieurs réponses. Quels comportements du manager construisent la sécurité psychologique ?", "options": ["Admettre ses propres erreurs devant l''équipe", "Remercier la personne qui signale un problème, même si elle s''est trompée", "Ne jamais dire « je ne sais pas » pour préserver son autorité", "Poser des limites aux moqueries et au mépris dans l''équipe"], "bonnes": [0, 1, 3], "explication": "Un manager qui ne se trompe jamais et sait tout oblige les autres à cacher et à se taire. Admettre, remercier, questionner et poser des limites sont les comportements qui comptent."}, {"id": "m4q07", "enonce": "Selon la typologie de Brun et Dugas, quelle forme de reconnaissance permet de reconnaître aussi ceux qui n''ont pas encore de résultats (débutants, tâches ingrates) ?", "options": ["La reconnaissance des résultats uniquement", "La reconnaissance de la pratique de travail et de l''investissement (la manière de faire, l''effort)", "La prime de fin d''année", "La comparaison avec les meilleurs"], "bonnes": [1], "explication": "Ne reconnaître que les résultats, c''est ne reconnaître que les meilleurs. La manière de faire et l''effort se reconnaissent chez tous, et la reconnaissance existentielle (bonjour, informer, consulter) est la base."}, {"id": "m4q08", "enonce": "Dans le modèle GROW pour un entretien de progression, que signifie le « O » ?", "options": ["Objectif : ce que la personne veut être capable de faire", "Obstacles : ce qui empêche la personne de progresser", "Options : les pistes possibles, celles de la personne d''abord, puis celles du manager", "Ordre : la consigne donnée par le manager"], "bonnes": [2], "explication": "G = Goal (objectif), R = Reality (réalité), O = Options, W = Will (engagement). Le manager questionne plus qu''il ne conseille."}, {"id": "m4q09", "enonce": "Un nouveau salarié arrive lundi. Quelle formation est obligatoire dès son arrivée selon le Code du travail (art. L4141-2) ?", "options": ["Une formation au management", "Une formation pratique et appropriée à la sécurité", "Une formation aux outils informatiques", "Aucune formation n''est obligatoire avant la fin de la période d''essai"], "bonnes": [1], "explication": "La formation à la sécurité est obligatoire pour tout nouvel embauché, y compris les intérimaires et les salariés changeant de poste, et elle est tracée."}, {"id": "m4q10", "enonce": "Sophie, seule à un poste administratif, demande un jour de télétravail. L''entreprise n''a ni accord collectif ni charte. Que dit le Code du travail (L1222-9) ?", "options": ["Le télétravail est impossible sans accord collectif", "Le télétravail peut être mis en place par simple accord entre le salarié et l''employeur, formalisé par tout moyen", "L''employeur peut l''imposer à tout moment", "Le télétravail est réservé aux cadres"], "bonnes": [1], "explication": "À défaut d''accord collectif ou de charte, un accord individuel suffit. Le télétravail est volontaire des deux côtés, sauf circonstances exceptionnelles."}, {"id": "m4q11", "enonce": "Quelle est la limite légale de la durée quotidienne de travail (hors dérogations) et du repos quotidien ?", "options": ["8 heures de travail, 8 heures de repos", "10 heures de travail, 11 heures de repos consécutives", "12 heures de travail, 10 heures de repos", "Aucune limite si le salarié est d''accord"], "bonnes": [1], "explication": "Art. L3121-18 et L3131-1. S''y ajoutent 48 h par semaine, 44 h en moyenne sur douze semaines, 35 h de repos hebdomadaire et 20 min de pause dès 6 h de travail."}, {"id": "m4q12", "enonce": "Thierry arrive plus tôt, ne prend plus de pause, fait des erreurs inhabituelles et a eu un accrochage. Quelle est la bonne conduite du manager ?", "options": ["Lui dire qu''il fait un burn-out et lui conseiller de s''arrêter", "Ne rien faire tant qu''il ne se plaint pas", "Le voir seul avec des faits, écouter sans creuser la vie privée, agir sur ce qui pèse dans le travail, rappeler l''accès au médecin du travail, alerter la hiérarchie si nécessaire, suivre", "Convoquer une réunion d''équipe pour en parler devant tous"], "bonnes": [2], "explication": "Le manager repère, écoute, agit sur le travail, oriente, alerte et suit ; il ne diagnostique pas. Tout salarié peut voir le médecin du travail à sa demande (L4624-1)."}], "seuil": 70, "tentatives_max": 3, "corrections": true, "consigne": "12 questions. Une seule bonne réponse par question, sauf mention « plusieurs réponses ». Seuil de réussite : 70 %."}'::jsonb, publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 5 and l.ordre = 11;
  n := n + 1;

  -- 4.2-securite-psychologique.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Dans certaines équipes, on ose dire « je ne sais pas », « je me suis trompé », « je ne suis pas d''accord », « j''ai une idée ». Dans d''autres, on se tait, on cache ses erreurs, on laisse le chef se tromper sans rien dire. La différence entre les deux a un nom : la sécurité psychologique. Et elle explique une grande partie des écarts de performance entre des équipes pourtant composées de personnes aussi compétentes.

## D''où vient le concept

Amy Edmondson, professeure à la Harvard Business School, étudiait à la fin des années 1990 les erreurs médicales dans des services hospitaliers. Elle s''attendait à ce que les meilleures équipes déclarent moins d''erreurs. Elle a trouvé l''inverse : les équipes les mieux notées par ailleurs déclaraient plus d''erreurs. Non parce qu''elles en faisaient plus, mais parce qu''elles osaient les signaler. Dans les équipes moins performantes, les erreurs existaient tout autant ; elles étaient cachées.

Edmondson a défini en 1999 la sécurité psychologique comme la conviction partagée, au sein d''une équipe, que l''on peut prendre un risque interpersonnel sans être puni ni humilié : poser une question, admettre une erreur, proposer une idée, exprimer un désaccord.

Ce n''est pas du confort. Une équipe psychologiquement sûre n''est pas une équipe où tout le monde est gentil et où l''on ne se dit rien de difficile. C''est au contraire une équipe où l''on peut se dire les choses difficiles, parce qu''on sait que ce ne sera pas retenu contre soi. Edmondson insiste : la sécurité psychologique doit se combiner avec un haut niveau d''exigence. Sécurité sans exigence, c''est la zone de confort ; exigence sans sécurité, c''est la zone d''anxiété, où l''on cache et où l''on se tait ; les deux ensemble, c''est la zone d''apprentissage et de performance.

## Ce que Google a confirmé

En 2012, Google a lancé une étude interne, le projet Aristotle, pour comprendre ce qui distinguait ses équipes les plus efficaces. Les chercheurs ont examiné 180 équipes et des dizaines de variables : la composition, l''ancienneté, la personnalité, l''expertise, le fait de déjeuner ensemble. Aucune ne permettait de prédire la performance. Ce qui la prédisait, publié en 2015, c''était la façon dont les membres se comportaient entre eux, et le premier facteur, de loin, était la sécurité psychologique. Venaient ensuite la fiabilité (chacun fait ce qu''il dit), la clarté des rôles et des objectifs, le sens du travail et son impact.

Autrement dit, ce n''est pas d''abord qui est dans l''équipe qui compte, c''est comment on s''y parle.

## Pourquoi cela concerne le manager de proximité

La sécurité psychologique se joue au niveau de l''équipe, pas de l''entreprise. Deux équipes de la même entreprise, avec les mêmes règles, peuvent en avoir des niveaux très différents. Et le facteur principal, c''est le comportement du manager. Ce qu''il fait quand quelqu''un se trompe, quand quelqu''un le contredit, quand quelqu''un pose une question « bête ». L''équipe observe, et apprend.

Michel, à l''atelier Garnier, a crié sur Julien devant tout le monde pour une coulure. Ce jour-là, tout l''atelier a appris qu''une erreur se paie en public. Conséquence prévisible : la prochaine erreur sera cachée, jusqu''à ce que le client la découvre. Le coût de l''humiliation n''est pas la vexation de Julien ; c''est toutes les erreurs que personne ne signalera plus.

## Les cinq comportements du manager

Edmondson et les travaux qui ont suivi dégagent cinq comportements qui construisent la sécurité psychologique. Aucun ne demande de budget.

## 1. Présenter le travail comme un apprentissage

Un manager qui dit « on n''a jamais fait ça, on va forcément se tromper, l''important est de le voir vite » installe autre chose qu''un manager qui dit « je ne veux pas d''erreur ». Le premier rend l''erreur normale et signalable ; le second la rend honteuse et cachée. Cela ne veut pas dire tolérer la négligence : on distingue l''erreur d''apprentissage, l''erreur d''inattention, et la faute délibérée (leçon 5.6). Seule la première est sans conséquence ; les deux autres se traitent, mais sans humiliation.

## 2. Reconnaître sa propre faillibilité

« Je me suis trompé sur le planning de mardi, je vous ai mis en difficulté, je le refais. » Un manager qui admet ses erreurs autorise les autres à admettre les leurs. Un manager qui ne se trompe jamais oblige les autres à ne jamais se tromper, donc à cacher. Cela ne diminue pas l''autorité ; cela la rend crédible.

## 3. Poser des questions, beaucoup

« Qu''est-ce que je ne vois pas ? », « Qu''est-ce qui vous inquiète dans cette organisation ? », « Qui a un avis différent ? ». Le manager qui pose des questions signale qu''il ne sait pas tout et qu''il veut entendre. Le manager qui n''affirme que des certitudes signale qu''il n''y a rien à ajouter. Les questions ouvertes du module 3 sont l''outil.

## 4. Réagir de façon productive quand quelqu''un prend un risque

C''est le moment décisif. Quelqu''un signale une erreur, propose une idée, exprime un désaccord. La réaction du manager dans les dix secondes qui suivent fixe la règle pour tous. Remercier (« merci de l''avoir dit »), écouter jusqu''au bout, traiter le fond, et ne jamais rendre la personne ridicule. Même quand l''idée est mauvaise, même quand le désaccord est infondé : on peut dire « je ne suis pas d''accord, et voilà pourquoi » sans dire « c''est n''importe quoi ».

## 5. Poser des limites claires et les tenir

La sécurité psychologique n''est pas l''absence de règles. Elle suppose au contraire que l''on sache ce qui est acceptable et ce qui ne l''est pas, et que le manager protège l''équipe des comportements qui la détruisent : l''humiliation, le mépris, le fait de couper la parole, les moqueries. Un manager qui laisse un membre de l''équipe se moquer d''un autre a détruit en une minute ce qu''il construisait depuis des mois.

## Les signes d''une équipe qui ne se sent pas en sécurité

- Personne ne pose de question en réunion ; les questions viennent après, en aparté.
- Les erreurs sont découvertes par le client ou par le chef, jamais signalées par celui qui les a faites.
- Les idées viennent toujours des deux mêmes personnes.
- Les désaccords ne s''expriment pas, mais les décisions ne s''appliquent pas.
- Les nouveaux se taisent au bout de deux semaines.

Si vous reconnaissez votre équipe, la cause est presque toujours un comportement passé, du manager actuel ou du précédent, que l''équipe n''a pas oublié. Il faudra du temps et de la constance pour que les gens y croient à nouveau.

## Le cas Garnier

Karim veut que les reprises se voient avant la restitution. Il sait que l''équipe a appris avec Michel à cacher. Il commence par lui-même : au brief du matin, il annonce qu''il s''est trompé la veille sur une commande de pièces, et ce qu''il fait pour rattraper. Il installe une règle : « Une erreur signalée avant la sortie du véhicule ne se discute pas, on la corrige. Une erreur découverte par le client, on en parle. » Il demande chaque semaine en réunion : « Qu''est-ce qui a failli mal tourner cette semaine ? » Les premières fois, silence. La troisième semaine, Lucas dit qu''il a failli monter un pare-chocs avec les mauvaises fixations et que Fatou l''a vu. Karim remercie Lucas, remercie Fatou, et demande comment éviter que ça se reproduise. À partir de là, les signalements arrivent.

Il reste Michel. Karim ne peut pas changer Michel, mais il peut lui demander (leçon 3.10) que les remarques passent par lui, et il peut, quand Michel s''emporte, aller voir la personne ensuite. Ce n''est pas parfait ; c''est ce qui est à sa portée.

## À retenir

- La sécurité psychologique, c''est pouvoir dire « je ne sais pas », « je me suis trompé », « je ne suis pas d''accord » sans être puni ni humilié (Edmondson, 1999).
- Les équipes qui l''ont signalent plus d''erreurs parce qu''elles les cachent moins ; c''est le premier facteur de performance identifié par Google (projet Aristotle).
- Elle se combine avec l''exigence : sécurité et exigence ensemble donnent l''apprentissage.
- Cinq comportements du manager : présenter le travail comme un apprentissage, admettre ses erreurs, poser des questions, réagir de façon productive aux prises de risque, poser des limites et les tenir.
- Elle se construit lentement et se détruit en une minute.

## Sources

- Amy C. Edmondson, « Psychological Safety and Learning Behavior in Work Teams », *Administrative Science Quarterly*, 1999.
- Amy C. Edmondson, *The Fearless Organization*, Wiley, 2018 (trad. fr. *L''entreprise sans peur*, Pearson, 2021).
- Google re:Work, « Guide: Understand team effectiveness » (projet Aristotle), 2015.
- Charles Duhigg, « What Google Learned From Its Quest to Build the Perfect Team », *The New York Times Magazine*, 2016.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Dans certaines équipes, on ose dire « je ne sais pas », « je me suis trompé », « je ne suis pas d''accord », « j''ai une idée ». Dans d''autres, on se tait, on cache ses erreurs, on laisse le chef se tromper sans rien dire. La différence entre les deux a un nom : la sécurité psychologique. Et elle explique une grande partie des écarts de performance entre des équipes pourtant composées de personnes aussi compétentes.

## D''où vient le concept

Amy Edmondson, professeure à la Harvard Business School, étudiait à la fin des années 1990 les erreurs médicales dans des services hospitaliers. Elle s''attendait à ce que les meilleures équipes déclarent moins d''erreurs. Elle a trouvé l''inverse : les équipes les mieux notées par ailleurs déclaraient plus d''erreurs. Non parce qu''elles en faisaient plus, mais parce qu''elles osaient les signaler. Dans les équipes moins performantes, les erreurs existaient tout autant ; elles étaient cachées.

Edmondson a défini en 1999 la sécurité psychologique comme la conviction partagée, au sein d''une équipe, que l''on peut prendre un risque interpersonnel sans être puni ni humilié : poser une question, admettre une erreur, proposer une idée, exprimer un désaccord.

Ce n''est pas du confort. Une équipe psychologiquement sûre n''est pas une équipe où tout le monde est gentil et où l''on ne se dit rien de difficile. C''est au contraire une équipe où l''on peut se dire les choses difficiles, parce qu''on sait que ce ne sera pas retenu contre soi. Edmondson insiste : la sécurité psychologique doit se combiner avec un haut niveau d''exigence. Sécurité sans exigence, c''est la zone de confort ; exigence sans sécurité, c''est la zone d''anxiété, où l''on cache et où l''on se tait ; les deux ensemble, c''est la zone d''apprentissage et de performance.

## Ce que Google a confirmé

En 2012, Google a lancé une étude interne, le projet Aristotle, pour comprendre ce qui distinguait ses équipes les plus efficaces. Les chercheurs ont examiné 180 équipes et des dizaines de variables : la composition, l''ancienneté, la personnalité, l''expertise, le fait de déjeuner ensemble. Aucune ne permettait de prédire la performance. Ce qui la prédisait, publié en 2015, c''était la façon dont les membres se comportaient entre eux, et le premier facteur, de loin, était la sécurité psychologique. Venaient ensuite la fiabilité (chacun fait ce qu''il dit), la clarté des rôles et des objectifs, le sens du travail et son impact.

Autrement dit, ce n''est pas d''abord qui est dans l''équipe qui compte, c''est comment on s''y parle.

## Pourquoi cela concerne le manager de proximité

La sécurité psychologique se joue au niveau de l''équipe, pas de l''entreprise. Deux équipes de la même entreprise, avec les mêmes règles, peuvent en avoir des niveaux très différents. Et le facteur principal, c''est le comportement du manager. Ce qu''il fait quand quelqu''un se trompe, quand quelqu''un le contredit, quand quelqu''un pose une question « bête ». L''équipe observe, et apprend.

Michel, à l''atelier Garnier, a crié sur Julien devant tout le monde pour une coulure. Ce jour-là, tout l''atelier a appris qu''une erreur se paie en public. Conséquence prévisible : la prochaine erreur sera cachée, jusqu''à ce que le client la découvre. Le coût de l''humiliation n''est pas la vexation de Julien ; c''est toutes les erreurs que personne ne signalera plus.

## Les cinq comportements du manager

Edmondson et les travaux qui ont suivi dégagent cinq comportements qui construisent la sécurité psychologique. Aucun ne demande de budget.

## 1. Présenter le travail comme un apprentissage

Un manager qui dit « on n''a jamais fait ça, on va forcément se tromper, l''important est de le voir vite » installe autre chose qu''un manager qui dit « je ne veux pas d''erreur ». Le premier rend l''erreur normale et signalable ; le second la rend honteuse et cachée. Cela ne veut pas dire tolérer la négligence : on distingue l''erreur d''apprentissage, l''erreur d''inattention, et la faute délibérée (leçon 5.6). Seule la première est sans conséquence ; les deux autres se traitent, mais sans humiliation.

## 2. Reconnaître sa propre faillibilité

« Je me suis trompé sur le planning de mardi, je vous ai mis en difficulté, je le refais. » Un manager qui admet ses erreurs autorise les autres à admettre les leurs. Un manager qui ne se trompe jamais oblige les autres à ne jamais se tromper, donc à cacher. Cela ne diminue pas l''autorité ; cela la rend crédible.

## 3. Poser des questions, beaucoup

« Qu''est-ce que je ne vois pas ? », « Qu''est-ce qui vous inquiète dans cette organisation ? », « Qui a un avis différent ? ». Le manager qui pose des questions signale qu''il ne sait pas tout et qu''il veut entendre. Le manager qui n''affirme que des certitudes signale qu''il n''y a rien à ajouter. Les questions ouvertes du module 3 sont l''outil.

## 4. Réagir de façon productive quand quelqu''un prend un risque

C''est le moment décisif. Quelqu''un signale une erreur, propose une idée, exprime un désaccord. La réaction du manager dans les dix secondes qui suivent fixe la règle pour tous. Remercier (« merci de l''avoir dit »), écouter jusqu''au bout, traiter le fond, et ne jamais rendre la personne ridicule. Même quand l''idée est mauvaise, même quand le désaccord est infondé : on peut dire « je ne suis pas d''accord, et voilà pourquoi » sans dire « c''est n''importe quoi ».

## 5. Poser des limites claires et les tenir

La sécurité psychologique n''est pas l''absence de règles. Elle suppose au contraire que l''on sache ce qui est acceptable et ce qui ne l''est pas, et que le manager protège l''équipe des comportements qui la détruisent : l''humiliation, le mépris, le fait de couper la parole, les moqueries. Un manager qui laisse un membre de l''équipe se moquer d''un autre a détruit en une minute ce qu''il construisait depuis des mois.

## Les signes d''une équipe qui ne se sent pas en sécurité

- Personne ne pose de question en réunion ; les questions viennent après, en aparté.
- Les erreurs sont découvertes par le client ou par le chef, jamais signalées par celui qui les a faites.
- Les idées viennent toujours des deux mêmes personnes.
- Les désaccords ne s''expriment pas, mais les décisions ne s''appliquent pas.
- Les nouveaux se taisent au bout de deux semaines.

Si vous reconnaissez votre équipe, la cause est presque toujours un comportement passé, du manager actuel ou du précédent, que l''équipe n''a pas oublié. Il faudra du temps et de la constance pour que les gens y croient à nouveau.

## Le cas Garnier

Karim veut que les reprises se voient avant la restitution. Il sait que l''équipe a appris avec Michel à cacher. Il commence par lui-même : au brief du matin, il annonce qu''il s''est trompé la veille sur une commande de pièces, et ce qu''il fait pour rattraper. Il installe une règle : « Une erreur signalée avant la sortie du véhicule ne se discute pas, on la corrige. Une erreur découverte par le client, on en parle. » Il demande chaque semaine en réunion : « Qu''est-ce qui a failli mal tourner cette semaine ? » Les premières fois, silence. La troisième semaine, Lucas dit qu''il a failli monter un pare-chocs avec les mauvaises fixations et que Fatou l''a vu. Karim remercie Lucas, remercie Fatou, et demande comment éviter que ça se reproduise. À partir de là, les signalements arrivent.

Il reste Michel. Karim ne peut pas changer Michel, mais il peut lui demander (leçon 3.10) que les remarques passent par lui, et il peut, quand Michel s''emporte, aller voir la personne ensuite. Ce n''est pas parfait ; c''est ce qui est à sa portée.

## À retenir

- La sécurité psychologique, c''est pouvoir dire « je ne sais pas », « je me suis trompé », « je ne suis pas d''accord » sans être puni ni humilié (Edmondson, 1999).
- Les équipes qui l''ont signalent plus d''erreurs parce qu''elles les cachent moins ; c''est le premier facteur de performance identifié par Google (projet Aristotle).
- Elle se combine avec l''exigence : sécurité et exigence ensemble donnent l''apprentissage.
- Cinq comportements du manager : présenter le travail comme un apprentissage, admettre ses erreurs, poser des questions, réagir de façon productive aux prises de risque, poser des limites et les tenir.
- Elle se construit lentement et se détruit en une minute.

## Sources

- Amy C. Edmondson, « Psychological Safety and Learning Behavior in Work Teams », *Administrative Science Quarterly*, 1999.
- Amy C. Edmondson, *The Fearless Organization*, Wiley, 2018 (trad. fr. *L''entreprise sans peur*, Pearson, 2021).
- Google re:Work, « Guide: Understand team effectiveness » (projet Aristotle), 2015.
- Charles Duhigg, « What Google Learned From Its Quest to Build the Perfect Team », *The New York Times Magazine*, 2016.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 5 and l.ordre = 2;
  n := n + 1;

  -- 4.3-reconnaitre-sans-flatter.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'La reconnaissance est le levier de motivation le plus cité par les salariés et le plus négligé par les managers. Non par méchanceté : par pudeur, par habitude (« c''est normal de bien faire son travail »), par manque de temps, ou par peur de paraître flatteur. Or reconnaître n''est pas flatter. La flatterie est vague, intéressée et fausse ; la reconnaissance est précise, gratuite et vraie.

## Pourquoi c''est un besoin, pas un luxe

Les trois modèles de la leçon 4.1 convergent : la reconnaissance est un facteur de motivation chez Herzberg, elle nourrit le besoin de compétence et de lien chez Deci et Ryan, et elle rend le progrès visible chez Amabile. Les enquêtes sur les conditions de travail, en France comme ailleurs, placent régulièrement le manque de reconnaissance parmi les premières causes de mal-être et de départ. Et le rapport Gollac sur les risques psychosociaux (2011) classe le déficit de reconnaissance parmi les facteurs de risque, dans la catégorie des rapports sociaux au travail.

À l''inverse, une reconnaissance régulière et juste fait baisser l''absentéisme, le turnover et les tensions. Elle ne coûte rien. Elle demande de l''attention.

## Les quatre formes de la reconnaissance

Jean-Pierre Brun et Ninon Dugas, chercheurs québécois, ont proposé en 2005 une typologie devenue une référence. La reconnaissance peut porter sur quatre objets, et un manager complet les pratique tous les quatre.

| Forme | Ce qu''on reconnaît | Exemple à l''atelier |
|---|---|---|
| Existentielle | La personne elle-même : elle existe, on la salue, on la consulte, on l''informe | Dire bonjour à chacun, demander l''avis de Marc sur le planning, prévenir Fatou d''un changement avant les autres |
| De la pratique de travail | La manière de faire : le soin, la méthode, la rigueur, même quand le résultat n''est pas encore là | « Ta façon de préparer les surfaces, c''est propre, ça se voit au vernis » |
| De l''investissement | L''effort et l''engagement, indépendamment du résultat | « Tu es resté vendredi soir pour finir la Clio, je l''ai vu » |
| Des résultats | Ce qui a été obtenu, mesurable | « Trois finitions sans reprise ce mois-ci » |

La reconnaissance existentielle est la plus élémentaire et la plus souvent oubliée. Un manager qui ne dit bonjour qu''à ceux qu''il apprécie, qui informe l''équipe par affichage sans jamais expliquer, qui ne demande jamais l''avis de personne, envoie un message d''indifférence, quels que soient ses compliments sur les résultats.

La reconnaissance de l''investissement et de la pratique est ce qui permet de reconnaître aussi ceux qui n''ont pas encore de résultats : le débutant, celui qui apprend, celui qui est sur une tâche ingrate. Ne reconnaître que les résultats, c''est ne reconnaître que les meilleurs, et laisser les autres invisibles.

## Les règles d''une reconnaissance qui porte

- Précise. « Bon boulot » ne dit rien. « Le raccord de teinte sur l''aile, on ne le voit pas sous le néon » dit exactement ce qui est bien et ce qu''il faut refaire. C''est la même règle que pour le feedback positif du module 3.
- Sincère. On ne reconnaît que ce qui est vrai. Une reconnaissance fabriquée pour « faire de la reconnaissance » se voit, et discrédite les suivantes.
- À temps. Le jour même, ou le lendemain. Un compliment sur un travail d''il y a trois semaines dit surtout que vous n''aviez pas regardé à l''époque.
- Régulière, pas rare. Une cérémonie par an ne remplace pas une remarque par semaine. Amabile a montré que ce sont les petits progrès quotidiens qui comptent ; ils demandent une reconnaissance quotidienne.
- Adaptée à la personne. Certains aiment être félicités devant l''équipe ; d''autres le vivent comme une gêne. Demandez, ou observez. Une reconnaissance publique imposée à quelqu''un qui la redoute est une punition.
- Équitable. Si les mêmes sont toujours félicités, les autres concluent qu''il y a des chouchous. Tenez un compte, mentalement ou dans votre carnet : à qui n''avez-vous rien dit de positif depuis quinze jours ?
- Sans « mais ». « C''est bien, mais… » annule ce qui précède. Le correctif se dit à un autre moment.

## Les formes qui ne coûtent rien

La parole directe est la première. Mais il y en a d''autres : un mot écrit (une note manuscrite marque plus qu''on ne le croit) ; mentionner le travail de quelqu''un devant sa hiérarchie ou devant un client ; confier une responsabilité ou une tâche valorisante (former un nouveau, représenter l''équipe) ; demander son avis à quelqu''un sur un sujet qu''il maîtrise ; commencer la réunion hebdomadaire par ce qui a bien marché, en nommant qui.

Les formes matérielles (prime, cadeau, repas d''équipe) ont leur place, mais elles relèvent souvent de l''employeur, et elles ne remplacent jamais la parole. Une prime sans un mot est un virement ; un mot sans prime est une reconnaissance.

## Les erreurs courantes

- Ne reconnaître que l''exceptionnel. Le travail bien fait au quotidien mérite d''être vu. Si seule la prouesse est reconnue, le travail normal devient invisible.
- Reconnaître collectivement pour éviter de choisir. « Bravo à tous » est utile, mais ne remplace pas le mot individuel. Chacun sait s''il a contribué ou non.
- Le compliment instrumental : « Tu es formidable, tu peux rester ce soir ? » La reconnaissance qui précède une demande est perçue comme une manipulation, et elle en est une.
- Comparer : « Toi au moins tu fais les choses proprement, pas comme Julien. » Reconnaître l''un en rabaissant l''autre détruit l''équipe.
- Se reconnaître soi-même : « Grâce à mon organisation, on a tenu les délais. » Le manager reconnaît l''équipe ; c''est sa hiérarchie qui le reconnaît lui.

## Recevoir la reconnaissance

Le manager reconnaît ; il est aussi reconnu, ou pas. Beaucoup de managers de proximité souffrent d''un déficit de reconnaissance de leur propre hiérarchie, et le reproduisent vers le bas. Si c''est votre cas, la solution n''est pas d''attendre : dites à votre hiérarchie ce dont vous avez besoin (« j''aimerais savoir ce que vous pensez du trimestre ») et, surtout, ne faites pas payer à l''équipe ce que vous ne recevez pas.

## Le cas Garnier

Karim tient, dans son carnet, une colonne « dernier mot positif » par personne. Il constate qu''il n''a rien dit à Fatou depuis un mois : son travail de préparation est invisible parce qu''il précède celui des autres. Le lendemain, devant Nadia : « Fatou, la 308 d''hier, la préparation était impeccable, Nadia a pu peindre direct. C''est ça qui fait qu''on tient les délais. » Il ajoute Fatou au tour de table de la réunion, où elle n''avait jamais été sollicitée. Et il obtient de Michel que la prime de fin d''année, qui existait, soit accompagnée d''un mot à chacun, plutôt que d''un virement muet.

## À retenir

- Reconnaître n''est pas flatter : la reconnaissance est précise, sincère, à temps, régulière, adaptée, équitable, sans « mais ».
- Quatre formes (Brun et Dugas) : la personne, la manière de faire, l''effort, les résultats. Ne reconnaître que les résultats, c''est ne reconnaître que les meilleurs.
- La reconnaissance existentielle (bonjour, informer, consulter) est la base.
- Tenez le compte : à qui n''avez-vous rien dit de positif depuis quinze jours ?
- Ne comparez pas, ne conditionnez pas, ne vous attribuez pas le mérite de l''équipe.

## Sources

- Jean-Pierre Brun, Ninon Dugas, « La reconnaissance au travail : une pratique riche de sens », Chaire en gestion de la santé et de la sécurité du travail, Université Laval, 2005.
- Michel Gollac, Marceline Bodier (dir.), *Mesurer les facteurs psychosociaux de risque au travail pour les maîtriser*, rapport du Collège d''expertise, 2011.
- ANACT, « La reconnaissance au travail », anact.fr.
- Teresa Amabile, Steven Kramer, *The Progress Principle*, 2011.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'La reconnaissance est le levier de motivation le plus cité par les salariés et le plus négligé par les managers. Non par méchanceté : par pudeur, par habitude (« c''est normal de bien faire son travail »), par manque de temps, ou par peur de paraître flatteur. Or reconnaître n''est pas flatter. La flatterie est vague, intéressée et fausse ; la reconnaissance est précise, gratuite et vraie.

## Pourquoi c''est un besoin, pas un luxe

Les trois modèles de la leçon 4.1 convergent : la reconnaissance est un facteur de motivation chez Herzberg, elle nourrit le besoin de compétence et de lien chez Deci et Ryan, et elle rend le progrès visible chez Amabile. Les enquêtes sur les conditions de travail, en France comme ailleurs, placent régulièrement le manque de reconnaissance parmi les premières causes de mal-être et de départ. Et le rapport Gollac sur les risques psychosociaux (2011) classe le déficit de reconnaissance parmi les facteurs de risque, dans la catégorie des rapports sociaux au travail.

À l''inverse, une reconnaissance régulière et juste fait baisser l''absentéisme, le turnover et les tensions. Elle ne coûte rien. Elle demande de l''attention.

## Les quatre formes de la reconnaissance

Jean-Pierre Brun et Ninon Dugas, chercheurs québécois, ont proposé en 2005 une typologie devenue une référence. La reconnaissance peut porter sur quatre objets, et un manager complet les pratique tous les quatre.

| Forme | Ce qu''on reconnaît | Exemple à l''atelier |
|---|---|---|
| Existentielle | La personne elle-même : elle existe, on la salue, on la consulte, on l''informe | Dire bonjour à chacun, demander l''avis de Marc sur le planning, prévenir Fatou d''un changement avant les autres |
| De la pratique de travail | La manière de faire : le soin, la méthode, la rigueur, même quand le résultat n''est pas encore là | « Ta façon de préparer les surfaces, c''est propre, ça se voit au vernis » |
| De l''investissement | L''effort et l''engagement, indépendamment du résultat | « Tu es resté vendredi soir pour finir la Clio, je l''ai vu » |
| Des résultats | Ce qui a été obtenu, mesurable | « Trois finitions sans reprise ce mois-ci » |

La reconnaissance existentielle est la plus élémentaire et la plus souvent oubliée. Un manager qui ne dit bonjour qu''à ceux qu''il apprécie, qui informe l''équipe par affichage sans jamais expliquer, qui ne demande jamais l''avis de personne, envoie un message d''indifférence, quels que soient ses compliments sur les résultats.

La reconnaissance de l''investissement et de la pratique est ce qui permet de reconnaître aussi ceux qui n''ont pas encore de résultats : le débutant, celui qui apprend, celui qui est sur une tâche ingrate. Ne reconnaître que les résultats, c''est ne reconnaître que les meilleurs, et laisser les autres invisibles.

## Les règles d''une reconnaissance qui porte

- Précise. « Bon boulot » ne dit rien. « Le raccord de teinte sur l''aile, on ne le voit pas sous le néon » dit exactement ce qui est bien et ce qu''il faut refaire. C''est la même règle que pour le feedback positif du module 3.
- Sincère. On ne reconnaît que ce qui est vrai. Une reconnaissance fabriquée pour « faire de la reconnaissance » se voit, et discrédite les suivantes.
- À temps. Le jour même, ou le lendemain. Un compliment sur un travail d''il y a trois semaines dit surtout que vous n''aviez pas regardé à l''époque.
- Régulière, pas rare. Une cérémonie par an ne remplace pas une remarque par semaine. Amabile a montré que ce sont les petits progrès quotidiens qui comptent ; ils demandent une reconnaissance quotidienne.
- Adaptée à la personne. Certains aiment être félicités devant l''équipe ; d''autres le vivent comme une gêne. Demandez, ou observez. Une reconnaissance publique imposée à quelqu''un qui la redoute est une punition.
- Équitable. Si les mêmes sont toujours félicités, les autres concluent qu''il y a des chouchous. Tenez un compte, mentalement ou dans votre carnet : à qui n''avez-vous rien dit de positif depuis quinze jours ?
- Sans « mais ». « C''est bien, mais… » annule ce qui précède. Le correctif se dit à un autre moment.

## Les formes qui ne coûtent rien

La parole directe est la première. Mais il y en a d''autres : un mot écrit (une note manuscrite marque plus qu''on ne le croit) ; mentionner le travail de quelqu''un devant sa hiérarchie ou devant un client ; confier une responsabilité ou une tâche valorisante (former un nouveau, représenter l''équipe) ; demander son avis à quelqu''un sur un sujet qu''il maîtrise ; commencer la réunion hebdomadaire par ce qui a bien marché, en nommant qui.

Les formes matérielles (prime, cadeau, repas d''équipe) ont leur place, mais elles relèvent souvent de l''employeur, et elles ne remplacent jamais la parole. Une prime sans un mot est un virement ; un mot sans prime est une reconnaissance.

## Les erreurs courantes

- Ne reconnaître que l''exceptionnel. Le travail bien fait au quotidien mérite d''être vu. Si seule la prouesse est reconnue, le travail normal devient invisible.
- Reconnaître collectivement pour éviter de choisir. « Bravo à tous » est utile, mais ne remplace pas le mot individuel. Chacun sait s''il a contribué ou non.
- Le compliment instrumental : « Tu es formidable, tu peux rester ce soir ? » La reconnaissance qui précède une demande est perçue comme une manipulation, et elle en est une.
- Comparer : « Toi au moins tu fais les choses proprement, pas comme Julien. » Reconnaître l''un en rabaissant l''autre détruit l''équipe.
- Se reconnaître soi-même : « Grâce à mon organisation, on a tenu les délais. » Le manager reconnaît l''équipe ; c''est sa hiérarchie qui le reconnaît lui.

## Recevoir la reconnaissance

Le manager reconnaît ; il est aussi reconnu, ou pas. Beaucoup de managers de proximité souffrent d''un déficit de reconnaissance de leur propre hiérarchie, et le reproduisent vers le bas. Si c''est votre cas, la solution n''est pas d''attendre : dites à votre hiérarchie ce dont vous avez besoin (« j''aimerais savoir ce que vous pensez du trimestre ») et, surtout, ne faites pas payer à l''équipe ce que vous ne recevez pas.

## Le cas Garnier

Karim tient, dans son carnet, une colonne « dernier mot positif » par personne. Il constate qu''il n''a rien dit à Fatou depuis un mois : son travail de préparation est invisible parce qu''il précède celui des autres. Le lendemain, devant Nadia : « Fatou, la 308 d''hier, la préparation était impeccable, Nadia a pu peindre direct. C''est ça qui fait qu''on tient les délais. » Il ajoute Fatou au tour de table de la réunion, où elle n''avait jamais été sollicitée. Et il obtient de Michel que la prime de fin d''année, qui existait, soit accompagnée d''un mot à chacun, plutôt que d''un virement muet.

## À retenir

- Reconnaître n''est pas flatter : la reconnaissance est précise, sincère, à temps, régulière, adaptée, équitable, sans « mais ».
- Quatre formes (Brun et Dugas) : la personne, la manière de faire, l''effort, les résultats. Ne reconnaître que les résultats, c''est ne reconnaître que les meilleurs.
- La reconnaissance existentielle (bonjour, informer, consulter) est la base.
- Tenez le compte : à qui n''avez-vous rien dit de positif depuis quinze jours ?
- Ne comparez pas, ne conditionnez pas, ne vous attribuez pas le mérite de l''équipe.

## Sources

- Jean-Pierre Brun, Ninon Dugas, « La reconnaissance au travail : une pratique riche de sens », Chaire en gestion de la santé et de la sécurité du travail, Université Laval, 2005.
- Michel Gollac, Marceline Bodier (dir.), *Mesurer les facteurs psychosociaux de risque au travail pour les maîtriser*, rapport du Collège d''expertise, 2011.
- ANACT, « La reconnaissance au travail », anact.fr.
- Teresa Amabile, Steven Kramer, *The Progress Principle*, 2011.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 5 and l.ordre = 3;
  n := n + 1;

  -- 4.4-developper-les-competences.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Un manager qui fait progresser son équipe gagne sur tous les tableaux : l''équipe devient plus robuste (les compétences critiques ne reposent plus sur une seule personne, module 2), les personnes sont plus motivées (le besoin de compétence, leçon 4.1), et le manager lui-même gagne du temps à mesure que l''autonomie augmente. C''est aussi une obligation de l''employeur, que le manager de proximité met en œuvre : l''article L6321-1 du Code du travail impose d''assurer l''adaptation des salariés à leur poste et de veiller au maintien de leur capacité à occuper un emploi.

## Repérer ce qu''il faut développer

Le point de départ est la matrice de compétences du module 2. Elle montre trois choses : les compétences que l''équipe ne détient pas assez (risque collectif), les personnes qui plafonnent (risque individuel), et les personnes qui peuvent aller plus loin (potentiel).

Puis on croise avec ce que veut la personne. Un plan de développement imposé ne fonctionne pas ; un plan construit avec la personne, à partir de ses souhaits exprimés en entretien de parcours professionnel (module 3), fonctionne. Les questions utiles : « Sur quoi aimerais-tu être meilleur ? », « Qu''est-ce que tu aimerais faire dans deux ans que tu ne sais pas faire aujourd''hui ? », « Qu''est-ce qui te freine ? »

Attention à deux biais. Le premier : ne développer que les meilleurs, parce qu''ils sont gratifiants. Le second : ne développer que les plus faibles, pour combler les manques, et laisser les bons s''ennuyer jusqu''à ce qu''ils partent. Chacun a besoin de progresser, à son niveau.

## Les moyens, du moins cher au plus cher

La formation « en salle » ou en ligne est le moyen auquel on pense d''abord. C''est rarement le plus efficace, et c''est le plus cher. La recherche sur l''apprentissage des adultes montre que l''on apprend surtout en faisant, avec un retour ; les formations formelles servent à structurer ce que l''expérience a commencé. Voici les moyens, du plus courant au plus formel.

La mise en situation progressive : confier une tâche un peu au-dessus du niveau actuel, avec un droit à l''erreur et un point de contrôle. C''est le principe du leadership situationnel (module 1) : on passe de « diriger » à « entraîner » à « épauler ». Lucas apprend à monter un pare-chocs seul, puis avec contrôle, puis sans.

Le binôme ou tutorat : associer une personne qui apprend à une personne qui sait, sur des séances prévues, pas « quand on aura le temps ». Le tuteur doit être volontaire, savoir expliquer (ce n''est pas la même compétence que savoir faire), et être reconnu pour ce rôle. Nadia forme Julien à la nacrée une heure par semaine : c''est du développement pour les deux.

Le retour d''expérience : après une difficulté ou une réussite, prendre dix minutes pour comprendre ce qui s''est passé (module 6). C''est de la formation gratuite.

La formation interne : un membre de l''équipe, ou le manager, présente une méthode, un outil, une règle, en trente minutes, à toute l''équipe. À l''atelier, Thierry présente le contrôle de finition ; Sophie présente le circuit des demandes.

La formation externe : organisme de formation, fournisseur (les constructeurs et les fabricants de peinture forment les carrossiers), centre de formation d''apprentis. Elle se prépare (qu''est-ce qu''on attend, comment on l''appliquera au retour) et se suit (qu''est-ce qui a changé un mois après). Une formation externe sans préparation ni suivi est un budget perdu.

## Les dispositifs à connaître

Le manager ne gère pas les budgets de formation, mais il doit connaître les dispositifs pour orienter et pour parler juste en entretien de parcours.

Le plan de développement des compétences (art. L6312-1 et suivants) : l''ensemble des formations décidées par l''employeur pour ses salariés. Il est construit chaque année, souvent avec les demandes remontées par les managers. C''est là que va la demande de Karim pour former Julien à la peinture. Dans les entreprises de moins de 50 salariés, l''OPCO (opérateur de compétences) de la branche peut financer tout ou partie des formations ; le manager doit savoir quel est l''OPCO de son entreprise.

Le compte personnel de formation (CPF) : compte en euros, alimenté chaque année pour tout salarié, mobilisable par lui pour une formation certifiante de son choix, en dehors ou pendant le temps de travail (avec accord de l''employeur dans ce cas). Une participation financière du salarié s''applique depuis 2024, sauf exceptions. L''employeur peut abonder.

La validation des acquis de l''expérience (VAE) : obtenir un diplôme ou un titre à partir de son expérience. Thierry, avec 28 ans de carrosserie, peut viser un titre sans retourner à l''école.

Le conseil en évolution professionnelle (CEP) : accompagnement gratuit et extérieur à l''entreprise pour construire un projet professionnel.

L''apprentissage et la professionnalisation : pour recruter et former en alternance. Lucas est apprenti ; le manager est souvent son maître d''apprentissage, avec des obligations de suivi et de lien avec le CFA.

## Le plan de développement individuel

Un plan de développement individuel (PDI) tient sur une page (gabarit dans la fiche 4.9). Il contient : la compétence visée, formulée en « être capable de » ; le niveau actuel et le niveau visé (l''échelle 0-3 de la matrice) ; les moyens (mise en situation, binôme, formation) avec leurs dates ; les points de suivi ; ce que la personne fait, ce que le manager fait. Un seul objectif de développement à la fois, deux au maximum. Un PDI à six objectifs n''aboutit jamais.

Le PDI se construit en entretien, se relit à chaque entretien de suivi, et se met à jour. Ce n''est pas un document RH ; c''est un outil de travail entre le manager et la personne.

## Conduire un entretien de progression : le modèle GROW

Pour les entretiens consacrés au développement, le modèle GROW, formalisé par John Whitmore dans les années 1990, donne une trame simple en quatre temps. Il repose sur le questionnement, pas sur le conseil : la personne trouve elle-même son chemin, ce qui rend l''engagement bien plus solide.

- G, Goal (objectif) : « Qu''est-ce que tu veux être capable de faire ? D''ici quand ? Comment saurons-nous que c''est acquis ? »
- R, Reality (réalité) : « Où en es-tu aujourd''hui ? Qu''est-ce que tu as déjà essayé ? Qu''est-ce qui te manque ? »
- O, Options : « Qu''est-ce que tu pourrais faire ? Quoi d''autre ? Et si tu avais plus de temps, de moyens ? » Le manager peut ajouter des options, après celles de la personne.
- W, Will (volonté, engagement) : « Qu''est-ce que tu vas faire, concrètement, d''ici notre prochain point ? Qu''est-ce qui pourrait t''en empêcher ? De quoi as-tu besoin de ma part ? »

Un entretien GROW dure vingt à trente minutes. Le manager parle un quart du temps.

## Le cas Garnier — le plan de Julien

Objectif (G) : Julien veut être autonome sur la peinture de raccord d''ici six mois, niveau 2 de la matrice. Réalité (R) : niveau 1 aujourd''hui, il a fait deux reprises de finition, il va trop vite sous pression ; il a déjà regardé Nadia travailler mais sans pratiquer. Options (O) : binôme avec Nadia une heure par semaine sur véhicule réel ; formation d''une journée chez le fournisseur de peinture (demande au plan de développement des compétences, financement OPCO à vérifier) ; contrôle de chaque finition par Thierry jusqu''à Noël ; retour d''expérience après chaque reprise. Engagement (W) : Julien prépare chaque séance avec Nadia en notant une question ; Karim planifie les séances le mardi à 14 h et fait la demande de formation avant fin de mois ; point tous les six semaines. Le PDI tient sur une page, signé par les deux.

Six mois plus tard, ce plan est la matière de l''entretien de parcours professionnel de Julien : sa progression est documentée, son souhait d''évolution est clair.

## À retenir

- Développer les compétences est une obligation de l''employeur (L6321-1) et le meilleur levier de motivation et de robustesse.
- Partir de la matrice de compétences et des souhaits de la personne ; développer chacun, pas seulement les meilleurs ni seulement les plus faibles.
- On apprend surtout en faisant, avec retour : mise en situation, binôme, retour d''expérience, avant la formation formelle.
- Connaître les dispositifs : plan de développement des compétences, OPCO, CPF, VAE, CEP, apprentissage.
- Un PDI d''une page, un objectif à la fois, relu à chaque entretien de suivi.
- GROW pour l''entretien de progression : objectif, réalité, options, engagement ; le manager questionne plus qu''il ne conseille.

## Sources

- Code du travail, art. L6321-1 (obligation d''adaptation), L6312-1 et s. (plan de développement des compétences), L6323-1 et s. (CPF), L6411-1 et s. (VAE), L6111-6 (CEP).
- John Whitmore, *Coaching for Performance*, Nicholas Brealey, 1992 (5e éd. 2017) — modèle GROW.
- Ministère du Travail, « Plan de développement des compétences », « Compte personnel de formation », travail-emploi.gouv.fr ; moncompteformation.gouv.fr.
- France Compétences, référentiel RS7377, compétence 7.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Un manager qui fait progresser son équipe gagne sur tous les tableaux : l''équipe devient plus robuste (les compétences critiques ne reposent plus sur une seule personne, module 2), les personnes sont plus motivées (le besoin de compétence, leçon 4.1), et le manager lui-même gagne du temps à mesure que l''autonomie augmente. C''est aussi une obligation de l''employeur, que le manager de proximité met en œuvre : l''article L6321-1 du Code du travail impose d''assurer l''adaptation des salariés à leur poste et de veiller au maintien de leur capacité à occuper un emploi.

## Repérer ce qu''il faut développer

Le point de départ est la matrice de compétences du module 2. Elle montre trois choses : les compétences que l''équipe ne détient pas assez (risque collectif), les personnes qui plafonnent (risque individuel), et les personnes qui peuvent aller plus loin (potentiel).

Puis on croise avec ce que veut la personne. Un plan de développement imposé ne fonctionne pas ; un plan construit avec la personne, à partir de ses souhaits exprimés en entretien de parcours professionnel (module 3), fonctionne. Les questions utiles : « Sur quoi aimerais-tu être meilleur ? », « Qu''est-ce que tu aimerais faire dans deux ans que tu ne sais pas faire aujourd''hui ? », « Qu''est-ce qui te freine ? »

Attention à deux biais. Le premier : ne développer que les meilleurs, parce qu''ils sont gratifiants. Le second : ne développer que les plus faibles, pour combler les manques, et laisser les bons s''ennuyer jusqu''à ce qu''ils partent. Chacun a besoin de progresser, à son niveau.

## Les moyens, du moins cher au plus cher

La formation « en salle » ou en ligne est le moyen auquel on pense d''abord. C''est rarement le plus efficace, et c''est le plus cher. La recherche sur l''apprentissage des adultes montre que l''on apprend surtout en faisant, avec un retour ; les formations formelles servent à structurer ce que l''expérience a commencé. Voici les moyens, du plus courant au plus formel.

La mise en situation progressive : confier une tâche un peu au-dessus du niveau actuel, avec un droit à l''erreur et un point de contrôle. C''est le principe du leadership situationnel (module 1) : on passe de « diriger » à « entraîner » à « épauler ». Lucas apprend à monter un pare-chocs seul, puis avec contrôle, puis sans.

Le binôme ou tutorat : associer une personne qui apprend à une personne qui sait, sur des séances prévues, pas « quand on aura le temps ». Le tuteur doit être volontaire, savoir expliquer (ce n''est pas la même compétence que savoir faire), et être reconnu pour ce rôle. Nadia forme Julien à la nacrée une heure par semaine : c''est du développement pour les deux.

Le retour d''expérience : après une difficulté ou une réussite, prendre dix minutes pour comprendre ce qui s''est passé (module 6). C''est de la formation gratuite.

La formation interne : un membre de l''équipe, ou le manager, présente une méthode, un outil, une règle, en trente minutes, à toute l''équipe. À l''atelier, Thierry présente le contrôle de finition ; Sophie présente le circuit des demandes.

La formation externe : organisme de formation, fournisseur (les constructeurs et les fabricants de peinture forment les carrossiers), centre de formation d''apprentis. Elle se prépare (qu''est-ce qu''on attend, comment on l''appliquera au retour) et se suit (qu''est-ce qui a changé un mois après). Une formation externe sans préparation ni suivi est un budget perdu.

## Les dispositifs à connaître

Le manager ne gère pas les budgets de formation, mais il doit connaître les dispositifs pour orienter et pour parler juste en entretien de parcours.

Le plan de développement des compétences (art. L6312-1 et suivants) : l''ensemble des formations décidées par l''employeur pour ses salariés. Il est construit chaque année, souvent avec les demandes remontées par les managers. C''est là que va la demande de Karim pour former Julien à la peinture. Dans les entreprises de moins de 50 salariés, l''OPCO (opérateur de compétences) de la branche peut financer tout ou partie des formations ; le manager doit savoir quel est l''OPCO de son entreprise.

Le compte personnel de formation (CPF) : compte en euros, alimenté chaque année pour tout salarié, mobilisable par lui pour une formation certifiante de son choix, en dehors ou pendant le temps de travail (avec accord de l''employeur dans ce cas). Une participation financière du salarié s''applique depuis 2024, sauf exceptions. L''employeur peut abonder.

La validation des acquis de l''expérience (VAE) : obtenir un diplôme ou un titre à partir de son expérience. Thierry, avec 28 ans de carrosserie, peut viser un titre sans retourner à l''école.

Le conseil en évolution professionnelle (CEP) : accompagnement gratuit et extérieur à l''entreprise pour construire un projet professionnel.

L''apprentissage et la professionnalisation : pour recruter et former en alternance. Lucas est apprenti ; le manager est souvent son maître d''apprentissage, avec des obligations de suivi et de lien avec le CFA.

## Le plan de développement individuel

Un plan de développement individuel (PDI) tient sur une page (gabarit dans la fiche 4.9). Il contient : la compétence visée, formulée en « être capable de » ; le niveau actuel et le niveau visé (l''échelle 0-3 de la matrice) ; les moyens (mise en situation, binôme, formation) avec leurs dates ; les points de suivi ; ce que la personne fait, ce que le manager fait. Un seul objectif de développement à la fois, deux au maximum. Un PDI à six objectifs n''aboutit jamais.

Le PDI se construit en entretien, se relit à chaque entretien de suivi, et se met à jour. Ce n''est pas un document RH ; c''est un outil de travail entre le manager et la personne.

## Conduire un entretien de progression : le modèle GROW

Pour les entretiens consacrés au développement, le modèle GROW, formalisé par John Whitmore dans les années 1990, donne une trame simple en quatre temps. Il repose sur le questionnement, pas sur le conseil : la personne trouve elle-même son chemin, ce qui rend l''engagement bien plus solide.

- G, Goal (objectif) : « Qu''est-ce que tu veux être capable de faire ? D''ici quand ? Comment saurons-nous que c''est acquis ? »
- R, Reality (réalité) : « Où en es-tu aujourd''hui ? Qu''est-ce que tu as déjà essayé ? Qu''est-ce qui te manque ? »
- O, Options : « Qu''est-ce que tu pourrais faire ? Quoi d''autre ? Et si tu avais plus de temps, de moyens ? » Le manager peut ajouter des options, après celles de la personne.
- W, Will (volonté, engagement) : « Qu''est-ce que tu vas faire, concrètement, d''ici notre prochain point ? Qu''est-ce qui pourrait t''en empêcher ? De quoi as-tu besoin de ma part ? »

Un entretien GROW dure vingt à trente minutes. Le manager parle un quart du temps.

## Le cas Garnier — le plan de Julien

Objectif (G) : Julien veut être autonome sur la peinture de raccord d''ici six mois, niveau 2 de la matrice. Réalité (R) : niveau 1 aujourd''hui, il a fait deux reprises de finition, il va trop vite sous pression ; il a déjà regardé Nadia travailler mais sans pratiquer. Options (O) : binôme avec Nadia une heure par semaine sur véhicule réel ; formation d''une journée chez le fournisseur de peinture (demande au plan de développement des compétences, financement OPCO à vérifier) ; contrôle de chaque finition par Thierry jusqu''à Noël ; retour d''expérience après chaque reprise. Engagement (W) : Julien prépare chaque séance avec Nadia en notant une question ; Karim planifie les séances le mardi à 14 h et fait la demande de formation avant fin de mois ; point tous les six semaines. Le PDI tient sur une page, signé par les deux.

Six mois plus tard, ce plan est la matière de l''entretien de parcours professionnel de Julien : sa progression est documentée, son souhait d''évolution est clair.

## À retenir

- Développer les compétences est une obligation de l''employeur (L6321-1) et le meilleur levier de motivation et de robustesse.
- Partir de la matrice de compétences et des souhaits de la personne ; développer chacun, pas seulement les meilleurs ni seulement les plus faibles.
- On apprend surtout en faisant, avec retour : mise en situation, binôme, retour d''expérience, avant la formation formelle.
- Connaître les dispositifs : plan de développement des compétences, OPCO, CPF, VAE, CEP, apprentissage.
- Un PDI d''une page, un objectif à la fois, relu à chaque entretien de suivi.
- GROW pour l''entretien de progression : objectif, réalité, options, engagement ; le manager questionne plus qu''il ne conseille.

## Sources

- Code du travail, art. L6321-1 (obligation d''adaptation), L6312-1 et s. (plan de développement des compétences), L6323-1 et s. (CPF), L6411-1 et s. (VAE), L6111-6 (CEP).
- John Whitmore, *Coaching for Performance*, Nicholas Brealey, 1992 (5e éd. 2017) — modèle GROW.
- Ministère du Travail, « Plan de développement des compétences », « Compte personnel de formation », travail-emploi.gouv.fr ; moncompteformation.gouv.fr.
- France Compétences, référentiel RS7377, compétence 7.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 5 and l.ordre = 4;
  n := n + 1;

  -- 4.5-integrer-un-nouvel-arrivant.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Les premières semaines d''un nouveau salarié décident de beaucoup : de sa vitesse d''apprentissage, de sa place dans l''équipe, et souvent de son maintien dans l''entreprise. Les ruptures de période d''essai et les départs dans la première année sont fréquents, et une part importante d''entre eux tient à une intégration ratée : personne pour accueillir, pas de poste prêt, pas d''explication, l''impression de déranger. Le coût d''un recrutement à refaire (annonce, entretiens, temps de formation perdu) dépasse largement le coût de quelques heures d''intégration bien préparées.

L''intégration est l''affaire du manager de proximité. Les RH gèrent le contrat et les formalités ; c''est vous qui gérez l''arrivée dans l''équipe.

## Avant le premier jour

L''intégration commence avant l''arrivée. Entre la signature et le premier jour, un message du manager (« nous vous attendons lundi à 8 h, voilà comment ça se passera, voilà ce qu''il faut apporter ») change tout pour quelqu''un qui, souvent, quitte un autre emploi avec une part d''inquiétude.

Côté pratique, la liste est connue et pourtant régulièrement oubliée : poste de travail prêt, tenue et équipements de protection à la bonne taille, accès et identifiants, badge, casier. Un nouveau qui passe sa première matinée à attendre des chaussures de sécurité a compris qu''il n''était pas attendu.

Côté équipe : prévenir tout le monde de qui arrive, quand, pour quel poste, et désigner un parrain (ou tuteur d''intégration). Le parrain n''est pas le manager : c''est un collègue expérimenté, volontaire, qui répond aux questions qu''on n''ose pas poser au chef (où l''on mange, comment on demande un congé, qui il faut ménager). Le parrain est reconnu pour ce rôle et dispose du temps nécessaire.

## Le premier jour

Le manager est là, à l''heure, et consacre la première heure au nouveau. Il présente l''entreprise en quelques phrases, l''équipe (chacun par son prénom et son rôle, pas une liste), les lieux, les règles essentielles de sécurité, et le programme des premiers jours. Il dit ce qu''il attend, et ce que le nouveau peut attendre de lui.

Il présente le parrain et laisse la journée se dérouler avec lui. Le nouveau ne doit pas être productif le premier jour ; il doit comprendre où il est. Un déjeuner avec l''équipe, ou au moins avec le parrain, est plus utile que la première tâche.

En fin de journée, cinq minutes avec le manager : « Comment s''est passée la journée ? Qu''est-ce qui vous a surpris ? Qu''est-ce qui manque ? »

## La première semaine

Le nouveau observe, puis fait avec, puis fait sous contrôle. C''est le style « diriger » du leadership situationnel : consignes précises, contrôle rapproché, retours fréquents. Ce n''est pas de la méfiance ; c''est ce dont un débutant a besoin, même s''il est expérimenté ailleurs, parce qu''ici il ne connaît ni les habitudes ni les outils.

Chaque jour, un point court avec le parrain ou le manager. En fin de semaine, un entretien de trente minutes : ce qui est compris, ce qui ne l''est pas, ce qui étonne, ce que le nouveau apporte (il voit des choses que l''équipe ne voit plus : profitez-en avant qu''il ne s''habitue).

La première semaine est aussi le moment de la formation à la sécurité, obligatoire (art. L4141-2 du Code du travail : formation pratique et appropriée à la sécurité pour tout nouvel embauché, y compris les intérimaires et les salariés qui changent de poste). Elle est tracée.

## Le premier mois

L''autonomie augmente par paliers, avec le PDI de la leçon 4.4 comme support. Le manager donne des retours fréquents, positifs et correctifs, avec la méthode du module 3. Il veille à ce que le nouveau soit intégré socialement : invité aux pauses, sollicité en réunion, pas laissé seul dans un coin.

Le point à un mois est un entretien formel (trente minutes) : bilan de ce qui est acquis, de ce qui reste à apprendre, du ressenti, de la relation avec l''équipe. C''est aussi le moment de dire clairement si la période d''essai est en bonne voie ou non. Une rupture de période d''essai ne doit jamais être une surprise : si des difficultés existent, elles ont été dites, avec des attentes précises et un délai, avant.

## Les cas particuliers

L''apprenti ou l''alternant : le manager (ou le maître d''apprentissage désigné) a une obligation de formation et de suivi, en lien avec le CFA. Il faut du temps pour expliquer, pas seulement pour faire faire. Lucas, à l''atelier, doit apprendre le métier, pas seulement porter les pièces.

L''intérimaire ou le CDD court : l''intégration est condensée mais pas supprimée. La sécurité, les règles essentielles, le parrain, le point de fin de première journée. Un intérimaire mal intégré est un risque d''accident.

La personne en situation de handicap : l''intégration inclut la mise en place des aménagements prévus (module 2), sans annoncer à l''équipe ce qui relève de la vie privée. On explique l''organisation (« Fatou ne porte pas les éléments lourds, Lucas s''en charge »), pas le motif.

Le nouveau manager lui-même : si c''est vous qui arrivez, tout ce qui précède vaut pour vous, et vous en êtes en grande partie responsable. La feuille de route des 90 premiers jours du module 1 est votre plan d''intégration.

## Le retour après une longue absence

Le retour d''un salarié après un congé maternité ou parental, un arrêt long, une expatriation, se prépare comme une intégration : ce qui a changé (outils, organisation, personnes), un point d''étape, une montée en charge progressive. L''entretien de parcours professionnel est obligatoire au retour de plusieurs de ces absences (module 3). Un retour sans accueil, où la personne découvre son bureau réattribué et de nouveaux outils sans explication, est une cause fréquente de départ ou de rechute.

## Le cas Garnier

Michel a recruté un second peintre, Amine, 31 ans, expérimenté. Karim prépare : message une semaine avant, tenue et EPI commandés à sa taille, cabine et poste préparés, Nadia désignée parraine (elle a demandé à former : c''est une reconnaissance). Premier jour : présentation de l''équipe, règles de sécurité de la cabine, déjeuner avec Nadia et Julien, cinq minutes le soir. Première semaine : Amine observe Nadia deux jours, peint avec elle, puis seul avec contrôle ; entretien le vendredi, où Amine signale que le circuit des pièces lui paraît lent par rapport à son ancien atelier. Karim note : c''est une idée à creuser. Point à un mois : Amine est autonome sur les peintures courantes, pas encore sur la nacrée (PDI avec Nadia) ; la période d''essai est confirmée.

## À retenir

- L''intégration décide de la période d''essai et de la première année ; elle est de la responsabilité du manager.
- Avant l''arrivée : message, poste prêt, EPI, accès, équipe prévenue, parrain désigné.
- Premier jour : présence du manager, présentation, sécurité, parrain, cinq minutes le soir.
- Première semaine : style directif, formation sécurité obligatoire (L4141-2), entretien le vendredi.
- Premier mois : autonomie par paliers, retours fréquents, point formel à un mois, aucune surprise sur la période d''essai.
- Apprentis, intérimaires, retours d''absence : intégration adaptée, jamais supprimée.

## Sources

- Code du travail, art. L4141-2 (formation à la sécurité), L1221-19 et s. (période d''essai), L6223-1 et s. (maître d''apprentissage).
- INRS, « Accueil et formation à la sécurité des nouveaux embauchés », inrs.fr.
- Talya N. Bauer, *Onboarding New Employees: Maximizing Success*, SHRM Foundation, 2010.
- France Compétences, référentiel RS7377, compétences 5 et 7.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Les premières semaines d''un nouveau salarié décident de beaucoup : de sa vitesse d''apprentissage, de sa place dans l''équipe, et souvent de son maintien dans l''entreprise. Les ruptures de période d''essai et les départs dans la première année sont fréquents, et une part importante d''entre eux tient à une intégration ratée : personne pour accueillir, pas de poste prêt, pas d''explication, l''impression de déranger. Le coût d''un recrutement à refaire (annonce, entretiens, temps de formation perdu) dépasse largement le coût de quelques heures d''intégration bien préparées.

L''intégration est l''affaire du manager de proximité. Les RH gèrent le contrat et les formalités ; c''est vous qui gérez l''arrivée dans l''équipe.

## Avant le premier jour

L''intégration commence avant l''arrivée. Entre la signature et le premier jour, un message du manager (« nous vous attendons lundi à 8 h, voilà comment ça se passera, voilà ce qu''il faut apporter ») change tout pour quelqu''un qui, souvent, quitte un autre emploi avec une part d''inquiétude.

Côté pratique, la liste est connue et pourtant régulièrement oubliée : poste de travail prêt, tenue et équipements de protection à la bonne taille, accès et identifiants, badge, casier. Un nouveau qui passe sa première matinée à attendre des chaussures de sécurité a compris qu''il n''était pas attendu.

Côté équipe : prévenir tout le monde de qui arrive, quand, pour quel poste, et désigner un parrain (ou tuteur d''intégration). Le parrain n''est pas le manager : c''est un collègue expérimenté, volontaire, qui répond aux questions qu''on n''ose pas poser au chef (où l''on mange, comment on demande un congé, qui il faut ménager). Le parrain est reconnu pour ce rôle et dispose du temps nécessaire.

## Le premier jour

Le manager est là, à l''heure, et consacre la première heure au nouveau. Il présente l''entreprise en quelques phrases, l''équipe (chacun par son prénom et son rôle, pas une liste), les lieux, les règles essentielles de sécurité, et le programme des premiers jours. Il dit ce qu''il attend, et ce que le nouveau peut attendre de lui.

Il présente le parrain et laisse la journée se dérouler avec lui. Le nouveau ne doit pas être productif le premier jour ; il doit comprendre où il est. Un déjeuner avec l''équipe, ou au moins avec le parrain, est plus utile que la première tâche.

En fin de journée, cinq minutes avec le manager : « Comment s''est passée la journée ? Qu''est-ce qui vous a surpris ? Qu''est-ce qui manque ? »

## La première semaine

Le nouveau observe, puis fait avec, puis fait sous contrôle. C''est le style « diriger » du leadership situationnel : consignes précises, contrôle rapproché, retours fréquents. Ce n''est pas de la méfiance ; c''est ce dont un débutant a besoin, même s''il est expérimenté ailleurs, parce qu''ici il ne connaît ni les habitudes ni les outils.

Chaque jour, un point court avec le parrain ou le manager. En fin de semaine, un entretien de trente minutes : ce qui est compris, ce qui ne l''est pas, ce qui étonne, ce que le nouveau apporte (il voit des choses que l''équipe ne voit plus : profitez-en avant qu''il ne s''habitue).

La première semaine est aussi le moment de la formation à la sécurité, obligatoire (art. L4141-2 du Code du travail : formation pratique et appropriée à la sécurité pour tout nouvel embauché, y compris les intérimaires et les salariés qui changent de poste). Elle est tracée.

## Le premier mois

L''autonomie augmente par paliers, avec le PDI de la leçon 4.4 comme support. Le manager donne des retours fréquents, positifs et correctifs, avec la méthode du module 3. Il veille à ce que le nouveau soit intégré socialement : invité aux pauses, sollicité en réunion, pas laissé seul dans un coin.

Le point à un mois est un entretien formel (trente minutes) : bilan de ce qui est acquis, de ce qui reste à apprendre, du ressenti, de la relation avec l''équipe. C''est aussi le moment de dire clairement si la période d''essai est en bonne voie ou non. Une rupture de période d''essai ne doit jamais être une surprise : si des difficultés existent, elles ont été dites, avec des attentes précises et un délai, avant.

## Les cas particuliers

L''apprenti ou l''alternant : le manager (ou le maître d''apprentissage désigné) a une obligation de formation et de suivi, en lien avec le CFA. Il faut du temps pour expliquer, pas seulement pour faire faire. Lucas, à l''atelier, doit apprendre le métier, pas seulement porter les pièces.

L''intérimaire ou le CDD court : l''intégration est condensée mais pas supprimée. La sécurité, les règles essentielles, le parrain, le point de fin de première journée. Un intérimaire mal intégré est un risque d''accident.

La personne en situation de handicap : l''intégration inclut la mise en place des aménagements prévus (module 2), sans annoncer à l''équipe ce qui relève de la vie privée. On explique l''organisation (« Fatou ne porte pas les éléments lourds, Lucas s''en charge »), pas le motif.

Le nouveau manager lui-même : si c''est vous qui arrivez, tout ce qui précède vaut pour vous, et vous en êtes en grande partie responsable. La feuille de route des 90 premiers jours du module 1 est votre plan d''intégration.

## Le retour après une longue absence

Le retour d''un salarié après un congé maternité ou parental, un arrêt long, une expatriation, se prépare comme une intégration : ce qui a changé (outils, organisation, personnes), un point d''étape, une montée en charge progressive. L''entretien de parcours professionnel est obligatoire au retour de plusieurs de ces absences (module 3). Un retour sans accueil, où la personne découvre son bureau réattribué et de nouveaux outils sans explication, est une cause fréquente de départ ou de rechute.

## Le cas Garnier

Michel a recruté un second peintre, Amine, 31 ans, expérimenté. Karim prépare : message une semaine avant, tenue et EPI commandés à sa taille, cabine et poste préparés, Nadia désignée parraine (elle a demandé à former : c''est une reconnaissance). Premier jour : présentation de l''équipe, règles de sécurité de la cabine, déjeuner avec Nadia et Julien, cinq minutes le soir. Première semaine : Amine observe Nadia deux jours, peint avec elle, puis seul avec contrôle ; entretien le vendredi, où Amine signale que le circuit des pièces lui paraît lent par rapport à son ancien atelier. Karim note : c''est une idée à creuser. Point à un mois : Amine est autonome sur les peintures courantes, pas encore sur la nacrée (PDI avec Nadia) ; la période d''essai est confirmée.

## À retenir

- L''intégration décide de la période d''essai et de la première année ; elle est de la responsabilité du manager.
- Avant l''arrivée : message, poste prêt, EPI, accès, équipe prévenue, parrain désigné.
- Premier jour : présence du manager, présentation, sécurité, parrain, cinq minutes le soir.
- Première semaine : style directif, formation sécurité obligatoire (L4141-2), entretien le vendredi.
- Premier mois : autonomie par paliers, retours fréquents, point formel à un mois, aucune surprise sur la période d''essai.
- Apprentis, intérimaires, retours d''absence : intégration adaptée, jamais supprimée.

## Sources

- Code du travail, art. L4141-2 (formation à la sécurité), L1221-19 et s. (période d''essai), L6223-1 et s. (maître d''apprentissage).
- INRS, « Accueil et formation à la sécurité des nouveaux embauchés », inrs.fr.
- Talya N. Bauer, *Onboarding New Employees: Maximizing Success*, SHRM Foundation, 2010.
- France Compétences, référentiel RS7377, compétences 5 et 7.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 5 and l.ordre = 5;
  n := n + 1;

  -- 4.6-cadre-de-travail-soutenable.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Le référentiel RS7377 demande au manager de « mettre en place et faire vivre un cadre de travail respectueux, soutenable et équitable ». Derrière ces trois adjectifs, il y a des règles de droit, des outils, et surtout des décisions quotidiennes du manager de proximité : qui fait quoi, combien, quand, et si c''est juste. Cette leçon traite de la charge de travail, de la qualité de vie et des conditions de travail, du télétravail, du droit à la déconnexion et de l''équité de traitement. La leçon suivante traite des risques psychosociaux.

## La charge de travail : la réguler, pas la subir

La charge de travail est la première cause de dégradation des conditions de travail dans les enquêtes sur le sujet, et c''est le manager de proximité qui la distribue. Trois notions à distinguer : la charge prescrite (ce qu''on demande), la charge réelle (ce que la personne fait effectivement, y compris ce qui n''est pas prescrit : rattraper, improviser, gérer les imprévus), et la charge ressentie (comment elle le vit). Un manager qui ne regarde que la charge prescrite ne voit pas la surcharge ; elle est dans l''écart entre les trois.

Réguler la charge, concrètement :

- Mesurer : le tableau de bord du module 2 avec un indicateur de garde-fou (heures supplémentaires, retards, reprises) ; le brief quotidien où l''on dit ce qui déborde.
- Prioriser : la matrice d''Eisenhower ; quand tout est urgent, c''est au manager de dire ce qui attend, pas à la personne de tout faire.
- Dire non ou « oui à ces conditions » à la hiérarchie quand la charge n''est pas tenable (module 3, podcast 3.8).
- Répartir équitablement : les mêmes ne doivent pas absorber tous les imprévus parce qu''ils ne disent jamais non.
- Vérifier régulièrement, en entretien de suivi : « Comment tu vis ta charge en ce moment ? » Pour les salariés en forfait-jours, cet entretien sur la charge de travail est une obligation légale annuelle (art. L3121-65).

Le cadre légal de la durée du travail est le garde-fou minimal, et le manager le connaît : 10 heures par jour maximum (L3121-18), 48 heures par semaine et 44 heures en moyenne sur douze semaines (L3121-20 et L3121-22), 11 heures de repos quotidien (L3131-1), 35 heures de repos hebdomadaire consécutives (L3132-2), 20 minutes de pause dès 6 heures de travail (L3121-16). Des dérogations existent par accord ; le manager se renseigne auprès des RH avant d''en supposer. Un manager qui fait dépasser ces limites engage la responsabilité de l''employeur, et la sienne.

## La QVCT : de quoi parle-t-on

L''accord national interprofessionnel du 9 décembre 2020 sur la santé au travail, transposé par la loi du 2 août 2021, a remplacé la « qualité de vie au travail » (QVT) par la « qualité de vie et des conditions de travail » (QVCT). Le changement de mot n''est pas anodin : il recentre le sujet sur le travail lui-même (son organisation, ses conditions, son contenu) plutôt que sur les à-côtés (le baby-foot, les paniers de fruits). La QVCT est un thème de négociation obligatoire dans les entreprises où existe une représentation syndicale (L2242-17).

L''ANACT (Agence nationale pour l''amélioration des conditions de travail) résume la QVCT en quelques champs sur lesquels le manager de proximité a prise : le contenu du travail (intérêt, autonomie, variété), l''organisation (charge, rythme, clarté des rôles), les relations (soutien du manager et des collègues, reconnaissance), les possibilités de progression, l''articulation entre vie professionnelle et vie personnelle, et la participation aux décisions qui concernent le travail.

Ce dernier point est central : la QVCT se construit avec les salariés, pas pour eux. Les « espaces de discussion sur le travail », où l''équipe parle de ce qui la gêne et de ce qui pourrait changer, sont l''outil que l''ANACT recommande. La réunion mensuelle du module 3, avec un point « qu''est-ce qui nous complique le travail », en est une forme simple.

## Le télétravail et l''hybride

Le télétravail est encadré par les articles L1222-9 à L1222-11 du Code du travail et par l''ANI du 26 novembre 2020. Ce que le manager doit savoir :

- Il est mis en place par accord collectif ou, à défaut, par une charte de l''employeur, ou, à défaut, par simple accord entre le salarié et l''employeur, par tout moyen. Il est volontaire des deux côtés, sauf circonstances exceptionnelles (épidémie, force majeure) où l''employeur peut l''imposer.
- Si un poste est éligible selon l''accord ou la charte, un refus opposé au salarié qui le demande doit être motivé.
- Le télétravailleur a les mêmes droits que les autres : mêmes règles de durée du travail, mêmes possibilités de formation et d''évolution, même accès à l''information.
- L''employeur doit organiser chaque année un entretien sur les conditions d''activité et la charge de travail du télétravailleur, et fixer les plages horaires pendant lesquelles il peut être contacté.
- L''accident survenu sur le lieu et pendant les heures de télétravail est présumé accident du travail.

Pour le manager, le télétravail change la manière de manager, pas les principes : on manage sur les résultats et la confiance, pas sur la présence ; on adapte les rituels (module 6, leçon 6.6) ; on veille à l''équité entre ceux qui sont sur site et ceux qui sont à distance (accès à l''information, aux missions intéressantes, à la reconnaissance) ; on repère l''isolement.

Dans un atelier, un commerce, un service de soins, le télétravail ne concerne qu''une partie des postes (l''administratif, parfois l''encadrement). Le manager veille alors à ce que cela ne crée pas deux catégories de salariés : ceux qui peuvent et ceux qui ne peuvent pas. On l''explique (le poste, pas la personne), et on cherche d''autres souplesses pour les seconds (horaires, jours).

## Le droit à la déconnexion

Depuis 2017, le droit à la déconnexion est un thème de négociation obligatoire (L2242-17), et à défaut d''accord, l''employeur établit une charte. L''objet : garantir le respect des temps de repos et de congé et de la vie personnelle. Le manager de proximité est le premier acteur de ce droit, par l''exemple : un manager qui envoie des messages à 22 h ou le dimanche, même « sans attendre de réponse », crée une pression que l''équipe ressent. Les règles simples : pas de message professionnel hors des horaires sauf urgence réelle (et définir ce qu''est une urgence), envoi différé si l''on travaille tard, pas de reproche à qui ne répond pas le soir, et des congés qui sont des congés.

## L''équité de traitement

Un cadre de travail équitable, ce n''est pas un cadre identique pour tous : c''est un cadre où les différences de traitement ont une raison objective et connue. Le Code du travail interdit toute discrimination fondée sur une liste de critères (origine, sexe, âge, situation de famille, état de santé, handicap, opinions, activités syndicales, etc. ; art. L1132-1), à l''embauche comme dans la carrière, la rémunération, la formation, l''affectation. Le principe « à travail égal, salaire égal » s''applique.

Le manager de proximité est exposé à la discrimination indirecte, celle qu''on ne voit pas : donner les missions intéressantes toujours aux mêmes, ne pas proposer de formation à celle qui est à temps partiel, écarter un senior d''un projet « parce qu''il va partir », ne pas confier de responsabilités à celui qui revient d''arrêt. Chacune de ces décisions, prise sans y penser, peut constituer une discrimination.

Trois réflexes : se demander, à chaque attribution (mission, formation, horaire, prime), sur quel critère objectif elle repose ; tenir le compte de qui a eu quoi sur l''année ; expliquer les décisions, parce qu''une décision non expliquée est vécue comme injuste même quand elle ne l''est pas. La justice perçue (chacun comprend pourquoi) compte autant que la justice réelle.

## Le cas Garnier

Karim constate que Thierry et Nadia font l''essentiel des heures supplémentaires, parce qu''ils ne refusent jamais, et que Marc n''en fait aucune, parce qu''il a une contrainte de garde le mercredi et qu''on a cessé de lui demander. Il remet à plat : les heures supplémentaires sont proposées à tous, par roulement, en tenant compte des contraintes déclarées ; l''indicateur « heures sup par personne » entre dans le tableau de bord ; et il en parle à Michel pour que le volume global baisse, ce qui passe par le circuit des pièces qu''Amine a signalé. Sophie, seule à un poste administratif, demande un jour de télétravail : l''entreprise n''a ni accord ni charte ; Karim propose à Michel un accord écrit simple avec Sophie (jour fixe, plages joignables, matériel), et explique à l''atelier que c''est le poste qui le permet, pas la personne.

## À retenir

- La charge se régule : mesurer (garde-fous), prioriser, dire non vers le haut, répartir, vérifier en entretien ; connaître les limites légales de durée du travail et de repos.
- La QVCT (ANI 2020, loi 2021) porte sur le travail lui-même et se construit avec les salariés : espaces de discussion sur le travail.
- Télétravail (L1222-9 à 11) : volontaire, par accord, charte ou accord individuel ; mêmes droits ; entretien annuel sur la charge ; manager sur les résultats et veiller à l''équité.
- Droit à la déconnexion : le manager donne l''exemple.
- Équité : des différences justifiées par un critère objectif, connues et expliquées ; vigilance sur la discrimination indirecte (L1132-1).

## Sources

- Code du travail : durée du travail et repos (L3121-16, L3121-18, L3121-20, L3121-22, L3131-1, L3132-2, L3121-65), télétravail (L1222-9 à L1222-11), négociation QVCT et déconnexion (L2242-17), non-discrimination (L1132-1).
- ANI du 9 décembre 2020 sur la santé au travail ; loi n° 2021-1018 du 2 août 2021 ; ANI du 26 novembre 2020 sur le télétravail.
- ANACT, « La QVCT : de quoi parle-t-on ? » et « Les espaces de discussion sur le travail », anact.fr.
- Défenseur des droits, « Discrimination au travail », defenseurdesdroits.fr.
- France Compétences, référentiel RS7377, compétence 5.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Le référentiel RS7377 demande au manager de « mettre en place et faire vivre un cadre de travail respectueux, soutenable et équitable ». Derrière ces trois adjectifs, il y a des règles de droit, des outils, et surtout des décisions quotidiennes du manager de proximité : qui fait quoi, combien, quand, et si c''est juste. Cette leçon traite de la charge de travail, de la qualité de vie et des conditions de travail, du télétravail, du droit à la déconnexion et de l''équité de traitement. La leçon suivante traite des risques psychosociaux.

## La charge de travail : la réguler, pas la subir

La charge de travail est la première cause de dégradation des conditions de travail dans les enquêtes sur le sujet, et c''est le manager de proximité qui la distribue. Trois notions à distinguer : la charge prescrite (ce qu''on demande), la charge réelle (ce que la personne fait effectivement, y compris ce qui n''est pas prescrit : rattraper, improviser, gérer les imprévus), et la charge ressentie (comment elle le vit). Un manager qui ne regarde que la charge prescrite ne voit pas la surcharge ; elle est dans l''écart entre les trois.

Réguler la charge, concrètement :

- Mesurer : le tableau de bord du module 2 avec un indicateur de garde-fou (heures supplémentaires, retards, reprises) ; le brief quotidien où l''on dit ce qui déborde.
- Prioriser : la matrice d''Eisenhower ; quand tout est urgent, c''est au manager de dire ce qui attend, pas à la personne de tout faire.
- Dire non ou « oui à ces conditions » à la hiérarchie quand la charge n''est pas tenable (module 3, podcast 3.8).
- Répartir équitablement : les mêmes ne doivent pas absorber tous les imprévus parce qu''ils ne disent jamais non.
- Vérifier régulièrement, en entretien de suivi : « Comment tu vis ta charge en ce moment ? » Pour les salariés en forfait-jours, cet entretien sur la charge de travail est une obligation légale annuelle (art. L3121-65).

Le cadre légal de la durée du travail est le garde-fou minimal, et le manager le connaît : 10 heures par jour maximum (L3121-18), 48 heures par semaine et 44 heures en moyenne sur douze semaines (L3121-20 et L3121-22), 11 heures de repos quotidien (L3131-1), 35 heures de repos hebdomadaire consécutives (L3132-2), 20 minutes de pause dès 6 heures de travail (L3121-16). Des dérogations existent par accord ; le manager se renseigne auprès des RH avant d''en supposer. Un manager qui fait dépasser ces limites engage la responsabilité de l''employeur, et la sienne.

## La QVCT : de quoi parle-t-on

L''accord national interprofessionnel du 9 décembre 2020 sur la santé au travail, transposé par la loi du 2 août 2021, a remplacé la « qualité de vie au travail » (QVT) par la « qualité de vie et des conditions de travail » (QVCT). Le changement de mot n''est pas anodin : il recentre le sujet sur le travail lui-même (son organisation, ses conditions, son contenu) plutôt que sur les à-côtés (le baby-foot, les paniers de fruits). La QVCT est un thème de négociation obligatoire dans les entreprises où existe une représentation syndicale (L2242-17).

L''ANACT (Agence nationale pour l''amélioration des conditions de travail) résume la QVCT en quelques champs sur lesquels le manager de proximité a prise : le contenu du travail (intérêt, autonomie, variété), l''organisation (charge, rythme, clarté des rôles), les relations (soutien du manager et des collègues, reconnaissance), les possibilités de progression, l''articulation entre vie professionnelle et vie personnelle, et la participation aux décisions qui concernent le travail.

Ce dernier point est central : la QVCT se construit avec les salariés, pas pour eux. Les « espaces de discussion sur le travail », où l''équipe parle de ce qui la gêne et de ce qui pourrait changer, sont l''outil que l''ANACT recommande. La réunion mensuelle du module 3, avec un point « qu''est-ce qui nous complique le travail », en est une forme simple.

## Le télétravail et l''hybride

Le télétravail est encadré par les articles L1222-9 à L1222-11 du Code du travail et par l''ANI du 26 novembre 2020. Ce que le manager doit savoir :

- Il est mis en place par accord collectif ou, à défaut, par une charte de l''employeur, ou, à défaut, par simple accord entre le salarié et l''employeur, par tout moyen. Il est volontaire des deux côtés, sauf circonstances exceptionnelles (épidémie, force majeure) où l''employeur peut l''imposer.
- Si un poste est éligible selon l''accord ou la charte, un refus opposé au salarié qui le demande doit être motivé.
- Le télétravailleur a les mêmes droits que les autres : mêmes règles de durée du travail, mêmes possibilités de formation et d''évolution, même accès à l''information.
- L''employeur doit organiser chaque année un entretien sur les conditions d''activité et la charge de travail du télétravailleur, et fixer les plages horaires pendant lesquelles il peut être contacté.
- L''accident survenu sur le lieu et pendant les heures de télétravail est présumé accident du travail.

Pour le manager, le télétravail change la manière de manager, pas les principes : on manage sur les résultats et la confiance, pas sur la présence ; on adapte les rituels (module 6, leçon 6.6) ; on veille à l''équité entre ceux qui sont sur site et ceux qui sont à distance (accès à l''information, aux missions intéressantes, à la reconnaissance) ; on repère l''isolement.

Dans un atelier, un commerce, un service de soins, le télétravail ne concerne qu''une partie des postes (l''administratif, parfois l''encadrement). Le manager veille alors à ce que cela ne crée pas deux catégories de salariés : ceux qui peuvent et ceux qui ne peuvent pas. On l''explique (le poste, pas la personne), et on cherche d''autres souplesses pour les seconds (horaires, jours).

## Le droit à la déconnexion

Depuis 2017, le droit à la déconnexion est un thème de négociation obligatoire (L2242-17), et à défaut d''accord, l''employeur établit une charte. L''objet : garantir le respect des temps de repos et de congé et de la vie personnelle. Le manager de proximité est le premier acteur de ce droit, par l''exemple : un manager qui envoie des messages à 22 h ou le dimanche, même « sans attendre de réponse », crée une pression que l''équipe ressent. Les règles simples : pas de message professionnel hors des horaires sauf urgence réelle (et définir ce qu''est une urgence), envoi différé si l''on travaille tard, pas de reproche à qui ne répond pas le soir, et des congés qui sont des congés.

## L''équité de traitement

Un cadre de travail équitable, ce n''est pas un cadre identique pour tous : c''est un cadre où les différences de traitement ont une raison objective et connue. Le Code du travail interdit toute discrimination fondée sur une liste de critères (origine, sexe, âge, situation de famille, état de santé, handicap, opinions, activités syndicales, etc. ; art. L1132-1), à l''embauche comme dans la carrière, la rémunération, la formation, l''affectation. Le principe « à travail égal, salaire égal » s''applique.

Le manager de proximité est exposé à la discrimination indirecte, celle qu''on ne voit pas : donner les missions intéressantes toujours aux mêmes, ne pas proposer de formation à celle qui est à temps partiel, écarter un senior d''un projet « parce qu''il va partir », ne pas confier de responsabilités à celui qui revient d''arrêt. Chacune de ces décisions, prise sans y penser, peut constituer une discrimination.

Trois réflexes : se demander, à chaque attribution (mission, formation, horaire, prime), sur quel critère objectif elle repose ; tenir le compte de qui a eu quoi sur l''année ; expliquer les décisions, parce qu''une décision non expliquée est vécue comme injuste même quand elle ne l''est pas. La justice perçue (chacun comprend pourquoi) compte autant que la justice réelle.

## Le cas Garnier

Karim constate que Thierry et Nadia font l''essentiel des heures supplémentaires, parce qu''ils ne refusent jamais, et que Marc n''en fait aucune, parce qu''il a une contrainte de garde le mercredi et qu''on a cessé de lui demander. Il remet à plat : les heures supplémentaires sont proposées à tous, par roulement, en tenant compte des contraintes déclarées ; l''indicateur « heures sup par personne » entre dans le tableau de bord ; et il en parle à Michel pour que le volume global baisse, ce qui passe par le circuit des pièces qu''Amine a signalé. Sophie, seule à un poste administratif, demande un jour de télétravail : l''entreprise n''a ni accord ni charte ; Karim propose à Michel un accord écrit simple avec Sophie (jour fixe, plages joignables, matériel), et explique à l''atelier que c''est le poste qui le permet, pas la personne.

## À retenir

- La charge se régule : mesurer (garde-fous), prioriser, dire non vers le haut, répartir, vérifier en entretien ; connaître les limites légales de durée du travail et de repos.
- La QVCT (ANI 2020, loi 2021) porte sur le travail lui-même et se construit avec les salariés : espaces de discussion sur le travail.
- Télétravail (L1222-9 à 11) : volontaire, par accord, charte ou accord individuel ; mêmes droits ; entretien annuel sur la charge ; manager sur les résultats et veiller à l''équité.
- Droit à la déconnexion : le manager donne l''exemple.
- Équité : des différences justifiées par un critère objectif, connues et expliquées ; vigilance sur la discrimination indirecte (L1132-1).

## Sources

- Code du travail : durée du travail et repos (L3121-16, L3121-18, L3121-20, L3121-22, L3131-1, L3132-2, L3121-65), télétravail (L1222-9 à L1222-11), négociation QVCT et déconnexion (L2242-17), non-discrimination (L1132-1).
- ANI du 9 décembre 2020 sur la santé au travail ; loi n° 2021-1018 du 2 août 2021 ; ANI du 26 novembre 2020 sur le télétravail.
- ANACT, « La QVCT : de quoi parle-t-on ? » et « Les espaces de discussion sur le travail », anact.fr.
- Défenseur des droits, « Discrimination au travail », defenseurdesdroits.fr.
- France Compétences, référentiel RS7377, compétence 5.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 5 and l.ordre = 6;
  n := n + 1;

  -- 4.7-prevenir-les-risques-psychosociaux.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Les risques psychosociaux (RPS) sont les risques pour la santé mentale, physique et sociale engendrés par les conditions d''emploi et les facteurs organisationnels et relationnels du travail. Stress chronique, épuisement, violences internes (harcèlement, conflits exacerbés) et externes (agressions de clients ou d''usagers) en sont les formes les plus connues. Ils ne relèvent pas de la fragilité des personnes : ils relèvent de l''organisation du travail. C''est pour cela que le manager de proximité, qui organise le travail, est en première ligne pour les prévenir, et aussi pour les produire quand il s''y prend mal.

## Ce que dit la loi

L''employeur a une obligation de sécurité : il doit prendre les mesures nécessaires pour assurer la sécurité et protéger la santé physique et mentale des travailleurs (art. L4121-1). La santé mentale figure dans le texte depuis 2002. Les RPS doivent être évalués dans le document unique d''évaluation des risques professionnels (DUERP, art. L4121-3-1), obligatoire dans toute entreprise dès le premier salarié, et faire l''objet d''actions de prévention selon les principes généraux (L4121-2) : éviter les risques, les combattre à la source, adapter le travail à l''homme, planifier la prévention.

Cette obligation pèse sur l''employeur, pas sur le manager. Mais le manager est celui par qui l''employeur agit : ses décisions d''organisation sont des mesures de prévention, ou des facteurs de risque. Et il a, comme tout salarié, l''obligation de prendre soin de sa santé et de celle des autres (L4122-1).

## Les six familles de facteurs de risque

Le rapport du collège d''expertise présidé par Michel Gollac (2011), référence en France, classe les facteurs de RPS en six familles. Elles sont utiles au manager parce que chacune renvoie à une décision d''organisation qu''il prend, ou pas.

| Famille | Ce dont il s''agit | Ce que le manager peut faire |
|---|---|---|
| Intensité et temps de travail | Charge, rythme, délais, interruptions, horaires, heures supplémentaires | Réguler la charge, prioriser, protéger les repos (leçon 4.6) |
| Exigences émotionnelles | Contact avec le public, clients difficiles, devoir cacher ses émotions, contact avec la souffrance | Ne pas laisser seul face au client agressif, débriefer, former |
| Autonomie insuffisante | Pas de marge sur la manière de faire, pas de participation aux décisions, compétences sous-utilisées | Déléguer, consulter, laisser choisir la méthode |
| Rapports sociaux dégradés | Manque de soutien du manager ou des collègues, manque de reconnaissance, injustice, violence, harcèlement | Écoute, feedback, reconnaissance, équité, limites (modules 3 et 4) |
| Conflits de valeurs | Devoir faire un travail qu''on désapprouve, travail « bâclé » faute de moyens, sentiment d''inutilité | Donner les moyens de faire du travail de qualité, expliquer le sens |
| Insécurité de la situation de travail | Peur de perdre son emploi, changements non maîtrisés, incertitude sur l''avenir | Informer, accompagner le changement (module 6) |

Un manager qui relit ce tableau y retrouve tout le contenu de cette formation. Ce n''est pas un hasard : bien manager, c''est prévenir les RPS.

## Les signaux d''alerte

Le manager n''est pas un soignant et ne pose pas de diagnostic. Mais il est le mieux placé pour voir les changements. Les signaux à repérer sont des écarts par rapport au comportement habituel de la personne :

- Au niveau individuel : irritabilité, repli, fatigue visible, erreurs inhabituelles, retards ou absences courtes répétées, présence excessive (arrive plus tôt, part plus tard, ne prend plus de pause), propos de découragement (« je n''y arrive plus », « à quoi bon »), pleurs, plaintes physiques (dos, sommeil, maux de tête).
- Au niveau collectif : absentéisme en hausse, turnover, tensions et conflits, baisse de qualité, silence en réunion, demandes de mutation, accidents.

Un signal isolé ne veut rien dire. Un faisceau de signaux, ou un changement net chez quelqu''un, demande d''agir. Le tableau de bord (absentéisme, heures supplémentaires, reprises) et l''entretien de suivi (temps « ressenti et besoins ») sont les outils de détection.

## Ce qui relève du manager, de l''employeur, du médecin du travail

Cette distinction est essentielle : le manager qui essaie de tout porter seul se met en danger, et met la personne en danger.

Le manager : il organise le travail pour réduire les facteurs de risque (le tableau ci-dessus) ; il repère les signaux ; il écoute la personne, sans creuser dans sa vie privée ni interpréter (« tu fais un burn-out » n''est pas une phrase de manager) ; il agit sur ce qui dépend de lui (charge, horaires, soutien, conflit) ; il oriente vers les bons interlocuteurs ; il alerte sa hiérarchie et les RH quand la situation le dépasse ; il trace ce qu''il a fait.

L''employeur (direction, RH) : il porte l''obligation de sécurité, décide des mesures collectives (effectifs, organisation, moyens), traite les situations graves (harcèlement, violence), met en place le DUERP et le plan de prévention, et répond aux alertes du manager.

Le médecin du travail et le service de prévention et de santé au travail : ils sont les seuls compétents pour évaluer la santé d''une personne et proposer des aménagements ou un arrêt. Tout salarié peut demander une visite au médecin du travail à tout moment, sans passer par l''employeur (art. L4624-1) ; le manager peut le lui rappeler, et l''employeur peut aussi demander une visite. Le médecin du travail est tenu au secret ; il ne dira pas au manager ce qu''a la personne, mais il peut prescrire des aménagements de poste.

Les autres relais : le CSE et sa commission santé, sécurité et conditions de travail dans les entreprises qui en ont ; les représentants du personnel ; l''assistante sociale du travail quand elle existe ; le référent harcèlement ; les services d''écoute mis en place par certaines entreprises ou branches ; et, hors de l''entreprise, le médecin traitant de la personne.

## Que faire face à un salarié en difficulté

1. Le voir, seul, vite : « J''ai remarqué que tu étais moins présent aux pauses et que tu es resté tard trois soirs cette semaine. Je voulais savoir comment tu allais. » Des faits, pas d''interprétation.
2. Écouter (module 3), sans forcer : la personne dit ce qu''elle veut dire. On ne pose pas de question sur sa santé ni sur sa vie privée ; on accueille ce qui vient.
3. Agir sur le travail : qu''est-ce qui, dans le travail, pèse ? Charge, conflit, horaires, manque de moyens ? C''est là que le manager a prise, et c''est souvent là que se trouve une partie de la cause.
4. Orienter : rappeler l''existence du médecin du travail, de la visite à la demande, des relais internes. Proposer, ne pas imposer, sauf danger.
5. Alerter : informer sa hiérarchie ou les RH de la situation (sans détails de santé), pour que les mesures qui dépassent le manager soient prises.
6. Suivre : un point rapproché, et de la constance. La personne doit voir que quelque chose a changé.

Si la personne exprime des idées de mort ou de mise en danger, on ne reste pas seul : on reste avec elle, on contacte immédiatement le médecin du travail, les secours (15) ou le 3114 (numéro national de prévention du suicide, gratuit, 24 h/24), et on informe l''employeur. Ce n''est pas trahir une confidence ; c''est protéger.

## Le manager lui-même

Le manager de proximité est l''une des populations les plus exposées aux RPS : pris entre la hiérarchie et l''équipe, chargé de faire appliquer ce qu''il ne décide pas, souvent sans formation ni soutien. Les mêmes signaux valent pour lui. Les mêmes relais aussi. Et un manager épuisé manage mal : dire à sa hiérarchie que la charge n''est pas tenable, comme au podcast 3.8, est un acte de management, pas un aveu de faiblesse.

## Le cas Garnier

Thierry, depuis un mois, arrive plus tôt, ne prend plus sa pause, a fait une erreur inhabituelle de commande, et a eu un accrochage sec avec Sophie. Karim le voit un mardi, dans le bureau. Faits, écoute. Thierry finit par dire qu''il a « la tête ailleurs », sans plus ; qu''il en a assez de « faire le contremaître sans le titre » ; et que les cadences depuis la nouvelle organisation le fatiguent. Karim n''interprète pas. Il agit sur le travail : le rôle de référent qualité de Thierry sera formalisé et reconnu (en entretien de parcours avec Michel), le contrôle des finitions est réparti avec Karim les jours chargés, et Karim rappelle que Thierry peut voir le médecin du travail s''il le souhaite, sans passer par personne. Il informe Michel qu''il a une inquiétude sur la charge de Thierry, sans plus. Point dans dix jours. Ce que Thierry a « ailleurs » ne regarde pas Karim, sauf si Thierry choisit de lui en parler.

## À retenir

- Les RPS viennent de l''organisation du travail, pas de la fragilité des personnes ; l''employeur a une obligation de sécurité (L4121-1), le manager en est l''acteur quotidien.
- Six familles de facteurs (Gollac) : intensité, exigences émotionnelles, autonomie, rapports sociaux, conflits de valeurs, insécurité ; chacune renvoie à une décision du manager.
- Repérer les changements de comportement, individuels et collectifs, avec le tableau de bord et l''entretien de suivi.
- Le manager repère, écoute, agit sur le travail, oriente, alerte, suit ; il ne diagnostique pas et ne soigne pas.
- Le médecin du travail est accessible à tout salarié, à sa demande (L4624-1). En cas de danger immédiat : ne pas rester seul, 15 ou 3114.

## Sources

- Code du travail, art. L4121-1 à L4121-3-1, L4122-1, L4624-1.
- INRS, *Risques psychosociaux : 9 conseils pour agir au quotidien*, ED 6250, et dossier « Risques psychosociaux », inrs.fr.
- Michel Gollac, Marceline Bodier (dir.), *Mesurer les facteurs psychosociaux de risque au travail pour les maîtriser*, 2011.
- ANACT, « Prévenir les risques psychosociaux », anact.fr.
- Ministère du Travail, « Risques psychosociaux », travail-emploi.gouv.fr ; 3114.fr.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Les risques psychosociaux (RPS) sont les risques pour la santé mentale, physique et sociale engendrés par les conditions d''emploi et les facteurs organisationnels et relationnels du travail. Stress chronique, épuisement, violences internes (harcèlement, conflits exacerbés) et externes (agressions de clients ou d''usagers) en sont les formes les plus connues. Ils ne relèvent pas de la fragilité des personnes : ils relèvent de l''organisation du travail. C''est pour cela que le manager de proximité, qui organise le travail, est en première ligne pour les prévenir, et aussi pour les produire quand il s''y prend mal.

## Ce que dit la loi

L''employeur a une obligation de sécurité : il doit prendre les mesures nécessaires pour assurer la sécurité et protéger la santé physique et mentale des travailleurs (art. L4121-1). La santé mentale figure dans le texte depuis 2002. Les RPS doivent être évalués dans le document unique d''évaluation des risques professionnels (DUERP, art. L4121-3-1), obligatoire dans toute entreprise dès le premier salarié, et faire l''objet d''actions de prévention selon les principes généraux (L4121-2) : éviter les risques, les combattre à la source, adapter le travail à l''homme, planifier la prévention.

Cette obligation pèse sur l''employeur, pas sur le manager. Mais le manager est celui par qui l''employeur agit : ses décisions d''organisation sont des mesures de prévention, ou des facteurs de risque. Et il a, comme tout salarié, l''obligation de prendre soin de sa santé et de celle des autres (L4122-1).

## Les six familles de facteurs de risque

Le rapport du collège d''expertise présidé par Michel Gollac (2011), référence en France, classe les facteurs de RPS en six familles. Elles sont utiles au manager parce que chacune renvoie à une décision d''organisation qu''il prend, ou pas.

| Famille | Ce dont il s''agit | Ce que le manager peut faire |
|---|---|---|
| Intensité et temps de travail | Charge, rythme, délais, interruptions, horaires, heures supplémentaires | Réguler la charge, prioriser, protéger les repos (leçon 4.6) |
| Exigences émotionnelles | Contact avec le public, clients difficiles, devoir cacher ses émotions, contact avec la souffrance | Ne pas laisser seul face au client agressif, débriefer, former |
| Autonomie insuffisante | Pas de marge sur la manière de faire, pas de participation aux décisions, compétences sous-utilisées | Déléguer, consulter, laisser choisir la méthode |
| Rapports sociaux dégradés | Manque de soutien du manager ou des collègues, manque de reconnaissance, injustice, violence, harcèlement | Écoute, feedback, reconnaissance, équité, limites (modules 3 et 4) |
| Conflits de valeurs | Devoir faire un travail qu''on désapprouve, travail « bâclé » faute de moyens, sentiment d''inutilité | Donner les moyens de faire du travail de qualité, expliquer le sens |
| Insécurité de la situation de travail | Peur de perdre son emploi, changements non maîtrisés, incertitude sur l''avenir | Informer, accompagner le changement (module 6) |

Un manager qui relit ce tableau y retrouve tout le contenu de cette formation. Ce n''est pas un hasard : bien manager, c''est prévenir les RPS.

## Les signaux d''alerte

Le manager n''est pas un soignant et ne pose pas de diagnostic. Mais il est le mieux placé pour voir les changements. Les signaux à repérer sont des écarts par rapport au comportement habituel de la personne :

- Au niveau individuel : irritabilité, repli, fatigue visible, erreurs inhabituelles, retards ou absences courtes répétées, présence excessive (arrive plus tôt, part plus tard, ne prend plus de pause), propos de découragement (« je n''y arrive plus », « à quoi bon »), pleurs, plaintes physiques (dos, sommeil, maux de tête).
- Au niveau collectif : absentéisme en hausse, turnover, tensions et conflits, baisse de qualité, silence en réunion, demandes de mutation, accidents.

Un signal isolé ne veut rien dire. Un faisceau de signaux, ou un changement net chez quelqu''un, demande d''agir. Le tableau de bord (absentéisme, heures supplémentaires, reprises) et l''entretien de suivi (temps « ressenti et besoins ») sont les outils de détection.

## Ce qui relève du manager, de l''employeur, du médecin du travail

Cette distinction est essentielle : le manager qui essaie de tout porter seul se met en danger, et met la personne en danger.

Le manager : il organise le travail pour réduire les facteurs de risque (le tableau ci-dessus) ; il repère les signaux ; il écoute la personne, sans creuser dans sa vie privée ni interpréter (« tu fais un burn-out » n''est pas une phrase de manager) ; il agit sur ce qui dépend de lui (charge, horaires, soutien, conflit) ; il oriente vers les bons interlocuteurs ; il alerte sa hiérarchie et les RH quand la situation le dépasse ; il trace ce qu''il a fait.

L''employeur (direction, RH) : il porte l''obligation de sécurité, décide des mesures collectives (effectifs, organisation, moyens), traite les situations graves (harcèlement, violence), met en place le DUERP et le plan de prévention, et répond aux alertes du manager.

Le médecin du travail et le service de prévention et de santé au travail : ils sont les seuls compétents pour évaluer la santé d''une personne et proposer des aménagements ou un arrêt. Tout salarié peut demander une visite au médecin du travail à tout moment, sans passer par l''employeur (art. L4624-1) ; le manager peut le lui rappeler, et l''employeur peut aussi demander une visite. Le médecin du travail est tenu au secret ; il ne dira pas au manager ce qu''a la personne, mais il peut prescrire des aménagements de poste.

Les autres relais : le CSE et sa commission santé, sécurité et conditions de travail dans les entreprises qui en ont ; les représentants du personnel ; l''assistante sociale du travail quand elle existe ; le référent harcèlement ; les services d''écoute mis en place par certaines entreprises ou branches ; et, hors de l''entreprise, le médecin traitant de la personne.

## Que faire face à un salarié en difficulté

1. Le voir, seul, vite : « J''ai remarqué que tu étais moins présent aux pauses et que tu es resté tard trois soirs cette semaine. Je voulais savoir comment tu allais. » Des faits, pas d''interprétation.
2. Écouter (module 3), sans forcer : la personne dit ce qu''elle veut dire. On ne pose pas de question sur sa santé ni sur sa vie privée ; on accueille ce qui vient.
3. Agir sur le travail : qu''est-ce qui, dans le travail, pèse ? Charge, conflit, horaires, manque de moyens ? C''est là que le manager a prise, et c''est souvent là que se trouve une partie de la cause.
4. Orienter : rappeler l''existence du médecin du travail, de la visite à la demande, des relais internes. Proposer, ne pas imposer, sauf danger.
5. Alerter : informer sa hiérarchie ou les RH de la situation (sans détails de santé), pour que les mesures qui dépassent le manager soient prises.
6. Suivre : un point rapproché, et de la constance. La personne doit voir que quelque chose a changé.

Si la personne exprime des idées de mort ou de mise en danger, on ne reste pas seul : on reste avec elle, on contacte immédiatement le médecin du travail, les secours (15) ou le 3114 (numéro national de prévention du suicide, gratuit, 24 h/24), et on informe l''employeur. Ce n''est pas trahir une confidence ; c''est protéger.

## Le manager lui-même

Le manager de proximité est l''une des populations les plus exposées aux RPS : pris entre la hiérarchie et l''équipe, chargé de faire appliquer ce qu''il ne décide pas, souvent sans formation ni soutien. Les mêmes signaux valent pour lui. Les mêmes relais aussi. Et un manager épuisé manage mal : dire à sa hiérarchie que la charge n''est pas tenable, comme au podcast 3.8, est un acte de management, pas un aveu de faiblesse.

## Le cas Garnier

Thierry, depuis un mois, arrive plus tôt, ne prend plus sa pause, a fait une erreur inhabituelle de commande, et a eu un accrochage sec avec Sophie. Karim le voit un mardi, dans le bureau. Faits, écoute. Thierry finit par dire qu''il a « la tête ailleurs », sans plus ; qu''il en a assez de « faire le contremaître sans le titre » ; et que les cadences depuis la nouvelle organisation le fatiguent. Karim n''interprète pas. Il agit sur le travail : le rôle de référent qualité de Thierry sera formalisé et reconnu (en entretien de parcours avec Michel), le contrôle des finitions est réparti avec Karim les jours chargés, et Karim rappelle que Thierry peut voir le médecin du travail s''il le souhaite, sans passer par personne. Il informe Michel qu''il a une inquiétude sur la charge de Thierry, sans plus. Point dans dix jours. Ce que Thierry a « ailleurs » ne regarde pas Karim, sauf si Thierry choisit de lui en parler.

## À retenir

- Les RPS viennent de l''organisation du travail, pas de la fragilité des personnes ; l''employeur a une obligation de sécurité (L4121-1), le manager en est l''acteur quotidien.
- Six familles de facteurs (Gollac) : intensité, exigences émotionnelles, autonomie, rapports sociaux, conflits de valeurs, insécurité ; chacune renvoie à une décision du manager.
- Repérer les changements de comportement, individuels et collectifs, avec le tableau de bord et l''entretien de suivi.
- Le manager repère, écoute, agit sur le travail, oriente, alerte, suit ; il ne diagnostique pas et ne soigne pas.
- Le médecin du travail est accessible à tout salarié, à sa demande (L4624-1). En cas de danger immédiat : ne pas rester seul, 15 ou 3114.

## Sources

- Code du travail, art. L4121-1 à L4121-3-1, L4122-1, L4624-1.
- INRS, *Risques psychosociaux : 9 conseils pour agir au quotidien*, ED 6250, et dossier « Risques psychosociaux », inrs.fr.
- Michel Gollac, Marceline Bodier (dir.), *Mesurer les facteurs psychosociaux de risque au travail pour les maîtriser*, 2011.
- ANACT, « Prévenir les risques psychosociaux », anact.fr.
- Ministère du Travail, « Risques psychosociaux », travail-emploi.gouv.fr ; 3114.fr.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 5 and l.ordre = 7;
  n := n + 1;

  -- 4.8-podcast-securite-psychologique.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Format : conversation à deux voix. **CLAIRE** = animatrice IDEAFORMA. **HÉLÈNE** = responsable d''un service de production en agroalimentaire (18 opérateurs, deux équipes), en poste depuis cinq ans après avoir été conductrice de ligne (personnage fictif). Débit : 150 mots/min.
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

**CLAIRE** — Bonjour à tous. Aujourd''hui on parle de sécurité psychologique, c''est-à-dire de ce qui fait qu''une équipe ose parler, ou se tait. Hélène, vous dirigez un service de production, dix-huit personnes, depuis cinq ans. Vous m''avez dit avant l''enregistrement qu''il y avait eu un « avant » et un « après ». Qu''est-ce qui s''est passé ?

**HÉLÈNE** — Il s''est passé un lot de deux tonnes de produit parti chez un client avec un défaut d''étiquetage. Allergènes manquants. Rappel de produit, pénalités, et une semaine à répondre au service qualité du client. Et quand on a fait l''enquête, on a découvert que deux opérateurs avaient vu le problème sur la ligne. Deux. Et qu''aucun n''avait rien dit.

**CLAIRE** — Pourquoi ?

**HÉLÈNE** — C''est la question que je leur ai posée, et la réponse m''a fait mal. L''un m''a dit : « La dernière fois que j''ai arrêté la ligne, on m''a dit que j''avais fait perdre une heure de production. » L''autre m''a dit : « Je me suis dit que ce n''était pas à moi de le dire. » Et le « on », c''était moi. Je ne m''en souvenais même pas. Une remarque en passant, six mois plus tôt, sur un arrêt de ligne que j''avais trouvé injustifié.

**CLAIRE** — Une remarque.

**HÉLÈNE** — Une remarque. Et six mois plus tard, deux tonnes de produit. C''est ça que j''ai compris ce jour-là : ce que je dis, en tant que responsable, ça ne pèse pas le poids que je crois. Ça pèse dix fois plus. Une remarque sèche sur un arrêt de ligne, ça devient une règle : « ici, on n''arrête pas la ligne ». Même si je n''ai jamais dit ça.

**CLAIRE** — C''est exactement ce que décrit Amy Edmondson, la chercheuse qui a théorisé la sécurité psychologique. Les gens font un calcul, souvent inconscient : est-ce que je risque quelque chose si je parle ? Et si la réponse est oui, ils se taisent. Même quand l''enjeu est grave.

**HÉLÈNE** — Surtout quand l''enjeu est grave, en fait. Parce que plus l''enjeu est grave, plus la peur de se tromper est grande. « Et si j''arrête la ligne pour rien ? » Alors on laisse passer, en espérant que quelqu''un d''autre verra.

**CLAIRE** — Qu''est-ce que vous avez fait, après le rappel ?

**HÉLÈNE** — La première chose, c''est que j''ai failli faire l''inverse de ce qu''il fallait. Mon réflexe, c''était de sanctionner les deux qui n''avaient rien dit. Mon directeur voulait des têtes. Et j''ai compris que si je faisais ça, j''envoyais le message : « Si vous voyez un problème et que vous ne le dites pas, vous êtes punis. Et si vous le dites et que vous vous trompez, vous êtes punis aussi. » Donc personne ne verrait plus jamais rien.

**CLAIRE** — Alors ?

**HÉLÈNE** — Alors j''ai fait une réunion avec les dix-huit. Et j''ai commencé par moi. J''ai dit : « Il y a six mois, j''ai fait une remarque à quelqu''un qui avait arrêté la ligne. J''avais tort. Cette remarque a coûté deux tonnes de produit. Je vous demande pardon, et je vous demande une chose : à partir de maintenant, n''importe qui, n''importe quand, peut arrêter la ligne s''il a un doute. Un arrêt pour rien, ça coûte une heure. Un arrêt qu''on n''a pas fait, ça coûte ce qu''on vient de vivre. »

**CLAIRE** — Vous avez commencé par reconnaître votre erreur.

**HÉLÈNE** — Je n''avais pas le choix. Si je leur avais demandé d''admettre leurs erreurs sans admettre la mienne, personne ne m''aurait crue. Et honnêtement, ça a été le moment le plus difficile de ma carrière. Dire devant dix-huit personnes « j''ai eu tort et ça a coûté cher ». Mais c''est le moment où tout a changé.

**CLAIRE** — Comment vous l''avez vu changer ?

**HÉLÈNE** — Pas tout de suite. Les gens ne vous croient pas sur une déclaration. Ils attendent de voir ce que vous faites la première fois que quelqu''un vous prend au mot. Et ça a pris trois semaines. Un opérateur, Bastien, a arrêté la ligne pour une soudure de sachet qu''il trouvait bizarre. On a vérifié. Elle était bonne. Une demi-heure de perdue.

**CLAIRE** — Et vous avez réagi comment ?

**HÉLÈNE** — Devant tout le monde, au briefing du lendemain : « Bastien a arrêté la ligne hier pour une soudure. Elle était bonne. C''est exactement ce que je vous ai demandé. Merci Bastien. » Et là, j''ai vu les têtes. Ils m''ont regardée comme si je venais de dire quelque chose d''incroyable. Parce que pendant des années, un arrêt pour rien, c''était un reproche.

**CLAIRE** — C''est ce qu''Edmondson appelle « réagir de façon productive ». Le moment où quelqu''un prend un risque, la réaction du chef dans les secondes qui suivent fixe la règle pour tout le monde.

**HÉLÈNE** — Et il faut le refaire à chaque fois. Pas une fois. Parce qu''une seule réaction agacée, un seul soupir, et vous êtes revenu six mois en arrière. J''ai dû apprendre à contrôler mon visage. Ça paraît bête, mais quand quelqu''un vient vous dire qu''il a fait une erreur, la première chose qu''il regarde, c''est votre visage.

**CLAIRE** — Parlons justement de l''erreur. Beaucoup de managers qui nous écoutent se disent : « Si j''accepte les erreurs, je vais avoir du laxisme. » Qu''est-ce que vous leur répondez ?

**HÉLÈNE** — Que c''est la confusion la plus répandue et la plus dangereuse. Le droit à l''erreur, ce n''est pas le droit à la négligence. Je fais trois catégories, et je les ai expliquées à l''équipe. L''erreur d''apprentissage : tu fais quelque chose de nouveau, tu te trompes, c''est normal, on en tire les leçons. L''erreur d''inattention : tu savais faire, tu as fait une faute, ça arrive, on regarde pourquoi, et s''il y a une cause dans l''organisation on la traite, et si ça se répète on en parle sérieusement. Et la faute délibérée : tu as contourné une règle en le sachant, là ce n''est plus une erreur, et ça se traite avec les moyens du chapitre suivant de votre formation, le recadrage, la sanction.

**CLAIRE** — Et la différence, l''équipe la comprend ?

**HÉLÈNE** — Très bien, parce qu''elle est juste. Ce qui n''était pas juste avant, c''était de traiter les trois de la même manière : par la remarque humiliante. Ce qui ne serait pas juste non plus, c''est de ne rien dire dans les trois cas. La sécurité psychologique, ce n''est pas l''absence d''exigence. Edmondson le dit très bien : il faut les deux. La sécurité sans l''exigence, c''est une colonie de vacances. L''exigence sans la sécurité, c''est ce que j''avais : une usine où tout le monde a peur et où les problèmes se cachent.

**CLAIRE** — Vous avez parlé de la réaction aux erreurs. Il y a d''autres choses que vous avez changées ?

**HÉLÈNE** — Trois choses. La première, je pose des questions. Avant, j''arrivais au briefing avec des consignes. Maintenant, j''arrive avec une question : « Qu''est-ce qui a failli mal tourner hier ? » Les premières semaines, silence. Puis les réponses sont venues. Et ce sont des mines d''or : chaque « ça a failli » est un accident qu''on évite.

**CLAIRE** — La deuxième ?

**HÉLÈNE** — J''ai arrêté de laisser passer les moqueries. Il y avait dans l''équipe une habitude de charrier, gentiment en apparence, celui qui posait une question « bête ». « Alors, t''as pas encore compris ? » Je trouvais ça inoffensif. Ce n''est pas inoffensif : celui qui s''est fait charrier ne pose plus de question. Maintenant, je dis, calmement, devant tout le monde : « Il n''y a pas de question bête ici. » Et je réponds à la question. Trois fois, et l''habitude a disparu.

**CLAIRE** — Et la troisième ?

**HÉLÈNE** — Je dis quand je ne sais pas. « Je ne sais pas, je vais me renseigner. » Avant, je pensais que le chef devait tout savoir. En fait, un chef qui sait tout, c''est un chef à qui personne n''ose rien apprendre. Depuis que je dis « je ne sais pas », les opérateurs m''expliquent des choses sur les machines que je n''avais jamais comprises.

**CLAIRE** — Vous avez un exemple de quelque chose qui est remonté grâce à ça et qui n''aurait jamais remonté avant ?

**HÉLÈNE** — Plein. Mais le plus marquant, c''est une opératrice, Sonia, qui est venue me dire qu''elle n''y arrivait plus. Qu''elle était épuisée, qu''elle faisait des erreurs, qu''elle avait peur qu''on s''en aperçoive. Avant, elle aurait tenu jusqu''à l''arrêt maladie, ou jusqu''à l''accident. Là, elle est venue. Je n''ai pas joué au médecin, je lui ai dit qu''elle pouvait voir le médecin du travail, j''ai regardé son poste et sa charge, et on a trouvé qu''elle absorbait seule tous les changements de format parce qu''elle était la seule à savoir les faire. On a formé deux autres personnes. Elle va bien. Et elle est restée.

**CLAIRE** — C''est un bon exemple du lien entre sécurité psychologique et prévention des risques psychosociaux.

**HÉLÈNE** — C''est le même sujet. Une équipe qui ose parler, c''est une équipe où les problèmes se voient avant qu''ils ne deviennent des drames. Que ce soit un défaut d''étiquetage ou une personne qui s''épuise.

**CLAIRE** — Est-ce que ça a eu un effet sur les chiffres ?

**HÉLÈNE** — Le nombre d''arrêts de ligne a augmenté. Mon directeur a d''abord tiqué. Et puis le nombre de non-conformités chez les clients a baissé, nettement, et l''absentéisme aussi. Je ne vais pas vous donner de pourcentages, ce sont les chiffres de mon usine, mais la tendance était claire au bout d''un an. Et j''ai pu lui montrer que les arrêts de ligne, c''était le prix des non-conformités qu''on n''avait plus.

**CLAIRE** — Vous avez dit que votre directeur voulait des têtes après le rappel. Comment vous l''avez convaincu de ne pas sanctionner ?

**HÉLÈNE** — Avec des faits et une question. Je lui ai dit : « Si on sanctionne les deux qui n''ont rien dit, qu''est-ce que les seize autres vont retenir ? » Il a réfléchi. Et je lui ai proposé : « Donnez-moi six mois avec ma méthode. Si le nombre de signalements n''augmente pas, on reparle de sanctions. » Il a accepté. C''est ce qu''on vous apprend sur la communication vers le haut : pas un non, un « oui à ces conditions ».

**CLAIRE** — Pour terminer, si un manager nous écoute et se dit « mon équipe se tait », par quoi il commence ?

**HÉLÈNE** — Par lui. Par regarder ce qu''il a fait, ou ce que son prédécesseur a fait, la dernière fois que quelqu''un a signalé un problème, admis une erreur, ou dit qu''il n''était pas d''accord. La réponse est là. Ensuite, admettre une erreur devant l''équipe, une vraie. Ensuite, poser une question à chaque briefing et attendre la réponse, sans la donner soi-même. Ensuite, remercier la première personne qui prend un risque, devant tout le monde, même si elle s''est trompée. Et ensuite, tenir. Des mois. Parce que la confiance se construit à la vitesse d''un escargot et se détruit à la vitesse d''un claquement de porte.

**CLAIRE** — Merci Hélène.

**HÉLÈNE** — Merci à vous.

**CLAIRE** — Dans la fiche outil qui suit, vous trouverez le gabarit du plan de développement individuel et la check-list d''intégration. Et dans le carnet de bord, vous ferez le diagnostic de sécurité psychologique de votre propre équipe.

---

Sources : Amy Edmondson, « Psychological Safety and Learning Behavior in Work Teams » (1999) et *The Fearless Organization* (2018) ; Google re:Work, projet Aristotle (2015) ; INRS, dossier « Risques psychosociaux ».
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Format : conversation à deux voix. **CLAIRE** = animatrice IDEAFORMA. **HÉLÈNE** = responsable d''un service de production en agroalimentaire (18 opérateurs, deux équipes), en poste depuis cinq ans après avoir été conductrice de ligne (personnage fictif). Débit : 150 mots/min.
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

**CLAIRE** — Bonjour à tous. Aujourd''hui on parle de sécurité psychologique, c''est-à-dire de ce qui fait qu''une équipe ose parler, ou se tait. Hélène, vous dirigez un service de production, dix-huit personnes, depuis cinq ans. Vous m''avez dit avant l''enregistrement qu''il y avait eu un « avant » et un « après ». Qu''est-ce qui s''est passé ?

**HÉLÈNE** — Il s''est passé un lot de deux tonnes de produit parti chez un client avec un défaut d''étiquetage. Allergènes manquants. Rappel de produit, pénalités, et une semaine à répondre au service qualité du client. Et quand on a fait l''enquête, on a découvert que deux opérateurs avaient vu le problème sur la ligne. Deux. Et qu''aucun n''avait rien dit.

**CLAIRE** — Pourquoi ?

**HÉLÈNE** — C''est la question que je leur ai posée, et la réponse m''a fait mal. L''un m''a dit : « La dernière fois que j''ai arrêté la ligne, on m''a dit que j''avais fait perdre une heure de production. » L''autre m''a dit : « Je me suis dit que ce n''était pas à moi de le dire. » Et le « on », c''était moi. Je ne m''en souvenais même pas. Une remarque en passant, six mois plus tôt, sur un arrêt de ligne que j''avais trouvé injustifié.

**CLAIRE** — Une remarque.

**HÉLÈNE** — Une remarque. Et six mois plus tard, deux tonnes de produit. C''est ça que j''ai compris ce jour-là : ce que je dis, en tant que responsable, ça ne pèse pas le poids que je crois. Ça pèse dix fois plus. Une remarque sèche sur un arrêt de ligne, ça devient une règle : « ici, on n''arrête pas la ligne ». Même si je n''ai jamais dit ça.

**CLAIRE** — C''est exactement ce que décrit Amy Edmondson, la chercheuse qui a théorisé la sécurité psychologique. Les gens font un calcul, souvent inconscient : est-ce que je risque quelque chose si je parle ? Et si la réponse est oui, ils se taisent. Même quand l''enjeu est grave.

**HÉLÈNE** — Surtout quand l''enjeu est grave, en fait. Parce que plus l''enjeu est grave, plus la peur de se tromper est grande. « Et si j''arrête la ligne pour rien ? » Alors on laisse passer, en espérant que quelqu''un d''autre verra.

**CLAIRE** — Qu''est-ce que vous avez fait, après le rappel ?

**HÉLÈNE** — La première chose, c''est que j''ai failli faire l''inverse de ce qu''il fallait. Mon réflexe, c''était de sanctionner les deux qui n''avaient rien dit. Mon directeur voulait des têtes. Et j''ai compris que si je faisais ça, j''envoyais le message : « Si vous voyez un problème et que vous ne le dites pas, vous êtes punis. Et si vous le dites et que vous vous trompez, vous êtes punis aussi. » Donc personne ne verrait plus jamais rien.

**CLAIRE** — Alors ?

**HÉLÈNE** — Alors j''ai fait une réunion avec les dix-huit. Et j''ai commencé par moi. J''ai dit : « Il y a six mois, j''ai fait une remarque à quelqu''un qui avait arrêté la ligne. J''avais tort. Cette remarque a coûté deux tonnes de produit. Je vous demande pardon, et je vous demande une chose : à partir de maintenant, n''importe qui, n''importe quand, peut arrêter la ligne s''il a un doute. Un arrêt pour rien, ça coûte une heure. Un arrêt qu''on n''a pas fait, ça coûte ce qu''on vient de vivre. »

**CLAIRE** — Vous avez commencé par reconnaître votre erreur.

**HÉLÈNE** — Je n''avais pas le choix. Si je leur avais demandé d''admettre leurs erreurs sans admettre la mienne, personne ne m''aurait crue. Et honnêtement, ça a été le moment le plus difficile de ma carrière. Dire devant dix-huit personnes « j''ai eu tort et ça a coûté cher ». Mais c''est le moment où tout a changé.

**CLAIRE** — Comment vous l''avez vu changer ?

**HÉLÈNE** — Pas tout de suite. Les gens ne vous croient pas sur une déclaration. Ils attendent de voir ce que vous faites la première fois que quelqu''un vous prend au mot. Et ça a pris trois semaines. Un opérateur, Bastien, a arrêté la ligne pour une soudure de sachet qu''il trouvait bizarre. On a vérifié. Elle était bonne. Une demi-heure de perdue.

**CLAIRE** — Et vous avez réagi comment ?

**HÉLÈNE** — Devant tout le monde, au briefing du lendemain : « Bastien a arrêté la ligne hier pour une soudure. Elle était bonne. C''est exactement ce que je vous ai demandé. Merci Bastien. » Et là, j''ai vu les têtes. Ils m''ont regardée comme si je venais de dire quelque chose d''incroyable. Parce que pendant des années, un arrêt pour rien, c''était un reproche.

**CLAIRE** — C''est ce qu''Edmondson appelle « réagir de façon productive ». Le moment où quelqu''un prend un risque, la réaction du chef dans les secondes qui suivent fixe la règle pour tout le monde.

**HÉLÈNE** — Et il faut le refaire à chaque fois. Pas une fois. Parce qu''une seule réaction agacée, un seul soupir, et vous êtes revenu six mois en arrière. J''ai dû apprendre à contrôler mon visage. Ça paraît bête, mais quand quelqu''un vient vous dire qu''il a fait une erreur, la première chose qu''il regarde, c''est votre visage.

**CLAIRE** — Parlons justement de l''erreur. Beaucoup de managers qui nous écoutent se disent : « Si j''accepte les erreurs, je vais avoir du laxisme. » Qu''est-ce que vous leur répondez ?

**HÉLÈNE** — Que c''est la confusion la plus répandue et la plus dangereuse. Le droit à l''erreur, ce n''est pas le droit à la négligence. Je fais trois catégories, et je les ai expliquées à l''équipe. L''erreur d''apprentissage : tu fais quelque chose de nouveau, tu te trompes, c''est normal, on en tire les leçons. L''erreur d''inattention : tu savais faire, tu as fait une faute, ça arrive, on regarde pourquoi, et s''il y a une cause dans l''organisation on la traite, et si ça se répète on en parle sérieusement. Et la faute délibérée : tu as contourné une règle en le sachant, là ce n''est plus une erreur, et ça se traite avec les moyens du chapitre suivant de votre formation, le recadrage, la sanction.

**CLAIRE** — Et la différence, l''équipe la comprend ?

**HÉLÈNE** — Très bien, parce qu''elle est juste. Ce qui n''était pas juste avant, c''était de traiter les trois de la même manière : par la remarque humiliante. Ce qui ne serait pas juste non plus, c''est de ne rien dire dans les trois cas. La sécurité psychologique, ce n''est pas l''absence d''exigence. Edmondson le dit très bien : il faut les deux. La sécurité sans l''exigence, c''est une colonie de vacances. L''exigence sans la sécurité, c''est ce que j''avais : une usine où tout le monde a peur et où les problèmes se cachent.

**CLAIRE** — Vous avez parlé de la réaction aux erreurs. Il y a d''autres choses que vous avez changées ?

**HÉLÈNE** — Trois choses. La première, je pose des questions. Avant, j''arrivais au briefing avec des consignes. Maintenant, j''arrive avec une question : « Qu''est-ce qui a failli mal tourner hier ? » Les premières semaines, silence. Puis les réponses sont venues. Et ce sont des mines d''or : chaque « ça a failli » est un accident qu''on évite.

**CLAIRE** — La deuxième ?

**HÉLÈNE** — J''ai arrêté de laisser passer les moqueries. Il y avait dans l''équipe une habitude de charrier, gentiment en apparence, celui qui posait une question « bête ». « Alors, t''as pas encore compris ? » Je trouvais ça inoffensif. Ce n''est pas inoffensif : celui qui s''est fait charrier ne pose plus de question. Maintenant, je dis, calmement, devant tout le monde : « Il n''y a pas de question bête ici. » Et je réponds à la question. Trois fois, et l''habitude a disparu.

**CLAIRE** — Et la troisième ?

**HÉLÈNE** — Je dis quand je ne sais pas. « Je ne sais pas, je vais me renseigner. » Avant, je pensais que le chef devait tout savoir. En fait, un chef qui sait tout, c''est un chef à qui personne n''ose rien apprendre. Depuis que je dis « je ne sais pas », les opérateurs m''expliquent des choses sur les machines que je n''avais jamais comprises.

**CLAIRE** — Vous avez un exemple de quelque chose qui est remonté grâce à ça et qui n''aurait jamais remonté avant ?

**HÉLÈNE** — Plein. Mais le plus marquant, c''est une opératrice, Sonia, qui est venue me dire qu''elle n''y arrivait plus. Qu''elle était épuisée, qu''elle faisait des erreurs, qu''elle avait peur qu''on s''en aperçoive. Avant, elle aurait tenu jusqu''à l''arrêt maladie, ou jusqu''à l''accident. Là, elle est venue. Je n''ai pas joué au médecin, je lui ai dit qu''elle pouvait voir le médecin du travail, j''ai regardé son poste et sa charge, et on a trouvé qu''elle absorbait seule tous les changements de format parce qu''elle était la seule à savoir les faire. On a formé deux autres personnes. Elle va bien. Et elle est restée.

**CLAIRE** — C''est un bon exemple du lien entre sécurité psychologique et prévention des risques psychosociaux.

**HÉLÈNE** — C''est le même sujet. Une équipe qui ose parler, c''est une équipe où les problèmes se voient avant qu''ils ne deviennent des drames. Que ce soit un défaut d''étiquetage ou une personne qui s''épuise.

**CLAIRE** — Est-ce que ça a eu un effet sur les chiffres ?

**HÉLÈNE** — Le nombre d''arrêts de ligne a augmenté. Mon directeur a d''abord tiqué. Et puis le nombre de non-conformités chez les clients a baissé, nettement, et l''absentéisme aussi. Je ne vais pas vous donner de pourcentages, ce sont les chiffres de mon usine, mais la tendance était claire au bout d''un an. Et j''ai pu lui montrer que les arrêts de ligne, c''était le prix des non-conformités qu''on n''avait plus.

**CLAIRE** — Vous avez dit que votre directeur voulait des têtes après le rappel. Comment vous l''avez convaincu de ne pas sanctionner ?

**HÉLÈNE** — Avec des faits et une question. Je lui ai dit : « Si on sanctionne les deux qui n''ont rien dit, qu''est-ce que les seize autres vont retenir ? » Il a réfléchi. Et je lui ai proposé : « Donnez-moi six mois avec ma méthode. Si le nombre de signalements n''augmente pas, on reparle de sanctions. » Il a accepté. C''est ce qu''on vous apprend sur la communication vers le haut : pas un non, un « oui à ces conditions ».

**CLAIRE** — Pour terminer, si un manager nous écoute et se dit « mon équipe se tait », par quoi il commence ?

**HÉLÈNE** — Par lui. Par regarder ce qu''il a fait, ou ce que son prédécesseur a fait, la dernière fois que quelqu''un a signalé un problème, admis une erreur, ou dit qu''il n''était pas d''accord. La réponse est là. Ensuite, admettre une erreur devant l''équipe, une vraie. Ensuite, poser une question à chaque briefing et attendre la réponse, sans la donner soi-même. Ensuite, remercier la première personne qui prend un risque, devant tout le monde, même si elle s''est trompée. Et ensuite, tenir. Des mois. Parce que la confiance se construit à la vitesse d''un escargot et se détruit à la vitesse d''un claquement de porte.

**CLAIRE** — Merci Hélène.

**HÉLÈNE** — Merci à vous.

**CLAIRE** — Dans la fiche outil qui suit, vous trouverez le gabarit du plan de développement individuel et la check-list d''intégration. Et dans le carnet de bord, vous ferez le diagnostic de sécurité psychologique de votre propre équipe.

---

Sources : Amy Edmondson, « Psychological Safety and Learning Behavior in Work Teams » (1999) et *The Fearless Organization* (2018) ; Google re:Work, projet Aristotle (2015) ; INRS, dossier « Risques psychosociaux ».
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 5 and l.ordre = 8;
  n := n + 1;

  -- 4.9-fiche-pdi-checklist-integration.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Trois gabarits à recopier ou à imprimer (PDF à générer, mise en page IDEAFORMA, fond clair). Ils servent au carnet de bord du module (leçon 4.10) et ensuite au quotidien.

---

## GABARIT 1 — Plan de développement individuel (PDI)

Personne : ____________________ Manager : ____________________ Date : ________ Révision prévue le : ________

Construit en entretien (trame GROW), un objectif de développement à la fois, deux au maximum.

| Rubrique | Contenu |
|---|---|
| Compétence visée (« être capable de… ») | |
| Pourquoi (pour la personne, pour l''équipe) | |
| Niveau actuel (échelle 0-3 de la matrice) et faits qui le montrent | |
| Niveau visé et échéance | |
| Comment saurons-nous que c''est acquis (critère observable) | |

Moyens :

| Moyen | Détail (avec qui, sur quoi) | Quand | Fait |
|---|---|---|---|
| Mise en situation progressive | | | |
| Binôme / tutorat | | | |
| Retour d''expérience | | | |
| Formation interne | | | |
| Formation externe (plan de développement des compétences, OPCO, CPF) | | | |

Engagements :

| Ce que la personne fait | Ce que le manager fait | Prochain point |
|---|---|---|
| | | |

Freins possibles et comment les lever : ____________________

Signatures (personne, manager) : ____________________

---

## GABARIT 2 — Check-list d''intégration d''un nouvel arrivant

Nouvel arrivant : ____________________ Poste : ________ Date d''arrivée : ________ Parrain : ________ Fin de période d''essai : ________

| Quand | Action | Responsable | Fait |
|---|---|---|---|
| Avant l''arrivée | Message de bienvenue du manager (heure, lieu, déroulé, quoi apporter) | Manager | |
| Avant l''arrivée | Poste de travail, outils, tenue et EPI à la taille, accès, badge, casier | Manager / RH | |
| Avant l''arrivée | Équipe prévenue (qui, quand, quel poste) ; parrain désigné et d''accord | Manager | |
| Avant l''arrivée | Programme des deux premières semaines écrit | Manager | |
| Jour 1 | Accueil par le manager, présentation de l''entreprise, de l''équipe (prénoms et rôles), des lieux | Manager | |
| Jour 1 | Formation à la sécurité (L4141-2), tracée | Manager / référent sécurité | |
| Jour 1 | Règles essentielles : horaires, pauses, absences, qui contacter | Manager | |
| Jour 1 | Déjeuner avec le parrain ou l''équipe | Parrain | |
| Jour 1 | Cinq minutes en fin de journée : « Comment ça s''est passé ? Qu''est-ce qui manque ? » | Manager | |
| Semaine 1 | Observation, puis faire avec, puis faire sous contrôle | Parrain | |
| Semaine 1 | Point quotidien court | Parrain / manager | |
| Semaine 1 | Entretien de fin de semaine (30 min) : compris / pas compris / étonnements / suggestions | Manager | |
| Semaine 2 à 4 | Autonomie par paliers ; PDI si nécessaire ; retours fréquents | Manager | |
| Semaine 2 à 4 | Intégration sociale : pauses, tour de table en réunion | Manager / parrain | |
| Mois 1 | Entretien formel (30 min) : acquis, reste à apprendre, ressenti, relation à l''équipe ; point clair sur la période d''essai | Manager | |
| Avant la fin de l''essai | Décision motivée, sans surprise ; si difficultés : attentes précises et délai donnés avant | Manager / employeur | |
| Mois 3 à 12 | Entretien de parcours professionnel dans la première année (L6315-1) | Manager / RH | |

Cas particuliers : apprenti (lien CFA, maître d''apprentissage) ; intérimaire ou CDD court (sécurité, règles, parrain, point jour 1) ; aménagement de poste (mis en place avant l''arrivée, sans divulguer le motif) ; retour après longue absence (ce qui a changé, montée en charge, entretien de parcours).

---

## GABARIT 3 — Diagnostic de sécurité psychologique de mon équipe

À remplir seul et honnêtement, puis, si possible, à proposer à l''équipe de façon anonyme (les sept premières questions sont inspirées de l''échelle d''Edmondson). Réponses de 1 (pas du tout d''accord) à 5 (tout à fait d''accord).

| Question | Ma réponse (1-5) | Réponse moyenne de l''équipe (si sondage) |
|---|---|---|
| Dans cette équipe, si quelqu''un fait une erreur, on ne la lui reproche pas de façon humiliante | | |
| Les membres de l''équipe peuvent soulever des problèmes et des sujets difficiles | | |
| Personne dans l''équipe n''est rejeté parce qu''il est différent | | |
| On peut prendre un risque (proposer, essayer) sans crainte dans cette équipe | | |
| Il est facile de demander de l''aide aux autres membres de l''équipe | | |
| Personne ne cherche délibérément à nuire aux efforts des autres | | |
| Les compétences et talents de chacun sont valorisés et utilisés | | |
| Les questions sont posées en réunion, pas seulement après en aparté | | |
| Les erreurs sont signalées par ceux qui les font, pas découvertes par le client ou le chef | | |
| Les désaccords s''expriment ouvertement | | |

Mes cinq comportements (leçon 4.2), à noter de 1 à 5 :

| Comportement | Note | Un exemple récent | Ce que je change |
|---|---|---|---|
| Je présente le travail comme un apprentissage et je distingue erreur d''apprentissage, d''inattention et faute | | | |
| J''admets mes propres erreurs devant l''équipe | | | |
| Je pose des questions et j''attends les réponses | | | |
| Je réagis de façon productive quand quelqu''un signale, propose ou conteste | | | |
| Je pose des limites (moqueries, mépris, coupures de parole) et je les tiens | | | |

---

## Rappels d''usage

- Un PDI se relit à chaque entretien de suivi ; un PDI oublié dans un tiroir est pire que pas de PDI.
- La check-list d''intégration se prépare la semaine précédant l''arrivée, pas le matin même.
- Le diagnostic de sécurité psychologique se refait tous les six mois ; on regarde la tendance, pas la note.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Trois gabarits à recopier ou à imprimer (PDF à générer, mise en page IDEAFORMA, fond clair). Ils servent au carnet de bord du module (leçon 4.10) et ensuite au quotidien.

---

## GABARIT 1 — Plan de développement individuel (PDI)

Personne : ____________________ Manager : ____________________ Date : ________ Révision prévue le : ________

Construit en entretien (trame GROW), un objectif de développement à la fois, deux au maximum.

| Rubrique | Contenu |
|---|---|
| Compétence visée (« être capable de… ») | |
| Pourquoi (pour la personne, pour l''équipe) | |
| Niveau actuel (échelle 0-3 de la matrice) et faits qui le montrent | |
| Niveau visé et échéance | |
| Comment saurons-nous que c''est acquis (critère observable) | |

Moyens :

| Moyen | Détail (avec qui, sur quoi) | Quand | Fait |
|---|---|---|---|
| Mise en situation progressive | | | |
| Binôme / tutorat | | | |
| Retour d''expérience | | | |
| Formation interne | | | |
| Formation externe (plan de développement des compétences, OPCO, CPF) | | | |

Engagements :

| Ce que la personne fait | Ce que le manager fait | Prochain point |
|---|---|---|
| | | |

Freins possibles et comment les lever : ____________________

Signatures (personne, manager) : ____________________

---

## GABARIT 2 — Check-list d''intégration d''un nouvel arrivant

Nouvel arrivant : ____________________ Poste : ________ Date d''arrivée : ________ Parrain : ________ Fin de période d''essai : ________

| Quand | Action | Responsable | Fait |
|---|---|---|---|
| Avant l''arrivée | Message de bienvenue du manager (heure, lieu, déroulé, quoi apporter) | Manager | |
| Avant l''arrivée | Poste de travail, outils, tenue et EPI à la taille, accès, badge, casier | Manager / RH | |
| Avant l''arrivée | Équipe prévenue (qui, quand, quel poste) ; parrain désigné et d''accord | Manager | |
| Avant l''arrivée | Programme des deux premières semaines écrit | Manager | |
| Jour 1 | Accueil par le manager, présentation de l''entreprise, de l''équipe (prénoms et rôles), des lieux | Manager | |
| Jour 1 | Formation à la sécurité (L4141-2), tracée | Manager / référent sécurité | |
| Jour 1 | Règles essentielles : horaires, pauses, absences, qui contacter | Manager | |
| Jour 1 | Déjeuner avec le parrain ou l''équipe | Parrain | |
| Jour 1 | Cinq minutes en fin de journée : « Comment ça s''est passé ? Qu''est-ce qui manque ? » | Manager | |
| Semaine 1 | Observation, puis faire avec, puis faire sous contrôle | Parrain | |
| Semaine 1 | Point quotidien court | Parrain / manager | |
| Semaine 1 | Entretien de fin de semaine (30 min) : compris / pas compris / étonnements / suggestions | Manager | |
| Semaine 2 à 4 | Autonomie par paliers ; PDI si nécessaire ; retours fréquents | Manager | |
| Semaine 2 à 4 | Intégration sociale : pauses, tour de table en réunion | Manager / parrain | |
| Mois 1 | Entretien formel (30 min) : acquis, reste à apprendre, ressenti, relation à l''équipe ; point clair sur la période d''essai | Manager | |
| Avant la fin de l''essai | Décision motivée, sans surprise ; si difficultés : attentes précises et délai donnés avant | Manager / employeur | |
| Mois 3 à 12 | Entretien de parcours professionnel dans la première année (L6315-1) | Manager / RH | |

Cas particuliers : apprenti (lien CFA, maître d''apprentissage) ; intérimaire ou CDD court (sécurité, règles, parrain, point jour 1) ; aménagement de poste (mis en place avant l''arrivée, sans divulguer le motif) ; retour après longue absence (ce qui a changé, montée en charge, entretien de parcours).

---

## GABARIT 3 — Diagnostic de sécurité psychologique de mon équipe

À remplir seul et honnêtement, puis, si possible, à proposer à l''équipe de façon anonyme (les sept premières questions sont inspirées de l''échelle d''Edmondson). Réponses de 1 (pas du tout d''accord) à 5 (tout à fait d''accord).

| Question | Ma réponse (1-5) | Réponse moyenne de l''équipe (si sondage) |
|---|---|---|
| Dans cette équipe, si quelqu''un fait une erreur, on ne la lui reproche pas de façon humiliante | | |
| Les membres de l''équipe peuvent soulever des problèmes et des sujets difficiles | | |
| Personne dans l''équipe n''est rejeté parce qu''il est différent | | |
| On peut prendre un risque (proposer, essayer) sans crainte dans cette équipe | | |
| Il est facile de demander de l''aide aux autres membres de l''équipe | | |
| Personne ne cherche délibérément à nuire aux efforts des autres | | |
| Les compétences et talents de chacun sont valorisés et utilisés | | |
| Les questions sont posées en réunion, pas seulement après en aparté | | |
| Les erreurs sont signalées par ceux qui les font, pas découvertes par le client ou le chef | | |
| Les désaccords s''expriment ouvertement | | |

Mes cinq comportements (leçon 4.2), à noter de 1 à 5 :

| Comportement | Note | Un exemple récent | Ce que je change |
|---|---|---|---|
| Je présente le travail comme un apprentissage et je distingue erreur d''apprentissage, d''inattention et faute | | | |
| J''admets mes propres erreurs devant l''équipe | | | |
| Je pose des questions et j''attends les réponses | | | |
| Je réagis de façon productive quand quelqu''un signale, propose ou conteste | | | |
| Je pose des limites (moqueries, mépris, coupures de parole) et je les tiens | | | |

---

## Rappels d''usage

- Un PDI se relit à chaque entretien de suivi ; un PDI oublié dans un tiroir est pire que pas de PDI.
- La check-list d''intégration se prépare la semaine précédant l''arrivée, pas le matin même.
- Le diagnostic de sécurité psychologique se refait tous les six mois ; on regarde la tendance, pas la note.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 5 and l.ordre = 9;
  n := n + 1;

  -- 5.1-video-conflit.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Type : vidéo avatar · Débit : 140 mots/min · Indications visuelles entre crochets
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

[Plan : avatar, fond clair. Titre : « Module 5 — Gérer les tensions et les conflits »]

Bienvenue dans le module 5. Nous allons parler de ce que la plupart des managers redoutent le plus : les tensions et les conflits dans l''équipe. Deux personnes qui ne se parlent plus. Un salarié qui conteste chaque consigne. Une équipe coupée en deux clans. Un client qui s''en prend à un salarié.

Commençons par une idée qui va peut-être vous surprendre : le conflit n''est pas le problème. Le problème, c''est ce qu''on en fait.

[Titre : « Conflit de tâche, conflit de relation »]

Il y a deux sortes de conflits, et il est essentiel de les distinguer, parce qu''ils ne se traitent pas de la même façon.

[Schéma : deux colonnes. « Conflit de tâche » : désaccord sur le travail, la méthode, la priorité, la décision. « Conflit de relation » : attaque de la personne, ressentiment, mépris, rivalité.]

Le conflit de tâche, c''est un désaccord sur le travail. Sur la méthode, sur la priorité, sur la décision à prendre. Thierry pense qu''il faut redresser avant de commander la pièce ; Karim pense l''inverse. C''est un conflit de tâche. Et les recherches, notamment celles de Karen Jehn dans les années 1990, montrent qu''un conflit de tâche, s''il reste sur le terrain du travail, est utile. Il fait émerger les désaccords, il évite les décisions prises sans examen, il améliore les solutions. Une équipe sans aucun conflit de tâche est une équipe où l''on ne dit plus rien. Vous avez vu au module 4 ce que cela produit.

Le conflit de relation, c''est autre chose. Ce n''est plus la méthode qui est en cause, c''est la personne. « De toute façon, avec lui, on ne peut pas discuter. » « Elle fait exprès. » Ressentiment, mépris, rivalité, clans. Le conflit de relation est toujours coûteux : il consomme de l''énergie, il détériore la communication, il fait baisser la qualité du travail et il chasse les gens.

Le drame, c''est que le premier se transforme en second si on ne s''en occupe pas. Un désaccord de méthode non traité devient, en quelques semaines, une affaire de personnes. Le rôle du manager est de garder les conflits sur le terrain de la tâche, et de traiter vite ceux qui glissent vers la relation.

[Titre : « L''escalade : les neuf marches de Glasl »]

Friedrich Glasl, chercheur autrichien spécialiste des conflits, a décrit en 1980 comment un conflit s''aggrave. Il a identifié neuf niveaux, qu''on regroupe en trois phases.

[Schéma : un escalier qui descend, neuf marches, trois paliers de couleur.]

Première phase, niveaux 1 à 3 : on peut encore se parler. Les positions se durcissent, les débats deviennent des polémiques, puis on cesse de discuter et on met l''autre devant le fait accompli. Mais chacun pense encore qu''une solution où les deux y gagnent est possible. C''est ici que le manager doit intervenir. C''est ici que c''est facile.

Deuxième phase, niveaux 4 à 6 : on ne cherche plus à résoudre, on cherche à gagner. On recrute des alliés, on attaque la réputation de l''autre, on lui fait perdre la face, on menace. Chacun pense : « l''un de nous deux doit perdre. » Le manager seul n''y suffit plus ; il faut une méthode formelle, souvent un tiers.

Troisième phase, niveaux 7 à 9 : on cherche à nuire, même à ses propres dépens. Sabotage, destruction, « ensemble dans l''abîme ». À ce stade, ce n''est plus de la gestion de conflit ; c''est une procédure disciplinaire, une séparation, parfois un dossier juridique.

Ce que Glasl nous apprend : un conflit ne reste jamais au même niveau. Il descend, marche par marche, tant que personne ne l''arrête. Et plus on attend, plus il est coûteux de remonter.

[Titre : « Le coût de l''évitement »]

Pourquoi les managers attendent-ils ? Par peur d''aggraver, par manque de temps, par espoir que ça passe, par crainte de devoir trancher. L''évitement est la réponse la plus fréquente au conflit, et la plus chère.

Un conflit évité ne disparaît pas. Il s''installe. Il coûte du temps de travail perdu en discussions de couloir, en énergie, en absences. Il coûte de la qualité : deux personnes qui ne se parlent plus ne se transmettent plus l''information, et l''erreur arrive. Il coûte des gens : celui qui se sent seul face à l''autre finit par partir, et c''est rarement le moins bon. Et il coûte l''autorité du manager : une équipe qui voit un conflit durer sans que le chef intervienne conclut que le chef ne protège personne.

[Texte à l''écran : « Un conflit traité au niveau 2 coûte une heure. Au niveau 5, il coûte des semaines. Au niveau 8, il coûte une personne. »]

[Titre : « Ce que ce module vous apprend »]

Ce module vous donne d''abord de quoi comprendre ce qui se joue dans un conflit : ses sources, le piège du triangle dramatique, vos propres biais. Puis de quoi prévenir : un cadre, des règles du jeu, et l''attention aux signaux faibles. Puis une méthode pour résoudre, en cinq étapes, avec la communication non violente et le recours à la médiation. Vous verrez une mise en situation complète en vidéo. Et enfin, les situations difficiles : recadrer, sanctionner, alerter, avec ce que le manager fait et ne fait pas, et ce que dit la loi.

[Plan : reprise du cas]

À l''atelier Garnier, deux tensions couvent. Sophie et Marc ne se parlent plus depuis l''affaire du planning de la Clio : Marc estime que Sophie « balance les urgences sans prévenir », Sophie estime que Marc « fait la tête au lieu de bosser ». Et Thierry, qui a mal vécu l''arrivée d''Amine, laisse entendre à Julien que « le nouveau ne sait pas ce que c''est, un vrai atelier ». Deux conflits, niveau 2 ou 3. Karim a quelques semaines pour agir avant qu''ils ne descendent.

Le conflit n''est pas le problème. L''attente, oui.

À tout de suite pour comprendre ce qui se joue.

[Fondu, logo]

---

Sources : Karen A. Jehn, « A Multimethod Examination of the Benefits and Detriments of Intragroup Conflict », *Administrative Science Quarterly*, 1995 ; Friedrich Glasl, *Konfliktmanagement*, 1980 (11e éd. 2013) ; Kenneth Thomas, Ralph Kilmann, *Thomas-Kilmann Conflict Mode Instrument*, 1974 (sur l''évitement).
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Type : vidéo avatar · Débit : 140 mots/min · Indications visuelles entre crochets
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

[Plan : avatar, fond clair. Titre : « Module 5 — Gérer les tensions et les conflits »]

Bienvenue dans le module 5. Nous allons parler de ce que la plupart des managers redoutent le plus : les tensions et les conflits dans l''équipe. Deux personnes qui ne se parlent plus. Un salarié qui conteste chaque consigne. Une équipe coupée en deux clans. Un client qui s''en prend à un salarié.

Commençons par une idée qui va peut-être vous surprendre : le conflit n''est pas le problème. Le problème, c''est ce qu''on en fait.

[Titre : « Conflit de tâche, conflit de relation »]

Il y a deux sortes de conflits, et il est essentiel de les distinguer, parce qu''ils ne se traitent pas de la même façon.

[Schéma : deux colonnes. « Conflit de tâche » : désaccord sur le travail, la méthode, la priorité, la décision. « Conflit de relation » : attaque de la personne, ressentiment, mépris, rivalité.]

Le conflit de tâche, c''est un désaccord sur le travail. Sur la méthode, sur la priorité, sur la décision à prendre. Thierry pense qu''il faut redresser avant de commander la pièce ; Karim pense l''inverse. C''est un conflit de tâche. Et les recherches, notamment celles de Karen Jehn dans les années 1990, montrent qu''un conflit de tâche, s''il reste sur le terrain du travail, est utile. Il fait émerger les désaccords, il évite les décisions prises sans examen, il améliore les solutions. Une équipe sans aucun conflit de tâche est une équipe où l''on ne dit plus rien. Vous avez vu au module 4 ce que cela produit.

Le conflit de relation, c''est autre chose. Ce n''est plus la méthode qui est en cause, c''est la personne. « De toute façon, avec lui, on ne peut pas discuter. » « Elle fait exprès. » Ressentiment, mépris, rivalité, clans. Le conflit de relation est toujours coûteux : il consomme de l''énergie, il détériore la communication, il fait baisser la qualité du travail et il chasse les gens.

Le drame, c''est que le premier se transforme en second si on ne s''en occupe pas. Un désaccord de méthode non traité devient, en quelques semaines, une affaire de personnes. Le rôle du manager est de garder les conflits sur le terrain de la tâche, et de traiter vite ceux qui glissent vers la relation.

[Titre : « L''escalade : les neuf marches de Glasl »]

Friedrich Glasl, chercheur autrichien spécialiste des conflits, a décrit en 1980 comment un conflit s''aggrave. Il a identifié neuf niveaux, qu''on regroupe en trois phases.

[Schéma : un escalier qui descend, neuf marches, trois paliers de couleur.]

Première phase, niveaux 1 à 3 : on peut encore se parler. Les positions se durcissent, les débats deviennent des polémiques, puis on cesse de discuter et on met l''autre devant le fait accompli. Mais chacun pense encore qu''une solution où les deux y gagnent est possible. C''est ici que le manager doit intervenir. C''est ici que c''est facile.

Deuxième phase, niveaux 4 à 6 : on ne cherche plus à résoudre, on cherche à gagner. On recrute des alliés, on attaque la réputation de l''autre, on lui fait perdre la face, on menace. Chacun pense : « l''un de nous deux doit perdre. » Le manager seul n''y suffit plus ; il faut une méthode formelle, souvent un tiers.

Troisième phase, niveaux 7 à 9 : on cherche à nuire, même à ses propres dépens. Sabotage, destruction, « ensemble dans l''abîme ». À ce stade, ce n''est plus de la gestion de conflit ; c''est une procédure disciplinaire, une séparation, parfois un dossier juridique.

Ce que Glasl nous apprend : un conflit ne reste jamais au même niveau. Il descend, marche par marche, tant que personne ne l''arrête. Et plus on attend, plus il est coûteux de remonter.

[Titre : « Le coût de l''évitement »]

Pourquoi les managers attendent-ils ? Par peur d''aggraver, par manque de temps, par espoir que ça passe, par crainte de devoir trancher. L''évitement est la réponse la plus fréquente au conflit, et la plus chère.

Un conflit évité ne disparaît pas. Il s''installe. Il coûte du temps de travail perdu en discussions de couloir, en énergie, en absences. Il coûte de la qualité : deux personnes qui ne se parlent plus ne se transmettent plus l''information, et l''erreur arrive. Il coûte des gens : celui qui se sent seul face à l''autre finit par partir, et c''est rarement le moins bon. Et il coûte l''autorité du manager : une équipe qui voit un conflit durer sans que le chef intervienne conclut que le chef ne protège personne.

[Texte à l''écran : « Un conflit traité au niveau 2 coûte une heure. Au niveau 5, il coûte des semaines. Au niveau 8, il coûte une personne. »]

[Titre : « Ce que ce module vous apprend »]

Ce module vous donne d''abord de quoi comprendre ce qui se joue dans un conflit : ses sources, le piège du triangle dramatique, vos propres biais. Puis de quoi prévenir : un cadre, des règles du jeu, et l''attention aux signaux faibles. Puis une méthode pour résoudre, en cinq étapes, avec la communication non violente et le recours à la médiation. Vous verrez une mise en situation complète en vidéo. Et enfin, les situations difficiles : recadrer, sanctionner, alerter, avec ce que le manager fait et ne fait pas, et ce que dit la loi.

[Plan : reprise du cas]

À l''atelier Garnier, deux tensions couvent. Sophie et Marc ne se parlent plus depuis l''affaire du planning de la Clio : Marc estime que Sophie « balance les urgences sans prévenir », Sophie estime que Marc « fait la tête au lieu de bosser ». Et Thierry, qui a mal vécu l''arrivée d''Amine, laisse entendre à Julien que « le nouveau ne sait pas ce que c''est, un vrai atelier ». Deux conflits, niveau 2 ou 3. Karim a quelques semaines pour agir avant qu''ils ne descendent.

Le conflit n''est pas le problème. L''attente, oui.

À tout de suite pour comprendre ce qui se joue.

[Fondu, logo]

---

Sources : Karen A. Jehn, « A Multimethod Examination of the Benefits and Detriments of Intragroup Conflict », *Administrative Science Quarterly*, 1995 ; Friedrich Glasl, *Konfliktmanagement*, 1980 (11e éd. 2013) ; Kenneth Thomas, Ralph Kilmann, *Thomas-Kilmann Conflict Mode Instrument*, 1974 (sur l''évitement).
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 6 and l.ordre = 1;
  n := n + 1;

  -- 5.10-quiz.json
  update public.lecons l set contenu = '{"questions": [{"id": "m5q01", "enonce": "Thierry et Karim ne sont pas d''accord sur l''ordre des opérations (redresser avant ou après la commande de pièce). De quel type de conflit s''agit-il, et que faut-il en penser ?", "options": ["Un conflit de relation, à faire cesser immédiatement", "Un conflit de tâche, utile s''il reste sur le terrain du travail", "Une insubordination à sanctionner", "Un signe que Thierry doit changer d''équipe"], "bonnes": [1], "explication": "Le conflit de tâche (désaccord sur le travail) est utile : il évite les décisions non examinées. Le rôle du manager est de l''empêcher de glisser vers un conflit de relation (attaque des personnes)."}, {"id": "m5q02", "enonce": "Dans l''escalier de Glasl, que caractérise la deuxième phase (niveaux 4 à 6) ?", "options": ["On peut encore se parler et chercher une solution où les deux gagnent", "On ne cherche plus à résoudre mais à gagner : alliés, attaques sur la réputation, menaces", "On cherche à nuire à l''autre même à ses propres dépens", "Le conflit s''est éteint de lui-même"], "bonnes": [1], "explication": "Phase 1 (1-3) : on peut encore se parler, c''est là que le manager intervient facilement. Phase 2 (4-6) : chacun pense que l''un doit perdre ; il faut une méthode formelle, souvent un tiers. Phase 3 (7-9) : destruction, registre disciplinaire ou juridique."}, {"id": "m5q03", "enonce": "Devant une tension entre deux personnes, dans quel ordre le manager cherche-t-il la source ?", "options": ["Les personnes d''abord, puis l''organisation", "Les rôles flous et les ressources (organisation), puis les valeurs et manières de faire, et seulement en dernier les personnes", "Uniquement les personnes : un conflit est toujours une affaire de caractère", "Il ne cherche pas la source, il tranche"], "bonnes": [1], "explication": "La cause est le plus souvent dans l''organisation. Traiter les personnes sans traiter la cause, c''est repartir pour un tour."}, {"id": "m5q04", "enonce": "Marc vient se plaindre de Sophie à Karim. Karim décide d''aller « régler ça » avec Sophie à la place de Marc. Dans le triangle de Karpman, quel rôle Karim vient-il de prendre, et quel est le risque ?", "options": ["Le persécuteur : il va sanctionner Sophie", "Le sauveur : Marc reste victime sans rien avoir à faire, Sophie devient persécutrice, et Karim sera le prochain persécuteur dès qu''il ne donnera pas raison à Marc", "La victime : il subit le conflit", "Aucun rôle : c''est la bonne conduite"], "bonnes": [1], "explication": "Sortir du triangle, c''est refuser les trois rôles et ramener chacun à sa responsabilité : « qu''est-ce que tu as dit à Sophie ? »"}, {"id": "m5q05", "enonce": "Plusieurs réponses. Quels sont des signaux faibles d''un conflit naissant ?", "options": ["Deux personnes qui ne se parlent plus que par un tiers ou par écrit", "Le passage du fait au trait de caractère (« elle ne prévient jamais »)", "Un désaccord exprimé ouvertement en réunion sur une méthode", "Des alliances : les mêmes appuient toujours les mêmes, déjeunent toujours ensemble"], "bonnes": [0, 1, 3], "explication": "Un désaccord exprimé ouvertement sur le travail est sain. La communication indirecte, les « toujours / jamais » et les alliances sont les signes d''un conflit qui glisse vers la relation."}, {"id": "m5q06", "enonce": "Quelle est la règle que le manager impose si l''équipe ne la propose pas lors de la construction des règles du jeu ?", "options": ["L''interdiction de tout désaccord", "Le respect des personnes : on peut tout se dire sur le travail, on ne s''attaque pas aux personnes, et pas devant les autres", "L''obligation de déjeuner ensemble", "La priorité aux plus anciens"], "bonnes": [1], "explication": "C''est la ligne que le manager défend sans négociation ; les autres règles (cinq à huit, positives, vérifiables) sont construites avec l''équipe."}, {"id": "m5q07", "enonce": "Dans la méthode en cinq étapes, pourquoi écoute-t-on chaque partie séparément avant de les réunir ?", "options": ["Pour gagner du temps", "Pour pouvoir choisir la version la plus crédible", "Pour entendre chacun sans qu''il rejoue le conflit devant l''autre, et repérer derrière les positions les besoins, qui sont rarement incompatibles", "Parce que la loi l''impose"], "bonnes": [2], "explication": "Réunir tout de suite, c''est faire rejouer le conflit devant le chef. Les positions s''opposent ; les besoins (savoir la veille, être reconnu) peuvent presque toujours être satisfaits ensemble."}, {"id": "m5q08", "enonce": "Quels sont les quatre temps de la communication non violente (Rosenberg) ?", "options": ["Accuser, exiger, menacer, conclure", "Observation sans jugement, sentiment, besoin, demande concrète", "Situation, comportement, impact, sanction", "Écouter, trancher, notifier, sanctionner"], "bonnes": [1], "explication": "« Mardi j''ai appris à 14 h… / j''étais en colère / j''ai besoin de savoir la veille / est-ce que tu peux me dire à 17 h… » : une façon de dire ce qui ne va pas sans attaquer, avec une demande à laquelle l''autre peut répondre."}, {"id": "m5q09", "enonce": "Quand le manager doit-il passer la main à un tiers neutre (RH, médiateur) ?", "options": ["Jamais : un bon manager gère tout seul", "Dès la première pique en réunion", "Quand le conflit a dépassé le niveau 4, quand le manager est lui-même trop impliqué, ou quand la méthode en cinq étapes a échoué", "Uniquement si le salarié le demande par écrit"], "bonnes": [2], "explication": "Passer la main n''est pas un échec : c''est la reconnaissance qu''un conflit installé demande d''autres moyens, et une protection pour le manager et les personnes."}, {"id": "m5q10", "enonce": "Quelle est la différence entre un recadrage et une sanction disciplinaire ?", "options": ["Aucune : ce sont deux mots pour la même chose", "Le recadrage est un acte de management du manager, sans forme légale ; la sanction est un acte de l''employeur, encadré par une procédure (L1332-1 et s.), le règlement intérieur et la prescription de deux mois", "Le recadrage est réservé aux cadres", "La sanction est décidée par le manager de proximité seul, sans procédure"], "bonnes": [1], "explication": "Le manager recadre et trace ; l''employeur sanctionne, avec entretien préalable pour toute sanction ayant une incidence sur la présence, la fonction, la carrière ou la rémunération. Les sanctions pécuniaires sont interdites."}, {"id": "m5q11", "enonce": "Un salarié refuse d''exécuter une consigne. Dans quel cas ce refus n''est-il pas une faute ?", "options": ["Quand il n''est pas d''accord avec la méthode", "Quand la consigne est illégale, expose à un danger grave et imminent (droit de retrait, L4131-1) ou sort du cadre du contrat", "Quand il a plus d''ancienneté que le manager", "Jamais : tout refus est une faute"], "bonnes": [1], "explication": "Face à un refus, le manager demande d''abord la raison. Si c''est un danger ou une illégalité, c''est lui qui a un problème à traiter ; sinon, il recadre et remonte."}, {"id": "m5q12", "enonce": "Nadia signale à Karim qu''un client lui fait des remarques sur son physique et l''a touchée avec insistance. Que fait Karim ?", "options": ["Il lui dit que c''est sûrement un malentendu et qu''il faut relativiser", "Il mène l''enquête lui-même en confrontant Nadia et le client", "Il prend au sérieux, note les faits, informe l''employeur sans délai et par écrit, protège Nadia (ne plus la laisser seule avec ce client), l''oriente vers les relais, garde la confidentialité", "Il en parle à l''équipe pour que tout le monde soit vigilant"], "bonnes": [2], "explication": "L''employeur a l''obligation de prévenir et de faire cesser le harcèlement (L1153-5) ; le manager déclenche cette obligation en informant sans délai. Il n''enquête pas lui-même. La personne qui parle de bonne foi est protégée."}], "seuil": 70, "tentatives_max": 3, "corrections": true, "consigne": "12 questions. Une seule bonne réponse par question, sauf mention « plusieurs réponses ». Seuil de réussite : 70 %."}'::jsonb, publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 6 and l.ordre = 10;
  n := n + 1;

  -- 5.2-comprendre-ce-qui-se-joue.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Avant de résoudre un conflit, il faut comprendre d''où il vient. La plupart des managers se trompent de cause : ils voient deux personnes qui s''affrontent et concluent à un problème de caractère. Or, dans la grande majorité des cas, la cause est dans l''organisation, et les personnes ne font que la révéler. Traiter les personnes sans traiter la cause, c''est repartir pour un tour.

## Les quatre sources de conflit

Les travaux sur les conflits au travail identifient quatre grandes sources, souvent combinées.

Les rôles flous. Quand on ne sait pas qui décide, qui fait, qui est responsable, chacun le décide pour lui-même, et deux personnes se retrouvent à vouloir décider la même chose, ou à attendre que l''autre fasse. C''est la source la plus fréquente, et la moins visible : le conflit entre Sophie et Marc est d''abord un conflit de rôle (qui fixe les priorités de la mécanique ?), pas un conflit de personnes. Le RACI du module 2 est l''outil de prévention.

Les ressources rares. Deux personnes ont besoin du même outil, du même créneau de cabine, du même budget, de la même attention du chef. La rareté crée la rivalité. Le manager qui distribue les ressources sans règle connue fabrique des conflits.

Les valeurs et les manières de faire. « Un vrai carrossier redresse, il ne remplace pas. » « Le client attend, on ne fait pas dans la dentelle. » Des conceptions différentes du bon travail, souvent liées à la génération, à la formation, à l''expérience. Ces conflits sont profonds parce que chacun a le sentiment de défendre quelque chose de juste. Le manager ne tranche pas entre des valeurs ; il fixe la règle de l''atelier (« ici, on fait comme ça, et voilà pourquoi ») et il fait respecter les personnes.

Les personnes. Il arrive que deux personnes ne s''entendent pas, sans autre cause. Histoire ancienne, incompatibilité, jalousie. C''est plus rare qu''on ne le croit, et c''est souvent le résidu d''un conflit de rôle ou de ressource non traité. Le manager n''a pas à faire s''aimer les gens ; il a à faire respecter des règles de comportement qui permettent de travailler ensemble.

Le réflexe utile : devant toute tension, chercher d''abord la source dans l''organisation (rôles, ressources), puis dans les manières de faire, et seulement en dernier dans les personnes.

## Le triangle dramatique

Stephen Karpman, psychiatre américain, a décrit en 1968 un schéma qui se rejoue dans une grande part des conflits : le triangle dramatique, avec trois rôles.

La victime : « ce n''est pas ma faute, on m''en veut, je ne peux rien faire ». Le persécuteur : « c''est de ta faute, tu es nul, tu fais exprès ». Le sauveur : « laisse, je vais m''en occuper, je vais te défendre ».

Trois pièges pour le manager. Le premier : se laisser mettre en position de sauveur. Marc vient se plaindre de Sophie ; Karim, pour bien faire, va « régler ça » avec Sophie, à la place de Marc. Résultat : Sophie devient la persécutrice, Marc reste la victime (il n''a rien eu à faire), et Karim, sauveur, sera le prochain persécuteur dès qu''il ne donnera pas raison à Marc. Le triangle tourne ; personne ne sort.

Le deuxième piège : devenir persécuteur soi-même, en tranchant sur la base d''une seule version. Le troisième : se vivre en victime (« je ne peux rien faire, c''est Michel qui décide, ils sont impossibles ») et ne plus agir.

Sortir du triangle, c''est refuser les trois rôles : ne pas sauver (aider la personne à agir elle-même : « qu''est-ce que tu as dit à Sophie ? »), ne pas persécuter (les faits, pas les jugements), ne pas se plaindre (agir sur ce qui dépend de soi). Et ramener chacun à une position d''adulte responsable : « Vous avez toutes les deux un problème de fonctionnement ; on va le régler ensemble. »

## Les biais du manager en situation de conflit

Vous avez vu au module 3 les biais d''interprétation. En situation de conflit, ils sont décuplés, parce que l''émotion est là.

- Le biais de la première version : celui qui vient se plaindre le premier a un avantage, parce que son récit structure la façon dont le manager voit la situation. Remède : ne jamais conclure avant d''avoir entendu l''autre.
- Le biais d''affinité : on donne raison à celui qu''on apprécie, ou qui nous ressemble. Karim, ancien carrossier, comprend spontanément Thierry mieux que Sophie. Remède : se demander « si c''était l''inverse, que penserais-je ? »
- L''attribution : on explique le comportement de l''autre par sa personnalité (« Marc est susceptible ») et non par la situation (« Marc a découvert trois urgences non prévues cette semaine »). Remède : chercher la situation d''abord.
- La recherche du coupable : le manager veut savoir qui a tort. Or dans la plupart des conflits, les deux ont contribué, et la question utile n''est pas « qui a tort » mais « qu''est-ce qui doit changer ». Remède : remplacer « qui » par « quoi ».
- L''évitement déguisé : « ce n''est pas si grave », « ils sont adultes », « ça va se tasser ». Remède : relire l''escalier de Glasl.
- Le passage en force : trancher vite pour en finir. Une décision imposée sans écoute règle le symptôme et alimente le ressentiment. Remède : la méthode de la leçon 5.4.

## Les émotions dans le conflit

Un conflit n''est jamais seulement rationnel. La colère, la peur, l''humiliation, le sentiment d''injustice sont là, et ils expliquent que des gens raisonnables disent des choses déraisonnables. Le manager ne les nie pas (« calme-toi » est la phrase la plus inefficace du monde) ; il les reconnaît (« je vois que ça te met en colère »), et il attend qu''elles retombent avant de traiter le fond. Un entretien de résolution ne se tient pas à chaud. On sépare, on laisse passer quelques heures ou une nuit, et on reprend.

Le manager a aussi ses émotions : l''agacement, la peur de mal faire, parfois la colère. Les reconnaître pour soi-même (« je suis énervé, je ne vais pas décider maintenant ») évite de les faire payer à l''équipe.

## Le cas Garnier — comprendre avant d''agir

Le conflit Sophie-Marc. Source : un rôle flou (qui fixe les priorités de la mécanique ? le RACI du module 2 ne l''avait pas prévu, parce que Marc n''était pas dans le circuit du planning). Escalade : niveau 3 (ils ne se parlent plus, communiquent par post-it). Triangle : Marc est venu se plaindre à Karim (victime), désignant Sophie (persécutrice) ; Karim a failli aller « régler ça » (sauveur). Biais : Karim, ancien de l''atelier, comprend Marc mieux que Sophie ; il a entendu Marc en premier. Ce que Karim comprend : la cause est organisationnelle, les deux ont contribué (Sophie n''a pas prévenu, Marc a boudé au lieu de le dire), et la solution passera par une règle, pas par un arbitrage entre personnes.

Le conflit Thierry-Amine. Source : des valeurs (la conception du métier) et une ressource (la place de référent, que Thierry sent menacée). Escalade : niveau 2 (polémique, piques devant les autres), avec un début de recrutement d''allié (Julien). Ce que Karim comprend : ce n''est pas Amine le sujet, c''est la reconnaissance de Thierry, déjà repérée au module 4. Traiter Amine serait traiter le symptôme.

## À retenir

- Chercher la source dans l''ordre : rôles flous, ressources rares, valeurs et manières de faire, personnes. La cause est le plus souvent dans l''organisation.
- Le triangle dramatique (Karpman) : victime, persécuteur, sauveur. Le manager n''entre dans aucun des trois rôles et ramène chacun à sa responsabilité.
- Biais du manager : première version, affinité, attribution, recherche du coupable, évitement déguisé, passage en force. Remplacer « qui a tort » par « qu''est-ce qui doit changer ».
- Les émotions se reconnaissent, ne se nient pas ; on ne résout pas à chaud.

## Sources

- Stephen B. Karpman, « Fairy Tales and Script Drama Analysis », *Transactional Analysis Bulletin*, 1968.
- Karen A. Jehn, Elizabeth A. Mannix, « The Dynamic Nature of Conflict », *Academy of Management Journal*, 2001.
- Daniel Kahneman, *Système 1 / Système 2*, Flammarion, 2012.
- ANACT, « Prévenir et gérer les conflits au travail », anact.fr.
- France Compétences, référentiel RS7377, compétence 8.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Avant de résoudre un conflit, il faut comprendre d''où il vient. La plupart des managers se trompent de cause : ils voient deux personnes qui s''affrontent et concluent à un problème de caractère. Or, dans la grande majorité des cas, la cause est dans l''organisation, et les personnes ne font que la révéler. Traiter les personnes sans traiter la cause, c''est repartir pour un tour.

## Les quatre sources de conflit

Les travaux sur les conflits au travail identifient quatre grandes sources, souvent combinées.

Les rôles flous. Quand on ne sait pas qui décide, qui fait, qui est responsable, chacun le décide pour lui-même, et deux personnes se retrouvent à vouloir décider la même chose, ou à attendre que l''autre fasse. C''est la source la plus fréquente, et la moins visible : le conflit entre Sophie et Marc est d''abord un conflit de rôle (qui fixe les priorités de la mécanique ?), pas un conflit de personnes. Le RACI du module 2 est l''outil de prévention.

Les ressources rares. Deux personnes ont besoin du même outil, du même créneau de cabine, du même budget, de la même attention du chef. La rareté crée la rivalité. Le manager qui distribue les ressources sans règle connue fabrique des conflits.

Les valeurs et les manières de faire. « Un vrai carrossier redresse, il ne remplace pas. » « Le client attend, on ne fait pas dans la dentelle. » Des conceptions différentes du bon travail, souvent liées à la génération, à la formation, à l''expérience. Ces conflits sont profonds parce que chacun a le sentiment de défendre quelque chose de juste. Le manager ne tranche pas entre des valeurs ; il fixe la règle de l''atelier (« ici, on fait comme ça, et voilà pourquoi ») et il fait respecter les personnes.

Les personnes. Il arrive que deux personnes ne s''entendent pas, sans autre cause. Histoire ancienne, incompatibilité, jalousie. C''est plus rare qu''on ne le croit, et c''est souvent le résidu d''un conflit de rôle ou de ressource non traité. Le manager n''a pas à faire s''aimer les gens ; il a à faire respecter des règles de comportement qui permettent de travailler ensemble.

Le réflexe utile : devant toute tension, chercher d''abord la source dans l''organisation (rôles, ressources), puis dans les manières de faire, et seulement en dernier dans les personnes.

## Le triangle dramatique

Stephen Karpman, psychiatre américain, a décrit en 1968 un schéma qui se rejoue dans une grande part des conflits : le triangle dramatique, avec trois rôles.

La victime : « ce n''est pas ma faute, on m''en veut, je ne peux rien faire ». Le persécuteur : « c''est de ta faute, tu es nul, tu fais exprès ». Le sauveur : « laisse, je vais m''en occuper, je vais te défendre ».

Trois pièges pour le manager. Le premier : se laisser mettre en position de sauveur. Marc vient se plaindre de Sophie ; Karim, pour bien faire, va « régler ça » avec Sophie, à la place de Marc. Résultat : Sophie devient la persécutrice, Marc reste la victime (il n''a rien eu à faire), et Karim, sauveur, sera le prochain persécuteur dès qu''il ne donnera pas raison à Marc. Le triangle tourne ; personne ne sort.

Le deuxième piège : devenir persécuteur soi-même, en tranchant sur la base d''une seule version. Le troisième : se vivre en victime (« je ne peux rien faire, c''est Michel qui décide, ils sont impossibles ») et ne plus agir.

Sortir du triangle, c''est refuser les trois rôles : ne pas sauver (aider la personne à agir elle-même : « qu''est-ce que tu as dit à Sophie ? »), ne pas persécuter (les faits, pas les jugements), ne pas se plaindre (agir sur ce qui dépend de soi). Et ramener chacun à une position d''adulte responsable : « Vous avez toutes les deux un problème de fonctionnement ; on va le régler ensemble. »

## Les biais du manager en situation de conflit

Vous avez vu au module 3 les biais d''interprétation. En situation de conflit, ils sont décuplés, parce que l''émotion est là.

- Le biais de la première version : celui qui vient se plaindre le premier a un avantage, parce que son récit structure la façon dont le manager voit la situation. Remède : ne jamais conclure avant d''avoir entendu l''autre.
- Le biais d''affinité : on donne raison à celui qu''on apprécie, ou qui nous ressemble. Karim, ancien carrossier, comprend spontanément Thierry mieux que Sophie. Remède : se demander « si c''était l''inverse, que penserais-je ? »
- L''attribution : on explique le comportement de l''autre par sa personnalité (« Marc est susceptible ») et non par la situation (« Marc a découvert trois urgences non prévues cette semaine »). Remède : chercher la situation d''abord.
- La recherche du coupable : le manager veut savoir qui a tort. Or dans la plupart des conflits, les deux ont contribué, et la question utile n''est pas « qui a tort » mais « qu''est-ce qui doit changer ». Remède : remplacer « qui » par « quoi ».
- L''évitement déguisé : « ce n''est pas si grave », « ils sont adultes », « ça va se tasser ». Remède : relire l''escalier de Glasl.
- Le passage en force : trancher vite pour en finir. Une décision imposée sans écoute règle le symptôme et alimente le ressentiment. Remède : la méthode de la leçon 5.4.

## Les émotions dans le conflit

Un conflit n''est jamais seulement rationnel. La colère, la peur, l''humiliation, le sentiment d''injustice sont là, et ils expliquent que des gens raisonnables disent des choses déraisonnables. Le manager ne les nie pas (« calme-toi » est la phrase la plus inefficace du monde) ; il les reconnaît (« je vois que ça te met en colère »), et il attend qu''elles retombent avant de traiter le fond. Un entretien de résolution ne se tient pas à chaud. On sépare, on laisse passer quelques heures ou une nuit, et on reprend.

Le manager a aussi ses émotions : l''agacement, la peur de mal faire, parfois la colère. Les reconnaître pour soi-même (« je suis énervé, je ne vais pas décider maintenant ») évite de les faire payer à l''équipe.

## Le cas Garnier — comprendre avant d''agir

Le conflit Sophie-Marc. Source : un rôle flou (qui fixe les priorités de la mécanique ? le RACI du module 2 ne l''avait pas prévu, parce que Marc n''était pas dans le circuit du planning). Escalade : niveau 3 (ils ne se parlent plus, communiquent par post-it). Triangle : Marc est venu se plaindre à Karim (victime), désignant Sophie (persécutrice) ; Karim a failli aller « régler ça » (sauveur). Biais : Karim, ancien de l''atelier, comprend Marc mieux que Sophie ; il a entendu Marc en premier. Ce que Karim comprend : la cause est organisationnelle, les deux ont contribué (Sophie n''a pas prévenu, Marc a boudé au lieu de le dire), et la solution passera par une règle, pas par un arbitrage entre personnes.

Le conflit Thierry-Amine. Source : des valeurs (la conception du métier) et une ressource (la place de référent, que Thierry sent menacée). Escalade : niveau 2 (polémique, piques devant les autres), avec un début de recrutement d''allié (Julien). Ce que Karim comprend : ce n''est pas Amine le sujet, c''est la reconnaissance de Thierry, déjà repérée au module 4. Traiter Amine serait traiter le symptôme.

## À retenir

- Chercher la source dans l''ordre : rôles flous, ressources rares, valeurs et manières de faire, personnes. La cause est le plus souvent dans l''organisation.
- Le triangle dramatique (Karpman) : victime, persécuteur, sauveur. Le manager n''entre dans aucun des trois rôles et ramène chacun à sa responsabilité.
- Biais du manager : première version, affinité, attribution, recherche du coupable, évitement déguisé, passage en force. Remplacer « qui a tort » par « qu''est-ce qui doit changer ».
- Les émotions se reconnaissent, ne se nient pas ; on ne résout pas à chaud.

## Sources

- Stephen B. Karpman, « Fairy Tales and Script Drama Analysis », *Transactional Analysis Bulletin*, 1968.
- Karen A. Jehn, Elizabeth A. Mannix, « The Dynamic Nature of Conflict », *Academy of Management Journal*, 2001.
- Daniel Kahneman, *Système 1 / Système 2*, Flammarion, 2012.
- ANACT, « Prévenir et gérer les conflits au travail », anact.fr.
- France Compétences, référentiel RS7377, compétence 8.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 6 and l.ordre = 2;
  n := n + 1;

  -- 5.3-prevenir.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'La meilleure gestion de conflit est celle qu''on n''a pas à faire. Une équipe où les rôles sont clairs, où les règles de fonctionnement sont connues et appliquées, où l''on peut dire les désaccords tôt, produit peu de conflits de relation. Cette leçon rassemble ce qui, dans les modules précédents, prévient les conflits, et y ajoute deux outils : les règles du jeu co-construites et les rituels de régulation.

## Le cadre : ce que vous avez déjà

Relisez vos modules avec l''œil de la prévention des conflits :

- Des objectifs clairs (module 2) : quand l''équipe sait où elle va, les désaccords portent sur le chemin, pas sur la destination.
- Des rôles clairs (RACI, module 2) : la première source de conflit, les rôles flous, est traitée à la racine. Chaque fois qu''une tension apparaît, la première question est : « le RACI prévoit-il ce cas ? »
- Des règles de répartition des ressources (module 2 et leçon 4.6) : le planning de la cabine, les heures supplémentaires, les missions intéressantes, distribués selon une règle connue.
- Un feedback rapide (module 3) : un comportement gênant relevé dans les 48 heures ne devient pas un ressentiment.
- Des entretiens de suivi réguliers (module 3) : le temps « ressenti et besoins » fait sortir les tensions à leur début.
- Une réunion où l''on peut parler (module 3) et une sécurité psychologique (module 4) : les désaccords s''expriment en réunion plutôt qu''en clans.
- L''équité (leçon 4.6) : le sentiment d''injustice est le carburant des conflits.

Un manager qui fait tout cela a déjà fait l''essentiel de la prévention.

## Les règles du jeu co-construites

Au-delà des règles de l''entreprise (règlement intérieur, consignes de sécurité), chaque équipe a besoin de règles de fonctionnement propres : comment on se parle, comment on gère les désaccords, comment on se transmet l''information, comment on demande de l''aide, ce qu''on fait quand quelqu''un est en difficulté.

Ces règles sont d''autant mieux respectées qu''elles ont été construites par l''équipe, pas édictées par le manager. La méthode tient en une réunion d''une heure :

1. Le manager pose la question : « Qu''est-ce qui, dans notre façon de fonctionner ensemble, nous fait perdre du temps ou de l''énergie ? » Tour de table, chacun une réponse, sans discussion.
2. On regroupe les réponses par thème (information, entraide, respect, décisions).
3. Pour chaque thème, on formule une règle en une phrase, positive et vérifiable : « Toute urgence est annoncée à voix haute au brief ou à Karim, jamais par post-it » plutôt que « il faut mieux communiquer ».
4. On garde cinq à huit règles, pas vingt. On les affiche.
5. On fixe une date de relecture (trois mois) : « Est-ce qu''on les tient ? Faut-il en changer une ? »

Le manager tient une règle en réserve, qu''il impose si l''équipe ne la propose pas : le respect des personnes. « On peut tout se dire sur le travail ; on ne s''attaque pas aux personnes, et pas devant les autres. » C''est la ligne qu''il défendra sans négociation.

## Les rituels de régulation

Une règle affichée ne suffit pas. Il faut des moments où l''on vérifie et où l''on ajuste. Trois rituels simples :

Le point « ce qui nous a compliqué la vie » : cinq minutes à la fin du point hebdomadaire. Chacun peut dire une chose qui a gêné son travail cette semaine, en termes de faits, sans viser une personne. Le manager note et traite. Ce rituel désamorce des dizaines de conflits par an, parce qu''il donne un lieu légitime aux irritations avant qu''elles ne deviennent des griefs.

La rétrospective d''équipe : une fois par mois ou par trimestre, trente minutes (module 6). Qu''est-ce qui a bien fonctionné, qu''est-ce qui a moins bien fonctionné, qu''est-ce qu''on change. Elle porte sur le fonctionnement, pas sur les personnes.

La relecture des règles du jeu : tous les trois mois, dix minutes. Elle rappelle que les règles existent et qu''on peut les faire évoluer.

## Les signaux faibles

Un conflit de niveau 1 ou 2 ne se voit pas. Il s''entend, si l''on est attentif. Les signaux faibles :

- Deux personnes qui ne se parlent plus directement : elles passent par un tiers, par écrit, par le manager.
- Les piques et l''humour à double sens : « Ah, c''est le nouveau qui décide maintenant ? »
- Les silences : quelqu''un qui ne dit plus rien en réunion alors qu''il parlait.
- Les « toujours » et les « jamais » : « Elle ne prévient jamais. » Le passage du fait au trait de caractère est le signe que le conflit de tâche glisse vers la relation.
- Les alliances : deux personnes qui déjeunent toujours ensemble et jamais avec un troisième ; un tour de table où les mêmes appuient les mêmes.
- Les plaintes indirectes : quelqu''un vient parler « d''un problème d''organisation » qui est en fait un problème avec une personne.
- La baisse de qualité à une interface : les erreurs se concentrent là où deux personnes doivent se transmettre quelque chose.

Quand vous repérez un signal, vous n''attendez pas. Vous allez voir, individuellement, avec des faits et une question ouverte : « J''ai remarqué que les demandes de Sophie te passent par post-it maintenant. Qu''est-ce qui se passe ? » À ce stade, une conversation de dix minutes suffit souvent.

## Le manager, source de conflit

Il faut le dire : le manager est lui-même, souvent, la source du conflit. Par des décisions non expliquées, une répartition inéquitable, des chouchous, des changements de consigne, des promesses non tenues, ou en laissant durer une situation. Avant de chercher la cause dans l''équipe, le manager se pose la question : « Qu''ai-je fait, ou pas fait, qui a contribué à cette tension ? » La réponse est rarement « rien ».

## Le cas Garnier

Karim tient la réunion des règles du jeu. Il en sort six règles, dont : « Une urgence s''annonce de vive voix, au brief ou à Karim » (Sophie et Marc l''ont formulée ensemble, ce qui était l''objectif) ; « Quand on n''est pas d''accord avec la façon de faire de quelqu''un, on lui dit à lui, pas aux autres » (Karim l''a proposée, en regardant tout le monde, et Thierry a compris) ; « Un nouveau a un mois pour poser toutes les questions qu''il veut, sans commentaire » (proposée par Nadia, qui a vu Amine se faire charrier). Le point « ce qui nous a compliqué la vie » entre dans le point hebdomadaire. Et Karim admet devant l''équipe qu''il aurait dû mettre Marc dans le circuit du planning dès le départ.

## À retenir

- La prévention, c''est tout ce qui précède : objectifs, rôles, règles de répartition, feedback, entretiens, réunion, sécurité psychologique, équité.
- Des règles du jeu co-construites (cinq à huit, positives, vérifiables, affichées, relues), avec une règle non négociable : le respect des personnes.
- Des rituels de régulation : le point « ce qui nous a compliqué la vie », la rétrospective, la relecture des règles.
- Repérer les signaux faibles (communication indirecte, piques, silences, « toujours / jamais », alliances) et aller voir tout de suite.
- Se demander d''abord ce que le manager a fait, ou pas fait.

## Sources

- ANACT, « Espaces de discussion sur le travail » et « Prévenir et gérer les conflits au travail », anact.fr.
- Friedrich Glasl, *Konfliktmanagement*, 1980.
- Patrick Lencioni, *Les cinq dysfonctionnements d''une équipe*, 2002 (sur la peur du conflit et l''absence de confiance).
- France Compétences, référentiel RS7377, compétences 5 et 8.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'La meilleure gestion de conflit est celle qu''on n''a pas à faire. Une équipe où les rôles sont clairs, où les règles de fonctionnement sont connues et appliquées, où l''on peut dire les désaccords tôt, produit peu de conflits de relation. Cette leçon rassemble ce qui, dans les modules précédents, prévient les conflits, et y ajoute deux outils : les règles du jeu co-construites et les rituels de régulation.

## Le cadre : ce que vous avez déjà

Relisez vos modules avec l''œil de la prévention des conflits :

- Des objectifs clairs (module 2) : quand l''équipe sait où elle va, les désaccords portent sur le chemin, pas sur la destination.
- Des rôles clairs (RACI, module 2) : la première source de conflit, les rôles flous, est traitée à la racine. Chaque fois qu''une tension apparaît, la première question est : « le RACI prévoit-il ce cas ? »
- Des règles de répartition des ressources (module 2 et leçon 4.6) : le planning de la cabine, les heures supplémentaires, les missions intéressantes, distribués selon une règle connue.
- Un feedback rapide (module 3) : un comportement gênant relevé dans les 48 heures ne devient pas un ressentiment.
- Des entretiens de suivi réguliers (module 3) : le temps « ressenti et besoins » fait sortir les tensions à leur début.
- Une réunion où l''on peut parler (module 3) et une sécurité psychologique (module 4) : les désaccords s''expriment en réunion plutôt qu''en clans.
- L''équité (leçon 4.6) : le sentiment d''injustice est le carburant des conflits.

Un manager qui fait tout cela a déjà fait l''essentiel de la prévention.

## Les règles du jeu co-construites

Au-delà des règles de l''entreprise (règlement intérieur, consignes de sécurité), chaque équipe a besoin de règles de fonctionnement propres : comment on se parle, comment on gère les désaccords, comment on se transmet l''information, comment on demande de l''aide, ce qu''on fait quand quelqu''un est en difficulté.

Ces règles sont d''autant mieux respectées qu''elles ont été construites par l''équipe, pas édictées par le manager. La méthode tient en une réunion d''une heure :

1. Le manager pose la question : « Qu''est-ce qui, dans notre façon de fonctionner ensemble, nous fait perdre du temps ou de l''énergie ? » Tour de table, chacun une réponse, sans discussion.
2. On regroupe les réponses par thème (information, entraide, respect, décisions).
3. Pour chaque thème, on formule une règle en une phrase, positive et vérifiable : « Toute urgence est annoncée à voix haute au brief ou à Karim, jamais par post-it » plutôt que « il faut mieux communiquer ».
4. On garde cinq à huit règles, pas vingt. On les affiche.
5. On fixe une date de relecture (trois mois) : « Est-ce qu''on les tient ? Faut-il en changer une ? »

Le manager tient une règle en réserve, qu''il impose si l''équipe ne la propose pas : le respect des personnes. « On peut tout se dire sur le travail ; on ne s''attaque pas aux personnes, et pas devant les autres. » C''est la ligne qu''il défendra sans négociation.

## Les rituels de régulation

Une règle affichée ne suffit pas. Il faut des moments où l''on vérifie et où l''on ajuste. Trois rituels simples :

Le point « ce qui nous a compliqué la vie » : cinq minutes à la fin du point hebdomadaire. Chacun peut dire une chose qui a gêné son travail cette semaine, en termes de faits, sans viser une personne. Le manager note et traite. Ce rituel désamorce des dizaines de conflits par an, parce qu''il donne un lieu légitime aux irritations avant qu''elles ne deviennent des griefs.

La rétrospective d''équipe : une fois par mois ou par trimestre, trente minutes (module 6). Qu''est-ce qui a bien fonctionné, qu''est-ce qui a moins bien fonctionné, qu''est-ce qu''on change. Elle porte sur le fonctionnement, pas sur les personnes.

La relecture des règles du jeu : tous les trois mois, dix minutes. Elle rappelle que les règles existent et qu''on peut les faire évoluer.

## Les signaux faibles

Un conflit de niveau 1 ou 2 ne se voit pas. Il s''entend, si l''on est attentif. Les signaux faibles :

- Deux personnes qui ne se parlent plus directement : elles passent par un tiers, par écrit, par le manager.
- Les piques et l''humour à double sens : « Ah, c''est le nouveau qui décide maintenant ? »
- Les silences : quelqu''un qui ne dit plus rien en réunion alors qu''il parlait.
- Les « toujours » et les « jamais » : « Elle ne prévient jamais. » Le passage du fait au trait de caractère est le signe que le conflit de tâche glisse vers la relation.
- Les alliances : deux personnes qui déjeunent toujours ensemble et jamais avec un troisième ; un tour de table où les mêmes appuient les mêmes.
- Les plaintes indirectes : quelqu''un vient parler « d''un problème d''organisation » qui est en fait un problème avec une personne.
- La baisse de qualité à une interface : les erreurs se concentrent là où deux personnes doivent se transmettre quelque chose.

Quand vous repérez un signal, vous n''attendez pas. Vous allez voir, individuellement, avec des faits et une question ouverte : « J''ai remarqué que les demandes de Sophie te passent par post-it maintenant. Qu''est-ce qui se passe ? » À ce stade, une conversation de dix minutes suffit souvent.

## Le manager, source de conflit

Il faut le dire : le manager est lui-même, souvent, la source du conflit. Par des décisions non expliquées, une répartition inéquitable, des chouchous, des changements de consigne, des promesses non tenues, ou en laissant durer une situation. Avant de chercher la cause dans l''équipe, le manager se pose la question : « Qu''ai-je fait, ou pas fait, qui a contribué à cette tension ? » La réponse est rarement « rien ».

## Le cas Garnier

Karim tient la réunion des règles du jeu. Il en sort six règles, dont : « Une urgence s''annonce de vive voix, au brief ou à Karim » (Sophie et Marc l''ont formulée ensemble, ce qui était l''objectif) ; « Quand on n''est pas d''accord avec la façon de faire de quelqu''un, on lui dit à lui, pas aux autres » (Karim l''a proposée, en regardant tout le monde, et Thierry a compris) ; « Un nouveau a un mois pour poser toutes les questions qu''il veut, sans commentaire » (proposée par Nadia, qui a vu Amine se faire charrier). Le point « ce qui nous a compliqué la vie » entre dans le point hebdomadaire. Et Karim admet devant l''équipe qu''il aurait dû mettre Marc dans le circuit du planning dès le départ.

## À retenir

- La prévention, c''est tout ce qui précède : objectifs, rôles, règles de répartition, feedback, entretiens, réunion, sécurité psychologique, équité.
- Des règles du jeu co-construites (cinq à huit, positives, vérifiables, affichées, relues), avec une règle non négociable : le respect des personnes.
- Des rituels de régulation : le point « ce qui nous a compliqué la vie », la rétrospective, la relecture des règles.
- Repérer les signaux faibles (communication indirecte, piques, silences, « toujours / jamais », alliances) et aller voir tout de suite.
- Se demander d''abord ce que le manager a fait, ou pas fait.

## Sources

- ANACT, « Espaces de discussion sur le travail » et « Prévenir et gérer les conflits au travail », anact.fr.
- Friedrich Glasl, *Konfliktmanagement*, 1980.
- Patrick Lencioni, *Les cinq dysfonctionnements d''une équipe*, 2002 (sur la peur du conflit et l''absence de confiance).
- France Compétences, référentiel RS7377, compétences 5 et 8.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 6 and l.ordre = 3;
  n := n + 1;

  -- 5.4-resoudre.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Quand la prévention n''a pas suffi et qu''un conflit est installé (niveau 2 à 4 de l''escalier de Glasl), le manager intervient. Pas en arbitre qui dit qui a raison, pas en sauveur qui règle à la place des gens, mais en tiers qui organise la résolution. La méthode en cinq étapes ci-dessous fonctionne pour un conflit entre deux personnes de l''équipe ; elle s''adapte à un conflit entre le manager et une personne (le manager est alors partie, et doit être encore plus rigoureux) et à un conflit entre deux sous-groupes.

## Avant de commencer : trois conditions

Le bon moment : pas à chaud. Si l''incident vient d''avoir lieu, on sépare, on fait retomber (« on en parle demain matin, chacun de son côté d''abord »), et on fixe l''heure.

Le bon lieu : un lieu fermé, neutre, sans public. Jamais dans l''atelier ou l''open space.

La bonne posture : le manager n''a pas d''avis sur qui a tort. S''il en a un (et il en a souvent un), il le met de côté pendant les entretiens. Il cherche ce qui doit changer, pas qui est coupable.

## Étape 1 — Accueillir : poser le cadre

Le manager voit chaque personne séparément, puis, si nécessaire, ensemble. Dans les deux cas, il commence par le cadre : « Il y a une difficulté entre vous deux qui pèse sur le travail de l''équipe. Mon rôle n''est pas de dire qui a raison, c''est qu''on trouve ensemble comment travailler. Voilà comment on va procéder. » Il pose les règles de l''échange : on parle de faits, on ne coupe pas, on ne s''attaque pas aux personnes, ce qui se dit ici reste ici.

## Étape 2 — Écouter chaque partie, séparément

C''est l''étape décisive et la plus souvent sautée. Chaque personne, seule avec le manager, raconte ce qui s''est passé de son point de vue. Le manager écoute avec les outils du module 3 : questions ouvertes (« qu''est-ce qui s''est passé exactement ? », « depuis quand ? », « qu''est-ce que tu as essayé ? »), reformulation, silence. Il ne prend pas parti, ne commente pas la version de l''autre, ne promet rien.

Il cherche, derrière les positions (« je veux qu''elle arrête de me donner des urgences »), les besoins (« j''ai besoin de savoir la veille ce qui m''attend »). C''est la distinction fondamentale de la négociation raisonnée de Fisher et Ury : les positions sont incompatibles, les besoins ne le sont presque jamais.

Il termine par : « Qu''est-ce qu''il faudrait pour que ça fonctionne, selon toi ? » et « Es-tu d''accord pour qu''on en parle à trois ? »

## Étape 3 — Objectiver : les faits, la source, la règle

Le manager rassemble ce qu''il a entendu et le met à plat : les faits sur lesquels les deux versions concordent ; les faits qui divergent (et qu''on pourra vérifier, ou qu''on laissera de côté) ; la source du conflit (rôle flou, ressource, manière de faire, leçon 5.2) ; la règle existante qui s''applique (RACI, règles du jeu) ou qui manque.

Le plus souvent, cette étape révèle que le conflit a une cause organisationnelle que le manager peut traiter lui-même. Sophie et Marc : le circuit du planning ne prévoyait pas la mécanique. C''est la décision de Karim qui manque, pas la bonne volonté de l''un ou de l''autre.

## Étape 4 — Chercher les options, ensemble

L''entretien à trois. Le manager rappelle le cadre, expose ce qu''il a compris de manière équilibrée (les besoins de chacun, la source), et demande : « Qu''est-ce qu''on peut faire pour que ça fonctionne ? » Il laisse les deux proposer avant de proposer lui-même. Il cherche des options qui répondent aux besoins des deux, pas un compromis où chacun perd la moitié.

C''est ici que la communication non violente (CNV), formalisée par le psychologue Marshall Rosenberg, est précieuse. Elle donne à chacun une façon de dire ce qui ne va pas sans attaquer, en quatre temps :

- L''observation, sans jugement : « Mardi, j''ai appris à 14 h que la Clio passait en géométrie à 17 h. »
- Le sentiment : « J''étais en colère et j''ai eu l''impression de ne pas compter. »
- Le besoin : « J''ai besoin de savoir la veille ce qui m''attend. »
- La demande, concrète et négociable : « Est-ce que tu peux me dire à 17 h ce qui passe en méca le lendemain ? »

Le manager peut proposer ce format aux deux personnes (« chacun dit à l''autre, avec ces quatre temps, ce qui s''est passé pour lui »), et veiller à ce qu''il soit respecté. La CNV n''est pas une baguette magique ; c''est une discipline qui empêche les phrases qui blessent (« tu ne préviens jamais ») et oblige à formuler une demande à laquelle l''autre peut répondre.

## Étape 5 — Contractualiser et suivre

On termine par un accord explicite : ce que chacun fait, à partir de quand, et ce que le manager fait (la règle qu''il fixe, le RACI qu''il modifie). Deux ou trois engagements, précis. Le manager les reformule à voix haute, et, pour un conflit sérieux, les note et les remet aux deux.

Puis le suivi : un point à deux semaines, à trois, puis, si tout va bien, à un mois. Sans suivi, l''accord dure le temps de la bonne volonté. Le manager observe aussi les signaux faibles (leçon 5.3) : les post-it ont-ils disparu ?

## Quand le manager est partie au conflit

Si le conflit oppose le manager à un membre de l''équipe, la méthode reste la même, avec deux précautions. D''abord, le manager écoute vraiment, en commençant par l''autre, et il reconnaît sa part (il y en a presque toujours une). Ensuite, s''il n''y parvient pas, il demande un tiers : son propre manager, les RH, un collègue manager. Un manager qui refuse le tiers parce qu''il « gère » perd la confiance de l''équipe et souvent le conflit.

## Quand et comment recourir à la médiation

Le manager n''est pas médiateur : il a une position d''autorité, un intérêt au résultat, et parfois une part dans le conflit. Quand le conflit a dépassé le niveau 4 (recrutement d''alliés, attaques sur la réputation, refus de se parler même en présence du manager), ou quand le manager est lui-même trop impliqué, ou quand la méthode en cinq étapes a échoué, il faut un tiers neutre.

En interne : les RH, un manager d''un autre service, parfois un représentant du personnel, si les deux parties l''acceptent. En externe : un médiateur professionnel, que l''entreprise peut mandater. La médiation est volontaire, confidentielle, et le médiateur ne décide pas : il aide les parties à trouver leur accord. Le manager, qui a proposé la médiation, en respecte les règles : il ne demande pas au médiateur ce qui s''est dit.

Passer la main n''est pas un échec du manager. C''est la reconnaissance qu''un conflit installé demande d''autres moyens que les siens, et c''est une protection pour lui et pour les personnes.

## Ce qui ne marche pas

- Réunir les deux tout de suite, sans les avoir écoutés séparément : chacun rejoue le conflit devant le chef.
- Trancher sur une version.
- Demander aux gens de « faire un effort » sans rien changer à la cause.
- Séparer physiquement les personnes sans traiter (changer les horaires, les postes) : le conflit se déplace.
- Attendre que ça se tasse.
- Prendre le conflit pour soi et s''en vouloir : le manager organise la résolution, il n''est pas responsable de la mésentente.

## Le cas Garnier — Sophie et Marc

Étape 1 : Karim voit Sophie mardi 13 h, Marc mardi 13 h 30, chacun dans le bureau. Il pose le cadre. Étape 2 : Sophie raconte que Marc « fait la tête » et qu''elle n''ose plus lui parler ; derrière, son besoin : ne pas être perçue comme celle qui impose des urgences alors qu''elle transmet celles des clients. Marc raconte les trois urgences non prévues ; son besoin : la visibilité la veille. Étape 3 : les faits concordent (les urgences sont arrivées sans prévenir ; Marc a cessé de parler) ; la source est un rôle flou (le planning ne prévoyait pas la mécanique ; Sophie ne sait pas à qui annoncer) ; la règle manque. Étape 4 : à trois, jeudi. Karim expose ce qu''il a compris, sans désigner. Chacun dit à l''autre, en quatre temps. Options trouvées par eux : Sophie annonce toute urgence de vive voix au brief ou à Karim ; Karim consulte Marc chaque soir à 17 h pour la mécanique du lendemain ; Marc, s''il découvre une urgence non prévue, le dit sur le moment plutôt que de se taire. Étape 5 : trois engagements notés, point dans deux semaines. Karim modifie le RACI. Deux semaines plus tard, les post-it ont disparu et Sophie a demandé à Marc un conseil sur sa propre voiture.

## À retenir

- Pas à chaud, en lieu fermé, sans avis sur qui a tort.
- Cinq étapes : accueillir (le cadre), écouter chacun séparément (positions et besoins), objectiver (faits, source, règle), chercher les options ensemble (CNV : observation, sentiment, besoin, demande), contractualiser et suivre.
- Le plus souvent, la cause est organisationnelle, et c''est le manager qui la traite.
- Quand le manager est partie, il commence par écouter et reconnaît sa part ; quand le conflit dépasse le niveau 4 ou que la méthode échoue, il passe la main à un tiers neutre (RH, médiateur).
- Passer la main n''est pas un échec.

## Sources

- Roger Fisher, William Ury, *Comment réussir une négociation*, Seuil, 1982 — positions et intérêts.
- Marshall B. Rosenberg, *Les mots sont des fenêtres (ou bien ce sont des murs)*, La Découverte, 1999 — communication non violente.
- Friedrich Glasl, *Konfliktmanagement*, 1980 — niveaux d''escalade et modes d''intervention.
- Code du travail, art. L1152-6 (médiation en cas de harcèlement moral) ; ANACT, « La médiation en entreprise ».
- France Compétences, référentiel RS7377, compétence 8.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Quand la prévention n''a pas suffi et qu''un conflit est installé (niveau 2 à 4 de l''escalier de Glasl), le manager intervient. Pas en arbitre qui dit qui a raison, pas en sauveur qui règle à la place des gens, mais en tiers qui organise la résolution. La méthode en cinq étapes ci-dessous fonctionne pour un conflit entre deux personnes de l''équipe ; elle s''adapte à un conflit entre le manager et une personne (le manager est alors partie, et doit être encore plus rigoureux) et à un conflit entre deux sous-groupes.

## Avant de commencer : trois conditions

Le bon moment : pas à chaud. Si l''incident vient d''avoir lieu, on sépare, on fait retomber (« on en parle demain matin, chacun de son côté d''abord »), et on fixe l''heure.

Le bon lieu : un lieu fermé, neutre, sans public. Jamais dans l''atelier ou l''open space.

La bonne posture : le manager n''a pas d''avis sur qui a tort. S''il en a un (et il en a souvent un), il le met de côté pendant les entretiens. Il cherche ce qui doit changer, pas qui est coupable.

## Étape 1 — Accueillir : poser le cadre

Le manager voit chaque personne séparément, puis, si nécessaire, ensemble. Dans les deux cas, il commence par le cadre : « Il y a une difficulté entre vous deux qui pèse sur le travail de l''équipe. Mon rôle n''est pas de dire qui a raison, c''est qu''on trouve ensemble comment travailler. Voilà comment on va procéder. » Il pose les règles de l''échange : on parle de faits, on ne coupe pas, on ne s''attaque pas aux personnes, ce qui se dit ici reste ici.

## Étape 2 — Écouter chaque partie, séparément

C''est l''étape décisive et la plus souvent sautée. Chaque personne, seule avec le manager, raconte ce qui s''est passé de son point de vue. Le manager écoute avec les outils du module 3 : questions ouvertes (« qu''est-ce qui s''est passé exactement ? », « depuis quand ? », « qu''est-ce que tu as essayé ? »), reformulation, silence. Il ne prend pas parti, ne commente pas la version de l''autre, ne promet rien.

Il cherche, derrière les positions (« je veux qu''elle arrête de me donner des urgences »), les besoins (« j''ai besoin de savoir la veille ce qui m''attend »). C''est la distinction fondamentale de la négociation raisonnée de Fisher et Ury : les positions sont incompatibles, les besoins ne le sont presque jamais.

Il termine par : « Qu''est-ce qu''il faudrait pour que ça fonctionne, selon toi ? » et « Es-tu d''accord pour qu''on en parle à trois ? »

## Étape 3 — Objectiver : les faits, la source, la règle

Le manager rassemble ce qu''il a entendu et le met à plat : les faits sur lesquels les deux versions concordent ; les faits qui divergent (et qu''on pourra vérifier, ou qu''on laissera de côté) ; la source du conflit (rôle flou, ressource, manière de faire, leçon 5.2) ; la règle existante qui s''applique (RACI, règles du jeu) ou qui manque.

Le plus souvent, cette étape révèle que le conflit a une cause organisationnelle que le manager peut traiter lui-même. Sophie et Marc : le circuit du planning ne prévoyait pas la mécanique. C''est la décision de Karim qui manque, pas la bonne volonté de l''un ou de l''autre.

## Étape 4 — Chercher les options, ensemble

L''entretien à trois. Le manager rappelle le cadre, expose ce qu''il a compris de manière équilibrée (les besoins de chacun, la source), et demande : « Qu''est-ce qu''on peut faire pour que ça fonctionne ? » Il laisse les deux proposer avant de proposer lui-même. Il cherche des options qui répondent aux besoins des deux, pas un compromis où chacun perd la moitié.

C''est ici que la communication non violente (CNV), formalisée par le psychologue Marshall Rosenberg, est précieuse. Elle donne à chacun une façon de dire ce qui ne va pas sans attaquer, en quatre temps :

- L''observation, sans jugement : « Mardi, j''ai appris à 14 h que la Clio passait en géométrie à 17 h. »
- Le sentiment : « J''étais en colère et j''ai eu l''impression de ne pas compter. »
- Le besoin : « J''ai besoin de savoir la veille ce qui m''attend. »
- La demande, concrète et négociable : « Est-ce que tu peux me dire à 17 h ce qui passe en méca le lendemain ? »

Le manager peut proposer ce format aux deux personnes (« chacun dit à l''autre, avec ces quatre temps, ce qui s''est passé pour lui »), et veiller à ce qu''il soit respecté. La CNV n''est pas une baguette magique ; c''est une discipline qui empêche les phrases qui blessent (« tu ne préviens jamais ») et oblige à formuler une demande à laquelle l''autre peut répondre.

## Étape 5 — Contractualiser et suivre

On termine par un accord explicite : ce que chacun fait, à partir de quand, et ce que le manager fait (la règle qu''il fixe, le RACI qu''il modifie). Deux ou trois engagements, précis. Le manager les reformule à voix haute, et, pour un conflit sérieux, les note et les remet aux deux.

Puis le suivi : un point à deux semaines, à trois, puis, si tout va bien, à un mois. Sans suivi, l''accord dure le temps de la bonne volonté. Le manager observe aussi les signaux faibles (leçon 5.3) : les post-it ont-ils disparu ?

## Quand le manager est partie au conflit

Si le conflit oppose le manager à un membre de l''équipe, la méthode reste la même, avec deux précautions. D''abord, le manager écoute vraiment, en commençant par l''autre, et il reconnaît sa part (il y en a presque toujours une). Ensuite, s''il n''y parvient pas, il demande un tiers : son propre manager, les RH, un collègue manager. Un manager qui refuse le tiers parce qu''il « gère » perd la confiance de l''équipe et souvent le conflit.

## Quand et comment recourir à la médiation

Le manager n''est pas médiateur : il a une position d''autorité, un intérêt au résultat, et parfois une part dans le conflit. Quand le conflit a dépassé le niveau 4 (recrutement d''alliés, attaques sur la réputation, refus de se parler même en présence du manager), ou quand le manager est lui-même trop impliqué, ou quand la méthode en cinq étapes a échoué, il faut un tiers neutre.

En interne : les RH, un manager d''un autre service, parfois un représentant du personnel, si les deux parties l''acceptent. En externe : un médiateur professionnel, que l''entreprise peut mandater. La médiation est volontaire, confidentielle, et le médiateur ne décide pas : il aide les parties à trouver leur accord. Le manager, qui a proposé la médiation, en respecte les règles : il ne demande pas au médiateur ce qui s''est dit.

Passer la main n''est pas un échec du manager. C''est la reconnaissance qu''un conflit installé demande d''autres moyens que les siens, et c''est une protection pour lui et pour les personnes.

## Ce qui ne marche pas

- Réunir les deux tout de suite, sans les avoir écoutés séparément : chacun rejoue le conflit devant le chef.
- Trancher sur une version.
- Demander aux gens de « faire un effort » sans rien changer à la cause.
- Séparer physiquement les personnes sans traiter (changer les horaires, les postes) : le conflit se déplace.
- Attendre que ça se tasse.
- Prendre le conflit pour soi et s''en vouloir : le manager organise la résolution, il n''est pas responsable de la mésentente.

## Le cas Garnier — Sophie et Marc

Étape 1 : Karim voit Sophie mardi 13 h, Marc mardi 13 h 30, chacun dans le bureau. Il pose le cadre. Étape 2 : Sophie raconte que Marc « fait la tête » et qu''elle n''ose plus lui parler ; derrière, son besoin : ne pas être perçue comme celle qui impose des urgences alors qu''elle transmet celles des clients. Marc raconte les trois urgences non prévues ; son besoin : la visibilité la veille. Étape 3 : les faits concordent (les urgences sont arrivées sans prévenir ; Marc a cessé de parler) ; la source est un rôle flou (le planning ne prévoyait pas la mécanique ; Sophie ne sait pas à qui annoncer) ; la règle manque. Étape 4 : à trois, jeudi. Karim expose ce qu''il a compris, sans désigner. Chacun dit à l''autre, en quatre temps. Options trouvées par eux : Sophie annonce toute urgence de vive voix au brief ou à Karim ; Karim consulte Marc chaque soir à 17 h pour la mécanique du lendemain ; Marc, s''il découvre une urgence non prévue, le dit sur le moment plutôt que de se taire. Étape 5 : trois engagements notés, point dans deux semaines. Karim modifie le RACI. Deux semaines plus tard, les post-it ont disparu et Sophie a demandé à Marc un conseil sur sa propre voiture.

## À retenir

- Pas à chaud, en lieu fermé, sans avis sur qui a tort.
- Cinq étapes : accueillir (le cadre), écouter chacun séparément (positions et besoins), objectiver (faits, source, règle), chercher les options ensemble (CNV : observation, sentiment, besoin, demande), contractualiser et suivre.
- Le plus souvent, la cause est organisationnelle, et c''est le manager qui la traite.
- Quand le manager est partie, il commence par écouter et reconnaît sa part ; quand le conflit dépasse le niveau 4 ou que la méthode échoue, il passe la main à un tiers neutre (RH, médiateur).
- Passer la main n''est pas un échec.

## Sources

- Roger Fisher, William Ury, *Comment réussir une négociation*, Seuil, 1982 — positions et intérêts.
- Marshall B. Rosenberg, *Les mots sont des fenêtres (ou bien ce sont des murs)*, La Découverte, 1999 — communication non violente.
- Friedrich Glasl, *Konfliktmanagement*, 1980 — niveaux d''escalade et modes d''intervention.
- Code du travail, art. L1152-6 (médiation en cas de harcèlement moral) ; ANACT, « La médiation en entreprise ».
- France Compétences, référentiel RS7377, compétence 8.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 6 and l.ordre = 4;
  n := n + 1;

  -- 5.5-video-deux-collegues.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Type : vidéo avatar avec séquences jouées (voix off + texte à l''écran, ou second avatar). Débit : 140 mots/min. Le cas est volontairement pris hors de l''atelier Garnier pour montrer la méthode dans un autre secteur.
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

[Plan : avatar. Titre : « Deux collègues qui ne se parlent plus »]

Vous connaissez la méthode en cinq étapes. Voyons-la fonctionner sur une situation réelle, dans un autre secteur que la carrosserie : une agence bancaire de quartier, sept personnes. Le manager s''appelle Nour. Deux conseillères, Léa et Camille, ne se parlent plus depuis trois semaines. Les clients commencent à le sentir : un dossier de prêt a traîné parce que chacune pensait que l''autre s''en occupait.

[Titre : « Ce qui a été fait de travers d''abord »]

Nour a d''abord fait ce que font beaucoup de managers : elle a réuni Léa et Camille dans son bureau, sans préparation, un vendredi à 17 h 30, et leur a dit : « Bon, vous allez me dire ce qui se passe, et vous allez arrêter, parce que ça se voit. »

[Texte à l''écran, voix off]
LÉA : « Il ne se passe rien. »
CAMILLE : « Demande-lui, c''est elle qui a un problème. »
LÉA : « Moi j''ai un problème ? C''est toi qui as pris mon client. »
NOUR : « Bon, on se calme. Vous êtes adultes, faites un effort, on en reparle lundi. »

[Retour avatar]
Résultat : rien. Le conflit a été rejoué devant le chef, chacune a durci sa position, et Nour a demandé un effort sans rien changer. Lundi, les deux se parlaient encore moins. Reprenons avec la méthode.

[Titre : « Étape 1 — Accueillir »]

Nour convoque Léa mardi à 9 h, Camille à 9 h 30, dans la salle de réunion, porte fermée. Même phrase d''ouverture pour les deux :

[Séquence jouée]
NOUR : « Il y a une difficulté entre Camille et toi qui pèse sur l''agence ; le dossier Martin a pris quatre jours de retard. Je ne cherche pas qui a raison. Je cherche comment on travaille ensemble. Je vais vous écouter chacune, puis on se verra à trois. Ce qu''on se dit ici reste ici. D''accord ? »

[Titre : « Étape 2 — Écouter chacune »]

[Séquence jouée, Léa]
NOUR : « Raconte-moi ce qui s''est passé. »
LÉA : « Le client Rousseau, c''est moi qui le suis depuis deux ans. Camille l''a reçu pendant mes congés et elle lui a ouvert une assurance-vie. Le client est passé dans son portefeuille. Elle ne m''a rien dit. Je l''ai découvert dans l''outil. »
NOUR : « Tu l''as découvert dans l''outil, sans qu''elle t''en parle. » (reformulation)
LÉA : « Oui. Et depuis, je ne lui adresse plus la parole, parce que si je lui parle, je vais dire des choses que je regretterai. »
NOUR : « Qu''est-ce qu''il te faudrait ? »
LÉA : « Que mes clients restent mes clients. Et qu''on me le dise, au moins. »

[Voix off] Position : « mes clients restent mes clients ». Besoin : la reconnaissance de son travail, et l''information.

[Séquence jouée, Camille]
NOUR : « Raconte-moi ce qui s''est passé. »
CAMILLE : « Le client Rousseau est venu pendant les congés de Léa avec un besoin urgent, une succession. Je l''ai traité. L''outil a basculé le client automatiquement dans mon portefeuille, je ne l''ai pas demandé. Quand Léa est revenue, elle ne m''a pas dit bonjour. Alors je n''ai rien dit non plus. »
NOUR : « Tu as traité une urgence, l''outil a fait le transfert, et tu as pris le silence de Léa comme une accusation. »
CAMILLE : « Exactement. Et je ne vais pas m''excuser d''avoir fait mon travail. »
NOUR : « Qu''est-ce qu''il te faudrait ? »
CAMILLE : « Qu''on ne me traite pas comme une voleuse. Et qu''il y ait une règle claire quand on remplace quelqu''un. »

[Voix off] Position : « je ne m''excuserai pas ». Besoin : la reconnaissance, et une règle.

[Titre : « Étape 3 — Objectiver »]

[Retour avatar]
Nour met à plat. Les faits concordent : Camille a traité une urgence, l''outil a transféré le client, personne ne s''est parlé. Le fait divergent, « elle m''a pris mon client », n''est pas un fait ; c''est une interprétation. La source : un rôle flou. Que se passe-t-il quand on reçoit le client d''un collègue absent ? Personne ne l''a jamais dit. Et la règle manque : c''est à Nour de la fixer.

Elle remarque aussi ses propres biais : elle a entendu Léa en premier, elle connaît Léa depuis plus longtemps, et elle avait déjà, en son for intérieur, donné tort à Camille. Elle le met de côté.

[Titre : « Étape 4 — Chercher les options ensemble »]

Jeudi 9 h, à trois. Nour rappelle le cadre, puis expose ce qu''elle a compris, de façon équilibrée.

[Séquence jouée]
NOUR : « Ce que j''ai compris : Camille a traité une urgence pendant les congés de Léa, l''outil a transféré le client, et personne ne s''est parlé au retour. Léa, tu as eu le sentiment qu''on te retirait deux ans de travail. Camille, tu as eu le sentiment d''être traitée en voleuse pour avoir fait ton travail. Et il n''y a pas de règle sur ce qu''on fait quand on remplace un collègue. Ça, c''est de ma responsabilité. Je vous propose que chacune dise à l''autre ce qui s''est passé pour elle, en quatre temps : ce qu''elle a observé, ce qu''elle a ressenti, ce dont elle a besoin, ce qu''elle demande. Léa ? »
LÉA : « Quand je suis rentrée, j''ai vu dans l''outil que Rousseau était dans ton portefeuille. J''ai été blessée, parce que je le suis depuis deux ans. J''ai besoin que mon travail soit reconnu. Je te demande de me prévenir quand tu traites un de mes clients. »
CAMILLE : « Je comprends. Quand tu es rentrée, tu ne m''as pas dit bonjour. J''ai été vexée, parce que j''avais traité une succession en urgence. J''ai besoin qu''on ne me prenne pas pour quelqu''un qui pique des clients. Je te demande de me parler quand quelque chose ne va pas, plutôt que de te taire. »
NOUR : « Qu''est-ce qu''on fait pour que ça fonctionne ? »
CAMILLE : « On peut remettre Rousseau dans le portefeuille de Léa. Je ne tiens pas à le garder. »
LÉA : « Et quand on remplace, on laisse un mot au retour. Un mail, deux lignes. »
NOUR : « Je fixe la règle pour l''agence : un client reçu pendant l''absence de son conseiller reste dans son portefeuille ; le remplaçant lui envoie un mail de passation. Je vais voir avec le siège pour le paramétrage de l''outil. »

[Titre : « Étape 5 — Contractualiser et suivre »]

[Retour avatar]
Trois engagements, reformulés à voix haute et notés : Camille remet le client Rousseau à Léa cette semaine ; toute passation fait l''objet d''un mail au retour ; Nour fixe la règle pour l''agence et voit le siège pour l''outil. Point dans deux semaines. Et Nour ajoute une chose : « Ce conflit vient d''une règle qui manquait. C''était à moi de la poser. » Ce n''est pas de la faiblesse ; c''est ce qui permet aux deux de sortir sans perdre la face.

Deux semaines plus tard, Léa et Camille se parlent. Pas comme des amies ; comme des collègues. C''est tout ce que Nour avait à obtenir.

[Titre : « Ce qu''il faut retenir »]

Trois choses. D''abord : écouter séparément avant de réunir. La première tentative de Nour a échoué là. Ensuite : chercher la source dans l''organisation ; ici, une règle manquante, que le manager pose. Enfin : ne pas trancher entre les personnes, mais organiser leur échange, avec un format qui empêche les attaques, et conclure par des engagements suivis.

Et une quatrième : si Léa avait refusé l''entretien à trois, ou si les attaques avaient continué devant Nour, il aurait fallu un tiers. Passer la main est une décision de manager.

À tout de suite pour les situations difficiles : recadrer, sanctionner, alerter.

[Fondu, logo]

---

Sources : méthode en cinq étapes (leçon 5.4) ; Rosenberg, communication non violente ; Fisher et Ury, positions et intérêts.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Type : vidéo avatar avec séquences jouées (voix off + texte à l''écran, ou second avatar). Débit : 140 mots/min. Le cas est volontairement pris hors de l''atelier Garnier pour montrer la méthode dans un autre secteur.
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

[Plan : avatar. Titre : « Deux collègues qui ne se parlent plus »]

Vous connaissez la méthode en cinq étapes. Voyons-la fonctionner sur une situation réelle, dans un autre secteur que la carrosserie : une agence bancaire de quartier, sept personnes. Le manager s''appelle Nour. Deux conseillères, Léa et Camille, ne se parlent plus depuis trois semaines. Les clients commencent à le sentir : un dossier de prêt a traîné parce que chacune pensait que l''autre s''en occupait.

[Titre : « Ce qui a été fait de travers d''abord »]

Nour a d''abord fait ce que font beaucoup de managers : elle a réuni Léa et Camille dans son bureau, sans préparation, un vendredi à 17 h 30, et leur a dit : « Bon, vous allez me dire ce qui se passe, et vous allez arrêter, parce que ça se voit. »

[Texte à l''écran, voix off]
LÉA : « Il ne se passe rien. »
CAMILLE : « Demande-lui, c''est elle qui a un problème. »
LÉA : « Moi j''ai un problème ? C''est toi qui as pris mon client. »
NOUR : « Bon, on se calme. Vous êtes adultes, faites un effort, on en reparle lundi. »

[Retour avatar]
Résultat : rien. Le conflit a été rejoué devant le chef, chacune a durci sa position, et Nour a demandé un effort sans rien changer. Lundi, les deux se parlaient encore moins. Reprenons avec la méthode.

[Titre : « Étape 1 — Accueillir »]

Nour convoque Léa mardi à 9 h, Camille à 9 h 30, dans la salle de réunion, porte fermée. Même phrase d''ouverture pour les deux :

[Séquence jouée]
NOUR : « Il y a une difficulté entre Camille et toi qui pèse sur l''agence ; le dossier Martin a pris quatre jours de retard. Je ne cherche pas qui a raison. Je cherche comment on travaille ensemble. Je vais vous écouter chacune, puis on se verra à trois. Ce qu''on se dit ici reste ici. D''accord ? »

[Titre : « Étape 2 — Écouter chacune »]

[Séquence jouée, Léa]
NOUR : « Raconte-moi ce qui s''est passé. »
LÉA : « Le client Rousseau, c''est moi qui le suis depuis deux ans. Camille l''a reçu pendant mes congés et elle lui a ouvert une assurance-vie. Le client est passé dans son portefeuille. Elle ne m''a rien dit. Je l''ai découvert dans l''outil. »
NOUR : « Tu l''as découvert dans l''outil, sans qu''elle t''en parle. » (reformulation)
LÉA : « Oui. Et depuis, je ne lui adresse plus la parole, parce que si je lui parle, je vais dire des choses que je regretterai. »
NOUR : « Qu''est-ce qu''il te faudrait ? »
LÉA : « Que mes clients restent mes clients. Et qu''on me le dise, au moins. »

[Voix off] Position : « mes clients restent mes clients ». Besoin : la reconnaissance de son travail, et l''information.

[Séquence jouée, Camille]
NOUR : « Raconte-moi ce qui s''est passé. »
CAMILLE : « Le client Rousseau est venu pendant les congés de Léa avec un besoin urgent, une succession. Je l''ai traité. L''outil a basculé le client automatiquement dans mon portefeuille, je ne l''ai pas demandé. Quand Léa est revenue, elle ne m''a pas dit bonjour. Alors je n''ai rien dit non plus. »
NOUR : « Tu as traité une urgence, l''outil a fait le transfert, et tu as pris le silence de Léa comme une accusation. »
CAMILLE : « Exactement. Et je ne vais pas m''excuser d''avoir fait mon travail. »
NOUR : « Qu''est-ce qu''il te faudrait ? »
CAMILLE : « Qu''on ne me traite pas comme une voleuse. Et qu''il y ait une règle claire quand on remplace quelqu''un. »

[Voix off] Position : « je ne m''excuserai pas ». Besoin : la reconnaissance, et une règle.

[Titre : « Étape 3 — Objectiver »]

[Retour avatar]
Nour met à plat. Les faits concordent : Camille a traité une urgence, l''outil a transféré le client, personne ne s''est parlé. Le fait divergent, « elle m''a pris mon client », n''est pas un fait ; c''est une interprétation. La source : un rôle flou. Que se passe-t-il quand on reçoit le client d''un collègue absent ? Personne ne l''a jamais dit. Et la règle manque : c''est à Nour de la fixer.

Elle remarque aussi ses propres biais : elle a entendu Léa en premier, elle connaît Léa depuis plus longtemps, et elle avait déjà, en son for intérieur, donné tort à Camille. Elle le met de côté.

[Titre : « Étape 4 — Chercher les options ensemble »]

Jeudi 9 h, à trois. Nour rappelle le cadre, puis expose ce qu''elle a compris, de façon équilibrée.

[Séquence jouée]
NOUR : « Ce que j''ai compris : Camille a traité une urgence pendant les congés de Léa, l''outil a transféré le client, et personne ne s''est parlé au retour. Léa, tu as eu le sentiment qu''on te retirait deux ans de travail. Camille, tu as eu le sentiment d''être traitée en voleuse pour avoir fait ton travail. Et il n''y a pas de règle sur ce qu''on fait quand on remplace un collègue. Ça, c''est de ma responsabilité. Je vous propose que chacune dise à l''autre ce qui s''est passé pour elle, en quatre temps : ce qu''elle a observé, ce qu''elle a ressenti, ce dont elle a besoin, ce qu''elle demande. Léa ? »
LÉA : « Quand je suis rentrée, j''ai vu dans l''outil que Rousseau était dans ton portefeuille. J''ai été blessée, parce que je le suis depuis deux ans. J''ai besoin que mon travail soit reconnu. Je te demande de me prévenir quand tu traites un de mes clients. »
CAMILLE : « Je comprends. Quand tu es rentrée, tu ne m''as pas dit bonjour. J''ai été vexée, parce que j''avais traité une succession en urgence. J''ai besoin qu''on ne me prenne pas pour quelqu''un qui pique des clients. Je te demande de me parler quand quelque chose ne va pas, plutôt que de te taire. »
NOUR : « Qu''est-ce qu''on fait pour que ça fonctionne ? »
CAMILLE : « On peut remettre Rousseau dans le portefeuille de Léa. Je ne tiens pas à le garder. »
LÉA : « Et quand on remplace, on laisse un mot au retour. Un mail, deux lignes. »
NOUR : « Je fixe la règle pour l''agence : un client reçu pendant l''absence de son conseiller reste dans son portefeuille ; le remplaçant lui envoie un mail de passation. Je vais voir avec le siège pour le paramétrage de l''outil. »

[Titre : « Étape 5 — Contractualiser et suivre »]

[Retour avatar]
Trois engagements, reformulés à voix haute et notés : Camille remet le client Rousseau à Léa cette semaine ; toute passation fait l''objet d''un mail au retour ; Nour fixe la règle pour l''agence et voit le siège pour l''outil. Point dans deux semaines. Et Nour ajoute une chose : « Ce conflit vient d''une règle qui manquait. C''était à moi de la poser. » Ce n''est pas de la faiblesse ; c''est ce qui permet aux deux de sortir sans perdre la face.

Deux semaines plus tard, Léa et Camille se parlent. Pas comme des amies ; comme des collègues. C''est tout ce que Nour avait à obtenir.

[Titre : « Ce qu''il faut retenir »]

Trois choses. D''abord : écouter séparément avant de réunir. La première tentative de Nour a échoué là. Ensuite : chercher la source dans l''organisation ; ici, une règle manquante, que le manager pose. Enfin : ne pas trancher entre les personnes, mais organiser leur échange, avec un format qui empêche les attaques, et conclure par des engagements suivis.

Et une quatrième : si Léa avait refusé l''entretien à trois, ou si les attaques avaient continué devant Nour, il aurait fallu un tiers. Passer la main est une décision de manager.

À tout de suite pour les situations difficiles : recadrer, sanctionner, alerter.

[Fondu, logo]

---

Sources : méthode en cinq étapes (leçon 5.4) ; Rosenberg, communication non violente ; Fisher et Ury, positions et intérêts.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 6 and l.ordre = 5;
  n := n + 1;

  -- 5.6-situations-difficiles.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Toutes les tensions ne se résolvent pas par la méthode en cinq étapes. Certaines situations relèvent d''un autre registre : un comportement qui doit cesser, un refus d''obéir, une personne en souffrance, un soupçon de harcèlement. Dans ces situations, le manager de proximité doit savoir précisément ce qu''il fait, ce qu''il ne fait pas, et ce que dit la loi. Se tromper de registre, ou de procédure, coûte cher à la personne, à l''entreprise et au manager lui-même.

## Recadrage et sanction : deux choses différentes

Le recadrage est un acte de management. Il relève du manager de proximité. Vous l''avez vu au module 3 : des faits datés, la règle, l''écoute, l''attente, la conséquence annoncée, la trace. Il n''a pas de forme légale, il n''apparaît pas au dossier disciplinaire, il vise à faire cesser un comportement avant qu''il ne devienne une faute. Un rappel à l''ordre oral, un point de recadrage, une note dans le carnet du manager : ce n''est pas une sanction.

La sanction disciplinaire est un acte de l''employeur. Le Code du travail la définit comme toute mesure, autre que les observations verbales, prise par l''employeur à la suite d''un agissement du salarié considéré comme fautif (art. L1331-1). Avertissement écrit, blâme, mise à pied disciplinaire, mutation ou rétrogradation disciplinaire, licenciement pour faute. Elle obéit à une procédure, elle est encadrée par le règlement intérieur, et elle relève du chef d''entreprise ou de la personne qui a reçu délégation. Dans une petite entreprise, ce peut être le manager de proximité s''il a une délégation écrite ; dans la plupart des cas, ce n''est pas lui.

Les règles que le manager doit connaître, même s''il ne sanctionne pas lui-même :

- Les sanctions pécuniaires (amende, retenue sur salaire) sont interdites (L1331-2).
- Dans les entreprises d''au moins 50 salariés, le règlement intérieur est obligatoire (L1311-2) et il fixe l''échelle des sanctions ; une sanction qui n''y figure pas ne peut pas être prononcée. En dessous de ce seuil, un règlement intérieur reste possible et utile.
- Aucun fait fautif ne peut donner lieu à des poursuites disciplinaires au-delà de deux mois à compter du jour où l''employeur en a eu connaissance (L1332-4). C''est pour cela que le recadrage tracé compte : un manager qui « laisse passer » pendant trois mois avant de remonter a rendu la sanction impossible.
- Une sanction datant de plus de trois ans ne peut plus être invoquée à l''appui d''une nouvelle sanction (L1332-5).
- La sanction doit être proportionnée à la faute, et un même fait ne peut pas être sanctionné deux fois.
- Pour toute sanction qui a une incidence sur la présence, la fonction, la carrière ou la rémunération (donc tout sauf l''avertissement et le blâme simples), la procédure est obligatoire (L1332-2) : convocation écrite à un entretien préalable, entretien où le salarié peut se faire assister par une personne de l''entreprise, puis notification écrite et motivée, au plus tôt deux jours ouvrables après l''entretien et au plus tard un mois après. En cas de faute grave, une mise à pied conservatoire peut être prononcée immédiatement, dans l''attente de la procédure (L1332-3).

Le rôle du manager de proximité dans une procédure disciplinaire : fournir à l''employeur les faits, datés et précis, avec les recadrages déjà faits et leur trace ; ne pas annoncer lui-même une sanction qu''il n''a pas le pouvoir de prononcer ; ne pas en parler à l''équipe ; et, après la sanction, reprendre le management de la personne sans acharnement ni évitement. Une sanction n''est pas une rupture de relation ; c''est un acte qui doit permettre de repartir.

## Les trois catégories d''erreur, et la faute

Le podcast 4.8 distinguait l''erreur d''apprentissage, l''erreur d''inattention et la faute délibérée. Cette distinction guide le registre :

- L''erreur d''apprentissage se traite par le retour d''expérience et l''accompagnement (module 4). Jamais par le recadrage.
- L''erreur d''inattention se traite par le feedback (module 3), puis, si elle se répète malgré les retours, par le recadrage.
- La faute délibérée (contournement d''une règle en connaissance de cause, notamment de sécurité ; comportement inacceptable envers un collègue ou un client ; refus d''exécuter une consigne légitime) se traite par le recadrage immédiat et, selon la gravité, par la remontée à l''employeur pour sanction.

Le manager qui confond les registres fait deux dégâts : il sanctionne l''apprentissage (et détruit la sécurité psychologique), ou il « accompagne » la faute délibérée (et détruit la règle).

## L''insubordination

Un salarié doit exécuter les consignes de l''employeur qui entrent dans le cadre de son contrat et qui sont légitimes. Le refus d''obéir à une consigne légitime est une faute. Mais trois cas font exception, et le manager doit les connaître :

- L''ordre illégal ou contraire à la dignité : un salarié n''a pas à exécuter un ordre qui l''expose à commettre une infraction ou qui porte atteinte à ses droits fondamentaux.
- Le danger grave et imminent : tout salarié a le droit de se retirer d''une situation de travail dont il a un motif raisonnable de penser qu''elle présente un danger grave et imminent pour sa vie ou sa santé, et d''alerter l''employeur (L4131-1). Aucune sanction ne peut être prise pour un retrait légitime (L4131-3).
- La consigne hors contrat : demander une tâche sans rapport avec le poste, ou une modification du contrat (horaires, lieu, rémunération) sans accord.

Face à un refus, le manager ne s''emporte pas et ne tranche pas sur le moment. Il demande la raison (« qu''est-ce qui fait que tu refuses ? »), il note, et il vérifie : si la raison est un danger ou une illégalité, il a lui-même un problème à traiter ; si c''est un refus pur et simple, il recadre (rappel de la consigne, de sa légitimité, de la conséquence), et il remonte. Un refus répété est une faute ; un refus isolé peut cacher une cause à comprendre.

## Le collaborateur en souffrance

Quand la difficulté d''une personne n''est pas un comportement fautif mais une souffrance (épuisement, détresse, addiction, difficulté personnelle qui déborde), le registre disciplinaire est le mauvais. Vous avez vu à la leçon 4.7 ce que fait le manager : voir, écouter sans creuser, agir sur le travail, orienter vers le médecin du travail, alerter la hiérarchie, suivre.

Deux points à ajouter. D''abord, souffrance et faute peuvent coexister : un salarié épuisé peut commettre une faute. On traite les deux, séparément, et on ne se sert pas de la souffrance pour excuser une faute grave ni de la faute pour ignorer la souffrance. Ensuite, certaines situations exigent d''agir sans attendre la volonté de la personne : un salarié manifestement sous l''emprise d''alcool ou de stupéfiants à un poste dangereux doit être retiré du poste immédiatement (obligation de sécurité), raccompagné, et l''employeur informé ; le règlement intérieur prévoit en général la procédure.

## Le soupçon de harcèlement ou de violence

C''est la situation où le manager a le moins le droit à l''erreur. Le harcèlement moral (agissements répétés ayant pour objet ou pour effet une dégradation des conditions de travail susceptible de porter atteinte aux droits, à la dignité, à la santé ou à l''avenir professionnel ; art. L1152-1), le harcèlement sexuel (L1153-1), les agissements sexistes (L1142-2-1), la violence physique ou verbale, sont interdits, et l''employeur a l''obligation de les prévenir et d''y mettre fin (L1152-4, L1153-5). Il doit, dès qu''il est informé, réagir : enquêter, protéger, sanctionner si les faits sont établis (L1152-5).

Ce que fait le manager qui reçoit une plainte, ou qui constate des faits :

1. Il prend au sérieux, sans juger de la véracité : « Merci de me l''avoir dit. Je vais faire ce qu''il faut. » Il ne dit ni « c''est sûrement un malentendu » ni « il va payer ».
2. Il note ce qui lui est dit, avec les mots de la personne, la date, les faits décrits.
3. Il informe sans délai l''employeur (direction, RH) : ce n''est pas une option, c''est l''obligation d''agir de l''employeur qu''il déclenche. Il indique à la personne qu''il le fait, et vers qui.
4. Il protège : si la personne le demande ou si la situation l''exige, il prend les mesures d''organisation immédiates à sa portée (ne pas laisser seuls la personne et l''auteur présumé, aménager les horaires), sans pénaliser la personne qui a parlé.
5. Il oriente vers les relais : le référent harcèlement sexuel et agissements sexistes du CSE (obligatoire dans tout CSE, L2314-1) et celui de l''entreprise dans les entreprises d''au moins 250 salariés (L1153-5-1), le médecin du travail, les représentants du personnel, et, à l''extérieur, l''inspection du travail, le Défenseur des droits, une association.
6. Il ne mène pas l''enquête lui-même et ne confronte pas les personnes : l''enquête est conduite par l''employeur, souvent avec le CSE ou un tiers, selon une procédure. Il y contribue si on le lui demande.
7. Il garde la confidentialité : ni l''équipe, ni les autres managers, ni le café.

Le salarié qui relate ou témoigne de faits de harcèlement de bonne foi est protégé contre toute sanction (L1152-2, L1153-3). Le manager l''est aussi. Le manager qui, informé, ne fait rien, engage la responsabilité de l''employeur et peut engager la sienne.

Si les faits impliquent le manager lui-même comme auteur présumé, le circuit est le même, par-dessus lui : la personne s''adresse à la hiérarchie supérieure, aux RH, au référent, au CSE. Si les faits impliquent la hiérarchie du manager, le manager remonte au niveau supérieur ou saisit directement le CSE ou l''inspection du travail.

## Alerter : le geste du manager

Dans toutes ces situations, un même geste revient : alerter, c''est-à-dire informer par écrit, à temps, la personne qui a le pouvoir d''agir. Un manager de proximité qui a recadré, tracé, et alerté sa hiérarchie a fait son travail, même si la situation ne se règle pas. Un manager qui a « géré seul » pendant des mois, sans trace, a pris sur lui une responsabilité qui n''est pas la sienne, et souvent laissé prescrire les faits.

Le gabarit 5 de la fiche 3.9 (alerte à la hiérarchie) et le gabarit 3 (recadrage) sont les outils. La règle : jamais plus de 48 heures entre un fait grave et son signalement écrit.

## Le cas Garnier

Lucas, l''apprenti, a été surpris par Thierry à utiliser la ponceuse sans lunettes, pour la troisième fois. Erreur d''apprentissage ? Non : la consigne a été donnée, rappelée, et Lucas l''a reconnue. Karim recadre le jour même, dans le bureau : faits, règle (et pourquoi : la projection dans l''œil), écoute (« j''y pense pas, ça me gêne pour voir »), attente (« lunettes à chaque usage, sans exception ; on essaie un autre modèle demain »), conséquence (« si ça se reproduit, j''en informe Michel, et ça peut donner lieu à une sanction »), trace, point dans une semaine. Il informe Michel par écrit ce soir-là. Une quatrième fois serait une faute délibérée, et le registre changerait.

Nadia vient voir Karim, tendue : depuis deux semaines, un client de flotte, qui passe souvent, fait des remarques sur son physique et lui a touché l''épaule en insistant. Karim : « Merci de me l''avoir dit. C''est inacceptable et je vais faire ce qu''il faut. » Il note les faits avec ses mots. Il informe Michel le jour même, par écrit, en demandant que le client soit reçu par Michel et prévenu, et que Nadia ne soit plus seule à le recevoir ; d''ici là, Sophie ou Karim sont présents à chaque restitution de ce client. Il indique à Nadia qu''elle peut aussi en parler au médecin du travail et qu''elle est protégée pour avoir parlé. Il n''en parle à personne d''autre. Michel reçoit le client la semaine suivante ; les remarques cessent. Si Michel n''avait rien fait, Karim aurait eu à saisir l''inspection du travail, et le lui aurait dit.

## À retenir

- Recadrage (manager, acte de management, tracé) et sanction (employeur, procédure L1332-1 et suivants, règlement intérieur, prescription de deux mois, proportionnalité) sont deux registres distincts.
- Erreur d''apprentissage : accompagner. Erreur d''inattention : feedback, puis recadrage si répétition. Faute délibérée : recadrage et remontée.
- Insubordination : c''est une faute, sauf ordre illégal, danger grave et imminent (droit de retrait, L4131-1) ou consigne hors contrat. Demander la raison avant de conclure.
- Collaborateur en souffrance : registre de la leçon 4.7 ; souffrance et faute se traitent séparément ; un salarié en état dangereux est retiré du poste immédiatement.
- Harcèlement ou violence : prendre au sérieux, noter, informer l''employeur sans délai, protéger, orienter (référents, médecin du travail, CSE, inspection), ne pas enquêter soi-même, garder la confidentialité. La personne qui parle de bonne foi est protégée.
- Alerter par écrit, à temps : jamais plus de 48 heures pour un fait grave.

## Sources

- Code du travail : L1331-1, L1331-2, L1311-2, L1332-1 à L1332-5 (discipline) ; L4131-1 et L4131-3 (danger grave et imminent, droit de retrait) ; L1152-1 à L1152-6, L1153-1 à L1153-6, L1142-2-1, L1153-5-1, L2314-1 (harcèlement, agissements sexistes, référents).
- Ministère du Travail, « Le pouvoir disciplinaire de l''employeur », « Harcèlement moral », « Harcèlement sexuel et agissements sexistes au travail », travail-emploi.gouv.fr ; guide « Harcèlement sexuel et agissements sexistes au travail : prévenir, agir, sanctionner », 2019.
- INRS, « Harcèlement et violence interne », inrs.fr.
- Défenseur des droits, defenseurdesdroits.fr.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Toutes les tensions ne se résolvent pas par la méthode en cinq étapes. Certaines situations relèvent d''un autre registre : un comportement qui doit cesser, un refus d''obéir, une personne en souffrance, un soupçon de harcèlement. Dans ces situations, le manager de proximité doit savoir précisément ce qu''il fait, ce qu''il ne fait pas, et ce que dit la loi. Se tromper de registre, ou de procédure, coûte cher à la personne, à l''entreprise et au manager lui-même.

## Recadrage et sanction : deux choses différentes

Le recadrage est un acte de management. Il relève du manager de proximité. Vous l''avez vu au module 3 : des faits datés, la règle, l''écoute, l''attente, la conséquence annoncée, la trace. Il n''a pas de forme légale, il n''apparaît pas au dossier disciplinaire, il vise à faire cesser un comportement avant qu''il ne devienne une faute. Un rappel à l''ordre oral, un point de recadrage, une note dans le carnet du manager : ce n''est pas une sanction.

La sanction disciplinaire est un acte de l''employeur. Le Code du travail la définit comme toute mesure, autre que les observations verbales, prise par l''employeur à la suite d''un agissement du salarié considéré comme fautif (art. L1331-1). Avertissement écrit, blâme, mise à pied disciplinaire, mutation ou rétrogradation disciplinaire, licenciement pour faute. Elle obéit à une procédure, elle est encadrée par le règlement intérieur, et elle relève du chef d''entreprise ou de la personne qui a reçu délégation. Dans une petite entreprise, ce peut être le manager de proximité s''il a une délégation écrite ; dans la plupart des cas, ce n''est pas lui.

Les règles que le manager doit connaître, même s''il ne sanctionne pas lui-même :

- Les sanctions pécuniaires (amende, retenue sur salaire) sont interdites (L1331-2).
- Dans les entreprises d''au moins 50 salariés, le règlement intérieur est obligatoire (L1311-2) et il fixe l''échelle des sanctions ; une sanction qui n''y figure pas ne peut pas être prononcée. En dessous de ce seuil, un règlement intérieur reste possible et utile.
- Aucun fait fautif ne peut donner lieu à des poursuites disciplinaires au-delà de deux mois à compter du jour où l''employeur en a eu connaissance (L1332-4). C''est pour cela que le recadrage tracé compte : un manager qui « laisse passer » pendant trois mois avant de remonter a rendu la sanction impossible.
- Une sanction datant de plus de trois ans ne peut plus être invoquée à l''appui d''une nouvelle sanction (L1332-5).
- La sanction doit être proportionnée à la faute, et un même fait ne peut pas être sanctionné deux fois.
- Pour toute sanction qui a une incidence sur la présence, la fonction, la carrière ou la rémunération (donc tout sauf l''avertissement et le blâme simples), la procédure est obligatoire (L1332-2) : convocation écrite à un entretien préalable, entretien où le salarié peut se faire assister par une personne de l''entreprise, puis notification écrite et motivée, au plus tôt deux jours ouvrables après l''entretien et au plus tard un mois après. En cas de faute grave, une mise à pied conservatoire peut être prononcée immédiatement, dans l''attente de la procédure (L1332-3).

Le rôle du manager de proximité dans une procédure disciplinaire : fournir à l''employeur les faits, datés et précis, avec les recadrages déjà faits et leur trace ; ne pas annoncer lui-même une sanction qu''il n''a pas le pouvoir de prononcer ; ne pas en parler à l''équipe ; et, après la sanction, reprendre le management de la personne sans acharnement ni évitement. Une sanction n''est pas une rupture de relation ; c''est un acte qui doit permettre de repartir.

## Les trois catégories d''erreur, et la faute

Le podcast 4.8 distinguait l''erreur d''apprentissage, l''erreur d''inattention et la faute délibérée. Cette distinction guide le registre :

- L''erreur d''apprentissage se traite par le retour d''expérience et l''accompagnement (module 4). Jamais par le recadrage.
- L''erreur d''inattention se traite par le feedback (module 3), puis, si elle se répète malgré les retours, par le recadrage.
- La faute délibérée (contournement d''une règle en connaissance de cause, notamment de sécurité ; comportement inacceptable envers un collègue ou un client ; refus d''exécuter une consigne légitime) se traite par le recadrage immédiat et, selon la gravité, par la remontée à l''employeur pour sanction.

Le manager qui confond les registres fait deux dégâts : il sanctionne l''apprentissage (et détruit la sécurité psychologique), ou il « accompagne » la faute délibérée (et détruit la règle).

## L''insubordination

Un salarié doit exécuter les consignes de l''employeur qui entrent dans le cadre de son contrat et qui sont légitimes. Le refus d''obéir à une consigne légitime est une faute. Mais trois cas font exception, et le manager doit les connaître :

- L''ordre illégal ou contraire à la dignité : un salarié n''a pas à exécuter un ordre qui l''expose à commettre une infraction ou qui porte atteinte à ses droits fondamentaux.
- Le danger grave et imminent : tout salarié a le droit de se retirer d''une situation de travail dont il a un motif raisonnable de penser qu''elle présente un danger grave et imminent pour sa vie ou sa santé, et d''alerter l''employeur (L4131-1). Aucune sanction ne peut être prise pour un retrait légitime (L4131-3).
- La consigne hors contrat : demander une tâche sans rapport avec le poste, ou une modification du contrat (horaires, lieu, rémunération) sans accord.

Face à un refus, le manager ne s''emporte pas et ne tranche pas sur le moment. Il demande la raison (« qu''est-ce qui fait que tu refuses ? »), il note, et il vérifie : si la raison est un danger ou une illégalité, il a lui-même un problème à traiter ; si c''est un refus pur et simple, il recadre (rappel de la consigne, de sa légitimité, de la conséquence), et il remonte. Un refus répété est une faute ; un refus isolé peut cacher une cause à comprendre.

## Le collaborateur en souffrance

Quand la difficulté d''une personne n''est pas un comportement fautif mais une souffrance (épuisement, détresse, addiction, difficulté personnelle qui déborde), le registre disciplinaire est le mauvais. Vous avez vu à la leçon 4.7 ce que fait le manager : voir, écouter sans creuser, agir sur le travail, orienter vers le médecin du travail, alerter la hiérarchie, suivre.

Deux points à ajouter. D''abord, souffrance et faute peuvent coexister : un salarié épuisé peut commettre une faute. On traite les deux, séparément, et on ne se sert pas de la souffrance pour excuser une faute grave ni de la faute pour ignorer la souffrance. Ensuite, certaines situations exigent d''agir sans attendre la volonté de la personne : un salarié manifestement sous l''emprise d''alcool ou de stupéfiants à un poste dangereux doit être retiré du poste immédiatement (obligation de sécurité), raccompagné, et l''employeur informé ; le règlement intérieur prévoit en général la procédure.

## Le soupçon de harcèlement ou de violence

C''est la situation où le manager a le moins le droit à l''erreur. Le harcèlement moral (agissements répétés ayant pour objet ou pour effet une dégradation des conditions de travail susceptible de porter atteinte aux droits, à la dignité, à la santé ou à l''avenir professionnel ; art. L1152-1), le harcèlement sexuel (L1153-1), les agissements sexistes (L1142-2-1), la violence physique ou verbale, sont interdits, et l''employeur a l''obligation de les prévenir et d''y mettre fin (L1152-4, L1153-5). Il doit, dès qu''il est informé, réagir : enquêter, protéger, sanctionner si les faits sont établis (L1152-5).

Ce que fait le manager qui reçoit une plainte, ou qui constate des faits :

1. Il prend au sérieux, sans juger de la véracité : « Merci de me l''avoir dit. Je vais faire ce qu''il faut. » Il ne dit ni « c''est sûrement un malentendu » ni « il va payer ».
2. Il note ce qui lui est dit, avec les mots de la personne, la date, les faits décrits.
3. Il informe sans délai l''employeur (direction, RH) : ce n''est pas une option, c''est l''obligation d''agir de l''employeur qu''il déclenche. Il indique à la personne qu''il le fait, et vers qui.
4. Il protège : si la personne le demande ou si la situation l''exige, il prend les mesures d''organisation immédiates à sa portée (ne pas laisser seuls la personne et l''auteur présumé, aménager les horaires), sans pénaliser la personne qui a parlé.
5. Il oriente vers les relais : le référent harcèlement sexuel et agissements sexistes du CSE (obligatoire dans tout CSE, L2314-1) et celui de l''entreprise dans les entreprises d''au moins 250 salariés (L1153-5-1), le médecin du travail, les représentants du personnel, et, à l''extérieur, l''inspection du travail, le Défenseur des droits, une association.
6. Il ne mène pas l''enquête lui-même et ne confronte pas les personnes : l''enquête est conduite par l''employeur, souvent avec le CSE ou un tiers, selon une procédure. Il y contribue si on le lui demande.
7. Il garde la confidentialité : ni l''équipe, ni les autres managers, ni le café.

Le salarié qui relate ou témoigne de faits de harcèlement de bonne foi est protégé contre toute sanction (L1152-2, L1153-3). Le manager l''est aussi. Le manager qui, informé, ne fait rien, engage la responsabilité de l''employeur et peut engager la sienne.

Si les faits impliquent le manager lui-même comme auteur présumé, le circuit est le même, par-dessus lui : la personne s''adresse à la hiérarchie supérieure, aux RH, au référent, au CSE. Si les faits impliquent la hiérarchie du manager, le manager remonte au niveau supérieur ou saisit directement le CSE ou l''inspection du travail.

## Alerter : le geste du manager

Dans toutes ces situations, un même geste revient : alerter, c''est-à-dire informer par écrit, à temps, la personne qui a le pouvoir d''agir. Un manager de proximité qui a recadré, tracé, et alerté sa hiérarchie a fait son travail, même si la situation ne se règle pas. Un manager qui a « géré seul » pendant des mois, sans trace, a pris sur lui une responsabilité qui n''est pas la sienne, et souvent laissé prescrire les faits.

Le gabarit 5 de la fiche 3.9 (alerte à la hiérarchie) et le gabarit 3 (recadrage) sont les outils. La règle : jamais plus de 48 heures entre un fait grave et son signalement écrit.

## Le cas Garnier

Lucas, l''apprenti, a été surpris par Thierry à utiliser la ponceuse sans lunettes, pour la troisième fois. Erreur d''apprentissage ? Non : la consigne a été donnée, rappelée, et Lucas l''a reconnue. Karim recadre le jour même, dans le bureau : faits, règle (et pourquoi : la projection dans l''œil), écoute (« j''y pense pas, ça me gêne pour voir »), attente (« lunettes à chaque usage, sans exception ; on essaie un autre modèle demain »), conséquence (« si ça se reproduit, j''en informe Michel, et ça peut donner lieu à une sanction »), trace, point dans une semaine. Il informe Michel par écrit ce soir-là. Une quatrième fois serait une faute délibérée, et le registre changerait.

Nadia vient voir Karim, tendue : depuis deux semaines, un client de flotte, qui passe souvent, fait des remarques sur son physique et lui a touché l''épaule en insistant. Karim : « Merci de me l''avoir dit. C''est inacceptable et je vais faire ce qu''il faut. » Il note les faits avec ses mots. Il informe Michel le jour même, par écrit, en demandant que le client soit reçu par Michel et prévenu, et que Nadia ne soit plus seule à le recevoir ; d''ici là, Sophie ou Karim sont présents à chaque restitution de ce client. Il indique à Nadia qu''elle peut aussi en parler au médecin du travail et qu''elle est protégée pour avoir parlé. Il n''en parle à personne d''autre. Michel reçoit le client la semaine suivante ; les remarques cessent. Si Michel n''avait rien fait, Karim aurait eu à saisir l''inspection du travail, et le lui aurait dit.

## À retenir

- Recadrage (manager, acte de management, tracé) et sanction (employeur, procédure L1332-1 et suivants, règlement intérieur, prescription de deux mois, proportionnalité) sont deux registres distincts.
- Erreur d''apprentissage : accompagner. Erreur d''inattention : feedback, puis recadrage si répétition. Faute délibérée : recadrage et remontée.
- Insubordination : c''est une faute, sauf ordre illégal, danger grave et imminent (droit de retrait, L4131-1) ou consigne hors contrat. Demander la raison avant de conclure.
- Collaborateur en souffrance : registre de la leçon 4.7 ; souffrance et faute se traitent séparément ; un salarié en état dangereux est retiré du poste immédiatement.
- Harcèlement ou violence : prendre au sérieux, noter, informer l''employeur sans délai, protéger, orienter (référents, médecin du travail, CSE, inspection), ne pas enquêter soi-même, garder la confidentialité. La personne qui parle de bonne foi est protégée.
- Alerter par écrit, à temps : jamais plus de 48 heures pour un fait grave.

## Sources

- Code du travail : L1331-1, L1331-2, L1311-2, L1332-1 à L1332-5 (discipline) ; L4131-1 et L4131-3 (danger grave et imminent, droit de retrait) ; L1152-1 à L1152-6, L1153-1 à L1153-6, L1142-2-1, L1153-5-1, L2314-1 (harcèlement, agissements sexistes, référents).
- Ministère du Travail, « Le pouvoir disciplinaire de l''employeur », « Harcèlement moral », « Harcèlement sexuel et agissements sexistes au travail », travail-emploi.gouv.fr ; guide « Harcèlement sexuel et agissements sexistes au travail : prévenir, agir, sanctionner », 2019.
- INRS, « Harcèlement et violence interne », inrs.fr.
- Défenseur des droits, defenseurdesdroits.fr.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 6 and l.ordre = 6;
  n := n + 1;

  -- 5.7-podcast-le-conflit-que-jai-laisse-pourrir.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Format : conversation à deux voix. **CLAIRE** = animatrice IDEAFORMA. **PATRICE** = responsable d''un magasin de bricolage (24 salariés), en poste depuis huit ans, ancien chef de rayon (personnage fictif). Débit : 150 mots/min.
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

**CLAIRE** — Bonjour à tous. Dans ce podcast, un retour d''expérience sur ce que la plupart des managers ont vécu au moins une fois : un conflit qu''on a vu venir, et qu''on a laissé pourrir. Patrice, vous dirigez un magasin de bricolage depuis huit ans. Vous m''avez dit que cette histoire vous avait appris plus que toutes les formations. Racontez-nous le début.

**PATRICE** — Le début, c''est deux chefs de rayon. Appelons-les Bruno et Sandra. Bruno, quinze ans de maison, le rayon outillage, quelqu''un de très compétent et de très sûr de lui. Sandra, arrivée trois ans plus tôt, le rayon jardin, plus jeune, très organisée, très à l''aise avec les outils informatiques. Au début, ils s''entendaient. Et puis on a changé le logiciel de gestion des stocks.

**CLAIRE** — Et là ?

**PATRICE** — Sandra a pris le logiciel en main en une semaine. Bruno a détesté, il a continué à faire ses commandes à sa façon, et il y a eu des erreurs de stock. Sandra, en réunion, a dit quelque chose comme : « Si tout le monde utilisait l''outil, on n''aurait pas ces problèmes. » Devant tout le monde. Bruno l''a pris pour lui. Et c''est parti de là.

**CLAIRE** — Qu''est-ce que vous avez fait à ce moment-là ?

**PATRICE** — Rien. Je me suis dit : c''est une remarque, il va digérer, ils sont adultes. Vous voyez, c''est exactement le niveau 1 de ce que votre formation appelle l''escalier de Glasl. Une crispation. Une heure de conversation aurait suffi. Je ne l''ai pas prise.

**CLAIRE** — Et ensuite ?

**PATRICE** — Ensuite, ça a descendu marche par marche, sur presque un an. D''abord les piques en réunion, dans les deux sens. Bruno qui parlait des « gens qui ne connaissent pas le terrain », Sandra qui parlait des « gens qui refusent d''évoluer ». Niveau 2, la polémique. Je trouvais ça pénible, mais je ne voyais pas un conflit ; je voyais deux caractères.

**CLAIRE** — C''est le biais dont parle la formation : attribuer à la personnalité ce qui vient de la situation.

**PATRICE** — Exactement. Et la situation, c''était quoi ? Un changement d''outil mal accompagné, et une répartition des rôles que je n''avais pas clarifiée : qui était référent sur le logiciel ? Personne. Sandra l''était de fait, Bruno ne le supportait pas, et moi je n''avais rien décidé.

**CLAIRE** — Quand est-ce que ça a basculé ?

**PATRICE** — Au niveau 3, quand ils ont arrêté de se parler. Ils communiquaient par les vendeurs. « Dis à Sandra que… » Et puis au niveau 4, ils ont commencé à recruter. Chacun avait ses vendeurs. Le magasin s''est coupé en deux, l''outillage et le jardin, avec le rayon décoration au milieu qui ne savait plus à qui parler. J''ai vu des vendeurs se lever de table à la pause quand un vendeur de l''autre camp s''asseyait.

**CLAIRE** — Et vous, pendant ce temps ?

**PATRICE** — Je faisais ce que font beaucoup de managers : je compensais. Je passais mon temps à faire l''intermédiaire, à transmettre les informations qui ne passaient plus, à arrondir les angles. Je travaillais deux fois plus pour un magasin qui marchait moins bien. Et je me disais que j''avais la situation en main, puisque le magasin tournait.

**CLAIRE** — Et l''équipe ?

**PATRICE** — L''équipe attendait que je fasse quelque chose. Je l''ai compris beaucoup plus tard, quand une vendeuse m''a dit : « On se demandait pourquoi vous ne faisiez rien. » Pour eux, mon silence voulait dire que je ne les protégeais pas. Ou que j''avais peur de Bruno. Ou que j''avais choisi Sandra. Chacun avait sa théorie. La seule chose qu''ils ne pensaient pas, c''est que je gérais.

**CLAIRE** — Qu''est-ce qui vous a forcé à agir ?

**PATRICE** — Deux choses en une semaine. Un client, d''abord. Il avait acheté une tondeuse au jardin, il venait chercher une pièce à l''outillage, et Bruno lui a dit devant tout le monde : « Ça, c''est le rayon de Sandra, faut voir avec elle, moi je ne sais pas ce qu''elle vend. » Le client a fait une réclamation écrite. Et puis Sandra est venue me voir avec sa lettre de démission. Elle avait trouvé ailleurs. Elle m''a dit : « Je ne pars pas à cause de Bruno. Je pars parce que vous n''avez rien fait. »

**CLAIRE** — C''est dur.

**PATRICE** — C''est juste. Et c''est ce que dit votre leçon : un conflit qu''on laisse pourrir, ça coûte une personne, et c''est rarement la moins bonne. J''ai perdu ma meilleure chef de rayon. Elle est partie. Je n''ai pas réussi à la retenir, et je n''aurais pas dû essayer à ce moment-là ; c''était trop tard.

**CLAIRE** — Qu''est-ce que vous avez fait avec Bruno ?

**PATRICE** — D''abord, l''affaire du client. Ça, c''était une faute : refuser de servir un client et dénigrer une collègue devant lui. J''ai fait un recadrage en règle, avec les faits, et j''ai fait remonter à ma direction, qui a mis un avertissement. Bruno a été très surpris. Il m''a dit : « Ça fait un an que ça dure et c''est maintenant que tu réagis ? » Et il avait raison sur ce point. Ma passivité pendant un an lui avait dit que tout était permis.

**CLAIRE** — Vous aviez laissé la règle s''effacer.

**PATRICE** — Voilà. Quand le manager ne dit rien, la règle, c''est ce que fait le plus fort. Et ensuite, j''ai fait le travail que j''aurais dû faire un an plus tôt. J''ai reconstruit la répartition des rôles, avec un référent logiciel désigné, formé, reconnu. J''ai refait des règles de fonctionnement avec toute l''équipe, en commençant par une : on ne parle pas d''un collègue à un client, jamais. Et j''ai eu un entretien avec chaque vendeur, un par un, pour entendre ce qu''ils avaient vécu. Ça m''a pris un mois. Ça a été un mois très instructif.

**CLAIRE** — Qu''est-ce que vous avez entendu ?

**PATRICE** — Que le clan, ils n''en voulaient pas. Que la plupart avaient choisi un camp par loyauté envers leur chef de rayon, pas par conviction. Qu''ils étaient soulagés que ça s''arrête. Et qu''ils avaient perdu confiance en moi. Ça, ça a pris plus longtemps à réparer. Un an environ.

**CLAIRE** — Si vous deviez refaire le film, à quel moment vous interviendriez ?

**PATRICE** — Le jour de la remarque en réunion. Le jour même. Deux conversations de dix minutes. À Sandra : « Ce que tu as dit sur l''outil était juste, mais le dire comme ça devant tout le monde, ça vise Bruno. Dis-le-lui à lui. » À Bruno : « Le logiciel est là pour rester ; qu''est-ce qu''il te faut pour le prendre en main ? » Et une décision : un référent, une formation, un délai. Fin de l''histoire. Au lieu de ça, un an, une démission, un avertissement, une équipe coupée en deux.

**CLAIRE** — Pourquoi vous ne l''avez pas fait, ce jour-là ? Honnêtement.

**PATRICE** — Honnêtement ? Parce que Bruno m''impressionnait. Quinze ans de maison, il était là avant moi, il connaissait tout. J''avais peur de la confrontation avec lui. Et parce que j''aimais bien Sandra, et que je ne voulais pas la reprendre sur une remarque que je trouvais juste sur le fond. Deux biais, l''affinité et l''évitement, et un manager qui préfère être aimé que faire son travail.

**CLAIRE** — C''est courageux de le dire.

**PATRICE** — C''est surtout utile pour ceux qui écoutent. Parce que la question n''est pas « est-ce que je vais avoir des conflits dans mon équipe ». Vous en aurez. La question, c''est : est-ce que vous allez les traiter au niveau 1, quand ça coûte dix minutes, ou au niveau 5, quand ça coûte une personne.

**CLAIRE** — Et aujourd''hui, comment vous repérez le niveau 1 ?

**PATRICE** — Je me suis fait une règle simple : dès que deux personnes de mon équipe communiquent par un tiers, je vais voir. « Dis à Untel que… », c''est mon signal d''alarme. Et dès qu''une remarque en réunion vise quelqu''un, même juste sur le fond, j''en parle le jour même à celui qui l''a faite. Pas pour le reprendre : pour qu''il aille le dire à la bonne personne.

**CLAIRE** — Et Bruno ?

**PATRICE** — Bruno est toujours là. Il a fini par apprendre le logiciel, avec le référent, qui est un vendeur de son propre rayon. Il n''est pas devenu un autre homme. Mais il ne dénigre plus personne, parce qu''il sait que je réagirai le jour même. La règle est revenue.

**CLAIRE** — Un dernier conseil ?

**PATRICE** — Deux. Le premier : quand vous vous dites « ils sont adultes, ça va se tasser », c''est précisément le moment d''intervenir. Cette phrase, c''est le nom que l''évitement se donne pour être présentable. Le second : quand vous découvrez que vous compensez, que vous faites l''intermédiaire, que vous transmettez à la place des gens, arrêtez. Vous n''êtes pas en train de gérer un conflit. Vous êtes en train de l''entretenir.

**CLAIRE** — Merci Patrice.

**PATRICE** — Merci.

**CLAIRE** — Dans le cas pratique qui suit, vous allez traiter une tension au bureau de l''atelier Garnier, et le carnet de bord vous demandera d''analyser un conflit que vous avez vécu, avec la méthode en cinq étapes.

---

Sources : Friedrich Glasl, niveaux d''escalade ; Thomas et Kilmann, modes de gestion des conflits (évitement) ; leçons 5.2 à 5.6.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Format : conversation à deux voix. **CLAIRE** = animatrice IDEAFORMA. **PATRICE** = responsable d''un magasin de bricolage (24 salariés), en poste depuis huit ans, ancien chef de rayon (personnage fictif). Débit : 150 mots/min.
Charte : voir `contenus/CHARTE-VIDEO-PODCAST.md` (couleurs, présentateur, structure, types d''écrans, son). Les indications entre crochets renvoient aux types d''écrans de la charte.

---

**CLAIRE** — Bonjour à tous. Dans ce podcast, un retour d''expérience sur ce que la plupart des managers ont vécu au moins une fois : un conflit qu''on a vu venir, et qu''on a laissé pourrir. Patrice, vous dirigez un magasin de bricolage depuis huit ans. Vous m''avez dit que cette histoire vous avait appris plus que toutes les formations. Racontez-nous le début.

**PATRICE** — Le début, c''est deux chefs de rayon. Appelons-les Bruno et Sandra. Bruno, quinze ans de maison, le rayon outillage, quelqu''un de très compétent et de très sûr de lui. Sandra, arrivée trois ans plus tôt, le rayon jardin, plus jeune, très organisée, très à l''aise avec les outils informatiques. Au début, ils s''entendaient. Et puis on a changé le logiciel de gestion des stocks.

**CLAIRE** — Et là ?

**PATRICE** — Sandra a pris le logiciel en main en une semaine. Bruno a détesté, il a continué à faire ses commandes à sa façon, et il y a eu des erreurs de stock. Sandra, en réunion, a dit quelque chose comme : « Si tout le monde utilisait l''outil, on n''aurait pas ces problèmes. » Devant tout le monde. Bruno l''a pris pour lui. Et c''est parti de là.

**CLAIRE** — Qu''est-ce que vous avez fait à ce moment-là ?

**PATRICE** — Rien. Je me suis dit : c''est une remarque, il va digérer, ils sont adultes. Vous voyez, c''est exactement le niveau 1 de ce que votre formation appelle l''escalier de Glasl. Une crispation. Une heure de conversation aurait suffi. Je ne l''ai pas prise.

**CLAIRE** — Et ensuite ?

**PATRICE** — Ensuite, ça a descendu marche par marche, sur presque un an. D''abord les piques en réunion, dans les deux sens. Bruno qui parlait des « gens qui ne connaissent pas le terrain », Sandra qui parlait des « gens qui refusent d''évoluer ». Niveau 2, la polémique. Je trouvais ça pénible, mais je ne voyais pas un conflit ; je voyais deux caractères.

**CLAIRE** — C''est le biais dont parle la formation : attribuer à la personnalité ce qui vient de la situation.

**PATRICE** — Exactement. Et la situation, c''était quoi ? Un changement d''outil mal accompagné, et une répartition des rôles que je n''avais pas clarifiée : qui était référent sur le logiciel ? Personne. Sandra l''était de fait, Bruno ne le supportait pas, et moi je n''avais rien décidé.

**CLAIRE** — Quand est-ce que ça a basculé ?

**PATRICE** — Au niveau 3, quand ils ont arrêté de se parler. Ils communiquaient par les vendeurs. « Dis à Sandra que… » Et puis au niveau 4, ils ont commencé à recruter. Chacun avait ses vendeurs. Le magasin s''est coupé en deux, l''outillage et le jardin, avec le rayon décoration au milieu qui ne savait plus à qui parler. J''ai vu des vendeurs se lever de table à la pause quand un vendeur de l''autre camp s''asseyait.

**CLAIRE** — Et vous, pendant ce temps ?

**PATRICE** — Je faisais ce que font beaucoup de managers : je compensais. Je passais mon temps à faire l''intermédiaire, à transmettre les informations qui ne passaient plus, à arrondir les angles. Je travaillais deux fois plus pour un magasin qui marchait moins bien. Et je me disais que j''avais la situation en main, puisque le magasin tournait.

**CLAIRE** — Et l''équipe ?

**PATRICE** — L''équipe attendait que je fasse quelque chose. Je l''ai compris beaucoup plus tard, quand une vendeuse m''a dit : « On se demandait pourquoi vous ne faisiez rien. » Pour eux, mon silence voulait dire que je ne les protégeais pas. Ou que j''avais peur de Bruno. Ou que j''avais choisi Sandra. Chacun avait sa théorie. La seule chose qu''ils ne pensaient pas, c''est que je gérais.

**CLAIRE** — Qu''est-ce qui vous a forcé à agir ?

**PATRICE** — Deux choses en une semaine. Un client, d''abord. Il avait acheté une tondeuse au jardin, il venait chercher une pièce à l''outillage, et Bruno lui a dit devant tout le monde : « Ça, c''est le rayon de Sandra, faut voir avec elle, moi je ne sais pas ce qu''elle vend. » Le client a fait une réclamation écrite. Et puis Sandra est venue me voir avec sa lettre de démission. Elle avait trouvé ailleurs. Elle m''a dit : « Je ne pars pas à cause de Bruno. Je pars parce que vous n''avez rien fait. »

**CLAIRE** — C''est dur.

**PATRICE** — C''est juste. Et c''est ce que dit votre leçon : un conflit qu''on laisse pourrir, ça coûte une personne, et c''est rarement la moins bonne. J''ai perdu ma meilleure chef de rayon. Elle est partie. Je n''ai pas réussi à la retenir, et je n''aurais pas dû essayer à ce moment-là ; c''était trop tard.

**CLAIRE** — Qu''est-ce que vous avez fait avec Bruno ?

**PATRICE** — D''abord, l''affaire du client. Ça, c''était une faute : refuser de servir un client et dénigrer une collègue devant lui. J''ai fait un recadrage en règle, avec les faits, et j''ai fait remonter à ma direction, qui a mis un avertissement. Bruno a été très surpris. Il m''a dit : « Ça fait un an que ça dure et c''est maintenant que tu réagis ? » Et il avait raison sur ce point. Ma passivité pendant un an lui avait dit que tout était permis.

**CLAIRE** — Vous aviez laissé la règle s''effacer.

**PATRICE** — Voilà. Quand le manager ne dit rien, la règle, c''est ce que fait le plus fort. Et ensuite, j''ai fait le travail que j''aurais dû faire un an plus tôt. J''ai reconstruit la répartition des rôles, avec un référent logiciel désigné, formé, reconnu. J''ai refait des règles de fonctionnement avec toute l''équipe, en commençant par une : on ne parle pas d''un collègue à un client, jamais. Et j''ai eu un entretien avec chaque vendeur, un par un, pour entendre ce qu''ils avaient vécu. Ça m''a pris un mois. Ça a été un mois très instructif.

**CLAIRE** — Qu''est-ce que vous avez entendu ?

**PATRICE** — Que le clan, ils n''en voulaient pas. Que la plupart avaient choisi un camp par loyauté envers leur chef de rayon, pas par conviction. Qu''ils étaient soulagés que ça s''arrête. Et qu''ils avaient perdu confiance en moi. Ça, ça a pris plus longtemps à réparer. Un an environ.

**CLAIRE** — Si vous deviez refaire le film, à quel moment vous interviendriez ?

**PATRICE** — Le jour de la remarque en réunion. Le jour même. Deux conversations de dix minutes. À Sandra : « Ce que tu as dit sur l''outil était juste, mais le dire comme ça devant tout le monde, ça vise Bruno. Dis-le-lui à lui. » À Bruno : « Le logiciel est là pour rester ; qu''est-ce qu''il te faut pour le prendre en main ? » Et une décision : un référent, une formation, un délai. Fin de l''histoire. Au lieu de ça, un an, une démission, un avertissement, une équipe coupée en deux.

**CLAIRE** — Pourquoi vous ne l''avez pas fait, ce jour-là ? Honnêtement.

**PATRICE** — Honnêtement ? Parce que Bruno m''impressionnait. Quinze ans de maison, il était là avant moi, il connaissait tout. J''avais peur de la confrontation avec lui. Et parce que j''aimais bien Sandra, et que je ne voulais pas la reprendre sur une remarque que je trouvais juste sur le fond. Deux biais, l''affinité et l''évitement, et un manager qui préfère être aimé que faire son travail.

**CLAIRE** — C''est courageux de le dire.

**PATRICE** — C''est surtout utile pour ceux qui écoutent. Parce que la question n''est pas « est-ce que je vais avoir des conflits dans mon équipe ». Vous en aurez. La question, c''est : est-ce que vous allez les traiter au niveau 1, quand ça coûte dix minutes, ou au niveau 5, quand ça coûte une personne.

**CLAIRE** — Et aujourd''hui, comment vous repérez le niveau 1 ?

**PATRICE** — Je me suis fait une règle simple : dès que deux personnes de mon équipe communiquent par un tiers, je vais voir. « Dis à Untel que… », c''est mon signal d''alarme. Et dès qu''une remarque en réunion vise quelqu''un, même juste sur le fond, j''en parle le jour même à celui qui l''a faite. Pas pour le reprendre : pour qu''il aille le dire à la bonne personne.

**CLAIRE** — Et Bruno ?

**PATRICE** — Bruno est toujours là. Il a fini par apprendre le logiciel, avec le référent, qui est un vendeur de son propre rayon. Il n''est pas devenu un autre homme. Mais il ne dénigre plus personne, parce qu''il sait que je réagirai le jour même. La règle est revenue.

**CLAIRE** — Un dernier conseil ?

**PATRICE** — Deux. Le premier : quand vous vous dites « ils sont adultes, ça va se tasser », c''est précisément le moment d''intervenir. Cette phrase, c''est le nom que l''évitement se donne pour être présentable. Le second : quand vous découvrez que vous compensez, que vous faites l''intermédiaire, que vous transmettez à la place des gens, arrêtez. Vous n''êtes pas en train de gérer un conflit. Vous êtes en train de l''entretenir.

**CLAIRE** — Merci Patrice.

**PATRICE** — Merci.

**CLAIRE** — Dans le cas pratique qui suit, vous allez traiter une tension au bureau de l''atelier Garnier, et le carnet de bord vous demandera d''analyser un conflit que vous avez vécu, avec la méthode en cinq étapes.

---

Sources : Friedrich Glasl, niveaux d''escalade ; Thomas et Kilmann, modes de gestion des conflits (évitement) ; leçons 5.2 à 5.6.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 6 and l.ordre = 7;
  n := n + 1;

  -- 5.8-cas-pratique-tension-bureau-garnier.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Deux situations, à traiter par écrit avant de lire le corrigé. Comptez 25 minutes. Utilisez la méthode en cinq étapes (leçon 5.4), la grille des registres (leçon 5.6) et les gabarits de la fiche 3.9.

## Situation A — Thierry, Amine et Julien

Amine, le nouveau peintre, est arrivé il y a six semaines. Thierry, carrossier depuis 28 ans et référent qualité, n''a jamais été franchement hostile, mais il multiplie les remarques : « À l''époque, on n''avait pas besoin de trois couches pour faire une aile. » « Le nouveau, il connaît les logiciels, mais un vrai atelier, c''est autre chose. » Julien, qui admire Thierry, rit et renchérit. Nadia a dit à Karim, en aparté, qu''Amine mange seul depuis dix jours. Hier, au brief, Amine a proposé de changer le circuit des pièces (il l''avait signalé dès sa première semaine) ; Thierry a répondu, devant tout le monde : « Quand tu auras fait tes preuves, on en reparlera. » Amine n''a rien dit. Marc a levé les yeux au ciel.

Question A1 — À quel niveau d''escalade est-on ? Quelle est la source du conflit (rôles, ressources, valeurs, personnes) ? Qu''est-ce que Karim a fait, ou pas fait, qui y a contribué ?

Question A2 — Karim doit-il traiter la remarque d''hier ? Comment, avec qui, dans quel registre (feedback, recadrage, méthode en cinq étapes) ?

Question A3 — Que fait Karim pour Amine ? Pour Julien ?

Question A4 — Quelle décision d''organisation Karim doit-il prendre, et comment l''annonce-t-il ?

## Situation B — Sophie et Fatou

Depuis que Fatou prépare les pièces la veille (décision de la première réunion d''équipe, module 3), elle passe au bureau chaque soir pour consulter les commandes. Sophie s''en plaint à Karim : « Elle est tout le temps dans mes papiers, elle touche à mon ordinateur, et hier elle a dit à Michel qu''une commande n''était pas partie alors que c''est faux. » Fatou, interrogée, dit que Sophie « refuse de lui donner les informations » et qu''elle « a juste répondu à Michel qui lui posait la question ». Karim apprend par Michel que ce dernier a effectivement demandé à Fatou, en passant, où en était la commande de la 3008, et que Fatou a répondu qu''elle ne l''avait pas vue partir. Depuis, Sophie ne dit plus bonjour à Fatou.

Question B1 — Quels sont les faits établis, les faits divergents, et l''interprétation ? Quelle est la source ?

Question B2 — Y a-t-il un triangle dramatique en train de se former ? Avec qui dans chaque rôle ? Quel est le piège pour Karim ?

Question B3 — Conduisez la méthode en cinq étapes : rédigez la phrase d''ouverture de Karim, deux questions pour chaque entretien séparé, ce que Karim met à plat, et les engagements que vous imaginez.

Question B4 — Y a-t-il ici quelque chose qui relève d''un autre registre (recadrage, sanction, alerte) ?

---

# Corrigé

## Situation A

A1. Niveau 2 (polémique, piques répétées devant les autres) qui bascule vers le niveau 3 (Amine ne répond plus, s''isole) et le niveau 4 (Thierry recrute Julien ; Marc commence à prendre position). Source principale : les valeurs et manières de faire (la conception du métier, l''ancien contre le nouveau), doublée d''une ressource (la place de référent, la reconnaissance de Thierry, déjà repérée au module 4). Ce n''est pas un conflit de personnes : Thierry ne connaît pas Amine. Ce que Karim n''a pas fait : traiter la première pique il y a six semaines ; répondre à la proposition d''Amine sur le circuit des pièces, signalée dès la première semaine (Amine a le sentiment de ne pas être entendu, ce qui l''a poussé à la porter en public) ; formaliser le rôle de référent de Thierry, promis au module 4. Le manager a sa part.

A2. Oui, le jour même, et dans deux registres. La remarque « quand tu auras fait tes preuves », devant tout le monde, est un manquement à la règle du jeu « quand on n''est pas d''accord avec quelqu''un, on lui dit à lui, pas aux autres » et un comportement qui exclut un membre de l''équipe. C''est un feedback correctif à Thierry, en privé, en SBI : les faits (la remarque d''hier, les précédentes), l''impact (Amine s''isole, l''équipe se divise, une proposition utile a été balayée), l''attente (les remarques sur le travail d''Amine se font à Amine, ou à Karim ; devant l''équipe, on parle du travail, pas de « faire ses preuves »), et une question. Si Thierry répète, ce sera un recadrage. La méthode en cinq étapes n''est pas le bon outil ici, parce qu''il n''y a pas deux parties en conflit : il y a un comportement à faire cesser, et une personne à protéger. En revanche, Karim traite en même temps le vrai sujet de Thierry : « Tu as l''impression que l''arrivée d''Amine te retire quelque chose. On en parle. » Et il tient sa promesse : le rôle de référent qualité, formalisé avec Michel.

A3. Pour Amine : un entretien de suivi rapide, factuel (« j''ai vu ce qui s''est passé hier, et je vois que tu manges seul »), pour écouter, dire que la remarque était inacceptable et qu''elle a été traitée (sans détailler), et répondre enfin à sa proposition sur le circuit des pièces : l''examiner sérieusement, avec lui, et, si elle est bonne, la mettre en œuvre en le disant. Rien ne réintègre mieux quelqu''un qu''une idée à lui adoptée par l''équipe. Pour Julien : un mot en privé, court : « Rire avec Thierry, c''est prendre parti. Tu as été le nouveau il y a deux ans. » Julien n''est pas fautif ; il suit. On lui donne l''occasion de ne plus suivre.

A4. La décision : le rôle de chacun sur la peinture (Nadia référente peinture, Amine peintre à part entière, Thierry référent qualité toutes finitions confondues) inscrit dans le RACI, et la règle du jeu rappelée à l''équipe. Karim l''annonce au brief, sans citer l''incident : « Trois choses claires à partir d''aujourd''hui… » Et il traite la proposition d''Amine en réunion, en la présentant comme venant d''Amine. Si l''idée est retenue, Thierry sera associé à sa mise en œuvre : un ancien qui contribue au changement ne le combat plus.

## Situation B

B1. Faits établis : Fatou consulte le bureau chaque soir (c''est la conséquence d''une décision d''équipe) ; Michel a posé une question à Fatou ; Fatou a répondu ce qu''elle savait ; Sophie ne dit plus bonjour. Faits divergents : « elle touche à mon ordinateur » (à vérifier : a-t-elle besoin d''y accéder ? y a-t-elle un accès prévu ?) ; « Sophie refuse de donner les informations » (à vérifier : qu''a demandé Fatou, qu''a répondu Sophie ?). Interprétation : « elle a dit à Michel que… alors que c''est faux » ; Sophie lit une dénonciation là où il y a une réponse à une question. Source : un rôle flou. La décision « Fatou prépare les pièces la veille » n''a pas dit comment Fatou accède à l''information sur les commandes : qui lui donne quoi, sous quelle forme, à quelle heure. Sophie vit l''intrusion dans son espace ; Fatou vit le refus d''accès. Aucune des deux n''a tort sur son besoin.

B2. Oui. Sophie se présente en victime (« elle est tout le temps dans mes papiers »), désigne Fatou en persécutrice, et cherche en Karim un sauveur qui « dira à Fatou de ne plus venir ». Fatou, de son côté, se présente aussi en victime (« elle refuse »). Michel, par sa question en passant, a joué sans le vouloir un rôle de déclencheur. Le piège pour Karim : sauver Sophie (interdire à Fatou le bureau, ce qui casse la préparation des pièces) ou sauver Fatou (ordonner à Sophie de tout lui donner, ce qui humilie Sophie), c''est-à-dire trancher sur une version et entrer dans le triangle. Sortir du triangle : ramener les deux à leur responsabilité et traiter la règle qui manque.

B3. Ouverture (à chacune, séparément) : « Il y a une difficulté entre Fatou et toi sur l''accès aux commandes, et depuis deux jours vous ne vous parlez plus. Je ne cherche pas qui a raison. Je cherche comment on fait pour que la préparation des pièces fonctionne sans que le bureau soit envahi. Je vous écoute chacune, puis on se voit à trois. » Questions à Sophie : « Qu''est-ce que Fatou vient chercher exactement chaque soir ? » « Qu''est-ce qu''il te faudrait pour que ça ne te dérange plus ? » Questions à Fatou : « De quelle information as-tu besoin, et à quelle heure au plus tard ? » « Qu''est-ce que tu as demandé à Sophie, et qu''est-ce qu''elle t''a répondu ? » Mise à plat : Fatou a besoin, chaque jour à 16 h, de la liste des pièces reçues et attendues pour les véhicules du lendemain ; Sophie a besoin que personne ne touche à son poste et de ne pas être mise en cause auprès de Michel ; personne n''a organisé la transmission ; la réponse de Fatou à Michel n''était pas une dénonciation. Engagements possibles : Sophie imprime (ou envoie) à 16 h la liste des pièces du lendemain ; Fatou ne vient au bureau que si la liste manque, et le dit à Sophie ; Karim demande à Michel de passer par lui pour les questions de suivi de commandes (ce qui règle le déclencheur) ; point dans deux semaines. Et Karim reconnaît sa part : « La décision de préparer la veille, c''était la bonne, mais je n''ai pas dit comment l''information circulait. »

B4. Non, au stade actuel : pas de faute, pas de souffrance signalée, pas de harcèlement. Deux vigilances tout de même. La première : « elle touche à mon ordinateur » peut cacher une question de confidentialité (données clients, paie) ; si Fatou a accédé à des données qu''elle n''avait pas à voir, c''est une règle à poser, pas une faute, puisque personne ne l''avait dite. La seconde : Sophie qui ne dit plus bonjour à Fatou, si cela durait et s''accompagnait d''autres mises à l''écart, deviendrait un comportement à recadrer, parce qu''un isolement répété d''une collègue n''est pas un simple désaccord. À ce stade, c''est un signal faible que la méthode en cinq étapes doit suffire à lever.

## Ce que ce cas illustre

Deux tensions, deux traitements. La première n''est pas un conflit entre deux parties mais un comportement d''exclusion : elle se traite par le feedback, le recadrage si besoin, la protection de la personne visée, et une décision d''organisation qui traite la cause (la reconnaissance de Thierry, le rôle de chacun). La seconde est un vrai conflit à deux, né d''un rôle flou : elle se traite par la méthode en cinq étapes, en refusant le triangle, et par la règle que le manager pose. Dans les deux cas, le manager cherche d''abord sa propre part et la cause organisationnelle. Et dans les deux cas, attendre aurait coûté beaucoup plus cher.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Deux situations, à traiter par écrit avant de lire le corrigé. Comptez 25 minutes. Utilisez la méthode en cinq étapes (leçon 5.4), la grille des registres (leçon 5.6) et les gabarits de la fiche 3.9.

## Situation A — Thierry, Amine et Julien

Amine, le nouveau peintre, est arrivé il y a six semaines. Thierry, carrossier depuis 28 ans et référent qualité, n''a jamais été franchement hostile, mais il multiplie les remarques : « À l''époque, on n''avait pas besoin de trois couches pour faire une aile. » « Le nouveau, il connaît les logiciels, mais un vrai atelier, c''est autre chose. » Julien, qui admire Thierry, rit et renchérit. Nadia a dit à Karim, en aparté, qu''Amine mange seul depuis dix jours. Hier, au brief, Amine a proposé de changer le circuit des pièces (il l''avait signalé dès sa première semaine) ; Thierry a répondu, devant tout le monde : « Quand tu auras fait tes preuves, on en reparlera. » Amine n''a rien dit. Marc a levé les yeux au ciel.

Question A1 — À quel niveau d''escalade est-on ? Quelle est la source du conflit (rôles, ressources, valeurs, personnes) ? Qu''est-ce que Karim a fait, ou pas fait, qui y a contribué ?

Question A2 — Karim doit-il traiter la remarque d''hier ? Comment, avec qui, dans quel registre (feedback, recadrage, méthode en cinq étapes) ?

Question A3 — Que fait Karim pour Amine ? Pour Julien ?

Question A4 — Quelle décision d''organisation Karim doit-il prendre, et comment l''annonce-t-il ?

## Situation B — Sophie et Fatou

Depuis que Fatou prépare les pièces la veille (décision de la première réunion d''équipe, module 3), elle passe au bureau chaque soir pour consulter les commandes. Sophie s''en plaint à Karim : « Elle est tout le temps dans mes papiers, elle touche à mon ordinateur, et hier elle a dit à Michel qu''une commande n''était pas partie alors que c''est faux. » Fatou, interrogée, dit que Sophie « refuse de lui donner les informations » et qu''elle « a juste répondu à Michel qui lui posait la question ». Karim apprend par Michel que ce dernier a effectivement demandé à Fatou, en passant, où en était la commande de la 3008, et que Fatou a répondu qu''elle ne l''avait pas vue partir. Depuis, Sophie ne dit plus bonjour à Fatou.

Question B1 — Quels sont les faits établis, les faits divergents, et l''interprétation ? Quelle est la source ?

Question B2 — Y a-t-il un triangle dramatique en train de se former ? Avec qui dans chaque rôle ? Quel est le piège pour Karim ?

Question B3 — Conduisez la méthode en cinq étapes : rédigez la phrase d''ouverture de Karim, deux questions pour chaque entretien séparé, ce que Karim met à plat, et les engagements que vous imaginez.

Question B4 — Y a-t-il ici quelque chose qui relève d''un autre registre (recadrage, sanction, alerte) ?

---

# Corrigé

## Situation A

A1. Niveau 2 (polémique, piques répétées devant les autres) qui bascule vers le niveau 3 (Amine ne répond plus, s''isole) et le niveau 4 (Thierry recrute Julien ; Marc commence à prendre position). Source principale : les valeurs et manières de faire (la conception du métier, l''ancien contre le nouveau), doublée d''une ressource (la place de référent, la reconnaissance de Thierry, déjà repérée au module 4). Ce n''est pas un conflit de personnes : Thierry ne connaît pas Amine. Ce que Karim n''a pas fait : traiter la première pique il y a six semaines ; répondre à la proposition d''Amine sur le circuit des pièces, signalée dès la première semaine (Amine a le sentiment de ne pas être entendu, ce qui l''a poussé à la porter en public) ; formaliser le rôle de référent de Thierry, promis au module 4. Le manager a sa part.

A2. Oui, le jour même, et dans deux registres. La remarque « quand tu auras fait tes preuves », devant tout le monde, est un manquement à la règle du jeu « quand on n''est pas d''accord avec quelqu''un, on lui dit à lui, pas aux autres » et un comportement qui exclut un membre de l''équipe. C''est un feedback correctif à Thierry, en privé, en SBI : les faits (la remarque d''hier, les précédentes), l''impact (Amine s''isole, l''équipe se divise, une proposition utile a été balayée), l''attente (les remarques sur le travail d''Amine se font à Amine, ou à Karim ; devant l''équipe, on parle du travail, pas de « faire ses preuves »), et une question. Si Thierry répète, ce sera un recadrage. La méthode en cinq étapes n''est pas le bon outil ici, parce qu''il n''y a pas deux parties en conflit : il y a un comportement à faire cesser, et une personne à protéger. En revanche, Karim traite en même temps le vrai sujet de Thierry : « Tu as l''impression que l''arrivée d''Amine te retire quelque chose. On en parle. » Et il tient sa promesse : le rôle de référent qualité, formalisé avec Michel.

A3. Pour Amine : un entretien de suivi rapide, factuel (« j''ai vu ce qui s''est passé hier, et je vois que tu manges seul »), pour écouter, dire que la remarque était inacceptable et qu''elle a été traitée (sans détailler), et répondre enfin à sa proposition sur le circuit des pièces : l''examiner sérieusement, avec lui, et, si elle est bonne, la mettre en œuvre en le disant. Rien ne réintègre mieux quelqu''un qu''une idée à lui adoptée par l''équipe. Pour Julien : un mot en privé, court : « Rire avec Thierry, c''est prendre parti. Tu as été le nouveau il y a deux ans. » Julien n''est pas fautif ; il suit. On lui donne l''occasion de ne plus suivre.

A4. La décision : le rôle de chacun sur la peinture (Nadia référente peinture, Amine peintre à part entière, Thierry référent qualité toutes finitions confondues) inscrit dans le RACI, et la règle du jeu rappelée à l''équipe. Karim l''annonce au brief, sans citer l''incident : « Trois choses claires à partir d''aujourd''hui… » Et il traite la proposition d''Amine en réunion, en la présentant comme venant d''Amine. Si l''idée est retenue, Thierry sera associé à sa mise en œuvre : un ancien qui contribue au changement ne le combat plus.

## Situation B

B1. Faits établis : Fatou consulte le bureau chaque soir (c''est la conséquence d''une décision d''équipe) ; Michel a posé une question à Fatou ; Fatou a répondu ce qu''elle savait ; Sophie ne dit plus bonjour. Faits divergents : « elle touche à mon ordinateur » (à vérifier : a-t-elle besoin d''y accéder ? y a-t-elle un accès prévu ?) ; « Sophie refuse de donner les informations » (à vérifier : qu''a demandé Fatou, qu''a répondu Sophie ?). Interprétation : « elle a dit à Michel que… alors que c''est faux » ; Sophie lit une dénonciation là où il y a une réponse à une question. Source : un rôle flou. La décision « Fatou prépare les pièces la veille » n''a pas dit comment Fatou accède à l''information sur les commandes : qui lui donne quoi, sous quelle forme, à quelle heure. Sophie vit l''intrusion dans son espace ; Fatou vit le refus d''accès. Aucune des deux n''a tort sur son besoin.

B2. Oui. Sophie se présente en victime (« elle est tout le temps dans mes papiers »), désigne Fatou en persécutrice, et cherche en Karim un sauveur qui « dira à Fatou de ne plus venir ». Fatou, de son côté, se présente aussi en victime (« elle refuse »). Michel, par sa question en passant, a joué sans le vouloir un rôle de déclencheur. Le piège pour Karim : sauver Sophie (interdire à Fatou le bureau, ce qui casse la préparation des pièces) ou sauver Fatou (ordonner à Sophie de tout lui donner, ce qui humilie Sophie), c''est-à-dire trancher sur une version et entrer dans le triangle. Sortir du triangle : ramener les deux à leur responsabilité et traiter la règle qui manque.

B3. Ouverture (à chacune, séparément) : « Il y a une difficulté entre Fatou et toi sur l''accès aux commandes, et depuis deux jours vous ne vous parlez plus. Je ne cherche pas qui a raison. Je cherche comment on fait pour que la préparation des pièces fonctionne sans que le bureau soit envahi. Je vous écoute chacune, puis on se voit à trois. » Questions à Sophie : « Qu''est-ce que Fatou vient chercher exactement chaque soir ? » « Qu''est-ce qu''il te faudrait pour que ça ne te dérange plus ? » Questions à Fatou : « De quelle information as-tu besoin, et à quelle heure au plus tard ? » « Qu''est-ce que tu as demandé à Sophie, et qu''est-ce qu''elle t''a répondu ? » Mise à plat : Fatou a besoin, chaque jour à 16 h, de la liste des pièces reçues et attendues pour les véhicules du lendemain ; Sophie a besoin que personne ne touche à son poste et de ne pas être mise en cause auprès de Michel ; personne n''a organisé la transmission ; la réponse de Fatou à Michel n''était pas une dénonciation. Engagements possibles : Sophie imprime (ou envoie) à 16 h la liste des pièces du lendemain ; Fatou ne vient au bureau que si la liste manque, et le dit à Sophie ; Karim demande à Michel de passer par lui pour les questions de suivi de commandes (ce qui règle le déclencheur) ; point dans deux semaines. Et Karim reconnaît sa part : « La décision de préparer la veille, c''était la bonne, mais je n''ai pas dit comment l''information circulait. »

B4. Non, au stade actuel : pas de faute, pas de souffrance signalée, pas de harcèlement. Deux vigilances tout de même. La première : « elle touche à mon ordinateur » peut cacher une question de confidentialité (données clients, paie) ; si Fatou a accédé à des données qu''elle n''avait pas à voir, c''est une règle à poser, pas une faute, puisque personne ne l''avait dite. La seconde : Sophie qui ne dit plus bonjour à Fatou, si cela durait et s''accompagnait d''autres mises à l''écart, deviendrait un comportement à recadrer, parce qu''un isolement répété d''une collègue n''est pas un simple désaccord. À ce stade, c''est un signal faible que la méthode en cinq étapes doit suffire à lever.

## Ce que ce cas illustre

Deux tensions, deux traitements. La première n''est pas un conflit entre deux parties mais un comportement d''exclusion : elle se traite par le feedback, le recadrage si besoin, la protection de la personne visée, et une décision d''organisation qui traite la cause (la reconnaissance de Thierry, le rôle de chacun). La seconde est un vrai conflit à deux, né d''un rôle flou : elle se traite par la méthode en cinq étapes, en refusant le triangle, et par la règle que le manager pose. Dans les deux cas, le manager cherche d''abord sa propre part et la cause organisationnelle. Et dans les deux cas, attendre aurait coûté beaucoup plus cher.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 6 and l.ordre = 8;
  n := n + 1;

  -- 5.9-carnet-application.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Vous avez vu ce qu''est un conflit et comment il s''aggrave, ses sources, le triangle dramatique et vos biais, la prévention, la méthode en cinq étapes, et les situations qui relèvent du recadrage, de la sanction ou de l''alerte. À vous d''appliquer cela à une situation réelle. Comptez 40 minutes. Utilisez les gabarits de la fiche 3.9.

Si vous n''encadrez pas d''équipe, travaillez sur une tension que vous avez vécue comme membre d''une équipe, en vous mettant à la place du manager, ou sur l''une des situations du cas pratique en la transposant dans votre secteur.

## Étape 1 — Choisir et décrire une tension vécue (10 min)

- Choisissez une tension ou un conflit que vous avez vécu ou observé dans une équipe, récent de préférence. Décrivez-le en cinq lignes, en faits uniquement : qui, quoi, quand, ce qui s''est dit et fait. Barrez tout jugement (« il est de mauvaise foi ») et remplacez-le par un fait.
- À quel niveau de l''escalier de Glasl est-il, ou était-il, quand vous l''avez repéré ? Quels signaux faibles avaient précédé ?
- Quelle est sa source, dans l''ordre de recherche : rôles flous, ressources, valeurs et manières de faire, personnes ?
- Qu''est-ce que le manager (vous, ou un autre) a fait ou pas fait qui y a contribué ?

## Étape 2 — Le triangle et les biais (5 min)

- Qui, dans cette situation, s''est placé en victime, en persécuteur, en sauveur ? Le manager est-il entré dans le triangle ? Par quel rôle ?
- Quel biais a joué sur le manager : la première version, l''affinité, l''attribution, la recherche du coupable, l''évitement déguisé, le passage en force ?

## Étape 3 — Rejouer avec la méthode en cinq étapes (15 min)

- Étape 1, accueillir : écrivez la phrase d''ouverture que vous diriez à chaque partie.
- Étape 2, écouter : pour chaque partie, notez sa position (ce qu''elle réclame) et, derrière, son besoin. Écrivez deux questions ouvertes par personne.
- Étape 3, objectiver : les faits qui concordent, les faits divergents, la source, la règle qui existe ou qui manque.
- Étape 4, options : formulez, en quatre temps de la communication non violente (observation, sentiment, besoin, demande), ce que chaque partie pourrait dire à l''autre. Puis listez deux options qui répondent aux besoins des deux.
- Étape 5, contractualiser : deux ou trois engagements, dont au moins un du manager (la règle, la décision d''organisation), et la date du point de suivi.
- Si la situation était réelle et encore ouverte : allez-vous la traiter ? Quand ?

## Étape 4 — Le bon registre (5 min)

- Dans votre situation, y a-t-il un élément qui relève d''un autre registre que la résolution de conflit : un comportement fautif (recadrage, puis remontée), une souffrance (leçon 4.7), un soupçon de harcèlement ou de violence (alerte immédiate) ?
- Si oui : à qui l''auriez-vous signalé, sous quelle forme, dans quel délai ? Connaissez-vous, dans votre entreprise, la procédure disciplinaire (règlement intérieur, qui sanctionne), le référent harcèlement, le médecin du travail ?
- Y a-t-il un moment où il aurait fallu passer la main à un tiers (RH, médiateur) ? L''auriez-vous fait ? Qu''est-ce qui vous aurait retenu ?

## Étape 5 — Prévention dans mon équipe (5 min)

- Mon équipe a-t-elle des règles du jeu explicites ? Sinon, à quelle date je tiens la réunion pour les construire ? Quelle est la règle que j''imposerai si l''équipe ne la propose pas ?
- Quel rituel de régulation j''installe (point « ce qui nous a compliqué la vie », rétrospective) ? Quand ?
- Quel signal faible je repère aujourd''hui dans mon équipe, et que je vais aller voir cette semaine ?
- Quand je me dis « ça va se tasser » : de quelle situation s''agit-il, en ce moment ?

Conservez ce carnet : le module 6 (piloter la performance, accompagner le changement) reprend le retour d''expérience comme outil, y compris sur les conflits traités.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Vous avez vu ce qu''est un conflit et comment il s''aggrave, ses sources, le triangle dramatique et vos biais, la prévention, la méthode en cinq étapes, et les situations qui relèvent du recadrage, de la sanction ou de l''alerte. À vous d''appliquer cela à une situation réelle. Comptez 40 minutes. Utilisez les gabarits de la fiche 3.9.

Si vous n''encadrez pas d''équipe, travaillez sur une tension que vous avez vécue comme membre d''une équipe, en vous mettant à la place du manager, ou sur l''une des situations du cas pratique en la transposant dans votre secteur.

## Étape 1 — Choisir et décrire une tension vécue (10 min)

- Choisissez une tension ou un conflit que vous avez vécu ou observé dans une équipe, récent de préférence. Décrivez-le en cinq lignes, en faits uniquement : qui, quoi, quand, ce qui s''est dit et fait. Barrez tout jugement (« il est de mauvaise foi ») et remplacez-le par un fait.
- À quel niveau de l''escalier de Glasl est-il, ou était-il, quand vous l''avez repéré ? Quels signaux faibles avaient précédé ?
- Quelle est sa source, dans l''ordre de recherche : rôles flous, ressources, valeurs et manières de faire, personnes ?
- Qu''est-ce que le manager (vous, ou un autre) a fait ou pas fait qui y a contribué ?

## Étape 2 — Le triangle et les biais (5 min)

- Qui, dans cette situation, s''est placé en victime, en persécuteur, en sauveur ? Le manager est-il entré dans le triangle ? Par quel rôle ?
- Quel biais a joué sur le manager : la première version, l''affinité, l''attribution, la recherche du coupable, l''évitement déguisé, le passage en force ?

## Étape 3 — Rejouer avec la méthode en cinq étapes (15 min)

- Étape 1, accueillir : écrivez la phrase d''ouverture que vous diriez à chaque partie.
- Étape 2, écouter : pour chaque partie, notez sa position (ce qu''elle réclame) et, derrière, son besoin. Écrivez deux questions ouvertes par personne.
- Étape 3, objectiver : les faits qui concordent, les faits divergents, la source, la règle qui existe ou qui manque.
- Étape 4, options : formulez, en quatre temps de la communication non violente (observation, sentiment, besoin, demande), ce que chaque partie pourrait dire à l''autre. Puis listez deux options qui répondent aux besoins des deux.
- Étape 5, contractualiser : deux ou trois engagements, dont au moins un du manager (la règle, la décision d''organisation), et la date du point de suivi.
- Si la situation était réelle et encore ouverte : allez-vous la traiter ? Quand ?

## Étape 4 — Le bon registre (5 min)

- Dans votre situation, y a-t-il un élément qui relève d''un autre registre que la résolution de conflit : un comportement fautif (recadrage, puis remontée), une souffrance (leçon 4.7), un soupçon de harcèlement ou de violence (alerte immédiate) ?
- Si oui : à qui l''auriez-vous signalé, sous quelle forme, dans quel délai ? Connaissez-vous, dans votre entreprise, la procédure disciplinaire (règlement intérieur, qui sanctionne), le référent harcèlement, le médecin du travail ?
- Y a-t-il un moment où il aurait fallu passer la main à un tiers (RH, médiateur) ? L''auriez-vous fait ? Qu''est-ce qui vous aurait retenu ?

## Étape 5 — Prévention dans mon équipe (5 min)

- Mon équipe a-t-elle des règles du jeu explicites ? Sinon, à quelle date je tiens la réunion pour les construire ? Quelle est la règle que j''imposerai si l''équipe ne la propose pas ?
- Quel rituel de régulation j''installe (point « ce qui nous a compliqué la vie », rétrospective) ? Quand ?
- Quel signal faible je repère aujourd''hui dans mon équipe, et que je vais aller voir cette semaine ?
- Quand je me dis « ça va se tasser » : de quelle situation s''agit-il, en ce moment ?

Conservez ce carnet : le module 6 (piloter la performance, accompagner le changement) reprend le retour d''expérience comme outil, y compris sur les conflits traités.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 6 and l.ordre = 9;
  n := n + 1;

  raise notice 'Contenus importés : % leçons', n;
end $$;
