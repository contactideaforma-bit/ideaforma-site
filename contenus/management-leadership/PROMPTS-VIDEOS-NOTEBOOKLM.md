# Prompts vidéo NotebookLM — Management & Leadership

Prompts prêts à coller dans NotebookLM (Google) pour produire les vidéos de chaque module avec la fonction « Vue d'ensemble vidéo » (Video Overview). Un prompt par vidéo prévue dans la conception, plus un prompt de vidéo récapitulative par module.

## Mode d'emploi

1. Créez un carnet NotebookLM par module (« IDEAFORMA — M&L — Module N »).
2. Importez comme sources le fichier `contenus/CHARTE-VIDEO-PODCAST.md` et les fichiers `.md` du module (dossier `contenus/management-leadership/0N-module-N/`). Importez au minimum le script de la vidéo concernée et les leçons écrites qu'elle introduit. Pour les modules 6 et 7, attendez que les contenus soient rédigés (phase P4) ; les prompts ci-dessous sont déjà prêts.
3. Dans le studio, choisissez « Vue d'ensemble vidéo », puis « Personnaliser ». Collez le bloc commun suivi du prompt de la vidéo. Choisissez le format « Explication » (pas « Résumé ») et un style visuel sobre (classique ou tableau blanc). Langue de sortie : français (réglage du carnet).
4. Générez, visionnez, et regénérez si la vidéo s'écarte du script : NotebookLM reformule à partir des sources, il ne lit pas le script mot à mot. Pour une lecture mot à mot avec avatar, c'est la phase P5 (HeyGen, Synthesia ou équivalent) avec les scripts tels quels.
5. Exportez la vidéo, puis déposez-la dans le bucket `contenus` de Supabase et renseignez le chemin dans l'éditeur de leçon (type vidéo).

Limites connues : durée générée de 3 à 10 minutes environ ; pas de contrôle exact de la durée ; les chiffres et noms propres doivent être vérifiés à l'écran ; pas d'avatar humain.

---

## Bloc commun (à coller en tête de chaque prompt)

```
Tu produis une vidéo de formation professionnelle pour IDEAFORMA, organisme de formation certifié Qualiopi. Public : adultes en poste ou en recherche d'emploi, managers de proximité débutants ou futurs managers, tous secteurs (l'exemple fil rouge est un atelier de carrosserie, mais les principes valent pour un commerce, un bureau, un service).

Règles impératives :
- Langue : français, vouvoiement, ton chaleureux, direct et concret. Jamais de jargon non expliqué.
- Suis fidèlement la structure et les formulations du script fourni dans les sources (fichier indiqué ci-dessous). N'ajoute aucune notion, aucun chiffre, aucune référence qui n'est pas dans les sources. N'invente ni témoignage ni statistique.
- Cite les auteurs et textes exactement comme les sources (Mintzberg, Kotter, Code du travail, etc.).
- Visuel (charte IDEAFORMA, importer aussi le fichier CHARTE-VIDEO-PODCAST.md comme source) : fond gris très clair (#F6F9FC) sur tous les écrans, jamais de fond sombre. Couleurs : bleu (#2F8BD6) pour les titres et mots clés, bleu marine (#0B2545) pour le texte des titres, orange (#FF6B35) pour un seul élément à retenir par écran, bleu pâle (#EAF4FC) pour les encadrés. Vert (#22A06B) et rouge (#D64545) uniquement pour opposer « ce qui marche » et « ce qui échoue ». Titres en Poppins, texte en Inter. Pictogrammes au trait monochromes, pas d'emojis, pas de photos de banque, pas de clipart. Schémas simples : un schéma, une idée. Transitions : fondu et glissement léger uniquement, pas de zoom ni d'effet 3D.
- Structure fixe : carton d'ouverture (logo, titre de la leçon, module), accroche, plan annoncé, développement avec le bandeau « À l'atelier Garnier » pour le cas, écran « À retenir » en 4 ou 5 points, transition vers la leçon suivante, carton de fin avec ideaforma.fr.
- Structure : une accroche, le plan annoncé, le développement avec l'exemple de l'atelier Garnier, un « à retenir » en 4 ou 5 points, et une phrase de transition vers la leçon suivante.
- Ne mentionne pas NotebookLM, ni « les sources », ni « ce document » : parle comme le formateur qui s'adresse à l'apprenant.
```

---

## Module 0 — Bienvenue et méthode de travail

