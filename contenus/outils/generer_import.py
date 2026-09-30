#!/usr/bin/env python3
"""
Génère un script SQL qui charge le contenu des leçons d'une formation dans la plateforme.

Usage : python3 contenus/outils/generer_import.py management-leadership > supabase/seeds/contenu_management_leadership.sql

Convention des fichiers, dans contenus/<slug>/NN-module-N/ :
  M.L-<titre>.md    → leçon texte / fiche / script vidéo ou podcast (M = n° de module, L = n° de leçon)
  M.L-<titre>.json  → quiz ou évaluation (format de l'éditeur : questions, seuil, tentatives_max, corrections, consigne)

Règles :
  - type "texte" : tout le fichier → contenu.texte
  - type "video" / "podcast" / "pdf" / "ebook" / "slides" : le fichier → contenu.description (transcription /
    texte d'accompagnement) ; le fichier média est déposé ensuite via l'éditeur admin
  - le titre de premier niveau ("# ...") du fichier est retiré (la plateforme affiche déjà le titre de la leçon)
  - scripts vidéo / podcast : une version élève est générée (indications de production retirées, repères
    [Titre : « … »] convertis en sous-titres, générique du podcast converti en phrase) ; le script complet
    reste dans contenus/ pour la production
Le script résultant met à jour les leçons par (module.ordre, lecon.ordre) et les publie.
"""
import json, re, sys
from pathlib import Path

slug = sys.argv[1] if len(sys.argv) > 1 else "management-leadership"
base = Path(__file__).resolve().parent.parent / slug
if not base.exists():
    sys.exit(f"dossier introuvable : {base}")

def q(s: str) -> str:
    return "'" + s.replace("'", "''") + "'"

def nettoyer(md: str) -> str:
    lignes = md.split("\n")
    # retire le premier titre H1 et la ligne vide qui suit
    if lignes and lignes[0].startswith("# "):
        lignes = lignes[1:]
        while lignes and not lignes[0].strip():
            lignes = lignes[1:]
    return "\n".join(lignes).strip() + "\n"

def version_eleve(md: str, nom: str) -> str:
    """Script vidéo / podcast → transcription lisible par l'élève : sans indications de production,
    les repères [Titre : « … »] deviennent des sous-titres, le générique du podcast devient une phrase."""
    if not re.search(r"-(video|podcast)-", nom):
        return md
    podcast = "-podcast-" in nom
    sortie = []
    for brute in md.split("\n"):
        l = brute.strip()
        if not l:
            sortie.append("")
            continue
        if l == "---" or l.startswith(("Type :", "Charte :", "Débit :")):
            continue
        if l.startswith("Format :"):
            voix = re.findall(r"\*\*([^*]+)\*\* = ([^.]+?(?:\([^)]*\))?)\.", l)
            if voix:
                noms = [f"{n.capitalize()}, {d.strip()}" for n, d in voix]
                sortie.append("Conversation entre " + " et ".join(noms) + ".")
            continue
        if l.startswith(("Sources :", "Repères mobilisés :")):
            sortie.append("## Sources")
            sortie.append(l.split(":", 1)[1].strip())
            continue
        if l.startswith("[") and l.endswith("]"):
            m = re.search(r"Titre(?: à l'écran)? : « (.+?) »", l)
            if m:
                sortie.append("## " + m.group(1))
            elif "reprise du cas" in l:
                sortie.append("## À l'atelier Garnier")
            elif l.startswith("[Texte à l'écran : «"):
                m2 = re.search(r"« (.+?) »", l)
                if m2:
                    sortie.append("**" + m2.group(1) + "**")
            elif l.startswith("[Titre"):
                sortie.append("## " + re.sub(r"^\[Titre[^:]*: ?|\]$", "", l).strip(" «»"))
            # autres indications (plan, schéma, séquence jouée, fondu…) : retirées
            continue
        # indications entre crochets en milieu de ligne
        l = re.sub(r"\s*\[[^\]]*\]\s*", " ", l).strip()
        # prénoms des voix en capitales → Capitalisés ; répliques « … » sur des paragraphes séparés
        l = re.sub(r"\*\*([A-ZÉÈÀÂÎÔÛ' -]{2,})\*\*", lambda m: "**" + m.group(1).title() + "**", l)
        if l:
            if l.startswith("«") and sortie and sortie[-1]:
                sortie.append("")
            sortie.append(l)
    texte = "\n".join(sortie)
    texte = re.sub(r"\n{3,}", "\n\n", texte).strip() + "\n"
    intro = "Transcription de l'épisode." if podcast else "Transcription de la vidéo."
    return intro + "\n\n" + texte

entrees = []
for dossier in sorted(base.glob("*-module-*")):
    for f in sorted(dossier.iterdir()):
        m = re.match(r"^(\d+)\.(\d+)-", f.name)
        if not m:
            continue
        mod, lec = int(m.group(1)), int(m.group(2))
        if f.suffix == ".json":
            data = json.loads(f.read_text(encoding="utf-8"))
            contenu = {
                "questions": data.get("questions", []),
                "seuil": data.get("seuil", 70),
                "tentatives_max": data.get("tentatives_max", 0),
                "corrections": data.get("corrections", True),
                "consigne": data.get("consigne"),
            }
            entrees.append((mod, lec, "quiz", contenu, f.name))
        elif f.suffix == ".md":
            texte = version_eleve(nettoyer(f.read_text(encoding="utf-8")), f.name)
            entrees.append((mod, lec, "md", texte, f.name))

out = [
    "-- ============================================================",
    f"-- IDEAFORMA — import du contenu des leçons : {slug}",
    "-- Généré par contenus/outils/generer_import.py — relançable (écrase le contenu des leçons listées).",
    "-- Prérequis : la formation et son squelette (modules + leçons) existent.",
    "-- ============================================================",
    "do $$",
    "declare f uuid; n int := 0;",
    "begin",
    f"  select id into f from public.formations where slug = {q(slug)};",
    "  if f is null then raise exception 'formation introuvable'; end if;",
    "",
]
for mod, lec, genre, contenu, nom in entrees:
    out.append(f"  -- {nom}")
    if genre == "quiz":
        js = json.dumps(contenu, ensure_ascii=False)
        out.append(
            "  update public.lecons l set contenu = " + q(js) + "::jsonb, publie = true\n"
            "    from public.modules m where l.module_id = m.id and m.formation_id = f"
            f" and m.ordre = {mod + 1} and l.ordre = {lec};"
        )
    else:
        # texte → contenu.texte pour les leçons 'texte', contenu.description pour les autres types
        out.append(
            "  update public.lecons l set contenu = case when l.type = 'texte'\n"
            "      then jsonb_build_object('texte', " + q(contenu) + ")\n"
            "      else (coalesce(l.contenu, '{}'::jsonb) - 'note_conception') || jsonb_build_object('description', " + q(contenu) + ") end,\n"
            "    publie = true\n"
            "    from public.modules m where l.module_id = m.id and m.formation_id = f"
            f" and m.ordre = {mod + 1} and l.ordre = {lec};"
        )
    out.append("  n := n + 1;")
    out.append("")
out.append("  raise notice 'Contenus importés : % leçons', n;")
out.append("end $$;")
print("\n".join(out))
