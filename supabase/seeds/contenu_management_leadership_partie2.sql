-- ============================================================
-- IDEAFORMA — import du contenu des leçons (partie 2/2) : management-leadership
-- Généré par contenus/outils/generer_import.py — relançable (écrase le contenu des leçons listées).
-- Prérequis : la formation et son squelette (modules + leçons) existent.
-- ============================================================
do $$
declare f uuid; n int := 0;
begin
  select id into f from public.formations where slug = 'management-leadership';
  if f is null then raise exception 'formation introuvable'; end if;

  -- 4.11-quiz.json
  update public.lecons l set contenu = '{"questions": [{"id": "m4q01", "enonce": "Selon Herzberg, qu''est-ce qu''un facteur d''hygiène (salaire, conditions de travail, relation avec le chef) ?", "options": ["Un facteur qui, lorsqu''il est satisfaisant, suffit à lui seul à créer chez le salarié une motivation durable et profonde", "Un facteur qui ne concerne que l''hygiène et la sécurité des locaux", "Un facteur sans effet mesurable sur la satisfaction des salariés", "Un facteur dont la dégradation crée de l''insatisfaction, sans que son amélioration suffise à motiver"], "bonnes": [3], "explication": "Les facteurs d''hygiène évitent le désengagement ; ce sont les facteurs de motivation (accomplissement, reconnaissance, intérêt du travail, responsabilité, progression) qui créent l''engagement."}, {"id": "m4q02", "enonce": "Quels sont les trois besoins de la théorie de l''autodétermination de Deci et Ryan ?", "options": ["Autonomie, compétence, lien", "Salaire, sécurité, statut", "Pouvoir, réussite, affiliation", "Reconnaissance, prime, promotion"], "bonnes": [0], "explication": "Quand l''autonomie, la compétence et le lien sont nourris, la motivation vient de l''intérieur ; quand ils sont frustrés, aucune prime ne compense."}, {"id": "m4q03", "enonce": "D''après Amabile et Kramer (principe du progrès), qu''est-ce qui distingue le plus une bonne journée de travail d''une mauvaise ?", "options": ["Le montant de la prime ou des avantages obtenus dans le mois, comparé à celui des collègues", "Le sentiment d''avancer dans un travail qui a du sens, même à petits pas", "Le nombre d''heures travaillées dans la journée", "L''absence de toute difficulté ou de tout imprévu"], "bonnes": [1], "explication": "Les petites victoires quotidiennes nourrissent la motivation plus que les grandes récompenses ; le sentiment de reculer (travail refait, obstacle) est ce qui la plombe."}, {"id": "m4q04", "enonce": "Qu''est-ce que la sécurité psychologique au sens d''Amy Edmondson ?", "options": ["Une équipe où règne le consensus, où chacun reste aimable et où l''on évite les sujets qui fâchent pour préserver la bonne ambiance", "Un dispositif de prévention des risques physiques obligatoire dans les ateliers", "La conviction partagée que l''on peut poser une question, admettre une erreur ou contester sans être puni ni humilié", "Un management sans exigence, où les erreurs ne sont jamais relevées"], "bonnes": [2], "explication": "La sécurité psychologique se combine avec l''exigence : c''est ce qui permet de se dire les choses difficiles, pas de les éviter."}, {"id": "m4q05", "enonce": "Dans l''étude d''Edmondson en milieu hospitalier, pourquoi les meilleures équipes déclaraient-elles plus d''erreurs ?", "options": ["Parce qu''elles osaient davantage les signaler", "Parce qu''elles en commettaient réellement davantage", "Parce qu''elles étaient moins expérimentées que les autres équipes", "Parce que la direction leur imposait un nombre minimal de déclarations"], "bonnes": [0], "explication": "Les erreurs existaient partout ; les équipes où l''on osait parler les déclaraient davantage, ce qui permettait de les traiter. Ailleurs, elles restaient cachées."}, {"id": "m4q06", "enonce": "Plusieurs réponses. Quels comportements du manager construisent la sécurité psychologique ?", "options": ["Ne jamais dire « je ne sais pas », pour préserver son autorité", "Admettre ses propres erreurs devant l''équipe", "Remercier la personne qui signale un problème, même si elle s''est trompée", "Poser des limites aux moqueries et au mépris dans l''équipe"], "bonnes": [1, 2, 3], "explication": "Un manager qui ne se trompe jamais et sait tout pousse les autres à cacher et à se taire. Admettre ses erreurs, remercier celui qui signale et poser des limites font partie des cinq comportements de la leçon 4.2."}, {"id": "m4q07", "enonce": "Selon la typologie de Brun et Dugas, quelle forme de reconnaissance permet de reconnaître aussi ceux qui n''ont pas encore de résultats (débutants, tâches ingrates) ?", "options": ["La reconnaissance des résultats, parce que c''est la seule forme de reconnaissance qui soit objectivement mesurable et donc équitable", "La prime de fin d''année, versée à tous", "La comparaison avec les collègues les plus performants", "La reconnaissance de la pratique de travail et de l''investissement (la manière de faire, l''effort)"], "bonnes": [3], "explication": "Ne reconnaître que les résultats, c''est ne reconnaître que les meilleurs. La manière de faire et l''effort se reconnaissent chez tous, et la reconnaissance existentielle (bonjour, informer, consulter) est la base."}, {"id": "m4q08", "enonce": "Dans le modèle GROW pour un entretien de progression, que signifie le « O » ?", "options": ["Objectif : ce que la personne veut être capable de faire", "Obstacles : ce qui empêche la personne de progresser", "Options : les pistes possibles, celles de la personne d''abord", "Ordre : la consigne précise que le manager donne à la fin de l''entretien pour la suite du travail"], "bonnes": [2], "explication": "G = Goal (objectif), R = Reality (réalité), O = Options, W = Will (engagement). Le manager questionne plus qu''il ne conseille."}, {"id": "m4q09", "enonce": "Un nouveau salarié arrive lundi. Quelle formation est obligatoire dès son arrivée selon le Code du travail (art. L4141-2) ?", "options": ["Une formation au management et à la communication", "Une formation aux outils informatiques de l''entreprise", "Une formation pratique et appropriée à la sécurité", "Aucune formation n''est obligatoire avant la fin de la période d''essai"], "bonnes": [2], "explication": "La formation à la sécurité est obligatoire pour tout nouvel embauché, mais aussi pour les salariés qui changent de poste et pour les intérimaires. Il est prudent d''en garder une trace écrite."}, {"id": "m4q10", "enonce": "Sophie, seule à un poste administratif, demande un jour de télétravail. L''entreprise n''a ni accord collectif ni charte. Que dit le Code du travail (L1222-9) ?", "options": ["Le télétravail peut être mis en place par simple accord entre le salarié et l''employeur, formalisé par tout moyen", "Le télétravail est impossible tant qu''aucun accord collectif ni aucune charte n''ont été adoptés dans l''entreprise, quelle que soit sa taille", "L''employeur peut l''imposer à tout moment, même hors circonstances exceptionnelles", "Le télétravail est réservé aux salariés ayant le statut de cadre"], "bonnes": [0], "explication": "À défaut d''accord collectif ou de charte, un accord individuel suffit. Le télétravail est volontaire des deux côtés, sauf circonstances exceptionnelles."}, {"id": "m4q11", "enonce": "Quelle est la limite légale de la durée quotidienne de travail (hors dérogations) et du repos quotidien ?", "options": ["8 heures de travail, 8 heures de repos", "12 heures de travail, 10 heures de repos", "Aucune limite légale ne s''applique si le salarié donne son accord écrit", "10 heures de travail, 11 heures de repos consécutives"], "bonnes": [3], "explication": "Art. L3121-18 et L3131-1. S''y ajoutent 48 h par semaine, 44 h en moyenne sur douze semaines, 35 h de repos hebdomadaire et 20 min de pause dès 6 h de travail."}, {"id": "m4q12", "enonce": "Thierry arrive plus tôt, ne prend plus de pause, fait des erreurs inhabituelles et a eu un accrochage. Quelle est la bonne conduite du manager ?", "options": ["Lui dire qu''il présente tous les signes d''un burn-out, lui conseiller de demander un arrêt à son médecin traitant et réorganiser l''équipe en attendant", "Le voir seul avec des faits, écouter sans creuser la vie privée, agir sur le travail, rappeler l''accès au médecin du travail, alerter si nécessaire, suivre", "Attendre qu''il se plaigne lui-même, pour ne pas s''immiscer dans sa vie privée", "Aborder la situation en réunion d''équipe pour que chacun puisse le soutenir"], "bonnes": [1], "explication": "Le manager repère, écoute, agit sur le travail, oriente, alerte et suit ; il ne pose pas de diagnostic. Tout salarié peut demander à être examiné par le médecin du travail, sans que cette demande puisse être sanctionnée (art. R4624-34)."}, {"id": "m4q13", "enonce": "Deci a montré un effet contre-intuitif des récompenses. Lequel ?", "options": ["Une prime augmente toujours la motivation, quelle que soit l''activité et quel que soit l''intérêt que la personne y trouvait déjà", "Les récompenses n''ont aucun effet mesurable sur le comportement", "Dans certaines conditions, récompenser financièrement une activité que les gens aimaient faire diminue leur intérêt pour elle", "Seules les récompenses en nature motivent durablement"], "bonnes": [2], "explication": "La récompense externe peut remplacer le plaisir interne. Cela ne veut pas dire qu''il ne faut jamais récompenser, mais que la motivation ne s''achète pas."}, {"id": "m4q14", "enonce": "Selon Edmondson, que produit une équipe où l''exigence est forte mais la sécurité psychologique faible ?", "options": ["Une zone d''anxiété : on cache les erreurs et on se tait", "Une zone d''apprentissage et de performance, parce que l''exigence pousse chacun à progresser", "Une zone de confort", "Une zone d''apathie"], "bonnes": [0], "explication": "Sécurité sans exigence = confort ; exigence sans sécurité = anxiété ; les deux ensemble = apprentissage. Le manager tient les deux."}, {"id": "m4q15", "enonce": "Comment traite-t-on les trois catégories d''erreur (apprentissage, inattention, faute délibérée) ?", "options": ["Toutes de la même façon, par une remarque devant l''équipe pour que chacun en tire la leçon", "Toutes par une sanction graduée, pour que le traitement soit identique et donc juste", "Aucune ne doit être relevée par le manager, afin de préserver la sécurité psychologique de l''équipe et de ne décourager personne de signaler ses erreurs", "Apprentissage : on en tire les leçons ; inattention : on cherche la cause et on en reparle si ça se répète ; faute délibérée : recadrage, voire sanction"], "bonnes": [3], "explication": "Le droit à l''erreur n''est pas le droit à la négligence. Distinguer les trois catégories est ce qui rend l''exigence juste et la sécurité crédible."}, {"id": "m4q16", "enonce": "Plusieurs réponses. Quelles sont des erreurs de reconnaissance ?", "options": ["Un mot précis, le jour même, sur ce qui a été bien fait", "« C''est bien, mais… »", "« Tu es formidable, tu peux rester ce soir ? »", "« Toi au moins tu fais les choses proprement, pas comme Julien »"], "bonnes": [1, 2, 3], "explication": "Le « mais » annule, le compliment instrumental est une manipulation, la comparaison détruit l''équipe. La reconnaissance est précise, sincère, à temps, sans condition."}, {"id": "m4q17", "enonce": "Combien d''objectifs contient un plan de développement individuel (PDI) efficace ?", "options": ["Un seul à la fois, deux au maximum", "Au moins six, pour couvrir tous les manques repérés", "Autant que de compétences dans la matrice de l''équipe", "Aucun objectif précis, seulement une intention de progresser"], "bonnes": [0], "explication": "Un PDI à six objectifs n''aboutit jamais. Un objectif, des moyens datés, un point de suivi, relu à chaque entretien."}, {"id": "m4q18", "enonce": "Une rupture de période d''essai est envisagée pour un nouveau salarié. Quelle règle la formation pose-t-elle ?", "options": ["Elle peut être annoncée le dernier jour sans aucune explication préalable, puisque c''est le principe même de la période d''essai", "Elle relève du parrain, qui connaît le mieux le nouvel arrivant", "Elle ne doit jamais être une surprise : les difficultés ont été dites avant, avec des attentes précises et un délai", "Elle est impossible si le salarié a reçu sa formation à la sécurité"], "bonnes": [2], "explication": "Le point formel à un mois dit clairement si l''essai est en bonne voie. Une décision motivée, sans surprise, est plus juste et moins risquée."}, {"id": "m4q19", "enonce": "Qu''a changé l''accord national interprofessionnel du 9 décembre 2020 sur la santé au travail (transposé par la loi du 2 août 2021) ?", "options": ["Il a supprimé le comité social et économique (CSE) dans les entreprises de moins de 50 salariés pour alléger leurs obligations", "Il a substitué la « qualité de vie et des conditions de travail » (QVCT) à la « qualité de vie au travail »", "Il a rendu le télétravail obligatoire pour les postes éligibles", "Il a créé le compte personnel de formation"], "bonnes": [1], "explication": "La QVCT porte sur le contenu et l''organisation du travail, pas sur les à-côtés ; la loi du 2 août 2021 l''a inscrite dans le Code du travail. Elle se construit avec les salariés, par exemple dans des espaces de discussion sur le travail."}, {"id": "m4q20", "enonce": "Parmi ces éléments, lequel ne fait pas partie des six familles de facteurs de risques psychosociaux du rapport Gollac ?", "options": ["L''intensité et le temps de travail (charge, rythme, horaires, interruptions)", "La fragilité psychologique des salariés", "Les exigences émotionnelles", "L''insécurité de la situation de travail"], "bonnes": [1], "explication": "La prévention des RPS part de l''organisation du travail, pas de la fragilité supposée des personnes. Les six familles : intensité et temps de travail, exigences émotionnelles, autonomie insuffisante, rapports sociaux dégradés, conflits de valeurs, insécurité de la situation de travail."}], "seuil": 70, "tentatives_max": 3, "corrections": true, "consigne": "20 questions. Une seule bonne réponse par question, sauf mention « plusieurs réponses ». Seuil de réussite : 70 %."}'::jsonb, publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 5 and l.ordre = 11;
  n := n + 1;

  -- 4.2-securite-psychologique.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Dans certaines équipes, on ose dire « je ne sais pas », « je me suis trompé », « je ne suis pas d''accord », « j''ai une idée ». Dans d''autres, on se tait, on cache ses erreurs, on laisse le chef se tromper sans rien dire. La différence entre les deux a un nom : la sécurité psychologique. Plusieurs recherches, menées dans des contextes très différents, montrent qu''elle pèse lourd dans les écarts de performance entre des équipes dont les membres sont pourtant aussi compétents les uns que les autres.

## D''où vient le concept

Au début des années 1990, Amy Edmondson, aujourd''hui professeure à la Harvard Business School, participe pendant sa thèse à une étude sur les erreurs de médication dans plusieurs services hospitaliers. Elle s''attend à ce que les équipes les mieux dirigées et les plus soudées commettent moins d''erreurs. Les chiffres disent l''inverse : ce sont elles qui en déclarent le plus. Son hypothèse, qu''un observateur envoyé ensuite dans les services a confortée : ces équipes n''en faisaient pas davantage, elles osaient en parler. Ailleurs, les erreurs restaient sous le tapis (Edmondson, 1996).

Dans un article de 1999, fondé cette fois sur 51 équipes d''une entreprise industrielle, elle définit la sécurité psychologique comme la conviction partagée, au sein d''une équipe, que l''on peut prendre un risque interpersonnel sans être puni ni humilié : poser une question, admettre une erreur, proposer une idée, exprimer un désaccord.

Le mot prête à confusion. Une équipe psychologiquement sûre n''est pas une équipe où tout le monde est gentil et où l''on évite les sujets qui fâchent ; on peut justement s''y dire les choses difficiles, parce qu''on sait que ce ne sera pas retenu contre soi. Edmondson insiste : la sécurité psychologique doit se combiner avec un haut niveau d''exigence. Sécurité sans exigence, c''est la zone de confort ; exigence sans sécurité, c''est la zone d''anxiété, où l''on cache et où l''on se tait ; les deux ensemble, c''est la zone d''apprentissage et de performance.

## Ce que Google a confirmé

En 2012, Google a lancé une étude interne, le projet Aristotle, pour comprendre ce qui distinguait ses équipes les plus efficaces. Ses chercheurs ont étudié 180 équipes (115 équipes d''ingénieurs, 65 équipes commerciales) et testé de nombreuses variables : ancienneté, taille de l''équipe, travail dans les mêmes locaux, extraversion des membres, performance individuelle de chacun. Aucune ne ressortait nettement. Ce qui comptait, d''après les résultats publiés en 2015 sur le site re:Work de Google, c''était la manière dont les membres travaillaient ensemble. Cinq dynamiques ressortaient, et la sécurité psychologique arrivait en tête, « de loin » selon Google ; venaient ensuite la fiabilité (chacun fait ce qu''il a dit), la structure et la clarté (rôles, objectifs, plans), le sens du travail et le sentiment que ce travail a un impact.

Une précaution : il s''agit d''une étude d''entreprise, sur une population très particulière, dont les données n''ont pas été publiées dans une revue scientifique. Elle rejoint les travaux d''Edmondson, elle ne les remplace pas. Mais le message est net : la façon dont on se parle dans une équipe compte davantage que le profil de ceux qui la composent.

## Pourquoi cela concerne le manager de proximité

La sécurité psychologique se joue au niveau de l''équipe, pas de l''entreprise. Deux équipes de la même entreprise, avec les mêmes règles, peuvent en avoir des niveaux très différents. Le comportement du manager y pèse lourd : ce qu''il fait quand quelqu''un se trompe, quand quelqu''un le contredit, quand quelqu''un pose une question « bête ». L''équipe observe, et apprend.

Michel, à l''atelier Garnier, a crié sur Julien devant tout le monde pour une coulure. Ce jour-là, tout l''atelier a appris qu''une erreur se paie en public. Conséquence prévisible : la prochaine erreur sera cachée, jusqu''à ce que le client la découvre. Le vrai coût de l''humiliation, au-delà de la vexation de Julien, ce sont toutes les erreurs que personne ne signalera plus.

## Les cinq comportements du manager

Edmondson propose aux responsables une « boîte à outils » en trois temps : préparer le terrain, inviter à participer, répondre de façon productive (*The Fearless Organization*, 2019). Nous en tirons cinq comportements à la portée d''un manager de proximité. Aucun ne demande de budget.

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

Si vous reconnaissez votre équipe, la cause est souvent un comportement passé, du manager actuel ou du précédent, que l''équipe n''a pas oublié. Il faudra du temps et de la constance pour que les gens y croient à nouveau.

## Le cas Garnier

Karim veut que les reprises se voient avant la restitution. Il sait que l''équipe a appris avec Michel à cacher. Il commence par lui-même : au brief du matin, il annonce qu''il s''est trompé la veille sur une commande de pièces, et ce qu''il fait pour rattraper. Il installe une règle : « Une erreur signalée avant la sortie du véhicule ne se discute pas, on la corrige. Une erreur découverte par le client, on en parle. » Il demande chaque semaine en réunion : « Qu''est-ce qui a failli mal tourner cette semaine ? » Les premières fois, silence. La troisième semaine, Lucas dit qu''il a failli monter un pare-chocs avec les mauvaises fixations et que Fatou l''a vu. Karim remercie Lucas, remercie Fatou, et demande comment éviter que ça se reproduise. À partir de là, les signalements arrivent.

Il reste Michel. Karim ne peut pas changer Michel, mais il peut lui demander (leçon 3.10) que les remarques passent par lui, et il peut, quand Michel s''emporte, aller voir la personne ensuite. Ce n''est pas parfait ; c''est ce qui est à sa portée.

## À retenir

- La sécurité psychologique, c''est pouvoir dire « je ne sais pas », « je me suis trompé », « je ne suis pas d''accord » sans être puni ni humilié (Edmondson, 1999).
- Les équipes qui l''ont signalent plus d''erreurs parce qu''elles les cachent moins ; c''est aussi la première des cinq dynamiques des équipes efficaces relevées par Google (projet Aristotle, étude interne).
- Elle se combine avec l''exigence : sécurité et exigence ensemble donnent l''apprentissage.
- Cinq comportements du manager : présenter le travail comme un apprentissage, admettre ses erreurs, poser des questions, réagir de façon productive aux prises de risque, poser des limites et les tenir.
- Elle se construit lentement et se détruit en une minute.

## Sources

- Amy C. Edmondson, « Learning from Mistakes Is Easier Said Than Done: Group and Organizational Influences on the Detection and Correction of Human Error », *The Journal of Applied Behavioral Science*, vol. 32, n° 1, 1996.
- Amy C. Edmondson, « Psychological Safety and Learning Behavior in Work Teams », *Administrative Science Quarterly*, vol. 44, n° 2, 1999.
- Amy C. Edmondson, *The Fearless Organization: Creating Psychological Safety in the Workplace for Learning, Innovation, and Growth*, Wiley, 2019.
- Google re:Work, « Understand team effectiveness » (projet Aristotle), 2015, rework.withgoogle.com/intl/en/guides/understand-team-effectiveness.
- Charles Duhigg, « What Google Learned From Its Quest to Build the Perfect Team », *The New York Times Magazine*, 2016.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Dans certaines équipes, on ose dire « je ne sais pas », « je me suis trompé », « je ne suis pas d''accord », « j''ai une idée ». Dans d''autres, on se tait, on cache ses erreurs, on laisse le chef se tromper sans rien dire. La différence entre les deux a un nom : la sécurité psychologique. Plusieurs recherches, menées dans des contextes très différents, montrent qu''elle pèse lourd dans les écarts de performance entre des équipes dont les membres sont pourtant aussi compétents les uns que les autres.

## D''où vient le concept

Au début des années 1990, Amy Edmondson, aujourd''hui professeure à la Harvard Business School, participe pendant sa thèse à une étude sur les erreurs de médication dans plusieurs services hospitaliers. Elle s''attend à ce que les équipes les mieux dirigées et les plus soudées commettent moins d''erreurs. Les chiffres disent l''inverse : ce sont elles qui en déclarent le plus. Son hypothèse, qu''un observateur envoyé ensuite dans les services a confortée : ces équipes n''en faisaient pas davantage, elles osaient en parler. Ailleurs, les erreurs restaient sous le tapis (Edmondson, 1996).

Dans un article de 1999, fondé cette fois sur 51 équipes d''une entreprise industrielle, elle définit la sécurité psychologique comme la conviction partagée, au sein d''une équipe, que l''on peut prendre un risque interpersonnel sans être puni ni humilié : poser une question, admettre une erreur, proposer une idée, exprimer un désaccord.

Le mot prête à confusion. Une équipe psychologiquement sûre n''est pas une équipe où tout le monde est gentil et où l''on évite les sujets qui fâchent ; on peut justement s''y dire les choses difficiles, parce qu''on sait que ce ne sera pas retenu contre soi. Edmondson insiste : la sécurité psychologique doit se combiner avec un haut niveau d''exigence. Sécurité sans exigence, c''est la zone de confort ; exigence sans sécurité, c''est la zone d''anxiété, où l''on cache et où l''on se tait ; les deux ensemble, c''est la zone d''apprentissage et de performance.

## Ce que Google a confirmé

En 2012, Google a lancé une étude interne, le projet Aristotle, pour comprendre ce qui distinguait ses équipes les plus efficaces. Ses chercheurs ont étudié 180 équipes (115 équipes d''ingénieurs, 65 équipes commerciales) et testé de nombreuses variables : ancienneté, taille de l''équipe, travail dans les mêmes locaux, extraversion des membres, performance individuelle de chacun. Aucune ne ressortait nettement. Ce qui comptait, d''après les résultats publiés en 2015 sur le site re:Work de Google, c''était la manière dont les membres travaillaient ensemble. Cinq dynamiques ressortaient, et la sécurité psychologique arrivait en tête, « de loin » selon Google ; venaient ensuite la fiabilité (chacun fait ce qu''il a dit), la structure et la clarté (rôles, objectifs, plans), le sens du travail et le sentiment que ce travail a un impact.

Une précaution : il s''agit d''une étude d''entreprise, sur une population très particulière, dont les données n''ont pas été publiées dans une revue scientifique. Elle rejoint les travaux d''Edmondson, elle ne les remplace pas. Mais le message est net : la façon dont on se parle dans une équipe compte davantage que le profil de ceux qui la composent.

## Pourquoi cela concerne le manager de proximité

La sécurité psychologique se joue au niveau de l''équipe, pas de l''entreprise. Deux équipes de la même entreprise, avec les mêmes règles, peuvent en avoir des niveaux très différents. Le comportement du manager y pèse lourd : ce qu''il fait quand quelqu''un se trompe, quand quelqu''un le contredit, quand quelqu''un pose une question « bête ». L''équipe observe, et apprend.

Michel, à l''atelier Garnier, a crié sur Julien devant tout le monde pour une coulure. Ce jour-là, tout l''atelier a appris qu''une erreur se paie en public. Conséquence prévisible : la prochaine erreur sera cachée, jusqu''à ce que le client la découvre. Le vrai coût de l''humiliation, au-delà de la vexation de Julien, ce sont toutes les erreurs que personne ne signalera plus.

## Les cinq comportements du manager

Edmondson propose aux responsables une « boîte à outils » en trois temps : préparer le terrain, inviter à participer, répondre de façon productive (*The Fearless Organization*, 2019). Nous en tirons cinq comportements à la portée d''un manager de proximité. Aucun ne demande de budget.

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

Si vous reconnaissez votre équipe, la cause est souvent un comportement passé, du manager actuel ou du précédent, que l''équipe n''a pas oublié. Il faudra du temps et de la constance pour que les gens y croient à nouveau.

## Le cas Garnier

Karim veut que les reprises se voient avant la restitution. Il sait que l''équipe a appris avec Michel à cacher. Il commence par lui-même : au brief du matin, il annonce qu''il s''est trompé la veille sur une commande de pièces, et ce qu''il fait pour rattraper. Il installe une règle : « Une erreur signalée avant la sortie du véhicule ne se discute pas, on la corrige. Une erreur découverte par le client, on en parle. » Il demande chaque semaine en réunion : « Qu''est-ce qui a failli mal tourner cette semaine ? » Les premières fois, silence. La troisième semaine, Lucas dit qu''il a failli monter un pare-chocs avec les mauvaises fixations et que Fatou l''a vu. Karim remercie Lucas, remercie Fatou, et demande comment éviter que ça se reproduise. À partir de là, les signalements arrivent.

Il reste Michel. Karim ne peut pas changer Michel, mais il peut lui demander (leçon 3.10) que les remarques passent par lui, et il peut, quand Michel s''emporte, aller voir la personne ensuite. Ce n''est pas parfait ; c''est ce qui est à sa portée.

## À retenir

- La sécurité psychologique, c''est pouvoir dire « je ne sais pas », « je me suis trompé », « je ne suis pas d''accord » sans être puni ni humilié (Edmondson, 1999).
- Les équipes qui l''ont signalent plus d''erreurs parce qu''elles les cachent moins ; c''est aussi la première des cinq dynamiques des équipes efficaces relevées par Google (projet Aristotle, étude interne).
- Elle se combine avec l''exigence : sécurité et exigence ensemble donnent l''apprentissage.
- Cinq comportements du manager : présenter le travail comme un apprentissage, admettre ses erreurs, poser des questions, réagir de façon productive aux prises de risque, poser des limites et les tenir.
- Elle se construit lentement et se détruit en une minute.

## Sources

- Amy C. Edmondson, « Learning from Mistakes Is Easier Said Than Done: Group and Organizational Influences on the Detection and Correction of Human Error », *The Journal of Applied Behavioral Science*, vol. 32, n° 1, 1996.
- Amy C. Edmondson, « Psychological Safety and Learning Behavior in Work Teams », *Administrative Science Quarterly*, vol. 44, n° 2, 1999.
- Amy C. Edmondson, *The Fearless Organization: Creating Psychological Safety in the Workplace for Learning, Innovation, and Growth*, Wiley, 2019.
- Google re:Work, « Understand team effectiveness » (projet Aristotle), 2015, rework.withgoogle.com/intl/en/guides/understand-team-effectiveness.
- Charles Duhigg, « What Google Learned From Its Quest to Build the Perfect Team », *The New York Times Magazine*, 2016.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 5 and l.ordre = 2;
  n := n + 1;

  -- 4.3-reconnaitre-sans-flatter.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Demandez à une équipe ce qui lui manque : le manque de reconnaissance sort presque toujours dans les premières réponses. Et pourtant, beaucoup de managers en donnent peu. Rarement par méchanceté : par pudeur, par habitude (« c''est normal de bien faire son travail »), par manque de temps, ou par peur de paraître flatteur. Or reconnaître n''est pas flatter. La flatterie est vague, intéressée et fausse ; la reconnaissance est précise, gratuite et vraie.

## Pourquoi c''est un besoin, pas un luxe

Les trois modèles de la leçon 4.1 se rejoignent sur ce point : la reconnaissance est un facteur de motivation chez Herzberg (dont la méthode, fondée sur des récits, a d''ailleurs été critiquée, sans que la distinction perde son utilité pratique), elle nourrit le besoin de compétence et de lien chez Deci et Ryan, et elle rend le progrès visible chez Amabile et Kramer.

Elle touche aussi à la santé. Le sociologue allemand Johannes Siegrist a montré, dès les années 1990, qu''un déséquilibre durable entre les efforts fournis et ce que l''on reçoit en retour (salaire, mais aussi estime et perspectives) est associé à davantage de problèmes de santé. En France, le rapport Gollac sur les risques psychosociaux (2011) range le manque de reconnaissance parmi les facteurs de risque, dans la famille des rapports sociaux au travail (leçon 4.7).

La reconnaissance ne coûte rien. Elle demande de l''attention, et un peu de méthode.

## Les quatre formes de la reconnaissance

Jean-Pierre Brun et Ninon Dugas, chercheurs à l''Université Laval (Québec), ont proposé au début des années 2000 une typologie aujourd''hui largement reprise. La reconnaissance peut porter sur quatre objets, et un manager complet les pratique tous les quatre.

| Forme | Ce qu''on reconnaît | Exemple à l''atelier |
|---|---|---|
| Existentielle | La personne elle-même : elle existe, on la salue, on la consulte, on l''informe | Dire bonjour à chacun, demander l''avis de Marc sur le planning, prévenir Fatou d''un changement avant les autres |
| De la pratique de travail | La manière de faire : le soin, la méthode, la rigueur, même quand le résultat n''est pas encore là | « Ta façon de préparer les surfaces, c''est propre, ça se voit au vernis » |
| De l''investissement | L''effort et l''engagement, indépendamment du résultat | « Tu es resté vendredi soir pour finir la Clio, je l''ai vu » |
| Des résultats | Ce qui a été obtenu, mesurable | « Trois finitions sans reprise ce mois-ci » |

La reconnaissance existentielle est la plus élémentaire et la plus souvent oubliée. Un manager qui ne dit bonjour qu''à ceux qu''il apprécie, qui informe l''équipe par affichage sans jamais expliquer, qui ne demande jamais l''avis de personne, envoie un message d''indifférence, quels que soient ses compliments sur les résultats.

La reconnaissance de l''investissement et de la pratique est ce qui permet de reconnaître aussi ceux qui n''ont pas encore de résultats : le débutant, celui qui apprend, celui qui est sur une tâche ingrate. Ne reconnaître que les résultats, c''est ne reconnaître que les meilleurs, et laisser les autres invisibles.

## Les règles d''une reconnaissance qui porte

- Précise. « Bon boulot » ne dit rien. « Le raccord de teinte sur l''aile, on ne le voit pas sous le néon » dit exactement ce qui est bien, donc ce qu''il faut continuer à faire. C''est la même règle que pour le feedback positif du module 3.
- Sincère. On ne reconnaît que ce qui est vrai. Une reconnaissance fabriquée pour « faire de la reconnaissance » se voit, et discrédite les suivantes.
- À temps. Le jour même, ou le lendemain. Un compliment sur un travail d''il y a trois semaines dit surtout que vous n''aviez pas regardé à l''époque.
- Régulière, pas rare. Une cérémonie par an ne remplace pas une remarque par semaine. Amabile et Kramer ont montré le poids des petits progrès quotidiens ; ils méritent d''être vus au quotidien.
- Adaptée à la personne. Certains aiment être félicités devant l''équipe ; d''autres le vivent comme une gêne. Demandez, ou observez. Une reconnaissance publique imposée à quelqu''un qui la redoute est une punition.
- Équitable. Si les mêmes sont toujours félicités, les autres concluent qu''il y a des chouchous. Tenez un compte, mentalement ou dans votre carnet : à qui n''avez-vous rien dit de positif depuis quinze jours ?
- Sans « mais ». « C''est bien, mais… » annule ce qui précède. Le correctif se dit à un autre moment.

## Les formes qui ne coûtent rien

La parole directe est la première. Mais il y en a d''autres : un mot écrit (une note manuscrite marque plus qu''on ne le croit) ; mentionner le travail de quelqu''un devant sa hiérarchie ou devant un client ; confier une responsabilité ou une tâche valorisante (former un nouveau, représenter l''équipe) ; demander son avis à quelqu''un sur un sujet qu''il maîtrise ; commencer la réunion hebdomadaire par ce qui a bien marché, en nommant qui.

Les formes matérielles (prime, cadeau, repas d''équipe) ont leur place, mais elles relèvent souvent de l''employeur, et elles ne remplacent jamais la parole. Une prime versée sans un mot reste un virement ; un mot sincère, même sans prime, est déjà une reconnaissance.

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

- Jean-Pierre Brun, Ninon Dugas, *La reconnaissance au travail : une pratique riche de sens*, Centre d''expertise en gestion des ressources humaines, Secrétariat du Conseil du trésor du Québec, 2002.
- Jean-Pierre Brun, Ninon Dugas, « An analysis of employee recognition: Perspectives on human resources practices », *The International Journal of Human Resource Management*, vol. 19, n° 4, 2008.
- Johannes Siegrist, « Adverse health effects of high-effort/low-reward conditions », *Journal of Occupational Health Psychology*, vol. 1, n° 1, 1996.
- Michel Gollac, Marceline Bodier (dir.), *Mesurer les facteurs psychosociaux de risque au travail pour les maîtriser*, rapport du Collège d''expertise sur le suivi des risques psychosociaux au travail, ministère du Travail, 2011.
- Teresa Amabile, Steven Kramer, *The Progress Principle*, Harvard Business Review Press, 2011.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Demandez à une équipe ce qui lui manque : le manque de reconnaissance sort presque toujours dans les premières réponses. Et pourtant, beaucoup de managers en donnent peu. Rarement par méchanceté : par pudeur, par habitude (« c''est normal de bien faire son travail »), par manque de temps, ou par peur de paraître flatteur. Or reconnaître n''est pas flatter. La flatterie est vague, intéressée et fausse ; la reconnaissance est précise, gratuite et vraie.

## Pourquoi c''est un besoin, pas un luxe

Les trois modèles de la leçon 4.1 se rejoignent sur ce point : la reconnaissance est un facteur de motivation chez Herzberg (dont la méthode, fondée sur des récits, a d''ailleurs été critiquée, sans que la distinction perde son utilité pratique), elle nourrit le besoin de compétence et de lien chez Deci et Ryan, et elle rend le progrès visible chez Amabile et Kramer.

Elle touche aussi à la santé. Le sociologue allemand Johannes Siegrist a montré, dès les années 1990, qu''un déséquilibre durable entre les efforts fournis et ce que l''on reçoit en retour (salaire, mais aussi estime et perspectives) est associé à davantage de problèmes de santé. En France, le rapport Gollac sur les risques psychosociaux (2011) range le manque de reconnaissance parmi les facteurs de risque, dans la famille des rapports sociaux au travail (leçon 4.7).

La reconnaissance ne coûte rien. Elle demande de l''attention, et un peu de méthode.

## Les quatre formes de la reconnaissance

Jean-Pierre Brun et Ninon Dugas, chercheurs à l''Université Laval (Québec), ont proposé au début des années 2000 une typologie aujourd''hui largement reprise. La reconnaissance peut porter sur quatre objets, et un manager complet les pratique tous les quatre.

| Forme | Ce qu''on reconnaît | Exemple à l''atelier |
|---|---|---|
| Existentielle | La personne elle-même : elle existe, on la salue, on la consulte, on l''informe | Dire bonjour à chacun, demander l''avis de Marc sur le planning, prévenir Fatou d''un changement avant les autres |
| De la pratique de travail | La manière de faire : le soin, la méthode, la rigueur, même quand le résultat n''est pas encore là | « Ta façon de préparer les surfaces, c''est propre, ça se voit au vernis » |
| De l''investissement | L''effort et l''engagement, indépendamment du résultat | « Tu es resté vendredi soir pour finir la Clio, je l''ai vu » |
| Des résultats | Ce qui a été obtenu, mesurable | « Trois finitions sans reprise ce mois-ci » |

La reconnaissance existentielle est la plus élémentaire et la plus souvent oubliée. Un manager qui ne dit bonjour qu''à ceux qu''il apprécie, qui informe l''équipe par affichage sans jamais expliquer, qui ne demande jamais l''avis de personne, envoie un message d''indifférence, quels que soient ses compliments sur les résultats.

La reconnaissance de l''investissement et de la pratique est ce qui permet de reconnaître aussi ceux qui n''ont pas encore de résultats : le débutant, celui qui apprend, celui qui est sur une tâche ingrate. Ne reconnaître que les résultats, c''est ne reconnaître que les meilleurs, et laisser les autres invisibles.

## Les règles d''une reconnaissance qui porte

- Précise. « Bon boulot » ne dit rien. « Le raccord de teinte sur l''aile, on ne le voit pas sous le néon » dit exactement ce qui est bien, donc ce qu''il faut continuer à faire. C''est la même règle que pour le feedback positif du module 3.
- Sincère. On ne reconnaît que ce qui est vrai. Une reconnaissance fabriquée pour « faire de la reconnaissance » se voit, et discrédite les suivantes.
- À temps. Le jour même, ou le lendemain. Un compliment sur un travail d''il y a trois semaines dit surtout que vous n''aviez pas regardé à l''époque.
- Régulière, pas rare. Une cérémonie par an ne remplace pas une remarque par semaine. Amabile et Kramer ont montré le poids des petits progrès quotidiens ; ils méritent d''être vus au quotidien.
- Adaptée à la personne. Certains aiment être félicités devant l''équipe ; d''autres le vivent comme une gêne. Demandez, ou observez. Une reconnaissance publique imposée à quelqu''un qui la redoute est une punition.
- Équitable. Si les mêmes sont toujours félicités, les autres concluent qu''il y a des chouchous. Tenez un compte, mentalement ou dans votre carnet : à qui n''avez-vous rien dit de positif depuis quinze jours ?
- Sans « mais ». « C''est bien, mais… » annule ce qui précède. Le correctif se dit à un autre moment.

## Les formes qui ne coûtent rien

La parole directe est la première. Mais il y en a d''autres : un mot écrit (une note manuscrite marque plus qu''on ne le croit) ; mentionner le travail de quelqu''un devant sa hiérarchie ou devant un client ; confier une responsabilité ou une tâche valorisante (former un nouveau, représenter l''équipe) ; demander son avis à quelqu''un sur un sujet qu''il maîtrise ; commencer la réunion hebdomadaire par ce qui a bien marché, en nommant qui.

Les formes matérielles (prime, cadeau, repas d''équipe) ont leur place, mais elles relèvent souvent de l''employeur, et elles ne remplacent jamais la parole. Une prime versée sans un mot reste un virement ; un mot sincère, même sans prime, est déjà une reconnaissance.

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

- Jean-Pierre Brun, Ninon Dugas, *La reconnaissance au travail : une pratique riche de sens*, Centre d''expertise en gestion des ressources humaines, Secrétariat du Conseil du trésor du Québec, 2002.
- Jean-Pierre Brun, Ninon Dugas, « An analysis of employee recognition: Perspectives on human resources practices », *The International Journal of Human Resource Management*, vol. 19, n° 4, 2008.
- Johannes Siegrist, « Adverse health effects of high-effort/low-reward conditions », *Journal of Occupational Health Psychology*, vol. 1, n° 1, 1996.
- Michel Gollac, Marceline Bodier (dir.), *Mesurer les facteurs psychosociaux de risque au travail pour les maîtriser*, rapport du Collège d''expertise sur le suivi des risques psychosociaux au travail, ministère du Travail, 2011.
- Teresa Amabile, Steven Kramer, *The Progress Principle*, Harvard Business Review Press, 2011.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 5 and l.ordre = 3;
  n := n + 1;

  -- 4.4-developper-les-competences.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Faire progresser son équipe rapporte de plusieurs façons : l''équipe devient plus robuste (les compétences critiques ne reposent plus sur une seule personne, module 2), les personnes sont plus motivées (le besoin de compétence, leçon 4.1), et le manager lui-même gagne du temps à mesure que l''autonomie augmente. C''est aussi une obligation de l''employeur, que le manager de proximité met en œuvre : l''article L6321-1 du Code du travail impose d''assurer l''adaptation des salariés à leur poste et de veiller au maintien de leur capacité à occuper un emploi.

## Repérer ce qu''il faut développer

Le point de départ est la matrice de compétences du module 2. Elle montre trois choses : les compétences que l''équipe ne détient pas assez (risque collectif), les personnes qui plafonnent (risque individuel), et les personnes qui peuvent aller plus loin (potentiel).

Puis on croise avec ce que veut la personne. Un plan de développement imposé ne fonctionne pas ; un plan construit avec la personne, à partir de ses souhaits exprimés en entretien de parcours professionnel (module 3), fonctionne. Les questions utiles : « Sur quoi aimerais-tu être meilleur ? », « Qu''est-ce que tu aimerais faire dans deux ans que tu ne sais pas faire aujourd''hui ? », « Qu''est-ce qui te freine ? »

Attention à deux biais. Le premier : ne développer que les meilleurs, parce qu''ils sont gratifiants. Le second : ne développer que les plus faibles, pour combler les manques, et laisser les bons s''ennuyer jusqu''à ce qu''ils partent. Chacun a besoin de progresser, à son niveau.

## Les moyens, du moins cher au plus cher

La formation « en salle » ou en ligne est le moyen auquel on pense d''abord. C''est le plus cher, et utilisée seule, sans mise en pratique derrière, elle laisse peu de traces. Les adultes apprennent beaucoup en faisant, à condition de prendre du recul sur ce qu''ils ont fait : c''est l''idée de l''apprentissage expérientiel décrit par David Kolb (1984). La formation formelle trouve toute sa place quand elle s''articule avec cette pratique. Voici les moyens, du plus courant au plus formel.

La mise en situation progressive : confier une tâche un peu au-dessus du niveau actuel, avec un droit à l''erreur et un point de contrôle. C''est le principe du leadership situationnel (module 1) : on passe de « diriger » à « entraîner » à « épauler ». Lucas apprend à monter un pare-chocs seul, puis avec contrôle, puis sans.

Le binôme ou tutorat : associer une personne qui apprend à une personne qui sait, sur des séances prévues, pas « quand on aura le temps ». Le tuteur doit être volontaire, savoir expliquer (ce n''est pas la même compétence que savoir faire), et être reconnu pour ce rôle. Nadia forme Julien à la nacrée une heure par semaine : c''est du développement pour les deux.

Le retour d''expérience : après une difficulté ou une réussite, prendre dix minutes pour comprendre ce qui s''est passé (module 6). C''est de la formation gratuite.

La formation interne : un membre de l''équipe, ou le manager, présente une méthode, un outil, une règle, en trente minutes, à toute l''équipe. À l''atelier, Thierry présente le contrôle de finition ; Sophie présente le circuit des demandes.

La formation externe : organisme de formation, fournisseur (les constructeurs et les fabricants de peinture forment les carrossiers), centre de formation d''apprentis. Elle se prépare (qu''est-ce qu''on attend, comment on l''appliquera au retour) et se suit (qu''est-ce qui a changé un mois après). Une formation externe sans préparation ni suivi est un budget perdu.

## Les dispositifs à connaître

Le manager ne gère pas les budgets de formation, mais il doit connaître les dispositifs pour orienter et pour parler juste en entretien de parcours.

Le plan de développement des compétences (art. L6312-1 et L6321-1 et suivants) : l''ensemble des formations décidées par l''employeur pour ses salariés. Il est en général construit chaque année, souvent à partir des demandes remontées par les managers. C''est là que va la demande de Karim pour former Julien à la peinture. Dans les entreprises de moins de 50 salariés, l''OPCO (opérateur de compétences) de la branche peut financer tout ou partie des formations ; le manager doit savoir quel est l''OPCO de son entreprise.

Le compte personnel de formation (CPF) : compte en euros (500 € par an pour un salarié à temps plein ou au moins à mi-temps, dans la limite de 5 000 € ; 800 € et 8 000 € pour un salarié peu qualifié), mobilisable par le salarié pour une formation certifiante, un bilan de compétences, une VAE ou le permis de conduire, en dehors du temps de travail ou pendant (avec l''accord de l''employeur dans ce cas). C''est le salarié qui décide de l''utiliser ; le manager ne peut pas l''y obliger. Depuis le 2 avril 2026, il reste à sa charge une participation forfaitaire de 150 € par formation, sauf exceptions (demandeurs d''emploi, abondement de l''employeur notamment), et certaines dépenses sont plafonnées depuis le 26 février 2026 (bilan de compétences, permis de conduire, certifications du répertoire spécifique). Ces règles bougent souvent : vérifiez sur moncompteformation.gouv.fr avant d''en parler en entretien. L''employeur peut abonder le compte.

La validation des acquis de l''expérience (VAE) : obtenir tout ou partie d''une certification professionnelle (diplôme, titre) à partir de son expérience. Thierry, avec 28 ans de carrosserie, peut viser un titre sans retourner à l''école.

Le conseil en évolution professionnelle (CEP) : accompagnement gratuit et extérieur à l''entreprise pour construire un projet professionnel.

L''apprentissage et la professionnalisation : pour recruter et former en alternance. Lucas est apprenti ; le manager est souvent son maître d''apprentissage, avec des obligations de suivi et de lien avec le CFA.

## Le plan de développement individuel

Un plan de développement individuel (PDI) tient sur une page (gabarit dans la fiche 4.9). Il contient : la compétence visée, formulée en « être capable de » ; le niveau actuel et le niveau visé (l''échelle 0-3 de la matrice) ; les moyens (mise en situation, binôme, formation) avec leurs dates ; les points de suivi ; ce que la personne fait, ce que le manager fait. Un seul objectif de développement à la fois, deux au maximum. Un PDI à six objectifs n''aboutit jamais.

Le PDI se construit en entretien, se relit à chaque entretien de suivi, et se met à jour. Il ne s''agit pas d''un document RH de plus, mais d''un outil de travail entre le manager et la personne.

## Conduire un entretien de progression : le modèle GROW

Pour les entretiens consacrés au développement, le modèle GROW donne une trame simple en quatre temps. Il a été mis au point dans les années 1980 par des coachs britanniques, dont Graham Alexander, Alan Fine et John Whitmore, et popularisé par le livre de Whitmore, *Coaching for Performance* (1992). Il repose sur le questionnement, pas sur le conseil : la personne trouve elle-même son chemin, ce qui rend l''engagement bien plus solide.

- G, Goal (objectif) : « Qu''est-ce que tu veux être capable de faire ? D''ici quand ? Comment saurons-nous que c''est acquis ? »
- R, Reality (réalité) : « Où en es-tu aujourd''hui ? Qu''est-ce que tu as déjà essayé ? Qu''est-ce qui te manque ? »
- O, Options : « Qu''est-ce que tu pourrais faire ? Quoi d''autre ? Et si tu avais plus de temps, de moyens ? » Le manager peut ajouter des options, après celles de la personne.
- W, Will (volonté, engagement) : « Qu''est-ce que tu vas faire, concrètement, d''ici notre prochain point ? Qu''est-ce qui pourrait t''en empêcher ? De quoi as-tu besoin de ma part ? »

Un entretien GROW dure vingt à trente minutes. Repère utile : si vous parlez plus d''un quart du temps, vous êtes passé du questionnement au conseil.

## Le cas Garnier — le plan de Julien

Objectif (G) : Julien veut être autonome sur la peinture de raccord d''ici six mois, niveau 2 de la matrice. Réalité (R) : niveau 1 aujourd''hui, il a fait deux reprises de finition, il va trop vite sous pression ; il a déjà regardé Nadia travailler mais sans pratiquer. Options (O) : binôme avec Nadia une heure par semaine sur véhicule réel ; formation d''une journée chez le fournisseur de peinture (demande au plan de développement des compétences, financement OPCO à vérifier) ; contrôle de chaque finition par Thierry jusqu''à Noël ; retour d''expérience après chaque reprise. Engagement (W) : Julien prépare chaque séance avec Nadia en notant une question ; Karim planifie les séances le mardi à 14 h et fait la demande de formation avant fin de mois ; point toutes les six semaines. Le PDI tient sur une page, signé par les deux.

Six mois plus tard, ce plan est la matière de l''entretien de parcours professionnel de Julien : sa progression est documentée, son souhait d''évolution est clair.

## À retenir

- Développer les compétences est une obligation de l''employeur (L6321-1) et l''un des meilleurs moyens de motiver et de rendre l''équipe plus robuste.
- Partir de la matrice de compétences et des souhaits de la personne ; développer chacun, pas seulement les meilleurs ni seulement les plus faibles.
- On apprend surtout en faisant, avec retour : mise en situation, binôme, retour d''expérience, avant la formation formelle.
- Connaître les dispositifs : plan de développement des compétences, OPCO, CPF, VAE, CEP, apprentissage.
- Un PDI d''une page, un objectif à la fois, relu à chaque entretien de suivi.
- GROW pour l''entretien de progression : objectif, réalité, options, engagement ; le manager questionne plus qu''il ne conseille.

## Sources

- Code du travail, art. L6321-1 (obligation d''adaptation), L6312-1 et L6321-1 et s. (plan de développement des compétences), L6323-1 et s. (CPF), L6411-1 et s. (VAE), L6111-6 (CEP), legifrance.gouv.fr.
- Décret n° 2026-234 du 30 mars 2026 (participation forfaitaire CPF portée à 150 €) ; Service-Public.fr, « Compte personnel de formation (CPF) d''un salarié du secteur privé », service-public.gouv.fr ; moncompteformation.gouv.fr.
- Ministère du Travail, « Plan de développement des compétences », travail-emploi.gouv.fr.
- David A. Kolb, *Experiential Learning: Experience as the Source of Learning and Development*, Prentice Hall, 1984.
- John Whitmore, *Coaching for Performance*, Nicholas Brealey, 1992 (5e éd. 2017), modèle GROW.
- France Compétences, référentiel RS7377, compétence 7.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Faire progresser son équipe rapporte de plusieurs façons : l''équipe devient plus robuste (les compétences critiques ne reposent plus sur une seule personne, module 2), les personnes sont plus motivées (le besoin de compétence, leçon 4.1), et le manager lui-même gagne du temps à mesure que l''autonomie augmente. C''est aussi une obligation de l''employeur, que le manager de proximité met en œuvre : l''article L6321-1 du Code du travail impose d''assurer l''adaptation des salariés à leur poste et de veiller au maintien de leur capacité à occuper un emploi.

## Repérer ce qu''il faut développer

Le point de départ est la matrice de compétences du module 2. Elle montre trois choses : les compétences que l''équipe ne détient pas assez (risque collectif), les personnes qui plafonnent (risque individuel), et les personnes qui peuvent aller plus loin (potentiel).

Puis on croise avec ce que veut la personne. Un plan de développement imposé ne fonctionne pas ; un plan construit avec la personne, à partir de ses souhaits exprimés en entretien de parcours professionnel (module 3), fonctionne. Les questions utiles : « Sur quoi aimerais-tu être meilleur ? », « Qu''est-ce que tu aimerais faire dans deux ans que tu ne sais pas faire aujourd''hui ? », « Qu''est-ce qui te freine ? »

Attention à deux biais. Le premier : ne développer que les meilleurs, parce qu''ils sont gratifiants. Le second : ne développer que les plus faibles, pour combler les manques, et laisser les bons s''ennuyer jusqu''à ce qu''ils partent. Chacun a besoin de progresser, à son niveau.

## Les moyens, du moins cher au plus cher

La formation « en salle » ou en ligne est le moyen auquel on pense d''abord. C''est le plus cher, et utilisée seule, sans mise en pratique derrière, elle laisse peu de traces. Les adultes apprennent beaucoup en faisant, à condition de prendre du recul sur ce qu''ils ont fait : c''est l''idée de l''apprentissage expérientiel décrit par David Kolb (1984). La formation formelle trouve toute sa place quand elle s''articule avec cette pratique. Voici les moyens, du plus courant au plus formel.

La mise en situation progressive : confier une tâche un peu au-dessus du niveau actuel, avec un droit à l''erreur et un point de contrôle. C''est le principe du leadership situationnel (module 1) : on passe de « diriger » à « entraîner » à « épauler ». Lucas apprend à monter un pare-chocs seul, puis avec contrôle, puis sans.

Le binôme ou tutorat : associer une personne qui apprend à une personne qui sait, sur des séances prévues, pas « quand on aura le temps ». Le tuteur doit être volontaire, savoir expliquer (ce n''est pas la même compétence que savoir faire), et être reconnu pour ce rôle. Nadia forme Julien à la nacrée une heure par semaine : c''est du développement pour les deux.

Le retour d''expérience : après une difficulté ou une réussite, prendre dix minutes pour comprendre ce qui s''est passé (module 6). C''est de la formation gratuite.

La formation interne : un membre de l''équipe, ou le manager, présente une méthode, un outil, une règle, en trente minutes, à toute l''équipe. À l''atelier, Thierry présente le contrôle de finition ; Sophie présente le circuit des demandes.

La formation externe : organisme de formation, fournisseur (les constructeurs et les fabricants de peinture forment les carrossiers), centre de formation d''apprentis. Elle se prépare (qu''est-ce qu''on attend, comment on l''appliquera au retour) et se suit (qu''est-ce qui a changé un mois après). Une formation externe sans préparation ni suivi est un budget perdu.

## Les dispositifs à connaître

Le manager ne gère pas les budgets de formation, mais il doit connaître les dispositifs pour orienter et pour parler juste en entretien de parcours.

Le plan de développement des compétences (art. L6312-1 et L6321-1 et suivants) : l''ensemble des formations décidées par l''employeur pour ses salariés. Il est en général construit chaque année, souvent à partir des demandes remontées par les managers. C''est là que va la demande de Karim pour former Julien à la peinture. Dans les entreprises de moins de 50 salariés, l''OPCO (opérateur de compétences) de la branche peut financer tout ou partie des formations ; le manager doit savoir quel est l''OPCO de son entreprise.

Le compte personnel de formation (CPF) : compte en euros (500 € par an pour un salarié à temps plein ou au moins à mi-temps, dans la limite de 5 000 € ; 800 € et 8 000 € pour un salarié peu qualifié), mobilisable par le salarié pour une formation certifiante, un bilan de compétences, une VAE ou le permis de conduire, en dehors du temps de travail ou pendant (avec l''accord de l''employeur dans ce cas). C''est le salarié qui décide de l''utiliser ; le manager ne peut pas l''y obliger. Depuis le 2 avril 2026, il reste à sa charge une participation forfaitaire de 150 € par formation, sauf exceptions (demandeurs d''emploi, abondement de l''employeur notamment), et certaines dépenses sont plafonnées depuis le 26 février 2026 (bilan de compétences, permis de conduire, certifications du répertoire spécifique). Ces règles bougent souvent : vérifiez sur moncompteformation.gouv.fr avant d''en parler en entretien. L''employeur peut abonder le compte.

La validation des acquis de l''expérience (VAE) : obtenir tout ou partie d''une certification professionnelle (diplôme, titre) à partir de son expérience. Thierry, avec 28 ans de carrosserie, peut viser un titre sans retourner à l''école.

Le conseil en évolution professionnelle (CEP) : accompagnement gratuit et extérieur à l''entreprise pour construire un projet professionnel.

L''apprentissage et la professionnalisation : pour recruter et former en alternance. Lucas est apprenti ; le manager est souvent son maître d''apprentissage, avec des obligations de suivi et de lien avec le CFA.

## Le plan de développement individuel

Un plan de développement individuel (PDI) tient sur une page (gabarit dans la fiche 4.9). Il contient : la compétence visée, formulée en « être capable de » ; le niveau actuel et le niveau visé (l''échelle 0-3 de la matrice) ; les moyens (mise en situation, binôme, formation) avec leurs dates ; les points de suivi ; ce que la personne fait, ce que le manager fait. Un seul objectif de développement à la fois, deux au maximum. Un PDI à six objectifs n''aboutit jamais.

Le PDI se construit en entretien, se relit à chaque entretien de suivi, et se met à jour. Il ne s''agit pas d''un document RH de plus, mais d''un outil de travail entre le manager et la personne.

## Conduire un entretien de progression : le modèle GROW

Pour les entretiens consacrés au développement, le modèle GROW donne une trame simple en quatre temps. Il a été mis au point dans les années 1980 par des coachs britanniques, dont Graham Alexander, Alan Fine et John Whitmore, et popularisé par le livre de Whitmore, *Coaching for Performance* (1992). Il repose sur le questionnement, pas sur le conseil : la personne trouve elle-même son chemin, ce qui rend l''engagement bien plus solide.

- G, Goal (objectif) : « Qu''est-ce que tu veux être capable de faire ? D''ici quand ? Comment saurons-nous que c''est acquis ? »
- R, Reality (réalité) : « Où en es-tu aujourd''hui ? Qu''est-ce que tu as déjà essayé ? Qu''est-ce qui te manque ? »
- O, Options : « Qu''est-ce que tu pourrais faire ? Quoi d''autre ? Et si tu avais plus de temps, de moyens ? » Le manager peut ajouter des options, après celles de la personne.
- W, Will (volonté, engagement) : « Qu''est-ce que tu vas faire, concrètement, d''ici notre prochain point ? Qu''est-ce qui pourrait t''en empêcher ? De quoi as-tu besoin de ma part ? »

Un entretien GROW dure vingt à trente minutes. Repère utile : si vous parlez plus d''un quart du temps, vous êtes passé du questionnement au conseil.

## Le cas Garnier — le plan de Julien

Objectif (G) : Julien veut être autonome sur la peinture de raccord d''ici six mois, niveau 2 de la matrice. Réalité (R) : niveau 1 aujourd''hui, il a fait deux reprises de finition, il va trop vite sous pression ; il a déjà regardé Nadia travailler mais sans pratiquer. Options (O) : binôme avec Nadia une heure par semaine sur véhicule réel ; formation d''une journée chez le fournisseur de peinture (demande au plan de développement des compétences, financement OPCO à vérifier) ; contrôle de chaque finition par Thierry jusqu''à Noël ; retour d''expérience après chaque reprise. Engagement (W) : Julien prépare chaque séance avec Nadia en notant une question ; Karim planifie les séances le mardi à 14 h et fait la demande de formation avant fin de mois ; point toutes les six semaines. Le PDI tient sur une page, signé par les deux.

Six mois plus tard, ce plan est la matière de l''entretien de parcours professionnel de Julien : sa progression est documentée, son souhait d''évolution est clair.

## À retenir

- Développer les compétences est une obligation de l''employeur (L6321-1) et l''un des meilleurs moyens de motiver et de rendre l''équipe plus robuste.
- Partir de la matrice de compétences et des souhaits de la personne ; développer chacun, pas seulement les meilleurs ni seulement les plus faibles.
- On apprend surtout en faisant, avec retour : mise en situation, binôme, retour d''expérience, avant la formation formelle.
- Connaître les dispositifs : plan de développement des compétences, OPCO, CPF, VAE, CEP, apprentissage.
- Un PDI d''une page, un objectif à la fois, relu à chaque entretien de suivi.
- GROW pour l''entretien de progression : objectif, réalité, options, engagement ; le manager questionne plus qu''il ne conseille.

## Sources

- Code du travail, art. L6321-1 (obligation d''adaptation), L6312-1 et L6321-1 et s. (plan de développement des compétences), L6323-1 et s. (CPF), L6411-1 et s. (VAE), L6111-6 (CEP), legifrance.gouv.fr.
- Décret n° 2026-234 du 30 mars 2026 (participation forfaitaire CPF portée à 150 €) ; Service-Public.fr, « Compte personnel de formation (CPF) d''un salarié du secteur privé », service-public.gouv.fr ; moncompteformation.gouv.fr.
- Ministère du Travail, « Plan de développement des compétences », travail-emploi.gouv.fr.
- David A. Kolb, *Experiential Learning: Experience as the Source of Learning and Development*, Prentice Hall, 1984.
- John Whitmore, *Coaching for Performance*, Nicholas Brealey, 1992 (5e éd. 2017), modèle GROW.
- France Compétences, référentiel RS7377, compétence 7.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 5 and l.ordre = 4;
  n := n + 1;

  -- 4.5-integrer-un-nouvel-arrivant.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Les premières semaines d''un nouveau salarié décident de beaucoup : de sa vitesse d''apprentissage, de sa place dans l''équipe, et souvent de son maintien dans l''entreprise. Les ruptures de période d''essai et les départs dans la première année ne sont pas rares, et une intégration ratée y contribue souvent : personne pour accueillir, pas de poste prêt, pas d''explication, l''impression de déranger. Le coût d''un recrutement à refaire (annonce, entretiens, temps de formation perdu) dépasse largement le coût de quelques heures d''intégration bien préparées.

L''intégration est l''affaire du manager de proximité. Les RH gèrent le contrat et les formalités ; c''est vous qui gérez l''arrivée dans l''équipe.

## Avant le premier jour

L''intégration commence avant l''arrivée. Entre la signature et le premier jour, un message du manager (« nous vous attendons lundi à 8 h, voilà comment ça se passera, voilà ce qu''il faut apporter ») change tout pour quelqu''un qui, souvent, quitte un autre emploi avec une part d''inquiétude.

Côté pratique, la liste est connue et pourtant régulièrement oubliée : poste de travail prêt, tenue et équipements de protection à la bonne taille, accès et identifiants, badge, casier. Un nouveau qui passe sa première matinée à attendre ses chaussures de sécurité en conclut vite qu''on ne l''attendait pas.

Côté équipe : prévenir tout le monde de qui arrive, quand, pour quel poste, et désigner un parrain (ou tuteur d''intégration). Le parrain n''est pas le manager : c''est un collègue expérimenté, volontaire, qui répond aux questions qu''on n''ose pas poser au chef (où l''on mange, comment on demande un congé, qui il faut ménager). Le parrain est reconnu pour ce rôle et dispose du temps nécessaire.

## Le premier jour

Le manager est là, à l''heure, et consacre la première heure au nouveau. Il présente l''entreprise en quelques phrases, l''équipe (chacun par son prénom et son rôle, pas une liste), les lieux, les règles de sécurité à connaître avant de toucher quoi que ce soit, et le programme des premiers jours. Il dit ce qu''il attend, et ce que le nouveau peut attendre de lui.

Il présente le parrain et laisse la journée se dérouler avec lui. Le nouveau ne doit pas être productif le premier jour ; il doit comprendre où il est. Un déjeuner avec l''équipe, ou au moins avec le parrain, est plus utile que la première tâche.

En fin de journée, cinq minutes avec le manager : « Comment s''est passée la journée ? Qu''est-ce qui vous a surpris ? Qu''est-ce qui manque ? »

## La première semaine

Le nouveau observe, puis fait avec, puis fait sous contrôle. C''est le style « diriger » du leadership situationnel : consignes précises, contrôle rapproché, retours fréquents. Rien à voir avec de la méfiance : même expérimenté ailleurs, le nouveau ne connaît ici ni les habitudes ni les outils.

Chaque jour, un point court avec le parrain ou le manager. En fin de semaine, un entretien de trente minutes : ce qui est compris, ce qui ne l''est pas, ce qui étonne, ce que le nouveau apporte (il voit des choses que l''équipe ne voit plus : profitez-en avant qu''il ne s''habitue).

La formation à la sécurité, elle, n''attend pas. L''article L4141-2 du Code du travail impose une formation pratique et appropriée à la sécurité pour tout nouvel embauché, mais aussi pour les salariés qui changent de poste ou de technique et pour les intérimaires. Elle commence le premier jour, avant toute tâche exposée, et se complète au fil de la première semaine au poste. Gardez-en une trace écrite (contenu, date, signature) : c''est la preuve que l''employeur a rempli son obligation.

## Le premier mois

L''autonomie augmente par paliers, avec le PDI de la leçon 4.4 comme support. Le manager donne des retours fréquents, positifs et correctifs, avec la méthode du module 3. Il veille à ce que le nouveau soit intégré socialement : invité aux pauses, sollicité en réunion, pas laissé seul dans un coin.

Le point à un mois est un entretien formel (trente minutes) : bilan de ce qui est acquis, de ce qui reste à apprendre, du ressenti, de la relation avec l''équipe. C''est aussi le moment de dire clairement si la période d''essai est en bonne voie ou non. Une rupture de période d''essai ne doit jamais être une surprise : si des difficultés existent, elles ont été dites, avec des attentes précises et un délai, avant.

## Les cas particuliers

L''apprenti ou l''alternant : le manager (ou le maître d''apprentissage désigné) a une obligation de formation et de suivi, en lien avec le CFA. Il faut du temps pour expliquer, pas seulement pour faire faire. Lucas, à l''atelier, doit apprendre le métier, pas seulement porter les pièces.

L''intérimaire ou le CDD court : l''intégration est condensée mais pas supprimée. La sécurité, les règles essentielles, le parrain, le point de fin de première journée. Un intérimaire mal intégré est un risque d''accident.

La personne en situation de handicap : l''intégration inclut la mise en place des aménagements prévus (module 2), sans annoncer à l''équipe ce qui relève de la vie privée. On explique l''organisation (« Fatou ne porte pas les éléments lourds, Lucas s''en charge »), pas le motif.

Le nouveau manager lui-même : si c''est vous qui arrivez, tout ce qui précède vaut pour vous, et vous en êtes en grande partie responsable. La feuille de route des 90 premiers jours du module 1 est votre plan d''intégration.

## Le retour après une longue absence

Le retour d''un salarié après un congé maternité ou parental, un arrêt long, une expatriation, se prépare comme une intégration : ce qui a changé (outils, organisation, personnes), un point d''étape, une montée en charge progressive. L''entretien de parcours professionnel doit d''ailleurs être proposé au retour de plusieurs de ces absences (congé de maternité ou parental, arrêt longue maladie, congé sabbatique…), sauf si un entretien a eu lieu dans les douze mois précédents (art. L6315-1, module 3). Un retour sans accueil, où la personne découvre son poste réattribué et de nouveaux outils sans explication, fragilise ce retour, parfois au point de provoquer un départ.

## Le cas Garnier

Michel a recruté un second peintre, Amine, 31 ans, expérimenté. Karim prépare : message une semaine avant, tenue et EPI commandés à sa taille, cabine et poste préparés, Nadia désignée parraine (elle a demandé à former : c''est une reconnaissance). Premier jour : présentation de l''équipe, règles de sécurité de la cabine, déjeuner avec Nadia et Julien, cinq minutes le soir. Première semaine : Amine observe Nadia deux jours, peint avec elle, puis seul avec contrôle ; entretien le vendredi, où Amine signale que le circuit des pièces lui paraît lent par rapport à son ancien atelier. Karim note : c''est une idée à creuser. Point à un mois : Amine est autonome sur les peintures courantes, pas encore sur la nacrée (PDI avec Nadia) ; Karim lui dit clairement que l''essai est en bonne voie, et Michel le confirmera à son terme.

## À retenir

- L''intégration décide de la période d''essai et de la première année ; elle est de la responsabilité du manager.
- Avant l''arrivée : message, poste prêt, EPI, accès, équipe prévenue, parrain désigné.
- Premier jour : présence du manager, présentation, sécurité, parrain, cinq minutes le soir.
- Formation à la sécurité obligatoire dès le premier jour (L4141-2), tracée. Première semaine : style directif, entretien le vendredi.
- Premier mois : autonomie par paliers, retours fréquents, point formel à un mois, aucune surprise sur la période d''essai.
- Apprentis, intérimaires, retours d''absence : intégration adaptée, jamais supprimée.

## Sources

- Code du travail, art. L4141-2 (formation à la sécurité), L1221-19 et s. (période d''essai), L6223-1 et s. (apprentissage, maître d''apprentissage), L6315-1 (entretien de parcours professionnel), legifrance.gouv.fr.
- INRS, *TutoPrév'' accueil. Réparation automobile*, ED 4456, 2e éd., 2018, inrs.fr.
- Talya N. Bauer, *Onboarding New Employees: Maximizing Success*, SHRM Foundation, 2010.
- France Compétences, référentiel RS7377, compétences 5 et 7.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Les premières semaines d''un nouveau salarié décident de beaucoup : de sa vitesse d''apprentissage, de sa place dans l''équipe, et souvent de son maintien dans l''entreprise. Les ruptures de période d''essai et les départs dans la première année ne sont pas rares, et une intégration ratée y contribue souvent : personne pour accueillir, pas de poste prêt, pas d''explication, l''impression de déranger. Le coût d''un recrutement à refaire (annonce, entretiens, temps de formation perdu) dépasse largement le coût de quelques heures d''intégration bien préparées.

L''intégration est l''affaire du manager de proximité. Les RH gèrent le contrat et les formalités ; c''est vous qui gérez l''arrivée dans l''équipe.

## Avant le premier jour

L''intégration commence avant l''arrivée. Entre la signature et le premier jour, un message du manager (« nous vous attendons lundi à 8 h, voilà comment ça se passera, voilà ce qu''il faut apporter ») change tout pour quelqu''un qui, souvent, quitte un autre emploi avec une part d''inquiétude.

Côté pratique, la liste est connue et pourtant régulièrement oubliée : poste de travail prêt, tenue et équipements de protection à la bonne taille, accès et identifiants, badge, casier. Un nouveau qui passe sa première matinée à attendre ses chaussures de sécurité en conclut vite qu''on ne l''attendait pas.

Côté équipe : prévenir tout le monde de qui arrive, quand, pour quel poste, et désigner un parrain (ou tuteur d''intégration). Le parrain n''est pas le manager : c''est un collègue expérimenté, volontaire, qui répond aux questions qu''on n''ose pas poser au chef (où l''on mange, comment on demande un congé, qui il faut ménager). Le parrain est reconnu pour ce rôle et dispose du temps nécessaire.

## Le premier jour

Le manager est là, à l''heure, et consacre la première heure au nouveau. Il présente l''entreprise en quelques phrases, l''équipe (chacun par son prénom et son rôle, pas une liste), les lieux, les règles de sécurité à connaître avant de toucher quoi que ce soit, et le programme des premiers jours. Il dit ce qu''il attend, et ce que le nouveau peut attendre de lui.

Il présente le parrain et laisse la journée se dérouler avec lui. Le nouveau ne doit pas être productif le premier jour ; il doit comprendre où il est. Un déjeuner avec l''équipe, ou au moins avec le parrain, est plus utile que la première tâche.

En fin de journée, cinq minutes avec le manager : « Comment s''est passée la journée ? Qu''est-ce qui vous a surpris ? Qu''est-ce qui manque ? »

## La première semaine

Le nouveau observe, puis fait avec, puis fait sous contrôle. C''est le style « diriger » du leadership situationnel : consignes précises, contrôle rapproché, retours fréquents. Rien à voir avec de la méfiance : même expérimenté ailleurs, le nouveau ne connaît ici ni les habitudes ni les outils.

Chaque jour, un point court avec le parrain ou le manager. En fin de semaine, un entretien de trente minutes : ce qui est compris, ce qui ne l''est pas, ce qui étonne, ce que le nouveau apporte (il voit des choses que l''équipe ne voit plus : profitez-en avant qu''il ne s''habitue).

La formation à la sécurité, elle, n''attend pas. L''article L4141-2 du Code du travail impose une formation pratique et appropriée à la sécurité pour tout nouvel embauché, mais aussi pour les salariés qui changent de poste ou de technique et pour les intérimaires. Elle commence le premier jour, avant toute tâche exposée, et se complète au fil de la première semaine au poste. Gardez-en une trace écrite (contenu, date, signature) : c''est la preuve que l''employeur a rempli son obligation.

## Le premier mois

L''autonomie augmente par paliers, avec le PDI de la leçon 4.4 comme support. Le manager donne des retours fréquents, positifs et correctifs, avec la méthode du module 3. Il veille à ce que le nouveau soit intégré socialement : invité aux pauses, sollicité en réunion, pas laissé seul dans un coin.

Le point à un mois est un entretien formel (trente minutes) : bilan de ce qui est acquis, de ce qui reste à apprendre, du ressenti, de la relation avec l''équipe. C''est aussi le moment de dire clairement si la période d''essai est en bonne voie ou non. Une rupture de période d''essai ne doit jamais être une surprise : si des difficultés existent, elles ont été dites, avec des attentes précises et un délai, avant.

## Les cas particuliers

L''apprenti ou l''alternant : le manager (ou le maître d''apprentissage désigné) a une obligation de formation et de suivi, en lien avec le CFA. Il faut du temps pour expliquer, pas seulement pour faire faire. Lucas, à l''atelier, doit apprendre le métier, pas seulement porter les pièces.

L''intérimaire ou le CDD court : l''intégration est condensée mais pas supprimée. La sécurité, les règles essentielles, le parrain, le point de fin de première journée. Un intérimaire mal intégré est un risque d''accident.

La personne en situation de handicap : l''intégration inclut la mise en place des aménagements prévus (module 2), sans annoncer à l''équipe ce qui relève de la vie privée. On explique l''organisation (« Fatou ne porte pas les éléments lourds, Lucas s''en charge »), pas le motif.

Le nouveau manager lui-même : si c''est vous qui arrivez, tout ce qui précède vaut pour vous, et vous en êtes en grande partie responsable. La feuille de route des 90 premiers jours du module 1 est votre plan d''intégration.

## Le retour après une longue absence

Le retour d''un salarié après un congé maternité ou parental, un arrêt long, une expatriation, se prépare comme une intégration : ce qui a changé (outils, organisation, personnes), un point d''étape, une montée en charge progressive. L''entretien de parcours professionnel doit d''ailleurs être proposé au retour de plusieurs de ces absences (congé de maternité ou parental, arrêt longue maladie, congé sabbatique…), sauf si un entretien a eu lieu dans les douze mois précédents (art. L6315-1, module 3). Un retour sans accueil, où la personne découvre son poste réattribué et de nouveaux outils sans explication, fragilise ce retour, parfois au point de provoquer un départ.

## Le cas Garnier

Michel a recruté un second peintre, Amine, 31 ans, expérimenté. Karim prépare : message une semaine avant, tenue et EPI commandés à sa taille, cabine et poste préparés, Nadia désignée parraine (elle a demandé à former : c''est une reconnaissance). Premier jour : présentation de l''équipe, règles de sécurité de la cabine, déjeuner avec Nadia et Julien, cinq minutes le soir. Première semaine : Amine observe Nadia deux jours, peint avec elle, puis seul avec contrôle ; entretien le vendredi, où Amine signale que le circuit des pièces lui paraît lent par rapport à son ancien atelier. Karim note : c''est une idée à creuser. Point à un mois : Amine est autonome sur les peintures courantes, pas encore sur la nacrée (PDI avec Nadia) ; Karim lui dit clairement que l''essai est en bonne voie, et Michel le confirmera à son terme.

## À retenir

- L''intégration décide de la période d''essai et de la première année ; elle est de la responsabilité du manager.
- Avant l''arrivée : message, poste prêt, EPI, accès, équipe prévenue, parrain désigné.
- Premier jour : présence du manager, présentation, sécurité, parrain, cinq minutes le soir.
- Formation à la sécurité obligatoire dès le premier jour (L4141-2), tracée. Première semaine : style directif, entretien le vendredi.
- Premier mois : autonomie par paliers, retours fréquents, point formel à un mois, aucune surprise sur la période d''essai.
- Apprentis, intérimaires, retours d''absence : intégration adaptée, jamais supprimée.

## Sources

- Code du travail, art. L4141-2 (formation à la sécurité), L1221-19 et s. (période d''essai), L6223-1 et s. (apprentissage, maître d''apprentissage), L6315-1 (entretien de parcours professionnel), legifrance.gouv.fr.
- INRS, *TutoPrév'' accueil. Réparation automobile*, ED 4456, 2e éd., 2018, inrs.fr.
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

Dans une petite équipe, c''est le manager de proximité qui distribue la charge de travail, au jour le jour. L''ANACT propose d''en distinguer trois dimensions : la charge prescrite (ce qu''on demande), la charge réelle (ce que la personne fait effectivement, y compris ce qui n''est écrit nulle part : rattraper, improviser, gérer les imprévus) et la charge vécue (la façon dont elle le ressent). Un manager qui ne regarde que la charge prescrite passe à côté de la surcharge, qui se loge justement dans l''écart entre les trois.

Réguler la charge, concrètement :

- Mesurer : le tableau de bord du module 2 avec un indicateur de garde-fou (heures supplémentaires, retards, reprises) ; le brief quotidien où l''on dit ce qui déborde.
- Prioriser : la matrice d''Eisenhower ; quand tout est urgent, c''est au manager de dire ce qui attend, pas à la personne de tout faire.
- Dire non ou « oui à ces conditions » à la hiérarchie quand la charge n''est pas tenable (module 3, podcast 3.8).
- Répartir équitablement : les mêmes ne doivent pas absorber tous les imprévus parce qu''ils ne disent jamais non.
- Vérifier régulièrement, en entretien de suivi : « Comment tu vis ta charge en ce moment ? » Pour les salariés en forfait-jours, un entretien annuel portant sur la charge de travail est obligatoire (art. L3121-64 et L3121-65).

Le cadre légal de la durée du travail est le garde-fou minimal, et le manager le connaît : 10 heures par jour maximum (L3121-18), 48 heures par semaine et 44 heures en moyenne sur douze semaines (L3121-20 et L3121-22), 11 heures de repos quotidien (L3131-1), 35 heures de repos hebdomadaire consécutives (L3132-2), 20 minutes de pause dès 6 heures de travail (L3121-16). Des dérogations existent par accord ; le manager se renseigne auprès des RH avant d''en supposer. Un manager qui fait dépasser ces limites engage la responsabilité de l''employeur, et peut engager la sienne s''il a reçu une délégation de pouvoirs (module 1).

## La QVCT : de quoi parle-t-on

L''accord national interprofessionnel du 9 décembre 2020 sur la santé au travail a substitué à la « qualité de vie au travail » (QVT) la notion de « qualité de vie et des conditions de travail » (QVCT), que la loi n° 2021-1018 du 2 août 2021, qui transpose l''accord, a inscrite dans le Code du travail. Le changement de mot a un sens : il ramène le sujet au travail lui-même (son organisation, ses conditions, son contenu) plutôt qu''aux à-côtés (le baby-foot, les paniers de fruits). Dans les entreprises où existe au moins une section syndicale d''organisation représentative, la QVCT fait partie des négociations obligatoires (L2242-1 et L2242-17).

L''ANACT (Agence nationale pour l''amélioration des conditions de travail) décrit la QVCT à travers plusieurs champs, dont beaucoup sont des domaines sur lesquels le manager de proximité a prise : le contenu du travail (intérêt, autonomie, variété), l''organisation (charge, rythme, clarté des rôles), les relations (soutien du manager et des collègues, reconnaissance), les possibilités de progression, l''articulation entre vie professionnelle et vie personnelle, et la participation aux décisions qui concernent le travail.

Le dernier point compte plus qu''il n''y paraît : la QVCT se construit avec les salariés, pas pour eux. L''ANACT recommande pour cela les « espaces de discussion sur le travail », où l''équipe parle de ce qui la gêne dans son travail et de ce qui pourrait changer. La réunion mensuelle du module 3, avec un point « qu''est-ce qui nous complique le travail », en est une forme simple.

## Le télétravail et l''hybride

Le télétravail est encadré par les articles L1222-9 à L1222-11 du Code du travail et par l''ANI du 26 novembre 2020. Ce que le manager doit savoir :

- Il est mis en place par accord collectif ou, à défaut, par une charte de l''employeur, ou, à défaut, par simple accord entre le salarié et l''employeur, par tout moyen. Il est volontaire des deux côtés, sauf circonstances exceptionnelles (épidémie, force majeure) où l''employeur peut l''imposer.
- Si un poste est éligible selon l''accord ou la charte, un refus opposé au salarié qui le demande doit être motivé ; c''est aussi le cas pour une demande d''un travailleur handicapé ou d''un salarié proche aidant.
- Le télétravailleur a les mêmes droits que les autres : mêmes règles de durée du travail, mêmes possibilités de formation et d''évolution, même accès à l''information.
- L''accord ou la charte fixe les plages horaires pendant lesquelles l''employeur peut habituellement le contacter (en cas d''accord individuel, prévoyez-les dans cet accord), et l''employeur organise chaque année un entretien qui porte notamment sur ses conditions d''activité et sa charge de travail (L1222-10).
- L''accident survenu sur le lieu du télétravail pendant l''exercice de l''activité professionnelle est présumé être un accident du travail.

Pour le manager, le télétravail change la manière de faire, beaucoup moins les principes : on manage sur les résultats et la confiance, pas sur la présence ; on adapte les rituels (module 6, leçon 6.6) ; on veille à l''équité entre ceux qui sont sur site et ceux qui sont à distance (accès à l''information, aux missions intéressantes, à la reconnaissance) ; on repère l''isolement.

Dans un atelier, un commerce, un service de soins, le télétravail ne concerne qu''une partie des postes (l''administratif, parfois l''encadrement). Le manager veille alors à ce que cela ne crée pas deux catégories de salariés : ceux qui peuvent et ceux qui ne peuvent pas. On l''explique (le poste, pas la personne), et on cherche d''autres souplesses pour les seconds (horaires, jours).

## Le droit à la déconnexion

Depuis le 1er janvier 2017 (loi du 8 août 2016), les modalités du droit à la déconnexion font partie de la négociation obligatoire sur la QVCT (L2242-17) ; à défaut d''accord, l''employeur élabore une charte, après avis du CSE. L''objet : garantir le respect des temps de repos et de congé, et de la vie personnelle et familiale. Même là où rien n''est négocié, les temps de repos restent dus. Le manager de proximité est le premier acteur de ce droit, par l''exemple : un manager qui envoie des messages à 22 h ou le dimanche, même « sans attendre de réponse », crée une pression que l''équipe ressent. Les règles simples : pas de message professionnel hors des horaires sauf urgence réelle (et définir ce qu''est une urgence), envoi différé si l''on travaille tard, pas de reproche à qui ne répond pas le soir, et des congés qui sont des congés.

## L''équité de traitement

Équitable ne veut pas dire identique pour tous : les différences de traitement doivent reposer sur une raison objective, et connue de l''équipe. Le Code du travail interdit toute discrimination fondée sur une liste de critères (origine, sexe, âge, situation de famille, état de santé, handicap, opinions, activités syndicales, etc. ; art. L1132-1), à l''embauche comme dans la carrière, la rémunération, la formation, l''affectation. Le principe « à travail égal, salaire égal », dégagé par la jurisprudence et inscrit dans la loi pour l''égalité entre les femmes et les hommes (L3221-2), s''applique aussi.

Le risque, pour un manager de proximité, tient moins à la discrimination délibérée qu''à celle qu''on commet sans y penser : écarter un senior d''un projet « parce qu''il va partir » (âge), ne pas confier de responsabilités à celui qui revient d''un arrêt maladie (état de santé), ne jamais proposer de formation aux salariés à temps partiel, qui sont souvent des femmes. Ce dernier cas est une discrimination indirecte : un critère en apparence neutre qui désavantage, de fait, les personnes d''un même sexe. Chacune de ces décisions, prise par habitude, peut constituer une discrimination. Et donner les missions intéressantes toujours aux mêmes, sans critère, est au minimum une injustice.

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

- Code du travail : durée du travail et repos (L3121-16, L3121-18, L3121-20, L3121-22, L3131-1, L3132-2, L3121-64, L3121-65), télétravail (L1222-9 à L1222-11), négociation QVCT et déconnexion (L2242-1, L2242-17), non-discrimination (L1132-1), égalité de rémunération (L3221-2), legifrance.gouv.fr.
- ANI du 9 décembre 2020 pour une prévention renforcée et une offre renouvelée en matière de santé au travail et conditions de travail ; loi n° 2021-1018 du 2 août 2021 pour renforcer la prévention en santé au travail ; ANI du 26 novembre 2020 pour une mise en œuvre réussie du télétravail.
- Loi n° 2016-1088 du 8 août 2016 (droit à la déconnexion).
- ANACT, ressources sur la QVCT, la charge de travail et les espaces de discussion sur le travail, anact.fr.
- Défenseur des droits, « Discrimination au travail », defenseurdesdroits.fr.
- France Compétences, référentiel RS7377, compétence 5.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Le référentiel RS7377 demande au manager de « mettre en place et faire vivre un cadre de travail respectueux, soutenable et équitable ». Derrière ces trois adjectifs, il y a des règles de droit, des outils, et surtout des décisions quotidiennes du manager de proximité : qui fait quoi, combien, quand, et si c''est juste. Cette leçon traite de la charge de travail, de la qualité de vie et des conditions de travail, du télétravail, du droit à la déconnexion et de l''équité de traitement. La leçon suivante traite des risques psychosociaux.

## La charge de travail : la réguler, pas la subir

Dans une petite équipe, c''est le manager de proximité qui distribue la charge de travail, au jour le jour. L''ANACT propose d''en distinguer trois dimensions : la charge prescrite (ce qu''on demande), la charge réelle (ce que la personne fait effectivement, y compris ce qui n''est écrit nulle part : rattraper, improviser, gérer les imprévus) et la charge vécue (la façon dont elle le ressent). Un manager qui ne regarde que la charge prescrite passe à côté de la surcharge, qui se loge justement dans l''écart entre les trois.

Réguler la charge, concrètement :

- Mesurer : le tableau de bord du module 2 avec un indicateur de garde-fou (heures supplémentaires, retards, reprises) ; le brief quotidien où l''on dit ce qui déborde.
- Prioriser : la matrice d''Eisenhower ; quand tout est urgent, c''est au manager de dire ce qui attend, pas à la personne de tout faire.
- Dire non ou « oui à ces conditions » à la hiérarchie quand la charge n''est pas tenable (module 3, podcast 3.8).
- Répartir équitablement : les mêmes ne doivent pas absorber tous les imprévus parce qu''ils ne disent jamais non.
- Vérifier régulièrement, en entretien de suivi : « Comment tu vis ta charge en ce moment ? » Pour les salariés en forfait-jours, un entretien annuel portant sur la charge de travail est obligatoire (art. L3121-64 et L3121-65).

Le cadre légal de la durée du travail est le garde-fou minimal, et le manager le connaît : 10 heures par jour maximum (L3121-18), 48 heures par semaine et 44 heures en moyenne sur douze semaines (L3121-20 et L3121-22), 11 heures de repos quotidien (L3131-1), 35 heures de repos hebdomadaire consécutives (L3132-2), 20 minutes de pause dès 6 heures de travail (L3121-16). Des dérogations existent par accord ; le manager se renseigne auprès des RH avant d''en supposer. Un manager qui fait dépasser ces limites engage la responsabilité de l''employeur, et peut engager la sienne s''il a reçu une délégation de pouvoirs (module 1).

## La QVCT : de quoi parle-t-on

L''accord national interprofessionnel du 9 décembre 2020 sur la santé au travail a substitué à la « qualité de vie au travail » (QVT) la notion de « qualité de vie et des conditions de travail » (QVCT), que la loi n° 2021-1018 du 2 août 2021, qui transpose l''accord, a inscrite dans le Code du travail. Le changement de mot a un sens : il ramène le sujet au travail lui-même (son organisation, ses conditions, son contenu) plutôt qu''aux à-côtés (le baby-foot, les paniers de fruits). Dans les entreprises où existe au moins une section syndicale d''organisation représentative, la QVCT fait partie des négociations obligatoires (L2242-1 et L2242-17).

L''ANACT (Agence nationale pour l''amélioration des conditions de travail) décrit la QVCT à travers plusieurs champs, dont beaucoup sont des domaines sur lesquels le manager de proximité a prise : le contenu du travail (intérêt, autonomie, variété), l''organisation (charge, rythme, clarté des rôles), les relations (soutien du manager et des collègues, reconnaissance), les possibilités de progression, l''articulation entre vie professionnelle et vie personnelle, et la participation aux décisions qui concernent le travail.

Le dernier point compte plus qu''il n''y paraît : la QVCT se construit avec les salariés, pas pour eux. L''ANACT recommande pour cela les « espaces de discussion sur le travail », où l''équipe parle de ce qui la gêne dans son travail et de ce qui pourrait changer. La réunion mensuelle du module 3, avec un point « qu''est-ce qui nous complique le travail », en est une forme simple.

## Le télétravail et l''hybride

Le télétravail est encadré par les articles L1222-9 à L1222-11 du Code du travail et par l''ANI du 26 novembre 2020. Ce que le manager doit savoir :

- Il est mis en place par accord collectif ou, à défaut, par une charte de l''employeur, ou, à défaut, par simple accord entre le salarié et l''employeur, par tout moyen. Il est volontaire des deux côtés, sauf circonstances exceptionnelles (épidémie, force majeure) où l''employeur peut l''imposer.
- Si un poste est éligible selon l''accord ou la charte, un refus opposé au salarié qui le demande doit être motivé ; c''est aussi le cas pour une demande d''un travailleur handicapé ou d''un salarié proche aidant.
- Le télétravailleur a les mêmes droits que les autres : mêmes règles de durée du travail, mêmes possibilités de formation et d''évolution, même accès à l''information.
- L''accord ou la charte fixe les plages horaires pendant lesquelles l''employeur peut habituellement le contacter (en cas d''accord individuel, prévoyez-les dans cet accord), et l''employeur organise chaque année un entretien qui porte notamment sur ses conditions d''activité et sa charge de travail (L1222-10).
- L''accident survenu sur le lieu du télétravail pendant l''exercice de l''activité professionnelle est présumé être un accident du travail.

Pour le manager, le télétravail change la manière de faire, beaucoup moins les principes : on manage sur les résultats et la confiance, pas sur la présence ; on adapte les rituels (module 6, leçon 6.6) ; on veille à l''équité entre ceux qui sont sur site et ceux qui sont à distance (accès à l''information, aux missions intéressantes, à la reconnaissance) ; on repère l''isolement.

Dans un atelier, un commerce, un service de soins, le télétravail ne concerne qu''une partie des postes (l''administratif, parfois l''encadrement). Le manager veille alors à ce que cela ne crée pas deux catégories de salariés : ceux qui peuvent et ceux qui ne peuvent pas. On l''explique (le poste, pas la personne), et on cherche d''autres souplesses pour les seconds (horaires, jours).

## Le droit à la déconnexion

Depuis le 1er janvier 2017 (loi du 8 août 2016), les modalités du droit à la déconnexion font partie de la négociation obligatoire sur la QVCT (L2242-17) ; à défaut d''accord, l''employeur élabore une charte, après avis du CSE. L''objet : garantir le respect des temps de repos et de congé, et de la vie personnelle et familiale. Même là où rien n''est négocié, les temps de repos restent dus. Le manager de proximité est le premier acteur de ce droit, par l''exemple : un manager qui envoie des messages à 22 h ou le dimanche, même « sans attendre de réponse », crée une pression que l''équipe ressent. Les règles simples : pas de message professionnel hors des horaires sauf urgence réelle (et définir ce qu''est une urgence), envoi différé si l''on travaille tard, pas de reproche à qui ne répond pas le soir, et des congés qui sont des congés.

## L''équité de traitement

Équitable ne veut pas dire identique pour tous : les différences de traitement doivent reposer sur une raison objective, et connue de l''équipe. Le Code du travail interdit toute discrimination fondée sur une liste de critères (origine, sexe, âge, situation de famille, état de santé, handicap, opinions, activités syndicales, etc. ; art. L1132-1), à l''embauche comme dans la carrière, la rémunération, la formation, l''affectation. Le principe « à travail égal, salaire égal », dégagé par la jurisprudence et inscrit dans la loi pour l''égalité entre les femmes et les hommes (L3221-2), s''applique aussi.

Le risque, pour un manager de proximité, tient moins à la discrimination délibérée qu''à celle qu''on commet sans y penser : écarter un senior d''un projet « parce qu''il va partir » (âge), ne pas confier de responsabilités à celui qui revient d''un arrêt maladie (état de santé), ne jamais proposer de formation aux salariés à temps partiel, qui sont souvent des femmes. Ce dernier cas est une discrimination indirecte : un critère en apparence neutre qui désavantage, de fait, les personnes d''un même sexe. Chacune de ces décisions, prise par habitude, peut constituer une discrimination. Et donner les missions intéressantes toujours aux mêmes, sans critère, est au minimum une injustice.

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

- Code du travail : durée du travail et repos (L3121-16, L3121-18, L3121-20, L3121-22, L3131-1, L3132-2, L3121-64, L3121-65), télétravail (L1222-9 à L1222-11), négociation QVCT et déconnexion (L2242-1, L2242-17), non-discrimination (L1132-1), égalité de rémunération (L3221-2), legifrance.gouv.fr.
- ANI du 9 décembre 2020 pour une prévention renforcée et une offre renouvelée en matière de santé au travail et conditions de travail ; loi n° 2021-1018 du 2 août 2021 pour renforcer la prévention en santé au travail ; ANI du 26 novembre 2020 pour une mise en œuvre réussie du télétravail.
- Loi n° 2016-1088 du 8 août 2016 (droit à la déconnexion).
- ANACT, ressources sur la QVCT, la charge de travail et les espaces de discussion sur le travail, anact.fr.
- Défenseur des droits, « Discrimination au travail », defenseurdesdroits.fr.
- France Compétences, référentiel RS7377, compétence 5.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 5 and l.ordre = 6;
  n := n + 1;

  -- 4.7-prevenir-les-risques-psychosociaux.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Les risques psychosociaux (RPS) sont, selon la définition retenue par le collège d''expertise présidé par Michel Gollac, les risques pour la santé mentale, physique et sociale engendrés par les conditions d''emploi et les facteurs organisationnels et relationnels susceptibles d''interagir avec le fonctionnement mental. Stress chronique, épuisement, violences internes (harcèlement, conflits exacerbés) et externes (agressions de clients ou d''usagers) en sont les formes les plus connues. La prévention ne part pas de la « fragilité » supposée des personnes : elle part de l''organisation du travail, là où se trouvent les facteurs de risque. C''est pour cela que le manager de proximité, qui organise le travail, est en première ligne pour les prévenir, et aussi pour les produire quand il s''y prend mal.

## Ce que dit la loi

L''employeur a une obligation de sécurité : il doit prendre les mesures nécessaires pour assurer la sécurité et protéger la santé physique et mentale des travailleurs (art. L4121-1). La santé mentale figure dans le texte depuis 2002. Les RPS doivent être évalués dans le document unique d''évaluation des risques professionnels (DUERP, art. L4121-3-1), obligatoire dans toute entreprise dès le premier salarié, et faire l''objet d''actions de prévention selon les principes généraux (L4121-2) : éviter les risques, les combattre à la source, adapter le travail à l''homme, planifier la prévention.

Cette obligation pèse sur l''employeur, pas sur le manager (sauf délégation de pouvoirs, vue au module 1). Mais le manager est celui par qui l''employeur agit au quotidien : ses décisions d''organisation sont des mesures de prévention, ou des facteurs de risque. Et il a, comme tout salarié, l''obligation de prendre soin de sa santé et de celle des autres (L4122-1).

## Les six familles de facteurs de risque

Le rapport de ce collège d''expertise (2011), qui fait référence en France, classe les facteurs de RPS en six familles. Elles sont utiles au manager parce que chacune renvoie à une décision d''organisation qu''il prend, ou pas.

| Famille | Ce dont il s''agit | Ce que le manager peut faire |
|---|---|---|
| Intensité et temps de travail | Charge, rythme, délais, interruptions, horaires, heures supplémentaires | Réguler la charge, prioriser, protéger les repos (leçon 4.6) |
| Exigences émotionnelles | Contact avec le public, clients difficiles, devoir cacher ses émotions, contact avec la souffrance | Ne pas laisser seul face au client agressif, débriefer, former |
| Autonomie insuffisante | Pas de marge sur la manière de faire, pas de participation aux décisions, compétences sous-utilisées | Déléguer, consulter, laisser choisir la méthode |
| Rapports sociaux dégradés | Manque de soutien du manager ou des collègues, manque de reconnaissance, injustice, violence, harcèlement | Écoute, feedback, reconnaissance, équité, limites (modules 3 et 4) |
| Conflits de valeurs | Devoir faire un travail qu''on désapprouve, travail « bâclé » faute de moyens, sentiment d''inutilité | Donner les moyens de faire du travail de qualité, expliquer le sens |
| Insécurité de la situation de travail | Peur de perdre son emploi, changements non maîtrisés, incertitude sur l''avenir | Informer, accompagner le changement (module 6) |

Un manager qui relit ce tableau y retrouve tout le contenu de cette formation. Rien d''étonnant : une bonne partie de la prévention des RPS passe par le management ordinaire, bien fait.

## Les neuf conseils de l''INRS

L''INRS a traduit ces facteurs en neuf conseils destinés aux managers (brochure ED 6250, *Risques psychosociaux : 9 conseils pour agir au quotidien*) : évaluer la charge de travail ; donner de l''autonomie ; soutenir ses collaborateurs ; témoigner de la reconnaissance ; donner du sens au travail ; agir face aux agressions externes ; communiquer sur les changements ; faciliter la conciliation entre travail et vie privée ; bannir toute forme de violence. La brochure est gratuite et courte. Gardez-la à portée de main : chaque conseil renvoie à une leçon de ce module ou du suivant (charge et équité en 4.6, reconnaissance en 4.3, changement au module 6, violence et harcèlement au module 5).

## Les signaux d''alerte

Le manager n''est pas un soignant et ne pose pas de diagnostic. Mais il est le mieux placé pour voir les changements. Les signaux à repérer sont des écarts par rapport au comportement habituel de la personne :

- Au niveau individuel : irritabilité, repli, fatigue visible, erreurs inhabituelles, retards ou absences courtes répétées, présence excessive (arrive plus tôt, part plus tard, ne prend plus de pause), propos de découragement (« je n''y arrive plus », « à quoi bon »), pleurs, plaintes physiques (dos, sommeil, maux de tête).
- Au niveau collectif : absentéisme en hausse, turnover, tensions et conflits, baisse de qualité, silence en réunion, demandes de mutation, accidents.

Un signal isolé ne veut rien dire. Un faisceau de signaux, ou un changement net chez quelqu''un, demande d''agir. Le tableau de bord (absentéisme, heures supplémentaires, reprises) et l''entretien de suivi (temps « ressenti et besoins ») sont les outils de détection.

## Ce qui relève du manager, de l''employeur, du médecin du travail

Tracer cette frontière protège tout le monde : le manager qui essaie de tout porter seul s''épuise, et la personne n''a pas l''aide dont elle a besoin.

Le manager : il organise le travail pour réduire les facteurs de risque (le tableau ci-dessus) ; il repère les signaux ; il écoute la personne, sans creuser dans sa vie privée ni interpréter (« tu fais un burn-out » n''est pas une phrase de manager) ; il agit sur ce qui dépend de lui (charge, horaires, soutien, conflit) ; il oriente vers les bons interlocuteurs ; il alerte sa hiérarchie et les RH quand la situation le dépasse ; il trace ce qu''il a fait.

L''employeur (direction, RH) : il porte l''obligation de sécurité, décide des mesures collectives (effectifs, organisation, moyens), traite les situations graves (harcèlement, violence), met en place le DUERP et le plan de prévention, et répond aux alertes du manager.

Le médecin du travail et le service de prévention et de santé au travail : dans l''entreprise, ce sont eux qui évaluent l''état de santé d''une personne au regard de son poste. Tout salarié peut demander à être examiné par le médecin du travail, en s''adressant directement au service de santé au travail, et cette demande ne peut motiver aucune sanction (art. R4624-34) ; le manager peut le lui rappeler, et l''employeur peut aussi demander une visite. Le médecin du travail est tenu au secret médical ; il ne dira pas au manager ce qu''a la personne, mais il peut proposer des aménagements de poste ou du temps de travail, que l''employeur doit prendre en compte (L4624-3 et L4624-6). Un arrêt de travail, lui, est prescrit par le médecin traitant, pas par le médecin du travail.

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

Le manager de proximité est lui-même très exposé : pris entre la hiérarchie et l''équipe, chargé de faire appliquer ce qu''il ne décide pas, souvent sans formation ni soutien. Les mêmes signaux valent pour lui. Les mêmes relais aussi. Et un manager épuisé manage mal : dire à sa hiérarchie que la charge n''est pas tenable, comme au podcast 3.8, est un acte de management, pas un aveu de faiblesse.

## Le cas Garnier

Thierry, depuis un mois, arrive plus tôt, ne prend plus sa pause, a fait une erreur inhabituelle de commande, et a eu un accrochage sec avec Sophie. Karim le voit un mardi, dans le bureau. Faits, écoute. Thierry finit par dire qu''il a « la tête ailleurs », sans plus ; qu''il en a assez de « faire le contremaître sans le titre » ; et que les cadences depuis la nouvelle organisation le fatiguent. Karim n''interprète pas. Il agit sur le travail : le rôle de référent qualité de Thierry sera formalisé et reconnu (en entretien de parcours avec Michel), le contrôle des finitions est réparti avec Karim les jours chargés, et Karim rappelle que Thierry peut voir le médecin du travail s''il le souhaite, sans passer par personne. Il informe Michel qu''il a une inquiétude sur la charge de Thierry, sans plus. Point dans dix jours. Ce que Thierry a « ailleurs » ne regarde pas Karim, sauf si Thierry choisit de lui en parler.

## À retenir

- On prévient les RPS en agissant sur l''organisation du travail, pas en cherchant des personnes « fragiles » ; l''employeur a une obligation de sécurité (L4121-1), le manager en est l''acteur quotidien.
- Six familles de facteurs (Gollac) : intensité, exigences émotionnelles, autonomie, rapports sociaux, conflits de valeurs, insécurité ; chacune renvoie à une décision du manager.
- Repérer les changements de comportement, individuels et collectifs, avec le tableau de bord et l''entretien de suivi.
- Le manager repère, écoute, agit sur le travail, oriente, alerte, suit ; il ne diagnostique pas et ne soigne pas.
- Le médecin du travail est accessible à tout salarié, à sa demande (R4624-34). En cas de danger immédiat : ne pas rester seul, 15 ou 3114.

## Sources

- Code du travail, art. L4121-1 à L4121-3-1, L4122-1, L4624-3, L4624-6, R4624-34, legifrance.gouv.fr.
- INRS, *Risques psychosociaux : 9 conseils pour agir au quotidien*, ED 6250, 2e éd., 2024, révisée en 2025 ; *Risques psychosociaux : comment agir en prévention ?*, ED 6349, 2022 ; dossier « Risques psychosociaux », inrs.fr.
- Michel Gollac, Marceline Bodier (dir.), *Mesurer les facteurs psychosociaux de risque au travail pour les maîtriser*, rapport du Collège d''expertise sur le suivi des risques psychosociaux au travail, ministère du Travail, 2011.
- ANACT, ressources sur la prévention des risques psychosociaux, anact.fr.
- Ministère du Travail, « Risques psychosociaux », travail-emploi.gouv.fr ; 3114.fr.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Les risques psychosociaux (RPS) sont, selon la définition retenue par le collège d''expertise présidé par Michel Gollac, les risques pour la santé mentale, physique et sociale engendrés par les conditions d''emploi et les facteurs organisationnels et relationnels susceptibles d''interagir avec le fonctionnement mental. Stress chronique, épuisement, violences internes (harcèlement, conflits exacerbés) et externes (agressions de clients ou d''usagers) en sont les formes les plus connues. La prévention ne part pas de la « fragilité » supposée des personnes : elle part de l''organisation du travail, là où se trouvent les facteurs de risque. C''est pour cela que le manager de proximité, qui organise le travail, est en première ligne pour les prévenir, et aussi pour les produire quand il s''y prend mal.

## Ce que dit la loi

L''employeur a une obligation de sécurité : il doit prendre les mesures nécessaires pour assurer la sécurité et protéger la santé physique et mentale des travailleurs (art. L4121-1). La santé mentale figure dans le texte depuis 2002. Les RPS doivent être évalués dans le document unique d''évaluation des risques professionnels (DUERP, art. L4121-3-1), obligatoire dans toute entreprise dès le premier salarié, et faire l''objet d''actions de prévention selon les principes généraux (L4121-2) : éviter les risques, les combattre à la source, adapter le travail à l''homme, planifier la prévention.

Cette obligation pèse sur l''employeur, pas sur le manager (sauf délégation de pouvoirs, vue au module 1). Mais le manager est celui par qui l''employeur agit au quotidien : ses décisions d''organisation sont des mesures de prévention, ou des facteurs de risque. Et il a, comme tout salarié, l''obligation de prendre soin de sa santé et de celle des autres (L4122-1).

## Les six familles de facteurs de risque

Le rapport de ce collège d''expertise (2011), qui fait référence en France, classe les facteurs de RPS en six familles. Elles sont utiles au manager parce que chacune renvoie à une décision d''organisation qu''il prend, ou pas.

| Famille | Ce dont il s''agit | Ce que le manager peut faire |
|---|---|---|
| Intensité et temps de travail | Charge, rythme, délais, interruptions, horaires, heures supplémentaires | Réguler la charge, prioriser, protéger les repos (leçon 4.6) |
| Exigences émotionnelles | Contact avec le public, clients difficiles, devoir cacher ses émotions, contact avec la souffrance | Ne pas laisser seul face au client agressif, débriefer, former |
| Autonomie insuffisante | Pas de marge sur la manière de faire, pas de participation aux décisions, compétences sous-utilisées | Déléguer, consulter, laisser choisir la méthode |
| Rapports sociaux dégradés | Manque de soutien du manager ou des collègues, manque de reconnaissance, injustice, violence, harcèlement | Écoute, feedback, reconnaissance, équité, limites (modules 3 et 4) |
| Conflits de valeurs | Devoir faire un travail qu''on désapprouve, travail « bâclé » faute de moyens, sentiment d''inutilité | Donner les moyens de faire du travail de qualité, expliquer le sens |
| Insécurité de la situation de travail | Peur de perdre son emploi, changements non maîtrisés, incertitude sur l''avenir | Informer, accompagner le changement (module 6) |

Un manager qui relit ce tableau y retrouve tout le contenu de cette formation. Rien d''étonnant : une bonne partie de la prévention des RPS passe par le management ordinaire, bien fait.

## Les neuf conseils de l''INRS

L''INRS a traduit ces facteurs en neuf conseils destinés aux managers (brochure ED 6250, *Risques psychosociaux : 9 conseils pour agir au quotidien*) : évaluer la charge de travail ; donner de l''autonomie ; soutenir ses collaborateurs ; témoigner de la reconnaissance ; donner du sens au travail ; agir face aux agressions externes ; communiquer sur les changements ; faciliter la conciliation entre travail et vie privée ; bannir toute forme de violence. La brochure est gratuite et courte. Gardez-la à portée de main : chaque conseil renvoie à une leçon de ce module ou du suivant (charge et équité en 4.6, reconnaissance en 4.3, changement au module 6, violence et harcèlement au module 5).

## Les signaux d''alerte

Le manager n''est pas un soignant et ne pose pas de diagnostic. Mais il est le mieux placé pour voir les changements. Les signaux à repérer sont des écarts par rapport au comportement habituel de la personne :

- Au niveau individuel : irritabilité, repli, fatigue visible, erreurs inhabituelles, retards ou absences courtes répétées, présence excessive (arrive plus tôt, part plus tard, ne prend plus de pause), propos de découragement (« je n''y arrive plus », « à quoi bon »), pleurs, plaintes physiques (dos, sommeil, maux de tête).
- Au niveau collectif : absentéisme en hausse, turnover, tensions et conflits, baisse de qualité, silence en réunion, demandes de mutation, accidents.

Un signal isolé ne veut rien dire. Un faisceau de signaux, ou un changement net chez quelqu''un, demande d''agir. Le tableau de bord (absentéisme, heures supplémentaires, reprises) et l''entretien de suivi (temps « ressenti et besoins ») sont les outils de détection.

## Ce qui relève du manager, de l''employeur, du médecin du travail

Tracer cette frontière protège tout le monde : le manager qui essaie de tout porter seul s''épuise, et la personne n''a pas l''aide dont elle a besoin.

Le manager : il organise le travail pour réduire les facteurs de risque (le tableau ci-dessus) ; il repère les signaux ; il écoute la personne, sans creuser dans sa vie privée ni interpréter (« tu fais un burn-out » n''est pas une phrase de manager) ; il agit sur ce qui dépend de lui (charge, horaires, soutien, conflit) ; il oriente vers les bons interlocuteurs ; il alerte sa hiérarchie et les RH quand la situation le dépasse ; il trace ce qu''il a fait.

L''employeur (direction, RH) : il porte l''obligation de sécurité, décide des mesures collectives (effectifs, organisation, moyens), traite les situations graves (harcèlement, violence), met en place le DUERP et le plan de prévention, et répond aux alertes du manager.

Le médecin du travail et le service de prévention et de santé au travail : dans l''entreprise, ce sont eux qui évaluent l''état de santé d''une personne au regard de son poste. Tout salarié peut demander à être examiné par le médecin du travail, en s''adressant directement au service de santé au travail, et cette demande ne peut motiver aucune sanction (art. R4624-34) ; le manager peut le lui rappeler, et l''employeur peut aussi demander une visite. Le médecin du travail est tenu au secret médical ; il ne dira pas au manager ce qu''a la personne, mais il peut proposer des aménagements de poste ou du temps de travail, que l''employeur doit prendre en compte (L4624-3 et L4624-6). Un arrêt de travail, lui, est prescrit par le médecin traitant, pas par le médecin du travail.

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

Le manager de proximité est lui-même très exposé : pris entre la hiérarchie et l''équipe, chargé de faire appliquer ce qu''il ne décide pas, souvent sans formation ni soutien. Les mêmes signaux valent pour lui. Les mêmes relais aussi. Et un manager épuisé manage mal : dire à sa hiérarchie que la charge n''est pas tenable, comme au podcast 3.8, est un acte de management, pas un aveu de faiblesse.

## Le cas Garnier

Thierry, depuis un mois, arrive plus tôt, ne prend plus sa pause, a fait une erreur inhabituelle de commande, et a eu un accrochage sec avec Sophie. Karim le voit un mardi, dans le bureau. Faits, écoute. Thierry finit par dire qu''il a « la tête ailleurs », sans plus ; qu''il en a assez de « faire le contremaître sans le titre » ; et que les cadences depuis la nouvelle organisation le fatiguent. Karim n''interprète pas. Il agit sur le travail : le rôle de référent qualité de Thierry sera formalisé et reconnu (en entretien de parcours avec Michel), le contrôle des finitions est réparti avec Karim les jours chargés, et Karim rappelle que Thierry peut voir le médecin du travail s''il le souhaite, sans passer par personne. Il informe Michel qu''il a une inquiétude sur la charge de Thierry, sans plus. Point dans dix jours. Ce que Thierry a « ailleurs » ne regarde pas Karim, sauf si Thierry choisit de lui en parler.

## À retenir

- On prévient les RPS en agissant sur l''organisation du travail, pas en cherchant des personnes « fragiles » ; l''employeur a une obligation de sécurité (L4121-1), le manager en est l''acteur quotidien.
- Six familles de facteurs (Gollac) : intensité, exigences émotionnelles, autonomie, rapports sociaux, conflits de valeurs, insécurité ; chacune renvoie à une décision du manager.
- Repérer les changements de comportement, individuels et collectifs, avec le tableau de bord et l''entretien de suivi.
- Le manager repère, écoute, agit sur le travail, oriente, alerte, suit ; il ne diagnostique pas et ne soigne pas.
- Le médecin du travail est accessible à tout salarié, à sa demande (R4624-34). En cas de danger immédiat : ne pas rester seul, 15 ou 3114.

## Sources

- Code du travail, art. L4121-1 à L4121-3-1, L4122-1, L4624-3, L4624-6, R4624-34, legifrance.gouv.fr.
- INRS, *Risques psychosociaux : 9 conseils pour agir au quotidien*, ED 6250, 2e éd., 2024, révisée en 2025 ; *Risques psychosociaux : comment agir en prévention ?*, ED 6349, 2022 ; dossier « Risques psychosociaux », inrs.fr.
- Michel Gollac, Marceline Bodier (dir.), *Mesurer les facteurs psychosociaux de risque au travail pour les maîtriser*, rapport du Collège d''expertise sur le suivi des risques psychosociaux au travail, ministère du Travail, 2011.
- ANACT, ressources sur la prévention des risques psychosociaux, anact.fr.
- Ministère du Travail, « Risques psychosociaux », travail-emploi.gouv.fr ; 3114.fr.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 5 and l.ordre = 7;
  n := n + 1;

  -- 4.8-podcast-securite-psychologique.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Version écrite de l''épisode (le texte de référence ; l''enregistrement peut le formuler autrement).

Conversation entre Claire, animatrice IDEAFORMA et Hélène, responsable d''un service de production en agroalimentaire (18 opérateurs, deux équipes), en poste depuis cinq ans après avoir été conductrice de ligne (personnage fictif).

**Claire** — Bonjour à tous. Aujourd''hui on parle de sécurité psychologique, c''est-à-dire de ce qui fait qu''une équipe ose parler, ou se tait. Hélène, vous dirigez un service de production, dix-huit personnes, depuis cinq ans. Vous m''avez dit avant l''enregistrement qu''il y avait eu un « avant » et un « après ». Qu''est-ce qui s''est passé ?

**Hélène** — Il s''est passé un lot de deux tonnes de produit parti chez un client avec un défaut d''étiquetage. Allergènes manquants. Rappel de produit, pénalités, et une semaine à répondre au service qualité du client. Et quand on a fait l''enquête, on a découvert que deux opérateurs avaient vu le problème sur la ligne. Deux. Et qu''aucun n''avait rien dit.

**Claire** — Pourquoi ?

**Hélène** — C''est la question que je leur ai posée, et la réponse m''a fait mal. L''un m''a dit : « La dernière fois que j''ai arrêté la ligne, on m''a dit que j''avais fait perdre une heure de production. » L''autre m''a dit : « Je me suis dit que ce n''était pas à moi de le dire. » Et le « on », c''était moi. Je ne m''en souvenais même pas. Une remarque en passant, six mois plus tôt, sur un arrêt de ligne que j''avais trouvé injustifié.

**Claire** — Une remarque.

**Hélène** — Une remarque. Et six mois plus tard, deux tonnes de produit. C''est ça que j''ai compris ce jour-là : ce que je dis, en tant que responsable, ça ne pèse pas le poids que je crois. Ça pèse dix fois plus. Une remarque sèche sur un arrêt de ligne, ça devient une règle : « ici, on n''arrête pas la ligne ». Même si je n''ai jamais dit ça.

**Claire** — C''est exactement ce que décrit Amy Edmondson, la chercheuse qui a théorisé la sécurité psychologique. Les gens font un calcul, souvent inconscient : est-ce que je risque quelque chose si je parle ? Et si la réponse est oui, ils se taisent. Même quand l''enjeu est grave.

**Hélène** — Surtout quand l''enjeu est grave, en fait. Parce que plus l''enjeu est grave, plus la peur de se tromper est grande. « Et si j''arrête la ligne pour rien ? » Alors on laisse passer, en espérant que quelqu''un d''autre verra.

**Claire** — Qu''est-ce que vous avez fait, après le rappel ?

**Hélène** — La première chose, c''est que j''ai failli faire l''inverse de ce qu''il fallait. Mon réflexe, c''était de sanctionner les deux qui n''avaient rien dit. Mon directeur voulait des têtes. Et j''ai compris que si je faisais ça, j''envoyais le message : « Si vous voyez un problème et que vous ne le dites pas, vous êtes punis. Et si vous le dites et que vous vous trompez, vous êtes punis aussi. » Donc personne ne verrait plus jamais rien.

**Claire** — Alors ?

**Hélène** — Alors j''ai fait une réunion avec les dix-huit. Et j''ai commencé par moi. J''ai dit : « Il y a six mois, j''ai fait une remarque à quelqu''un qui avait arrêté la ligne. J''avais tort. Cette remarque a coûté deux tonnes de produit. Je vous demande pardon, et je vous demande une chose : à partir de maintenant, n''importe qui, n''importe quand, peut arrêter la ligne s''il a un doute. Un arrêt pour rien, ça coûte une heure. Un arrêt qu''on n''a pas fait, ça coûte ce qu''on vient de vivre. »

**Claire** — Vous avez commencé par reconnaître votre erreur.

**Hélène** — Je n''avais pas le choix. Si je leur avais demandé d''admettre leurs erreurs sans admettre la mienne, personne ne m''aurait crue. Et honnêtement, ça a été le moment le plus difficile de ma carrière. Dire devant dix-huit personnes « j''ai eu tort et ça a coûté cher ». Mais c''est le moment où tout a changé.

**Claire** — Comment vous l''avez vu changer ?

**Hélène** — Pas tout de suite. Les gens ne vous croient pas sur une déclaration. Ils attendent de voir ce que vous faites la première fois que quelqu''un vous prend au mot. Et ça a pris trois semaines. Un opérateur, Bastien, a arrêté la ligne pour une soudure de sachet qu''il trouvait bizarre. On a vérifié. Elle était bonne. Une demi-heure de perdue.

**Claire** — Et vous avez réagi comment ?

**Hélène** — Devant tout le monde, au briefing du lendemain : « Bastien a arrêté la ligne hier pour une soudure. Elle était bonne. C''est exactement ce que je vous ai demandé. Merci Bastien. » Et là, j''ai vu les têtes. Ils m''ont regardée comme si je venais de dire quelque chose d''incroyable. Parce que pendant des années, un arrêt pour rien, c''était un reproche.

**Claire** — C''est ce qu''Edmondson appelle « réagir de façon productive ». Le moment où quelqu''un prend un risque, la réaction du chef dans les secondes qui suivent fixe la règle pour tout le monde.

**Hélène** — Et il faut le refaire à chaque fois. Pas une fois. Parce qu''une seule réaction agacée, un seul soupir, et vous êtes revenu six mois en arrière. J''ai dû apprendre à contrôler mon visage. Ça paraît bête, mais quand quelqu''un vient vous dire qu''il a fait une erreur, la première chose qu''il regarde, c''est votre visage.

**Claire** — Parlons justement de l''erreur. Beaucoup de managers qui nous écoutent se disent : « Si j''accepte les erreurs, je vais avoir du laxisme. » Qu''est-ce que vous leur répondez ?

**Hélène** — Que c''est la confusion la plus répandue et la plus dangereuse. Le droit à l''erreur, ce n''est pas le droit à la négligence. Je fais trois catégories, et je les ai expliquées à l''équipe. L''erreur d''apprentissage : tu fais quelque chose de nouveau, tu te trompes, c''est normal, on en tire les leçons. L''erreur d''inattention : tu savais faire, tu as fait une faute, ça arrive, on regarde pourquoi, et s''il y a une cause dans l''organisation on la traite, et si ça se répète on en parle sérieusement. Et la faute délibérée : tu as contourné une règle en le sachant, là ce n''est plus une erreur, et ça se traite avec les moyens du module suivant de votre formation, le recadrage, la sanction.

**Claire** — Et la différence, l''équipe la comprend ?

**Hélène** — Très bien, parce qu''elle est juste. Ce qui n''était pas juste avant, c''était de traiter les trois de la même manière : par la remarque humiliante. Ce qui ne serait pas juste non plus, c''est de ne rien dire dans les trois cas. La sécurité psychologique, ce n''est pas l''absence d''exigence. Edmondson le dit très bien : il faut les deux. La sécurité sans l''exigence, c''est une colonie de vacances. L''exigence sans la sécurité, c''est ce que j''avais : une usine où tout le monde a peur et où les problèmes se cachent.

**Claire** — Vous avez parlé de la réaction aux erreurs. Il y a d''autres choses que vous avez changées ?

**Hélène** — Trois choses. La première, je pose des questions. Avant, j''arrivais au briefing avec des consignes. Maintenant, j''arrive avec une question : « Qu''est-ce qui a failli mal tourner hier ? » Les premières semaines, silence. Puis les réponses sont venues. Et ce sont des mines d''or : chaque « ça a failli » est un accident qu''on évite.

**Claire** — La deuxième ?

**Hélène** — J''ai arrêté de laisser passer les moqueries. Il y avait dans l''équipe une habitude de charrier, gentiment en apparence, celui qui posait une question « bête ». « Alors, t''as pas encore compris ? » Je trouvais ça inoffensif. Ce n''est pas inoffensif : celui qui s''est fait charrier ne pose plus de question. Maintenant, je dis, calmement, devant tout le monde : « Il n''y a pas de question bête ici. » Et je réponds à la question. Trois fois, et l''habitude a disparu.

**Claire** — Et la troisième ?

**Hélène** — Je dis quand je ne sais pas. « Je ne sais pas, je vais me renseigner. » Avant, je pensais que le chef devait tout savoir. En fait, un chef qui sait tout, c''est un chef à qui personne n''ose rien apprendre. Depuis que je dis « je ne sais pas », les opérateurs m''expliquent des choses sur les machines que je n''avais jamais comprises.

**Claire** — Vous avez un exemple de quelque chose qui est remonté grâce à ça et qui n''aurait jamais remonté avant ?

**Hélène** — Plein. Mais le plus marquant, c''est une opératrice, Sonia, qui est venue me dire qu''elle n''y arrivait plus. Qu''elle était épuisée, qu''elle faisait des erreurs, qu''elle avait peur qu''on s''en aperçoive. Avant, elle aurait tenu jusqu''à l''arrêt maladie, ou jusqu''à l''accident. Là, elle est venue. Je n''ai pas joué au médecin, je lui ai dit qu''elle pouvait voir le médecin du travail, j''ai regardé son poste et sa charge, et on a trouvé qu''elle absorbait seule tous les changements de format parce qu''elle était la seule à savoir les faire. On a formé deux autres personnes. Elle va bien. Et elle est restée.

**Claire** — C''est un bon exemple du lien entre sécurité psychologique et prévention des risques psychosociaux.

**Hélène** — C''est le même sujet. Une équipe qui ose parler, c''est une équipe où les problèmes se voient avant qu''ils ne deviennent des drames. Que ce soit un défaut d''étiquetage ou une personne qui s''épuise.

**Claire** — Est-ce que ça a eu un effet sur les chiffres ?

**Hélène** — Le nombre d''arrêts de ligne a augmenté. Mon directeur a d''abord tiqué. Et puis le nombre de non-conformités chez les clients a baissé, nettement, et l''absentéisme aussi. Je ne vais pas vous donner de pourcentages, ce sont les chiffres de mon usine, mais la tendance était claire au bout d''un an. Et j''ai pu lui montrer que les arrêts de ligne, c''était le prix des non-conformités qu''on n''avait plus.

**Claire** — Vous avez dit que votre directeur voulait des têtes après le rappel. Comment vous l''avez convaincu de ne pas sanctionner ?

**Hélène** — Avec des faits et une question. Je lui ai dit : « Si on sanctionne les deux qui n''ont rien dit, qu''est-ce que les seize autres vont retenir ? » Il a réfléchi. Et je lui ai proposé : « Donnez-moi six mois avec ma méthode. Si le nombre de signalements n''augmente pas, on reparle de sanctions. » Il a accepté. C''est ce qu''on vous apprend sur la communication vers le haut : pas un non, un « oui à ces conditions ».

**Claire** — Pour terminer, si un manager nous écoute et se dit « mon équipe se tait », par quoi il commence ?

**Hélène** — Par lui. Par regarder ce qu''il a fait, ou ce que son prédécesseur a fait, la dernière fois que quelqu''un a signalé un problème, admis une erreur, ou dit qu''il n''était pas d''accord. La réponse est là. Ensuite, admettre une erreur devant l''équipe, une vraie. Ensuite, poser une question à chaque briefing et attendre la réponse, sans la donner soi-même. Ensuite, remercier la première personne qui prend un risque, devant tout le monde, même si elle s''est trompée. Et ensuite, tenir. Des mois. Parce que la confiance se construit à la vitesse d''un escargot et se détruit à la vitesse d''un claquement de porte.

**Claire** — Merci Hélène.

**Hélène** — Merci à vous.

**Claire** — Dans la fiche outil qui suit, vous trouverez le gabarit du plan de développement individuel et la check-list d''intégration. Et dans le carnet de bord, vous ferez le diagnostic de sécurité psychologique de votre propre équipe.

## Sources
Amy C. Edmondson, « Psychological Safety and Learning Behavior in Work Teams », *Administrative Science Quarterly*, 1999, et *The Fearless Organization*, Wiley, 2019 ; Google re:Work, « Understand team effectiveness » (projet Aristotle), 2015 ; INRS, dossier « Risques psychosociaux », inrs.fr.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Version écrite de l''épisode (le texte de référence ; l''enregistrement peut le formuler autrement).

Conversation entre Claire, animatrice IDEAFORMA et Hélène, responsable d''un service de production en agroalimentaire (18 opérateurs, deux équipes), en poste depuis cinq ans après avoir été conductrice de ligne (personnage fictif).

**Claire** — Bonjour à tous. Aujourd''hui on parle de sécurité psychologique, c''est-à-dire de ce qui fait qu''une équipe ose parler, ou se tait. Hélène, vous dirigez un service de production, dix-huit personnes, depuis cinq ans. Vous m''avez dit avant l''enregistrement qu''il y avait eu un « avant » et un « après ». Qu''est-ce qui s''est passé ?

**Hélène** — Il s''est passé un lot de deux tonnes de produit parti chez un client avec un défaut d''étiquetage. Allergènes manquants. Rappel de produit, pénalités, et une semaine à répondre au service qualité du client. Et quand on a fait l''enquête, on a découvert que deux opérateurs avaient vu le problème sur la ligne. Deux. Et qu''aucun n''avait rien dit.

**Claire** — Pourquoi ?

**Hélène** — C''est la question que je leur ai posée, et la réponse m''a fait mal. L''un m''a dit : « La dernière fois que j''ai arrêté la ligne, on m''a dit que j''avais fait perdre une heure de production. » L''autre m''a dit : « Je me suis dit que ce n''était pas à moi de le dire. » Et le « on », c''était moi. Je ne m''en souvenais même pas. Une remarque en passant, six mois plus tôt, sur un arrêt de ligne que j''avais trouvé injustifié.

**Claire** — Une remarque.

**Hélène** — Une remarque. Et six mois plus tard, deux tonnes de produit. C''est ça que j''ai compris ce jour-là : ce que je dis, en tant que responsable, ça ne pèse pas le poids que je crois. Ça pèse dix fois plus. Une remarque sèche sur un arrêt de ligne, ça devient une règle : « ici, on n''arrête pas la ligne ». Même si je n''ai jamais dit ça.

**Claire** — C''est exactement ce que décrit Amy Edmondson, la chercheuse qui a théorisé la sécurité psychologique. Les gens font un calcul, souvent inconscient : est-ce que je risque quelque chose si je parle ? Et si la réponse est oui, ils se taisent. Même quand l''enjeu est grave.

**Hélène** — Surtout quand l''enjeu est grave, en fait. Parce que plus l''enjeu est grave, plus la peur de se tromper est grande. « Et si j''arrête la ligne pour rien ? » Alors on laisse passer, en espérant que quelqu''un d''autre verra.

**Claire** — Qu''est-ce que vous avez fait, après le rappel ?

**Hélène** — La première chose, c''est que j''ai failli faire l''inverse de ce qu''il fallait. Mon réflexe, c''était de sanctionner les deux qui n''avaient rien dit. Mon directeur voulait des têtes. Et j''ai compris que si je faisais ça, j''envoyais le message : « Si vous voyez un problème et que vous ne le dites pas, vous êtes punis. Et si vous le dites et que vous vous trompez, vous êtes punis aussi. » Donc personne ne verrait plus jamais rien.

**Claire** — Alors ?

**Hélène** — Alors j''ai fait une réunion avec les dix-huit. Et j''ai commencé par moi. J''ai dit : « Il y a six mois, j''ai fait une remarque à quelqu''un qui avait arrêté la ligne. J''avais tort. Cette remarque a coûté deux tonnes de produit. Je vous demande pardon, et je vous demande une chose : à partir de maintenant, n''importe qui, n''importe quand, peut arrêter la ligne s''il a un doute. Un arrêt pour rien, ça coûte une heure. Un arrêt qu''on n''a pas fait, ça coûte ce qu''on vient de vivre. »

**Claire** — Vous avez commencé par reconnaître votre erreur.

**Hélène** — Je n''avais pas le choix. Si je leur avais demandé d''admettre leurs erreurs sans admettre la mienne, personne ne m''aurait crue. Et honnêtement, ça a été le moment le plus difficile de ma carrière. Dire devant dix-huit personnes « j''ai eu tort et ça a coûté cher ». Mais c''est le moment où tout a changé.

**Claire** — Comment vous l''avez vu changer ?

**Hélène** — Pas tout de suite. Les gens ne vous croient pas sur une déclaration. Ils attendent de voir ce que vous faites la première fois que quelqu''un vous prend au mot. Et ça a pris trois semaines. Un opérateur, Bastien, a arrêté la ligne pour une soudure de sachet qu''il trouvait bizarre. On a vérifié. Elle était bonne. Une demi-heure de perdue.

**Claire** — Et vous avez réagi comment ?

**Hélène** — Devant tout le monde, au briefing du lendemain : « Bastien a arrêté la ligne hier pour une soudure. Elle était bonne. C''est exactement ce que je vous ai demandé. Merci Bastien. » Et là, j''ai vu les têtes. Ils m''ont regardée comme si je venais de dire quelque chose d''incroyable. Parce que pendant des années, un arrêt pour rien, c''était un reproche.

**Claire** — C''est ce qu''Edmondson appelle « réagir de façon productive ». Le moment où quelqu''un prend un risque, la réaction du chef dans les secondes qui suivent fixe la règle pour tout le monde.

**Hélène** — Et il faut le refaire à chaque fois. Pas une fois. Parce qu''une seule réaction agacée, un seul soupir, et vous êtes revenu six mois en arrière. J''ai dû apprendre à contrôler mon visage. Ça paraît bête, mais quand quelqu''un vient vous dire qu''il a fait une erreur, la première chose qu''il regarde, c''est votre visage.

**Claire** — Parlons justement de l''erreur. Beaucoup de managers qui nous écoutent se disent : « Si j''accepte les erreurs, je vais avoir du laxisme. » Qu''est-ce que vous leur répondez ?

**Hélène** — Que c''est la confusion la plus répandue et la plus dangereuse. Le droit à l''erreur, ce n''est pas le droit à la négligence. Je fais trois catégories, et je les ai expliquées à l''équipe. L''erreur d''apprentissage : tu fais quelque chose de nouveau, tu te trompes, c''est normal, on en tire les leçons. L''erreur d''inattention : tu savais faire, tu as fait une faute, ça arrive, on regarde pourquoi, et s''il y a une cause dans l''organisation on la traite, et si ça se répète on en parle sérieusement. Et la faute délibérée : tu as contourné une règle en le sachant, là ce n''est plus une erreur, et ça se traite avec les moyens du module suivant de votre formation, le recadrage, la sanction.

**Claire** — Et la différence, l''équipe la comprend ?

**Hélène** — Très bien, parce qu''elle est juste. Ce qui n''était pas juste avant, c''était de traiter les trois de la même manière : par la remarque humiliante. Ce qui ne serait pas juste non plus, c''est de ne rien dire dans les trois cas. La sécurité psychologique, ce n''est pas l''absence d''exigence. Edmondson le dit très bien : il faut les deux. La sécurité sans l''exigence, c''est une colonie de vacances. L''exigence sans la sécurité, c''est ce que j''avais : une usine où tout le monde a peur et où les problèmes se cachent.

**Claire** — Vous avez parlé de la réaction aux erreurs. Il y a d''autres choses que vous avez changées ?

**Hélène** — Trois choses. La première, je pose des questions. Avant, j''arrivais au briefing avec des consignes. Maintenant, j''arrive avec une question : « Qu''est-ce qui a failli mal tourner hier ? » Les premières semaines, silence. Puis les réponses sont venues. Et ce sont des mines d''or : chaque « ça a failli » est un accident qu''on évite.

**Claire** — La deuxième ?

**Hélène** — J''ai arrêté de laisser passer les moqueries. Il y avait dans l''équipe une habitude de charrier, gentiment en apparence, celui qui posait une question « bête ». « Alors, t''as pas encore compris ? » Je trouvais ça inoffensif. Ce n''est pas inoffensif : celui qui s''est fait charrier ne pose plus de question. Maintenant, je dis, calmement, devant tout le monde : « Il n''y a pas de question bête ici. » Et je réponds à la question. Trois fois, et l''habitude a disparu.

**Claire** — Et la troisième ?

**Hélène** — Je dis quand je ne sais pas. « Je ne sais pas, je vais me renseigner. » Avant, je pensais que le chef devait tout savoir. En fait, un chef qui sait tout, c''est un chef à qui personne n''ose rien apprendre. Depuis que je dis « je ne sais pas », les opérateurs m''expliquent des choses sur les machines que je n''avais jamais comprises.

**Claire** — Vous avez un exemple de quelque chose qui est remonté grâce à ça et qui n''aurait jamais remonté avant ?

**Hélène** — Plein. Mais le plus marquant, c''est une opératrice, Sonia, qui est venue me dire qu''elle n''y arrivait plus. Qu''elle était épuisée, qu''elle faisait des erreurs, qu''elle avait peur qu''on s''en aperçoive. Avant, elle aurait tenu jusqu''à l''arrêt maladie, ou jusqu''à l''accident. Là, elle est venue. Je n''ai pas joué au médecin, je lui ai dit qu''elle pouvait voir le médecin du travail, j''ai regardé son poste et sa charge, et on a trouvé qu''elle absorbait seule tous les changements de format parce qu''elle était la seule à savoir les faire. On a formé deux autres personnes. Elle va bien. Et elle est restée.

**Claire** — C''est un bon exemple du lien entre sécurité psychologique et prévention des risques psychosociaux.

**Hélène** — C''est le même sujet. Une équipe qui ose parler, c''est une équipe où les problèmes se voient avant qu''ils ne deviennent des drames. Que ce soit un défaut d''étiquetage ou une personne qui s''épuise.

**Claire** — Est-ce que ça a eu un effet sur les chiffres ?

**Hélène** — Le nombre d''arrêts de ligne a augmenté. Mon directeur a d''abord tiqué. Et puis le nombre de non-conformités chez les clients a baissé, nettement, et l''absentéisme aussi. Je ne vais pas vous donner de pourcentages, ce sont les chiffres de mon usine, mais la tendance était claire au bout d''un an. Et j''ai pu lui montrer que les arrêts de ligne, c''était le prix des non-conformités qu''on n''avait plus.

**Claire** — Vous avez dit que votre directeur voulait des têtes après le rappel. Comment vous l''avez convaincu de ne pas sanctionner ?

**Hélène** — Avec des faits et une question. Je lui ai dit : « Si on sanctionne les deux qui n''ont rien dit, qu''est-ce que les seize autres vont retenir ? » Il a réfléchi. Et je lui ai proposé : « Donnez-moi six mois avec ma méthode. Si le nombre de signalements n''augmente pas, on reparle de sanctions. » Il a accepté. C''est ce qu''on vous apprend sur la communication vers le haut : pas un non, un « oui à ces conditions ».

**Claire** — Pour terminer, si un manager nous écoute et se dit « mon équipe se tait », par quoi il commence ?

**Hélène** — Par lui. Par regarder ce qu''il a fait, ou ce que son prédécesseur a fait, la dernière fois que quelqu''un a signalé un problème, admis une erreur, ou dit qu''il n''était pas d''accord. La réponse est là. Ensuite, admettre une erreur devant l''équipe, une vraie. Ensuite, poser une question à chaque briefing et attendre la réponse, sans la donner soi-même. Ensuite, remercier la première personne qui prend un risque, devant tout le monde, même si elle s''est trompée. Et ensuite, tenir. Des mois. Parce que la confiance se construit à la vitesse d''un escargot et se détruit à la vitesse d''un claquement de porte.

**Claire** — Merci Hélène.

**Hélène** — Merci à vous.

**Claire** — Dans la fiche outil qui suit, vous trouverez le gabarit du plan de développement individuel et la check-list d''intégration. Et dans le carnet de bord, vous ferez le diagnostic de sécurité psychologique de votre propre équipe.

## Sources
Amy C. Edmondson, « Psychological Safety and Learning Behavior in Work Teams », *Administrative Science Quarterly*, 1999, et *The Fearless Organization*, Wiley, 2019 ; Google re:Work, « Understand team effectiveness » (projet Aristotle), 2015 ; INRS, dossier « Risques psychosociaux », inrs.fr.
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
| Jour 1 | Formation à la sécurité (L4141-2) avant toute tâche exposée, complétée au poste en semaine 1 ; trace écrite signée | Manager / référent sécurité | |
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
| Mois 3 à 12 | Entretien de parcours professionnel au cours de la première année suivant l''embauche (L6315-1) | Manager / RH | |

Cas particuliers : apprenti (lien CFA, maître d''apprentissage) ; intérimaire ou CDD court (sécurité, règles, parrain, point jour 1) ; aménagement de poste (mis en place avant l''arrivée, sans divulguer le motif) ; retour après longue absence (ce qui a changé, montée en charge, entretien de parcours).

---

## GABARIT 3 — Diagnostic de sécurité psychologique de mon équipe

À remplir seul et honnêtement, puis, si possible, à proposer à l''équipe de façon anonyme (les sept premières questions sont adaptées de l''échelle de sécurité psychologique d''Edmondson, 1999, reformulées à l''affirmative). Réponses de 1 (pas du tout d''accord) à 5 (tout à fait d''accord).

| Question | Ma réponse (1-5) | Réponse moyenne de l''équipe (si sondage) |
|---|---|---|
| Dans cette équipe, si quelqu''un fait une erreur, on ne la retient pas contre lui | | |
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
| Jour 1 | Formation à la sécurité (L4141-2) avant toute tâche exposée, complétée au poste en semaine 1 ; trace écrite signée | Manager / référent sécurité | |
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
| Mois 3 à 12 | Entretien de parcours professionnel au cours de la première année suivant l''embauche (L6315-1) | Manager / RH | |

Cas particuliers : apprenti (lien CFA, maître d''apprentissage) ; intérimaire ou CDD court (sécurité, règles, parrain, point jour 1) ; aménagement de poste (mis en place avant l''arrivée, sans divulguer le motif) ; retour après longue absence (ce qui a changé, montée en charge, entretien de parcours).

---

## GABARIT 3 — Diagnostic de sécurité psychologique de mon équipe

À remplir seul et honnêtement, puis, si possible, à proposer à l''équipe de façon anonyme (les sept premières questions sont adaptées de l''échelle de sécurité psychologique d''Edmondson, 1999, reformulées à l''affirmative). Réponses de 1 (pas du tout d''accord) à 5 (tout à fait d''accord).

| Question | Ma réponse (1-5) | Réponse moyenne de l''équipe (si sondage) |
|---|---|---|
| Dans cette équipe, si quelqu''un fait une erreur, on ne la retient pas contre lui | | |
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
      then jsonb_build_object('texte', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Module 5 — Gérer les tensions et les conflits

Bienvenue dans le module 5. Nous allons parler de ce que la plupart des managers redoutent le plus : les tensions et les conflits dans l''équipe. Deux personnes qui ne se parlent plus. Un salarié qui conteste chaque consigne. Une équipe coupée en deux clans. Un client qui s''en prend à un salarié.

Commençons par une idée qui va peut-être vous surprendre : le conflit n''est pas le problème. Le problème, c''est ce qu''on en fait.

## Conflit de tâche, conflit de relation

Il y a deux sortes de conflits, et il est essentiel de les distinguer, parce qu''ils ne se traitent pas de la même façon.

Le conflit de tâche, c''est un désaccord sur le travail. Sur la méthode, sur la priorité, sur la décision à prendre. Thierry pense qu''il faut redresser avant de commander la pièce ; Karim pense l''inverse. C''est un conflit de tâche. Et les recherches, notamment celles de Karen Jehn dans les années 1990, montrent qu''un conflit de tâche, s''il reste sur le terrain du travail, peut être utile. Il fait émerger les désaccords, il évite les décisions prises sans examen, il améliore les solutions. Une équipe sans aucun conflit de tâche est une équipe où l''on ne dit plus rien. Vous avez vu au module 4 ce que cela produit.

Le conflit de relation, c''est autre chose. Ce n''est plus la méthode qui est en cause, c''est la personne. « De toute façon, avec lui, on ne peut pas discuter. » « Elle fait exprès. » Ressentiment, mépris, rivalité, clans. Le conflit de relation est toujours coûteux : il consomme de l''énergie, il détériore la communication, il fait baisser la qualité du travail et il chasse les gens.

Le drame, c''est que le premier se transforme en second si on ne s''en occupe pas. Un désaccord de méthode non traité devient, en quelques semaines, une affaire de personnes. Le rôle du manager est de garder les conflits sur le terrain de la tâche, et de traiter vite ceux qui glissent vers la relation.

## L''escalade : les neuf marches de Glasl

Friedrich Glasl, chercheur autrichien spécialiste des conflits, a décrit en 1980 comment un conflit s''aggrave. Il a identifié neuf niveaux, qu''on regroupe en trois phases.

Première phase, niveaux 1 à 3 : on peut encore se parler. Les positions se durcissent, les débats deviennent des polémiques, puis on cesse de discuter et on met l''autre devant le fait accompli. Mais chacun pense encore qu''une solution où les deux y gagnent est possible. C''est ici que le manager doit intervenir. C''est ici que c''est facile.

Deuxième phase, niveaux 4 à 6 : on ne cherche plus à résoudre, on cherche à gagner. On recrute des alliés, on attaque la réputation de l''autre, on lui fait perdre la face, on menace. Chacun pense : « l''un de nous deux doit perdre. » Le manager seul n''y suffit plus ; il faut une méthode formelle, souvent un tiers.

Troisième phase, niveaux 7 à 9 : on cherche à nuire, même à ses propres dépens. Sabotage, destruction, « ensemble dans l''abîme ». À ce stade, ce n''est plus de la gestion de conflit ; c''est une procédure disciplinaire, une séparation, parfois un dossier juridique.

Ce que Glasl nous apprend : un conflit ne reste jamais au même niveau. Il descend, marche par marche, tant que personne ne l''arrête. Et plus on attend, plus il est coûteux de remonter.

## Le coût de l''évitement

Pourquoi les managers attendent-ils ? Par peur d''aggraver, par manque de temps, par espoir que ça passe, par crainte de devoir trancher. L''évitement est la réponse la plus fréquente au conflit, et la plus chère.

Un conflit évité ne disparaît pas. Il s''installe. Il coûte du temps de travail perdu en discussions de couloir, en énergie, en absences. Il coûte de la qualité : deux personnes qui ne se parlent plus ne se transmettent plus l''information, et l''erreur arrive. Il coûte des gens : celui qui se sent seul face à l''autre finit par partir, et c''est rarement le moins bon. Et il coûte l''autorité du manager : une équipe qui voit un conflit durer sans que le chef intervienne conclut que le chef ne protège personne.

**Un conflit traité au niveau 2 coûte une heure. Au niveau 5, il coûte des semaines. Au niveau 8, il coûte une personne.**

## Ce que ce module vous apprend

Ce module vous donne d''abord de quoi comprendre ce qui se joue dans un conflit : ses sources, le piège du triangle dramatique, vos propres biais. Puis de quoi prévenir : un cadre, des règles du jeu, et l''attention aux signaux faibles. Puis une méthode pour résoudre, en cinq étapes, avec la communication non violente et le recours à la médiation. Vous verrez une mise en situation complète en vidéo. Et enfin, les situations difficiles : recadrer, sanctionner, alerter, avec ce que le manager fait et ne fait pas, et ce que dit la loi.

## À l''atelier Garnier

À l''atelier Garnier, deux tensions couvent. Sophie et Marc ne se parlent plus depuis l''affaire du planning de la Clio : Marc estime que Sophie « balance les urgences sans prévenir », Sophie estime que Marc « fait la tête au lieu de bosser ». Et Thierry, qui a mal vécu l''arrivée d''Amine, laisse entendre à Julien que « le nouveau ne sait pas ce que c''est, un vrai atelier ». Deux conflits, niveau 2 ou 3. Karim a quelques semaines pour agir avant qu''ils ne descendent.

Le conflit n''est pas le problème. L''attente, oui.

À tout de suite pour comprendre ce qui se joue.

## Sources
Karen A. Jehn, « A Multimethod Examination of the Benefits and Detriments of Intragroup Conflict », *Administrative Science Quarterly*, 1995 ; Frank R. C. de Wit, Lindred L. Greer, Karen A. Jehn, « The Paradox of Intragroup Conflict: A Meta-Analysis », *Journal of Applied Psychology*, 2012 ; Friedrich Glasl, *Konfliktmanagement*, 1980 (11e éd. 2013) ; Kenneth Thomas, Ralph Kilmann, *Thomas-Kilmann Conflict Mode Instrument*, 1974 (sur l''évitement).
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Module 5 — Gérer les tensions et les conflits

Bienvenue dans le module 5. Nous allons parler de ce que la plupart des managers redoutent le plus : les tensions et les conflits dans l''équipe. Deux personnes qui ne se parlent plus. Un salarié qui conteste chaque consigne. Une équipe coupée en deux clans. Un client qui s''en prend à un salarié.

Commençons par une idée qui va peut-être vous surprendre : le conflit n''est pas le problème. Le problème, c''est ce qu''on en fait.

## Conflit de tâche, conflit de relation

Il y a deux sortes de conflits, et il est essentiel de les distinguer, parce qu''ils ne se traitent pas de la même façon.

Le conflit de tâche, c''est un désaccord sur le travail. Sur la méthode, sur la priorité, sur la décision à prendre. Thierry pense qu''il faut redresser avant de commander la pièce ; Karim pense l''inverse. C''est un conflit de tâche. Et les recherches, notamment celles de Karen Jehn dans les années 1990, montrent qu''un conflit de tâche, s''il reste sur le terrain du travail, peut être utile. Il fait émerger les désaccords, il évite les décisions prises sans examen, il améliore les solutions. Une équipe sans aucun conflit de tâche est une équipe où l''on ne dit plus rien. Vous avez vu au module 4 ce que cela produit.

Le conflit de relation, c''est autre chose. Ce n''est plus la méthode qui est en cause, c''est la personne. « De toute façon, avec lui, on ne peut pas discuter. » « Elle fait exprès. » Ressentiment, mépris, rivalité, clans. Le conflit de relation est toujours coûteux : il consomme de l''énergie, il détériore la communication, il fait baisser la qualité du travail et il chasse les gens.

Le drame, c''est que le premier se transforme en second si on ne s''en occupe pas. Un désaccord de méthode non traité devient, en quelques semaines, une affaire de personnes. Le rôle du manager est de garder les conflits sur le terrain de la tâche, et de traiter vite ceux qui glissent vers la relation.

## L''escalade : les neuf marches de Glasl

Friedrich Glasl, chercheur autrichien spécialiste des conflits, a décrit en 1980 comment un conflit s''aggrave. Il a identifié neuf niveaux, qu''on regroupe en trois phases.

Première phase, niveaux 1 à 3 : on peut encore se parler. Les positions se durcissent, les débats deviennent des polémiques, puis on cesse de discuter et on met l''autre devant le fait accompli. Mais chacun pense encore qu''une solution où les deux y gagnent est possible. C''est ici que le manager doit intervenir. C''est ici que c''est facile.

Deuxième phase, niveaux 4 à 6 : on ne cherche plus à résoudre, on cherche à gagner. On recrute des alliés, on attaque la réputation de l''autre, on lui fait perdre la face, on menace. Chacun pense : « l''un de nous deux doit perdre. » Le manager seul n''y suffit plus ; il faut une méthode formelle, souvent un tiers.

Troisième phase, niveaux 7 à 9 : on cherche à nuire, même à ses propres dépens. Sabotage, destruction, « ensemble dans l''abîme ». À ce stade, ce n''est plus de la gestion de conflit ; c''est une procédure disciplinaire, une séparation, parfois un dossier juridique.

Ce que Glasl nous apprend : un conflit ne reste jamais au même niveau. Il descend, marche par marche, tant que personne ne l''arrête. Et plus on attend, plus il est coûteux de remonter.

## Le coût de l''évitement

Pourquoi les managers attendent-ils ? Par peur d''aggraver, par manque de temps, par espoir que ça passe, par crainte de devoir trancher. L''évitement est la réponse la plus fréquente au conflit, et la plus chère.

Un conflit évité ne disparaît pas. Il s''installe. Il coûte du temps de travail perdu en discussions de couloir, en énergie, en absences. Il coûte de la qualité : deux personnes qui ne se parlent plus ne se transmettent plus l''information, et l''erreur arrive. Il coûte des gens : celui qui se sent seul face à l''autre finit par partir, et c''est rarement le moins bon. Et il coûte l''autorité du manager : une équipe qui voit un conflit durer sans que le chef intervienne conclut que le chef ne protège personne.

**Un conflit traité au niveau 2 coûte une heure. Au niveau 5, il coûte des semaines. Au niveau 8, il coûte une personne.**

## Ce que ce module vous apprend

Ce module vous donne d''abord de quoi comprendre ce qui se joue dans un conflit : ses sources, le piège du triangle dramatique, vos propres biais. Puis de quoi prévenir : un cadre, des règles du jeu, et l''attention aux signaux faibles. Puis une méthode pour résoudre, en cinq étapes, avec la communication non violente et le recours à la médiation. Vous verrez une mise en situation complète en vidéo. Et enfin, les situations difficiles : recadrer, sanctionner, alerter, avec ce que le manager fait et ne fait pas, et ce que dit la loi.

## À l''atelier Garnier

À l''atelier Garnier, deux tensions couvent. Sophie et Marc ne se parlent plus depuis l''affaire du planning de la Clio : Marc estime que Sophie « balance les urgences sans prévenir », Sophie estime que Marc « fait la tête au lieu de bosser ». Et Thierry, qui a mal vécu l''arrivée d''Amine, laisse entendre à Julien que « le nouveau ne sait pas ce que c''est, un vrai atelier ». Deux conflits, niveau 2 ou 3. Karim a quelques semaines pour agir avant qu''ils ne descendent.

Le conflit n''est pas le problème. L''attente, oui.

À tout de suite pour comprendre ce qui se joue.

## Sources
Karen A. Jehn, « A Multimethod Examination of the Benefits and Detriments of Intragroup Conflict », *Administrative Science Quarterly*, 1995 ; Frank R. C. de Wit, Lindred L. Greer, Karen A. Jehn, « The Paradox of Intragroup Conflict: A Meta-Analysis », *Journal of Applied Psychology*, 2012 ; Friedrich Glasl, *Konfliktmanagement*, 1980 (11e éd. 2013) ; Kenneth Thomas, Ralph Kilmann, *Thomas-Kilmann Conflict Mode Instrument*, 1974 (sur l''évitement).
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 6 and l.ordre = 1;
  n := n + 1;

  -- 5.10-quiz.json
  update public.lecons l set contenu = '{"questions": [{"id": "m5q01", "enonce": "Thierry et Karim ne sont pas d''accord sur l''ordre des opérations (redresser avant ou après la commande de pièce). De quel type de conflit s''agit-il, et que faut-il en penser ?", "options": ["Un conflit de relation, à faire cesser immédiatement avant qu''il ne s''envenime", "Une insubordination de Thierry, à recadrer puisque Karim est le chef", "Un conflit de tâche, qui peut être utile tant qu''il reste sur le travail", "Un signe que Thierry et Karim ne peuvent plus travailler ensemble"], "bonnes": [2], "explication": "C''est un désaccord sur le travail (conflit de tâche). Il peut être utile, à condition de ne pas glisser vers l''attaque des personnes (conflit de relation) ; les méta-analyses montrent qu''il n''est pas bénéfique en soi. Le rôle du manager est de le garder sur le terrain du travail."}, {"id": "m5q02", "enonce": "Dans l''escalier de Glasl, que caractérise la deuxième phase (niveaux 4 à 6) ?", "options": ["On ne cherche plus à résoudre mais à gagner : alliances, atteinte à la réputation, menaces", "On peut encore se parler et chercher ensemble une solution où les deux parties trouvent leur compte", "On cherche à nuire à l''autre, même au prix de ses propres pertes", "Le conflit s''éteint de lui-même faute d''énergie de part et d''autre"], "bonnes": [0], "explication": "Phase 1 (niveaux 1 à 3) : on peut encore se parler, c''est là que le manager intervient le plus facilement. Phase 2 (4 à 6) : chacun pense que l''un des deux doit perdre ; il faut une méthode formelle, souvent un tiers. Phase 3 (7 à 9) : on cherche à nuire, même à ses dépens."}, {"id": "m5q03", "enonce": "Devant une tension entre deux personnes, dans quel ordre le manager cherche-t-il la source ?", "options": ["Les personnes d''abord (caractères, historique, affinités), puis l''organisation si nécessaire", "Uniquement les personnes : un conflit est d''abord une affaire de caractère", "Il ne cherche pas la source : il tranche rapidement pour que le travail reprenne", "Les rôles et les ressources, puis les manières de faire, et les personnes en dernier"], "bonnes": [3], "explication": "La cause est souvent dans l''organisation (rôles flous, ressources rares). Traiter les personnes sans traiter la cause, c''est repartir pour un tour."}, {"id": "m5q04", "enonce": "Marc vient se plaindre de Sophie à Karim. Karim décide d''aller « régler ça » avec Sophie à la place de Marc. Dans le triangle de Karpman, quel rôle Karim vient-il de prendre, et quel est le risque ?", "options": ["Le persécuteur : il s''apprête à reprocher à Sophie son comportement", "Le sauveur : Marc reste passif, Sophie devient la persécutrice, Karim le sera bientôt", "La victime : il subit un conflit qui ne le concerne pas directement", "Aucun rôle : prendre en charge la plainte d''un salarié et la régler soi-même est la bonne conduite"], "bonnes": [1], "explication": "En réglant le problème à la place de Marc, Karim prend le rôle de sauveur. Sortir du triangle, c''est refuser les trois rôles et ramener chacun à sa responsabilité : « qu''est-ce que tu as dit à Sophie ? »"}, {"id": "m5q05", "enonce": "Plusieurs réponses. Quels sont des signaux faibles d''un conflit naissant ?", "options": ["Deux personnes qui ne se parlent plus que par un tiers ou par écrit", "Le passage du fait au trait de caractère (« elle ne prévient jamais »)", "Un désaccord exprimé ouvertement en réunion sur une méthode de travail", "Des alliances : les mêmes appuient toujours les mêmes"], "bonnes": [0, 1, 3], "explication": "Un désaccord exprimé ouvertement sur le travail est sain. La communication indirecte, les « toujours / jamais » et les alliances sont les signes d''un conflit qui glisse vers la relation."}, {"id": "m5q06", "enonce": "Quelle est la règle que le manager impose si l''équipe ne la propose pas lors de la construction des règles du jeu ?", "options": ["L''interdiction de tout désaccord exprimé devant l''équipe", "La priorité donnée à l''avis des plus anciens en cas de désaccord", "Le respect des personnes : on parle du travail, on n''attaque pas les gens", "L''obligation de passer par le manager pour tout échange de travail entre collègues"], "bonnes": [2], "explication": "« On peut tout se dire sur le travail ; on ne s''attaque pas aux personnes, et pas devant les autres. » C''est la ligne que le manager défend sans négociation ; les autres règles (cinq à huit, positives, vérifiables) sont construites avec l''équipe."}, {"id": "m5q07", "enonce": "Dans la méthode en cinq étapes, pourquoi écoute-t-on chaque partie séparément avant de les réunir ?", "options": ["Pour que chacun parle sans rejouer le conflit, et pour repérer les besoins", "Pour pouvoir comparer les versions et retenir la plus crédible des deux", "Pour gagner du temps en évitant une réunion à trois qui risque de s''éterniser", "Parce que le Code du travail impose des entretiens séparés avant toute réunion à trois en cas de conflit"], "bonnes": [0], "explication": "Réunir tout de suite, c''est faire rejouer le conflit devant le chef. Les positions s''opposent ; les besoins qui sont derrière (pouvoir s''organiser, être reconnu) sont souvent compatibles."}, {"id": "m5q08", "enonce": "Quels sont les quatre temps de la communication non violente (Rosenberg) ?", "options": ["Situation, comportement, impact, puis attente formulée par le manager", "Écouter, reformuler, trancher, puis notifier la décision par écrit", "Faits, opinions, sentiments, puis solution proposée par chacun", "Observation sans jugement, sentiment, besoin, demande concrète"], "bonnes": [3], "explication": "« Mardi j''ai appris à 14 h… / j''étais en colère / j''ai besoin de pouvoir organiser ma journée / est-ce que tu peux… » : une façon de dire ce qui ne va pas sans attaquer, avec une demande à laquelle l''autre peut répondre. Situation-comportement-impact, c''est le SBI du feedback (module 3)."}, {"id": "m5q09", "enonce": "Quand le manager doit-il passer la main à un tiers neutre (RH, médiateur) ?", "options": ["Jamais : un manager qui passe la main reconnaît qu''il n''est pas à sa place", "Au-delà du niveau 4, s''il est trop impliqué, ou si la méthode a échoué", "Dès la première pique en réunion, pour ne pas laisser la situation s''installer", "Uniquement si l''un des salariés en fait la demande écrite auprès des RH"], "bonnes": [1], "explication": "Passer la main n''est pas un échec : un conflit installé demande d''autres moyens que ceux du manager, et le tiers neutre protège le manager comme les personnes."}, {"id": "m5q10", "enonce": "Quelle est la différence entre un recadrage et une sanction disciplinaire ?", "options": ["Aucune : ce sont deux mots pour désigner la même mesure", "La sanction peut être décidée par le manager de proximité seul, sans procédure particulière à respecter", "Le recadrage relève du manager ; la sanction relève de l''employeur et d''une procédure", "Le recadrage est réservé aux cadres, la sanction aux autres salariés"], "bonnes": [2], "explication": "Le manager recadre et garde une trace interne ; l''employeur sanctionne, avec une procédure (L1332-1 et s.), dans le délai de deux mois et, s''il existe, dans le cadre du règlement intérieur. Attention : un écrit de reproches remis au salarié peut valoir avertissement."}, {"id": "m5q11", "enonce": "Un salarié refuse d''exécuter une consigne. Dans quel cas ce refus n''est-il pas une faute ?", "options": ["Quand la consigne est illégale, dangereuse ou modifie le contrat sans accord", "Quand le salarié n''est pas d''accord avec la méthode demandée et qu''il l''a dit clairement en réunion", "Quand le salarié a plus d''ancienneté que le manager qui donne la consigne", "Jamais : tout refus d''exécuter une consigne est une faute"], "bonnes": [0], "explication": "Face à un refus, le manager demande d''abord la raison. Si c''est un danger (droit de retrait, L4131-1) ou une illégalité, c''est à lui de traiter le problème ; sinon, il recadre et remonte. Un simple changement des conditions de travail relève, lui, du pouvoir de direction."}, {"id": "m5q12", "enonce": "Nadia signale à Karim qu''un client lui fait des remarques sur son physique et l''a touchée avec insistance. Que fait Karim ?", "options": ["Il lui dit que c''est sûrement un malentendu et lui conseille de relativiser", "Il organise lui-même une confrontation entre Nadia et le client pour établir les faits", "Il prévient toute l''équipe pour que chacun reste vigilant lors des passages de ce client à l''atelier", "Il note les faits, alerte l''employeur sans délai, protège Nadia et l''oriente vers les relais"], "bonnes": [3], "explication": "L''employeur doit prévenir le harcèlement sexuel, y mettre un terme et le sanctionner (L1153-5), y compris quand l''auteur est un client ; le manager déclenche cette obligation en l''informant sans délai. Il n''enquête pas lui-même et garde la confidentialité. La personne qui parle de bonne foi est protégée."}, {"id": "m5q13", "enonce": "Que devient un conflit de tâche (désaccord sur la méthode) qu''on laisse sans réponse pendant des semaines ?", "options": ["Il disparaît de lui-même avec le temps, une fois que la décision est prise et appliquée par tous", "Il reste un désaccord technique sans conséquence", "Il glisse vers un conflit de relation : c''est la personne qui est visée", "Il se règle quand l''un des deux finit par céder"], "bonnes": [2], "explication": "Un désaccord de méthode non traité devient vite une affaire de personnes. Le rôle du manager est de garder les conflits sur le terrain de la tâche et de traiter vite ceux qui glissent vers la relation."}, {"id": "m5q14", "enonce": "Deux peintres se disputent régulièrement le créneau de cabine du matin. Quelle est la source la plus probable, et quel remède ?", "options": ["Une ressource rare sans règle de partage : fixer une règle connue", "Un conflit de personnes : les affecter à des horaires différents pour qu''ils ne se croisent plus", "Un conflit de valeurs : donner la priorité au plus ancien", "Une insubordination : rappeler à l''ordre les deux peintres"], "bonnes": [0], "explication": "La rareté crée la rivalité. Un manager qui distribue les ressources sans règle fabrique des conflits ; une règle connue de tous les prévient."}, {"id": "m5q15", "enonce": "Qu''est-ce que le biais de la première version ?", "options": ["Accorder plus de crédit à la version écrite d''un incident qu''à la version racontée oralement", "Donner raison, par habitude, à celui qui a le plus d''ancienneté", "Retenir surtout la dernière chose entendue avant de décider", "Laisser le récit de celui qui se plaint en premier orienter son jugement"], "bonnes": [3], "explication": "Celui qui vient le premier structure la façon dont le manager voit la situation. Remède : ne jamais conclure avant d''avoir entendu l''autre partie, séparément."}, {"id": "m5q16", "enonce": "Un incident vient d''éclater entre deux membres de l''équipe, à chaud. Que fait le manager ?", "options": ["Il les réunit immédiatement dans son bureau pour régler l''affaire à chaud, tant que les faits sont frais", "Il les sépare, reconnaît l''émotion et fixe un moment pour reprendre au calme", "Il leur dit de se calmer et demande à chacun de retourner travailler", "Il tranche sur place en faveur de celui qui est resté le plus calme"], "bonnes": [1], "explication": "« Calme-toi » ne calme personne. Un entretien de résolution ne se tient pas à chaud : on sépare, on laisse passer quelques heures ou une nuit, puis on reprend, chacun d''abord séparément."}, {"id": "m5q17", "enonce": "Dans le podcast « Le conflit que j''ai laissé pourrir », Patrice passait son temps à transmettre les informations entre ses deux chefs de rayon. Que faisait-il en réalité ?", "options": ["Il gérait le conflit en évitant qu''il ne pèse sur les clients", "Il appliquait sans le savoir la méthode en cinq étapes", "Il entretenait le conflit tout en croyant le maîtriser", "Il jouait le rôle de médiateur neutre entre les deux"], "bonnes": [2], "explication": "Quand le manager fait l''intermédiaire à la place des gens, le conflit s''installe. Le signal d''alarme de Patrice : « Dis à Untel que… »."}, {"id": "m5q18", "enonce": "Marc réclame : « je veux qu''elle arrête de me donner des urgences ». Dans l''esprit de Fisher et Ury, que cherche le manager derrière cette position ?", "options": ["L''intérêt ou le besoin : pouvoir organiser sa journée", "Lequel des deux a raison sur le fond du désaccord", "Un compromis où chacun renonce à la moitié de sa demande", "Les éléments qui justifieraient une sanction proportionnée"], "bonnes": [0], "explication": "Deux positions s''excluent ; les intérêts qui sont derrière sont souvent compatibles, au moins en partie. C''est sur eux qu''on trouve des options."}, {"id": "m5q19", "enonce": "Pour une sanction autre que le licenciement ayant une incidence sur la présence, la fonction ou la rémunération (mise à pied disciplinaire, mutation), que prévoit l''article L1332-2 ?", "options": ["Une simple lettre recommandée, sans entretien, envoyée au salarié dans les deux mois qui suivent les faits reprochés", "Un entretien informel avec le manager de proximité, sans écrit", "Une notification orale, suivie d''une confirmation écrite sous huit jours", "Un entretien préalable, puis une notification motivée entre deux jours ouvrables et un mois après l''entretien"], "bonnes": [3], "explication": "Convocation écrite précisant l''objet, entretien où le salarié peut être assisté par une personne du personnel, notification motivée au plus tôt deux jours ouvrables et au plus tard un mois après le jour fixé pour l''entretien. Les poursuites doivent être engagées dans les deux mois suivant la connaissance des faits (L1332-4). Le licenciement suit en plus ses propres règles."}, {"id": "m5q20", "enonce": "Un salarié se présente manifestement sous l''emprise de l''alcool à un poste dangereux. Que fait le manager ?", "options": ["Il le laisse finir sa journée en le surveillant de près", "Il le retire du poste, le fait raccompagner et informe l''employeur", "Il lui fait un feedback le lendemain, quand il aura retrouvé ses esprits, et note l''incident", "Il appelle le médecin traitant du salarié pour lui demander conseil"], "bonnes": [1], "explication": "L''obligation de sécurité prime : retrait immédiat du poste, pas de conduite, le 15 si l''état inquiète. La procédure du règlement intérieur, s''il en existe un, s''applique ensuite ; une éventuelle souffrance et une éventuelle faute se traitent séparément."}], "seuil": 70, "tentatives_max": 3, "corrections": true, "consigne": "20 questions. Une seule bonne réponse par question, sauf mention « plusieurs réponses ». Seuil de réussite : 70 %."}'::jsonb, publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 6 and l.ordre = 10;
  n := n + 1;

  -- 5.2-comprendre-ce-qui-se-joue.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Avant de résoudre un conflit, il faut comprendre d''où il vient. Beaucoup de managers se trompent de cause : ils voient deux personnes qui s''affrontent et concluent à un problème de caractère. Or, bien souvent, la cause est dans l''organisation, et les personnes ne font que la révéler. Traiter les personnes sans traiter la cause, c''est repartir pour un tour.

Une précision sur ce que la vidéo d''entrée a présenté. Le désaccord sur le travail (conflit de tâche) n''est pas bon en soi. Les deux grandes méta-analyses sur le sujet, qui compilent des dizaines d''études, trouvent un effet moyen négatif sur la performance (De Dreu et Weingart, 2003) puis globalement nul (de Wit, Greer et Jehn, 2012) ; il devient utile dans certaines conditions seulement, en particulier quand il ne se double pas d''un conflit de relation. Le conflit de relation, lui, pèse presque toujours sur la performance et sur la satisfaction. Pour le manager, la conséquence pratique est la même : laisser les gens être en désaccord sur le travail, et intervenir dès que le désaccord vise la personne.

## Les quatre sources de conflit

Les classifications varient d''un auteur à l''autre. Pour un manager de proximité, quatre familles de sources suffisent, et elles se combinent souvent.

Les rôles flous. Quand on ne sait pas qui décide, qui fait, qui est responsable, chacun le décide pour lui-même, et deux personnes se retrouvent à vouloir décider la même chose, ou à attendre que l''autre fasse. Sur le terrain, c''est une source très fréquente, et peu visible : le conflit entre Sophie et Marc est d''abord un conflit de rôle (qui décide qu''une urgence tombée dans la journée passe devant le travail prévu en mécanique ?), avant d''être une affaire de personnes. Le RACI du module 2 est l''outil de prévention.

Les ressources rares. Deux personnes ont besoin du même outil, du même créneau de cabine, du même budget, de la même attention du chef. La rareté crée la rivalité. Le manager qui distribue les ressources sans règle connue fabrique des conflits.

Les valeurs et les manières de faire. « Un vrai carrossier redresse, il ne remplace pas. » « Le client attend, on ne fait pas dans la dentelle. » Des conceptions différentes du bon travail, souvent liées à la génération, à la formation, à l''expérience. Ces conflits sont profonds parce que chacun a le sentiment de défendre quelque chose de juste. Le manager ne tranche pas entre des valeurs ; il fixe la règle de l''atelier (« ici, on fait comme ça, et voilà pourquoi ») et il fait respecter les personnes.

Les personnes. Il arrive que deux personnes ne s''entendent pas, sans autre cause. Histoire ancienne, incompatibilité, jalousie. C''est plus rare qu''on ne le croit, et c''est souvent le résidu d''un conflit de rôle ou de ressource non traité. Le manager n''a pas à faire s''aimer les gens ; il a à faire respecter des règles de comportement qui permettent de travailler ensemble.

Le réflexe utile : devant toute tension, chercher d''abord la source dans l''organisation (rôles, ressources), puis dans les manières de faire, et seulement en dernier dans les personnes.

## Le triangle dramatique

Stephen Karpman, psychiatre américain formé à l''analyse transactionnelle, a décrit en 1968 un schéma qu''on retrouve dans beaucoup de conflits : le triangle dramatique, avec trois rôles. C''est un outil de lecture, issu de la pratique clinique, pas un résultat de recherche mesuré : il aide à voir le jeu dans lequel on est pris, il ne prouve rien sur les personnes.

La victime : « ce n''est pas ma faute, on m''en veut, je ne peux rien faire ». Le persécuteur : « c''est de ta faute, tu es nul, tu fais exprès ». Le sauveur : « laisse, je vais m''en occuper, je vais te défendre ».

Trois pièges pour le manager. Le premier : se laisser mettre en position de sauveur. Marc vient se plaindre de Sophie ; Karim, pour bien faire, va « régler ça » avec Sophie, à la place de Marc. Résultat : Sophie devient la persécutrice, Marc reste la victime (il n''a rien eu à faire), et Karim, sauveur, sera le prochain persécuteur dès qu''il ne donnera pas raison à Marc. Le triangle tourne ; personne ne sort.

Le deuxième piège : devenir persécuteur soi-même, en tranchant sur la base d''une seule version. Le troisième : se vivre en victime (« je ne peux rien faire, c''est Michel qui décide, ils sont impossibles ») et ne plus agir.

Sortir du triangle, c''est refuser les trois rôles : ne pas sauver (aider la personne à agir elle-même : « qu''est-ce que tu as dit à Sophie ? »), ne pas persécuter (les faits, pas les jugements), ne pas se plaindre (agir sur ce qui dépend de soi). Et ramener chacun à une position d''adulte responsable : « Vous avez tous les deux un problème de fonctionnement ; on va le régler ensemble. »

## Les biais du manager en situation de conflit

Vous avez vu au module 3 les biais d''interprétation. En situation de conflit, ils sont décuplés, parce que l''émotion est là.

- Le biais de la première version : celui qui vient se plaindre le premier a un avantage, parce que son récit structure la façon dont le manager voit la situation. Remède : ne jamais conclure avant d''avoir entendu l''autre.
- Le biais d''affinité : on donne raison à celui qu''on apprécie, ou qui nous ressemble. Karim, qui a passé huit ans à l''atelier, comprend spontanément les gens de l''atelier mieux que Sophie. Remède : se demander « si c''était l''inverse, que penserais-je ? »
- L''attribution : on explique le comportement de l''autre par sa personnalité (« Marc est susceptible ») et non par la situation (« Marc a découvert trois urgences non prévues cette semaine »). Remède : chercher la situation d''abord.
- La recherche du coupable : le manager veut savoir qui a tort. Or dans la plupart des conflits, les deux ont contribué, et la question utile n''est pas « qui a tort » mais « qu''est-ce qui doit changer ». Remède : remplacer « qui » par « quoi ».
- L''évitement déguisé : « ce n''est pas si grave », « ils sont adultes », « ça va se tasser ». Remède : relire l''escalier de Glasl.
- Le passage en force : trancher vite pour en finir. Une décision imposée sans écoute règle le symptôme et alimente le ressentiment. Remède : la méthode de la leçon 5.4.

## Les émotions dans le conflit

Un conflit n''est jamais seulement rationnel. La colère, la peur, l''humiliation, le sentiment d''injustice sont là, et ils expliquent que des gens raisonnables disent des choses déraisonnables. Le manager ne les nie pas (« calme-toi » n''a jamais calmé personne) ; il les reconnaît (« je vois que ça te met en colère »), et il attend qu''elles retombent avant de traiter le fond. Un entretien de résolution ne se tient pas à chaud. On sépare, on laisse passer quelques heures ou une nuit, et on reprend.

Le manager a aussi ses émotions : l''agacement, la peur de mal faire, parfois la colère. Les reconnaître pour soi-même (« je suis énervé, je ne vais pas décider maintenant ») évite de les faire payer à l''équipe.

## Le cas Garnier — comprendre avant d''agir

Le conflit Sophie-Marc. Source : un rôle flou. Le RACI du module 2 règle le planning du lendemain (Karim le valide à 17 h après avoir consulté Marc et Sophie) et les demandes clients transmises avant midi ; il ne dit rien des urgences qui tombent l''après-midi. Sophie, qui les reçoit au téléphone, les passe alors directement à Marc, faute de savoir à qui d''autre. Escalade : niveau 3 (ils ne se parlent plus, communiquent par post-it). Triangle : Marc est venu se plaindre à Karim (victime), désignant Sophie (persécutrice) ; Karim a failli aller « régler ça » (sauveur). Biais : Karim, ancien de l''atelier, comprend Marc mieux que Sophie ; il a entendu Marc en premier. Ce que Karim comprend : la cause est organisationnelle, les deux ont contribué (Sophie n''a pas prévenu, Marc a boudé au lieu de le dire), et la solution passera par une règle, pas par un arbitrage entre personnes.

Le conflit Thierry-Amine. Source : des valeurs (la conception du métier) et une ressource (la place de référent, que Thierry sent menacée). Escalade : niveau 2 (polémique, piques devant les autres), avec un début de recrutement d''allié (Julien). Ce que Karim comprend : ce n''est pas Amine le sujet, c''est la reconnaissance de Thierry, déjà repérée au module 4. Traiter Amine serait traiter le symptôme.

## À retenir

- Chercher la source dans l''ordre : rôles flous, ressources rares, valeurs et manières de faire, personnes. La cause est le plus souvent dans l''organisation.
- Le triangle dramatique (Karpman) : victime, persécuteur, sauveur. Le manager n''entre dans aucun des trois rôles et ramène chacun à sa responsabilité.
- Biais du manager : première version, affinité, attribution, recherche du coupable, évitement déguisé, passage en force. Remplacer « qui a tort » par « qu''est-ce qui doit changer ».
- Les émotions se reconnaissent, ne se nient pas ; on ne résout pas à chaud.

## Sources

- Stephen B. Karpman, « Fairy Tales and Script Drama Analysis », *Transactional Analysis Bulletin*, vol. 7, n° 26, 1968.
- Karen A. Jehn, Elizabeth A. Mannix, « The Dynamic Nature of Conflict », *Academy of Management Journal*, 2001.
- Daniel Kahneman, *Système 1 / Système 2*, Flammarion, 2012.
- Carsten K. W. De Dreu, Laurie R. Weingart, « Task Versus Relationship Conflict, Team Performance, and Team Member Satisfaction: A Meta-Analysis », *Journal of Applied Psychology*, 2003.
- Frank R. C. de Wit, Lindred L. Greer, Karen A. Jehn, « The Paradox of Intragroup Conflict: A Meta-Analysis », *Journal of Applied Psychology*, 2012.
- France Compétences, référentiel RS7377, compétence 8.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Avant de résoudre un conflit, il faut comprendre d''où il vient. Beaucoup de managers se trompent de cause : ils voient deux personnes qui s''affrontent et concluent à un problème de caractère. Or, bien souvent, la cause est dans l''organisation, et les personnes ne font que la révéler. Traiter les personnes sans traiter la cause, c''est repartir pour un tour.

Une précision sur ce que la vidéo d''entrée a présenté. Le désaccord sur le travail (conflit de tâche) n''est pas bon en soi. Les deux grandes méta-analyses sur le sujet, qui compilent des dizaines d''études, trouvent un effet moyen négatif sur la performance (De Dreu et Weingart, 2003) puis globalement nul (de Wit, Greer et Jehn, 2012) ; il devient utile dans certaines conditions seulement, en particulier quand il ne se double pas d''un conflit de relation. Le conflit de relation, lui, pèse presque toujours sur la performance et sur la satisfaction. Pour le manager, la conséquence pratique est la même : laisser les gens être en désaccord sur le travail, et intervenir dès que le désaccord vise la personne.

## Les quatre sources de conflit

Les classifications varient d''un auteur à l''autre. Pour un manager de proximité, quatre familles de sources suffisent, et elles se combinent souvent.

Les rôles flous. Quand on ne sait pas qui décide, qui fait, qui est responsable, chacun le décide pour lui-même, et deux personnes se retrouvent à vouloir décider la même chose, ou à attendre que l''autre fasse. Sur le terrain, c''est une source très fréquente, et peu visible : le conflit entre Sophie et Marc est d''abord un conflit de rôle (qui décide qu''une urgence tombée dans la journée passe devant le travail prévu en mécanique ?), avant d''être une affaire de personnes. Le RACI du module 2 est l''outil de prévention.

Les ressources rares. Deux personnes ont besoin du même outil, du même créneau de cabine, du même budget, de la même attention du chef. La rareté crée la rivalité. Le manager qui distribue les ressources sans règle connue fabrique des conflits.

Les valeurs et les manières de faire. « Un vrai carrossier redresse, il ne remplace pas. » « Le client attend, on ne fait pas dans la dentelle. » Des conceptions différentes du bon travail, souvent liées à la génération, à la formation, à l''expérience. Ces conflits sont profonds parce que chacun a le sentiment de défendre quelque chose de juste. Le manager ne tranche pas entre des valeurs ; il fixe la règle de l''atelier (« ici, on fait comme ça, et voilà pourquoi ») et il fait respecter les personnes.

Les personnes. Il arrive que deux personnes ne s''entendent pas, sans autre cause. Histoire ancienne, incompatibilité, jalousie. C''est plus rare qu''on ne le croit, et c''est souvent le résidu d''un conflit de rôle ou de ressource non traité. Le manager n''a pas à faire s''aimer les gens ; il a à faire respecter des règles de comportement qui permettent de travailler ensemble.

Le réflexe utile : devant toute tension, chercher d''abord la source dans l''organisation (rôles, ressources), puis dans les manières de faire, et seulement en dernier dans les personnes.

## Le triangle dramatique

Stephen Karpman, psychiatre américain formé à l''analyse transactionnelle, a décrit en 1968 un schéma qu''on retrouve dans beaucoup de conflits : le triangle dramatique, avec trois rôles. C''est un outil de lecture, issu de la pratique clinique, pas un résultat de recherche mesuré : il aide à voir le jeu dans lequel on est pris, il ne prouve rien sur les personnes.

La victime : « ce n''est pas ma faute, on m''en veut, je ne peux rien faire ». Le persécuteur : « c''est de ta faute, tu es nul, tu fais exprès ». Le sauveur : « laisse, je vais m''en occuper, je vais te défendre ».

Trois pièges pour le manager. Le premier : se laisser mettre en position de sauveur. Marc vient se plaindre de Sophie ; Karim, pour bien faire, va « régler ça » avec Sophie, à la place de Marc. Résultat : Sophie devient la persécutrice, Marc reste la victime (il n''a rien eu à faire), et Karim, sauveur, sera le prochain persécuteur dès qu''il ne donnera pas raison à Marc. Le triangle tourne ; personne ne sort.

Le deuxième piège : devenir persécuteur soi-même, en tranchant sur la base d''une seule version. Le troisième : se vivre en victime (« je ne peux rien faire, c''est Michel qui décide, ils sont impossibles ») et ne plus agir.

Sortir du triangle, c''est refuser les trois rôles : ne pas sauver (aider la personne à agir elle-même : « qu''est-ce que tu as dit à Sophie ? »), ne pas persécuter (les faits, pas les jugements), ne pas se plaindre (agir sur ce qui dépend de soi). Et ramener chacun à une position d''adulte responsable : « Vous avez tous les deux un problème de fonctionnement ; on va le régler ensemble. »

## Les biais du manager en situation de conflit

Vous avez vu au module 3 les biais d''interprétation. En situation de conflit, ils sont décuplés, parce que l''émotion est là.

- Le biais de la première version : celui qui vient se plaindre le premier a un avantage, parce que son récit structure la façon dont le manager voit la situation. Remède : ne jamais conclure avant d''avoir entendu l''autre.
- Le biais d''affinité : on donne raison à celui qu''on apprécie, ou qui nous ressemble. Karim, qui a passé huit ans à l''atelier, comprend spontanément les gens de l''atelier mieux que Sophie. Remède : se demander « si c''était l''inverse, que penserais-je ? »
- L''attribution : on explique le comportement de l''autre par sa personnalité (« Marc est susceptible ») et non par la situation (« Marc a découvert trois urgences non prévues cette semaine »). Remède : chercher la situation d''abord.
- La recherche du coupable : le manager veut savoir qui a tort. Or dans la plupart des conflits, les deux ont contribué, et la question utile n''est pas « qui a tort » mais « qu''est-ce qui doit changer ». Remède : remplacer « qui » par « quoi ».
- L''évitement déguisé : « ce n''est pas si grave », « ils sont adultes », « ça va se tasser ». Remède : relire l''escalier de Glasl.
- Le passage en force : trancher vite pour en finir. Une décision imposée sans écoute règle le symptôme et alimente le ressentiment. Remède : la méthode de la leçon 5.4.

## Les émotions dans le conflit

Un conflit n''est jamais seulement rationnel. La colère, la peur, l''humiliation, le sentiment d''injustice sont là, et ils expliquent que des gens raisonnables disent des choses déraisonnables. Le manager ne les nie pas (« calme-toi » n''a jamais calmé personne) ; il les reconnaît (« je vois que ça te met en colère »), et il attend qu''elles retombent avant de traiter le fond. Un entretien de résolution ne se tient pas à chaud. On sépare, on laisse passer quelques heures ou une nuit, et on reprend.

Le manager a aussi ses émotions : l''agacement, la peur de mal faire, parfois la colère. Les reconnaître pour soi-même (« je suis énervé, je ne vais pas décider maintenant ») évite de les faire payer à l''équipe.

## Le cas Garnier — comprendre avant d''agir

Le conflit Sophie-Marc. Source : un rôle flou. Le RACI du module 2 règle le planning du lendemain (Karim le valide à 17 h après avoir consulté Marc et Sophie) et les demandes clients transmises avant midi ; il ne dit rien des urgences qui tombent l''après-midi. Sophie, qui les reçoit au téléphone, les passe alors directement à Marc, faute de savoir à qui d''autre. Escalade : niveau 3 (ils ne se parlent plus, communiquent par post-it). Triangle : Marc est venu se plaindre à Karim (victime), désignant Sophie (persécutrice) ; Karim a failli aller « régler ça » (sauveur). Biais : Karim, ancien de l''atelier, comprend Marc mieux que Sophie ; il a entendu Marc en premier. Ce que Karim comprend : la cause est organisationnelle, les deux ont contribué (Sophie n''a pas prévenu, Marc a boudé au lieu de le dire), et la solution passera par une règle, pas par un arbitrage entre personnes.

Le conflit Thierry-Amine. Source : des valeurs (la conception du métier) et une ressource (la place de référent, que Thierry sent menacée). Escalade : niveau 2 (polémique, piques devant les autres), avec un début de recrutement d''allié (Julien). Ce que Karim comprend : ce n''est pas Amine le sujet, c''est la reconnaissance de Thierry, déjà repérée au module 4. Traiter Amine serait traiter le symptôme.

## À retenir

- Chercher la source dans l''ordre : rôles flous, ressources rares, valeurs et manières de faire, personnes. La cause est le plus souvent dans l''organisation.
- Le triangle dramatique (Karpman) : victime, persécuteur, sauveur. Le manager n''entre dans aucun des trois rôles et ramène chacun à sa responsabilité.
- Biais du manager : première version, affinité, attribution, recherche du coupable, évitement déguisé, passage en force. Remplacer « qui a tort » par « qu''est-ce qui doit changer ».
- Les émotions se reconnaissent, ne se nient pas ; on ne résout pas à chaud.

## Sources

- Stephen B. Karpman, « Fairy Tales and Script Drama Analysis », *Transactional Analysis Bulletin*, vol. 7, n° 26, 1968.
- Karen A. Jehn, Elizabeth A. Mannix, « The Dynamic Nature of Conflict », *Academy of Management Journal*, 2001.
- Daniel Kahneman, *Système 1 / Système 2*, Flammarion, 2012.
- Carsten K. W. De Dreu, Laurie R. Weingart, « Task Versus Relationship Conflict, Team Performance, and Team Member Satisfaction: A Meta-Analysis », *Journal of Applied Psychology*, 2003.
- Frank R. C. de Wit, Lindred L. Greer, Karen A. Jehn, « The Paradox of Intragroup Conflict: A Meta-Analysis », *Journal of Applied Psychology*, 2012.
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

Ces règles sont d''autant mieux respectées qu''elles ont été construites par l''équipe, pas édictées par le manager. Comptez une réunion d''une heure :

1. Le manager pose la question : « Qu''est-ce qui, dans notre façon de fonctionner ensemble, nous fait perdre du temps ou de l''énergie ? » Tour de table, chacun une réponse, sans discussion.
2. On regroupe les réponses par thème (information, entraide, respect, décisions).
3. Pour chaque thème, on formule une règle en une phrase, positive et vérifiable : « Toute urgence est annoncée à voix haute au brief ou à Karim, jamais par post-it » plutôt que « il faut mieux communiquer ».
4. On garde cinq à huit règles, pas vingt. On les affiche.
5. On fixe une date de relecture (trois mois) : « Est-ce qu''on les tient ? Faut-il en changer une ? »

Le manager tient une règle en réserve, qu''il impose si l''équipe ne la propose pas : le respect des personnes. « On peut tout se dire sur le travail ; on ne s''attaque pas aux personnes, et pas devant les autres. » C''est la ligne qu''il défendra sans négociation.

## Les rituels de régulation

Une règle affichée ne suffit pas. Il faut des moments où l''on vérifie et où l''on ajuste. Trois rituels simples :

Le point « ce qui nous a compliqué la vie » : cinq minutes à la fin du point hebdomadaire. Chacun peut dire une chose qui a gêné son travail cette semaine, en termes de faits, sans viser une personne. Le manager note et traite. Beaucoup de petites irritations se règlent là, parce que ce rituel leur donne un lieu légitime avant qu''elles ne deviennent des griefs.

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

Karim tient la réunion des règles du jeu. Il en sort six règles, dont : « Une urgence s''annonce de vive voix, au brief ou à Karim » (Sophie et Marc l''ont formulée ensemble, ce qui était l''objectif) ; « Quand on n''est pas d''accord avec la façon de faire de quelqu''un, on lui dit à lui, pas aux autres » (Karim l''a proposée, en regardant tout le monde, et Thierry a compris) ; « Un nouveau a un mois pour poser toutes les questions qu''il veut, sans commentaire » (proposée par Nadia, qui a vu Amine se faire charrier). Le point « ce qui nous a compliqué la vie » entre dans le point hebdomadaire. Et Karim admet devant l''équipe qu''il aurait dû prévoir dès le départ le cas des urgences qui arrivent l''après-midi, une fois le planning bouclé.

## À retenir

- La prévention, c''est tout ce qui précède : objectifs, rôles, règles de répartition, feedback, entretiens, réunion, sécurité psychologique, équité.
- Des règles du jeu co-construites (cinq à huit, positives, vérifiables, affichées, relues), avec une règle non négociable : le respect des personnes.
- Des rituels de régulation : le point « ce qui nous a compliqué la vie », la rétrospective, la relecture des règles.
- Repérer les signaux faibles (communication indirecte, piques, silences, « toujours / jamais », alliances) et aller voir tout de suite.
- Se demander d''abord ce que le manager a fait, ou pas fait.

## Sources

- ANACT, « Espaces de discussion sur le travail », anact.fr.
- Friedrich Glasl, *Konfliktmanagement*, 1980.
- Patrick Lencioni, *The Five Dysfunctions of a Team*, Jossey-Bass, 2002 ; trad. française *Optimisez votre équipe*, Éditions Un monde différent, 2005 (sur la peur du conflit et l''absence de confiance).
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

Ces règles sont d''autant mieux respectées qu''elles ont été construites par l''équipe, pas édictées par le manager. Comptez une réunion d''une heure :

1. Le manager pose la question : « Qu''est-ce qui, dans notre façon de fonctionner ensemble, nous fait perdre du temps ou de l''énergie ? » Tour de table, chacun une réponse, sans discussion.
2. On regroupe les réponses par thème (information, entraide, respect, décisions).
3. Pour chaque thème, on formule une règle en une phrase, positive et vérifiable : « Toute urgence est annoncée à voix haute au brief ou à Karim, jamais par post-it » plutôt que « il faut mieux communiquer ».
4. On garde cinq à huit règles, pas vingt. On les affiche.
5. On fixe une date de relecture (trois mois) : « Est-ce qu''on les tient ? Faut-il en changer une ? »

Le manager tient une règle en réserve, qu''il impose si l''équipe ne la propose pas : le respect des personnes. « On peut tout se dire sur le travail ; on ne s''attaque pas aux personnes, et pas devant les autres. » C''est la ligne qu''il défendra sans négociation.

## Les rituels de régulation

Une règle affichée ne suffit pas. Il faut des moments où l''on vérifie et où l''on ajuste. Trois rituels simples :

Le point « ce qui nous a compliqué la vie » : cinq minutes à la fin du point hebdomadaire. Chacun peut dire une chose qui a gêné son travail cette semaine, en termes de faits, sans viser une personne. Le manager note et traite. Beaucoup de petites irritations se règlent là, parce que ce rituel leur donne un lieu légitime avant qu''elles ne deviennent des griefs.

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

Karim tient la réunion des règles du jeu. Il en sort six règles, dont : « Une urgence s''annonce de vive voix, au brief ou à Karim » (Sophie et Marc l''ont formulée ensemble, ce qui était l''objectif) ; « Quand on n''est pas d''accord avec la façon de faire de quelqu''un, on lui dit à lui, pas aux autres » (Karim l''a proposée, en regardant tout le monde, et Thierry a compris) ; « Un nouveau a un mois pour poser toutes les questions qu''il veut, sans commentaire » (proposée par Nadia, qui a vu Amine se faire charrier). Le point « ce qui nous a compliqué la vie » entre dans le point hebdomadaire. Et Karim admet devant l''équipe qu''il aurait dû prévoir dès le départ le cas des urgences qui arrivent l''après-midi, une fois le planning bouclé.

## À retenir

- La prévention, c''est tout ce qui précède : objectifs, rôles, règles de répartition, feedback, entretiens, réunion, sécurité psychologique, équité.
- Des règles du jeu co-construites (cinq à huit, positives, vérifiables, affichées, relues), avec une règle non négociable : le respect des personnes.
- Des rituels de régulation : le point « ce qui nous a compliqué la vie », la rétrospective, la relecture des règles.
- Repérer les signaux faibles (communication indirecte, piques, silences, « toujours / jamais », alliances) et aller voir tout de suite.
- Se demander d''abord ce que le manager a fait, ou pas fait.

## Sources

- ANACT, « Espaces de discussion sur le travail », anact.fr.
- Friedrich Glasl, *Konfliktmanagement*, 1980.
- Patrick Lencioni, *The Five Dysfunctions of a Team*, Jossey-Bass, 2002 ; trad. française *Optimisez votre équipe*, Éditions Un monde différent, 2005 (sur la peur du conflit et l''absence de confiance).
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

Le manager voit chaque personne séparément, puis, si nécessaire, ensemble. Dans les deux cas, il commence par le cadre : « Il y a une difficulté entre vous deux qui pèse sur le travail de l''équipe. Mon rôle n''est pas de dire qui a raison, c''est qu''on trouve ensemble comment travailler. Voilà comment on va procéder. » Il pose les règles de l''échange : on parle de faits, on ne coupe pas, on ne s''attaque pas aux personnes, ce qui se dit ici reste ici. Une limite à cette confidentialité, à annoncer honnêtement si le sujet s''en approche : si l''entretien révèle un danger, des violences ou un harcèlement, le manager est tenu d''en informer l''employeur (leçon 5.6).

## Étape 2 — Écouter chaque partie, séparément

C''est l''étape décisive et la plus souvent sautée. Chaque personne, seule avec le manager, raconte ce qui s''est passé de son point de vue. Le manager écoute avec les outils du module 3 : questions ouvertes (« qu''est-ce qui s''est passé exactement ? », « depuis quand ? », « qu''est-ce que tu as essayé ? »), reformulation, silence. Il ne prend pas parti, ne commente pas la version de l''autre, ne promet rien.

Il cherche, derrière les positions (« je veux qu''elle arrête de me donner des urgences »), les besoins (« j''ai besoin de pouvoir organiser ma journée »). Fisher et Ury, dans leur méthode de négociation raisonnée, parlent d''intérêts : deux positions s''excluent, alors que les intérêts qui sont derrière sont souvent compatibles, au moins en partie. C''est là qu''on trouve des solutions.

Il termine par : « Qu''est-ce qu''il faudrait pour que ça fonctionne, selon toi ? » et « Es-tu d''accord pour qu''on en parle à trois ? »

## Étape 3 — Objectiver : les faits, la source, la règle

Le manager rassemble ce qu''il a entendu et le met à plat : les faits sur lesquels les deux versions concordent ; les faits qui divergent (et qu''on pourra vérifier, ou qu''on laissera de côté) ; la source du conflit (rôle flou, ressource, manière de faire, leçon 5.2) ; la règle existante qui s''applique (RACI, règles du jeu) ou qui manque.

Le plus souvent, cette étape révèle que le conflit a une cause organisationnelle que le manager peut traiter lui-même. Sophie et Marc : le circuit du planning ne prévoyait rien pour les urgences de l''après-midi. Ce qui manque, c''est une décision de Karim, plus que la bonne volonté de l''un ou de l''autre.

## Étape 4 — Chercher les options, ensemble

L''entretien à trois. Le manager rappelle le cadre, expose ce qu''il a compris de manière équilibrée (les besoins de chacun, la source), et demande : « Qu''est-ce qu''on peut faire pour que ça fonctionne ? » Il laisse les deux proposer avant de proposer lui-même. Il cherche des options qui répondent aux besoins des deux, pas un compromis où chacun perd la moitié.

C''est ici que la communication non violente (CNV), formalisée par le psychologue américain Marshall Rosenberg, rend service. Elle donne à chacun une façon de dire ce qui ne va pas sans attaquer, en quatre temps :

- L''observation, sans jugement : « Mardi, j''ai appris à 14 h que la Clio passait en géométrie à 17 h. »
- Le sentiment : « J''étais en colère, et découragé. » (« J''ai eu l''impression qu''on me méprisait » n''est pas un sentiment au sens de la CNV : c''est déjà une interprétation de ce que fait l''autre.)
- Le besoin : « J''ai besoin de pouvoir organiser ma journée. »
- La demande, concrète et négociable : « Est-ce que tu peux faire passer les urgences de l''après-midi par Karim, pour qu''il décide et qu''il me prévienne ? »

Le manager peut proposer ce format aux deux personnes (« chacun dit à l''autre, avec ces quatre temps, ce qui s''est passé pour lui »), et veiller à ce qu''il soit respecté. N''en attendez pas de miracle. La CNV est une discipline de formulation : elle évite les phrases qui blessent (« tu ne préviens jamais ») et oblige à formuler une demande à laquelle l''autre peut répondre. Ses effets ont été peu évalués par des études rigoureuses, et, appliquée mécaniquement, elle sonne faux ; utilisée comme une trame, elle aide beaucoup dans un entretien tendu.

## Étape 5 — Contractualiser et suivre

On termine par un accord explicite : ce que chacun fait, à partir de quand, et ce que le manager fait (la règle qu''il fixe, le RACI qu''il modifie). Deux ou trois engagements, précis. Le manager les reformule à voix haute, et, pour un conflit sérieux, les note et les remet aux deux.

Puis le suivi : un point à deux semaines, à trois, puis, si tout va bien, à un mois. Sans suivi, l''accord dure le temps de la bonne volonté. Le manager observe aussi les signaux faibles (leçon 5.3) : les post-it ont-ils disparu ?

## Quand le manager est partie au conflit

Si le conflit oppose le manager à un membre de l''équipe, la méthode reste la même, avec deux précautions. D''abord, le manager écoute vraiment, en commençant par l''autre, et il reconnaît sa part (il y en a presque toujours une). Ensuite, s''il n''y parvient pas, il demande un tiers : son propre manager, les RH, un collègue manager. Un manager qui refuse le tiers parce qu''il « gère » perd la confiance de l''équipe et souvent le conflit.

## Quand et comment recourir à la médiation

Le manager n''est pas médiateur : il a une position d''autorité, un intérêt au résultat, et parfois une part dans le conflit. Quand le conflit a dépassé le niveau 4 (recrutement d''alliés, attaques sur la réputation, refus de se parler même en présence du manager), ou quand le manager est lui-même trop impliqué, ou quand la méthode en cinq étapes a échoué, il faut un tiers neutre.

En interne : les RH, un manager d''un autre service, parfois un représentant du personnel, si les deux parties l''acceptent. En externe : un médiateur professionnel, que l''entreprise peut mandater. La médiation repose sur l''accord des deux parties, elle est confidentielle, et le médiateur ne décide pas : il aide les parties à trouver leur accord. Le manager, qui a proposé la médiation, en respecte les règles : il ne demande pas au médiateur ce qui s''est dit.

Un cas à part : le soupçon de harcèlement. La médiation n''est alors pas le premier réflexe, car il faut d''abord que l''employeur fasse établir les faits (leçon 5.6). Le Code du travail la prévoit pour le harcèlement moral, à l''initiative de la personne qui s''estime victime ou de la personne mise en cause (L1152-6), jamais imposée.

Passer la main n''est pas un échec du manager. C''est la reconnaissance qu''un conflit installé demande d''autres moyens que les siens, et c''est une protection pour lui et pour les personnes.

## Ce qui ne marche pas

- Réunir les deux tout de suite, sans les avoir écoutés séparément : chacun rejoue le conflit devant le chef.
- Trancher sur une version.
- Demander aux gens de « faire un effort » sans rien changer à la cause.
- Séparer physiquement les personnes sans traiter (changer les horaires, les postes) : le conflit se déplace.
- Attendre que ça se tasse.
- Prendre le conflit pour soi et s''en vouloir : le manager organise la résolution, il n''est pas responsable de la mésentente.

## Le cas Garnier — Sophie et Marc

Étape 1 : Karim voit Sophie mardi 13 h, Marc mardi 13 h 30, chacun dans le bureau. Il pose le cadre. Étape 2 : Sophie raconte que Marc « fait la tête » et qu''elle n''ose plus lui parler ; derrière, son besoin : ne pas être perçue comme celle qui impose des urgences alors qu''elle transmet celles des clients. Marc raconte les trois urgences non prévues ; son besoin : pouvoir organiser sa journée, et ne recevoir de changement que de celui qui décide du planning. Étape 3 : les faits concordent (les urgences sont arrivées sans prévenir ; Marc a cessé de parler) ; la source est un rôle flou (le circuit règle le planning du lendemain, pas les urgences de l''après-midi ; Sophie ne sait pas à qui les annoncer) ; la règle manque. Étape 4 : à trois, jeudi. Karim expose ce qu''il a compris, sans désigner. Chacun dit à l''autre, en quatre temps. Options trouvées par eux : Sophie annonce toute urgence de vive voix au brief ou à Karim ; Karim décide si elle passe devant et prévient Marc lui-même ; Marc, s''il découvre une urgence non prévue, le dit sur le moment plutôt que de se taire. Étape 5 : trois engagements notés, point dans deux semaines. Karim modifie le RACI. Deux semaines plus tard, les post-it ont disparu et Sophie a demandé à Marc un conseil sur sa propre voiture.

## À retenir

- Pas à chaud, en lieu fermé, sans avis sur qui a tort.
- Cinq étapes : accueillir (le cadre), écouter chacun séparément (positions et besoins), objectiver (faits, source, règle), chercher les options ensemble (CNV : observation, sentiment, besoin, demande), contractualiser et suivre.
- Le plus souvent, la cause est organisationnelle, et c''est le manager qui la traite.
- Quand le manager est partie, il commence par écouter et reconnaît sa part ; quand le conflit dépasse le niveau 4 ou que la méthode échoue, il passe la main à un tiers neutre (RH, médiateur).
- Passer la main n''est pas un échec.

## Sources

- Roger Fisher, William Ury, *Getting to Yes*, Houghton Mifflin, 1981 ; trad. française *Comment réussir une négociation*, Seuil, 1982 (positions et intérêts).
- Marshall B. Rosenberg, *Les mots sont des fenêtres (ou bien ce sont des murs). Introduction à la communication non violente*, La Découverte, 1999.
- Friedrich Glasl, *Konfliktmanagement*, 1980 (niveaux d''escalade et modes d''intervention).
- Code du travail, art. L1152-6 (médiation en cas de harcèlement moral), legifrance.gouv.fr.
- France Compétences, référentiel RS7377, compétence 8.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Quand la prévention n''a pas suffi et qu''un conflit est installé (niveau 2 à 4 de l''escalier de Glasl), le manager intervient. Pas en arbitre qui dit qui a raison, pas en sauveur qui règle à la place des gens, mais en tiers qui organise la résolution. La méthode en cinq étapes ci-dessous fonctionne pour un conflit entre deux personnes de l''équipe ; elle s''adapte à un conflit entre le manager et une personne (le manager est alors partie, et doit être encore plus rigoureux) et à un conflit entre deux sous-groupes.

## Avant de commencer : trois conditions

Le bon moment : pas à chaud. Si l''incident vient d''avoir lieu, on sépare, on fait retomber (« on en parle demain matin, chacun de son côté d''abord »), et on fixe l''heure.

Le bon lieu : un lieu fermé, neutre, sans public. Jamais dans l''atelier ou l''open space.

La bonne posture : le manager n''a pas d''avis sur qui a tort. S''il en a un (et il en a souvent un), il le met de côté pendant les entretiens. Il cherche ce qui doit changer, pas qui est coupable.

## Étape 1 — Accueillir : poser le cadre

Le manager voit chaque personne séparément, puis, si nécessaire, ensemble. Dans les deux cas, il commence par le cadre : « Il y a une difficulté entre vous deux qui pèse sur le travail de l''équipe. Mon rôle n''est pas de dire qui a raison, c''est qu''on trouve ensemble comment travailler. Voilà comment on va procéder. » Il pose les règles de l''échange : on parle de faits, on ne coupe pas, on ne s''attaque pas aux personnes, ce qui se dit ici reste ici. Une limite à cette confidentialité, à annoncer honnêtement si le sujet s''en approche : si l''entretien révèle un danger, des violences ou un harcèlement, le manager est tenu d''en informer l''employeur (leçon 5.6).

## Étape 2 — Écouter chaque partie, séparément

C''est l''étape décisive et la plus souvent sautée. Chaque personne, seule avec le manager, raconte ce qui s''est passé de son point de vue. Le manager écoute avec les outils du module 3 : questions ouvertes (« qu''est-ce qui s''est passé exactement ? », « depuis quand ? », « qu''est-ce que tu as essayé ? »), reformulation, silence. Il ne prend pas parti, ne commente pas la version de l''autre, ne promet rien.

Il cherche, derrière les positions (« je veux qu''elle arrête de me donner des urgences »), les besoins (« j''ai besoin de pouvoir organiser ma journée »). Fisher et Ury, dans leur méthode de négociation raisonnée, parlent d''intérêts : deux positions s''excluent, alors que les intérêts qui sont derrière sont souvent compatibles, au moins en partie. C''est là qu''on trouve des solutions.

Il termine par : « Qu''est-ce qu''il faudrait pour que ça fonctionne, selon toi ? » et « Es-tu d''accord pour qu''on en parle à trois ? »

## Étape 3 — Objectiver : les faits, la source, la règle

Le manager rassemble ce qu''il a entendu et le met à plat : les faits sur lesquels les deux versions concordent ; les faits qui divergent (et qu''on pourra vérifier, ou qu''on laissera de côté) ; la source du conflit (rôle flou, ressource, manière de faire, leçon 5.2) ; la règle existante qui s''applique (RACI, règles du jeu) ou qui manque.

Le plus souvent, cette étape révèle que le conflit a une cause organisationnelle que le manager peut traiter lui-même. Sophie et Marc : le circuit du planning ne prévoyait rien pour les urgences de l''après-midi. Ce qui manque, c''est une décision de Karim, plus que la bonne volonté de l''un ou de l''autre.

## Étape 4 — Chercher les options, ensemble

L''entretien à trois. Le manager rappelle le cadre, expose ce qu''il a compris de manière équilibrée (les besoins de chacun, la source), et demande : « Qu''est-ce qu''on peut faire pour que ça fonctionne ? » Il laisse les deux proposer avant de proposer lui-même. Il cherche des options qui répondent aux besoins des deux, pas un compromis où chacun perd la moitié.

C''est ici que la communication non violente (CNV), formalisée par le psychologue américain Marshall Rosenberg, rend service. Elle donne à chacun une façon de dire ce qui ne va pas sans attaquer, en quatre temps :

- L''observation, sans jugement : « Mardi, j''ai appris à 14 h que la Clio passait en géométrie à 17 h. »
- Le sentiment : « J''étais en colère, et découragé. » (« J''ai eu l''impression qu''on me méprisait » n''est pas un sentiment au sens de la CNV : c''est déjà une interprétation de ce que fait l''autre.)
- Le besoin : « J''ai besoin de pouvoir organiser ma journée. »
- La demande, concrète et négociable : « Est-ce que tu peux faire passer les urgences de l''après-midi par Karim, pour qu''il décide et qu''il me prévienne ? »

Le manager peut proposer ce format aux deux personnes (« chacun dit à l''autre, avec ces quatre temps, ce qui s''est passé pour lui »), et veiller à ce qu''il soit respecté. N''en attendez pas de miracle. La CNV est une discipline de formulation : elle évite les phrases qui blessent (« tu ne préviens jamais ») et oblige à formuler une demande à laquelle l''autre peut répondre. Ses effets ont été peu évalués par des études rigoureuses, et, appliquée mécaniquement, elle sonne faux ; utilisée comme une trame, elle aide beaucoup dans un entretien tendu.

## Étape 5 — Contractualiser et suivre

On termine par un accord explicite : ce que chacun fait, à partir de quand, et ce que le manager fait (la règle qu''il fixe, le RACI qu''il modifie). Deux ou trois engagements, précis. Le manager les reformule à voix haute, et, pour un conflit sérieux, les note et les remet aux deux.

Puis le suivi : un point à deux semaines, à trois, puis, si tout va bien, à un mois. Sans suivi, l''accord dure le temps de la bonne volonté. Le manager observe aussi les signaux faibles (leçon 5.3) : les post-it ont-ils disparu ?

## Quand le manager est partie au conflit

Si le conflit oppose le manager à un membre de l''équipe, la méthode reste la même, avec deux précautions. D''abord, le manager écoute vraiment, en commençant par l''autre, et il reconnaît sa part (il y en a presque toujours une). Ensuite, s''il n''y parvient pas, il demande un tiers : son propre manager, les RH, un collègue manager. Un manager qui refuse le tiers parce qu''il « gère » perd la confiance de l''équipe et souvent le conflit.

## Quand et comment recourir à la médiation

Le manager n''est pas médiateur : il a une position d''autorité, un intérêt au résultat, et parfois une part dans le conflit. Quand le conflit a dépassé le niveau 4 (recrutement d''alliés, attaques sur la réputation, refus de se parler même en présence du manager), ou quand le manager est lui-même trop impliqué, ou quand la méthode en cinq étapes a échoué, il faut un tiers neutre.

En interne : les RH, un manager d''un autre service, parfois un représentant du personnel, si les deux parties l''acceptent. En externe : un médiateur professionnel, que l''entreprise peut mandater. La médiation repose sur l''accord des deux parties, elle est confidentielle, et le médiateur ne décide pas : il aide les parties à trouver leur accord. Le manager, qui a proposé la médiation, en respecte les règles : il ne demande pas au médiateur ce qui s''est dit.

Un cas à part : le soupçon de harcèlement. La médiation n''est alors pas le premier réflexe, car il faut d''abord que l''employeur fasse établir les faits (leçon 5.6). Le Code du travail la prévoit pour le harcèlement moral, à l''initiative de la personne qui s''estime victime ou de la personne mise en cause (L1152-6), jamais imposée.

Passer la main n''est pas un échec du manager. C''est la reconnaissance qu''un conflit installé demande d''autres moyens que les siens, et c''est une protection pour lui et pour les personnes.

## Ce qui ne marche pas

- Réunir les deux tout de suite, sans les avoir écoutés séparément : chacun rejoue le conflit devant le chef.
- Trancher sur une version.
- Demander aux gens de « faire un effort » sans rien changer à la cause.
- Séparer physiquement les personnes sans traiter (changer les horaires, les postes) : le conflit se déplace.
- Attendre que ça se tasse.
- Prendre le conflit pour soi et s''en vouloir : le manager organise la résolution, il n''est pas responsable de la mésentente.

## Le cas Garnier — Sophie et Marc

Étape 1 : Karim voit Sophie mardi 13 h, Marc mardi 13 h 30, chacun dans le bureau. Il pose le cadre. Étape 2 : Sophie raconte que Marc « fait la tête » et qu''elle n''ose plus lui parler ; derrière, son besoin : ne pas être perçue comme celle qui impose des urgences alors qu''elle transmet celles des clients. Marc raconte les trois urgences non prévues ; son besoin : pouvoir organiser sa journée, et ne recevoir de changement que de celui qui décide du planning. Étape 3 : les faits concordent (les urgences sont arrivées sans prévenir ; Marc a cessé de parler) ; la source est un rôle flou (le circuit règle le planning du lendemain, pas les urgences de l''après-midi ; Sophie ne sait pas à qui les annoncer) ; la règle manque. Étape 4 : à trois, jeudi. Karim expose ce qu''il a compris, sans désigner. Chacun dit à l''autre, en quatre temps. Options trouvées par eux : Sophie annonce toute urgence de vive voix au brief ou à Karim ; Karim décide si elle passe devant et prévient Marc lui-même ; Marc, s''il découvre une urgence non prévue, le dit sur le moment plutôt que de se taire. Étape 5 : trois engagements notés, point dans deux semaines. Karim modifie le RACI. Deux semaines plus tard, les post-it ont disparu et Sophie a demandé à Marc un conseil sur sa propre voiture.

## À retenir

- Pas à chaud, en lieu fermé, sans avis sur qui a tort.
- Cinq étapes : accueillir (le cadre), écouter chacun séparément (positions et besoins), objectiver (faits, source, règle), chercher les options ensemble (CNV : observation, sentiment, besoin, demande), contractualiser et suivre.
- Le plus souvent, la cause est organisationnelle, et c''est le manager qui la traite.
- Quand le manager est partie, il commence par écouter et reconnaît sa part ; quand le conflit dépasse le niveau 4 ou que la méthode échoue, il passe la main à un tiers neutre (RH, médiateur).
- Passer la main n''est pas un échec.

## Sources

- Roger Fisher, William Ury, *Getting to Yes*, Houghton Mifflin, 1981 ; trad. française *Comment réussir une négociation*, Seuil, 1982 (positions et intérêts).
- Marshall B. Rosenberg, *Les mots sont des fenêtres (ou bien ce sont des murs). Introduction à la communication non violente*, La Découverte, 1999.
- Friedrich Glasl, *Konfliktmanagement*, 1980 (niveaux d''escalade et modes d''intervention).
- Code du travail, art. L1152-6 (médiation en cas de harcèlement moral), legifrance.gouv.fr.
- France Compétences, référentiel RS7377, compétence 8.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 6 and l.ordre = 4;
  n := n + 1;

  -- 5.5-video-deux-collegues.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Deux collègues qui ne se parlent plus

Vous connaissez la méthode en cinq étapes. Voyons-la fonctionner sur une situation réelle, dans un autre secteur que la carrosserie : une agence bancaire de quartier, sept personnes. Le manager s''appelle Nour. Deux conseillères, Léa et Camille, ne se parlent plus depuis trois semaines. Les clients commencent à le sentir : un dossier de prêt a traîné parce que chacune pensait que l''autre s''en occupait.

## Ce qui a été fait de travers d''abord

Nour a d''abord fait ce que font beaucoup de managers : elle a réuni Léa et Camille dans son bureau, sans préparation, un vendredi à 17 h 30, et leur a dit : « Bon, vous allez me dire ce qui se passe, et vous allez arrêter, parce que ça se voit. »

LÉA : « Il ne se passe rien. »
CAMILLE : « Demande-lui, c''est elle qui a un problème. »
LÉA : « Moi j''ai un problème ? C''est toi qui as pris mon client. »
NOUR : « Bon, on se calme. Vous êtes adultes, faites un effort, on en reparle lundi. »

Résultat : rien. Le conflit a été rejoué devant le chef, chacune a durci sa position, et Nour a demandé un effort sans rien changer. Lundi, les deux se parlaient encore moins. Reprenons avec la méthode.

## Étape 1 — Accueillir

Nour convoque Léa mardi à 9 h, Camille à 9 h 30, dans la salle de réunion, porte fermée. Même phrase d''ouverture pour les deux :

NOUR : « Il y a une difficulté entre Camille et toi qui pèse sur l''agence ; le dossier Martin a pris quatre jours de retard. Je ne cherche pas qui a raison. Je cherche comment on travaille ensemble. Je vais vous écouter chacune, puis on se verra à trois. Ce qu''on se dit ici reste ici. D''accord ? »

## Étape 2 — Écouter chacune

NOUR : « Raconte-moi ce qui s''est passé. »
LÉA : « Le client Rousseau, c''est moi qui le suis depuis deux ans. Camille l''a reçu pendant mes congés et elle lui a ouvert une assurance-vie. Le client est passé dans son portefeuille. Elle ne m''a rien dit. Je l''ai découvert dans l''outil. »
NOUR : « Tu l''as découvert dans l''outil, sans qu''elle t''en parle. » (reformulation)
LÉA : « Oui. Et depuis, je ne lui adresse plus la parole, parce que si je lui parle, je vais dire des choses que je regretterai. »
NOUR : « Qu''est-ce qu''il te faudrait ? »
LÉA : « Que mes clients restent mes clients. Et qu''on me le dise, au moins. »

Position : « mes clients restent mes clients ». Besoin : la reconnaissance de son travail, et l''information.

NOUR : « Raconte-moi ce qui s''est passé. »
CAMILLE : « Le client Rousseau est venu pendant les congés de Léa avec un besoin urgent, une succession. Je l''ai traité. L''outil a basculé le client automatiquement dans mon portefeuille, je ne l''ai pas demandé. Quand Léa est revenue, elle ne m''a pas dit bonjour. Alors je n''ai rien dit non plus. »
NOUR : « Tu as traité une urgence, l''outil a fait le transfert, et tu as pris le silence de Léa comme une accusation. »
CAMILLE : « Exactement. Et je ne vais pas m''excuser d''avoir fait mon travail. »
NOUR : « Qu''est-ce qu''il te faudrait ? »
CAMILLE : « Qu''on ne me traite pas comme une voleuse. Et qu''il y ait une règle claire quand on remplace quelqu''un. »

Position : « je ne m''excuserai pas ». Besoin : la reconnaissance, et une règle.

## Étape 3 — Objectiver

Nour met à plat. Les faits concordent : Camille a traité une urgence, l''outil a transféré le client, personne ne s''est parlé. Le fait divergent, « elle m''a pris mon client », n''est pas un fait ; c''est une interprétation. La source : un rôle flou. Que se passe-t-il quand on reçoit le client d''un collègue absent ? Personne ne l''a jamais dit. Et la règle manque : c''est à Nour de la fixer.

Elle remarque aussi ses propres biais : elle a entendu Léa en premier, elle connaît Léa depuis plus longtemps, et elle avait déjà, en son for intérieur, donné tort à Camille. Elle le met de côté.

## Étape 4 — Chercher les options ensemble

Jeudi 9 h, à trois. Nour rappelle le cadre, puis expose ce qu''elle a compris, de façon équilibrée.

NOUR : « Ce que j''ai compris : Camille a traité une urgence pendant les congés de Léa, l''outil a transféré le client, et personne ne s''est parlé au retour. Léa, tu as eu le sentiment qu''on te retirait deux ans de travail. Camille, tu as eu le sentiment d''être traitée en voleuse pour avoir fait ton travail. Et il n''y a pas de règle sur ce qu''on fait quand on remplace un collègue. Ça, c''est de ma responsabilité. Je vous propose que chacune dise à l''autre ce qui s''est passé pour elle, en quatre temps : ce qu''elle a observé, ce qu''elle a ressenti, ce dont elle a besoin, ce qu''elle demande. Léa ? »
LÉA : « Quand je suis rentrée, j''ai vu dans l''outil que Rousseau était dans ton portefeuille. J''ai été blessée, parce que je le suis depuis deux ans. J''ai besoin que mon travail soit reconnu. Je te demande de me prévenir quand tu traites un de mes clients. »
CAMILLE : « Je comprends. Quand tu es rentrée, tu ne m''as pas dit bonjour. J''ai été vexée, parce que j''avais traité une succession en urgence. J''ai besoin qu''on ne me prenne pas pour quelqu''un qui pique des clients. Je te demande de me parler quand quelque chose ne va pas, plutôt que de te taire. »
NOUR : « Qu''est-ce qu''on fait pour que ça fonctionne ? »
CAMILLE : « On peut remettre Rousseau dans le portefeuille de Léa. Je ne tiens pas à le garder. »
LÉA : « Et quand on remplace, on laisse un mot au retour. Un mail, deux lignes. »
NOUR : « Je fixe la règle pour l''agence : un client reçu pendant l''absence de son conseiller reste dans son portefeuille ; le remplaçant lui envoie un mail de passation. Je vais voir avec le siège pour le paramétrage de l''outil. »

## Étape 5 — Contractualiser et suivre

Trois engagements, reformulés à voix haute et notés : Camille remet le client Rousseau à Léa cette semaine ; toute passation fait l''objet d''un mail au retour ; Nour fixe la règle pour l''agence et voit le siège pour l''outil. Point dans deux semaines. Et Nour ajoute une chose : « Ce conflit vient d''une règle qui manquait. C''était à moi de la poser. » Ce n''est pas de la faiblesse ; c''est ce qui permet aux deux de sortir sans perdre la face.

Deux semaines plus tard, Léa et Camille se parlent. Pas comme des amies ; comme des collègues. C''est tout ce que Nour avait à obtenir.

## Ce qu''il faut retenir

Trois choses. D''abord : écouter séparément avant de réunir. La première tentative de Nour a échoué là. Ensuite : chercher la source dans l''organisation ; ici, une règle manquante, que le manager pose. Enfin : ne pas trancher entre les personnes, mais organiser leur échange, avec un format qui empêche les attaques, et conclure par des engagements suivis.

Et une quatrième : si Léa avait refusé l''entretien à trois, ou si les attaques avaient continué devant Nour, il aurait fallu un tiers. Passer la main est une décision de manager.

À tout de suite pour les situations difficiles : recadrer, sanctionner, alerter.

## Sources
méthode en cinq étapes (leçon 5.4) ; Rosenberg, communication non violente ; Fisher et Ury, positions et intérêts.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Deux collègues qui ne se parlent plus

Vous connaissez la méthode en cinq étapes. Voyons-la fonctionner sur une situation réelle, dans un autre secteur que la carrosserie : une agence bancaire de quartier, sept personnes. Le manager s''appelle Nour. Deux conseillères, Léa et Camille, ne se parlent plus depuis trois semaines. Les clients commencent à le sentir : un dossier de prêt a traîné parce que chacune pensait que l''autre s''en occupait.

## Ce qui a été fait de travers d''abord

Nour a d''abord fait ce que font beaucoup de managers : elle a réuni Léa et Camille dans son bureau, sans préparation, un vendredi à 17 h 30, et leur a dit : « Bon, vous allez me dire ce qui se passe, et vous allez arrêter, parce que ça se voit. »

LÉA : « Il ne se passe rien. »
CAMILLE : « Demande-lui, c''est elle qui a un problème. »
LÉA : « Moi j''ai un problème ? C''est toi qui as pris mon client. »
NOUR : « Bon, on se calme. Vous êtes adultes, faites un effort, on en reparle lundi. »

Résultat : rien. Le conflit a été rejoué devant le chef, chacune a durci sa position, et Nour a demandé un effort sans rien changer. Lundi, les deux se parlaient encore moins. Reprenons avec la méthode.

## Étape 1 — Accueillir

Nour convoque Léa mardi à 9 h, Camille à 9 h 30, dans la salle de réunion, porte fermée. Même phrase d''ouverture pour les deux :

NOUR : « Il y a une difficulté entre Camille et toi qui pèse sur l''agence ; le dossier Martin a pris quatre jours de retard. Je ne cherche pas qui a raison. Je cherche comment on travaille ensemble. Je vais vous écouter chacune, puis on se verra à trois. Ce qu''on se dit ici reste ici. D''accord ? »

## Étape 2 — Écouter chacune

NOUR : « Raconte-moi ce qui s''est passé. »
LÉA : « Le client Rousseau, c''est moi qui le suis depuis deux ans. Camille l''a reçu pendant mes congés et elle lui a ouvert une assurance-vie. Le client est passé dans son portefeuille. Elle ne m''a rien dit. Je l''ai découvert dans l''outil. »
NOUR : « Tu l''as découvert dans l''outil, sans qu''elle t''en parle. » (reformulation)
LÉA : « Oui. Et depuis, je ne lui adresse plus la parole, parce que si je lui parle, je vais dire des choses que je regretterai. »
NOUR : « Qu''est-ce qu''il te faudrait ? »
LÉA : « Que mes clients restent mes clients. Et qu''on me le dise, au moins. »

Position : « mes clients restent mes clients ». Besoin : la reconnaissance de son travail, et l''information.

NOUR : « Raconte-moi ce qui s''est passé. »
CAMILLE : « Le client Rousseau est venu pendant les congés de Léa avec un besoin urgent, une succession. Je l''ai traité. L''outil a basculé le client automatiquement dans mon portefeuille, je ne l''ai pas demandé. Quand Léa est revenue, elle ne m''a pas dit bonjour. Alors je n''ai rien dit non plus. »
NOUR : « Tu as traité une urgence, l''outil a fait le transfert, et tu as pris le silence de Léa comme une accusation. »
CAMILLE : « Exactement. Et je ne vais pas m''excuser d''avoir fait mon travail. »
NOUR : « Qu''est-ce qu''il te faudrait ? »
CAMILLE : « Qu''on ne me traite pas comme une voleuse. Et qu''il y ait une règle claire quand on remplace quelqu''un. »

Position : « je ne m''excuserai pas ». Besoin : la reconnaissance, et une règle.

## Étape 3 — Objectiver

Nour met à plat. Les faits concordent : Camille a traité une urgence, l''outil a transféré le client, personne ne s''est parlé. Le fait divergent, « elle m''a pris mon client », n''est pas un fait ; c''est une interprétation. La source : un rôle flou. Que se passe-t-il quand on reçoit le client d''un collègue absent ? Personne ne l''a jamais dit. Et la règle manque : c''est à Nour de la fixer.

Elle remarque aussi ses propres biais : elle a entendu Léa en premier, elle connaît Léa depuis plus longtemps, et elle avait déjà, en son for intérieur, donné tort à Camille. Elle le met de côté.

## Étape 4 — Chercher les options ensemble

Jeudi 9 h, à trois. Nour rappelle le cadre, puis expose ce qu''elle a compris, de façon équilibrée.

NOUR : « Ce que j''ai compris : Camille a traité une urgence pendant les congés de Léa, l''outil a transféré le client, et personne ne s''est parlé au retour. Léa, tu as eu le sentiment qu''on te retirait deux ans de travail. Camille, tu as eu le sentiment d''être traitée en voleuse pour avoir fait ton travail. Et il n''y a pas de règle sur ce qu''on fait quand on remplace un collègue. Ça, c''est de ma responsabilité. Je vous propose que chacune dise à l''autre ce qui s''est passé pour elle, en quatre temps : ce qu''elle a observé, ce qu''elle a ressenti, ce dont elle a besoin, ce qu''elle demande. Léa ? »
LÉA : « Quand je suis rentrée, j''ai vu dans l''outil que Rousseau était dans ton portefeuille. J''ai été blessée, parce que je le suis depuis deux ans. J''ai besoin que mon travail soit reconnu. Je te demande de me prévenir quand tu traites un de mes clients. »
CAMILLE : « Je comprends. Quand tu es rentrée, tu ne m''as pas dit bonjour. J''ai été vexée, parce que j''avais traité une succession en urgence. J''ai besoin qu''on ne me prenne pas pour quelqu''un qui pique des clients. Je te demande de me parler quand quelque chose ne va pas, plutôt que de te taire. »
NOUR : « Qu''est-ce qu''on fait pour que ça fonctionne ? »
CAMILLE : « On peut remettre Rousseau dans le portefeuille de Léa. Je ne tiens pas à le garder. »
LÉA : « Et quand on remplace, on laisse un mot au retour. Un mail, deux lignes. »
NOUR : « Je fixe la règle pour l''agence : un client reçu pendant l''absence de son conseiller reste dans son portefeuille ; le remplaçant lui envoie un mail de passation. Je vais voir avec le siège pour le paramétrage de l''outil. »

## Étape 5 — Contractualiser et suivre

Trois engagements, reformulés à voix haute et notés : Camille remet le client Rousseau à Léa cette semaine ; toute passation fait l''objet d''un mail au retour ; Nour fixe la règle pour l''agence et voit le siège pour l''outil. Point dans deux semaines. Et Nour ajoute une chose : « Ce conflit vient d''une règle qui manquait. C''était à moi de la poser. » Ce n''est pas de la faiblesse ; c''est ce qui permet aux deux de sortir sans perdre la face.

Deux semaines plus tard, Léa et Camille se parlent. Pas comme des amies ; comme des collègues. C''est tout ce que Nour avait à obtenir.

## Ce qu''il faut retenir

Trois choses. D''abord : écouter séparément avant de réunir. La première tentative de Nour a échoué là. Ensuite : chercher la source dans l''organisation ; ici, une règle manquante, que le manager pose. Enfin : ne pas trancher entre les personnes, mais organiser leur échange, avec un format qui empêche les attaques, et conclure par des engagements suivis.

Et une quatrième : si Léa avait refusé l''entretien à trois, ou si les attaques avaient continué devant Nour, il aurait fallu un tiers. Passer la main est une décision de manager.

À tout de suite pour les situations difficiles : recadrer, sanctionner, alerter.

## Sources
méthode en cinq étapes (leçon 5.4) ; Rosenberg, communication non violente ; Fisher et Ury, positions et intérêts.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 6 and l.ordre = 5;
  n := n + 1;

  -- 5.6-situations-difficiles.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Toutes les tensions ne se résolvent pas par la méthode en cinq étapes. Certaines situations relèvent d''un autre registre : un comportement qui doit cesser, un refus d''obéir, une personne en souffrance, un soupçon de harcèlement. Dans ces situations, le manager de proximité doit savoir précisément ce qu''il fait, ce qu''il ne fait pas, et ce que dit la loi. Se tromper de registre, ou de procédure, coûte cher à la personne, à l''entreprise et au manager lui-même.

## Recadrage et sanction : deux choses différentes

Le recadrage est un acte de management. Il relève du manager de proximité. Vous l''avez vu au module 3 : des faits datés, la règle, l''écoute, l''attente, la conséquence annoncée, la trace. Il n''a pas de forme légale, il n''apparaît pas au dossier disciplinaire, il vise à faire cesser un comportement avant qu''il ne devienne une faute. Un rappel à l''ordre oral, un point de recadrage, une note factuelle dans le carnet du manager : ce n''est pas une sanction.

Attention à l''écrit. Un courriel ou une lettre adressé au salarié, qui lui reproche un comportement précis et lui enjoint de changer, peut être considéré par les juges comme un avertissement, donc comme une sanction (par exemple Cass. soc., 6 novembre 2019, n° 18-20.268). Conséquence : les mêmes faits ne pourront plus être sanctionnés une seconde fois, et la direction aura perdu la main. La trace du recadrage est donc une note interne, datée et factuelle, transmise à votre hiérarchie si besoin ; si vous voulez remettre un écrit au salarié, voyez d''abord avec la direction ou les RH.

La sanction disciplinaire est un acte de l''employeur. Le Code du travail la définit comme toute mesure, autre que les observations verbales, prise par l''employeur à la suite d''un agissement du salarié considéré comme fautif (art. L1331-1). Avertissement écrit, blâme, mise à pied disciplinaire, mutation ou rétrogradation disciplinaire, licenciement pour faute. Elle obéit à une procédure, elle est encadrée par le règlement intérieur quand il existe, et elle relève de l''employeur : le dirigeant, ou la personne à qui il a délégué ce pouvoir. Dans une petite entreprise, c''est le plus souvent le dirigeant lui-même. Si vous ne savez pas si vous avez reçu une délégation, posez la question : dans la plupart des cas, le manager de proximité ne sanctionne pas.

Les règles que le manager doit connaître, même s''il ne sanctionne pas lui-même :

- Les sanctions pécuniaires (amende, retenue sur salaire) sont interdites (L1331-2).
- Dans les entreprises d''au moins 50 salariés, le règlement intérieur est obligatoire (L1311-2, après douze mois consécutifs à ce seuil) et il fixe la nature et l''échelle des sanctions (L1321-1) ; une sanction qui n''y figure pas ne peut pas être prononcée (Cass. soc., 26 octobre 2010, n° 09-42.740). En dessous de ce seuil, un règlement intérieur reste possible et utile.
- Aucun fait fautif ne peut donner lieu à des poursuites disciplinaires au-delà de deux mois à compter du jour où l''employeur en a eu connaissance (L1332-4), sauf poursuites pénales engagées dans ce délai. Pour les juges, « l''employeur » inclut le supérieur hiérarchique direct, même s''il n''a pas le pouvoir de sanctionner (Cass. soc., 23 juin 2021, n° 20-13.762) : le délai court donc à partir du jour où vous, manager, avez su. Un manager qui « laisse passer » trois mois avant de remonter a rendu la sanction impossible pour ces faits. Seule exception utile : si le comportement s''est poursuivi ou répété dans les deux derniers mois, les faits plus anciens de même nature peuvent être pris en compte.
- Une sanction datant de plus de trois ans ne peut plus être invoquée à l''appui d''une nouvelle sanction (L1332-5).
- La sanction doit être proportionnée à la faute : le conseil de prud''hommes peut annuler une sanction disproportionnée (L1333-2). Et un même fait ne peut pas être sanctionné deux fois.
- Toute sanction, même un avertissement, est notifiée par écrit avec les griefs retenus (L1332-1).
- Pour toute sanction qui a une incidence sur la présence, la fonction, la carrière ou la rémunération (en pratique, tout sauf l''avertissement et le blâme), la procédure de l''article L1332-2 s''applique : convocation écrite précisant l''objet de l''entretien préalable, entretien où le salarié peut se faire assister par une personne de son choix appartenant au personnel de l''entreprise, puis notification écrite et motivée, au plus tôt deux jours ouvrables et au plus tard un mois après le jour fixé pour l''entretien. Pour un licenciement, s''ajoutent les règles propres au licenciement (notamment cinq jours ouvrables au moins entre la convocation et l''entretien, L1232-2).
- Quand les faits rendent indispensable d''écarter le salarié tout de suite (faute présumée grave), l''employeur peut prononcer une mise à pied conservatoire, en attendant la procédure (L1332-3). C''est une décision de l''employeur, pas du manager.

Dans une procédure disciplinaire, le rôle du manager de proximité est limité, mais il pèse. Ce qu''il fait : remonter vite (le délai de deux mois court déjà), fournir à l''employeur les faits datés et précis, avec les recadrages déjà faits et leur trace, les noms des témoins ; assister à l''entretien préalable si l''employeur le lui demande. Ce qu''il ne fait pas : annoncer lui-même une sanction qu''il n''a pas le pouvoir de prononcer, menacer (« tu vas prendre un avertissement »), en parler à l''équipe. Après la sanction, il reprend le management de la personne sans acharnement ni évitement : la sanction doit permettre de repartir.

## Les trois catégories d''erreur, et la faute

Le podcast 4.8 distinguait l''erreur d''apprentissage, l''erreur d''inattention et la faute délibérée. Cette distinction guide le registre :

- L''erreur d''apprentissage se traite par le retour d''expérience et l''accompagnement (module 4). Jamais par le recadrage.
- L''erreur d''inattention se traite par le feedback (module 3), puis, si elle se répète malgré les retours, par le recadrage.
- La faute délibérée (contournement d''une règle en connaissance de cause, notamment de sécurité ; comportement inacceptable envers un collègue ou un client ; refus d''exécuter une consigne légitime) se traite par le recadrage immédiat et, selon la gravité, par la remontée à l''employeur pour sanction.

Le manager qui confond les registres fait deux dégâts : il sanctionne l''apprentissage (et détruit la sécurité psychologique), ou il « accompagne » la faute délibérée (et détruit la règle).

## L''insubordination

Un salarié doit exécuter les consignes de l''employeur qui entrent dans le cadre de son contrat et qui sont légitimes. Le refus d''obéir à une consigne légitime est une faute. Mais trois cas font exception, et le manager doit les connaître :

- L''ordre illégal ou contraire à la dignité : un salarié n''a pas à exécuter un ordre qui l''expose à commettre une infraction ou qui porte atteinte à ses droits fondamentaux.
- Le danger grave et imminent : le salarié alerte immédiatement l''employeur de toute situation de travail dont il a un motif raisonnable de penser qu''elle présente un danger grave et imminent pour sa vie ou sa santé, et il peut se retirer de cette situation (L4131-1). Aucune sanction et aucune retenue de salaire ne peuvent être prises contre lui si ce motif était raisonnable (L4131-3), même si le danger n''est finalement pas avéré.
- La consigne hors contrat : une tâche sans rapport avec la qualification, ou une modification du contrat lui-même (rémunération, qualification, durée du travail, par exemple) sans l''accord du salarié. Nuance : un simple changement des conditions de travail (horaires dans la journée, lieu dans le même secteur géographique, en l''absence de clause contraire) relève du pouvoir de direction de l''employeur, et le refus peut alors être fautif. En cas de doute, c''est une question pour la direction ou les RH, pas une décision à prendre seul.

Face à un refus, le manager ne s''emporte pas et ne tranche pas sur le moment. Il demande la raison (« qu''est-ce qui fait que tu refuses ? »), il note, et il vérifie : si la raison est un danger ou une illégalité, il a lui-même un problème à traiter ; si c''est un refus pur et simple, il recadre (rappel de la consigne, de sa légitimité, de la conséquence), et il remonte. Un refus délibéré d''une consigne légitime est une faute, d''autant plus s''il se répète ; un refus isolé peut aussi cacher une cause à comprendre.

Si le salarié invoque son droit de retrait, le manager ne le conteste pas sur le moment, même s''il le juge infondé. Il prend acte, met la situation en sécurité, informe l''employeur sans délai, et c''est l''employeur qui examine la situation (avec le CSE quand il existe) et décide de la suite. Le droit de retrait est parfois invoqué face à des violences ou à un harcèlement ; sa légitimité s''apprécie au cas par cas, et le juge tranche en cas de litige.

## Le collaborateur en souffrance

Quand la difficulté d''une personne n''est pas un comportement fautif mais une souffrance (épuisement, détresse, addiction, difficulté personnelle qui déborde), le registre disciplinaire est le mauvais. Vous avez vu à la leçon 4.7 ce que fait le manager : voir, écouter sans creuser, agir sur le travail, orienter vers le médecin du travail, alerter la hiérarchie, suivre.

Deux points à ajouter. D''abord, souffrance et faute peuvent coexister : un salarié épuisé peut commettre une faute. On traite les deux, séparément, et on ne se sert pas de la souffrance pour excuser une faute grave ni de la faute pour ignorer la souffrance. Ensuite, certaines situations exigent d''agir sans attendre la volonté de la personne : un salarié manifestement sous l''emprise d''alcool ou de stupéfiants à un poste dangereux doit être retiré du poste immédiatement (obligation de sécurité de l''employeur, L4121-1), ne doit pas reprendre le volant, doit être raccompagné, et l''employeur informé ; si son état paraît inquiétant, on appelle le 15. Le règlement intérieur, quand il existe, précise souvent la procédure (contrôle, personnes habilitées).

## Le soupçon de harcèlement ou de violence

C''est la situation où le manager a le moins le droit à l''erreur. Les définitions légales, d''abord, parce que le mot « harcèlement » est employé à tort et à travers :

- Le harcèlement moral : des agissements répétés qui ont pour objet ou pour effet une dégradation des conditions de travail susceptible de porter atteinte aux droits et à la dignité du salarié, d''altérer sa santé physique ou mentale ou de compromettre son avenir professionnel (L1152-1).
- Le harcèlement sexuel : des propos ou comportements à connotation sexuelle ou sexiste répétés, qui portent atteinte à la dignité de la personne parce qu''ils sont dégradants ou humiliants, ou qui créent contre elle une situation intimidante, hostile ou offensante. Est assimilée au harcèlement sexuel toute pression grave, même non répétée, exercée dans le but d''obtenir un acte de nature sexuelle (L1153-1).
- L''agissement sexiste : tout agissement lié au sexe d''une personne, qui a pour objet ou pour effet de porter atteinte à sa dignité ou de créer un environnement intimidant, hostile, dégradant, humiliant ou offensant (L1142-2-1).

Ces agissements sont interdits, comme toute violence physique ou verbale, quel qu''en soit l''auteur : collègue, supérieur, mais aussi client ou fournisseur. L''employeur doit prévenir le harcèlement moral (L1152-4) et, au titre de son obligation de sécurité (L4121-1), y mettre fin ; pour le harcèlement sexuel, le texte dit expressément qu''il doit le prévenir, y mettre un terme et le sanctionner (L1153-5). L''auteur de harcèlement est passible d''une sanction disciplinaire (L1152-5, L1153-6). Dès qu''il est informé, l''employeur doit réagir : faire établir les faits, protéger, sanctionner si les faits sont établis. Ne pas mener d''enquête après un signalement est en soi un manquement à son obligation de prévention, même si le harcèlement n''est finalement pas établi (Cass. soc., 27 novembre 2019, n° 18-10.551).

Ce que fait le manager qui reçoit une plainte, ou qui constate des faits :

1. Il prend au sérieux, sans juger de la véracité : « Merci de me l''avoir dit. Je vais faire ce qu''il faut. » Il ne dit ni « c''est sûrement un malentendu » ni « il va payer ».
2. Il note ce qui lui est dit, avec les mots de la personne, la date, les faits décrits.
3. Il informe sans délai l''employeur (direction, RH) : ce n''est pas une option, c''est l''obligation d''agir de l''employeur qu''il déclenche. Il indique à la personne qu''il le fait, et vers qui.
4. Il protège : si la personne le demande ou si la situation l''exige, il prend les mesures d''organisation immédiates à sa portée (ne pas laisser seuls la personne et l''auteur présumé, aménager les horaires), sans pénaliser la personne qui a parlé.
5. Il oriente vers les relais qui existent dans l''entreprise : le référent en matière de harcèlement sexuel et d''agissements sexistes désigné par le CSE (obligatoire dès qu''il y a un CSE, donc en pratique à partir de 11 salariés, L2314-1), celui que l''employeur doit désigner dans les entreprises d''au moins 250 salariés (L1153-5-1), les autres représentants du personnel, le médecin du travail ; et, à l''extérieur, l''inspection du travail, le Défenseur des droits, une association d''aide aux victimes. La personne reste libre de porter plainte.
6. Il ne mène pas l''enquête lui-même et ne confronte pas les personnes : l''enquête est organisée par l''employeur, souvent avec un membre du CSE ou un tiers extérieur, pour entendre chacun de façon confidentielle et impartiale. Il y contribue si on le lui demande. Il ne propose pas non plus une « médiation » entre la personne qui se plaint et l''auteur présumé à ce stade (voir la leçon 5.4).
7. Il garde la confidentialité : ni l''équipe, ni les autres managers, ni le café.

Le salarié qui relate ou témoigne de bonne foi de faits de harcèlement est protégé contre toute sanction et toute mesure de rétorsion (L1152-2, L1153-3). Le manager qui témoigne l''est aussi. Le manager qui, informé, ne fait rien, engage la responsabilité de l''employeur et peut engager la sienne, au moins sur le plan disciplinaire.

Si les faits impliquent le manager lui-même comme auteur présumé, le circuit est le même, par-dessus lui : la personne s''adresse à la hiérarchie supérieure, aux RH, au référent, au CSE. Si les faits impliquent la hiérarchie du manager, le manager remonte au niveau supérieur, ou se tourne vers le CSE ou l''inspection du travail.

## Alerter : le geste du manager

Dans toutes ces situations, on retrouve le même geste : alerter, c''est-à-dire informer par écrit, à temps, la personne qui a le pouvoir d''agir. Un manager de proximité qui a recadré, tracé, et alerté sa hiérarchie a fait son travail, même si la situation ne se règle pas. Un manager qui a « géré seul » pendant des mois, sans trace, a pris sur lui une responsabilité qui n''est pas la sienne, et souvent laissé passer le délai de deux mois.

Vos outils : le gabarit 5 de la fiche 3.9 (alerte à la hiérarchie) et le gabarit 3 (recadrage). Une règle de conduite que nous vous recommandons (ce n''est pas un délai légal) : jamais plus de 48 heures entre un fait grave et son signalement écrit ; pour un soupçon de harcèlement ou de violence, le jour même.

## Le cas Garnier

Lucas, l''apprenti, a été surpris par Thierry à utiliser la ponceuse sans lunettes, pour la troisième fois. Erreur d''apprentissage ? Non : la consigne a été donnée, rappelée, et Lucas l''a reconnue. Le port des équipements de protection fait partie des obligations du salarié lui-même (L4122-1). Karim recadre le jour même, dans le bureau : faits, règle (et pourquoi : la projection dans l''œil), écoute (« j''y pense pas, ça me gêne pour voir »), attente (« lunettes à chaque usage, sans exception ; on essaie un autre modèle demain »), conséquence (« si ça se reproduit, j''en informe Michel, et ça peut donner lieu à une sanction »), trace, point dans une semaine. Sa trace est une note interne, pas un courriel de reproches à Lucas. Il informe Michel par écrit ce soir-là, pour qu''il sache et que le délai de deux mois ne joue pas contre l''entreprise. Une quatrième fois, Karim remonterait les faits à Michel pour une éventuelle sanction, et le registre changerait.

Nadia vient voir Karim, tendue : depuis deux semaines, un client de flotte, qui passe souvent, fait des remarques sur son physique et lui a touché l''épaule en insistant. Karim : « Merci de me l''avoir dit. C''est inacceptable et je vais faire ce qu''il faut. » Il note les faits avec ses mots. Il informe Michel le jour même, par écrit, en demandant que Michel entende Nadia, reçoive le client pour lui signifier que ce comportement cesse, et que Nadia ne soit plus seule à le recevoir ; d''ici là, Sophie ou Karim sont présents à chaque restitution de ce client. Il indique à Nadia qu''elle peut aussi en parler au médecin du travail ou à l''inspection du travail, qu''elle reste libre de porter plainte, et qu''elle est protégée pour avoir parlé. Avec neuf salariés, l''atelier n''a ni CSE ni référent : les relais sont Michel, le service de prévention et de santé au travail, l''inspection du travail. Karim n''en parle à personne d''autre. Michel entend Nadia, puis reçoit le client la semaine suivante ; les remarques cessent. Si Michel n''avait rien fait, Karim le lui aurait dit, puis aurait aidé Nadia à saisir l''inspection du travail.

## À retenir

- Recadrage (manager, acte de management, trace interne) et sanction (employeur, procédure L1332-1 et suivants, règlement intérieur, délai de deux mois qui court dès que le manager sait, proportionnalité) sont deux registres distincts. Un écrit de reproches remis au salarié peut valoir avertissement.
- Erreur d''apprentissage : accompagner. Erreur d''inattention : feedback, puis recadrage si répétition. Faute délibérée : recadrage et remontée.
- Insubordination : le refus d''une consigne légitime est une faute, sauf ordre illégal, danger grave et imminent (droit de retrait, L4131-1) ou modification du contrat sans accord. Demander la raison avant de conclure ; ne pas contester sur le moment un droit de retrait, informer l''employeur.
- Collaborateur en souffrance : registre de la leçon 4.7 ; souffrance et faute se traitent séparément ; un salarié en état dangereux est retiré du poste immédiatement.
- Harcèlement ou violence : prendre au sérieux, noter, informer l''employeur sans délai, protéger, orienter (référents quand ils existent, médecin du travail, CSE, inspection), ne pas enquêter soi-même, garder la confidentialité. L''employeur doit faire établir les faits. La personne qui parle de bonne foi est protégée.
- Alerter par écrit, à temps : notre règle, jamais plus de 48 heures pour un fait grave, le jour même pour un soupçon de harcèlement.

## Sources

- Code du travail : L1311-2, L1321-1, L1331-1, L1331-2, L1332-1 à L1332-5, L1333-2, L1232-2 (discipline) ; L4121-1, L4122-1, L4131-1 et L4131-3 (sécurité, droit de retrait) ; L1152-1 à L1152-6, L1153-1 à L1153-6, L1142-2-1, L1153-5-1, L2314-1 (harcèlement, agissements sexistes, référents), legifrance.gouv.fr.
- Cour de cassation, chambre sociale : 6 novembre 2019, n° 18-20.268 (lettre de reproches valant avertissement) ; 26 octobre 2010, n° 09-42.740 (sanction non prévue au règlement intérieur) ; 27 novembre 2019, n° 18-10.551 (absence d''enquête après signalement) ; 23 juin 2021, n° 20-13.762 (connaissance des faits par le supérieur hiérarchique).
- Ministère du Travail, fiche « La sanction disciplinaire », code.travail.gouv.fr ; guide *Harcèlement sexuel et agissements sexistes au travail : prévenir, agir, sanctionner*, 2019.
- INRS, dossier « Harcèlement moral et violence interne », inrs.fr.
- Défenseur des droits, defenseurdesdroits.fr.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Toutes les tensions ne se résolvent pas par la méthode en cinq étapes. Certaines situations relèvent d''un autre registre : un comportement qui doit cesser, un refus d''obéir, une personne en souffrance, un soupçon de harcèlement. Dans ces situations, le manager de proximité doit savoir précisément ce qu''il fait, ce qu''il ne fait pas, et ce que dit la loi. Se tromper de registre, ou de procédure, coûte cher à la personne, à l''entreprise et au manager lui-même.

## Recadrage et sanction : deux choses différentes

Le recadrage est un acte de management. Il relève du manager de proximité. Vous l''avez vu au module 3 : des faits datés, la règle, l''écoute, l''attente, la conséquence annoncée, la trace. Il n''a pas de forme légale, il n''apparaît pas au dossier disciplinaire, il vise à faire cesser un comportement avant qu''il ne devienne une faute. Un rappel à l''ordre oral, un point de recadrage, une note factuelle dans le carnet du manager : ce n''est pas une sanction.

Attention à l''écrit. Un courriel ou une lettre adressé au salarié, qui lui reproche un comportement précis et lui enjoint de changer, peut être considéré par les juges comme un avertissement, donc comme une sanction (par exemple Cass. soc., 6 novembre 2019, n° 18-20.268). Conséquence : les mêmes faits ne pourront plus être sanctionnés une seconde fois, et la direction aura perdu la main. La trace du recadrage est donc une note interne, datée et factuelle, transmise à votre hiérarchie si besoin ; si vous voulez remettre un écrit au salarié, voyez d''abord avec la direction ou les RH.

La sanction disciplinaire est un acte de l''employeur. Le Code du travail la définit comme toute mesure, autre que les observations verbales, prise par l''employeur à la suite d''un agissement du salarié considéré comme fautif (art. L1331-1). Avertissement écrit, blâme, mise à pied disciplinaire, mutation ou rétrogradation disciplinaire, licenciement pour faute. Elle obéit à une procédure, elle est encadrée par le règlement intérieur quand il existe, et elle relève de l''employeur : le dirigeant, ou la personne à qui il a délégué ce pouvoir. Dans une petite entreprise, c''est le plus souvent le dirigeant lui-même. Si vous ne savez pas si vous avez reçu une délégation, posez la question : dans la plupart des cas, le manager de proximité ne sanctionne pas.

Les règles que le manager doit connaître, même s''il ne sanctionne pas lui-même :

- Les sanctions pécuniaires (amende, retenue sur salaire) sont interdites (L1331-2).
- Dans les entreprises d''au moins 50 salariés, le règlement intérieur est obligatoire (L1311-2, après douze mois consécutifs à ce seuil) et il fixe la nature et l''échelle des sanctions (L1321-1) ; une sanction qui n''y figure pas ne peut pas être prononcée (Cass. soc., 26 octobre 2010, n° 09-42.740). En dessous de ce seuil, un règlement intérieur reste possible et utile.
- Aucun fait fautif ne peut donner lieu à des poursuites disciplinaires au-delà de deux mois à compter du jour où l''employeur en a eu connaissance (L1332-4), sauf poursuites pénales engagées dans ce délai. Pour les juges, « l''employeur » inclut le supérieur hiérarchique direct, même s''il n''a pas le pouvoir de sanctionner (Cass. soc., 23 juin 2021, n° 20-13.762) : le délai court donc à partir du jour où vous, manager, avez su. Un manager qui « laisse passer » trois mois avant de remonter a rendu la sanction impossible pour ces faits. Seule exception utile : si le comportement s''est poursuivi ou répété dans les deux derniers mois, les faits plus anciens de même nature peuvent être pris en compte.
- Une sanction datant de plus de trois ans ne peut plus être invoquée à l''appui d''une nouvelle sanction (L1332-5).
- La sanction doit être proportionnée à la faute : le conseil de prud''hommes peut annuler une sanction disproportionnée (L1333-2). Et un même fait ne peut pas être sanctionné deux fois.
- Toute sanction, même un avertissement, est notifiée par écrit avec les griefs retenus (L1332-1).
- Pour toute sanction qui a une incidence sur la présence, la fonction, la carrière ou la rémunération (en pratique, tout sauf l''avertissement et le blâme), la procédure de l''article L1332-2 s''applique : convocation écrite précisant l''objet de l''entretien préalable, entretien où le salarié peut se faire assister par une personne de son choix appartenant au personnel de l''entreprise, puis notification écrite et motivée, au plus tôt deux jours ouvrables et au plus tard un mois après le jour fixé pour l''entretien. Pour un licenciement, s''ajoutent les règles propres au licenciement (notamment cinq jours ouvrables au moins entre la convocation et l''entretien, L1232-2).
- Quand les faits rendent indispensable d''écarter le salarié tout de suite (faute présumée grave), l''employeur peut prononcer une mise à pied conservatoire, en attendant la procédure (L1332-3). C''est une décision de l''employeur, pas du manager.

Dans une procédure disciplinaire, le rôle du manager de proximité est limité, mais il pèse. Ce qu''il fait : remonter vite (le délai de deux mois court déjà), fournir à l''employeur les faits datés et précis, avec les recadrages déjà faits et leur trace, les noms des témoins ; assister à l''entretien préalable si l''employeur le lui demande. Ce qu''il ne fait pas : annoncer lui-même une sanction qu''il n''a pas le pouvoir de prononcer, menacer (« tu vas prendre un avertissement »), en parler à l''équipe. Après la sanction, il reprend le management de la personne sans acharnement ni évitement : la sanction doit permettre de repartir.

## Les trois catégories d''erreur, et la faute

Le podcast 4.8 distinguait l''erreur d''apprentissage, l''erreur d''inattention et la faute délibérée. Cette distinction guide le registre :

- L''erreur d''apprentissage se traite par le retour d''expérience et l''accompagnement (module 4). Jamais par le recadrage.
- L''erreur d''inattention se traite par le feedback (module 3), puis, si elle se répète malgré les retours, par le recadrage.
- La faute délibérée (contournement d''une règle en connaissance de cause, notamment de sécurité ; comportement inacceptable envers un collègue ou un client ; refus d''exécuter une consigne légitime) se traite par le recadrage immédiat et, selon la gravité, par la remontée à l''employeur pour sanction.

Le manager qui confond les registres fait deux dégâts : il sanctionne l''apprentissage (et détruit la sécurité psychologique), ou il « accompagne » la faute délibérée (et détruit la règle).

## L''insubordination

Un salarié doit exécuter les consignes de l''employeur qui entrent dans le cadre de son contrat et qui sont légitimes. Le refus d''obéir à une consigne légitime est une faute. Mais trois cas font exception, et le manager doit les connaître :

- L''ordre illégal ou contraire à la dignité : un salarié n''a pas à exécuter un ordre qui l''expose à commettre une infraction ou qui porte atteinte à ses droits fondamentaux.
- Le danger grave et imminent : le salarié alerte immédiatement l''employeur de toute situation de travail dont il a un motif raisonnable de penser qu''elle présente un danger grave et imminent pour sa vie ou sa santé, et il peut se retirer de cette situation (L4131-1). Aucune sanction et aucune retenue de salaire ne peuvent être prises contre lui si ce motif était raisonnable (L4131-3), même si le danger n''est finalement pas avéré.
- La consigne hors contrat : une tâche sans rapport avec la qualification, ou une modification du contrat lui-même (rémunération, qualification, durée du travail, par exemple) sans l''accord du salarié. Nuance : un simple changement des conditions de travail (horaires dans la journée, lieu dans le même secteur géographique, en l''absence de clause contraire) relève du pouvoir de direction de l''employeur, et le refus peut alors être fautif. En cas de doute, c''est une question pour la direction ou les RH, pas une décision à prendre seul.

Face à un refus, le manager ne s''emporte pas et ne tranche pas sur le moment. Il demande la raison (« qu''est-ce qui fait que tu refuses ? »), il note, et il vérifie : si la raison est un danger ou une illégalité, il a lui-même un problème à traiter ; si c''est un refus pur et simple, il recadre (rappel de la consigne, de sa légitimité, de la conséquence), et il remonte. Un refus délibéré d''une consigne légitime est une faute, d''autant plus s''il se répète ; un refus isolé peut aussi cacher une cause à comprendre.

Si le salarié invoque son droit de retrait, le manager ne le conteste pas sur le moment, même s''il le juge infondé. Il prend acte, met la situation en sécurité, informe l''employeur sans délai, et c''est l''employeur qui examine la situation (avec le CSE quand il existe) et décide de la suite. Le droit de retrait est parfois invoqué face à des violences ou à un harcèlement ; sa légitimité s''apprécie au cas par cas, et le juge tranche en cas de litige.

## Le collaborateur en souffrance

Quand la difficulté d''une personne n''est pas un comportement fautif mais une souffrance (épuisement, détresse, addiction, difficulté personnelle qui déborde), le registre disciplinaire est le mauvais. Vous avez vu à la leçon 4.7 ce que fait le manager : voir, écouter sans creuser, agir sur le travail, orienter vers le médecin du travail, alerter la hiérarchie, suivre.

Deux points à ajouter. D''abord, souffrance et faute peuvent coexister : un salarié épuisé peut commettre une faute. On traite les deux, séparément, et on ne se sert pas de la souffrance pour excuser une faute grave ni de la faute pour ignorer la souffrance. Ensuite, certaines situations exigent d''agir sans attendre la volonté de la personne : un salarié manifestement sous l''emprise d''alcool ou de stupéfiants à un poste dangereux doit être retiré du poste immédiatement (obligation de sécurité de l''employeur, L4121-1), ne doit pas reprendre le volant, doit être raccompagné, et l''employeur informé ; si son état paraît inquiétant, on appelle le 15. Le règlement intérieur, quand il existe, précise souvent la procédure (contrôle, personnes habilitées).

## Le soupçon de harcèlement ou de violence

C''est la situation où le manager a le moins le droit à l''erreur. Les définitions légales, d''abord, parce que le mot « harcèlement » est employé à tort et à travers :

- Le harcèlement moral : des agissements répétés qui ont pour objet ou pour effet une dégradation des conditions de travail susceptible de porter atteinte aux droits et à la dignité du salarié, d''altérer sa santé physique ou mentale ou de compromettre son avenir professionnel (L1152-1).
- Le harcèlement sexuel : des propos ou comportements à connotation sexuelle ou sexiste répétés, qui portent atteinte à la dignité de la personne parce qu''ils sont dégradants ou humiliants, ou qui créent contre elle une situation intimidante, hostile ou offensante. Est assimilée au harcèlement sexuel toute pression grave, même non répétée, exercée dans le but d''obtenir un acte de nature sexuelle (L1153-1).
- L''agissement sexiste : tout agissement lié au sexe d''une personne, qui a pour objet ou pour effet de porter atteinte à sa dignité ou de créer un environnement intimidant, hostile, dégradant, humiliant ou offensant (L1142-2-1).

Ces agissements sont interdits, comme toute violence physique ou verbale, quel qu''en soit l''auteur : collègue, supérieur, mais aussi client ou fournisseur. L''employeur doit prévenir le harcèlement moral (L1152-4) et, au titre de son obligation de sécurité (L4121-1), y mettre fin ; pour le harcèlement sexuel, le texte dit expressément qu''il doit le prévenir, y mettre un terme et le sanctionner (L1153-5). L''auteur de harcèlement est passible d''une sanction disciplinaire (L1152-5, L1153-6). Dès qu''il est informé, l''employeur doit réagir : faire établir les faits, protéger, sanctionner si les faits sont établis. Ne pas mener d''enquête après un signalement est en soi un manquement à son obligation de prévention, même si le harcèlement n''est finalement pas établi (Cass. soc., 27 novembre 2019, n° 18-10.551).

Ce que fait le manager qui reçoit une plainte, ou qui constate des faits :

1. Il prend au sérieux, sans juger de la véracité : « Merci de me l''avoir dit. Je vais faire ce qu''il faut. » Il ne dit ni « c''est sûrement un malentendu » ni « il va payer ».
2. Il note ce qui lui est dit, avec les mots de la personne, la date, les faits décrits.
3. Il informe sans délai l''employeur (direction, RH) : ce n''est pas une option, c''est l''obligation d''agir de l''employeur qu''il déclenche. Il indique à la personne qu''il le fait, et vers qui.
4. Il protège : si la personne le demande ou si la situation l''exige, il prend les mesures d''organisation immédiates à sa portée (ne pas laisser seuls la personne et l''auteur présumé, aménager les horaires), sans pénaliser la personne qui a parlé.
5. Il oriente vers les relais qui existent dans l''entreprise : le référent en matière de harcèlement sexuel et d''agissements sexistes désigné par le CSE (obligatoire dès qu''il y a un CSE, donc en pratique à partir de 11 salariés, L2314-1), celui que l''employeur doit désigner dans les entreprises d''au moins 250 salariés (L1153-5-1), les autres représentants du personnel, le médecin du travail ; et, à l''extérieur, l''inspection du travail, le Défenseur des droits, une association d''aide aux victimes. La personne reste libre de porter plainte.
6. Il ne mène pas l''enquête lui-même et ne confronte pas les personnes : l''enquête est organisée par l''employeur, souvent avec un membre du CSE ou un tiers extérieur, pour entendre chacun de façon confidentielle et impartiale. Il y contribue si on le lui demande. Il ne propose pas non plus une « médiation » entre la personne qui se plaint et l''auteur présumé à ce stade (voir la leçon 5.4).
7. Il garde la confidentialité : ni l''équipe, ni les autres managers, ni le café.

Le salarié qui relate ou témoigne de bonne foi de faits de harcèlement est protégé contre toute sanction et toute mesure de rétorsion (L1152-2, L1153-3). Le manager qui témoigne l''est aussi. Le manager qui, informé, ne fait rien, engage la responsabilité de l''employeur et peut engager la sienne, au moins sur le plan disciplinaire.

Si les faits impliquent le manager lui-même comme auteur présumé, le circuit est le même, par-dessus lui : la personne s''adresse à la hiérarchie supérieure, aux RH, au référent, au CSE. Si les faits impliquent la hiérarchie du manager, le manager remonte au niveau supérieur, ou se tourne vers le CSE ou l''inspection du travail.

## Alerter : le geste du manager

Dans toutes ces situations, on retrouve le même geste : alerter, c''est-à-dire informer par écrit, à temps, la personne qui a le pouvoir d''agir. Un manager de proximité qui a recadré, tracé, et alerté sa hiérarchie a fait son travail, même si la situation ne se règle pas. Un manager qui a « géré seul » pendant des mois, sans trace, a pris sur lui une responsabilité qui n''est pas la sienne, et souvent laissé passer le délai de deux mois.

Vos outils : le gabarit 5 de la fiche 3.9 (alerte à la hiérarchie) et le gabarit 3 (recadrage). Une règle de conduite que nous vous recommandons (ce n''est pas un délai légal) : jamais plus de 48 heures entre un fait grave et son signalement écrit ; pour un soupçon de harcèlement ou de violence, le jour même.

## Le cas Garnier

Lucas, l''apprenti, a été surpris par Thierry à utiliser la ponceuse sans lunettes, pour la troisième fois. Erreur d''apprentissage ? Non : la consigne a été donnée, rappelée, et Lucas l''a reconnue. Le port des équipements de protection fait partie des obligations du salarié lui-même (L4122-1). Karim recadre le jour même, dans le bureau : faits, règle (et pourquoi : la projection dans l''œil), écoute (« j''y pense pas, ça me gêne pour voir »), attente (« lunettes à chaque usage, sans exception ; on essaie un autre modèle demain »), conséquence (« si ça se reproduit, j''en informe Michel, et ça peut donner lieu à une sanction »), trace, point dans une semaine. Sa trace est une note interne, pas un courriel de reproches à Lucas. Il informe Michel par écrit ce soir-là, pour qu''il sache et que le délai de deux mois ne joue pas contre l''entreprise. Une quatrième fois, Karim remonterait les faits à Michel pour une éventuelle sanction, et le registre changerait.

Nadia vient voir Karim, tendue : depuis deux semaines, un client de flotte, qui passe souvent, fait des remarques sur son physique et lui a touché l''épaule en insistant. Karim : « Merci de me l''avoir dit. C''est inacceptable et je vais faire ce qu''il faut. » Il note les faits avec ses mots. Il informe Michel le jour même, par écrit, en demandant que Michel entende Nadia, reçoive le client pour lui signifier que ce comportement cesse, et que Nadia ne soit plus seule à le recevoir ; d''ici là, Sophie ou Karim sont présents à chaque restitution de ce client. Il indique à Nadia qu''elle peut aussi en parler au médecin du travail ou à l''inspection du travail, qu''elle reste libre de porter plainte, et qu''elle est protégée pour avoir parlé. Avec neuf salariés, l''atelier n''a ni CSE ni référent : les relais sont Michel, le service de prévention et de santé au travail, l''inspection du travail. Karim n''en parle à personne d''autre. Michel entend Nadia, puis reçoit le client la semaine suivante ; les remarques cessent. Si Michel n''avait rien fait, Karim le lui aurait dit, puis aurait aidé Nadia à saisir l''inspection du travail.

## À retenir

- Recadrage (manager, acte de management, trace interne) et sanction (employeur, procédure L1332-1 et suivants, règlement intérieur, délai de deux mois qui court dès que le manager sait, proportionnalité) sont deux registres distincts. Un écrit de reproches remis au salarié peut valoir avertissement.
- Erreur d''apprentissage : accompagner. Erreur d''inattention : feedback, puis recadrage si répétition. Faute délibérée : recadrage et remontée.
- Insubordination : le refus d''une consigne légitime est une faute, sauf ordre illégal, danger grave et imminent (droit de retrait, L4131-1) ou modification du contrat sans accord. Demander la raison avant de conclure ; ne pas contester sur le moment un droit de retrait, informer l''employeur.
- Collaborateur en souffrance : registre de la leçon 4.7 ; souffrance et faute se traitent séparément ; un salarié en état dangereux est retiré du poste immédiatement.
- Harcèlement ou violence : prendre au sérieux, noter, informer l''employeur sans délai, protéger, orienter (référents quand ils existent, médecin du travail, CSE, inspection), ne pas enquêter soi-même, garder la confidentialité. L''employeur doit faire établir les faits. La personne qui parle de bonne foi est protégée.
- Alerter par écrit, à temps : notre règle, jamais plus de 48 heures pour un fait grave, le jour même pour un soupçon de harcèlement.

## Sources

- Code du travail : L1311-2, L1321-1, L1331-1, L1331-2, L1332-1 à L1332-5, L1333-2, L1232-2 (discipline) ; L4121-1, L4122-1, L4131-1 et L4131-3 (sécurité, droit de retrait) ; L1152-1 à L1152-6, L1153-1 à L1153-6, L1142-2-1, L1153-5-1, L2314-1 (harcèlement, agissements sexistes, référents), legifrance.gouv.fr.
- Cour de cassation, chambre sociale : 6 novembre 2019, n° 18-20.268 (lettre de reproches valant avertissement) ; 26 octobre 2010, n° 09-42.740 (sanction non prévue au règlement intérieur) ; 27 novembre 2019, n° 18-10.551 (absence d''enquête après signalement) ; 23 juin 2021, n° 20-13.762 (connaissance des faits par le supérieur hiérarchique).
- Ministère du Travail, fiche « La sanction disciplinaire », code.travail.gouv.fr ; guide *Harcèlement sexuel et agissements sexistes au travail : prévenir, agir, sanctionner*, 2019.
- INRS, dossier « Harcèlement moral et violence interne », inrs.fr.
- Défenseur des droits, defenseurdesdroits.fr.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 6 and l.ordre = 6;
  n := n + 1;

  -- 5.7-podcast-le-conflit-que-jai-laisse-pourrir.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Version écrite de l''épisode (le texte de référence ; l''enregistrement peut le formuler autrement).

Conversation entre Claire, animatrice IDEAFORMA et Patrice, responsable d''un magasin de bricolage (24 salariés), en poste depuis huit ans, ancien chef de rayon (personnage fictif).

**Claire** — Bonjour à tous. Dans ce podcast, un retour d''expérience sur ce que la plupart des managers ont vécu au moins une fois : un conflit qu''on a vu venir, et qu''on a laissé pourrir. Patrice, vous dirigez un magasin de bricolage depuis huit ans. Vous m''avez dit que cette histoire vous avait appris plus que toutes les formations. Racontez-nous le début.

**Patrice** — Le début, c''est deux chefs de rayon. Appelons-les Bruno et Sandra. Bruno, quinze ans de maison, le rayon outillage, quelqu''un de très compétent et de très sûr de lui. Sandra, arrivée trois ans plus tôt, le rayon jardin, plus jeune, très organisée, très à l''aise avec les outils informatiques. Au début, ils s''entendaient. Et puis on a changé le logiciel de gestion des stocks.

**Claire** — Et là ?

**Patrice** — Sandra a pris le logiciel en main en une semaine. Bruno a détesté, il a continué à faire ses commandes à sa façon, et il y a eu des erreurs de stock. Sandra, en réunion, a dit quelque chose comme : « Si tout le monde utilisait l''outil, on n''aurait pas ces problèmes. » Devant tout le monde. Bruno l''a pris pour lui. Et c''est parti de là.

**Claire** — Qu''est-ce que vous avez fait à ce moment-là ?

**Patrice** — Rien. Je me suis dit : c''est une remarque, il va digérer, ils sont adultes. Vous voyez, c''est exactement le niveau 1 de ce que votre formation appelle l''escalier de Glasl. Une crispation. Une heure de conversation aurait suffi. Je ne l''ai pas prise.

**Claire** — Et ensuite ?

**Patrice** — Ensuite, ça a descendu marche par marche, sur presque un an. D''abord les piques en réunion, dans les deux sens. Bruno qui parlait des « gens qui ne connaissent pas le terrain », Sandra qui parlait des « gens qui refusent d''évoluer ». Niveau 2, la polémique. Je trouvais ça pénible, mais je ne voyais pas un conflit ; je voyais deux caractères.

**Claire** — C''est le biais dont parle la formation : attribuer à la personnalité ce qui vient de la situation.

**Patrice** — Exactement. Et la situation, c''était quoi ? Un changement d''outil mal accompagné, et une répartition des rôles que je n''avais pas clarifiée : qui était référent sur le logiciel ? Personne. Sandra l''était de fait, Bruno ne le supportait pas, et moi je n''avais rien décidé.

**Claire** — Quand est-ce que ça a basculé ?

**Patrice** — Au niveau 3, quand ils ont arrêté de se parler. Ils communiquaient par les vendeurs. « Dis à Sandra que… » Et puis au niveau 4, ils ont commencé à recruter. Chacun avait ses vendeurs. Le magasin s''est coupé en deux, l''outillage et le jardin, avec le rayon décoration au milieu qui ne savait plus à qui parler. J''ai vu des vendeurs se lever de table à la pause quand un vendeur de l''autre camp s''asseyait.

**Claire** — Et vous, pendant ce temps ?

**Patrice** — Je faisais ce que font beaucoup de managers : je compensais. Je passais mon temps à faire l''intermédiaire, à transmettre les informations qui ne passaient plus, à arrondir les angles. Je travaillais deux fois plus pour un magasin qui marchait moins bien. Et je me disais que j''avais la situation en main, puisque le magasin tournait.

**Claire** — Et l''équipe ?

**Patrice** — L''équipe attendait que je fasse quelque chose. Je l''ai compris beaucoup plus tard, quand une vendeuse m''a dit : « On se demandait pourquoi vous ne faisiez rien. » Pour eux, mon silence voulait dire que je ne les protégeais pas. Ou que j''avais peur de Bruno. Ou que j''avais choisi Sandra. Chacun avait sa théorie. La seule chose qu''ils ne pensaient pas, c''est que je gérais.

**Claire** — Qu''est-ce qui vous a forcé à agir ?

**Patrice** — Deux choses en une semaine. Un client, d''abord. Il avait acheté une tondeuse au jardin, il venait chercher une pièce à l''outillage, et Bruno lui a dit devant tout le monde : « Ça, c''est le rayon de Sandra, faut voir avec elle, moi je ne sais pas ce qu''elle vend. » Le client a fait une réclamation écrite. Et puis Sandra est venue me voir avec sa lettre de démission. Elle avait trouvé ailleurs. Elle m''a dit : « Je ne pars pas à cause de Bruno. Je pars parce que vous n''avez rien fait. »

**Claire** — C''est dur.

**Patrice** — C''est juste. Et c''est ce que dit votre leçon : un conflit qu''on laisse pourrir, ça coûte une personne, et c''est rarement la moins bonne. J''ai perdu ma meilleure chef de rayon. Elle est partie. Je n''ai pas réussi à la retenir, et je n''aurais pas dû essayer à ce moment-là ; c''était trop tard.

**Claire** — Qu''est-ce que vous avez fait avec Bruno ?

**Patrice** — D''abord, l''affaire du client. Ça, c''était une faute : refuser de servir un client et dénigrer une collègue devant lui. J''ai fait un recadrage en règle, avec les faits, et j''ai fait remonter à ma direction, qui a mis un avertissement. Bruno a été très surpris. Il m''a dit : « Ça fait un an que ça dure et c''est maintenant que tu réagis ? » Et il avait raison sur ce point. Ma passivité pendant un an lui avait dit que tout était permis.

**Claire** — Vous aviez laissé la règle s''effacer.

**Patrice** — Voilà. Quand le manager ne dit rien, la règle, c''est ce que fait le plus fort. Et ensuite, j''ai fait le travail que j''aurais dû faire un an plus tôt. J''ai reconstruit la répartition des rôles, avec un référent logiciel désigné, formé, reconnu. J''ai refait des règles de fonctionnement avec toute l''équipe, en commençant par une : on ne parle pas d''un collègue à un client, jamais. Et j''ai eu un entretien avec chaque vendeur, un par un, pour entendre ce qu''ils avaient vécu. Ça m''a pris un mois. Ça a été un mois très instructif.

**Claire** — Qu''est-ce que vous avez entendu ?

**Patrice** — Que le clan, ils n''en voulaient pas. Que la plupart avaient choisi un camp par loyauté envers leur chef de rayon, pas par conviction. Qu''ils étaient soulagés que ça s''arrête. Et qu''ils avaient perdu confiance en moi. Ça, ça a pris plus longtemps à réparer. Un an environ.

**Claire** — Si vous deviez refaire le film, à quel moment vous interviendriez ?

**Patrice** — Le jour de la remarque en réunion. Le jour même. Deux conversations de dix minutes. À Sandra : « Ce que tu as dit sur l''outil était juste, mais le dire comme ça devant tout le monde, ça vise Bruno. Dis-le-lui à lui. » À Bruno : « Le logiciel est là pour rester ; qu''est-ce qu''il te faut pour le prendre en main ? » Et une décision : un référent, une formation, un délai. Fin de l''histoire. Au lieu de ça, un an, une démission, un avertissement, une équipe coupée en deux.

**Claire** — Pourquoi vous ne l''avez pas fait, ce jour-là ? Honnêtement.

**Patrice** — Honnêtement ? Parce que Bruno m''impressionnait. Quinze ans de maison, il était là avant moi, il connaissait tout. J''avais peur de la confrontation avec lui. Et parce que j''aimais bien Sandra, et que je ne voulais pas la reprendre sur une remarque que je trouvais juste sur le fond. Deux biais, l''affinité et l''évitement, et un manager qui préfère être aimé que faire son travail.

**Claire** — C''est courageux de le dire.

**Patrice** — C''est surtout utile pour ceux qui écoutent. Parce que la question n''est pas « est-ce que je vais avoir des conflits dans mon équipe ». Vous en aurez. La question, c''est : est-ce que vous allez les traiter au niveau 1, quand ça coûte dix minutes, ou au niveau 5, quand ça coûte une personne.

**Claire** — Et aujourd''hui, comment vous repérez le niveau 1 ?

**Patrice** — Je me suis fait une règle simple : dès que deux personnes de mon équipe communiquent par un tiers, je vais voir. « Dis à Untel que… », c''est mon signal d''alarme. Et dès qu''une remarque en réunion vise quelqu''un, même juste sur le fond, j''en parle le jour même à celui qui l''a faite. Pas pour le reprendre : pour qu''il aille le dire à la bonne personne.

**Claire** — Et Bruno ?

**Patrice** — Bruno est toujours là. Il a fini par apprendre le logiciel, avec le référent, qui est un vendeur de son propre rayon. Il n''est pas devenu un autre homme. Mais il ne dénigre plus personne, parce qu''il sait que je réagirai le jour même. La règle est revenue.

**Claire** — Un dernier conseil ?

**Patrice** — Deux. Le premier : quand vous vous dites « ils sont adultes, ça va se tasser », c''est précisément le moment d''intervenir. Cette phrase, c''est le nom que l''évitement se donne pour être présentable. Le second : quand vous découvrez que vous compensez, que vous faites l''intermédiaire, que vous transmettez à la place des gens, arrêtez. Vous n''êtes pas en train de gérer un conflit. Vous êtes en train de l''entretenir.

**Claire** — Merci Patrice.

**Patrice** — Merci.

**Claire** — Dans le cas pratique qui suit, vous allez traiter une tension au bureau de l''atelier Garnier, et le carnet de bord vous demandera d''analyser un conflit que vous avez vécu, avec la méthode en cinq étapes.

## Sources
Friedrich Glasl, niveaux d''escalade ; Thomas et Kilmann, modes de gestion des conflits (évitement) ; leçons 5.2 à 5.6.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Version écrite de l''épisode (le texte de référence ; l''enregistrement peut le formuler autrement).

Conversation entre Claire, animatrice IDEAFORMA et Patrice, responsable d''un magasin de bricolage (24 salariés), en poste depuis huit ans, ancien chef de rayon (personnage fictif).

**Claire** — Bonjour à tous. Dans ce podcast, un retour d''expérience sur ce que la plupart des managers ont vécu au moins une fois : un conflit qu''on a vu venir, et qu''on a laissé pourrir. Patrice, vous dirigez un magasin de bricolage depuis huit ans. Vous m''avez dit que cette histoire vous avait appris plus que toutes les formations. Racontez-nous le début.

**Patrice** — Le début, c''est deux chefs de rayon. Appelons-les Bruno et Sandra. Bruno, quinze ans de maison, le rayon outillage, quelqu''un de très compétent et de très sûr de lui. Sandra, arrivée trois ans plus tôt, le rayon jardin, plus jeune, très organisée, très à l''aise avec les outils informatiques. Au début, ils s''entendaient. Et puis on a changé le logiciel de gestion des stocks.

**Claire** — Et là ?

**Patrice** — Sandra a pris le logiciel en main en une semaine. Bruno a détesté, il a continué à faire ses commandes à sa façon, et il y a eu des erreurs de stock. Sandra, en réunion, a dit quelque chose comme : « Si tout le monde utilisait l''outil, on n''aurait pas ces problèmes. » Devant tout le monde. Bruno l''a pris pour lui. Et c''est parti de là.

**Claire** — Qu''est-ce que vous avez fait à ce moment-là ?

**Patrice** — Rien. Je me suis dit : c''est une remarque, il va digérer, ils sont adultes. Vous voyez, c''est exactement le niveau 1 de ce que votre formation appelle l''escalier de Glasl. Une crispation. Une heure de conversation aurait suffi. Je ne l''ai pas prise.

**Claire** — Et ensuite ?

**Patrice** — Ensuite, ça a descendu marche par marche, sur presque un an. D''abord les piques en réunion, dans les deux sens. Bruno qui parlait des « gens qui ne connaissent pas le terrain », Sandra qui parlait des « gens qui refusent d''évoluer ». Niveau 2, la polémique. Je trouvais ça pénible, mais je ne voyais pas un conflit ; je voyais deux caractères.

**Claire** — C''est le biais dont parle la formation : attribuer à la personnalité ce qui vient de la situation.

**Patrice** — Exactement. Et la situation, c''était quoi ? Un changement d''outil mal accompagné, et une répartition des rôles que je n''avais pas clarifiée : qui était référent sur le logiciel ? Personne. Sandra l''était de fait, Bruno ne le supportait pas, et moi je n''avais rien décidé.

**Claire** — Quand est-ce que ça a basculé ?

**Patrice** — Au niveau 3, quand ils ont arrêté de se parler. Ils communiquaient par les vendeurs. « Dis à Sandra que… » Et puis au niveau 4, ils ont commencé à recruter. Chacun avait ses vendeurs. Le magasin s''est coupé en deux, l''outillage et le jardin, avec le rayon décoration au milieu qui ne savait plus à qui parler. J''ai vu des vendeurs se lever de table à la pause quand un vendeur de l''autre camp s''asseyait.

**Claire** — Et vous, pendant ce temps ?

**Patrice** — Je faisais ce que font beaucoup de managers : je compensais. Je passais mon temps à faire l''intermédiaire, à transmettre les informations qui ne passaient plus, à arrondir les angles. Je travaillais deux fois plus pour un magasin qui marchait moins bien. Et je me disais que j''avais la situation en main, puisque le magasin tournait.

**Claire** — Et l''équipe ?

**Patrice** — L''équipe attendait que je fasse quelque chose. Je l''ai compris beaucoup plus tard, quand une vendeuse m''a dit : « On se demandait pourquoi vous ne faisiez rien. » Pour eux, mon silence voulait dire que je ne les protégeais pas. Ou que j''avais peur de Bruno. Ou que j''avais choisi Sandra. Chacun avait sa théorie. La seule chose qu''ils ne pensaient pas, c''est que je gérais.

**Claire** — Qu''est-ce qui vous a forcé à agir ?

**Patrice** — Deux choses en une semaine. Un client, d''abord. Il avait acheté une tondeuse au jardin, il venait chercher une pièce à l''outillage, et Bruno lui a dit devant tout le monde : « Ça, c''est le rayon de Sandra, faut voir avec elle, moi je ne sais pas ce qu''elle vend. » Le client a fait une réclamation écrite. Et puis Sandra est venue me voir avec sa lettre de démission. Elle avait trouvé ailleurs. Elle m''a dit : « Je ne pars pas à cause de Bruno. Je pars parce que vous n''avez rien fait. »

**Claire** — C''est dur.

**Patrice** — C''est juste. Et c''est ce que dit votre leçon : un conflit qu''on laisse pourrir, ça coûte une personne, et c''est rarement la moins bonne. J''ai perdu ma meilleure chef de rayon. Elle est partie. Je n''ai pas réussi à la retenir, et je n''aurais pas dû essayer à ce moment-là ; c''était trop tard.

**Claire** — Qu''est-ce que vous avez fait avec Bruno ?

**Patrice** — D''abord, l''affaire du client. Ça, c''était une faute : refuser de servir un client et dénigrer une collègue devant lui. J''ai fait un recadrage en règle, avec les faits, et j''ai fait remonter à ma direction, qui a mis un avertissement. Bruno a été très surpris. Il m''a dit : « Ça fait un an que ça dure et c''est maintenant que tu réagis ? » Et il avait raison sur ce point. Ma passivité pendant un an lui avait dit que tout était permis.

**Claire** — Vous aviez laissé la règle s''effacer.

**Patrice** — Voilà. Quand le manager ne dit rien, la règle, c''est ce que fait le plus fort. Et ensuite, j''ai fait le travail que j''aurais dû faire un an plus tôt. J''ai reconstruit la répartition des rôles, avec un référent logiciel désigné, formé, reconnu. J''ai refait des règles de fonctionnement avec toute l''équipe, en commençant par une : on ne parle pas d''un collègue à un client, jamais. Et j''ai eu un entretien avec chaque vendeur, un par un, pour entendre ce qu''ils avaient vécu. Ça m''a pris un mois. Ça a été un mois très instructif.

**Claire** — Qu''est-ce que vous avez entendu ?

**Patrice** — Que le clan, ils n''en voulaient pas. Que la plupart avaient choisi un camp par loyauté envers leur chef de rayon, pas par conviction. Qu''ils étaient soulagés que ça s''arrête. Et qu''ils avaient perdu confiance en moi. Ça, ça a pris plus longtemps à réparer. Un an environ.

**Claire** — Si vous deviez refaire le film, à quel moment vous interviendriez ?

**Patrice** — Le jour de la remarque en réunion. Le jour même. Deux conversations de dix minutes. À Sandra : « Ce que tu as dit sur l''outil était juste, mais le dire comme ça devant tout le monde, ça vise Bruno. Dis-le-lui à lui. » À Bruno : « Le logiciel est là pour rester ; qu''est-ce qu''il te faut pour le prendre en main ? » Et une décision : un référent, une formation, un délai. Fin de l''histoire. Au lieu de ça, un an, une démission, un avertissement, une équipe coupée en deux.

**Claire** — Pourquoi vous ne l''avez pas fait, ce jour-là ? Honnêtement.

**Patrice** — Honnêtement ? Parce que Bruno m''impressionnait. Quinze ans de maison, il était là avant moi, il connaissait tout. J''avais peur de la confrontation avec lui. Et parce que j''aimais bien Sandra, et que je ne voulais pas la reprendre sur une remarque que je trouvais juste sur le fond. Deux biais, l''affinité et l''évitement, et un manager qui préfère être aimé que faire son travail.

**Claire** — C''est courageux de le dire.

**Patrice** — C''est surtout utile pour ceux qui écoutent. Parce que la question n''est pas « est-ce que je vais avoir des conflits dans mon équipe ». Vous en aurez. La question, c''est : est-ce que vous allez les traiter au niveau 1, quand ça coûte dix minutes, ou au niveau 5, quand ça coûte une personne.

**Claire** — Et aujourd''hui, comment vous repérez le niveau 1 ?

**Patrice** — Je me suis fait une règle simple : dès que deux personnes de mon équipe communiquent par un tiers, je vais voir. « Dis à Untel que… », c''est mon signal d''alarme. Et dès qu''une remarque en réunion vise quelqu''un, même juste sur le fond, j''en parle le jour même à celui qui l''a faite. Pas pour le reprendre : pour qu''il aille le dire à la bonne personne.

**Claire** — Et Bruno ?

**Patrice** — Bruno est toujours là. Il a fini par apprendre le logiciel, avec le référent, qui est un vendeur de son propre rayon. Il n''est pas devenu un autre homme. Mais il ne dénigre plus personne, parce qu''il sait que je réagirai le jour même. La règle est revenue.

**Claire** — Un dernier conseil ?

**Patrice** — Deux. Le premier : quand vous vous dites « ils sont adultes, ça va se tasser », c''est précisément le moment d''intervenir. Cette phrase, c''est le nom que l''évitement se donne pour être présentable. Le second : quand vous découvrez que vous compensez, que vous faites l''intermédiaire, que vous transmettez à la place des gens, arrêtez. Vous n''êtes pas en train de gérer un conflit. Vous êtes en train de l''entretenir.

**Claire** — Merci Patrice.

**Patrice** — Merci.

**Claire** — Dans le cas pratique qui suit, vous allez traiter une tension au bureau de l''atelier Garnier, et le carnet de bord vous demandera d''analyser un conflit que vous avez vécu, avec la méthode en cinq étapes.

## Sources
Friedrich Glasl, niveaux d''escalade ; Thomas et Kilmann, modes de gestion des conflits (évitement) ; leçons 5.2 à 5.6.
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

A2. Oui, dès aujourd''hui, et sur deux plans. La remarque « quand tu auras fait tes preuves », devant tout le monde, est un manquement à la règle du jeu « quand on n''est pas d''accord avec quelqu''un, on lui dit à lui, pas aux autres » et un comportement qui exclut un membre de l''équipe. C''est un feedback correctif à Thierry, en privé, en SBI : les faits (la remarque d''hier, les précédentes), l''impact (Amine s''isole, l''équipe se divise, une proposition utile a été balayée), l''attente (les remarques sur le travail d''Amine se font à Amine, ou à Karim ; devant l''équipe, on parle du travail, pas de « faire ses preuves »), et une question. Si Thierry répète, ce sera un recadrage. La méthode en cinq étapes n''est pas le bon outil ici, parce qu''il n''y a pas deux parties en conflit : il y a un comportement à faire cesser, et une personne à protéger. En revanche, Karim traite en même temps le vrai sujet de Thierry : « Tu as l''impression que l''arrivée d''Amine te retire quelque chose. On en parle. » Et il tient sa promesse : le rôle de référent qualité, formalisé avec Michel.

A3. Pour Amine : un entretien de suivi rapide, factuel (« j''ai vu ce qui s''est passé hier, et je vois que tu manges seul »), pour écouter, dire que la remarque était inacceptable et qu''elle a été traitée (sans détailler), et répondre enfin à sa proposition sur le circuit des pièces : l''examiner sérieusement, avec lui, et, si elle est bonne, la mettre en œuvre en le disant. Rien ne réintègre mieux quelqu''un qu''une idée à lui adoptée par l''équipe. Pour Julien : un mot en privé, court : « Rire avec Thierry, c''est prendre parti. Tu as été le nouveau il y a deux ans. » Julien n''est pas fautif ; il suit. On lui donne l''occasion de ne plus suivre.

A4. La décision : le rôle de chacun sur la peinture (Nadia référente peinture, Amine peintre à part entière, Thierry référent qualité toutes finitions confondues) inscrit dans le RACI, et la règle du jeu rappelée à l''équipe. Karim l''annonce au brief, sans citer l''incident : « Trois choses claires à partir d''aujourd''hui… » Et il traite la proposition d''Amine en réunion, en la présentant comme venant d''Amine. Si l''idée est retenue, Thierry sera associé à sa mise en œuvre : un ancien qui contribue au changement a moins de raisons de le combattre.

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

A2. Oui, dès aujourd''hui, et sur deux plans. La remarque « quand tu auras fait tes preuves », devant tout le monde, est un manquement à la règle du jeu « quand on n''est pas d''accord avec quelqu''un, on lui dit à lui, pas aux autres » et un comportement qui exclut un membre de l''équipe. C''est un feedback correctif à Thierry, en privé, en SBI : les faits (la remarque d''hier, les précédentes), l''impact (Amine s''isole, l''équipe se divise, une proposition utile a été balayée), l''attente (les remarques sur le travail d''Amine se font à Amine, ou à Karim ; devant l''équipe, on parle du travail, pas de « faire ses preuves »), et une question. Si Thierry répète, ce sera un recadrage. La méthode en cinq étapes n''est pas le bon outil ici, parce qu''il n''y a pas deux parties en conflit : il y a un comportement à faire cesser, et une personne à protéger. En revanche, Karim traite en même temps le vrai sujet de Thierry : « Tu as l''impression que l''arrivée d''Amine te retire quelque chose. On en parle. » Et il tient sa promesse : le rôle de référent qualité, formalisé avec Michel.

A3. Pour Amine : un entretien de suivi rapide, factuel (« j''ai vu ce qui s''est passé hier, et je vois que tu manges seul »), pour écouter, dire que la remarque était inacceptable et qu''elle a été traitée (sans détailler), et répondre enfin à sa proposition sur le circuit des pièces : l''examiner sérieusement, avec lui, et, si elle est bonne, la mettre en œuvre en le disant. Rien ne réintègre mieux quelqu''un qu''une idée à lui adoptée par l''équipe. Pour Julien : un mot en privé, court : « Rire avec Thierry, c''est prendre parti. Tu as été le nouveau il y a deux ans. » Julien n''est pas fautif ; il suit. On lui donne l''occasion de ne plus suivre.

A4. La décision : le rôle de chacun sur la peinture (Nadia référente peinture, Amine peintre à part entière, Thierry référent qualité toutes finitions confondues) inscrit dans le RACI, et la règle du jeu rappelée à l''équipe. Karim l''annonce au brief, sans citer l''incident : « Trois choses claires à partir d''aujourd''hui… » Et il traite la proposition d''Amine en réunion, en la présentant comme venant d''Amine. Si l''idée est retenue, Thierry sera associé à sa mise en œuvre : un ancien qui contribue au changement a moins de raisons de le combattre.

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
- Si oui : à qui l''auriez-vous signalé, sous quelle forme, dans quel délai ? Connaissez-vous, dans votre entreprise, la procédure disciplinaire (règlement intérieur, qui sanctionne), le référent harcèlement s''il y en a un (CSE, ou entreprise d''au moins 250 salariés), le médecin du travail ?
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
- Si oui : à qui l''auriez-vous signalé, sous quelle forme, dans quel délai ? Connaissez-vous, dans votre entreprise, la procédure disciplinaire (règlement intérieur, qui sanctionne), le référent harcèlement s''il y en a un (CSE, ou entreprise d''au moins 250 salariés), le médecin du travail ?
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

  -- 6.1-video-bilan-activite.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Module 6 — Piloter la performance et accompagner le changement

Bienvenue dans le module 6, le dernier module de contenu avant votre évaluation finale. Vous avez appris à organiser, à communiquer, à motiver, à gérer les tensions. Reste une question que toute hiérarchie finit par poser, et que vous devez vous poser avant elle : est-ce que ça marche ?

Évaluer les résultats de l''activité collective est la neuvième compétence du référentiel sur lequel cette formation est construite. C''est aussi, dans la pratique, l''une des plus mal faites. Non par manque d''outils, mais parce qu''on confond deux choses.

## Évaluer l''activité, évaluer les personnes

La première confusion est la plus grave. Évaluer l''activité, c''est regarder ce que l''équipe a produit, avec quels moyens, dans quelles conditions. Évaluer les personnes, c''est apprécier la contribution de chacun, dans le cadre réglé du module 3 : entretiens de suivi, entretien annuel, avec des critères connus à l''avance.

Quand on mélange les deux, le bilan d''activité devient une recherche de coupables. « Les délais ont glissé en mars. Qui a traîné ? » Et aussitôt, l''équipe se tait, cache, se défend. Vous retrouvez la sécurité psychologique du module 4 : une équipe qui a peur du bilan ne vous dira jamais ce qui s''est vraiment passé.

Le bilan d''activité est collectif et factuel. Il sert à décider ce qu''on change, pas à désigner qui a tort. Les personnes, on en parle ailleurs, autrement, seul à seul.

## Trois questions : résultats, moyens, conditions

Un bilan d''activité répond à trois questions, dans cet ordre.

Les résultats : qu''est-ce qu''on visait, qu''est-ce qu''on a obtenu ? C''est votre tableau de bord du module 2 : les indicateurs de résultat, comparés aux cibles. À l''atelier Garnier, le trimestre visait 95 % de délais tenus, au plus une reprise par mois, un planning validé chaque soir. Résultat : 91 %, une reprise, dix-huit soirs sur vingt. Trois chiffres, trois écarts à comprendre.

Les moyens : qu''est-ce qu''on a réellement engagé ? Les heures supplémentaires, le temps de Thierry sur le contrôle, l''arrivée d''Amine en cours de trimestre. Un résultat ne se lit pas sans ses moyens. 91 % de délais tenus avec quarante heures supplémentaires, ce n''est pas le même résultat que 91 % sans.

Les conditions : qu''est-ce qui a aidé, qu''est-ce qui a gêné ? Le nouveau circuit des pièces, le retard du fournisseur en février, l''absence de Nadia une semaine. C''est la colonne qu''on oublie, et c''est celle qui explique le plus. Elle transforme « on n''a pas atteint 95 % » en « on a perdu trois de nos quatre points sur la semaine du retard fournisseur ».

## Comprendre avant de conclure

Un écart n''est pas une faute. C''est une information. Devant un écart, le manager pose trois questions avant de décider quoi que ce soit : est-ce que l''objectif était réaliste ? Est-ce que les moyens étaient là ? Qu''est-ce qui s''est passé dans les conditions ?

Et il regarde aussi les résultats atteints, pas seulement les écarts. Un bilan qui ne parle que de ce qui manque fabrique des journées de recul, vous l''avez vu au module 4. Un objectif atteint mérite d''être nommé, et la façon dont il a été atteint mérite d''être comprise, pour la reproduire.

**Un écart est une information, pas une faute.**

## Le bilan se partage

Le bilan d''activité n''est pas un document que le manager rédige seul pour sa hiérarchie. Il se construit avec l''équipe, en réunion, sur le tableau de bord. Trente minutes, une fois par mois ou par trimestre : où on en est, qu''est-ce qui l''explique, qu''est-ce qu''on change. C''est ce que vous appellerez la rétrospective dans la leçon suivante.

Puis il remonte à la hiérarchie, avec la méthode du module 3 : les faits, l''analyse, ce qu''on propose. Un manager qui présente un bilan honnête, avec ses écarts et ce qu''il en fait, est plus crédible qu''un manager qui présente un bilan parfait.

## Et ensuite

Le bilan ouvre sur deux chemins. Quand quelque chose a mal tourné, on en tire un retour d''expérience, pour comprendre les causes et éviter que ça se reproduise. Quand le fonctionnement peut s''améliorer, on entre dans l''amélioration continue : des petits changements, testés, mesurés, adoptés ou abandonnés. Et quand le changement nécessaire est plus grand, un nouvel outil, une nouvelle organisation, c''est de la conduite du changement, avec ses résistances et sa méthode. Ce module vous donne les trois.

## À l''atelier Garnier

À l''atelier Garnier, Karim présente à l''équipe, puis à Michel, le bilan du trimestre qui clôt ses six premiers mois. Il commence par ce qui a été atteint : zéro reprise sur deux mois, un planning tenu dix-huit soirs sur vingt. Puis l''écart : quatre points de délais perdus, dont trois sur la semaine du retard fournisseur. Puis ce qu''il propose : un stock de sécurité sur les dix pièces les plus courantes, idée d''Amine, et un point hebdomadaire avec le fournisseur. Michel, qui attendait des reproches, découvre un pilotage.

À tout de suite pour le retour d''expérience.

## Sources
France Compétences, fiche RS7377 « Animer une équipe de travail », compétence 9 ; Robert S. Kaplan, David P. Norton, *The Balanced Scorecard*, Harvard Business School Press, 1996 (indicateurs de résultat et de moyens) ; Teresa Amabile, Steven Kramer, *The Progress Principle*, Harvard Business Review Press, 2011 ; Amy C. Edmondson, *The Fearless Organization*, Wiley, 2018 (signalement sans blâme).
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Module 6 — Piloter la performance et accompagner le changement

Bienvenue dans le module 6, le dernier module de contenu avant votre évaluation finale. Vous avez appris à organiser, à communiquer, à motiver, à gérer les tensions. Reste une question que toute hiérarchie finit par poser, et que vous devez vous poser avant elle : est-ce que ça marche ?

Évaluer les résultats de l''activité collective est la neuvième compétence du référentiel sur lequel cette formation est construite. C''est aussi, dans la pratique, l''une des plus mal faites. Non par manque d''outils, mais parce qu''on confond deux choses.

## Évaluer l''activité, évaluer les personnes

La première confusion est la plus grave. Évaluer l''activité, c''est regarder ce que l''équipe a produit, avec quels moyens, dans quelles conditions. Évaluer les personnes, c''est apprécier la contribution de chacun, dans le cadre réglé du module 3 : entretiens de suivi, entretien annuel, avec des critères connus à l''avance.

Quand on mélange les deux, le bilan d''activité devient une recherche de coupables. « Les délais ont glissé en mars. Qui a traîné ? » Et aussitôt, l''équipe se tait, cache, se défend. Vous retrouvez la sécurité psychologique du module 4 : une équipe qui a peur du bilan ne vous dira jamais ce qui s''est vraiment passé.

Le bilan d''activité est collectif et factuel. Il sert à décider ce qu''on change, pas à désigner qui a tort. Les personnes, on en parle ailleurs, autrement, seul à seul.

## Trois questions : résultats, moyens, conditions

Un bilan d''activité répond à trois questions, dans cet ordre.

Les résultats : qu''est-ce qu''on visait, qu''est-ce qu''on a obtenu ? C''est votre tableau de bord du module 2 : les indicateurs de résultat, comparés aux cibles. À l''atelier Garnier, le trimestre visait 95 % de délais tenus, au plus une reprise par mois, un planning validé chaque soir. Résultat : 91 %, une reprise, dix-huit soirs sur vingt. Trois chiffres, trois écarts à comprendre.

Les moyens : qu''est-ce qu''on a réellement engagé ? Les heures supplémentaires, le temps de Thierry sur le contrôle, l''arrivée d''Amine en cours de trimestre. Un résultat ne se lit pas sans ses moyens. 91 % de délais tenus avec quarante heures supplémentaires, ce n''est pas le même résultat que 91 % sans.

Les conditions : qu''est-ce qui a aidé, qu''est-ce qui a gêné ? Le nouveau circuit des pièces, le retard du fournisseur en février, l''absence de Nadia une semaine. C''est la colonne qu''on oublie, et c''est celle qui explique le plus. Elle transforme « on n''a pas atteint 95 % » en « on a perdu trois de nos quatre points sur la semaine du retard fournisseur ».

## Comprendre avant de conclure

Un écart n''est pas une faute. C''est une information. Devant un écart, le manager pose trois questions avant de décider quoi que ce soit : est-ce que l''objectif était réaliste ? Est-ce que les moyens étaient là ? Qu''est-ce qui s''est passé dans les conditions ?

Et il regarde aussi les résultats atteints, pas seulement les écarts. Un bilan qui ne parle que de ce qui manque fabrique des journées de recul, vous l''avez vu au module 4. Un objectif atteint mérite d''être nommé, et la façon dont il a été atteint mérite d''être comprise, pour la reproduire.

**Un écart est une information, pas une faute.**

## Le bilan se partage

Le bilan d''activité n''est pas un document que le manager rédige seul pour sa hiérarchie. Il se construit avec l''équipe, en réunion, sur le tableau de bord. Trente minutes, une fois par mois ou par trimestre : où on en est, qu''est-ce qui l''explique, qu''est-ce qu''on change. C''est ce que vous appellerez la rétrospective dans la leçon suivante.

Puis il remonte à la hiérarchie, avec la méthode du module 3 : les faits, l''analyse, ce qu''on propose. Un manager qui présente un bilan honnête, avec ses écarts et ce qu''il en fait, est plus crédible qu''un manager qui présente un bilan parfait.

## Et ensuite

Le bilan ouvre sur deux chemins. Quand quelque chose a mal tourné, on en tire un retour d''expérience, pour comprendre les causes et éviter que ça se reproduise. Quand le fonctionnement peut s''améliorer, on entre dans l''amélioration continue : des petits changements, testés, mesurés, adoptés ou abandonnés. Et quand le changement nécessaire est plus grand, un nouvel outil, une nouvelle organisation, c''est de la conduite du changement, avec ses résistances et sa méthode. Ce module vous donne les trois.

## À l''atelier Garnier

À l''atelier Garnier, Karim présente à l''équipe, puis à Michel, le bilan du trimestre qui clôt ses six premiers mois. Il commence par ce qui a été atteint : zéro reprise sur deux mois, un planning tenu dix-huit soirs sur vingt. Puis l''écart : quatre points de délais perdus, dont trois sur la semaine du retard fournisseur. Puis ce qu''il propose : un stock de sécurité sur les dix pièces les plus courantes, idée d''Amine, et un point hebdomadaire avec le fournisseur. Michel, qui attendait des reproches, découvre un pilotage.

À tout de suite pour le retour d''expérience.

## Sources
France Compétences, fiche RS7377 « Animer une équipe de travail », compétence 9 ; Robert S. Kaplan, David P. Norton, *The Balanced Scorecard*, Harvard Business School Press, 1996 (indicateurs de résultat et de moyens) ; Teresa Amabile, Steven Kramer, *The Progress Principle*, Harvard Business Review Press, 2011 ; Amy C. Edmondson, *The Fearless Organization*, Wiley, 2018 (signalement sans blâme).
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 7 and l.ordre = 1;
  n := n + 1;

  -- 6.10-quiz.json
  update public.lecons l set contenu = '{"questions": [{"id": "m6q01", "enonce": "Quelle est la différence essentielle entre évaluer l''activité et évaluer les personnes ?", "options": ["Le bilan d''activité dit qui a bien ou mal travaillé, pour que chacun sache précisément où il en est", "L''évaluation de l''activité revient à la direction, celle des personnes au manager de proximité", "Le bilan est collectif et sert à décider quoi changer ; chacun est évalué à part, en entretien", "Les deux se font ensemble, en réunion d''équipe, par souci de transparence"], "bonnes": [2], "explication": "Mélanger les deux transforme le bilan en recherche de coupables, et l''équipe cesse de dire ce qui s''est passé. Les personnes s''évaluent ailleurs, seul à seul, avec des critères connus à l''avance."}, {"id": "m6q02", "enonce": "Un bilan d''activité répond à trois questions. Lesquelles, dans l''ordre ?", "options": ["Résultats, moyens réellement engagés, conditions", "Qui a fait quoi, en combien de temps, avec quelle qualité", "Le chiffre d''affaires, la marge brute et la trésorerie disponible sur la période", "Les objectifs, les écarts, puis les responsables de chaque écart"], "bonnes": [0], "explication": "Un résultat ne se lit pas sans ses moyens ni ses conditions : 91 % de délais tenus avec quarante heures supplémentaires n''est pas le même résultat que sans."}, {"id": "m6q03", "enonce": "Les délais ont glissé de quatre points sur le trimestre. Quelle est la bonne attitude du manager devant cet écart ?", "options": ["Identifier qui a pris du retard et le recadrer rapidement, en privé", "Ne pas en parler en réunion pour préserver la motivation", "Réduire l''objectif du trimestre suivant pour qu''il soit atteint", "Comprendre : objectif réaliste ? moyens présents ? conditions ?"], "bonnes": [3], "explication": "Un écart est une information, pas une faute. Et le bilan nomme aussi ce qui a été atteint, pour le reproduire."}, {"id": "m6q04", "enonce": "Sur quel principe repose le retour d''expérience tel que l''aviation et la santé l''ont formalisé ?", "options": ["Aucune erreur n''est jamais sanctionnée, quelle qu''en soit la nature", "L''erreur signalée de bonne foi n''est pas sanctionnée ; la dissimulation peut l''être", "Seuls les incidents ayant causé un dommage sont analysés", "L''analyse est confiée à un expert extérieur au service, pour garantir son objectivité"], "bonnes": [1], "explication": "C''est la culture juste (Reason, Dekker). Sans cette garantie, personne ne déclare rien et le système ne voit que les catastrophes. Elle n''est pas pour autant l''absence de toute sanction."}, {"id": "m6q05", "enonce": "Quels sont les quatre temps d''un retour d''expérience ?", "options": ["Le problème, le responsable, la sanction, la communication", "Le constat, les causes, les solutions, le budget", "Les faits, les causes, les enseignements, les décisions", "Les faits, les ressentis, les excuses, les engagements"], "bonnes": [2], "explication": "La chronologie se reconstitue ensemble ; les causes se combinent (technique, organisation, humain) ; les enseignements sont formulés de façon générale ; les décisions, une ou deux, sont écrites et vérifiées."}, {"id": "m6q06", "enonce": "Un retex conclut : « Julien est allé trop vite. » Qu''en pensez-vous ?", "options": ["Il s''est arrêté à la cause apparente : il faut continuer à demander pourquoi", "La cause est trouvée : le retex peut se conclure par un rappel à Julien", "Le retex doit être refait sans Julien, pour que chacun parle librement", "C''est un problème de compétence : il suffit d''inscrire Julien à une formation peinture"], "bonnes": [0], "explication": "Pourquoi est-il allé trop vite ? Parce qu''on lui a demandé deux fois où il en était. Pourquoi ? Parce qu''aucun circuit des demandes n''existait. La cause racine est une règle à créer, pas une personne."}, {"id": "m6q07", "enonce": "Qu''est-ce qu''une rétrospective d''équipe ?", "options": ["Une réunion où le manager présente à l''équipe le bilan chiffré du trimestre", "Un entretien individuel où chacun revient sur ses propres résultats", "Une enquête anonyme annuelle sur le climat de l''équipe", "Un point régulier où l''équipe choisit une ou deux choses à essayer"], "bonnes": [3], "explication": "Trois questions (ce qui a bien fonctionné, ce qui a moins bien fonctionné, ce qu''on essaie), chacun parle, le manager en dernier, et la réunion suivante commence par « qu''est-ce que ça a donné ? »."}, {"id": "m6q08", "enonce": "Que signifie PDCA (roue de Deming) ?", "options": ["Planifier, Déléguer, Contrôler, Améliorer : les quatre temps de la délégation", "Planifier, faire à petite échelle, vérifier, ajuster ou généraliser", "Prévoir, Décider, Communiquer, Agir : les quatre temps d''une annonce", "Produire, Diagnostiquer, Corriger, Archiver : le traitement d''une non-conformité"], "bonnes": [1], "explication": "Le cycle vient de Shewhart (1939) ; Deming l''a diffusé au Japon et préférait écrire PDSA (Study). L''étape le plus souvent sautée est Check : on met en place, on passe à autre chose, et on ne sait jamais si ça a marché."}, {"id": "m6q09", "enonce": "Quelle idée centrale Deming répétait-il à propos des problèmes de qualité ?", "options": ["Ils viennent surtout d''erreurs individuelles, qu''il faut corriger par la formation", "Ils viennent surtout d''un contrôle final insuffisant, qu''il faut renforcer", "Ils viennent surtout du système et des processus, qu''il faut améliorer", "Ils viennent surtout d''un manque de motivation, qu''il faut stimuler par des primes"], "bonnes": [2], "explication": "C''est la même idée que dans le retex (6.2) et la gestion des conflits (module 5) : les « problèmes de personnes » sont souvent des problèmes d''organisation."}, {"id": "m6q10", "enonce": "Quand s''arrête-t-on dans la méthode des cinq pourquoi ?", "options": ["Exactement à la cinquième question, comme le nom l''indique", "Quand la réponse est une règle ou une organisation à créer", "Quand on a identifié la personne à l''origine du problème", "Quand l''équipe est d''accord pour s''arrêter, faute de nouvelle explication"], "bonnes": [1], "explication": "Cinq est un ordre de grandeur (Ohno). Comme les problèmes réels ont souvent plusieurs causes, on refait la chaîne à partir de chaque cause plausible, ou on complète avec un diagramme d''Ishikawa."}, {"id": "m6q11", "enonce": "Quelles sont les cinq familles de causes les plus utilisées en France pour le diagramme d''Ishikawa (5M) ?", "options": ["Marché, Marketing, Management, Marge, Mesure", "Mission, Moyens, Motivation, Mesure, Maîtrise", "Manager, Métier, Machine, Mode opératoire, Mémoire", "Matière, Matériel, Méthode, Main-d''œuvre, Milieu"], "bonnes": [3], "explication": "Fait en équipe au tableau, il évite de se focaliser sur la cause la plus visible. Certains ajoutent Management et Mesure (7M) : les familles sont une aide, pas une grille obligatoire."}, {"id": "m6q12", "enonce": "Pourquoi la formation recommande-t-elle les petites améliorations avant les grands chantiers ?", "options": ["Elles viennent de l''équipe, qui les applique donc plus volontiers", "Les grands chantiers sortent du champ de responsabilité légal du manager", "Elles ne demandent ni mesure ni suivi, donc peu de temps", "Elles évitent d''avoir à rendre des comptes à la hiérarchie"], "bonnes": [0], "explication": "Déplacer un rangement, créer un stock de sécurité, afficher une check-list : chacune gagne quelques minutes ou évite quelques erreurs. Mises bout à bout sur un an, elles pèsent souvent autant qu''un grand chantier."}, {"id": "m6q13", "enonce": "Un membre de l''équipe propose une idée d''amélioration. Quelle règle la formation fixe-t-elle ?", "options": ["Toute idée est mise en œuvre immédiatement, pour ne pas décourager son auteur", "Les idées sont recueillies une fois par an et traitées ensemble", "Chaque idée est soumise au vote de toute l''équipe, à la majorité, avant toute réponse", "Une réponse sous quinze jours ; une idée adoptée porte le nom de son auteur"], "bonnes": [3], "explication": "La réponse peut être oui (on teste), non (et pourquoi) ou pas maintenant (et quand). Une idée sans réponse est la dernière que la personne proposera."}, {"id": "m6q14", "enonce": "À quoi les gens résistent-ils vraiment lors d''un changement ?", "options": ["Au changement en lui-même, par simple attachement à des habitudes bien installées", "À ce qu''ils perdent, ne comprennent pas ou subissent, et à la peur d''échouer", "Surtout aux nouvelles technologies, pour des raisons d''âge", "Surtout à la charge de travail supplémentaire pendant la transition"], "bonnes": [1], "explication": "Chaque source a sa réponse : nommer la perte, donner le sens, ouvrir ce qui peut l''être, former et accorder le droit à l''erreur. La peur de ne pas y arriver n''est pas une question d''âge."}, {"id": "m6q15", "enonce": "Comment la formation vous demande-t-elle de prendre la courbe d''adaptation au changement (inspirée de Kübler-Ross) ?", "options": ["Comme un repère non validé scientifiquement, utile pour anticiper", "Comme une loi : chacun passe par toutes les étapes, dans l''ordre", "Comme la preuve qu''un changement mal reçu au début doit être reporté à plus tard", "Comme la preuve qu''un changement mal reçu doit être reporté"], "bonnes": [0], "explication": "Kübler-Ross décrivait en 1969 des patients en fin de vie ; l''adaptation au travail est venue plus tard. Le repère rappelle surtout au manager, informé plus tôt, que l''équipe n''en est pas au même point que lui et que les réactions des premières semaines sont normales."}, {"id": "m6q16", "enonce": "Plusieurs réponses. Lesquelles de ces propositions correspondent bien à des étapes du modèle de Kotter ?", "options": ["Crier victoire dès le premier succès pour motiver l''équipe", "Créer un sentiment d''urgence, avec des faits", "Obtenir des victoires rapides, et les montrer", "Ancrer le changement dans les règles et l''intégration des nouveaux"], "bonnes": [1, 2, 3], "explication": "L''étape 7 dit l''inverse de la première proposition : consolider sans crier victoire trop tôt, sinon le changement s''enlise quand l''attention se relâche."}, {"id": "m6q17", "enonce": "La direction a décidé un changement que vous n''auriez pas choisi. Que faites-vous avant de l''annoncer à l''équipe ?", "options": ["Vous l''annoncez le jour même par e-mail, pour que tous aient la même information", "Vous laissez la direction l''annoncer, pour ne pas être associé à la décision", "Vous vous informez, signalez les difficultés et négociez des marges", "Vous prévenez l''équipe que vous n''êtes pas d''accord, pour garder sa confiance"], "bonnes": [2], "explication": "Le manager relais est exigeant vers le haut avant, porte la décision à la première personne pendant, et fait remonter ce que l''équipe vit après."}, {"id": "m6q18", "enonce": "Que contient une annonce de changement bien faite, en réunion ?", "options": ["Le pourquoi, ce qui change ou non, le quand, le comment, ce qui reste ouvert", "La décision, la date de bascule et la personne à qui s''adresser", "La décision, le calendrier de bascule et les conséquences prévues en cas de refus", "La décision, le calendrier et les conséquences en cas de refus"], "bonnes": [0], "explication": "On ajoute ce qu''on ne sait pas encore et quand on le saura. Puis un temps de questions où les objections sont écoutées sans être balayées, et des semaines de répétition, d''entretiens et de premiers résultats montrés."}, {"id": "m6q19", "enonce": "Selon l''Insee (Insee Analyses n° 105, mars 2025), au premier semestre 2024, quelle part des salariés du privé a télétravaillé au moins une fois sur quatre semaines ?", "options": ["Environ 8 %", "Environ 22 %", "Environ 40 %", "Environ 60 %"], "bonnes": [1], "explication": "Avec de très fortes différences selon les postes : 63 % des cadres, 10 % des employés, quasiment aucun ouvrier (période mi-2022 à mi-2024). C''est cette asymétrie qui demande le plus de management."}, {"id": "m6q20", "enonce": "Un manager veut installer un logiciel qui garde la webcam des télétravailleurs allumée en continu « pour vérifier qu''ils travaillent ». Qu''en dit la formation ?", "options": ["C''est possible dès lors que le dispositif a été présenté au CSE et aux salariés", "C''est possible si chaque salarié donne son accord écrit", "La CNIL la juge disproportionnée ; on manage sur les résultats", "C''est admis pendant la période d''essai, le temps d''évaluer la personne"], "bonnes": [2], "explication": "Informer les salariés (L1222-4) et consulter le CSE (L2312-38) sont des conditions, pas des autorisations : le dispositif doit aussi être proportionné (L1121-1). La CNIL considère la surveillance constante par webcam comme disproportionnée, sauf cas exceptionnels liés à la nature de la tâche."}], "seuil": 70, "tentatives_max": 3, "corrections": true, "consigne": "20 questions. Une seule bonne réponse par question, sauf mention « plusieurs réponses ». Seuil de réussite : 70 %."}'::jsonb, publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 7 and l.ordre = 10;
  n := n + 1;

  -- 6.2-retour-d-experience-et-retrospective.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Une équipe qui ne regarde jamais en arrière refait les mêmes erreurs. Une équipe qui regarde en arrière pour chercher des coupables cache les erreurs. Entre les deux, il y a une pratique que les métiers à risque (aviation, nucléaire, hôpital, pompiers) ont formalisée depuis longtemps et que tout manager de proximité peut adopter : le retour d''expérience, et sa version collective régulière, la rétrospective.

## D''où vient le retour d''expérience

Le retour d''expérience (retex, ou REX) est né dans les secteurs où une erreur coûte des vies. L''aviation civile en a fait un système complet : les incidents, y compris ceux restés sans conséquence, sont déclarés, analysés, et les enseignements redescendent vers les équipages (dans l''Union européenne, le règlement n° 376/2014 organise ce compte rendu d''événements). Le principe qui le rend possible est la culture juste : on ne sanctionne pas l''erreur signalée de bonne foi, on sanctionne la négligence délibérée et la dissimulation. Sans cette garantie, personne ne déclare rien, et le système ne voit que les catastrophes.

En santé, la Haute Autorité de santé outille les établissements pour analyser les événements indésirables associés aux soins dans le même esprit (revues de mortalité et de morbidité, analyse des causes). En prévention des accidents du travail, l''INRS propose depuis les années 1970 la méthode de l''arbre des causes. En entreprise, le retex est devenu un outil courant de gestion de projet et de qualité. Pour un manager de proximité, comptez trente minutes et une page.

## Quand faire un retex

Après un incident ou un échec : une reprise client, un accident évité de justesse, un délai manqué, un conflit qui a dégénéré. Mais aussi après une réussite inhabituelle : un chantier terminé en avance, une semaine sans aucune reprise. Comprendre pourquoi ça a marché est aussi utile que comprendre pourquoi ça a raté, et beaucoup plus rare.

Le retex se fait vite, dans les jours qui suivent, tant que les faits sont frais. Il se fait avec les personnes concernées, pas sur elles. Beaucoup de métiers distinguent deux temps : un débriefing à chaud, court, juste après l''événement, pour recueillir les faits et parer au plus pressé ; puis le retex proprement dit, à froid, un ou quelques jours plus tard, quand l''émotion est retombée. Ce qu''on évite, c''est l''analyse des causes le jour même, devant un collègue encore sous le choc.

## La structure en quatre temps

Le retex suit une trame simple, que la fiche outil 6.8 reprend en gabarit.

Les faits. Ce qui s''est passé, dans l''ordre, avec les heures, les personnes, les décisions. Sans interprétation, sans « il aurait dû ». On reconstitue la chronologie ensemble, et on s''arrête quand tout le monde est d''accord sur ce qui s''est passé. C''est souvent plus long qu''on ne croit : trois personnes ont trois versions, et c''est en les confrontant qu''on découvre ce que personne ne savait.

Les causes. Pourquoi ça s''est passé. Et surtout : pourquoi ça a pu se passer. Un retex qui s''arrête à « Julien est allé trop vite » n''a rien compris. Pourquoi est-il allé trop vite ? Parce que Sophie était venue deux fois lui demander où il en était. Pourquoi ? Parce que le client appelait et qu''elle n''avait personne d''autre à qui transmettre. Pourquoi ? Parce que le circuit des demandes n''existait pas. La cause racine est organisationnelle ; la cause apparente est individuelle. La méthode des cinq pourquoi, que vous verrez à la leçon suivante, sert à cela. Dans la plupart des incidents, il y a plusieurs causes qui se combinent : une cause technique, une cause d''organisation, une cause humaine. Un retex sérieux les cherche toutes.

Les enseignements. Qu''est-ce qu''on apprend ? Formulé de façon générale, réutilisable : « Une demande client qui arrive directement à l''atelier crée de la pression sans décision. » Pas : « Sophie ne doit plus venir dans l''atelier. »

Les décisions. Qu''est-ce qu''on change, qui s''en charge, pour quand, et comment on saura que ça a marché. Une ou deux décisions, pas dix. Et une date de vérification.

## Les règles qui font qu''un retex fonctionne

- Pas de blâme. Le manager le dit en ouverture et le tient : « On cherche ce qui doit changer dans notre fonctionnement, pas qui a tort. » S''il y a une faute délibérée, elle se traite ailleurs (module 5), pas dans le retex.
- Les personnes concernées sont là, et parlent les premières.
- Le manager cherche aussi sa part : une consigne floue, une absence, un circuit mal conçu. S''il ne trouve jamais rien de son côté, l''équipe cesse de croire au « pas de blâme ».
- Le résultat est écrit, court, et partagé avec l''équipe. Un retex oral s''oublie en une semaine.
- Les décisions sont suivies à la réunion suivante : « On avait décidé le stock de sécurité, où en est-on ? »

## La rétrospective : le retex régulier

Le retex traite un événement. La rétrospective traite une période : la semaine, le mois, le trimestre. Elle vient des méthodes agiles du développement logiciel (le Manifeste agile de 2001 en fait un principe : « à intervalles réguliers, l''équipe réfléchit aux moyens de devenir plus efficace »), mais elle s''applique à n''importe quelle équipe.

Comptez une vingtaine de minutes en fin de point hebdomadaire, ou une demi-heure dans la réunion mensuelle. Chacun répond à trois questions :

- Qu''est-ce qui a bien fonctionné ? (et qu''il faut continuer)
- Qu''est-ce qui a moins bien fonctionné ? (et qu''il faut changer)
- Qu''est-ce qu''on essaie d''ici la prochaine fois ? (une ou deux choses, pas plus)

La rétrospective porte sur le fonctionnement de l''équipe, pas sur les personnes. Le manager anime avec les règles du module 3 : tour de table, chacun parle, le manager en dernier. Il note, et la réunion suivante commence par « qu''est-ce que ça a donné ? ».

Ce rituel est le moteur de l''amélioration continue : il produit en permanence de petites décisions, testées, gardées ou abandonnées. Il est aussi un outil de prévention des conflits (module 5) : les irritations trouvent un lieu légitime pour s''exprimer avant de devenir des griefs.

## Le cas Garnier — le retex de la coulure, six mois après

La coulure sur la Clio de Ferrand, au tout début, n''avait pas eu de retex : il y avait eu l''éclat de Michel devant l''équipe, puis, au fil des semaines, la délégation du contrôle à Thierry (module 2), le feedback à Julien (module 3) et son plan de développement (module 4). Au bilan des six mois, Karim veut apprendre la méthode à l''équipe. Il prend cet incident comme exercice, parce que tout le monde le connaît et que plus personne n''est sur la défensive. Il réunit Julien, Thierry, Sophie et Nadia, vingt minutes, dans le bureau.

Les faits, reconstitués avec le planning de l''époque et la mémoire de chacun : mardi 14 h 10, Sophie demande à Julien où en est la Clio ; 15 h 30, elle redemande ; 16 h 45, Julien termine le vernis ; 17 h, le véhicule est restitué sans contrôle ; jeudi, le client écrit. Personne n''avait cette chronologie complète : Thierry ne savait pas que Sophie était venue deux fois.

Les causes : Julien a accéléré le vernis (cause humaine) ; la pression venait de Sophie, elle-même sous la pression du client (cause d''organisation : pas de circuit des demandes) ; aucun contrôle avant restitution n''existait (cause d''organisation) ; le vernis utilisé demande un temps de pose que Julien ne maîtrisait pas encore (cause technique et de compétence).

Les enseignements : une demande client qui arrive directement au poste de travail crée de la pression sans décision ; une finition qui sort sans contrôle est un pari ; un carrossier qui découvre un produit a besoin d''un binôme.

Les décisions qu''un retex aurait produites à l''époque : le circuit des demandes passe par Karim ; contrôle des finitions par Thierry avant restitution ; binôme peinture Nadia-Julien, une heure par semaine. Ce sont, à peu de chose près, celles que Karim a prises au fil des mois, une par une, sous la pression des événements.

C''est l''enseignement que l''équipe retient de l''exercice : vingt minutes de retex, trois jours après la réclamation, auraient donné en une fois ce qui a demandé trois mois. Julien, lui, dit simplement qu''il aurait préféré cette réunion-là à l''engueulade devant tout le monde. Depuis, la règle est posée : toute reprise donne lieu à un retex dans la semaine.

## À retenir

- Le retex vient des métiers à risque ; il repose sur la culture juste : on ne sanctionne pas l''erreur signalée de bonne foi.
- Il se fait vite (dans les jours qui suivent, une fois l''émotion retombée), avec les personnes concernées, après un échec comme après une réussite.
- Quatre temps : les faits (chronologie partagée), les causes (jusqu''à la cause racine, souvent organisationnelle), les enseignements (généraux), les décisions (peu nombreuses, suivies).
- Pas de blâme, le manager cherche sa part, le résultat est écrit et suivi.
- La rétrospective est le retex régulier de l''équipe : trois questions, vingt à trente minutes, une ou deux choses à essayer.

## Sources

- James Reason, *Managing the Risks of Organizational Accidents*, Ashgate, 1997 — culture juste, causes organisationnelles ; *L''erreur humaine*, PUF, 1993 (éd. originale *Human Error*, 1990).
- Sidney Dekker, *Just Culture: Restoring Trust and Accountability in Your Organization*, 3e éd., CRC Press, 2016.
- Règlement (UE) n° 376/2014 du 3 avril 2014 concernant les comptes rendus, l''analyse et le suivi d''événements dans l''aviation civile, eur-lex.europa.eu.
- Haute Autorité de santé, « Revue de mortalité et de morbidité (RMM) » et « L''analyse des évènements indésirables associés aux soins (EIAS) : mode d''emploi », has-sante.fr.
- INRS, *La méthode de l''arbre des causes. L''analyse de l''accident du travail*, ED 6163, inrs.fr.
- Esther Derby, Diana Larsen, *Agile Retrospectives*, Pragmatic Bookshelf, 2006 (2e éd. avec David Horowitz, 2024).
- Kent Beck et al., *Manifeste pour le développement agile de logiciels*, 2001, agilemanifesto.org.
- France Compétences, référentiel RS7377, compétence 9.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Une équipe qui ne regarde jamais en arrière refait les mêmes erreurs. Une équipe qui regarde en arrière pour chercher des coupables cache les erreurs. Entre les deux, il y a une pratique que les métiers à risque (aviation, nucléaire, hôpital, pompiers) ont formalisée depuis longtemps et que tout manager de proximité peut adopter : le retour d''expérience, et sa version collective régulière, la rétrospective.

## D''où vient le retour d''expérience

Le retour d''expérience (retex, ou REX) est né dans les secteurs où une erreur coûte des vies. L''aviation civile en a fait un système complet : les incidents, y compris ceux restés sans conséquence, sont déclarés, analysés, et les enseignements redescendent vers les équipages (dans l''Union européenne, le règlement n° 376/2014 organise ce compte rendu d''événements). Le principe qui le rend possible est la culture juste : on ne sanctionne pas l''erreur signalée de bonne foi, on sanctionne la négligence délibérée et la dissimulation. Sans cette garantie, personne ne déclare rien, et le système ne voit que les catastrophes.

En santé, la Haute Autorité de santé outille les établissements pour analyser les événements indésirables associés aux soins dans le même esprit (revues de mortalité et de morbidité, analyse des causes). En prévention des accidents du travail, l''INRS propose depuis les années 1970 la méthode de l''arbre des causes. En entreprise, le retex est devenu un outil courant de gestion de projet et de qualité. Pour un manager de proximité, comptez trente minutes et une page.

## Quand faire un retex

Après un incident ou un échec : une reprise client, un accident évité de justesse, un délai manqué, un conflit qui a dégénéré. Mais aussi après une réussite inhabituelle : un chantier terminé en avance, une semaine sans aucune reprise. Comprendre pourquoi ça a marché est aussi utile que comprendre pourquoi ça a raté, et beaucoup plus rare.

Le retex se fait vite, dans les jours qui suivent, tant que les faits sont frais. Il se fait avec les personnes concernées, pas sur elles. Beaucoup de métiers distinguent deux temps : un débriefing à chaud, court, juste après l''événement, pour recueillir les faits et parer au plus pressé ; puis le retex proprement dit, à froid, un ou quelques jours plus tard, quand l''émotion est retombée. Ce qu''on évite, c''est l''analyse des causes le jour même, devant un collègue encore sous le choc.

## La structure en quatre temps

Le retex suit une trame simple, que la fiche outil 6.8 reprend en gabarit.

Les faits. Ce qui s''est passé, dans l''ordre, avec les heures, les personnes, les décisions. Sans interprétation, sans « il aurait dû ». On reconstitue la chronologie ensemble, et on s''arrête quand tout le monde est d''accord sur ce qui s''est passé. C''est souvent plus long qu''on ne croit : trois personnes ont trois versions, et c''est en les confrontant qu''on découvre ce que personne ne savait.

Les causes. Pourquoi ça s''est passé. Et surtout : pourquoi ça a pu se passer. Un retex qui s''arrête à « Julien est allé trop vite » n''a rien compris. Pourquoi est-il allé trop vite ? Parce que Sophie était venue deux fois lui demander où il en était. Pourquoi ? Parce que le client appelait et qu''elle n''avait personne d''autre à qui transmettre. Pourquoi ? Parce que le circuit des demandes n''existait pas. La cause racine est organisationnelle ; la cause apparente est individuelle. La méthode des cinq pourquoi, que vous verrez à la leçon suivante, sert à cela. Dans la plupart des incidents, il y a plusieurs causes qui se combinent : une cause technique, une cause d''organisation, une cause humaine. Un retex sérieux les cherche toutes.

Les enseignements. Qu''est-ce qu''on apprend ? Formulé de façon générale, réutilisable : « Une demande client qui arrive directement à l''atelier crée de la pression sans décision. » Pas : « Sophie ne doit plus venir dans l''atelier. »

Les décisions. Qu''est-ce qu''on change, qui s''en charge, pour quand, et comment on saura que ça a marché. Une ou deux décisions, pas dix. Et une date de vérification.

## Les règles qui font qu''un retex fonctionne

- Pas de blâme. Le manager le dit en ouverture et le tient : « On cherche ce qui doit changer dans notre fonctionnement, pas qui a tort. » S''il y a une faute délibérée, elle se traite ailleurs (module 5), pas dans le retex.
- Les personnes concernées sont là, et parlent les premières.
- Le manager cherche aussi sa part : une consigne floue, une absence, un circuit mal conçu. S''il ne trouve jamais rien de son côté, l''équipe cesse de croire au « pas de blâme ».
- Le résultat est écrit, court, et partagé avec l''équipe. Un retex oral s''oublie en une semaine.
- Les décisions sont suivies à la réunion suivante : « On avait décidé le stock de sécurité, où en est-on ? »

## La rétrospective : le retex régulier

Le retex traite un événement. La rétrospective traite une période : la semaine, le mois, le trimestre. Elle vient des méthodes agiles du développement logiciel (le Manifeste agile de 2001 en fait un principe : « à intervalles réguliers, l''équipe réfléchit aux moyens de devenir plus efficace »), mais elle s''applique à n''importe quelle équipe.

Comptez une vingtaine de minutes en fin de point hebdomadaire, ou une demi-heure dans la réunion mensuelle. Chacun répond à trois questions :

- Qu''est-ce qui a bien fonctionné ? (et qu''il faut continuer)
- Qu''est-ce qui a moins bien fonctionné ? (et qu''il faut changer)
- Qu''est-ce qu''on essaie d''ici la prochaine fois ? (une ou deux choses, pas plus)

La rétrospective porte sur le fonctionnement de l''équipe, pas sur les personnes. Le manager anime avec les règles du module 3 : tour de table, chacun parle, le manager en dernier. Il note, et la réunion suivante commence par « qu''est-ce que ça a donné ? ».

Ce rituel est le moteur de l''amélioration continue : il produit en permanence de petites décisions, testées, gardées ou abandonnées. Il est aussi un outil de prévention des conflits (module 5) : les irritations trouvent un lieu légitime pour s''exprimer avant de devenir des griefs.

## Le cas Garnier — le retex de la coulure, six mois après

La coulure sur la Clio de Ferrand, au tout début, n''avait pas eu de retex : il y avait eu l''éclat de Michel devant l''équipe, puis, au fil des semaines, la délégation du contrôle à Thierry (module 2), le feedback à Julien (module 3) et son plan de développement (module 4). Au bilan des six mois, Karim veut apprendre la méthode à l''équipe. Il prend cet incident comme exercice, parce que tout le monde le connaît et que plus personne n''est sur la défensive. Il réunit Julien, Thierry, Sophie et Nadia, vingt minutes, dans le bureau.

Les faits, reconstitués avec le planning de l''époque et la mémoire de chacun : mardi 14 h 10, Sophie demande à Julien où en est la Clio ; 15 h 30, elle redemande ; 16 h 45, Julien termine le vernis ; 17 h, le véhicule est restitué sans contrôle ; jeudi, le client écrit. Personne n''avait cette chronologie complète : Thierry ne savait pas que Sophie était venue deux fois.

Les causes : Julien a accéléré le vernis (cause humaine) ; la pression venait de Sophie, elle-même sous la pression du client (cause d''organisation : pas de circuit des demandes) ; aucun contrôle avant restitution n''existait (cause d''organisation) ; le vernis utilisé demande un temps de pose que Julien ne maîtrisait pas encore (cause technique et de compétence).

Les enseignements : une demande client qui arrive directement au poste de travail crée de la pression sans décision ; une finition qui sort sans contrôle est un pari ; un carrossier qui découvre un produit a besoin d''un binôme.

Les décisions qu''un retex aurait produites à l''époque : le circuit des demandes passe par Karim ; contrôle des finitions par Thierry avant restitution ; binôme peinture Nadia-Julien, une heure par semaine. Ce sont, à peu de chose près, celles que Karim a prises au fil des mois, une par une, sous la pression des événements.

C''est l''enseignement que l''équipe retient de l''exercice : vingt minutes de retex, trois jours après la réclamation, auraient donné en une fois ce qui a demandé trois mois. Julien, lui, dit simplement qu''il aurait préféré cette réunion-là à l''engueulade devant tout le monde. Depuis, la règle est posée : toute reprise donne lieu à un retex dans la semaine.

## À retenir

- Le retex vient des métiers à risque ; il repose sur la culture juste : on ne sanctionne pas l''erreur signalée de bonne foi.
- Il se fait vite (dans les jours qui suivent, une fois l''émotion retombée), avec les personnes concernées, après un échec comme après une réussite.
- Quatre temps : les faits (chronologie partagée), les causes (jusqu''à la cause racine, souvent organisationnelle), les enseignements (généraux), les décisions (peu nombreuses, suivies).
- Pas de blâme, le manager cherche sa part, le résultat est écrit et suivi.
- La rétrospective est le retex régulier de l''équipe : trois questions, vingt à trente minutes, une ou deux choses à essayer.

## Sources

- James Reason, *Managing the Risks of Organizational Accidents*, Ashgate, 1997 — culture juste, causes organisationnelles ; *L''erreur humaine*, PUF, 1993 (éd. originale *Human Error*, 1990).
- Sidney Dekker, *Just Culture: Restoring Trust and Accountability in Your Organization*, 3e éd., CRC Press, 2016.
- Règlement (UE) n° 376/2014 du 3 avril 2014 concernant les comptes rendus, l''analyse et le suivi d''événements dans l''aviation civile, eur-lex.europa.eu.
- Haute Autorité de santé, « Revue de mortalité et de morbidité (RMM) » et « L''analyse des évènements indésirables associés aux soins (EIAS) : mode d''emploi », has-sante.fr.
- INRS, *La méthode de l''arbre des causes. L''analyse de l''accident du travail*, ED 6163, inrs.fr.
- Esther Derby, Diana Larsen, *Agile Retrospectives*, Pragmatic Bookshelf, 2006 (2e éd. avec David Horowitz, 2024).
- Kent Beck et al., *Manifeste pour le développement agile de logiciels*, 2001, agilemanifesto.org.
- France Compétences, référentiel RS7377, compétence 9.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 7 and l.ordre = 2;
  n := n + 1;

  -- 6.3-amelioration-continue.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'L''amélioration continue est l''idée que la performance d''une équipe se construit par une succession de petits changements, décidés près du terrain, testés et mesurés, plutôt que par de grands projets décidés loin. Elle vient de l''industrie, mais elle s''applique à un atelier de carrosserie, à un commerce, à un service administratif ou à une équipe de soins. Pour un manager de proximité, c''est la façon la plus sûre d''obtenir des résultats durables sans attendre des moyens qu''il n''aura peut-être jamais.

## D''où ça vient

Le cycle a une histoire un peu plus compliquée que son nom. En 1939, le statisticien américain Walter Shewhart décrit la production comme une boucle : spécifier, produire, inspecter, puis recommencer. William Edwards Deming, son élève, reprend l''idée dans les conférences qu''il donne aux industriels japonais en 1950. Les Japonais en tirent le cycle en quatre temps qu''on appelle aujourd''hui la roue de Deming ou PDCA : Plan, Do, Check, Act. Deming lui-même parlait du « cycle de Shewhart » et préférait, à la fin de sa vie, écrire PDSA, Study (étudier) à la place de Check, pour insister sur l''apprentissage plutôt que sur le simple contrôle. Les entreprises japonaises, Toyota en tête, en ont fait une culture, le kaizen (« changement pour le mieux »), où chaque opérateur est invité à proposer et à tester des améliorations sur son poste. L''idée que Deming a défendue toute sa carrière : la plupart des problèmes de qualité viennent du système, pas des personnes, et ce sont donc les processus qu''il faut améliorer.

Cette idée rejoint tout ce que vous avez vu : les « problèmes de personnes » sont souvent des problèmes d''organisation (module 1), les conflits viennent des rôles flous (module 5), les erreurs ont des causes organisationnelles (leçon 6.2).

## Le cycle PDCA

Plan (planifier) : identifier un problème précis, comprendre ses causes, choisir une action et décider comment on mesurera son effet. « Les pièces arrivent en retard une fois sur quatre. Cause principale : commande passée quand le carrossier en a besoin. Action : commander à la réception du devis accepté. Mesure : taux de pièces disponibles au démontage. »

Do (faire) : mettre en œuvre l''action, à petite échelle si possible, pendant une durée définie. Deux semaines, sur un type de véhicule, avec une personne.

Check (vérifier) : mesurer. Le taux est-il passé de 75 % à 90 % ? Qu''est-ce qui s''est passé qu''on n''avait pas prévu ? C''est l''étape que les managers sautent : on met en place, on passe à autre chose, et on ne sait jamais si ça a marché.

Act (ajuster, généraliser) : si ça marche, on en fait la règle, on l''écrit, on forme ; si ça ne marche pas, on comprend pourquoi et on revient au Plan avec une autre action. Dans les deux cas, on apprend.

Puis on recommence sur le problème suivant. La roue tourne, et c''est ce qui distingue une organisation qui s''améliore d''une organisation qui « a fait une réorganisation en 2024 ».

## Trois outils pour trouver la cause

Le PDCA suppose qu''on ait compris la cause du problème. Trois outils simples, utilisables en réunion d''équipe en une dizaine de minutes, y aident.

Les cinq pourquoi. La méthode vient de Toyota : Taiichi Ohno, l''architecte de son système de production, la décrit dans son livre de 1978 comme la base de la démarche scientifique de l''entreprise (« en répétant cinq fois pourquoi, la nature du problème et sa solution deviennent claires »). On part du problème et on demande « pourquoi ? » jusqu''à atteindre une cause sur laquelle on peut agir, en trois questions parfois, en six ou sept d''autres fois : le chiffre cinq est un ordre de grandeur, pas une règle. Pourquoi la Clio est-elle sortie avec une coulure ? Parce que le vernis n''a pas eu le temps de poser. Pourquoi ? Parce que Julien a accéléré. Pourquoi ? Parce qu''on lui a demandé deux fois où il en était. Pourquoi ? Parce que le client appelait Sophie et qu''elle n''avait pas de circuit pour transmettre. Pourquoi ? Parce que personne n''avait défini qui gère les urgences. On s''arrête quand la réponse est une règle ou une organisation à créer, pas quand elle est une personne. Attention au piège : la méthode est linéaire, et les problèmes réels ont souvent plusieurs causes. Deux personnes qui la pratiquent sur le même incident arrivent d''ailleurs souvent à deux chaînes différentes. On la refait donc à partir de chaque cause plausible, et on vérifie chaque maillon avec des faits.

Le diagramme d''Ishikawa (ou diagramme causes-effet, ou en arêtes de poisson). Kaoru Ishikawa, ingénieur japonais, l''a mis au point en 1943 pour une aciérie de Kawasaki, puis l''a diffusé dans les cercles de qualité. On écrit le problème à droite, et on classe les causes possibles par familles. En France, on utilise le plus souvent les 5M : Matière (pièces, produits), Matériel (outils, machines), Méthode (procédures, circuits), Main-d''œuvre (compétences, effectifs), Milieu (lieu, ambiance, conditions). Certains ajoutent Management et Mesure (on parle alors de 7M) ; les familles sont une aide pour ne rien oublier, pas une grille obligatoire. Fait en équipe sur un tableau, il évite de se focaliser sur la cause la plus visible et fait apparaître celles qu''on ne voyait pas. Pour la coulure : Matière (vernis à temps de pose long), Méthode (pas de contrôle, pas de circuit), Main-d''œuvre (Julien non autonome sur ce produit), Milieu (pression du client au poste).

Le QQOQCP. Qui, Quoi, Où, Quand, Comment, Pourquoi (et souvent Combien : on parle alors de QQOQCCP). C''est l''outil pour décrire un problème avant de le traiter. Beaucoup de « problèmes » mal résolus sont d''abord des problèmes mal décrits : « les pièces arrivent en retard » devient, après QQOQCP, « les pièces de carrosserie des véhicules de flotte (quoi) arrivent après le démontage (quand) une fois sur quatre (combien) parce qu''elles sont commandées au démontage (comment) ». Une fois le problème décrit avec cette précision, la piste de solution apparaît souvent d''elle-même.

## Petites améliorations, grands chantiers

Le réflexe du manager débutant est de chercher le grand chantier : le nouveau logiciel, la réorganisation complète, le recrutement. Ces chantiers sont parfois nécessaires (la leçon suivante traite de leur conduite), mais ils sont lents, coûteux, et ils dépendent de décisions qui ne sont pas les vôtres.

Les petites améliorations, elles, dépendent de vous et de l''équipe : déplacer un rangement, changer l''ordre de deux étapes, afficher une check-list, créer un stock de sécurité de dix références, décaler un horaire de brief. Chacune gagne quelques minutes ou évite quelques erreurs par jour. Mises bout à bout sur un an, elles pèsent souvent autant qu''un grand chantier. Et elles ont un avantage : venant de l''équipe, elles sont appliquées par l''équipe.

Un manager en amélioration continue tient un registre simple : les problèmes identifiés, l''action testée, le résultat, la décision. Dix lignes par trimestre. C''est aussi un excellent support pour le bilan d''activité et pour montrer à sa hiérarchie ce qui a été fait sans budget.

## Faire participer l''équipe

L''amélioration continue ne fonctionne que si les idées viennent du terrain, parce que c''est le terrain qui connaît les détails. Quelques moyens simples :

- Le point « ce qui nous a compliqué la vie » à la fin du point hebdomadaire (module 5) : c''est la source des problèmes à traiter.
- La question en rétrospective : « Qu''est-ce qu''on essaie d''ici la prochaine fois ? »
- Une règle de réponse : toute idée reçoit une réponse sous quinze jours. Oui, on teste ; non, et voici pourquoi ; ou pas maintenant, et quand. Une idée sans réponse est la dernière que la personne proposera.

Et quand une amélioration vient d''un membre de l''équipe, elle est présentée comme la sienne. C''est de la reconnaissance (module 4), et c''est ce qui fait venir la suivante.

## Le cas Garnier — le stock de sécurité

Problème (QQOQCP) : sur les véhicules de flotte, les pièces de carrosserie courantes (pare-chocs, rétroviseurs, feux) arrivent après le démontage une fois sur quatre, ce qui immobilise le véhicule un à deux jours de plus. Causes (cinq pourquoi) : commandées au démontage, parce que le devis n''est validé que tardivement, parce que l''expert passe deux jours après la réception. Idée d''Amine, venue de son ancien atelier et signalée dès sa première semaine (module 4) : un stock de sécurité des dix références les plus courantes.

Plan : stock de dix références, réapprovisionné chaque semaine ; mesure : taux de pièces disponibles au démontage, aujourd''hui 75 %. Do : un mois, sur les flottes uniquement. Check : 94 % de disponibilité, deux jours d''immobilisation gagnés en moyenne, un coût de stock de 1 800 € que Michel a accepté après avoir vu le gain. Act : règle d''atelier, Fatou responsable du réapprovisionnement, décision inscrite au registre, Amine félicité en réunion.

## À retenir

- La plupart des problèmes viennent du système, pas des personnes (Deming) : on améliore les processus.
- PDCA (cycle de Shewhart, diffusé par Deming) : planifier (problème, cause, action, mesure), faire (petit, limité dans le temps), vérifier (mesurer, vraiment), ajuster (généraliser ou recommencer).
- Trois outils : QQOQCP pour décrire avant de traiter, cinq pourquoi (Ohno) pour remonter jusqu''à une règle, pas une personne, Ishikawa (5M) pour ne pas oublier de famille de causes.
- Les petites améliorations qui dépendent de l''équipe pèsent, sur un an, autant qu''un grand chantier, et elles sont appliquées.
- Toute idée reçoit une réponse sous quinze jours ; une amélioration porte le nom de celui qui l''a eue.

## Sources

- Walter A. Shewhart, *Statistical Method from the Viewpoint of Quality Control*, Graduate School of the Department of Agriculture, Washington, 1939.
- W. Edwards Deming, *Hors de la crise*, Economica, 2002 (éd. originale *Out of the Crisis*, MIT, 1986).
- Ronald Moen, Clifford Norman, « Circling Back: Clearing up myths about the Deming cycle and seeing how it keeps evolving », *Quality Progress*, novembre 2010 — histoire du cycle, de Shewhart au PDSA.
- Taiichi Ohno, *Toyota Production System: Beyond Large-Scale Production*, Productivity Press, 1988 (éd. originale japonaise 1978) — les cinq pourquoi.
- Masaaki Imai, *Kaizen: The Key to Japan''s Competitive Success*, McGraw-Hill, 1986.
- Kaoru Ishikawa, *Guide to Quality Control*, Asian Productivity Organization, 1976 (éd. japonaise 1968) — diagramme causes-effet.
- AFNOR, norme NF EN ISO 9001:2015, chapitre 10 « Amélioration ».
- France Compétences, référentiel RS7377, compétences 3 et 9.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'L''amélioration continue est l''idée que la performance d''une équipe se construit par une succession de petits changements, décidés près du terrain, testés et mesurés, plutôt que par de grands projets décidés loin. Elle vient de l''industrie, mais elle s''applique à un atelier de carrosserie, à un commerce, à un service administratif ou à une équipe de soins. Pour un manager de proximité, c''est la façon la plus sûre d''obtenir des résultats durables sans attendre des moyens qu''il n''aura peut-être jamais.

## D''où ça vient

Le cycle a une histoire un peu plus compliquée que son nom. En 1939, le statisticien américain Walter Shewhart décrit la production comme une boucle : spécifier, produire, inspecter, puis recommencer. William Edwards Deming, son élève, reprend l''idée dans les conférences qu''il donne aux industriels japonais en 1950. Les Japonais en tirent le cycle en quatre temps qu''on appelle aujourd''hui la roue de Deming ou PDCA : Plan, Do, Check, Act. Deming lui-même parlait du « cycle de Shewhart » et préférait, à la fin de sa vie, écrire PDSA, Study (étudier) à la place de Check, pour insister sur l''apprentissage plutôt que sur le simple contrôle. Les entreprises japonaises, Toyota en tête, en ont fait une culture, le kaizen (« changement pour le mieux »), où chaque opérateur est invité à proposer et à tester des améliorations sur son poste. L''idée que Deming a défendue toute sa carrière : la plupart des problèmes de qualité viennent du système, pas des personnes, et ce sont donc les processus qu''il faut améliorer.

Cette idée rejoint tout ce que vous avez vu : les « problèmes de personnes » sont souvent des problèmes d''organisation (module 1), les conflits viennent des rôles flous (module 5), les erreurs ont des causes organisationnelles (leçon 6.2).

## Le cycle PDCA

Plan (planifier) : identifier un problème précis, comprendre ses causes, choisir une action et décider comment on mesurera son effet. « Les pièces arrivent en retard une fois sur quatre. Cause principale : commande passée quand le carrossier en a besoin. Action : commander à la réception du devis accepté. Mesure : taux de pièces disponibles au démontage. »

Do (faire) : mettre en œuvre l''action, à petite échelle si possible, pendant une durée définie. Deux semaines, sur un type de véhicule, avec une personne.

Check (vérifier) : mesurer. Le taux est-il passé de 75 % à 90 % ? Qu''est-ce qui s''est passé qu''on n''avait pas prévu ? C''est l''étape que les managers sautent : on met en place, on passe à autre chose, et on ne sait jamais si ça a marché.

Act (ajuster, généraliser) : si ça marche, on en fait la règle, on l''écrit, on forme ; si ça ne marche pas, on comprend pourquoi et on revient au Plan avec une autre action. Dans les deux cas, on apprend.

Puis on recommence sur le problème suivant. La roue tourne, et c''est ce qui distingue une organisation qui s''améliore d''une organisation qui « a fait une réorganisation en 2024 ».

## Trois outils pour trouver la cause

Le PDCA suppose qu''on ait compris la cause du problème. Trois outils simples, utilisables en réunion d''équipe en une dizaine de minutes, y aident.

Les cinq pourquoi. La méthode vient de Toyota : Taiichi Ohno, l''architecte de son système de production, la décrit dans son livre de 1978 comme la base de la démarche scientifique de l''entreprise (« en répétant cinq fois pourquoi, la nature du problème et sa solution deviennent claires »). On part du problème et on demande « pourquoi ? » jusqu''à atteindre une cause sur laquelle on peut agir, en trois questions parfois, en six ou sept d''autres fois : le chiffre cinq est un ordre de grandeur, pas une règle. Pourquoi la Clio est-elle sortie avec une coulure ? Parce que le vernis n''a pas eu le temps de poser. Pourquoi ? Parce que Julien a accéléré. Pourquoi ? Parce qu''on lui a demandé deux fois où il en était. Pourquoi ? Parce que le client appelait Sophie et qu''elle n''avait pas de circuit pour transmettre. Pourquoi ? Parce que personne n''avait défini qui gère les urgences. On s''arrête quand la réponse est une règle ou une organisation à créer, pas quand elle est une personne. Attention au piège : la méthode est linéaire, et les problèmes réels ont souvent plusieurs causes. Deux personnes qui la pratiquent sur le même incident arrivent d''ailleurs souvent à deux chaînes différentes. On la refait donc à partir de chaque cause plausible, et on vérifie chaque maillon avec des faits.

Le diagramme d''Ishikawa (ou diagramme causes-effet, ou en arêtes de poisson). Kaoru Ishikawa, ingénieur japonais, l''a mis au point en 1943 pour une aciérie de Kawasaki, puis l''a diffusé dans les cercles de qualité. On écrit le problème à droite, et on classe les causes possibles par familles. En France, on utilise le plus souvent les 5M : Matière (pièces, produits), Matériel (outils, machines), Méthode (procédures, circuits), Main-d''œuvre (compétences, effectifs), Milieu (lieu, ambiance, conditions). Certains ajoutent Management et Mesure (on parle alors de 7M) ; les familles sont une aide pour ne rien oublier, pas une grille obligatoire. Fait en équipe sur un tableau, il évite de se focaliser sur la cause la plus visible et fait apparaître celles qu''on ne voyait pas. Pour la coulure : Matière (vernis à temps de pose long), Méthode (pas de contrôle, pas de circuit), Main-d''œuvre (Julien non autonome sur ce produit), Milieu (pression du client au poste).

Le QQOQCP. Qui, Quoi, Où, Quand, Comment, Pourquoi (et souvent Combien : on parle alors de QQOQCCP). C''est l''outil pour décrire un problème avant de le traiter. Beaucoup de « problèmes » mal résolus sont d''abord des problèmes mal décrits : « les pièces arrivent en retard » devient, après QQOQCP, « les pièces de carrosserie des véhicules de flotte (quoi) arrivent après le démontage (quand) une fois sur quatre (combien) parce qu''elles sont commandées au démontage (comment) ». Une fois le problème décrit avec cette précision, la piste de solution apparaît souvent d''elle-même.

## Petites améliorations, grands chantiers

Le réflexe du manager débutant est de chercher le grand chantier : le nouveau logiciel, la réorganisation complète, le recrutement. Ces chantiers sont parfois nécessaires (la leçon suivante traite de leur conduite), mais ils sont lents, coûteux, et ils dépendent de décisions qui ne sont pas les vôtres.

Les petites améliorations, elles, dépendent de vous et de l''équipe : déplacer un rangement, changer l''ordre de deux étapes, afficher une check-list, créer un stock de sécurité de dix références, décaler un horaire de brief. Chacune gagne quelques minutes ou évite quelques erreurs par jour. Mises bout à bout sur un an, elles pèsent souvent autant qu''un grand chantier. Et elles ont un avantage : venant de l''équipe, elles sont appliquées par l''équipe.

Un manager en amélioration continue tient un registre simple : les problèmes identifiés, l''action testée, le résultat, la décision. Dix lignes par trimestre. C''est aussi un excellent support pour le bilan d''activité et pour montrer à sa hiérarchie ce qui a été fait sans budget.

## Faire participer l''équipe

L''amélioration continue ne fonctionne que si les idées viennent du terrain, parce que c''est le terrain qui connaît les détails. Quelques moyens simples :

- Le point « ce qui nous a compliqué la vie » à la fin du point hebdomadaire (module 5) : c''est la source des problèmes à traiter.
- La question en rétrospective : « Qu''est-ce qu''on essaie d''ici la prochaine fois ? »
- Une règle de réponse : toute idée reçoit une réponse sous quinze jours. Oui, on teste ; non, et voici pourquoi ; ou pas maintenant, et quand. Une idée sans réponse est la dernière que la personne proposera.

Et quand une amélioration vient d''un membre de l''équipe, elle est présentée comme la sienne. C''est de la reconnaissance (module 4), et c''est ce qui fait venir la suivante.

## Le cas Garnier — le stock de sécurité

Problème (QQOQCP) : sur les véhicules de flotte, les pièces de carrosserie courantes (pare-chocs, rétroviseurs, feux) arrivent après le démontage une fois sur quatre, ce qui immobilise le véhicule un à deux jours de plus. Causes (cinq pourquoi) : commandées au démontage, parce que le devis n''est validé que tardivement, parce que l''expert passe deux jours après la réception. Idée d''Amine, venue de son ancien atelier et signalée dès sa première semaine (module 4) : un stock de sécurité des dix références les plus courantes.

Plan : stock de dix références, réapprovisionné chaque semaine ; mesure : taux de pièces disponibles au démontage, aujourd''hui 75 %. Do : un mois, sur les flottes uniquement. Check : 94 % de disponibilité, deux jours d''immobilisation gagnés en moyenne, un coût de stock de 1 800 € que Michel a accepté après avoir vu le gain. Act : règle d''atelier, Fatou responsable du réapprovisionnement, décision inscrite au registre, Amine félicité en réunion.

## À retenir

- La plupart des problèmes viennent du système, pas des personnes (Deming) : on améliore les processus.
- PDCA (cycle de Shewhart, diffusé par Deming) : planifier (problème, cause, action, mesure), faire (petit, limité dans le temps), vérifier (mesurer, vraiment), ajuster (généraliser ou recommencer).
- Trois outils : QQOQCP pour décrire avant de traiter, cinq pourquoi (Ohno) pour remonter jusqu''à une règle, pas une personne, Ishikawa (5M) pour ne pas oublier de famille de causes.
- Les petites améliorations qui dépendent de l''équipe pèsent, sur un an, autant qu''un grand chantier, et elles sont appliquées.
- Toute idée reçoit une réponse sous quinze jours ; une amélioration porte le nom de celui qui l''a eue.

## Sources

- Walter A. Shewhart, *Statistical Method from the Viewpoint of Quality Control*, Graduate School of the Department of Agriculture, Washington, 1939.
- W. Edwards Deming, *Hors de la crise*, Economica, 2002 (éd. originale *Out of the Crisis*, MIT, 1986).
- Ronald Moen, Clifford Norman, « Circling Back: Clearing up myths about the Deming cycle and seeing how it keeps evolving », *Quality Progress*, novembre 2010 — histoire du cycle, de Shewhart au PDSA.
- Taiichi Ohno, *Toyota Production System: Beyond Large-Scale Production*, Productivity Press, 1988 (éd. originale japonaise 1978) — les cinq pourquoi.
- Masaaki Imai, *Kaizen: The Key to Japan''s Competitive Success*, McGraw-Hill, 1986.
- Kaoru Ishikawa, *Guide to Quality Control*, Asian Productivity Organization, 1976 (éd. japonaise 1968) — diagramme causes-effet.
- AFNOR, norme NF EN ISO 9001:2015, chapitre 10 « Amélioration ».
- France Compétences, référentiel RS7377, compétences 3 et 9.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 7 and l.ordre = 3;
  n := n + 1;

  -- 6.4-conduire-le-changement.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Un nouveau logiciel, une nouvelle organisation des horaires, un déménagement, une fusion de deux équipes, une nouvelle norme à appliquer : le manager de proximité ne décide presque jamais de ces changements, mais c''est lui qui les fait vivre, ou échouer. Vous lirez souvent que « 70 % des changements échouent ». Ce chiffre circule depuis les années 1990 sans base empirique solide : le chercheur Mark Hughes a remonté ses sources en 2011 et n''a trouvé aucune étude qui l''établisse. Ce qui est mieux établi, c''est que lorsqu''un changement déraille, c''est rarement pour une raison technique : c''est la façon dont les personnes ont été, ou non, associées. Et là, le manager de proximité est en première ligne.

## Pourquoi les gens résistent

Le mot « résistance » est trompeur : il laisse croire que les gens sont contre le changement par principe. Sur le terrain, on résiste surtout à ce qu''on perd, à ce qu''on ne comprend pas et à ce qu''on vous impose. Chacune de ces sources appelle une réponse différente du manager.

Les pertes. Tout changement fait perdre quelque chose : une compétence qui avait de la valeur (Bruno, dans le podcast du module 5, maîtrisait l''ancien système de commandes), une habitude confortable, un statut, une relation, un repère. Le manager qui ne voit pas la perte ne comprend pas la résistance. Réponse : nommer la perte, la reconnaître (« je sais que ça te coûte »), et montrer ce qui est gagné ou préservé.

L''incompréhension. Quand on ne sait pas pourquoi on change, ni vers quoi, on imagine le pire. Réponse : le sens, dit et redit ; le pourquoi avant le comment.

L''imposition. Un changement subi est combattu ; un changement auquel on a contribué est porté. Réponse : associer l''équipe à ce qui peut l''être, qui est souvent plus large qu''on ne croit. La décision de changer d''outil n''est pas négociable ; la façon de l''installer, l''ordre, le calendrier, les règles d''usage, le sont.

Il faut ajouter une quatrième source, moins avouable : la peur de ne pas y arriver. Quelqu''un qui n''a jamais travaillé sur écran et à qui l''on annonce un nouveau logiciel ne résiste pas par mauvaise volonté ; il a peur d''être ridicule devant les autres. Cela n''a rien à voir avec l''âge : on trouve cette peur à 25 ans comme à 55. Réponse : former, accompagner, et donner le droit à l''erreur pendant l''apprentissage (module 4).

## Un premier repère : dégeler, changer, figer (Lewin)

On attribue au psychologue Kurt Lewin, dans les années 1940, l''idée qu''un changement passe par trois temps : dégeler (rendre l''ancienne façon de faire discutable), changer, puis figer à nouveau (stabiliser la nouvelle pratique). Lewin parlait aussi de « champ de forces » : une situation tient parce que des forces qui poussent au changement et des forces qui le freinent s''équilibrent ; pour la faire bouger, il est souvent plus efficace de réduire les freins que de pousser plus fort. Les historiens du management (Cummings, Bridgman et Brown, 2016) ont montré que le modèle en trois étapes a été largement simplifié après sa mort : Lewin n''en a parlé qu''en passant, et le présentait comme un processus d''apprentissage de groupe, pas comme une recette. Retenez l''idée utile : on ne change pas une habitude sans l''avoir d''abord rendue discutable, et un changement non stabilisé revient en arrière.

## La courbe d''adaptation

On représente souvent les réactions au changement par une courbe dite « du changement », adaptée des travaux de la psychiatre Elisabeth Kübler-Ross. Son livre de 1969 décrivait cinq étapes observées chez des patients en fin de vie (déni, colère, marchandage, dépression, acceptation) ; le modèle a ensuite été étendu au deuil, puis, par des consultants et des formateurs, au monde du travail, avec des étapes ajoutées comme le choc ou l''engagement. Ses limites sont connues : il n''a pas été validé empiriquement, y compris dans son domaine d''origine, et Kübler-Ross elle-même a précisé plus tard que les étapes n''étaient ni linéaires ni obligatoires. Chacun les traverse à sa vitesse, certains ne passent pas par la colère, d''autres y reviennent. Prenez-la donc pour un repère pédagogique, pas pour une loi, et ne l''utilisez jamais pour « classer » quelqu''un. Le repère est utile pour une chose : il rappelle au manager que les réactions négatives des premières semaines sont normales, qu''elles ne signifient pas que le changement est mauvais, et qu''elles passent, à condition qu''on les accompagne.

Concrètement : le déni appelle une information répétée ; la colère, de l''écoute (module 3), sans la prendre pour soi ; le découragement, du soutien et des premiers succès ; l''acceptation, de la reconnaissance. Et le manager lui-même traverse la courbe, souvent avant l''équipe, parce qu''il a été informé plus tôt. Il doit s''en souvenir quand il s''impatiente devant une équipe qui en est encore au choc.

## Une méthode : les huit étapes de Kotter, à l''échelle d''une équipe

John Kotter, professeur à la Harvard Business School, a d''abord décrit en 1995, dans un article de la *Harvard Business Review* (« Leading Change: Why Transformation Efforts Fail »), les huit erreurs qu''il avait observées dans une centaine d''entreprises en transformation. Il en a tiré l''année suivante, dans son livre *Leading Change*, un modèle en huit étapes. Le modèle repose sur son expérience de consultant et d''enseignant, pas sur une étude contrôlée, et il est conçu pour des organisations entières. Mais chaque étape a sa traduction pour un manager de proximité qui doit faire adopter un changement à son équipe.

| Étape de Kotter | Pour le manager de proximité |
|---|---|
| 1. Créer un sentiment d''urgence | Expliquer pourquoi on ne peut pas rester comme ça, avec des faits (le client perdu, les reprises, le temps gaspillé), pas des slogans. |
| 2. Former une coalition | Identifier deux ou trois personnes de l''équipe qui comprennent l''enjeu, les associer tôt, s''appuyer sur elles. Un ancien respecté qui adhère vaut dix notes de service. |
| 3. Développer une vision | Dire en deux phrases à quoi ressemblera le travail après : « Dans trois mois, chaque véhicule a ses pièces le jour du démontage et personne ne court après Sophie. » |
| 4. Communiquer la vision | La répéter, dans chaque brief, chaque réunion, chaque entretien. Dans son article de 1995, Kotter écrit que les dirigeants sous-communiquent leur vision « d''un facteur dix ». Le manager de proximité aussi. |
| 5. Lever les obstacles | Repérer ce qui empêche concrètement (un outil manquant, une règle contradictoire, une personne qui bloque) et le traiter. Un obstacle laissé en place dit « le changement n''est pas sérieux ». |
| 6. Obtenir des victoires rapides | Choisir un premier résultat visible en quelques semaines, le mesurer, le montrer. C''est le principe du progrès (module 4) appliqué au changement. |
| 7. Consolider, ne pas crier victoire trop tôt | Après le premier succès, continuer : former les derniers, régler les cas particuliers, tenir les règles. Pour Kotter, c''est ici que beaucoup de changements s''enlisent, quand l''attention se relâche. |
| 8. Ancrer dans la culture | Inscrire le changement dans les règles de l''atelier, les fiches de poste, l''intégration des nouveaux, le tableau de bord. Ce qui n''est pas ancré revient en arrière dès que le manager regarde ailleurs. |

Kotter a lui-même fait évoluer son modèle (*Accelerate*, 2014) vers une version moins séquentielle, où plusieurs étapes se mènent en parallèle. À l''échelle d''une équipe, retenez surtout le sens, les alliés, une communication répétée, des obstacles levés, des premiers succès, puis de la persévérance une fois ces succès obtenus.

## Le manager relais : entre la décision et l''équipe

Dans la plupart des cas, le changement est décidé au-dessus du manager, qui doit le porter sans l''avoir choisi. C''est la situation de la leçon 1.7 et du podcast 3.8 : loyal vers le haut, loyal vers le bas.

Ce que cela implique. Avant l''annonce, le manager s''informe complètement (pourquoi, quoi, quand, quelles marges) et dit à sa hiérarchie ce qu''il anticipe comme difficultés et ce dont il a besoin. Il obtient, si possible, les marges de manœuvre qu''il pourra ouvrir à l''équipe. Pendant l''annonce et après, il porte la décision à la première personne (« voilà ce que nous faisons »), jamais « ils ont décidé ». Il ne cache pas ce qu''il ne sait pas : « Je n''ai pas encore la date, je vous la dis dès que je l''ai. » Il fait remonter ce que l''équipe vit, avec des faits, à sa hiérarchie, qui en a besoin pour ajuster. Et il ne promet pas ce qu''il ne maîtrise pas.

## Communiquer le changement : qui, quoi, quand

L''annonce se fait en réunion, en présence, jamais par e-mail ni par affichage (module 3). Elle contient : le pourquoi (les faits qui rendent le changement nécessaire), le quoi (ce qui change, et tout aussi important, ce qui ne change pas), le quand (les étapes et les dates connues), le comment (la formation, l''accompagnement, à qui s''adresser), et ce qui reste ouvert (sur quoi l''équipe peut peser). Puis un temps de questions, où le manager écoute les objections sans les balayer et note celles auxquelles il n''a pas de réponse.

L''annonce n''est que le début. Les semaines suivantes, le manager redit, en brief, en entretien, où on en est et ce qui vient. Les personnes les plus inquiètes sont vues individuellement. Les premiers résultats sont montrés. Les questions reviennent plusieurs fois : c''est normal, on ne retient pas une annonce du premier coup quand elle inquiète.

## Les erreurs qui coûtent le plus cher

- Annoncer sans le pourquoi, ou avec un pourquoi qui ne tient pas (« c''est la direction qui veut »).
- Promettre que « rien ne changera pour vous » quand c''est faux.
- Ne pas voir les pertes, et traiter la résistance comme de la mauvaise volonté.
- Former trop tard ou pas assez, et laisser les gens se débrouiller avec le nouvel outil.
- Crier victoire au premier succès et relâcher l''attention.
- Laisser un obstacle connu en place pendant des semaines.
- Se désolidariser de la décision devant l''équipe.

## Le cas Garnier — le logiciel d''atelier

Michel a acheté un logiciel de gestion d''atelier (ordres de réparation, planning, pièces, facturation) : fin des fiches papier et du tableau blanc dans trois mois. Il l''annonce à Karim un vendredi, en lui demandant « de gérer ».

Avant l''annonce, Karim obtient de Michel trois choses : la date de bascule (le 1er du mois dans trois mois), deux demi-journées de formation par l''éditeur, et la possibilité de garder le tableau blanc un mois en parallèle. Il identifie ses alliés : Sophie, qui attend ce logiciel depuis des années, et Amine, qui l''a utilisé dans son ancien atelier. Il anticipe les pertes : Thierry maîtrise le papier et déteste les écrans ; Marc craint que le logiciel serve à le chronométrer.

L''annonce, en réunion : le pourquoi (les fiches perdues, les deux reprises dues à des informations manquantes, le temps de Sophie), le quoi (ordres de réparation et planning sur écran ; ce qui ne change pas : le brief du matin, les rôles, le contrôle finition), le quand (formation dans six semaines, bascule dans trois mois, tableau blanc gardé un mois), le comment (Amine référent, Sophie en soutien, droit à l''erreur pendant deux mois), ce qui est ouvert (l''équipe choisit comment le planning s''affiche à l''atelier). Thierry : « Je ne toucherai pas à ce truc. » Karim : « Je sais que c''est ce qui te plaît le moins. On en parle tous les deux. » Marc : « Ça va servir à nous fliquer ? » Karim : « Le logiciel enregistre les temps par véhicule, comme les fiches le font aujourd''hui. Il ne servira pas à comparer les personnes, et je le dis devant tout le monde. Il servira à savoir où en est chaque véhicule. »

Les semaines suivantes : entretien avec Thierry, qui accepte qu''Amine saisisse pour lui le premier mois puis apprenne les trois écrans dont il a besoin ; premier succès à deux semaines (zéro pièce manquante au démontage sur la semaine, grâce au suivi dans l''outil), affiché ; relance de Michel qui voulait supprimer le tableau blanc dès la première semaine ; au bout de deux mois, le tableau blanc disparaît de lui-même parce que plus personne ne le regarde. À trois mois, la règle « tout ordre de réparation est dans l''outil avant le démontage » entre dans les règles de l''atelier et dans la check-list d''intégration.

## À retenir

- On résiste moins au changement lui-même qu''aux pertes, à l''incompréhension, à l''imposition et à la peur de ne pas y arriver.
- Lewin : rendre l''ancienne pratique discutable, changer, stabiliser ; réduire les freins plutôt que pousser plus fort.
- La courbe d''adaptation (adaptée de Kübler-Ross) est un repère non validé scientifiquement, pas une loi : les réactions négatives des premières semaines sont normales et passent si on les accompagne.
- Kotter à l''échelle de l''équipe : le pourquoi factuel, des alliés, une vision en deux phrases, répétée dix fois, les obstacles levés, un premier succès visible, la persévérance, l''ancrage dans les règles.
- Le manager relais s''informe et négocie des marges avant, porte la décision à la première personne pendant, fait remonter après.
- Annoncer en réunion : pourquoi, quoi (et ce qui ne change pas), quand, comment, ce qui reste ouvert. Puis redire, voir les inquiets, montrer les résultats.

## Sources

- John P. Kotter, « Leading Change: Why Transformation Efforts Fail », *Harvard Business Review*, mars-avril 1995 ; *Conduire le changement : feuille de route en 8 étapes*, Pearson, 2015 (éd. originale *Leading Change*, Harvard Business School Press, 1996) ; *Accelerate*, Harvard Business Review Press, 2014.
- Mark Hughes, « Do 70 Per Cent of All Organizational Change Initiatives Really Fail? », *Journal of Change Management*, vol. 11, n° 4, 2011.
- Kurt Lewin, « Frontiers in Group Dynamics », *Human Relations*, vol. 1, 1947 ; *Field Theory in Social Science*, Harper, 1951.
- Stephen Cummings, Todd Bridgman, Kenneth G. Brown, « Unfreezing change as three steps: Rethinking Kurt Lewin''s legacy for change management », *Human Relations*, vol. 69, n° 1, 2016.
- William Bridges, Susan Bridges, *Managing Transitions*, 4e éd., Da Capo, 2016 — les pertes et les transitions.
- Elisabeth Kübler-Ross, *Les derniers instants de la vie*, Labor et Fides, 1975 (éd. originale *On Death and Dying*, 1969) — origine de la courbe, à utiliser avec prudence ; Elisabeth Kübler-Ross, David Kessler, *On Grief and Grieving*, Scribner, 2005 (les étapes ne sont ni linéaires ni obligatoires).
- ANACT, « 10 questions sur la conduite des projets de transformation », anact.fr.
- David Autissier, Jean-Michel Moutot, *Méthode de conduite du changement : diagnostic, accompagnement, performance*, 5e éd., Dunod, 2023.
- France Compétences, référentiel RS7377, compétences 9 et 10.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Un nouveau logiciel, une nouvelle organisation des horaires, un déménagement, une fusion de deux équipes, une nouvelle norme à appliquer : le manager de proximité ne décide presque jamais de ces changements, mais c''est lui qui les fait vivre, ou échouer. Vous lirez souvent que « 70 % des changements échouent ». Ce chiffre circule depuis les années 1990 sans base empirique solide : le chercheur Mark Hughes a remonté ses sources en 2011 et n''a trouvé aucune étude qui l''établisse. Ce qui est mieux établi, c''est que lorsqu''un changement déraille, c''est rarement pour une raison technique : c''est la façon dont les personnes ont été, ou non, associées. Et là, le manager de proximité est en première ligne.

## Pourquoi les gens résistent

Le mot « résistance » est trompeur : il laisse croire que les gens sont contre le changement par principe. Sur le terrain, on résiste surtout à ce qu''on perd, à ce qu''on ne comprend pas et à ce qu''on vous impose. Chacune de ces sources appelle une réponse différente du manager.

Les pertes. Tout changement fait perdre quelque chose : une compétence qui avait de la valeur (Bruno, dans le podcast du module 5, maîtrisait l''ancien système de commandes), une habitude confortable, un statut, une relation, un repère. Le manager qui ne voit pas la perte ne comprend pas la résistance. Réponse : nommer la perte, la reconnaître (« je sais que ça te coûte »), et montrer ce qui est gagné ou préservé.

L''incompréhension. Quand on ne sait pas pourquoi on change, ni vers quoi, on imagine le pire. Réponse : le sens, dit et redit ; le pourquoi avant le comment.

L''imposition. Un changement subi est combattu ; un changement auquel on a contribué est porté. Réponse : associer l''équipe à ce qui peut l''être, qui est souvent plus large qu''on ne croit. La décision de changer d''outil n''est pas négociable ; la façon de l''installer, l''ordre, le calendrier, les règles d''usage, le sont.

Il faut ajouter une quatrième source, moins avouable : la peur de ne pas y arriver. Quelqu''un qui n''a jamais travaillé sur écran et à qui l''on annonce un nouveau logiciel ne résiste pas par mauvaise volonté ; il a peur d''être ridicule devant les autres. Cela n''a rien à voir avec l''âge : on trouve cette peur à 25 ans comme à 55. Réponse : former, accompagner, et donner le droit à l''erreur pendant l''apprentissage (module 4).

## Un premier repère : dégeler, changer, figer (Lewin)

On attribue au psychologue Kurt Lewin, dans les années 1940, l''idée qu''un changement passe par trois temps : dégeler (rendre l''ancienne façon de faire discutable), changer, puis figer à nouveau (stabiliser la nouvelle pratique). Lewin parlait aussi de « champ de forces » : une situation tient parce que des forces qui poussent au changement et des forces qui le freinent s''équilibrent ; pour la faire bouger, il est souvent plus efficace de réduire les freins que de pousser plus fort. Les historiens du management (Cummings, Bridgman et Brown, 2016) ont montré que le modèle en trois étapes a été largement simplifié après sa mort : Lewin n''en a parlé qu''en passant, et le présentait comme un processus d''apprentissage de groupe, pas comme une recette. Retenez l''idée utile : on ne change pas une habitude sans l''avoir d''abord rendue discutable, et un changement non stabilisé revient en arrière.

## La courbe d''adaptation

On représente souvent les réactions au changement par une courbe dite « du changement », adaptée des travaux de la psychiatre Elisabeth Kübler-Ross. Son livre de 1969 décrivait cinq étapes observées chez des patients en fin de vie (déni, colère, marchandage, dépression, acceptation) ; le modèle a ensuite été étendu au deuil, puis, par des consultants et des formateurs, au monde du travail, avec des étapes ajoutées comme le choc ou l''engagement. Ses limites sont connues : il n''a pas été validé empiriquement, y compris dans son domaine d''origine, et Kübler-Ross elle-même a précisé plus tard que les étapes n''étaient ni linéaires ni obligatoires. Chacun les traverse à sa vitesse, certains ne passent pas par la colère, d''autres y reviennent. Prenez-la donc pour un repère pédagogique, pas pour une loi, et ne l''utilisez jamais pour « classer » quelqu''un. Le repère est utile pour une chose : il rappelle au manager que les réactions négatives des premières semaines sont normales, qu''elles ne signifient pas que le changement est mauvais, et qu''elles passent, à condition qu''on les accompagne.

Concrètement : le déni appelle une information répétée ; la colère, de l''écoute (module 3), sans la prendre pour soi ; le découragement, du soutien et des premiers succès ; l''acceptation, de la reconnaissance. Et le manager lui-même traverse la courbe, souvent avant l''équipe, parce qu''il a été informé plus tôt. Il doit s''en souvenir quand il s''impatiente devant une équipe qui en est encore au choc.

## Une méthode : les huit étapes de Kotter, à l''échelle d''une équipe

John Kotter, professeur à la Harvard Business School, a d''abord décrit en 1995, dans un article de la *Harvard Business Review* (« Leading Change: Why Transformation Efforts Fail »), les huit erreurs qu''il avait observées dans une centaine d''entreprises en transformation. Il en a tiré l''année suivante, dans son livre *Leading Change*, un modèle en huit étapes. Le modèle repose sur son expérience de consultant et d''enseignant, pas sur une étude contrôlée, et il est conçu pour des organisations entières. Mais chaque étape a sa traduction pour un manager de proximité qui doit faire adopter un changement à son équipe.

| Étape de Kotter | Pour le manager de proximité |
|---|---|
| 1. Créer un sentiment d''urgence | Expliquer pourquoi on ne peut pas rester comme ça, avec des faits (le client perdu, les reprises, le temps gaspillé), pas des slogans. |
| 2. Former une coalition | Identifier deux ou trois personnes de l''équipe qui comprennent l''enjeu, les associer tôt, s''appuyer sur elles. Un ancien respecté qui adhère vaut dix notes de service. |
| 3. Développer une vision | Dire en deux phrases à quoi ressemblera le travail après : « Dans trois mois, chaque véhicule a ses pièces le jour du démontage et personne ne court après Sophie. » |
| 4. Communiquer la vision | La répéter, dans chaque brief, chaque réunion, chaque entretien. Dans son article de 1995, Kotter écrit que les dirigeants sous-communiquent leur vision « d''un facteur dix ». Le manager de proximité aussi. |
| 5. Lever les obstacles | Repérer ce qui empêche concrètement (un outil manquant, une règle contradictoire, une personne qui bloque) et le traiter. Un obstacle laissé en place dit « le changement n''est pas sérieux ». |
| 6. Obtenir des victoires rapides | Choisir un premier résultat visible en quelques semaines, le mesurer, le montrer. C''est le principe du progrès (module 4) appliqué au changement. |
| 7. Consolider, ne pas crier victoire trop tôt | Après le premier succès, continuer : former les derniers, régler les cas particuliers, tenir les règles. Pour Kotter, c''est ici que beaucoup de changements s''enlisent, quand l''attention se relâche. |
| 8. Ancrer dans la culture | Inscrire le changement dans les règles de l''atelier, les fiches de poste, l''intégration des nouveaux, le tableau de bord. Ce qui n''est pas ancré revient en arrière dès que le manager regarde ailleurs. |

Kotter a lui-même fait évoluer son modèle (*Accelerate*, 2014) vers une version moins séquentielle, où plusieurs étapes se mènent en parallèle. À l''échelle d''une équipe, retenez surtout le sens, les alliés, une communication répétée, des obstacles levés, des premiers succès, puis de la persévérance une fois ces succès obtenus.

## Le manager relais : entre la décision et l''équipe

Dans la plupart des cas, le changement est décidé au-dessus du manager, qui doit le porter sans l''avoir choisi. C''est la situation de la leçon 1.7 et du podcast 3.8 : loyal vers le haut, loyal vers le bas.

Ce que cela implique. Avant l''annonce, le manager s''informe complètement (pourquoi, quoi, quand, quelles marges) et dit à sa hiérarchie ce qu''il anticipe comme difficultés et ce dont il a besoin. Il obtient, si possible, les marges de manœuvre qu''il pourra ouvrir à l''équipe. Pendant l''annonce et après, il porte la décision à la première personne (« voilà ce que nous faisons »), jamais « ils ont décidé ». Il ne cache pas ce qu''il ne sait pas : « Je n''ai pas encore la date, je vous la dis dès que je l''ai. » Il fait remonter ce que l''équipe vit, avec des faits, à sa hiérarchie, qui en a besoin pour ajuster. Et il ne promet pas ce qu''il ne maîtrise pas.

## Communiquer le changement : qui, quoi, quand

L''annonce se fait en réunion, en présence, jamais par e-mail ni par affichage (module 3). Elle contient : le pourquoi (les faits qui rendent le changement nécessaire), le quoi (ce qui change, et tout aussi important, ce qui ne change pas), le quand (les étapes et les dates connues), le comment (la formation, l''accompagnement, à qui s''adresser), et ce qui reste ouvert (sur quoi l''équipe peut peser). Puis un temps de questions, où le manager écoute les objections sans les balayer et note celles auxquelles il n''a pas de réponse.

L''annonce n''est que le début. Les semaines suivantes, le manager redit, en brief, en entretien, où on en est et ce qui vient. Les personnes les plus inquiètes sont vues individuellement. Les premiers résultats sont montrés. Les questions reviennent plusieurs fois : c''est normal, on ne retient pas une annonce du premier coup quand elle inquiète.

## Les erreurs qui coûtent le plus cher

- Annoncer sans le pourquoi, ou avec un pourquoi qui ne tient pas (« c''est la direction qui veut »).
- Promettre que « rien ne changera pour vous » quand c''est faux.
- Ne pas voir les pertes, et traiter la résistance comme de la mauvaise volonté.
- Former trop tard ou pas assez, et laisser les gens se débrouiller avec le nouvel outil.
- Crier victoire au premier succès et relâcher l''attention.
- Laisser un obstacle connu en place pendant des semaines.
- Se désolidariser de la décision devant l''équipe.

## Le cas Garnier — le logiciel d''atelier

Michel a acheté un logiciel de gestion d''atelier (ordres de réparation, planning, pièces, facturation) : fin des fiches papier et du tableau blanc dans trois mois. Il l''annonce à Karim un vendredi, en lui demandant « de gérer ».

Avant l''annonce, Karim obtient de Michel trois choses : la date de bascule (le 1er du mois dans trois mois), deux demi-journées de formation par l''éditeur, et la possibilité de garder le tableau blanc un mois en parallèle. Il identifie ses alliés : Sophie, qui attend ce logiciel depuis des années, et Amine, qui l''a utilisé dans son ancien atelier. Il anticipe les pertes : Thierry maîtrise le papier et déteste les écrans ; Marc craint que le logiciel serve à le chronométrer.

L''annonce, en réunion : le pourquoi (les fiches perdues, les deux reprises dues à des informations manquantes, le temps de Sophie), le quoi (ordres de réparation et planning sur écran ; ce qui ne change pas : le brief du matin, les rôles, le contrôle finition), le quand (formation dans six semaines, bascule dans trois mois, tableau blanc gardé un mois), le comment (Amine référent, Sophie en soutien, droit à l''erreur pendant deux mois), ce qui est ouvert (l''équipe choisit comment le planning s''affiche à l''atelier). Thierry : « Je ne toucherai pas à ce truc. » Karim : « Je sais que c''est ce qui te plaît le moins. On en parle tous les deux. » Marc : « Ça va servir à nous fliquer ? » Karim : « Le logiciel enregistre les temps par véhicule, comme les fiches le font aujourd''hui. Il ne servira pas à comparer les personnes, et je le dis devant tout le monde. Il servira à savoir où en est chaque véhicule. »

Les semaines suivantes : entretien avec Thierry, qui accepte qu''Amine saisisse pour lui le premier mois puis apprenne les trois écrans dont il a besoin ; premier succès à deux semaines (zéro pièce manquante au démontage sur la semaine, grâce au suivi dans l''outil), affiché ; relance de Michel qui voulait supprimer le tableau blanc dès la première semaine ; au bout de deux mois, le tableau blanc disparaît de lui-même parce que plus personne ne le regarde. À trois mois, la règle « tout ordre de réparation est dans l''outil avant le démontage » entre dans les règles de l''atelier et dans la check-list d''intégration.

## À retenir

- On résiste moins au changement lui-même qu''aux pertes, à l''incompréhension, à l''imposition et à la peur de ne pas y arriver.
- Lewin : rendre l''ancienne pratique discutable, changer, stabiliser ; réduire les freins plutôt que pousser plus fort.
- La courbe d''adaptation (adaptée de Kübler-Ross) est un repère non validé scientifiquement, pas une loi : les réactions négatives des premières semaines sont normales et passent si on les accompagne.
- Kotter à l''échelle de l''équipe : le pourquoi factuel, des alliés, une vision en deux phrases, répétée dix fois, les obstacles levés, un premier succès visible, la persévérance, l''ancrage dans les règles.
- Le manager relais s''informe et négocie des marges avant, porte la décision à la première personne pendant, fait remonter après.
- Annoncer en réunion : pourquoi, quoi (et ce qui ne change pas), quand, comment, ce qui reste ouvert. Puis redire, voir les inquiets, montrer les résultats.

## Sources

- John P. Kotter, « Leading Change: Why Transformation Efforts Fail », *Harvard Business Review*, mars-avril 1995 ; *Conduire le changement : feuille de route en 8 étapes*, Pearson, 2015 (éd. originale *Leading Change*, Harvard Business School Press, 1996) ; *Accelerate*, Harvard Business Review Press, 2014.
- Mark Hughes, « Do 70 Per Cent of All Organizational Change Initiatives Really Fail? », *Journal of Change Management*, vol. 11, n° 4, 2011.
- Kurt Lewin, « Frontiers in Group Dynamics », *Human Relations*, vol. 1, 1947 ; *Field Theory in Social Science*, Harper, 1951.
- Stephen Cummings, Todd Bridgman, Kenneth G. Brown, « Unfreezing change as three steps: Rethinking Kurt Lewin''s legacy for change management », *Human Relations*, vol. 69, n° 1, 2016.
- William Bridges, Susan Bridges, *Managing Transitions*, 4e éd., Da Capo, 2016 — les pertes et les transitions.
- Elisabeth Kübler-Ross, *Les derniers instants de la vie*, Labor et Fides, 1975 (éd. originale *On Death and Dying*, 1969) — origine de la courbe, à utiliser avec prudence ; Elisabeth Kübler-Ross, David Kessler, *On Grief and Grieving*, Scribner, 2005 (les étapes ne sont ni linéaires ni obligatoires).
- ANACT, « 10 questions sur la conduite des projets de transformation », anact.fr.
- David Autissier, Jean-Michel Moutot, *Méthode de conduite du changement : diagnostic, accompagnement, performance*, 5e éd., Dunod, 2023.
- France Compétences, référentiel RS7377, compétences 9 et 10.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 7 and l.ordre = 4;
  n := n + 1;

  -- 6.5-video-changement-impopulaire.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Annoncer un changement impopulaire

Vous connaissez maintenant la méthode. Voyons-la sur le cas le plus difficile : un changement décidé au-dessus de vous, que vous n''auriez pas choisi, et que l''équipe va détester.

Le cadre : un magasin de bricolage, dix-huit salariés. La direction régionale décide que le magasin ouvrira désormais le dimanche matin, de 9 h à 13 h, dans le cadre légal des dérogations au repos dominical et avec les contreparties prévues par l''accord de branche. La responsable du magasin s''appelle Inès. Elle l''apprend un mardi, par un appel de quinze minutes, avec une consigne : « Tu annonces à l''équipe cette semaine, ça démarre dans deux mois. »

## Ce qui échoue

Première version, celle qui échoue. Inès, pressée et elle-même contrariée, envoie un message sur le groupe de l''équipe le mardi soir :

« Bonjour à tous. La direction a décidé l''ouverture le dimanche matin à partir du 1er mars. Un planning sera communiqué. Je sais que ça ne va pas plaire, mais ce n''est pas moi qui décide. »

Tout y est. L''écrit pour une mauvaise nouvelle. Aucun pourquoi. Aucune information sur ce qui est négociable, sur les contreparties, sur le volontariat. Et la phrase qui achève : « ce n''est pas moi qui décide ». Inès vient de se désolidariser de la décision et de se placer du côté de l''équipe contre la direction. Résultat prévisible : le mercredi matin, trois personnes l''attendent à l''entrée, furieuses, deux ont écrit à la direction régionale, et Inès n''est plus la responsable du magasin, elle est la messagère.

## Avant l''annonce : s''informer et négocier

Deuxième version. Inès raccroche, et avant toute chose, elle rappelle sa directrice régionale le lendemain, avec des questions préparées.

INÈS : « J''ai besoin de comprendre pour pouvoir l''expliquer. Pourquoi le dimanche ? »
DIRECTRICE : « Les trois concurrents de la zone ouvrent. On perd des clients du week-end, et le chiffre du samedi baisse depuis un an. »
INÈS : « Quel est le cadre pour les salariés ? Volontariat ? Contreparties ? »
DIRECTRICE : « Volontariat, c''est garanti par l''accord de branche, et on le recueille par écrit. Majoration et repos compensateur selon le même accord. »
INÈS : « Combien de personnes faut-il le dimanche ? »
DIRECTRICE : « Six. »
INÈS : « Donc douze personnes ne sont pas concernées, et six volontaires suffisent. Est-ce que je peux construire le planning avec l''équipe, par roulement, en respectant un dimanche sur trois maximum ? »
DIRECTRICE : « Si tu as tes six volontaires, oui. »
INÈS : « Et si je ne les ai pas ? »
DIRECTRICE : « On en reparle. On verra avec les intérimaires. »
INÈS : « Je vous le dis maintenant : je vais avoir des réactions fortes. Je vous propose de vous faire un point dans quinze jours. »

En dix minutes, Inès a obtenu le pourquoi, le cadre légal, et une marge de manœuvre considérable : le volontariat, le roulement, la construction du planning avec l''équipe. Elle a aussi prévenu sa hiérarchie, et obtenu un rendez-vous. C''est le manager relais du module 1 : loyal vers le haut, c''est-à-dire exigeant vers le haut.

## L''annonce

Jeudi, réunion de toute l''équipe, trente minutes, avant l''ouverture. Inès a préparé cinq points : pourquoi, quoi, ce qui ne change pas, quand, ce qui est ouvert.

INÈS : « J''ai une décision à vous annoncer, qui vient de la direction, et que je vais porter avec vous. À partir du 1er mars, le magasin ouvre le dimanche matin, de 9 h à 13 h. Je vous dis d''abord pourquoi : les trois concurrents de la zone ouvrent le dimanche, et notre chiffre du samedi baisse depuis un an. Les clients du week-end vont ailleurs. Si on ne fait rien, c''est l''emploi ici qui est en jeu à terme. »

« Ce qui change : six personnes le dimanche matin. Ce qui ne change pas : vos horaires de la semaine, et personne n''est obligé. Le dimanche, c''est sur la base du volontariat, par écrit, avec les contreparties de l''accord de branche : majoration et repos compensateur. Je vous les détaillerai individuellement. »

« Ce qui est ouvert, et sur quoi j''ai besoin de vous : on construit le planning ensemble, par roulement, un dimanche sur trois maximum pour les volontaires. Et je veux savoir ce qui vous poserait problème, pour voir ce qu''on peut régler. »

« Maintenant, je vous écoute. »

DAVID : « Et si personne n''est volontaire ? »
INÈS : « Alors je retourne voir la direction avec ce fait, et on en reparle. Je ne vous mentirai pas : ils regardent aussi l''intérim. Mais je préfère six personnes d''ici qu''on connaît. »
CÉLINE : « Moi j''ai les enfants le dimanche, c''est non. »
INÈS : « C''est noté, et c''est respecté. Le volontariat, c''est pour ça. »
MEHDI : « Vous l''avez appris quand ? »
INÈS : « Mardi. J''ai pris deux jours pour avoir des réponses avant de vous en parler. »
LÉA : « Et la majoration, c''est combien ? »
INÈS : « Je vous le dis en entretien individuel cette semaine, avec votre situation. Je ne veux pas donner un chiffre faux devant tout le monde. »

Regardez ce qu''Inès a fait. Elle a porté la décision à la première personne, sans la désavouer et sans prétendre l''avoir prise. Elle a donné le pourquoi avec des faits. Elle a dit ce qui ne change pas avant qu''on lui demande. Elle a ouvert ce qui pouvait l''être. Elle a écouté chaque objection sans la balayer, y compris celle sur le délai, à laquelle elle a répondu honnêtement. Et quand elle ne savait pas, elle l''a dit.

## Après l''annonce

L''annonce est le début. La semaine suivante, Inès voit chacun en entretien, dix minutes : situation personnelle, contreparties exactes, volontaire ou non, contraintes. Elle obtient sept volontaires, dont David, qui a compris l''enjeu pour le magasin. Céline n''est pas volontaire, et ne subit aucune remarque. Le planning est construit avec les sept, affiché trois semaines avant.

Elle redit, à chaque brief, où en est la préparation. Elle fait son point à la directrice régionale à quinze jours, avec les faits : sept volontaires, deux inquiétudes sur la garde d''enfants, une demande de formation pour la caisse du dimanche. Et après le premier dimanche, elle réunit les sept pour un retour d''expérience : ce qui a marché, ce qui a manqué. Deux ajustements, affichés. Le premier succès, un dimanche à 4 200 euros de chiffre, est annoncé à toute l''équipe.

## Les trois erreurs qui coûtent le plus cher

Première erreur : annoncer sans s''être informé. On ne peut pas porter ce qu''on ne comprend pas, et on ne peut pas ouvrir des marges qu''on n''a pas demandées.

Deuxième erreur : se désolidariser. « Ce n''est pas moi qui décide » est vrai, et c''est la phrase qui détruit votre rôle. Vous contestez avant, en face, vers le haut ; vous portez après, devant l''équipe.

Troisième erreur : considérer que l''annonce suffit. Un changement impopulaire se porte pendant des semaines : entretiens individuels, répétition, premier succès montré, ajustements.

Et une quatrième, plus discrète : promettre que rien ne changera. Si c''est faux, vous l''aurez payé au centuple.

À tout de suite pour le management à distance et en hybride.

## Sources
Kotter (1996, 2014) ; Bridges (2016) sur les pertes ; Code du travail, art. L3132-3 (repos dominical) et L3132-12 (dérogations permanentes de droit), décret n° 2014-302 du 7 mars 2014 (commerce de détail de bricolage) ; accord de branche du bricolage du 23 janvier 2014 relatif au travail du dimanche (volontariat, contreparties), code.travail.gouv.fr ; leçons 1.7, 3.8 et 6.4.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Annoncer un changement impopulaire

Vous connaissez maintenant la méthode. Voyons-la sur le cas le plus difficile : un changement décidé au-dessus de vous, que vous n''auriez pas choisi, et que l''équipe va détester.

Le cadre : un magasin de bricolage, dix-huit salariés. La direction régionale décide que le magasin ouvrira désormais le dimanche matin, de 9 h à 13 h, dans le cadre légal des dérogations au repos dominical et avec les contreparties prévues par l''accord de branche. La responsable du magasin s''appelle Inès. Elle l''apprend un mardi, par un appel de quinze minutes, avec une consigne : « Tu annonces à l''équipe cette semaine, ça démarre dans deux mois. »

## Ce qui échoue

Première version, celle qui échoue. Inès, pressée et elle-même contrariée, envoie un message sur le groupe de l''équipe le mardi soir :

« Bonjour à tous. La direction a décidé l''ouverture le dimanche matin à partir du 1er mars. Un planning sera communiqué. Je sais que ça ne va pas plaire, mais ce n''est pas moi qui décide. »

Tout y est. L''écrit pour une mauvaise nouvelle. Aucun pourquoi. Aucune information sur ce qui est négociable, sur les contreparties, sur le volontariat. Et la phrase qui achève : « ce n''est pas moi qui décide ». Inès vient de se désolidariser de la décision et de se placer du côté de l''équipe contre la direction. Résultat prévisible : le mercredi matin, trois personnes l''attendent à l''entrée, furieuses, deux ont écrit à la direction régionale, et Inès n''est plus la responsable du magasin, elle est la messagère.

## Avant l''annonce : s''informer et négocier

Deuxième version. Inès raccroche, et avant toute chose, elle rappelle sa directrice régionale le lendemain, avec des questions préparées.

INÈS : « J''ai besoin de comprendre pour pouvoir l''expliquer. Pourquoi le dimanche ? »
DIRECTRICE : « Les trois concurrents de la zone ouvrent. On perd des clients du week-end, et le chiffre du samedi baisse depuis un an. »
INÈS : « Quel est le cadre pour les salariés ? Volontariat ? Contreparties ? »
DIRECTRICE : « Volontariat, c''est garanti par l''accord de branche, et on le recueille par écrit. Majoration et repos compensateur selon le même accord. »
INÈS : « Combien de personnes faut-il le dimanche ? »
DIRECTRICE : « Six. »
INÈS : « Donc douze personnes ne sont pas concernées, et six volontaires suffisent. Est-ce que je peux construire le planning avec l''équipe, par roulement, en respectant un dimanche sur trois maximum ? »
DIRECTRICE : « Si tu as tes six volontaires, oui. »
INÈS : « Et si je ne les ai pas ? »
DIRECTRICE : « On en reparle. On verra avec les intérimaires. »
INÈS : « Je vous le dis maintenant : je vais avoir des réactions fortes. Je vous propose de vous faire un point dans quinze jours. »

En dix minutes, Inès a obtenu le pourquoi, le cadre légal, et une marge de manœuvre considérable : le volontariat, le roulement, la construction du planning avec l''équipe. Elle a aussi prévenu sa hiérarchie, et obtenu un rendez-vous. C''est le manager relais du module 1 : loyal vers le haut, c''est-à-dire exigeant vers le haut.

## L''annonce

Jeudi, réunion de toute l''équipe, trente minutes, avant l''ouverture. Inès a préparé cinq points : pourquoi, quoi, ce qui ne change pas, quand, ce qui est ouvert.

INÈS : « J''ai une décision à vous annoncer, qui vient de la direction, et que je vais porter avec vous. À partir du 1er mars, le magasin ouvre le dimanche matin, de 9 h à 13 h. Je vous dis d''abord pourquoi : les trois concurrents de la zone ouvrent le dimanche, et notre chiffre du samedi baisse depuis un an. Les clients du week-end vont ailleurs. Si on ne fait rien, c''est l''emploi ici qui est en jeu à terme. »

« Ce qui change : six personnes le dimanche matin. Ce qui ne change pas : vos horaires de la semaine, et personne n''est obligé. Le dimanche, c''est sur la base du volontariat, par écrit, avec les contreparties de l''accord de branche : majoration et repos compensateur. Je vous les détaillerai individuellement. »

« Ce qui est ouvert, et sur quoi j''ai besoin de vous : on construit le planning ensemble, par roulement, un dimanche sur trois maximum pour les volontaires. Et je veux savoir ce qui vous poserait problème, pour voir ce qu''on peut régler. »

« Maintenant, je vous écoute. »

DAVID : « Et si personne n''est volontaire ? »
INÈS : « Alors je retourne voir la direction avec ce fait, et on en reparle. Je ne vous mentirai pas : ils regardent aussi l''intérim. Mais je préfère six personnes d''ici qu''on connaît. »
CÉLINE : « Moi j''ai les enfants le dimanche, c''est non. »
INÈS : « C''est noté, et c''est respecté. Le volontariat, c''est pour ça. »
MEHDI : « Vous l''avez appris quand ? »
INÈS : « Mardi. J''ai pris deux jours pour avoir des réponses avant de vous en parler. »
LÉA : « Et la majoration, c''est combien ? »
INÈS : « Je vous le dis en entretien individuel cette semaine, avec votre situation. Je ne veux pas donner un chiffre faux devant tout le monde. »

Regardez ce qu''Inès a fait. Elle a porté la décision à la première personne, sans la désavouer et sans prétendre l''avoir prise. Elle a donné le pourquoi avec des faits. Elle a dit ce qui ne change pas avant qu''on lui demande. Elle a ouvert ce qui pouvait l''être. Elle a écouté chaque objection sans la balayer, y compris celle sur le délai, à laquelle elle a répondu honnêtement. Et quand elle ne savait pas, elle l''a dit.

## Après l''annonce

L''annonce est le début. La semaine suivante, Inès voit chacun en entretien, dix minutes : situation personnelle, contreparties exactes, volontaire ou non, contraintes. Elle obtient sept volontaires, dont David, qui a compris l''enjeu pour le magasin. Céline n''est pas volontaire, et ne subit aucune remarque. Le planning est construit avec les sept, affiché trois semaines avant.

Elle redit, à chaque brief, où en est la préparation. Elle fait son point à la directrice régionale à quinze jours, avec les faits : sept volontaires, deux inquiétudes sur la garde d''enfants, une demande de formation pour la caisse du dimanche. Et après le premier dimanche, elle réunit les sept pour un retour d''expérience : ce qui a marché, ce qui a manqué. Deux ajustements, affichés. Le premier succès, un dimanche à 4 200 euros de chiffre, est annoncé à toute l''équipe.

## Les trois erreurs qui coûtent le plus cher

Première erreur : annoncer sans s''être informé. On ne peut pas porter ce qu''on ne comprend pas, et on ne peut pas ouvrir des marges qu''on n''a pas demandées.

Deuxième erreur : se désolidariser. « Ce n''est pas moi qui décide » est vrai, et c''est la phrase qui détruit votre rôle. Vous contestez avant, en face, vers le haut ; vous portez après, devant l''équipe.

Troisième erreur : considérer que l''annonce suffit. Un changement impopulaire se porte pendant des semaines : entretiens individuels, répétition, premier succès montré, ajustements.

Et une quatrième, plus discrète : promettre que rien ne changera. Si c''est faux, vous l''aurez payé au centuple.

À tout de suite pour le management à distance et en hybride.

## Sources
Kotter (1996, 2014) ; Bridges (2016) sur les pertes ; Code du travail, art. L3132-3 (repos dominical) et L3132-12 (dérogations permanentes de droit), décret n° 2014-302 du 7 mars 2014 (commerce de détail de bricolage) ; accord de branche du bricolage du 23 janvier 2014 relatif au travail du dimanche (volontariat, contreparties), code.travail.gouv.fr ; leçons 1.7, 3.8 et 6.4.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 7 and l.ordre = 5;
  n := n + 1;

  -- 6.6-manager-a-distance-et-en-hybride.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Au premier semestre 2024, 22 % des salariés du secteur privé ont télétravaillé au moins une fois au cours des quatre semaines précédant l''enquête, en moyenne 1,9 jour par semaine. Entre mi-2022 et mi-2024, c''était le cas de 63 % des cadres, de 10 % des employés et de quasiment aucun ouvrier (Insee Analyses n° 105, mars 2025). Ces chiffres disent deux choses au manager de proximité. D''abord, le télétravail est devenu une réalité ordinaire pour une partie des équipes, et un manager doit savoir le gérer. Ensuite, il est très inégalement réparti : dans un atelier, un commerce, un service de soins, il concerne un ou deux postes, pas l''équipe, et c''est cette asymétrie qui pose le plus de questions.

Cette leçon traite du management d''une équipe dont une partie travaille à distance, de façon régulière ou occasionnelle, et d''une équipe éclatée sur plusieurs sites. Le cadre légal a été vu en leçon 4.6 ; ici, il s''agit de la pratique.

## Ce qui change, ce qui ne change pas

Les principes ne changent pas : objectifs clairs, rôles définis, feedback, entretiens, reconnaissance, cadre équitable. Ce qui change, c''est que le manager perd l''information informelle : le coup d''œil dans l''atelier, la conversation à la machine à café, la tête que fait quelqu''un en sortant d''une réunion. À distance, cette information doit être remplacée par des rituels explicites, sinon le manager pilote à l''aveugle et compense par de la surveillance.

Une étude de la Dares publiée en novembre 2024, à partir d''une enquête de 2023, donne une image nuancée. À distance, les télétravailleurs disposent de plus de latitude pour organiser leur temps et leur travail y est moins intense (moins d''interruptions) ; en revanche, ils déclarent moins de soutien de leurs collègues et de leur hiérarchie. Le télétravail n''est donc ni bon ni mauvais en soi : ce qui se perd le plus facilement, c''est le soutien, et c''est précisément ce qui dépend du manager.

## Manager sur les résultats, pas sur la présence

La première erreur du manager à distance est de chercher à reproduire le contrôle de la présence : logiciels de surveillance, demandes de « statut » toutes les heures, réunions pour vérifier que les gens sont là. Cela abîme la confiance, et c''est encadré par le droit : aucune information concernant personnellement un salarié ne peut être collectée par un dispositif qui ne lui a pas été préalablement porté à sa connaissance (L1222-4) ; le CSE, là où il existe, est informé et consulté avant la mise en œuvre de moyens de contrôle de l''activité (L2312-38) ; et toute restriction aux libertés doit être justifiée et proportionnée (L1121-1). La CNIL est explicite : une surveillance constante par webcam ou micro, le partage d''écran permanent ou les enregistreurs de frappe (« keyloggers ») constituent une surveillance permanente et disproportionnée, sauf cas exceptionnels liés à la nature de la tâche.

L''alternative est de manager sur les résultats : des objectifs précis (module 2), des livrables définis, des échéances, et un point régulier où l''on regarde ce qui a été produit. Le télétravailleur sait ce qu''on attend de lui à la fin de la journée ou de la semaine, et il a la liberté de s''organiser. C''est le niveau de délégation « décide et tiens-moi informé », qui suppose que la personne soit autonome sur ses tâches. Un débutant ou une personne en difficulté télétravaille moins, ou avec un accompagnement renforcé, et ce n''est pas une sanction.

## Les rituels adaptés

Les rituels du module 3 restent, adaptés :

- Le brief quotidien devient un point court en visioconférence ou par message écrit à heure fixe (« ce que je fais aujourd''hui, ce qui me bloque »). Dix minutes, caméra allumée si possible.
- Le point hebdomadaire se tient en visioconférence, avec un ordre du jour écrit à l''avance, 45 minutes maximum, un rapporteur, et des tours de parole explicites : à distance, personne ne « prend » la parole naturellement, l''animateur la donne.
- L''entretien de suivi individuel est le rituel le plus important à distance. Il se tient en visioconférence, caméra allumée, sans autre fenêtre ouverte, à la même fréquence qu''en présence, et il commence toujours par « comment ça va, vraiment ? ». C''est là que se détecte l''isolement.
- Un temps collectif en présence, régulier : une journée par semaine où tout le monde est là, ou une réunion mensuelle sur site. Même les équipes entièrement à distance gagnent à se retrouver de temps en temps, ne serait-ce que pour les sujets qui passent mal en visio.

Deux règles d''hygiène : des plages de joignabilité définies (quand le télétravail est mis en place par accord collectif ou par charte, L1222-9 impose d''y préciser les plages horaires pendant lesquelles l''employeur peut habituellement contacter le salarié) et respectées dans les deux sens ; et la règle du canal : ce qui est délicat se dit en visio ou par téléphone, jamais par message écrit. Un recadrage par messagerie instantanée est une erreur qu''on ne rattrape pas.

## Repérer l''isolement

Le risque principal du télétravail, pour la personne, est l''isolement : perte du lien, sentiment de ne plus compter, difficulté à demander de l''aide, journées qui s''allongent sans que personne le voie. Les signaux : des messages de plus en plus tardifs, un silence en réunion, des réponses courtes, une personne qui ne demande plus rien, une baisse de qualité qui n''est pas expliquée. Le manager réagit comme au module 4 : il voit la personne, seul à seul, en visio ou mieux en présence, avec des faits, et il écoute. Et il traite ce qui dépend de lui : la charge, le lien (un binôme, un projet commun), le retour sur site s''il est souhaité.

## L''équité entre présents et distants

C''est la question qui fait le plus de dégâts dans les équipes hybrides, et elle a deux faces.

Les distants risquent d''être les oubliés : ils ne sont pas dans la pièce quand une décision se prend, ils n''ont pas l''information informelle, ils sont moins sollicités pour les missions intéressantes, moins visibles pour la reconnaissance et la promotion. Le risque est documenté, avec des nuances. Dans une expérience menée en Chine en 2010-2011, les salariés passés au télétravail à plein temps ont été, à performance égale, moins souvent promus (Bloom et al., 2015). Dans une expérience plus récente, avec deux jours de télétravail par semaine, la même équipe n''a observé aucun écart d''évaluation ni de promotion sur deux ans, et une baisse d''un tiers des démissions (Bloom et al., 2024). Ce qui fait la différence, c''est la place que le manager garde aux distants. Le manager compense délibérément : les décisions se prennent en réunion, pas au café ; l''information importante est écrite et envoyée à tous ; les missions sont attribuées sur un critère objectif, en tenant le compte (leçon 4.6) ; la reconnaissance est explicite et inclut les distants.

Les présents sont les frustrés : dans une équipe où seuls certains postes sont éligibles au télétravail, ceux qui ne peuvent pas (l''atelier, la caisse, le soin) voient les autres chez eux. Le manager explique une fois, clairement, que l''éligibilité tient au poste, pas à la personne, et il cherche d''autres souplesses pour les postes non éligibles : horaires, jours, récupérations, choix dans le planning. Il veille aussi à ce que les présents n''absorbent pas les tâches des absents « parce qu''ils sont là ».

## Le manager lui-même à distance

Un manager qui télétravaille encadre une équipe sur site : c''est fréquent dans les services, plus rare en atelier. Il doit alors être joignable, présent aux moments clés (brief, réunion, entretiens), et sur site les jours où l''équipe a besoin de lui. Un manager qu''on ne voit plus trois jours par semaine risque de perdre en légitimité, même avec d''excellents messages.

## Le cas Garnier

À l''atelier Garnier, le télétravail concerne un poste : Sophie, un jour par semaine, le mercredi, obtenu à la leçon 4.6. Karim installe trois règles : le mercredi, les demandes clients passent par le téléphone de l''atelier, redirigé vers Sophie, avec un message dans l''outil pour chaque urgence ; Sophie assiste au brief de 8 h en visio depuis son téléphone, cinq minutes ; et son entretien de suivi ne se tient jamais le mercredi, mais en présence. Le premier mois, Marc remarque que « Sophie n''est jamais là quand il y a un problème le mercredi ». Karim vérifie : deux appels manqués en quatre mercredis, parce que la redirection ne marchait pas. Il règle la redirection, le dit à l''équipe, et rappelle que l''éligibilité tient au poste : si quelqu''un veut un aménagement d''horaires, on en parle en entretien. Thierry demande à commencer à 7 h le vendredi pour finir plus tôt : accordé, par roulement avec Nadia, qui le souhaitait aussi.

## À retenir

- Le télétravail concerne 22 % des salariés du privé (Insee, 2025), très inégalement selon les postes : c''est l''asymétrie qui demande du management.
- À distance, on gagne en autonomie et on perd en soutien (Dares, 2024) : le soutien est le travail du manager.
- Manager sur les résultats, pas sur la présence ; la surveillance permanente est contre-productive et jugée disproportionnée par la CNIL.
- Rituels adaptés : brief court, point hebdo en visio avec tours de parole, entretien de suivi caméra allumée, temps collectif en présence régulier ; plages de joignabilité ; jamais de sujet délicat par écrit.
- Repérer l''isolement (messages tardifs, silence, baisse inexpliquée) et le traiter comme un signal du module 4.
- Équité : compenser l''invisibilité des distants (décisions en réunion, information écrite, missions sur critère), expliquer l''éligibilité par le poste aux présents et leur ouvrir d''autres souplesses.

## Sources

- Philippe Askenazy, Ugo Di Nallo, Ismaël Ramajo, Conrad Thiounn, « Télétravail et présentiel : le travail hybride, une pratique désormais ancrée dans les entreprises », *Insee Analyses* n° 105, mars 2025, insee.fr.
- Mikael Beatriz, Louis-Alexandre Erb, « Le télétravail améliore-t-il les conditions de travail et de vie des salariés ? », *Dares Analyses* n° 65, novembre 2024, dares.travail-emploi.gouv.fr.
- CNIL, « Les questions-réponses de la CNIL sur le télétravail », cnil.fr.
- Code du travail, art. L1121-1, L1222-4, L1222-9 à L1222-11, L2312-38 ; ANI du 26 novembre 2020 pour une mise en œuvre réussie du télétravail — legifrance.gouv.fr.
- ANACT, « Carnet de bord du télétravail », anact.fr.
- Nicholas Bloom, James Liang, John Roberts, Zhichun Jenny Ying, « Does Working from Home Work? Evidence from a Chinese Experiment », *Quarterly Journal of Economics*, vol. 130, n° 1, 2015.
- Nicholas Bloom, Ruobing Han, James Liang, « Hybrid working from home improves retention without damaging performance », *Nature*, vol. 630, 2024.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Au premier semestre 2024, 22 % des salariés du secteur privé ont télétravaillé au moins une fois au cours des quatre semaines précédant l''enquête, en moyenne 1,9 jour par semaine. Entre mi-2022 et mi-2024, c''était le cas de 63 % des cadres, de 10 % des employés et de quasiment aucun ouvrier (Insee Analyses n° 105, mars 2025). Ces chiffres disent deux choses au manager de proximité. D''abord, le télétravail est devenu une réalité ordinaire pour une partie des équipes, et un manager doit savoir le gérer. Ensuite, il est très inégalement réparti : dans un atelier, un commerce, un service de soins, il concerne un ou deux postes, pas l''équipe, et c''est cette asymétrie qui pose le plus de questions.

Cette leçon traite du management d''une équipe dont une partie travaille à distance, de façon régulière ou occasionnelle, et d''une équipe éclatée sur plusieurs sites. Le cadre légal a été vu en leçon 4.6 ; ici, il s''agit de la pratique.

## Ce qui change, ce qui ne change pas

Les principes ne changent pas : objectifs clairs, rôles définis, feedback, entretiens, reconnaissance, cadre équitable. Ce qui change, c''est que le manager perd l''information informelle : le coup d''œil dans l''atelier, la conversation à la machine à café, la tête que fait quelqu''un en sortant d''une réunion. À distance, cette information doit être remplacée par des rituels explicites, sinon le manager pilote à l''aveugle et compense par de la surveillance.

Une étude de la Dares publiée en novembre 2024, à partir d''une enquête de 2023, donne une image nuancée. À distance, les télétravailleurs disposent de plus de latitude pour organiser leur temps et leur travail y est moins intense (moins d''interruptions) ; en revanche, ils déclarent moins de soutien de leurs collègues et de leur hiérarchie. Le télétravail n''est donc ni bon ni mauvais en soi : ce qui se perd le plus facilement, c''est le soutien, et c''est précisément ce qui dépend du manager.

## Manager sur les résultats, pas sur la présence

La première erreur du manager à distance est de chercher à reproduire le contrôle de la présence : logiciels de surveillance, demandes de « statut » toutes les heures, réunions pour vérifier que les gens sont là. Cela abîme la confiance, et c''est encadré par le droit : aucune information concernant personnellement un salarié ne peut être collectée par un dispositif qui ne lui a pas été préalablement porté à sa connaissance (L1222-4) ; le CSE, là où il existe, est informé et consulté avant la mise en œuvre de moyens de contrôle de l''activité (L2312-38) ; et toute restriction aux libertés doit être justifiée et proportionnée (L1121-1). La CNIL est explicite : une surveillance constante par webcam ou micro, le partage d''écran permanent ou les enregistreurs de frappe (« keyloggers ») constituent une surveillance permanente et disproportionnée, sauf cas exceptionnels liés à la nature de la tâche.

L''alternative est de manager sur les résultats : des objectifs précis (module 2), des livrables définis, des échéances, et un point régulier où l''on regarde ce qui a été produit. Le télétravailleur sait ce qu''on attend de lui à la fin de la journée ou de la semaine, et il a la liberté de s''organiser. C''est le niveau de délégation « décide et tiens-moi informé », qui suppose que la personne soit autonome sur ses tâches. Un débutant ou une personne en difficulté télétravaille moins, ou avec un accompagnement renforcé, et ce n''est pas une sanction.

## Les rituels adaptés

Les rituels du module 3 restent, adaptés :

- Le brief quotidien devient un point court en visioconférence ou par message écrit à heure fixe (« ce que je fais aujourd''hui, ce qui me bloque »). Dix minutes, caméra allumée si possible.
- Le point hebdomadaire se tient en visioconférence, avec un ordre du jour écrit à l''avance, 45 minutes maximum, un rapporteur, et des tours de parole explicites : à distance, personne ne « prend » la parole naturellement, l''animateur la donne.
- L''entretien de suivi individuel est le rituel le plus important à distance. Il se tient en visioconférence, caméra allumée, sans autre fenêtre ouverte, à la même fréquence qu''en présence, et il commence toujours par « comment ça va, vraiment ? ». C''est là que se détecte l''isolement.
- Un temps collectif en présence, régulier : une journée par semaine où tout le monde est là, ou une réunion mensuelle sur site. Même les équipes entièrement à distance gagnent à se retrouver de temps en temps, ne serait-ce que pour les sujets qui passent mal en visio.

Deux règles d''hygiène : des plages de joignabilité définies (quand le télétravail est mis en place par accord collectif ou par charte, L1222-9 impose d''y préciser les plages horaires pendant lesquelles l''employeur peut habituellement contacter le salarié) et respectées dans les deux sens ; et la règle du canal : ce qui est délicat se dit en visio ou par téléphone, jamais par message écrit. Un recadrage par messagerie instantanée est une erreur qu''on ne rattrape pas.

## Repérer l''isolement

Le risque principal du télétravail, pour la personne, est l''isolement : perte du lien, sentiment de ne plus compter, difficulté à demander de l''aide, journées qui s''allongent sans que personne le voie. Les signaux : des messages de plus en plus tardifs, un silence en réunion, des réponses courtes, une personne qui ne demande plus rien, une baisse de qualité qui n''est pas expliquée. Le manager réagit comme au module 4 : il voit la personne, seul à seul, en visio ou mieux en présence, avec des faits, et il écoute. Et il traite ce qui dépend de lui : la charge, le lien (un binôme, un projet commun), le retour sur site s''il est souhaité.

## L''équité entre présents et distants

C''est la question qui fait le plus de dégâts dans les équipes hybrides, et elle a deux faces.

Les distants risquent d''être les oubliés : ils ne sont pas dans la pièce quand une décision se prend, ils n''ont pas l''information informelle, ils sont moins sollicités pour les missions intéressantes, moins visibles pour la reconnaissance et la promotion. Le risque est documenté, avec des nuances. Dans une expérience menée en Chine en 2010-2011, les salariés passés au télétravail à plein temps ont été, à performance égale, moins souvent promus (Bloom et al., 2015). Dans une expérience plus récente, avec deux jours de télétravail par semaine, la même équipe n''a observé aucun écart d''évaluation ni de promotion sur deux ans, et une baisse d''un tiers des démissions (Bloom et al., 2024). Ce qui fait la différence, c''est la place que le manager garde aux distants. Le manager compense délibérément : les décisions se prennent en réunion, pas au café ; l''information importante est écrite et envoyée à tous ; les missions sont attribuées sur un critère objectif, en tenant le compte (leçon 4.6) ; la reconnaissance est explicite et inclut les distants.

Les présents sont les frustrés : dans une équipe où seuls certains postes sont éligibles au télétravail, ceux qui ne peuvent pas (l''atelier, la caisse, le soin) voient les autres chez eux. Le manager explique une fois, clairement, que l''éligibilité tient au poste, pas à la personne, et il cherche d''autres souplesses pour les postes non éligibles : horaires, jours, récupérations, choix dans le planning. Il veille aussi à ce que les présents n''absorbent pas les tâches des absents « parce qu''ils sont là ».

## Le manager lui-même à distance

Un manager qui télétravaille encadre une équipe sur site : c''est fréquent dans les services, plus rare en atelier. Il doit alors être joignable, présent aux moments clés (brief, réunion, entretiens), et sur site les jours où l''équipe a besoin de lui. Un manager qu''on ne voit plus trois jours par semaine risque de perdre en légitimité, même avec d''excellents messages.

## Le cas Garnier

À l''atelier Garnier, le télétravail concerne un poste : Sophie, un jour par semaine, le mercredi, obtenu à la leçon 4.6. Karim installe trois règles : le mercredi, les demandes clients passent par le téléphone de l''atelier, redirigé vers Sophie, avec un message dans l''outil pour chaque urgence ; Sophie assiste au brief de 8 h en visio depuis son téléphone, cinq minutes ; et son entretien de suivi ne se tient jamais le mercredi, mais en présence. Le premier mois, Marc remarque que « Sophie n''est jamais là quand il y a un problème le mercredi ». Karim vérifie : deux appels manqués en quatre mercredis, parce que la redirection ne marchait pas. Il règle la redirection, le dit à l''équipe, et rappelle que l''éligibilité tient au poste : si quelqu''un veut un aménagement d''horaires, on en parle en entretien. Thierry demande à commencer à 7 h le vendredi pour finir plus tôt : accordé, par roulement avec Nadia, qui le souhaitait aussi.

## À retenir

- Le télétravail concerne 22 % des salariés du privé (Insee, 2025), très inégalement selon les postes : c''est l''asymétrie qui demande du management.
- À distance, on gagne en autonomie et on perd en soutien (Dares, 2024) : le soutien est le travail du manager.
- Manager sur les résultats, pas sur la présence ; la surveillance permanente est contre-productive et jugée disproportionnée par la CNIL.
- Rituels adaptés : brief court, point hebdo en visio avec tours de parole, entretien de suivi caméra allumée, temps collectif en présence régulier ; plages de joignabilité ; jamais de sujet délicat par écrit.
- Repérer l''isolement (messages tardifs, silence, baisse inexpliquée) et le traiter comme un signal du module 4.
- Équité : compenser l''invisibilité des distants (décisions en réunion, information écrite, missions sur critère), expliquer l''éligibilité par le poste aux présents et leur ouvrir d''autres souplesses.

## Sources

- Philippe Askenazy, Ugo Di Nallo, Ismaël Ramajo, Conrad Thiounn, « Télétravail et présentiel : le travail hybride, une pratique désormais ancrée dans les entreprises », *Insee Analyses* n° 105, mars 2025, insee.fr.
- Mikael Beatriz, Louis-Alexandre Erb, « Le télétravail améliore-t-il les conditions de travail et de vie des salariés ? », *Dares Analyses* n° 65, novembre 2024, dares.travail-emploi.gouv.fr.
- CNIL, « Les questions-réponses de la CNIL sur le télétravail », cnil.fr.
- Code du travail, art. L1121-1, L1222-4, L1222-9 à L1222-11, L2312-38 ; ANI du 26 novembre 2020 pour une mise en œuvre réussie du télétravail — legifrance.gouv.fr.
- ANACT, « Carnet de bord du télétravail », anact.fr.
- Nicholas Bloom, James Liang, John Roberts, Zhichun Jenny Ying, « Does Working from Home Work? Evidence from a Chinese Experiment », *Quarterly Journal of Economics*, vol. 130, n° 1, 2015.
- Nicholas Bloom, Ruobing Han, James Liang, « Hybrid working from home improves retention without damaging performance », *Nature*, vol. 630, 2024.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 7 and l.ordre = 6;
  n := n + 1;

  -- 6.7-podcast-le-changement-qui-a-failli-tout-casser.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Version écrite de l''épisode (le texte de référence ; l''enregistrement peut le formuler autrement).

Conversation entre Claire, animatrice IDEAFORMA et Nathalie, cadre de santé dans un service de soins de suite (équipe de 26 soignants, trois roulements), en poste depuis six ans, ancienne infirmière du service (personnage fictif).

**Claire** — Bonjour à tous. Dernier podcast de cette formation, et on termine par un sujet qui fait peur à beaucoup de managers : le changement qui tourne mal. Nathalie, vous êtes cadre de santé, vous encadrez vingt-six soignants en soins de suite. Il y a trois ans, votre établissement a changé de logiciel de dossier patient. Vous m''avez dit que ça avait failli « tout casser ». Racontez-nous.

**Nathalie** — Il faut d''abord dire ce qu''est un dossier patient informatisé pour une équipe de soins. C''est l''outil de toute la journée : les prescriptions, les transmissions entre équipes, les constantes, les soins à faire. Quand on change ça, on change la façon dont vingt-six personnes travaillent, à chaque heure, sur trois roulements. Ce n''est pas un détail.

**Claire** — Et comment ça a été annoncé ?

**Nathalie** — Mal. Par un e-mail de la direction des systèmes d''information, un vendredi, à tout l''établissement : « Le nouveau logiciel sera déployé le 15 du mois prochain. Des formations seront proposées. » Cinq semaines avant. Et moi, cadre, je l''ai appris en même temps que l''équipe.

**Claire** — Vous n''aviez pas été informée avant ?

**Nathalie** — Il y avait eu un comité de pilotage, avec des cadres supérieurs, mais l''information n''était pas redescendue. Donc le lundi matin, j''arrive, et j''ai six soignants qui m''attendent avec l''e-mail imprimé : « C''est quoi ça ? » Et je n''avais pas de réponse. Ça, c''est la première chose que j''ai apprise : un manager qui ne sait pas, devant son équipe, perd en une minute ce qu''il a construit en des mois.

**Claire** — Qu''est-ce que vous avez fait ?

**Nathalie** — J''ai dit que je ne savais pas, et que je saurais le lendemain. Et j''ai passé la journée à obtenir des réponses : pourquoi ce logiciel, pourquoi cette date, quelles formations, qui serait référent. J''ai eu un entretien avec ma cadre supérieure que je n''oublierai pas, parce que je lui ai dit : « Vous m''avez mise dans une position impossible. » Et elle l''a reconnu.

**Claire** — C''est le manager relais dont parle la formation. Vous avez d''abord été exigeante vers le haut.

**Nathalie** — Je n''avais pas le choix. Et j''ai obtenu des choses : deux référents dans mon équipe, formés une semaine avant les autres ; des sessions de formation par roulement, y compris pour l''équipe de nuit, qu''on avait oubliée ; et une période d''un mois de double saisie, papier et informatique, pour les transmissions. C''est ce dernier point qui a sauvé le service.

**Claire** — Racontez-nous les résistances. Qu''est-ce que vous avez entendu ?

**Nathalie** — Tout. « Je ne suis pas là pour faire de l''informatique, je suis là pour soigner. » Ça, c''était la perte de sens, et ce n''est pas rien dans un métier de soin. « Je n''y arriverai jamais », de la part de deux aides-soignantes de plus de cinquante-cinq ans, et c''était de la peur, pas de la mauvaise volonté. « On va passer notre temps devant l''écran et pas auprès des patients », et celle-là était fondée, au début. Et puis la colère pure : « On n''a pas été consultés. » Ce qui était vrai.

**Claire** — Comment on répond à « on n''a pas été consultés » quand c''est vrai ?

**Nathalie** — On ne répond pas que c''est faux. J''ai dit : « Vous avez raison, et moi non plus. La décision est prise, elle ne se rediscute pas. Ce qu''on peut décider ensemble, c''est comment on l''applique ici. » Et j''ai listé ce qui était ouvert : l''organisation des formations, qui serait référent, comment on gérait les transmissions pendant la transition, à quel moment de la journée on saisissait. C''était plus large que ce que les gens croyaient. Et ça a changé la discussion.

**Claire** — Et la peur de ne pas y arriver ?

**Nathalie** — Ça, c''était le sujet le plus délicat, et celui que l''e-mail de la direction ignorait complètement. Deux personnes, excellentes soignantes, qui n''avaient jamais utilisé un ordinateur ailleurs que pour les constantes. Je les ai vues chacune, seule. La première m''a dit : « Je vais être ridicule devant les jeunes. » J''ai organisé pour elles une formation en petit groupe, à part, avec une des référentes, et un droit à l''erreur explicite pendant deux mois. Et j''ai mis une règle pour tout le monde : personne ne commente la vitesse de saisie d''un collègue. Personne.

**Claire** — Vous aviez identifié des alliés ?

**Nathalie** — Oui, et c''est ce que la formation appelle la coalition, je crois. Deux soignantes qui avaient connu un logiciel similaire ailleurs, et surtout un infirmier très respecté, ancien, qui avait tout de suite vu l''intérêt : les prescriptions lisibles, fini les erreurs de transcription. Quand lui a dit en réunion « moi je préfère ça aux fiches papier », ça a plus pesé que tout ce que j''avais pu dire.

**Claire** — Parlons du jour de la bascule.

**Nathalie** — Catastrophe. Le logiciel était lent, les mots de passe ne marchaient pas pour la moitié de l''équipe de nuit, et une prescription a failli être manquée parce qu''elle était dans un onglet que personne ne voyait. Rien de grave au final, grâce à la double saisie, mais ce soir-là, j''ai eu trois personnes en larmes et deux qui m''ont dit qu''elles allaient demander leur mutation.

**Claire** — Qu''est-ce que vous avez fait ce soir-là ?

**Nathalie** — Je suis restée. Jusqu''à 22 h, avec l''équipe de nuit, pour les mots de passe et pour montrer que j''étais là. Et le lendemain matin, j''ai fait un retour d''expérience à chaud, quinze minutes, avec l''équipe du matin : qu''est-ce qui a coincé, précisément. Pas « c''était horrible », mais : les mots de passe, l''onglet des prescriptions, la lenteur entre 14 h et 16 h. Trois problèmes, trois actions remontées à la DSI le jour même, avec des faits. Deux réglés dans la semaine.

**Claire** — C''est la méthode du bilan : les faits, pas les impressions.

**Nathalie** — Et c''est ce qui a changé la perception. L''équipe a vu que les problèmes qu''elle signalait étaient réglés. Pas tous, pas tout de suite, mais réglés. Au bout de deux semaines, les transmissions informatiques étaient plus complètes que les transmissions papier ne l''avaient jamais été. Je l''ai montré, chiffres à l''appui : le nombre de transmissions incomplètes avait baissé de moitié. C''était le premier succès, et je l''ai dit à toute l''équipe, en nommant les deux référentes.

**Claire** — Et les deux qui voulaient demander leur mutation ?

**Nathalie** — Elles sont restées. L''une d''elles est devenue référente pour les nouveaux arrivants, six mois plus tard. Mais ça n''a pas été automatique : je les ai vues chaque semaine pendant deux mois. Dix minutes. « Où tu en es, qu''est-ce qui te bloque. » Le soutien, dans un changement, ce n''est pas une phrase le jour de l''annonce ; c''est une présence pendant des semaines.

**Claire** — Qu''est-ce qui a failli tout casser, exactement ? Le logiciel ?

**Nathalie** — Non. Le logiciel était correct, il est très bien aujourd''hui. Ce qui a failli tout casser, c''est la façon dont le changement a été lancé : sans le pourquoi, sans les relais informés, sans penser aux pertes, sans penser à la peur, sans la nuit. Si j''avais fait ce qu''on me demandait, c''est-à-dire « appliquer », j''aurais perdu trois ou quatre personnes, et dans un service de soins, perdre quatre soignants expérimentés, c''est des mois de désorganisation et un risque pour les patients.

**Claire** — Qu''est-ce que vous feriez différemment aujourd''hui ?

**Nathalie** — Je demanderais à être dans le comité de pilotage, ou au moins à être informée avant l''équipe. Je ne négocie plus ça : un cadre qui apprend un changement en même temps que son équipe ne peut pas le porter. Et j''anticiperais la nuit. Dans les changements, les équipes de nuit, les temps partiels, les gens qui ne sont pas là le jour de l''annonce sont toujours oubliés, et ce sont eux qui vivent le pire.

**Claire** — Un mot sur l''ancrage ? Trois ans après, qu''est-ce qui reste ?

**Nathalie** — Deux choses. Le logiciel est dans l''intégration de chaque nouvel arrivant : une demi-journée avec une référente, avant le premier soin. Et on a gardé le réflexe du retour d''expérience à chaud : à chaque incident sur l''outil, quinze minutes, les faits, les actions. C''est devenu une habitude du service, bien au-delà du logiciel. On fait pareil pour une chute de patient ou un problème de planning.

**Claire** — Si vous deviez résumer, pour un manager qui doit annoncer lundi un changement qu''il n''a pas choisi ?

**Nathalie** — Trois choses. D''abord, ne dites rien tant que vous n''avez pas les réponses aux questions que l''équipe va poser : pourquoi, quand, comment, et qu''est-ce qui est ouvert. Prenez deux jours s''il le faut. Ensuite, cherchez les pertes et les peurs, pas les résistances : derrière chaque « je ne veux pas », il y a un « je vais perdre » ou un « je n''y arriverai pas », et ça, ça se traite. Et enfin, soyez là après. Le jour de la bascule, la semaine d''après, le mois d''après. C''est là que le changement se gagne ou se perd, pas le jour de l''annonce.

**Claire** — Merci Nathalie.

**Nathalie** — Merci à vous.

**Claire** — La fiche outil qui suit vous donne la trame du retour d''expérience et le plan de conduite du changement. Puis le carnet de bord vous demandera de rédiger un retex réel, de choisir un problème à traiter en PDCA, et d''esquisser votre propre plan de changement. Et ensuite, ce sera l''évaluation finale.

## Sources
Kotter (1996) ; Bridges (2016) ; Haute Autorité de santé, « L''analyse des évènements indésirables associés aux soins (EIAS) : mode d''emploi », has-sante.fr ; leçons 6.2 et 6.4.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Version écrite de l''épisode (le texte de référence ; l''enregistrement peut le formuler autrement).

Conversation entre Claire, animatrice IDEAFORMA et Nathalie, cadre de santé dans un service de soins de suite (équipe de 26 soignants, trois roulements), en poste depuis six ans, ancienne infirmière du service (personnage fictif).

**Claire** — Bonjour à tous. Dernier podcast de cette formation, et on termine par un sujet qui fait peur à beaucoup de managers : le changement qui tourne mal. Nathalie, vous êtes cadre de santé, vous encadrez vingt-six soignants en soins de suite. Il y a trois ans, votre établissement a changé de logiciel de dossier patient. Vous m''avez dit que ça avait failli « tout casser ». Racontez-nous.

**Nathalie** — Il faut d''abord dire ce qu''est un dossier patient informatisé pour une équipe de soins. C''est l''outil de toute la journée : les prescriptions, les transmissions entre équipes, les constantes, les soins à faire. Quand on change ça, on change la façon dont vingt-six personnes travaillent, à chaque heure, sur trois roulements. Ce n''est pas un détail.

**Claire** — Et comment ça a été annoncé ?

**Nathalie** — Mal. Par un e-mail de la direction des systèmes d''information, un vendredi, à tout l''établissement : « Le nouveau logiciel sera déployé le 15 du mois prochain. Des formations seront proposées. » Cinq semaines avant. Et moi, cadre, je l''ai appris en même temps que l''équipe.

**Claire** — Vous n''aviez pas été informée avant ?

**Nathalie** — Il y avait eu un comité de pilotage, avec des cadres supérieurs, mais l''information n''était pas redescendue. Donc le lundi matin, j''arrive, et j''ai six soignants qui m''attendent avec l''e-mail imprimé : « C''est quoi ça ? » Et je n''avais pas de réponse. Ça, c''est la première chose que j''ai apprise : un manager qui ne sait pas, devant son équipe, perd en une minute ce qu''il a construit en des mois.

**Claire** — Qu''est-ce que vous avez fait ?

**Nathalie** — J''ai dit que je ne savais pas, et que je saurais le lendemain. Et j''ai passé la journée à obtenir des réponses : pourquoi ce logiciel, pourquoi cette date, quelles formations, qui serait référent. J''ai eu un entretien avec ma cadre supérieure que je n''oublierai pas, parce que je lui ai dit : « Vous m''avez mise dans une position impossible. » Et elle l''a reconnu.

**Claire** — C''est le manager relais dont parle la formation. Vous avez d''abord été exigeante vers le haut.

**Nathalie** — Je n''avais pas le choix. Et j''ai obtenu des choses : deux référents dans mon équipe, formés une semaine avant les autres ; des sessions de formation par roulement, y compris pour l''équipe de nuit, qu''on avait oubliée ; et une période d''un mois de double saisie, papier et informatique, pour les transmissions. C''est ce dernier point qui a sauvé le service.

**Claire** — Racontez-nous les résistances. Qu''est-ce que vous avez entendu ?

**Nathalie** — Tout. « Je ne suis pas là pour faire de l''informatique, je suis là pour soigner. » Ça, c''était la perte de sens, et ce n''est pas rien dans un métier de soin. « Je n''y arriverai jamais », de la part de deux aides-soignantes de plus de cinquante-cinq ans, et c''était de la peur, pas de la mauvaise volonté. « On va passer notre temps devant l''écran et pas auprès des patients », et celle-là était fondée, au début. Et puis la colère pure : « On n''a pas été consultés. » Ce qui était vrai.

**Claire** — Comment on répond à « on n''a pas été consultés » quand c''est vrai ?

**Nathalie** — On ne répond pas que c''est faux. J''ai dit : « Vous avez raison, et moi non plus. La décision est prise, elle ne se rediscute pas. Ce qu''on peut décider ensemble, c''est comment on l''applique ici. » Et j''ai listé ce qui était ouvert : l''organisation des formations, qui serait référent, comment on gérait les transmissions pendant la transition, à quel moment de la journée on saisissait. C''était plus large que ce que les gens croyaient. Et ça a changé la discussion.

**Claire** — Et la peur de ne pas y arriver ?

**Nathalie** — Ça, c''était le sujet le plus délicat, et celui que l''e-mail de la direction ignorait complètement. Deux personnes, excellentes soignantes, qui n''avaient jamais utilisé un ordinateur ailleurs que pour les constantes. Je les ai vues chacune, seule. La première m''a dit : « Je vais être ridicule devant les jeunes. » J''ai organisé pour elles une formation en petit groupe, à part, avec une des référentes, et un droit à l''erreur explicite pendant deux mois. Et j''ai mis une règle pour tout le monde : personne ne commente la vitesse de saisie d''un collègue. Personne.

**Claire** — Vous aviez identifié des alliés ?

**Nathalie** — Oui, et c''est ce que la formation appelle la coalition, je crois. Deux soignantes qui avaient connu un logiciel similaire ailleurs, et surtout un infirmier très respecté, ancien, qui avait tout de suite vu l''intérêt : les prescriptions lisibles, fini les erreurs de transcription. Quand lui a dit en réunion « moi je préfère ça aux fiches papier », ça a plus pesé que tout ce que j''avais pu dire.

**Claire** — Parlons du jour de la bascule.

**Nathalie** — Catastrophe. Le logiciel était lent, les mots de passe ne marchaient pas pour la moitié de l''équipe de nuit, et une prescription a failli être manquée parce qu''elle était dans un onglet que personne ne voyait. Rien de grave au final, grâce à la double saisie, mais ce soir-là, j''ai eu trois personnes en larmes et deux qui m''ont dit qu''elles allaient demander leur mutation.

**Claire** — Qu''est-ce que vous avez fait ce soir-là ?

**Nathalie** — Je suis restée. Jusqu''à 22 h, avec l''équipe de nuit, pour les mots de passe et pour montrer que j''étais là. Et le lendemain matin, j''ai fait un retour d''expérience à chaud, quinze minutes, avec l''équipe du matin : qu''est-ce qui a coincé, précisément. Pas « c''était horrible », mais : les mots de passe, l''onglet des prescriptions, la lenteur entre 14 h et 16 h. Trois problèmes, trois actions remontées à la DSI le jour même, avec des faits. Deux réglés dans la semaine.

**Claire** — C''est la méthode du bilan : les faits, pas les impressions.

**Nathalie** — Et c''est ce qui a changé la perception. L''équipe a vu que les problèmes qu''elle signalait étaient réglés. Pas tous, pas tout de suite, mais réglés. Au bout de deux semaines, les transmissions informatiques étaient plus complètes que les transmissions papier ne l''avaient jamais été. Je l''ai montré, chiffres à l''appui : le nombre de transmissions incomplètes avait baissé de moitié. C''était le premier succès, et je l''ai dit à toute l''équipe, en nommant les deux référentes.

**Claire** — Et les deux qui voulaient demander leur mutation ?

**Nathalie** — Elles sont restées. L''une d''elles est devenue référente pour les nouveaux arrivants, six mois plus tard. Mais ça n''a pas été automatique : je les ai vues chaque semaine pendant deux mois. Dix minutes. « Où tu en es, qu''est-ce qui te bloque. » Le soutien, dans un changement, ce n''est pas une phrase le jour de l''annonce ; c''est une présence pendant des semaines.

**Claire** — Qu''est-ce qui a failli tout casser, exactement ? Le logiciel ?

**Nathalie** — Non. Le logiciel était correct, il est très bien aujourd''hui. Ce qui a failli tout casser, c''est la façon dont le changement a été lancé : sans le pourquoi, sans les relais informés, sans penser aux pertes, sans penser à la peur, sans la nuit. Si j''avais fait ce qu''on me demandait, c''est-à-dire « appliquer », j''aurais perdu trois ou quatre personnes, et dans un service de soins, perdre quatre soignants expérimentés, c''est des mois de désorganisation et un risque pour les patients.

**Claire** — Qu''est-ce que vous feriez différemment aujourd''hui ?

**Nathalie** — Je demanderais à être dans le comité de pilotage, ou au moins à être informée avant l''équipe. Je ne négocie plus ça : un cadre qui apprend un changement en même temps que son équipe ne peut pas le porter. Et j''anticiperais la nuit. Dans les changements, les équipes de nuit, les temps partiels, les gens qui ne sont pas là le jour de l''annonce sont toujours oubliés, et ce sont eux qui vivent le pire.

**Claire** — Un mot sur l''ancrage ? Trois ans après, qu''est-ce qui reste ?

**Nathalie** — Deux choses. Le logiciel est dans l''intégration de chaque nouvel arrivant : une demi-journée avec une référente, avant le premier soin. Et on a gardé le réflexe du retour d''expérience à chaud : à chaque incident sur l''outil, quinze minutes, les faits, les actions. C''est devenu une habitude du service, bien au-delà du logiciel. On fait pareil pour une chute de patient ou un problème de planning.

**Claire** — Si vous deviez résumer, pour un manager qui doit annoncer lundi un changement qu''il n''a pas choisi ?

**Nathalie** — Trois choses. D''abord, ne dites rien tant que vous n''avez pas les réponses aux questions que l''équipe va poser : pourquoi, quand, comment, et qu''est-ce qui est ouvert. Prenez deux jours s''il le faut. Ensuite, cherchez les pertes et les peurs, pas les résistances : derrière chaque « je ne veux pas », il y a un « je vais perdre » ou un « je n''y arriverai pas », et ça, ça se traite. Et enfin, soyez là après. Le jour de la bascule, la semaine d''après, le mois d''après. C''est là que le changement se gagne ou se perd, pas le jour de l''annonce.

**Claire** — Merci Nathalie.

**Nathalie** — Merci à vous.

**Claire** — La fiche outil qui suit vous donne la trame du retour d''expérience et le plan de conduite du changement. Puis le carnet de bord vous demandera de rédiger un retex réel, de choisir un problème à traiter en PDCA, et d''esquisser votre propre plan de changement. Et ensuite, ce sera l''évaluation finale.

## Sources
Kotter (1996) ; Bridges (2016) ; Haute Autorité de santé, « L''analyse des évènements indésirables associés aux soins (EIAS) : mode d''emploi », has-sante.fr ; leçons 6.2 et 6.4.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 7 and l.ordre = 7;
  n := n + 1;

  -- 6.8-fiche-retex-et-plan-de-changement.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Trois gabarits à recopier ou à imprimer (PDF à générer, mise en page IDEAFORMA, fond clair). Ils servent au carnet de bord du module (leçon 6.9) et ensuite au quotidien.

---

## GABARIT 1 — Retour d''expérience (une page, 30 minutes)

Événement : ____________________ Date de l''événement : ________ Date du retex : ________
Participants (les personnes concernées) : ____________________ Animateur : ________

Règle annoncée en ouverture : « On cherche ce qui doit changer dans notre fonctionnement, pas qui a tort. »

1. Les faits (chronologie partagée, sans interprétation)

| Heure / moment | Qui | Ce qui s''est passé, ce qui a été décidé | Source (vu, dit, document) |
|---|---|---|---|
| | | | |
| | | | |
| | | | |
| | | | |

2. Les causes (chercher jusqu''à la cause sur laquelle on peut agir ; plusieurs causes se combinent presque toujours)

| Famille | Cause identifiée | Cause racine (après « pourquoi ? ») |
|---|---|---|
| Organisation (circuits, rôles, règles) | | |
| Technique / matériel / produit | | |
| Compétence / information | | |
| Conditions (charge, imprévu, pression) | | |
| Part du manager (consigne, absence, décision) | | |

3. Les enseignements (formulés de façon générale et réutilisable)

- 
- 
- 

4. Les décisions (une ou deux, pas dix)

| Décision | Responsable | Échéance | Comment on saura que ça a marché | Vérifié le |
|---|---|---|---|---|
| | | | | |
| | | | | |

Diffusé à l''équipe le : ________ Point de vérification prévu le : ________

---

## GABARIT 2 — Fiche PDCA (amélioration continue)

Problème décrit (QQOQCP) : quoi ____________________ qui ________ où ________ quand ________ comment ________ combien ________ pourquoi (première hypothèse) ____________________

Cause principale retenue (cinq pourquoi, vérifiés avec Ishikawa) : ____________________

| Étape | Contenu | Date |
|---|---|---|
| Plan — action testée | | |
| Plan — indicateur et valeur de départ | | |
| Do — périmètre et durée du test (petit, limité) | | |
| Check — valeur mesurée à la fin du test, imprévus | | |
| Act — décision : généraliser (règle écrite, formation) / abandonner / nouveau test | | |

Idée proposée par : ____________________ (à nommer lors de la généralisation)

Registre d''amélioration continue (à tenir au fil de l''année) :

| Date | Problème | Action testée | Résultat | Décision | Proposé par |
|---|---|---|---|---|---|
| | | | | | |
| | | | | | |
| | | | | | |

---

## GABARIT 3 — Plan de conduite du changement dans mon équipe

Changement : ____________________ Décidé par : ________ Date de bascule : ________

Avant l''annonce (le manager relais s''informe et négocie)

| Question | Réponse obtenue | Reste à obtenir |
|---|---|---|
| Pourquoi ce changement (faits) ? | | |
| Qu''est-ce qui change exactement ? Qu''est-ce qui ne change pas ? | | |
| Calendrier, étapes | | |
| Formation et accompagnement prévus | | |
| Marges ouvertes à l''équipe (ce qu''elle peut décider) | | |
| Ce que je demande à ma hiérarchie (temps, moyens, période de transition) | | |

Les personnes

| Personne | Ce qu''elle perd | Ce qu''elle craint | Ce qu''elle gagne | Rôle (allié, référent, à accompagner) | Action prévue |
|---|---|---|---|---|---|
| | | | | | |
| | | | | | |
| | | | | | |

Ne pas oublier : les absents le jour de l''annonce, l''équipe de nuit, les temps partiels, les nouveaux.

L''annonce (en réunion, en présence)

| Point | Ce que je dis |
|---|---|
| Pourquoi (faits) | |
| Quoi — ce qui change | |
| Quoi — ce qui ne change pas | |
| Quand (étapes, dates connues) | |
| Comment (formation, référents, droit à l''erreur, à qui s''adresser) | |
| Ce qui est ouvert (ce qu''on décide ensemble) | |
| Ce que je ne sais pas encore, et quand je le dirai | |

Les objections anticipées et mes réponses : ____________________

Après l''annonce (les étapes de Kotter à l''échelle de l''équipe)

| Étape | Action concrète | Date | Fait |
|---|---|---|---|
| Alliés identifiés et associés | | | |
| Vision en deux phrases, répétée (brief, réunion, entretiens) | | | |
| Entretiens individuels avec les plus inquiets | | | |
| Obstacles repérés et levés | | | |
| Premier succès visible, mesuré, montré | | | |
| Point à ma hiérarchie (faits, difficultés, besoins) | | | |
| Retex après la bascule | | | |
| Ancrage : règles, fiches de poste, intégration, tableau de bord | | | |

---

## Rappels d''usage

- Un retex se fait dans les jours qui suivent, une fois l''émotion retombée, avec les personnes concernées, et il est écrit.
- Une fiche PDCA par problème ; le registre tient l''historique et sert au bilan d''activité.
- Le plan de changement se remplit avant l''annonce, pas après ; la colonne « ce que je ne sais pas » est aussi importante que les autres.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Trois gabarits à recopier ou à imprimer (PDF à générer, mise en page IDEAFORMA, fond clair). Ils servent au carnet de bord du module (leçon 6.9) et ensuite au quotidien.

---

## GABARIT 1 — Retour d''expérience (une page, 30 minutes)

Événement : ____________________ Date de l''événement : ________ Date du retex : ________
Participants (les personnes concernées) : ____________________ Animateur : ________

Règle annoncée en ouverture : « On cherche ce qui doit changer dans notre fonctionnement, pas qui a tort. »

1. Les faits (chronologie partagée, sans interprétation)

| Heure / moment | Qui | Ce qui s''est passé, ce qui a été décidé | Source (vu, dit, document) |
|---|---|---|---|
| | | | |
| | | | |
| | | | |
| | | | |

2. Les causes (chercher jusqu''à la cause sur laquelle on peut agir ; plusieurs causes se combinent presque toujours)

| Famille | Cause identifiée | Cause racine (après « pourquoi ? ») |
|---|---|---|
| Organisation (circuits, rôles, règles) | | |
| Technique / matériel / produit | | |
| Compétence / information | | |
| Conditions (charge, imprévu, pression) | | |
| Part du manager (consigne, absence, décision) | | |

3. Les enseignements (formulés de façon générale et réutilisable)

- 
- 
- 

4. Les décisions (une ou deux, pas dix)

| Décision | Responsable | Échéance | Comment on saura que ça a marché | Vérifié le |
|---|---|---|---|---|
| | | | | |
| | | | | |

Diffusé à l''équipe le : ________ Point de vérification prévu le : ________

---

## GABARIT 2 — Fiche PDCA (amélioration continue)

Problème décrit (QQOQCP) : quoi ____________________ qui ________ où ________ quand ________ comment ________ combien ________ pourquoi (première hypothèse) ____________________

Cause principale retenue (cinq pourquoi, vérifiés avec Ishikawa) : ____________________

| Étape | Contenu | Date |
|---|---|---|
| Plan — action testée | | |
| Plan — indicateur et valeur de départ | | |
| Do — périmètre et durée du test (petit, limité) | | |
| Check — valeur mesurée à la fin du test, imprévus | | |
| Act — décision : généraliser (règle écrite, formation) / abandonner / nouveau test | | |

Idée proposée par : ____________________ (à nommer lors de la généralisation)

Registre d''amélioration continue (à tenir au fil de l''année) :

| Date | Problème | Action testée | Résultat | Décision | Proposé par |
|---|---|---|---|---|---|
| | | | | | |
| | | | | | |
| | | | | | |

---

## GABARIT 3 — Plan de conduite du changement dans mon équipe

Changement : ____________________ Décidé par : ________ Date de bascule : ________

Avant l''annonce (le manager relais s''informe et négocie)

| Question | Réponse obtenue | Reste à obtenir |
|---|---|---|
| Pourquoi ce changement (faits) ? | | |
| Qu''est-ce qui change exactement ? Qu''est-ce qui ne change pas ? | | |
| Calendrier, étapes | | |
| Formation et accompagnement prévus | | |
| Marges ouvertes à l''équipe (ce qu''elle peut décider) | | |
| Ce que je demande à ma hiérarchie (temps, moyens, période de transition) | | |

Les personnes

| Personne | Ce qu''elle perd | Ce qu''elle craint | Ce qu''elle gagne | Rôle (allié, référent, à accompagner) | Action prévue |
|---|---|---|---|---|---|
| | | | | | |
| | | | | | |
| | | | | | |

Ne pas oublier : les absents le jour de l''annonce, l''équipe de nuit, les temps partiels, les nouveaux.

L''annonce (en réunion, en présence)

| Point | Ce que je dis |
|---|---|
| Pourquoi (faits) | |
| Quoi — ce qui change | |
| Quoi — ce qui ne change pas | |
| Quand (étapes, dates connues) | |
| Comment (formation, référents, droit à l''erreur, à qui s''adresser) | |
| Ce qui est ouvert (ce qu''on décide ensemble) | |
| Ce que je ne sais pas encore, et quand je le dirai | |

Les objections anticipées et mes réponses : ____________________

Après l''annonce (les étapes de Kotter à l''échelle de l''équipe)

| Étape | Action concrète | Date | Fait |
|---|---|---|---|
| Alliés identifiés et associés | | | |
| Vision en deux phrases, répétée (brief, réunion, entretiens) | | | |
| Entretiens individuels avec les plus inquiets | | | |
| Obstacles repérés et levés | | | |
| Premier succès visible, mesuré, montré | | | |
| Point à ma hiérarchie (faits, difficultés, besoins) | | | |
| Retex après la bascule | | | |
| Ancrage : règles, fiches de poste, intégration, tableau de bord | | | |

---

## Rappels d''usage

- Un retex se fait dans les jours qui suivent, une fois l''émotion retombée, avec les personnes concernées, et il est écrit.
- Une fiche PDCA par problème ; le registre tient l''historique et sert au bilan d''activité.
- Le plan de changement se remplit avant l''annonce, pas après ; la colonne « ce que je ne sais pas » est aussi importante que les autres.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 7 and l.ordre = 8;
  n := n + 1;

  -- 6.9-carnet-application.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Ce module vous a fait passer du bilan d''activité au retour d''expérience, puis à l''amélioration continue, à la conduite du changement et au management à distance. Ce carnet vous demande de les essayer sur votre propre équipe. Comptez environ 1 h 40. Utilisez les gabarits de la fiche outil (leçon 6.8).

Si vous n''encadrez pas d''équipe, travaillez sur une équipe que vous connaissez, ou sur l''atelier Garnier en transposant dans votre secteur.

## Étape 1 — Mon bilan d''activité (20 min)

- Reprenez les objectifs et le tableau de bord que vous avez construits au module 2. Pour chaque objectif : la cible, le résultat obtenu (ou estimé), l''écart.
- Pour chaque écart, les trois questions : l''objectif était-il réaliste ? Les moyens étaient-ils là ? Qu''est-ce qui, dans les conditions, l''explique ?
- Notez aussi un objectif atteint, et ce qui l''explique : qu''est-ce qu''il faut reproduire ?
- Rédigez en dix lignes le bilan que vous présenteriez à votre hiérarchie : ce qui est atteint, les écarts et leurs causes, ce que vous proposez. Relisez : y a-t-il un nom de personne là où il devrait y avoir une cause ?

## Étape 2 — Un retour d''expérience réel (20 min)

- Choisissez un incident, un échec ou une réussite inhabituelle récente dans votre équipe.
- Remplissez le gabarit 1 : la chronologie (en consultant si possible les personnes concernées), les causes par famille, jusqu''à la cause racine, en cherchant aussi votre part.
- Formulez deux enseignements généraux, et une ou deux décisions avec un responsable, une échéance et un critère de vérification.
- Si l''événement est réel et récent, tenez le retex avec les personnes concernées cette semaine. Notez ce qui est sorti que vous ne saviez pas.
- Quel rituel de rétrospective installez-vous (fréquence, durée, trois questions) ? Date de la première ?

## Étape 3 — Un problème en PDCA (20 min)

- Listez trois problèmes récurrents de votre équipe (le point « ce qui nous a compliqué la vie » est une bonne source). Choisissez le plus fréquent ou le plus coûteux.
- Décrivez-le en QQOQCP. Cherchez la cause par cinq pourquoi ; vérifiez avec Ishikawa que vous n''avez pas oublié une famille de causes.
- Remplissez le gabarit 2 : une action testable à petite échelle, un indicateur, une valeur de départ, une durée de test.
- Qui, dans l''équipe, a proposé ou pourrait proposer cette amélioration ? Comment la présenterez-vous ?
- Ouvrez votre registre d''amélioration continue avec cette première ligne.

## Étape 4 — Mon plan de changement (20 min)

- Identifiez un changement en cours ou à venir dans votre équipe (outil, organisation, horaires, locaux, norme), de préférence un changement que vous n''avez pas décidé.
- Remplissez le gabarit 3, partie « avant l''annonce » : ce que vous savez, ce qui vous manque, ce que vous demandez à votre hiérarchie. Fixez la date à laquelle vous poserez ces questions.
- Partie « les personnes » : pour chaque membre de l''équipe, ce qu''il perd, ce qu''il craint, ce qu''il gagne, son rôle possible. Qui sont vos alliés ? Qui faut-il voir seul ? Qui risque d''être oublié ?
- Rédigez votre annonce en sept points (pourquoi, ce qui change, ce qui ne change pas, quand, comment, ce qui est ouvert, ce que vous ne savez pas). Lisez-la à voix haute : tient-elle en cinq minutes ?
- Quel sera votre premier succès visible, et comment le mesurerez-vous ?

## Étape 5 — Distance et hybride (10 min)

- Si une partie de votre équipe travaille à distance ou sur un autre site : quels rituels avez-vous adaptés ? Les plages de joignabilité sont-elles définies ? Quand avez-vous eu un entretien de suivi en caméra allumée avec chaque distant ?
- Y a-t-il une décision prise « au café » cette semaine qu''un distant n''a pas eue ? Une mission intéressante attribuée à quelqu''un parce qu''il était là ?
- Si personne ne télétravaille dans votre équipe : comment expliquez-vous l''éligibilité par le poste, et quelles souplesses offrez-vous aux postes non éligibles ?

## Étape 6 — Bilan du module (10 min)

- Parmi les cinq pratiques du module (bilan d''activité, retex, amélioration continue, conduite du changement, management à distance), laquelle maîtrisez-vous le mieux ? Laquelle vous demande le plus d''effort ?
- Quelle est la première chose que vous faites dès demain ? Écrivez-la avec une date.

Conservez ce carnet, avec ceux des modules précédents : le module 7 vous demandera de construire votre plan d''action à 30, 60 et 90 jours à partir de l''ensemble.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Ce module vous a fait passer du bilan d''activité au retour d''expérience, puis à l''amélioration continue, à la conduite du changement et au management à distance. Ce carnet vous demande de les essayer sur votre propre équipe. Comptez environ 1 h 40. Utilisez les gabarits de la fiche outil (leçon 6.8).

Si vous n''encadrez pas d''équipe, travaillez sur une équipe que vous connaissez, ou sur l''atelier Garnier en transposant dans votre secteur.

## Étape 1 — Mon bilan d''activité (20 min)

- Reprenez les objectifs et le tableau de bord que vous avez construits au module 2. Pour chaque objectif : la cible, le résultat obtenu (ou estimé), l''écart.
- Pour chaque écart, les trois questions : l''objectif était-il réaliste ? Les moyens étaient-ils là ? Qu''est-ce qui, dans les conditions, l''explique ?
- Notez aussi un objectif atteint, et ce qui l''explique : qu''est-ce qu''il faut reproduire ?
- Rédigez en dix lignes le bilan que vous présenteriez à votre hiérarchie : ce qui est atteint, les écarts et leurs causes, ce que vous proposez. Relisez : y a-t-il un nom de personne là où il devrait y avoir une cause ?

## Étape 2 — Un retour d''expérience réel (20 min)

- Choisissez un incident, un échec ou une réussite inhabituelle récente dans votre équipe.
- Remplissez le gabarit 1 : la chronologie (en consultant si possible les personnes concernées), les causes par famille, jusqu''à la cause racine, en cherchant aussi votre part.
- Formulez deux enseignements généraux, et une ou deux décisions avec un responsable, une échéance et un critère de vérification.
- Si l''événement est réel et récent, tenez le retex avec les personnes concernées cette semaine. Notez ce qui est sorti que vous ne saviez pas.
- Quel rituel de rétrospective installez-vous (fréquence, durée, trois questions) ? Date de la première ?

## Étape 3 — Un problème en PDCA (20 min)

- Listez trois problèmes récurrents de votre équipe (le point « ce qui nous a compliqué la vie » est une bonne source). Choisissez le plus fréquent ou le plus coûteux.
- Décrivez-le en QQOQCP. Cherchez la cause par cinq pourquoi ; vérifiez avec Ishikawa que vous n''avez pas oublié une famille de causes.
- Remplissez le gabarit 2 : une action testable à petite échelle, un indicateur, une valeur de départ, une durée de test.
- Qui, dans l''équipe, a proposé ou pourrait proposer cette amélioration ? Comment la présenterez-vous ?
- Ouvrez votre registre d''amélioration continue avec cette première ligne.

## Étape 4 — Mon plan de changement (20 min)

- Identifiez un changement en cours ou à venir dans votre équipe (outil, organisation, horaires, locaux, norme), de préférence un changement que vous n''avez pas décidé.
- Remplissez le gabarit 3, partie « avant l''annonce » : ce que vous savez, ce qui vous manque, ce que vous demandez à votre hiérarchie. Fixez la date à laquelle vous poserez ces questions.
- Partie « les personnes » : pour chaque membre de l''équipe, ce qu''il perd, ce qu''il craint, ce qu''il gagne, son rôle possible. Qui sont vos alliés ? Qui faut-il voir seul ? Qui risque d''être oublié ?
- Rédigez votre annonce en sept points (pourquoi, ce qui change, ce qui ne change pas, quand, comment, ce qui est ouvert, ce que vous ne savez pas). Lisez-la à voix haute : tient-elle en cinq minutes ?
- Quel sera votre premier succès visible, et comment le mesurerez-vous ?

## Étape 5 — Distance et hybride (10 min)

- Si une partie de votre équipe travaille à distance ou sur un autre site : quels rituels avez-vous adaptés ? Les plages de joignabilité sont-elles définies ? Quand avez-vous eu un entretien de suivi en caméra allumée avec chaque distant ?
- Y a-t-il une décision prise « au café » cette semaine qu''un distant n''a pas eue ? Une mission intéressante attribuée à quelqu''un parce qu''il était là ?
- Si personne ne télétravaille dans votre équipe : comment expliquez-vous l''éligibilité par le poste, et quelles souplesses offrez-vous aux postes non éligibles ?

## Étape 6 — Bilan du module (10 min)

- Parmi les cinq pratiques du module (bilan d''activité, retex, amélioration continue, conduite du changement, management à distance), laquelle maîtrisez-vous le mieux ? Laquelle vous demande le plus d''effort ?
- Quelle est la première chose que vous faites dès demain ? Écrivez-la avec une date.

Conservez ce carnet, avec ceux des modules précédents : le module 7 vous demandera de construire votre plan d''action à 30, 60 et 90 jours à partir de l''ensemble.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 7 and l.ordre = 9;
  n := n + 1;

  -- 7.1-evaluation-finale.json
  update public.lecons l set contenu = '{"questions": [{"id": "ef01", "enonce": "Un an après. L''atelier a tenu 94 % de ses délais, l''équipe compte désormais onze personnes avec Amine et Chloé, la nouvelle apprentie, et Michel a confié à Karim l''ouverture d''un second poste de peinture. Pour cette nouvelle activité, Karim commence par lister les étapes (préparation, masquage, application, séchage, contrôle) et les compétences requises à chacune. Quelle compétence du référentiel exerce-t-il ?", "options": ["Structurer l''activité en répartissant rôles et missions", "Mobiliser les outils de pilotage de l''activité collective", "Identifier les compétences nécessaires à une activité", "Soutenir la progression individuelle et collective"], "bonnes": [2], "explication": "C''est la première compétence du référentiel : partir de l''activité pour en déduire les compétences, puis les confronter à la matrice de l''équipe (leçon 2.3). La répartition des rôles vient ensuite."}, {"id": "ef02", "enonce": "La matrice de compétences montre que seule Nadia est au niveau 3 sur la peinture nacrée, et que Thierry est le seul au niveau 3 sur le redressage lourd. Que fait Karim ?", "options": ["Il organise la transmission (PDI d''Amine avec Nadia, binôme Thierry-Julien), avec un calendrier", "Rien pour l''instant : les deux sont présents, et l''activité tourne normalement sans retard", "Il demande à Michel de recruter dès que possible un carrossier et un peintre confirmés", "Il demande à Nadia et à Thierry de rédiger chacun une procédure écrite détaillée de leur savoir-faire"], "bonnes": [0], "explication": "Une compétence portée par une seule personne est un risque pour l''équipe (absence, départ). La transmission se planifie à l''avance, par binôme et plan de développement ; une procédure écrite peut l''accompagner, pas la remplacer."}, {"id": "ef03", "enonce": "Avec onze personnes et deux postes de peinture, les rôles se brouillent : deux personnes commandent des pièces, personne ne valide les restitutions du second poste. Quel outil Karim met-il à jour, et avec quelle règle ?", "options": ["Le règlement intérieur, avec un rappel des sanctions", "L''organigramme, avec un chef désigné par poste de peinture", "Le tableau de bord, avec un indicateur par personne", "La matrice RACI, avec un seul « A » par activité"], "bonnes": [3], "explication": "Les rôles flous sont une source majeure d''erreurs et de conflits ; le RACI fixe qui réalise, qui répond du résultat, qui est consulté, qui est informé, avec un seul A par ligne (leçon 2.4)."}, {"id": "ef04", "enonce": "Michel demande à Karim « de faire mieux l''an prochain ». Comment Karim traduit-il cette attente pour l''équipe ?", "options": ["Afficher « faire mieux » dans l''atelier, pour que chacun s''approprie l''ambition de Michel", "Trois objectifs SMART, ambitieux mais acceptés, chacun avec un indicateur et un garde-fou", "Une quinzaine d''objectifs précis, pour couvrir chacun des sujets de l''atelier", "Des objectifs choisis librement par chacun, sans cadre commun"], "bonnes": [1], "explication": "SMART (Doran, 1981) ; Locke et Latham : un objectif précis et difficile, accepté et suivi, mobilise davantage qu''un « faites de votre mieux ». Un garde-fou (reprises, heures supplémentaires) accompagne chaque objectif de résultat."}, {"id": "ef05", "enonce": "Le tableau de bord indique 94 % de délais tenus, mais aussi 60 heures supplémentaires sur le mois et deux réclamations clients. Que conclut Karim ?", "options": ["L''objectif de délai est atteint : le reste relève de la gestion courante de l''atelier", "Le résultat a coûté trop de moyens et les garde-fous s''allument : il faut d''abord comprendre", "Les indicateurs secondaires brouillent le message adressé à Michel : mieux vaut les retirer du tableau", "Les réclamations relèvent de Sophie : c''est à elle de les traiter avec les clients"], "bonnes": [1], "explication": "Un résultat ne se lit pas sans ses moyens et ses conditions (leçon 6.1) ; c''est à cela que servent les indicateurs garde-fous."}, {"id": "ef06", "enonce": "Fatou, préparatrice, a vu sa restriction de port de charge renouvelée, et le médecin du travail préconise un chariot de manutention à hauteur réglable pour les éléments de plus de 10 kg. Que fait Karim ?", "options": ["Il demande à Fatou le détail de sa pathologie, pour pouvoir adapter son poste au plus juste", "Il explique sa pathologie à l''équipe, pour éviter les jalousies sur le matériel", "Il lui propose une reconversion, le poste n''étant manifestement plus adapté", "Il fait appliquer la préconisation avec Michel, sans dire le motif médical à l''équipe"], "bonnes": [3], "explication": "Aménagement du poste sur préconisation du médecin du travail (l''employeur décide et finance, avec l''appui possible de l''Agefiph), confidentialité de la santé, égalité d''accès aux missions et à la formation : c''est la compétence 4 du référentiel (leçon 2.8)."}, {"id": "ef07", "enonce": "Lucas, désormais carrossier en CDI, se plaint que les missions intéressantes (flottes, véhicules haut de gamme) vont toujours à Julien et Amine. Karim vérifie : c''est vrai depuis six mois. Qu''est-ce que cela révèle, et que fait-il ?", "options": ["Un risque d''inéquité : il pose une règle d''attribution objective, connue, et tient le compte", "Une préférence normale : les missions exigeantes reviennent toujours aux plus expérimentés", "Une jalousie de Lucas, sur laquelle il faut le recadrer sans attendre qu''elle s''installe", "Un manque de compétence de Lucas, à traiter d''abord par une formation avant d''en reparler"], "bonnes": [0], "explication": "Un cadre équitable, ce sont des différences justifiées par un critère objectif, connu et expliqué (leçon 4.6). Les attributions « sans y penser » créent un sentiment d''injustice et, si le critère réel touchait par exemple à l''âge, on glisserait vers la discrimination (L1132-1)."}, {"id": "ef08", "enonce": "Depuis trois mois, Marc reste tard, ne prend plus sa pause, a fait deux erreurs inhabituelles de diagnostic et a eu un accrochage sec avec Sophie. Que fait Karim ?", "options": ["Il lui dit qu''il fait un burn-out et lui conseille de voir son médecin pour un arrêt", "Il attend que Marc vienne lui en parler de lui-même, par respect pour sa vie privée", "Il le voit seul, part des faits, écoute, agit sur la charge, l''oriente et assure un suivi", "Il lui retire la mécanique quelques semaines pour le soulager, sans lui en parler d''abord"], "bonnes": [2], "explication": "Le manager repère, écoute, agit sur le travail, oriente, alerte l''employeur (Michel) et suit ; il ne diagnostique pas. Tout salarié peut demander à voir le médecin du travail, sans que cette demande puisse être sanctionnée (art. R4624-34)."}, {"id": "ef09", "enonce": "Karim encadre deux profils très différents : Amine, autonome et expérimenté, et Chloé, nouvelle apprentie de 19 ans. Quelle posture adopte-t-il selon le leadership situationnel ?", "options": ["Il adopte la même posture avec les deux, par souci d''équité de traitement", "Il dirige les deux, au moins le temps qu''ils aient fait leurs preuves dans l''atelier", "Il délègue aux deux, pour dégager du temps sur l''encadrement au quotidien", "Déléguer avec Amine ; diriger avec Chloé, puis entraîner au fil de ses progrès"], "bonnes": [3], "explication": "Le style dépend de l''autonomie de la personne sur la tâche, et il évolue (Hersey et Blanchard, leçon 1.4). Le modèle est peu validé empiriquement, mais l''idée d''adapter sa posture aux profils est au cœur de la compétence 6."}, {"id": "ef10", "enonce": "En réunion d''équipe, Thierry conteste devant tous une décision d''organisation que Karim vient d''annoncer. Que fait Karim sur le moment ?", "options": ["Il écoute, reformule, maintient la décision si elle est fondée, et revoit Thierry seul", "Il revient sur sa décision, pour éviter un conflit ouvert devant toute l''équipe réunie", "Il le reprend sèchement devant tous, pour affirmer son autorité", "Il clôt la discussion et passe au point suivant, en rappelant que c''est lui qui décide"], "bonnes": [0], "explication": "Écouter n''est pas céder : comprendre, puis décider. La forme (contester devant l''équipe) se traite en privé, avec SBI ou DESC (module 3)."}, {"id": "ef11", "enonce": "Julien a livré trois finitions impeccables cette semaine, sur un produit qu''il ne maîtrisait pas l''an dernier. Que fait Karim ?", "options": ["Rien de particulier : bien faire son travail est la norme attendue de chacun dans l''atelier", "Il demande à Michel une prime exceptionnelle, sans en parler à Julien", "Un retour positif précis et à temps : ce qui est réussi, et ce que cela permet", "« C''est bien, mais reste vigilant la semaine prochaine. »"], "bonnes": [2], "explication": "Le positif apprend autant que le correctif : il dit quoi reproduire. Précis, sincère, à temps, sans « mais » ; devant l''équipe si Julien l''accepte (leçons 3.3 et 4.3)."}, {"id": "ef12", "enonce": "Nadia a mal vécu que Michel la reprenne devant un client sur un détail de teinte. Elle vient en parler à Karim. Que fait-il ?", "options": ["Il lui explique que Michel est ainsi depuis toujours et qu''elle finira par s''y habituer", "Il écoute Nadia, puis fait à Michel, seul à seul, un retour factuel sur ses remarques", "Il critique Michel avec elle, pour lui montrer clairement qu''il est de son côté", "Il n''en dit rien à Michel, pour ne pas froisser le dirigeant à qui il rend des comptes"], "bonnes": [1], "explication": "Loyal vers le haut (un retour en face, avec des faits, sans désavouer Michel devant Nadia), loyal vers le bas (ne pas laisser Nadia seule) : c''est la communication ascendante de la leçon 1.7."}, {"id": "ef13", "enonce": "Sophie a cette année son entretien de parcours professionnel. Que doit-il aborder, et qu''est-ce qui en est exclu ?", "options": ["Compétences, besoins de formation, souhaits d''évolution, CPF ; pas l''évaluation du travail", "Ses objectifs de l''année, ses résultats chiffrés et le montant de sa prime variable", "Une discussion libre sur son moral et sa charge, sans écrit ni suite particulière", "Un bilan de ses erreurs de l''année, de ses points forts et de ses axes de progrès pour l''an prochain"], "bonnes": [0], "explication": "Art. L6315-1 du Code du travail, dans sa rédaction issue de la loi n° 2025-989 du 24 octobre 2025 : l''entretien porte sur les compétences, la situation et le parcours, les besoins de formation, les souhaits d''évolution, le CPF et le conseil en évolution professionnelle ; il ne porte pas sur l''évaluation du travail et donne lieu à un document écrit dont une copie est remise au salarié."}, {"id": "ef14", "enonce": "Chloé, l''apprentie, arrive en retard pour la troisième fois malgré un premier feedback. Comment Karim conduit-il l''entretien ?", "options": ["Il lui remet un avertissement écrit, qu''il a rédigé et signé lui-même dans la foulée", "Il lui fait une remarque devant l''équipe, pour que cela serve d''exemple aux autres", "Un recadrage : faits datés, règle rappelée, écoute, attente et délai, trace écrite", "Rien de plus : une apprentie est encore en formation, c''est au CFA de s''en charger"], "bonnes": [2], "explication": "Le recadrage relève du manager et se trace ; la sanction relève de l''employeur, avec sa procédure (leçon 5.6). L''écoute peut révéler une cause (transport, horaires du CFA) qui change la suite ; le maître d''apprentissage est tenu informé."}, {"id": "ef15", "enonce": "Amine et Julien ne se parlent plus depuis deux semaines après un désaccord sur l''ordre des opérations du second poste de peinture. Les autres commencent à prendre parti. Que fait Karim ?", "options": ["Il les réunit immédiatement tous les trois, pour qu''ils s''expliquent devant lui", "Il tranche en faveur du plus expérimenté des deux, pour clore rapidement le sujet", "Il laisse passer quelques semaines, le temps que la tension retombe d''elle-même", "La méthode en cinq étapes, en commençant par écouter chacun séparément"], "bonnes": [3], "explication": "Entre le niveau 3 de Glasl (on ne se parle plus, on agit sans l''autre) et le niveau 4 (on cherche des alliés) : il faut intervenir maintenant (leçon 5.4). La cause est souvent organisationnelle (qui décide de l''ordre des opérations ?), et c''est au manager de poser la règle manquante."}, {"id": "ef16", "enonce": "Lors de l''entretien séparé, Julien dit à Karim : « Amine veut tout commander, il faut qu''il arrête. » Que cherche Karim derrière cette phrase ?", "options": ["Les éléments factuels qui permettront de dire lequel des deux a raison", "L''intérêt derrière la position : savoir qui décide quoi, être reconnu", "Des faits précis à reprocher à Amine lors de son entretien", "Un motif de recadrage pour Julien, qui parle mal d''un collègue"], "bonnes": [1], "explication": "Les positions sont incompatibles, les intérêts le sont rarement (Fisher et Ury, *Getting to Yes*, 1981). C''est en partant des intérêts qu''on trouve des options."}, {"id": "ef17", "enonce": "Un client régulier a eu, à deux reprises, des propos déplacés à connotation sexuelle envers Chloé, 19 ans. Elle en parle à Karim en lui demandant « de ne pas faire d''histoires ». Que fait Karim ?", "options": ["Il respecte sa demande et n''en parle à personne, pas même à Michel, pour la protéger", "Il organise une explication entre Chloé et le client, en sa présence, pour crever l''abcès", "Il note les faits, informe Michel, la protège de ce client et l''oriente, discrètement", "Il en parle à l''équipe pour que chacun reste vigilant quand ce client se présente"], "bonnes": [2], "explication": "L''employeur doit prévenir les faits de harcèlement sexuel, y mettre un terme et les sanctionner (L1153-5), y compris quand l''auteur est un client, et prévenir les agissements sexistes (L4121-2). Le manager déclenche cette obligation en informant Michel ; il oriente vers le médecin du travail, l''inspection du travail et, s''ils existent, les référents harcèlement (leçon 5.6). La discrétion est respectée vis-à-vis de l''équipe, pas vis-à-vis de l''employeur."}, {"id": "ef18", "enonce": "Au bilan du trimestre, Karim présente à l''équipe les résultats, les moyens et les conditions. Par quoi commence-t-il ?", "options": ["Par ce qui a été atteint, puis les écarts et leurs causes, puis ses propositions", "Par les écarts, pour que l''équipe mesure bien l''effort qui reste à fournir", "Par l''attente de Michel, pour rappeler d''emblée le cadre fixé par la direction pour l''année", "Par les points de vigilance de chacun, pour que personne ne se sente oublié"], "bonnes": [0], "explication": "Le bilan d''activité est collectif et factuel ; un écart est une information, pas une faute ; les personnes s''évaluent ailleurs (leçon 6.1)."}, {"id": "ef19", "enonce": "Un véhicule est reparti avec une pièce mal fixée ; le client l''a signalé, sans dommage. Comment Karim organise-t-il le retour d''expérience ?", "options": ["Il cherche qui a fixé la pièce et lui demande un rapport écrit sur ce qui s''est passé", "Il envoie à toute l''équipe un e-mail rappelant la procédure de contrôle avant restitution", "Il ajoute une ligne à la check-list, sans en parler pour ne pas inquiéter", "Sous quelques jours, avec les intéressés : faits, causes, enseignements, décisions écrites"], "bonnes": [3], "explication": "Culture juste : l''erreur signalée de bonne foi n''est pas sanctionnée ; on cherche ce qui doit changer dans le fonctionnement, y compris la part du manager (leçon 6.2)."}, {"id": "ef20", "enonce": "Karim a recueilli trois idées d''amélioration proposées par l''équipe. Comment les traite-t-il ?", "options": ["Toutes en même temps, pour montrer à l''équipe qu''elle est vraiment entendue", "Une à une, en PDCA, et chaque auteur reçoit une réponse sous quinze jours", "Il les transmet à Michel et attend sa décision avant de répondre", "Il retient la plus simple à mettre en œuvre et classe les deux autres sans suite"], "bonnes": [1], "explication": "L''amélioration continue vit de petites décisions testées et mesurées, et de la réponse systématique aux idées du terrain ; l''idée adoptée porte le nom de son auteur (leçon 6.3)."}, {"id": "ef21", "enonce": "Michel annonce à Karim, un vendredi, que dans six semaines les carrossiers devront photographier et chiffrer les dommages sur tablette, dans un nouveau logiciel de devis relié aux experts. Il lui demande « de gérer ». Que fait Karim avant d''en parler à l''équipe ?", "options": ["Il s''informe, anticipe pertes et peurs, repère ses alliés et négocie des marges", "Il envoie un message à l''équipe le soir même, par souci de transparence totale", "Il dit à l''équipe qu''il n''a pas été consulté et qu''il n''est pas d''accord avec ce choix", "Il demande à Michel de faire l''annonce lui-même, puisque c''est sa décision"], "bonnes": [0], "explication": "Le manager relais est exigeant vers le haut avant l''annonce (pourquoi, calendrier, formation de tous, y compris les absents, période de transition) ; c''est ce qui lui permet de porter la décision ensuite (leçon 6.4)."}, {"id": "ef22", "enonce": "Lors de l''annonce, Thierry lance : « Les photos sur tablette, très peu pour moi. » Quelle est la réponse la plus juste de Karim ?", "options": ["« Tu n''as pas le choix : c''est la même règle pour tout le monde dans l''atelier, toi compris, et c''est comme ça. »", "« Ce n''est pas moi qui décide : si ça ne te va pas, vois directement avec Michel. »", "« Si tu refuses de t''y mettre, il faudra qu''on en tire les conséquences ensemble. »", "« Je sais que ça te coûte. C''est décidé ; la façon de t''y mettre, on en parle tous les deux. »"], "bonnes": [3], "explication": "Reconnaître la perte et la peur, maintenir la décision, ouvrir ce qui peut l''être, et traiter le cas individuel en privé."}, {"id": "ef23", "enonce": "Deux semaines après la bascule, tous les devis de la semaine ont été transmis aux experts en moins de 24 heures, contre trois jours en moyenne auparavant. Que fait Karim ?", "options": ["Rien de particulier : c''est exactement le résultat attendu du nouveau logiciel", "Il le montre à l''équipe comme premier succès, nomme les contributeurs, et poursuit", "Il considère le changement comme réussi et passe au sujet suivant, sans y revenir", "Il demande à Michel une prime pour les carrossiers les plus rapides"], "bonnes": [1], "explication": "Victoire rapide montrée, puis consolidation sans crier victoire trop tôt, puis ancrage dans les règles et l''intégration des nouveaux (Kotter, étapes 6 à 8)."}, {"id": "ef24", "enonce": "Karim doit faire comprendre à Michel que, sans un second préparateur, le nouveau poste de peinture ne tiendra pas les délais. Comment formule-t-il sa demande ?", "options": ["« On n''y arrivera jamais sans embaucher, il faut absolument quelqu''un de plus. »", "« On va faire au mieux avec ce qu''on a, comme on l''a toujours fait jusqu''ici. »", "Faits chiffrés, impact, deux options, sa recommandation, puis un écrit", "Il absorbe la charge lui-même, pour ne pas passer pour un râleur"], "bonnes": [2], "explication": "Communication ascendante : faits, impact, options, décision demandée, écrit après l''oral (leçon 1.7 et podcast 3.8). Alerter n''est pas se plaindre."}, {"id": "ef25", "enonce": "Plusieurs réponses. Un an après, quels principes Karim a-t-il appliqués qui expliquent le mieux la transformation de l''atelier ?", "options": ["Garder les décisions importantes pour lui, afin de rester indispensable", "Chercher la cause dans l''organisation avant de l''attribuer aux personnes", "Construire la sécurité psychologique : signaler une erreur n''est pas puni, la cacher l''est", "Donner des retours précis et à temps : le correctif en privé, le positif en public si la personne l''accepte"], "bonnes": [1, 2, 3], "explication": "Organisation avant personnes, feedback, sécurité psychologique : trois fils qui traversent toute la formation. Garder tout pour soi est l''inverse de la délégation et fragilise l''équipe."}], "seuil": 70, "tentatives_max": 2, "corrections": true, "consigne": "Évaluation finale : 25 situations à l''atelier Garnier, un an après la prise de poste de Karim. Chaque situation appelle la décision la plus juste au regard de la formation. Une seule bonne réponse par question, sauf mention « plusieurs réponses ». Seuil de réussite : 70 %. Deux tentatives. Comptez 60 minutes."}'::jsonb, publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 8 and l.ordre = 1;
  n := n + 1;

  -- 7.2-autopositionnement-final.json
  update public.lecons l set contenu = '{"questions": [{"id": "fap01", "enonce": "Je sais expliquer clairement en quoi le rôle d''un manager diffère de celui d''un expert technique.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "fap02", "enonce": "Je connais les principales obligations légales qui pèsent sur un manager (sécurité, harcèlement, discrimination, temps de travail).", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "fap03", "enonce": "Je suis capable d''adapter ma façon de manager selon la personne et la situation, plutôt que d''appliquer un seul style.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "fap04", "enonce": "Je sais lister les compétences nécessaires à une activité et repérer celles qui manquent dans une équipe.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "fap05", "enonce": "Je sais répartir les rôles et les missions dans une équipe de façon claire et équitable.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "fap06", "enonce": "Je sais formuler un objectif précis, mesurable et daté pour une équipe.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "fap07", "enonce": "Je sais construire et utiliser un tableau de bord simple (quelques indicateurs) pour suivre l''activité.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "fap08", "enonce": "Je sais déléguer une tâche en fixant le cadre, le niveau d''autonomie et le point de contrôle.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "fap09", "enonce": "Je sais donner un retour (feedback) sur un comportement, positif ou correctif, sans blesser ni minimiser.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "fap10", "enonce": "Je sais préparer et conduire un entretien individuel de suivi avec un collaborateur.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "fap11", "enonce": "Je connais la différence entre l''entretien annuel d''évaluation et l''entretien de parcours professionnel prévu par la loi.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "fap12", "enonce": "Je sais animer une réunion d''équipe qui aboutit à des décisions et à des actions suivies.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "fap13", "enonce": "Je sais faire remonter un problème ou un désaccord à ma hiérarchie de manière constructive.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "fap14", "enonce": "Je sais ce qui motive réellement les personnes au travail et comment agir dessus en tant que manager.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "fap15", "enonce": "Je sais créer un climat où chacun ose signaler un problème ou une erreur sans crainte.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "fap16", "enonce": "Je sais repérer les signaux d''une charge de travail excessive ou d''un risque psychosocial dans une équipe et je sais quoi faire.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "fap17", "enonce": "Je sais ce qu''un manager peut et doit faire pour intégrer un collaborateur en situation de handicap.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "fap18", "enonce": "Je sais accompagner la montée en compétences d''un collaborateur (plan de développement, tutorat, formation).", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "fap19", "enonce": "Je sais intervenir dans un conflit entre deux collaborateurs avec une méthode, sans prendre parti.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}, {"id": "fap20", "enonce": "Je sais évaluer les résultats d''une équipe, en tirer des enseignements et conduire un changement dans l''équipe.", "options": ["Pas du tout", "Un peu", "Assez bien", "Tout à fait"], "bonnes": [3]}], "seuil": 0, "tentatives_max": 0, "corrections": false, "consigne": "Les mêmes 20 affirmations qu''au module 0. Répondez spontanément, puis comparez avec votre première réponse : c''est la mesure de votre progression. Il n''y a ni bonne ni mauvaise réponse, ni seuil."}'::jsonb, publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 8 and l.ordre = 2;
  n := n + 1;

  -- 7.3-plan-d-action-30-60-90.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Vous avez suivi 35 heures de formation, rempli six carnets de bord et passé l''évaluation finale. Reste le plus utile : ce que vous allez faire dans votre équipe à partir de lundi. Ce plan d''action est un engagement envers vous-même. Deux pages, une trentaine de minutes de rédaction à partir de vos carnets, une relecture par mois.

Pourquoi 30, 60, 90 jours ? D''abord parce que trois étapes courtes se tiennent mieux qu''un objectif annuel. Ensuite parce qu''une nouvelle habitude met du temps à devenir automatique : dans une étude de l''University College London, le délai médian pour qu''un nouveau comportement quotidien devienne quasi automatique a été de 66 jours, avec des écarts allant de 18 à 254 jours selon les personnes et les comportements (Lally et al., 2010). Trois mois ne garantissent rien, mais c''est un horizon réaliste pour voir si une pratique s''installe ou s''efface.

## Avant de remplir : relire ses carnets

Reprenez les six carnets de bord et, pour chacun, notez en une ligne la « première chose à faire dès demain » que vous aviez écrite. Vous obtenez six intentions. Certaines sont faites. Certaines ne le sont pas. C''est de ces dernières que part le plan.

Reprenez aussi votre autopositionnement final (leçon 7.2) et comparez-le à celui du module 0. Les affirmations où vous avez gagné un ou deux crans sont vos acquis. Celles qui ont peu bougé sont vos chantiers.

## Le gabarit

Ma situation en une phrase (équipe, taille, contexte, ce qui a changé pendant la formation) : ____________________

Mes trois acquis les plus nets (ce que je fais maintenant et que je ne faisais pas avant) :

- 
- 
- 

Mes trois chantiers (ce que je sais devoir changer et que je n''ai pas encore changé) :

- 
- 
- 

## À 30 jours — installer les fondations

Un seul objectif, tiré de vos chantiers, qui ne dépend que de vous et qui se voit. Exemples issus des carnets : installer le brief quotidien ; tenir un entretien de suivi avec chaque membre de l''équipe ; afficher les trois objectifs et le tableau de bord ; faire un retour positif précis par personne et par semaine ; écrire le RACI des cinq décisions les plus floues.

| Objectif à 30 jours | Première action (date) | Comment je saurai que c''est fait | Ce qui pourrait m''en empêcher | Ce que je fais si ça arrive |
|---|---|---|---|---|
| | | | | |

## À 60 jours — consolider et ouvrir

Un deuxième objectif, qui peut s''appuyer sur le premier et impliquer l''équipe. Exemples : construire les règles du jeu avec l''équipe ; lancer une première rétrospective ; mettre en place un PDI pour deux personnes ; traiter un premier problème en PDCA ; conduire le retex d''un incident.

| Objectif à 60 jours | Première action (date) | Comment je saurai que c''est fait | Ce qui pourrait m''en empêcher | Ce que je fais si ça arrive |
|---|---|---|---|---|
| | | | | |

## À 90 jours — faire le bilan et remonter

Un troisième objectif, tourné vers le pilotage et la hiérarchie. Exemples : présenter un premier bilan d''activité (résultats, moyens, conditions) à ma hiérarchie ; faire un point formel avec mon responsable sur mon rôle, mes marges et mes besoins ; vérifier que les entretiens de parcours professionnel de l''équipe sont à jour ; proposer une amélioration chiffrée.

| Objectif à 90 jours | Première action (date) | Comment je saurai que c''est fait | Ce qui pourrait m''en empêcher | Ce que je fais si ça arrive |
|---|---|---|---|---|
| | | | | |

## Mes rituels (ce que je fais chaque semaine, quoi qu''il arrive)

| Rituel | Jour et heure | Durée | Installé le |
|---|---|---|---|
| Brief quotidien | | | |
| Point hebdomadaire avec relevé de décisions | | | |
| Entretiens de suivi (planifiés pour le trimestre) | | | |
| Point « ce qui nous a compliqué la vie » / rétrospective | | | |
| Dix minutes de préparation avant chaque entretien | | | |

## Mes garde-fous personnels

Ce que je m''engage à ne plus faire : ____________________ (exemples tirés de la formation : « faire au mieux » sans dire non ; recadrer par message ; laisser passer une pique en réunion ; « ça va se tasser » ; répondre à mes messages le soir)

Le signal qui me dira que je retombe dans mes anciennes habitudes : ____________________

La personne à qui je demanderai un retour sur mon management dans trois mois (mon responsable, un pair, un membre de l''équipe) : ____________________

## Relecture

| Date | Objectif | Fait / en cours / abandonné | Ce que j''en retiens |
|---|---|---|---|
| J+30 | | | |
| J+60 | | | |
| J+90 | | | |

## Comment utiliser ce plan

Imprimez-le ou gardez-le dans votre carnet. Mettez les trois dates de relecture dans votre agenda, maintenant. À chaque relecture, trois questions : qu''est-ce que j''ai fait ? Qu''est-ce qui m''en a empêché ? Qu''est-ce que je change ? Un objectif abandonné n''est pas un échec si vous savez pourquoi ; un objectif oublié en est un.

Si vous le souhaitez, vous pouvez transmettre ce plan à IDEAFORMA (contact@ideaforma.fr) : nous vous proposerons un point téléphonique de trente minutes à 90 jours pour en faire le bilan avec vous. Ce point fait partie de l''accompagnement de la formation ; il n''est pas noté et reste confidentiel.

## Pour aller plus loin, à partir de vos chantiers

- Rôle et posture : Henry Mintzberg, *Manager : ce que font vraiment les managers*, Vuibert, 2011.
- Fonctionnement d''équipe : Patrick Lencioni, *Optimisez votre équipe*, Éditions Un monde différent, 2005 (éd. originale *The Five Dysfunctions of a Team*, 2002).
- Communication et entretiens : Sloan R. Weitzel, *Feedback That Works: How to Build and Deliver Your Message*, 2e éd., Center for Creative Leadership, 2019 ; Marshall B. Rosenberg, *Les mots sont des fenêtres (ou bien ce sont des murs)*, La Découverte, 1999.
- Motivation et sécurité psychologique : Amy C. Edmondson, *L''entreprise sereine*, Pearson, 2022 (éd. originale *The Fearless Organization*, 2018) ; Teresa Amabile, Steven Kramer, *The Progress Principle*, Harvard Business Review Press, 2011.
- Conflits : Roger Fisher, William Ury, *Comment réussir une négociation*, Seuil, 1982 (éd. originale *Getting to Yes*, 1981).
- Changement : John P. Kotter, *Conduire le changement : feuille de route en 8 étapes*, Pearson, 2015.
- Droit du travail au quotidien : Code du travail numérique, code.travail.gouv.fr ; ministère du Travail, travail-emploi.gouv.fr ; INRS, inrs.fr ; ANACT, anact.fr.

## Sources

- Phillippa Lally, Cornelia H. M. van Jaarsveld, Henry W. W. Potts, Jane Wardle, « How are habits formed: Modelling habit formation in the real world », *European Journal of Social Psychology*, vol. 40, n° 6, 2010.
- Code du travail, art. L6315-1 (entretien de parcours professionnel), legifrance.gouv.fr.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Vous avez suivi 35 heures de formation, rempli six carnets de bord et passé l''évaluation finale. Reste le plus utile : ce que vous allez faire dans votre équipe à partir de lundi. Ce plan d''action est un engagement envers vous-même. Deux pages, une trentaine de minutes de rédaction à partir de vos carnets, une relecture par mois.

Pourquoi 30, 60, 90 jours ? D''abord parce que trois étapes courtes se tiennent mieux qu''un objectif annuel. Ensuite parce qu''une nouvelle habitude met du temps à devenir automatique : dans une étude de l''University College London, le délai médian pour qu''un nouveau comportement quotidien devienne quasi automatique a été de 66 jours, avec des écarts allant de 18 à 254 jours selon les personnes et les comportements (Lally et al., 2010). Trois mois ne garantissent rien, mais c''est un horizon réaliste pour voir si une pratique s''installe ou s''efface.

## Avant de remplir : relire ses carnets

Reprenez les six carnets de bord et, pour chacun, notez en une ligne la « première chose à faire dès demain » que vous aviez écrite. Vous obtenez six intentions. Certaines sont faites. Certaines ne le sont pas. C''est de ces dernières que part le plan.

Reprenez aussi votre autopositionnement final (leçon 7.2) et comparez-le à celui du module 0. Les affirmations où vous avez gagné un ou deux crans sont vos acquis. Celles qui ont peu bougé sont vos chantiers.

## Le gabarit

Ma situation en une phrase (équipe, taille, contexte, ce qui a changé pendant la formation) : ____________________

Mes trois acquis les plus nets (ce que je fais maintenant et que je ne faisais pas avant) :

- 
- 
- 

Mes trois chantiers (ce que je sais devoir changer et que je n''ai pas encore changé) :

- 
- 
- 

## À 30 jours — installer les fondations

Un seul objectif, tiré de vos chantiers, qui ne dépend que de vous et qui se voit. Exemples issus des carnets : installer le brief quotidien ; tenir un entretien de suivi avec chaque membre de l''équipe ; afficher les trois objectifs et le tableau de bord ; faire un retour positif précis par personne et par semaine ; écrire le RACI des cinq décisions les plus floues.

| Objectif à 30 jours | Première action (date) | Comment je saurai que c''est fait | Ce qui pourrait m''en empêcher | Ce que je fais si ça arrive |
|---|---|---|---|---|
| | | | | |

## À 60 jours — consolider et ouvrir

Un deuxième objectif, qui peut s''appuyer sur le premier et impliquer l''équipe. Exemples : construire les règles du jeu avec l''équipe ; lancer une première rétrospective ; mettre en place un PDI pour deux personnes ; traiter un premier problème en PDCA ; conduire le retex d''un incident.

| Objectif à 60 jours | Première action (date) | Comment je saurai que c''est fait | Ce qui pourrait m''en empêcher | Ce que je fais si ça arrive |
|---|---|---|---|---|
| | | | | |

## À 90 jours — faire le bilan et remonter

Un troisième objectif, tourné vers le pilotage et la hiérarchie. Exemples : présenter un premier bilan d''activité (résultats, moyens, conditions) à ma hiérarchie ; faire un point formel avec mon responsable sur mon rôle, mes marges et mes besoins ; vérifier que les entretiens de parcours professionnel de l''équipe sont à jour ; proposer une amélioration chiffrée.

| Objectif à 90 jours | Première action (date) | Comment je saurai que c''est fait | Ce qui pourrait m''en empêcher | Ce que je fais si ça arrive |
|---|---|---|---|---|
| | | | | |

## Mes rituels (ce que je fais chaque semaine, quoi qu''il arrive)

| Rituel | Jour et heure | Durée | Installé le |
|---|---|---|---|
| Brief quotidien | | | |
| Point hebdomadaire avec relevé de décisions | | | |
| Entretiens de suivi (planifiés pour le trimestre) | | | |
| Point « ce qui nous a compliqué la vie » / rétrospective | | | |
| Dix minutes de préparation avant chaque entretien | | | |

## Mes garde-fous personnels

Ce que je m''engage à ne plus faire : ____________________ (exemples tirés de la formation : « faire au mieux » sans dire non ; recadrer par message ; laisser passer une pique en réunion ; « ça va se tasser » ; répondre à mes messages le soir)

Le signal qui me dira que je retombe dans mes anciennes habitudes : ____________________

La personne à qui je demanderai un retour sur mon management dans trois mois (mon responsable, un pair, un membre de l''équipe) : ____________________

## Relecture

| Date | Objectif | Fait / en cours / abandonné | Ce que j''en retiens |
|---|---|---|---|
| J+30 | | | |
| J+60 | | | |
| J+90 | | | |

## Comment utiliser ce plan

Imprimez-le ou gardez-le dans votre carnet. Mettez les trois dates de relecture dans votre agenda, maintenant. À chaque relecture, trois questions : qu''est-ce que j''ai fait ? Qu''est-ce qui m''en a empêché ? Qu''est-ce que je change ? Un objectif abandonné n''est pas un échec si vous savez pourquoi ; un objectif oublié en est un.

Si vous le souhaitez, vous pouvez transmettre ce plan à IDEAFORMA (contact@ideaforma.fr) : nous vous proposerons un point téléphonique de trente minutes à 90 jours pour en faire le bilan avec vous. Ce point fait partie de l''accompagnement de la formation ; il n''est pas noté et reste confidentiel.

## Pour aller plus loin, à partir de vos chantiers

- Rôle et posture : Henry Mintzberg, *Manager : ce que font vraiment les managers*, Vuibert, 2011.
- Fonctionnement d''équipe : Patrick Lencioni, *Optimisez votre équipe*, Éditions Un monde différent, 2005 (éd. originale *The Five Dysfunctions of a Team*, 2002).
- Communication et entretiens : Sloan R. Weitzel, *Feedback That Works: How to Build and Deliver Your Message*, 2e éd., Center for Creative Leadership, 2019 ; Marshall B. Rosenberg, *Les mots sont des fenêtres (ou bien ce sont des murs)*, La Découverte, 1999.
- Motivation et sécurité psychologique : Amy C. Edmondson, *L''entreprise sereine*, Pearson, 2022 (éd. originale *The Fearless Organization*, 2018) ; Teresa Amabile, Steven Kramer, *The Progress Principle*, Harvard Business Review Press, 2011.
- Conflits : Roger Fisher, William Ury, *Comment réussir une négociation*, Seuil, 1982 (éd. originale *Getting to Yes*, 1981).
- Changement : John P. Kotter, *Conduire le changement : feuille de route en 8 étapes*, Pearson, 2015.
- Droit du travail au quotidien : Code du travail numérique, code.travail.gouv.fr ; ministère du Travail, travail-emploi.gouv.fr ; INRS, inrs.fr ; ANACT, anact.fr.

## Sources

- Phillippa Lally, Cornelia H. M. van Jaarsveld, Henry W. W. Potts, Jane Wardle, « How are habits formed: Modelling habit formation in the real world », *European Journal of Social Psychology*, vol. 40, n° 6, 2010.
- Code du travail, art. L6315-1 (entretien de parcours professionnel), legifrance.gouv.fr.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 8 and l.ordre = 3;
  n := n + 1;

  -- 7.4-video-et-apres.md
  update public.lecons l set contenu = case when l.type = 'texte'
      then jsonb_build_object('texte', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Et après ?

Vous y êtes. Trente-cinq heures, huit modules, six carnets de bord, une évaluation finale. Avant de vous laisser, je voudrais faire trois choses avec vous : regarder le chemin parcouru, parler de ce qui vient, et vous donner les moyens d''aller plus loin.

## Le chemin parcouru

Au module 0, vous avez répondu à vingt affirmations sur votre pratique de manager. Vous venez d''y répondre à nouveau. Regardez l''écart. Ce n''est pas une note : c''est la carte de ce que vous avez appris, et de ce qu''il vous reste à travailler.

Vous savez maintenant ce qu''est le rôle d''un manager de proximité, et ce qu''il n''est pas. Vous savez le situer dans le droit : l''obligation de sécurité, ce qui relève de vous et ce qui relève de l''employeur, ce qu''on ne diffuse jamais sur la vie des gens. Vous savez organiser : des objectifs précis, une matrice de compétences, un RACI, un tableau de bord avec ses garde-fous, un poste aménagé sans en dire le motif. Vous savez communiquer : écouter avant de répondre, donner un retour qui s''appuie sur des faits, conduire un entretien de suivi, distinguer l''entretien annuel de l''entretien de parcours professionnel, animer une réunion qui décide, dire non à votre hiérarchie avec des options. Vous savez ce qui motive, ce qui fait qu''une équipe ose parler, comment reconnaître sans flatter, comment développer et intégrer, comment tenir un cadre soutenable et repérer les signaux qui comptent. Vous savez qu''un conflit se traite au niveau 2, pas au niveau 5, et que le registre change quand il s''agit d''une faute, d''une souffrance ou d''un harcèlement. Et vous savez évaluer sans juger, faire un retour d''expérience, améliorer en continu, et conduire un changement que vous n''avez pas choisi.

**Le management s''apprend. Il s''apprend en le pratiquant.**

Rien de tout cela n''est acquis parce que vous l''avez lu. C''est acquis quand vous l''avez fait trois fois dans votre équipe. C''est pour cela que la dernière leçon de cette formation n''est pas un quiz : c''est votre plan d''action à 30, 60 et 90 jours. Si vous ne l''avez pas encore rempli, faites-le maintenant, avant de fermer cette page. Trente minutes. Trois objectifs. Trois dates dans votre agenda.

## Ce que vous pouvez faire d''IDEAFORMA après

Deux choses, concrètement.

La première : le point à 90 jours. Si vous nous transmettez votre plan d''action, nous vous proposons un entretien téléphonique de trente minutes, trois mois après la fin de votre formation, pour en faire le bilan avec vous. Qu''est-ce qui a marché, qu''est-ce qui a coincé, qu''est-ce qu''on ajuste. Ce point fait partie de la formation. Il n''est pas noté, il reste entre nous.

La deuxième : la certification. Cette formation est construite sur le référentiel « Animer une équipe de travail », enregistré au Répertoire spécifique de France Compétences sous le numéro RS7377, dont le certificateur est CCI France. Elle en reprend les dix compétences. Un point important, pour qu''il n''y ait aucun malentendu : à ce jour, IDEAFORMA n''est pas habilité par CCI France, et cette formation n''est pas certifiante. Ce que vous recevez, c''est une attestation de fin de formation, qui mentionne les objectifs, la nature et la durée de la formation, et les résultats de votre évaluation. Si et quand IDEAFORMA est habilité, nous vous en informerons et nous vous dirons à quelles conditions vous pourriez vous présenter aux épreuves de certification. Nous ne pouvons rien vous promettre de plus aujourd''hui.

## Pour aller plus loin

Si vous voulez approfondir, trois conseils, et pas une bibliothèque.

Lisez un livre, un seul, sur le chantier que votre autopositionnement a fait ressortir. Les références sont dans votre plan d''action, classées par thème. Pour la plupart des managers de proximité, le plus utile est celui d''Amy Edmondson sur la sécurité psychologique, *L''entreprise sereine*, parce que c''est elle qui conditionne une bonne partie du reste.

Trouvez un pair. Un autre manager, dans votre entreprise ou ailleurs, avec qui parler une fois par mois de ce qui vous arrive. Le manager de proximité est seul entre sa hiérarchie et son équipe ; un pair, c''est le seul endroit où l''on peut dire « je ne sais pas comment faire » sans conséquence.

Et demandez un retour sur votre management, dans trois mois, à quelqu''un qui vous voit faire. Votre responsable, ou un membre de l''équipe en qui vous avez confiance. Vous avez appris à recevoir un feedback au module 3 : remercier, demander un exemple, dire ce qu''on en fait. C''est le moment.

## Votre avis

Une dernière chose, qui compte pour nous. En tant qu''organisme de formation certifié Qualiopi, nous mesurons la satisfaction et les résultats de chaque formation, et nous les utilisons pour l''améliorer. Vous allez recevoir un questionnaire de satisfaction par e-mail. Il prend cinq minutes. Dites-nous ce qui vous a servi, ce qui vous a manqué, ce que vous auriez voulu voir traité autrement. Les prochains apprenants, et les prochaines versions de cette formation, en dépendent. Et dans trois mois, un second questionnaire vous demandera ce que vous avez réellement mis en œuvre : c''est celui-là qui nous dit si la formation a été utile.

## À l''atelier Garnier

Et Karim ? Un an après, l''atelier Garnier tient ses délais, l''équipe a grandi, Thierry transmet le redressage à Julien, Julien est autonome sur les raccords de peinture, Fatou a son chariot, Marc est consulté chaque soir, Sophie télétravaille le mercredi, et Michel, qui voulait « que ça tourne », a découvert qu''il avait un manager. Rien de tout cela n''est venu d''un talent particulier. C''est venu de méthodes simples, appliquées avec constance, dans l''ordre : comprendre, organiser, communiquer, motiver, apaiser, piloter.

C''est exactement ce qui vous attend. Merci d''avoir suivi cette formation. Et bon management.

## Sources
France Compétences, fiche RS7377 « Animer une équipe de travail », certificateur CCI France, francecompetences.fr ; Code du travail, art. L6353-1 (attestation de fin de formation), legifrance.gouv.fr ; Référentiel national qualité (Qualiopi), indicateurs 11 (évaluation des acquis) et 30 à 32 (recueil des appréciations, traitement des réclamations, amélioration continue) ; leçons 0.1, 7.2 et 7.3.
')
      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', 'Version écrite de la vidéo (le texte de référence ; la vidéo peut le formuler autrement).

## Et après ?

Vous y êtes. Trente-cinq heures, huit modules, six carnets de bord, une évaluation finale. Avant de vous laisser, je voudrais faire trois choses avec vous : regarder le chemin parcouru, parler de ce qui vient, et vous donner les moyens d''aller plus loin.

## Le chemin parcouru

Au module 0, vous avez répondu à vingt affirmations sur votre pratique de manager. Vous venez d''y répondre à nouveau. Regardez l''écart. Ce n''est pas une note : c''est la carte de ce que vous avez appris, et de ce qu''il vous reste à travailler.

Vous savez maintenant ce qu''est le rôle d''un manager de proximité, et ce qu''il n''est pas. Vous savez le situer dans le droit : l''obligation de sécurité, ce qui relève de vous et ce qui relève de l''employeur, ce qu''on ne diffuse jamais sur la vie des gens. Vous savez organiser : des objectifs précis, une matrice de compétences, un RACI, un tableau de bord avec ses garde-fous, un poste aménagé sans en dire le motif. Vous savez communiquer : écouter avant de répondre, donner un retour qui s''appuie sur des faits, conduire un entretien de suivi, distinguer l''entretien annuel de l''entretien de parcours professionnel, animer une réunion qui décide, dire non à votre hiérarchie avec des options. Vous savez ce qui motive, ce qui fait qu''une équipe ose parler, comment reconnaître sans flatter, comment développer et intégrer, comment tenir un cadre soutenable et repérer les signaux qui comptent. Vous savez qu''un conflit se traite au niveau 2, pas au niveau 5, et que le registre change quand il s''agit d''une faute, d''une souffrance ou d''un harcèlement. Et vous savez évaluer sans juger, faire un retour d''expérience, améliorer en continu, et conduire un changement que vous n''avez pas choisi.

**Le management s''apprend. Il s''apprend en le pratiquant.**

Rien de tout cela n''est acquis parce que vous l''avez lu. C''est acquis quand vous l''avez fait trois fois dans votre équipe. C''est pour cela que la dernière leçon de cette formation n''est pas un quiz : c''est votre plan d''action à 30, 60 et 90 jours. Si vous ne l''avez pas encore rempli, faites-le maintenant, avant de fermer cette page. Trente minutes. Trois objectifs. Trois dates dans votre agenda.

## Ce que vous pouvez faire d''IDEAFORMA après

Deux choses, concrètement.

La première : le point à 90 jours. Si vous nous transmettez votre plan d''action, nous vous proposons un entretien téléphonique de trente minutes, trois mois après la fin de votre formation, pour en faire le bilan avec vous. Qu''est-ce qui a marché, qu''est-ce qui a coincé, qu''est-ce qu''on ajuste. Ce point fait partie de la formation. Il n''est pas noté, il reste entre nous.

La deuxième : la certification. Cette formation est construite sur le référentiel « Animer une équipe de travail », enregistré au Répertoire spécifique de France Compétences sous le numéro RS7377, dont le certificateur est CCI France. Elle en reprend les dix compétences. Un point important, pour qu''il n''y ait aucun malentendu : à ce jour, IDEAFORMA n''est pas habilité par CCI France, et cette formation n''est pas certifiante. Ce que vous recevez, c''est une attestation de fin de formation, qui mentionne les objectifs, la nature et la durée de la formation, et les résultats de votre évaluation. Si et quand IDEAFORMA est habilité, nous vous en informerons et nous vous dirons à quelles conditions vous pourriez vous présenter aux épreuves de certification. Nous ne pouvons rien vous promettre de plus aujourd''hui.

## Pour aller plus loin

Si vous voulez approfondir, trois conseils, et pas une bibliothèque.

Lisez un livre, un seul, sur le chantier que votre autopositionnement a fait ressortir. Les références sont dans votre plan d''action, classées par thème. Pour la plupart des managers de proximité, le plus utile est celui d''Amy Edmondson sur la sécurité psychologique, *L''entreprise sereine*, parce que c''est elle qui conditionne une bonne partie du reste.

Trouvez un pair. Un autre manager, dans votre entreprise ou ailleurs, avec qui parler une fois par mois de ce qui vous arrive. Le manager de proximité est seul entre sa hiérarchie et son équipe ; un pair, c''est le seul endroit où l''on peut dire « je ne sais pas comment faire » sans conséquence.

Et demandez un retour sur votre management, dans trois mois, à quelqu''un qui vous voit faire. Votre responsable, ou un membre de l''équipe en qui vous avez confiance. Vous avez appris à recevoir un feedback au module 3 : remercier, demander un exemple, dire ce qu''on en fait. C''est le moment.

## Votre avis

Une dernière chose, qui compte pour nous. En tant qu''organisme de formation certifié Qualiopi, nous mesurons la satisfaction et les résultats de chaque formation, et nous les utilisons pour l''améliorer. Vous allez recevoir un questionnaire de satisfaction par e-mail. Il prend cinq minutes. Dites-nous ce qui vous a servi, ce qui vous a manqué, ce que vous auriez voulu voir traité autrement. Les prochains apprenants, et les prochaines versions de cette formation, en dépendent. Et dans trois mois, un second questionnaire vous demandera ce que vous avez réellement mis en œuvre : c''est celui-là qui nous dit si la formation a été utile.

## À l''atelier Garnier

Et Karim ? Un an après, l''atelier Garnier tient ses délais, l''équipe a grandi, Thierry transmet le redressage à Julien, Julien est autonome sur les raccords de peinture, Fatou a son chariot, Marc est consulté chaque soir, Sophie télétravaille le mercredi, et Michel, qui voulait « que ça tourne », a découvert qu''il avait un manager. Rien de tout cela n''est venu d''un talent particulier. C''est venu de méthodes simples, appliquées avec constance, dans l''ordre : comprendre, organiser, communiquer, motiver, apaiser, piloter.

C''est exactement ce qui vous attend. Merci d''avoir suivi cette formation. Et bon management.

## Sources
France Compétences, fiche RS7377 « Animer une équipe de travail », certificateur CCI France, francecompetences.fr ; Code du travail, art. L6353-1 (attestation de fin de formation), legifrance.gouv.fr ; Référentiel national qualité (Qualiopi), indicateurs 11 (évaluation des acquis) et 30 à 32 (recueil des appréciations, traitement des réclamations, amélioration continue) ; leçons 0.1, 7.2 et 7.3.
') end,
    publie = true
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 8 and l.ordre = 4;
  n := n + 1;

  update public.lecons l set titre = 'Le tableau de bord qui a sauvé l''agence'
    from public.modules m where l.module_id = m.id and m.formation_id = f and m.ordre = 3 and l.ordre = 9;

  raise notice 'Contenus importés : % leçons', n;
end $$;