Sources à importer : `0.1-video-bienvenue.md`, `0.2-methode.md`, `00-CONCEPTION.md` (partie objectifs et modules).

### Vidéo 0.1 — Bienvenue dans votre formation

```
Script à suivre : 0.1-video-bienvenue.md. Durée cible : 8 à 10 minutes.
Objectif : accueillir l'apprenant, présenter IDEAFORMA en deux phrases, expliquer pourquoi on ne naît pas manager, présenter les 8 modules et les 35 heures, la méthode de travail (vidéos, cours écrits, podcasts, fiches outils, cas pratiques, carnets de bord, quiz à 70 %), le fil rouge de l'atelier Garnier, et les règles de l'espace élève (accès dans la période attribuée, contenus protégés, aide par le formulaire de contact).
Insiste sur la posture : prendre des notes, faire les carnets de bord, appliquer dans sa propre équipe.
Ne parle pas de certification comme acquise : la formation est alignée sur le référentiel RS7377 mais la certification n'est proposée qu'après habilitation.
Termine par une invitation à faire l'autopositionnement (leçon 0.3).
```

### Vidéo récapitulative (optionnelle) — Comment travailler cette formation

```
Sources : 0.2-methode.md. Durée cible : 4 minutes.
Objectif : vidéo courte d'aide à la méthode, à regarder avant chaque module : comment lire un cours, quand faire les carnets de bord, comment réussir les quiz, que faire en cas de difficulté. Format tableau blanc, très visuel, une idée par écran.
```

---

## Module 1 — Comprendre le rôle du manager

Sources à importer : tous les fichiers de `01-module-1/`.

### Vidéo 1.1 — Manager, leader, chef : de quoi parle-t-on ?

```
Script à suivre : 1.1-video-manager-leader-chef.md. Durée cible : 10 minutes.
Objectif : définir manager, leader et chef ; présenter les dix rôles du manager selon Mintzberg (regroupés en interpersonnels, informationnels, décisionnels) ; expliquer la différence entre management et leadership selon Kotter (gérer la complexité / conduire le changement) et montrer qu'un manager de proximité doit faire les deux.
Illustre chaque groupe de rôles par une situation de Karim à l'atelier Garnier.
Affiche un schéma des dix rôles de Mintzberg. Termine sur l'idée que le rôle s'apprend, et annonce la leçon 1.2.
```

### Vidéo 1.4 — Adapter son style à la personne : le leadership situationnel

```
Script à suivre : 1.4-video-leadership-situationnel.md. Durée cible : 10 minutes.
Objectif : présenter le modèle de Hersey et Blanchard : le style de management dépend du niveau d'autonomie de la personne sur une tâche donnée (compétence et motivation). Les quatre styles : diriger, entraîner, épauler, déléguer. Une même personne peut être autonome sur une tâche et débutante sur une autre.
Utilise les membres de l'atelier Garnier comme exemples : Lucas l'apprenti (diriger), Julien (entraîner), Nadia (épauler sur la formation des autres), Thierry (déléguer).
Affiche la matrice à quatre cases. Mets en garde contre le style unique et contre le « déléguer » qui est en réalité un abandon.
Termine en annonçant le podcast 1.5 sur le passage de collègue à manager.
```

### Vidéo récapitulative — Module 1 en 5 minutes

```
Sources : tout le module 1. Durée cible : 5 minutes.
Objectif : rappel des points clés avant le quiz : définitions, dix rôles de Mintzberg, management et leadership (Kotter), leadership situationnel, responsabilités légales du manager (obligation de sécurité, délégation de pouvoir, ce qui relève de l'employeur), la relation avec la hiérarchie, les 90 premiers jours. Un écran par point, format tableau blanc.
```

---

## Module 2 — Organiser et structurer le travail de l'équipe

Sources à importer : tous les fichiers de `02-module-2/`.

### Vidéo 2.1 — De la stratégie de l'entreprise aux objectifs de l'équipe

```
Script à suivre : 2.1-video-strategie-objectifs.md. Durée cible : 8 minutes.
Objectif : expliquer la cascade stratégie de l'entreprise → objectifs du service → objectifs de l'équipe → objectifs individuels ; à quoi sert un objectif (donner une direction, permettre de mesurer, permettre d'arbitrer) ; ce qui se passe quand il n'y en a pas.
Exemple : Michel veut « que ça tourne » ; Karim traduit en trois objectifs pour le trimestre (95 % de délais tenus, au plus une reprise par mois, planning validé chaque soir à 17 h).
Affiche la cascade sous forme de schéma en quatre niveaux. Annonce la leçon 2.2 sur les objectifs SMART et les travaux de Locke et Latham.
```

### Vidéo 2.5 — Déléguer sans lâcher

```
Script à suivre : 2.5-video-deleguer.md. Durée cible : 10 minutes.
Objectif : pourquoi déléguer (temps du manager, développement des personnes, robustesse de l'équipe) ; ce qui se délègue et ce qui ne se délègue pas (le recadrage, la sanction, la responsabilité finale, la sécurité) ; les niveaux de délégation (de « fais et rends compte » à « décide et informe-moi ») ; le contrat de délégation : quoi, jusqu'où, avec quels moyens, quel point de contrôle.
Exemple : Karim délègue à Thierry le contrôle des finitions et à Sophie les demandes non urgentes, avec un contrat clair pour chacun.
Affiche l'échelle des niveaux de délégation. Mets en garde contre les deux excès : tout garder, tout lâcher.
```

### Vidéo récapitulative — Module 2 en 5 minutes

```
Sources : tout le module 2. Durée cible : 5 minutes.
Objectif : rappel avant le quiz : cascade d'objectifs, objectifs SMART (Locke et Latham), matrice de compétences, matrice RACI, niveaux de délégation, matrice d'Eisenhower pour prioriser, tableau de bord à trois familles d'indicateurs (résultat, moyens, garde-fou), organiser sans exclure une personne en situation de handicap (aménagement de poste, médecin du travail, RQTH). Un écran par outil.
```

---

## Module 3 — Communiquer, animer, conduire les entretiens

Sources à importer : tous les fichiers de `03-module-3/`.

### Vidéo 3.1 — La communication du manager : 80 % du métier

```
Script à suivre : 3.1-video-communication-du-manager.md. Durée cible : 7 à 8 minutes.
Objectif : montrer qu'un manager ne peut pas ne pas communiquer (Watzlawick) : son silence est un message ; présenter les quatre situations (écrit, oral individuel, réunion, hiérarchie) et leurs règles ; les trois principes qui traversent tout : les faits d'abord, le bon canal, l'écoute avant la parole.
Exemples : le retard de Lucas non commenté, la peinture de Nadia non félicitée, une réorganisation annoncée par e-mail.
Affiche le schéma des quatre situations. Annonce la leçon 3.2 sur l'écoute active.
```

### Vidéo 3.4 — Le feedback en pratique : trois mises en situation

```
Script à suivre : 3.4-video-feedback-en-pratique.md, en appui sur 3.3-feedback.md. Durée cible : 10 minutes.
Objectif : montrer la méthode SBI (situation, comportement, impact, attente) sur trois situations : le retard répété de Lucas, l'erreur client de Julien (la coulure de vernis), le très bon travail de Nadia. Pour chaque situation, présente d'abord la version qui échoue puis la version qui marche, avec les dialogues du script.
Affiche à l'écran les répliques clés, avec les quatre étapes SBI surlignées au fur et à mesure. Fais ressortir : faits datés, impact concret, attente précise, question finale, correctif en privé et positif en public, trace écrite.
Termine sur « le feedback n'est pas un talent, c'est une méthode » et annonce l'entretien de suivi (3.5).
```

### Vidéo récapitulative — Module 3 en 5 minutes

```
Sources : tout le module 3. Durée cible : 5 minutes.
Objectif : rappel avant le quiz : on ne peut pas ne pas communiquer ; écoute active (silence, reformulation, questions ouvertes, suspension du jugement) et les quatre biais ; SBI et DESC ; l'entretien de suivi en cinq temps ; entretien annuel (facultatif) et entretien de parcours professionnel (obligatoire, loi du 24 octobre 2025 : première année, puis tous les quatre ans, 45 ans, avant 60 ans, bilan à huit ans) ; la réunion utile (objet, rituels, ordre du jour, relevé de décisions) ; communiquer vers le haut (faits, impact, options, écrit après l'oral). Un écran par point.
```

---

## Module 4 — Motiver, engager, faire progresser

Sources à importer : tous les fichiers de `04-module-4/`.

### Vidéo 4.1 — Ce qui motive vraiment au travail

```
Script à suivre : 4.1-video-motivation.md. Durée cible : 10 minutes.
Objectif : présenter trois modèles complémentaires : Herzberg (facteurs d'hygiène qui évitent l'insatisfaction, facteurs de motivation qui créent l'engagement) ; la théorie de l'autodétermination de Deci et Ryan (trois besoins : autonomie, compétence, lien) ; le principe du progrès d'Amabile et Kramer (ce qui motive le plus au quotidien est le sentiment d'avancer dans un travail qui a du sens).
Déduis-en ce que le manager de proximité peut faire concrètement, sans budget : donner de l'autonomie, faire progresser, reconnaître, rendre visibles les petites victoires.
Exemple : à l'atelier Garnier, ce qui a démotivé Marc et ce qui a remotivé Julien.
Affiche un schéma en trois colonnes (Herzberg, Deci et Ryan, Amabile). Annonce la leçon 4.2 sur la sécurité psychologique.
```

### Vidéo récapitulative — Module 4 en 5 minutes

```
Sources : tout le module 4. Durée cible : 5 minutes.
Objectif : rappel avant le quiz : motivation (Herzberg, Deci et Ryan, principe du progrès), sécurité psychologique (Edmondson, projet Aristotle de Google) et les comportements du manager, reconnaître sans flatter, développer les compétences (plan de développement, tutorat, CPF, modèle GROW), intégrer un nouvel arrivant, cadre de travail soutenable (charge, QVCT, télétravail, droit à la déconnexion), prévenir les risques psychosociaux (INRS) et ce qui relève du manager, de l'employeur, du médecin du travail.
```

---

## Module 5 — Gérer les tensions et les conflits

Sources à importer : tous les fichiers de `05-module-5/`.

### Vidéo 5.1 — Le conflit n'est pas le problème

```
Script à suivre : 5.1-video-conflit.md. Durée cible : 8 minutes.
Objectif : distinguer le conflit de tâche (désaccord sur le travail, souvent utile) du conflit de relation (attaque des personnes, toujours coûteux) ; présenter les niveaux d'escalade de Glasl en trois grandes phases (on peut encore se parler, on ne cherche plus qu'à gagner, on cherche à nuire) ; montrer le coût de l'évitement : un conflit ignoré ne disparaît pas, il descend les marches.
Exemple : la tension entre Sophie et Karim sur le circuit des demandes, traitée tôt, contre la tension entre Thierry et Julien laissée sans réponse.
Affiche l'escalier de Glasl simplifié. Annonce la leçon 5.2.
```

### Vidéo 5.5 — Deux collègues qui ne se parlent plus

```
Script à suivre : 5.5-video-deux-collegues.md, en appui sur 5.4-resoudre.md. Durée cible : 10 minutes.
Objectif : mise en situation commentée pas à pas : deux membres de l'équipe ne se parlent plus, le travail en pâtit, le manager applique la méthode en cinq étapes (accueillir, écouter chaque partie séparément, objectiver les faits, chercher les options ensemble, contractualiser et suivre). Montre les répliques du script, puis le commentaire du formateur après chaque étape.
Fais ressortir : ne pas prendre parti, écouter séparément avant de réunir, parler des faits et des besoins (communication non violente de Rosenberg), fixer un point de suivi, savoir quand passer la main à une médiation ou aux RH.
Termine par les erreurs à éviter : ignorer, trancher sans écouter, réunir trop tôt.
```

### Vidéo récapitulative — Module 5 en 4 minutes

```
Sources : tout le module 5. Durée cible : 4 minutes.
Objectif : rappel avant le quiz : conflit de tâche et de relation, escalade de Glasl, sources de conflit, triangle dramatique de Karpman, prévention (règles co-construites, rituels, signaux faibles), méthode en cinq étapes, communication non violente, recadrage et sanction (ce que le manager fait et ne fait pas), collaborateur en souffrance et soupçon de harcèlement : obligation d'agir et circuits (RH, CSE, médecin du travail, référent harcèlement).
```

---

## Module 6 — Piloter la performance et accompagner le changement

Sources à importer : tous les fichiers de `06-module-6/` (à rédiger en phase P4).

### Vidéo 6.1 — Évaluer sans juger : le bilan d'activité

```
Script à suivre : 6.1-video-bilan-activite.md. Durée cible : 8 minutes.
Objectif : expliquer comment évaluer l'activité collective de l'équipe (résultats obtenus, moyens engagés, conditions de réalisation) à partir du tableau de bord du module 2 ; distinguer clairement l'évaluation de l'activité (collective, factuelle, régulière) de l'évaluation des personnes (individuelle, encadrée, module 3) ; montrer qu'un bilan d'activité sert à décider, pas à désigner des coupables.
Exemple : le bilan du trimestre à l'atelier Garnier (91 % de délais tenus, une reprise, planning validé 18 soirs sur 20) et les décisions qui en sortent.
Affiche la grille résultats / moyens / conditions. Annonce la leçon 6.2 sur le retour d'expérience.
```

### Vidéo 6.5 — Annoncer un changement impopulaire

```
Script à suivre : 6.5-video-changement-impopulaire.md, en appui sur 6.4-conduire-le-changement.md. Durée cible : 10 minutes.
Objectif : mise en situation commentée : le manager doit annoncer à l'équipe un changement décidé au-dessus de lui et mal accueilli (nouvel outil, nouveaux horaires ou nouvelle organisation). Montre la version qui échoue (annonce par e-mail, « ce n'est pas moi qui décide », pas d'écoute) puis la version qui marche : préparer, annoncer en réunion, dire le pourquoi, dire ce qui change et ce qui ne change pas, écouter les objections sans les balayer, porter la décision sans la désavouer, fixer les étapes et un point de suivi.
Relie aux étapes de Kotter (sentiment d'urgence, vision, communication, victoires rapides) et à la courbe d'adaptation (les réactions sont normales et passent par des phases).
Termine par les trois erreurs qui coûtent le plus cher.
```

### Vidéo récapitulative — Module 6 en 5 minutes

```
Sources : tout le module 6. Durée cible : 5 minutes.
Objectif : rappel avant le quiz : bilan d'activité, retour d'expérience et rétrospective, amélioration continue (PDCA de Deming, cinq pourquoi, Ishikawa, QQOQCP), conduite du changement (huit étapes de Kotter, courbe d'adaptation, résistances, manager relais), management à distance et hybride (confiance, rituels, équité).
```

---

## Module 7 — Évaluation finale et plan d'action

Sources à importer : `7.3-plan-action-30-60-90.md`, `7.4-video-et-apres.md`, `00-CONCEPTION.md`.

### Vidéo 7.4 — Et après ? Ressources, certification, suite de parcours

```
Script à suivre : 7.4-video-et-apres.md. Durée cible : 8 minutes.
Objectif : féliciter l'apprenant pour les 35 heures parcourues ; rappeler ce qu'il a construit (ses carnets de bord, son plan d'action 30-60-90 jours) et l'inviter à le mettre en œuvre dès la semaine suivante ; proposer des lectures pour aller plus loin (uniquement celles citées dans les sources de la formation) ; expliquer la suite possible : certification RS7377 lorsque IDEAFORMA sera habilitée (ne pas présenter comme acquise), autres formations IDEAFORMA ; demander de remplir le questionnaire de satisfaction et rappeler comment joindre IDEAFORMA.
Ton : chaleureux et conclusif, sans emphase. Termine par une phrase courte et mémorable sur le fait que le management s'apprend en le pratiquant.
```

---

## Prompts complémentaires

### Bande-annonce de la formation (page publique du site, 60 à 90 secondes)

```
Sources : 00-CONCEPTION.md et 0.1-video-bienvenue.md. Durée cible : 60 à 90 secondes.
Objectif : présenter la formation Management & Leadership d'IDEAFORMA à un futur apprenant ou à un employeur : à qui elle s'adresse, 35 heures en 8 modules, ce qu'on y apprend (rôle du manager, organiser, communiquer, motiver, gérer les conflits, piloter et accompagner le changement), la méthode (vidéos, podcasts, cas pratique fil rouge, carnets de bord, quiz), l'alignement sur le référentiel RS7377. Rythme rapide, un écran par module, pas de promesse de certification ni de résultat chiffré. Termine par « Renseignez-vous sur ideaforma.fr ».
```

### Consignes de régénération (si la première vidéo ne convient pas)

```
Regénère en respectant strictement : fond clair sur tous les écrans ; pas d'emojis ; aucune information absente des sources ; vouvoiement ; l'exemple de l'atelier Garnier avec les prénoms exacts (Michel, Sophie, Karim, Thierry, Nadia, Julien, Lucas, Fatou, Marc) ; la structure du script dans l'ordre ; durée plus courte / plus longue [préciser].
```
