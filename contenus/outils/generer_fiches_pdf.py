#!/usr/bin/env python3
"""
Génère les fiches outils en PDF (mise en page IDEAFORMA, fond clair, encadrés à bordure noire)
à partir des fichiers .md des fiches.

Usage : python3 contenus/outils/generer_fiches_pdf.py management-leadership
Sortie : contenus/<slug>/pdf/<nom>.pdf (+ .html intermédiaire dans le dossier temporaire)

Nécessite node + playwright (Chromium) pour l'impression PDF. Le .md est converti en HTML avec le
même balisage léger que la plateforme (titres, listes, tableaux, gras) ; les lignes de soulignés
« ______ » deviennent des champs à remplir.
"""
import html, json, os, re, subprocess, sys, tempfile, unicodedata
from pathlib import Path

slug = sys.argv[1] if len(sys.argv) > 1 else "management-leadership"
base = Path(__file__).resolve().parent.parent / slug
sortie = base / "pdf"
sortie.mkdir(exist_ok=True)

FICHES = {
    "01-module-1/1.8-fiche-feuille-de-route-90-jours.md": ("1.8", "Ma feuille de route des 90 premiers jours", "Module 1 — Comprendre le rôle du manager"),
    "02-module-2/2.10-fiche-outils-organisation.md": ("2.10", "Matrice de compétences, RACI, tableau de bord", "Module 2 — Organiser et structurer le travail de l'équipe"),
    "03-module-3/3.9-fiche-trame-entretien-ordre-du-jour.md": ("3.9", "Trames d'entretien, feedback, ordre du jour", "Module 3 — Communiquer, animer, conduire les entretiens"),
    "04-module-4/4.9-fiche-pdi-checklist-integration.md": ("4.9", "Plan de développement, intégration, sécurité psychologique", "Module 4 — Motiver, engager, faire progresser"),
    "06-module-6/6.8-fiche-retex-et-plan-de-changement.md": ("6.8", "Retour d'expérience, PDCA, plan de changement", "Module 6 — Piloter la performance et accompagner le changement"),
    "07-module-7/7.3-plan-d-action-30-60-90.md": ("7.3", "Mon plan d'action 30-60-90 jours", "Module 7 — Évaluation finale et plan d'action"),
}

def inline(t: str) -> str:
    t = html.escape(t)
    t = re.sub(r"\*\*([^*]+)\*\*", r"<strong>\1</strong>", t)
    t = re.sub(r"\*([^*]+)\*", r"<em>\1</em>", t)
    t = re.sub(r"_{4,}", '<span class="champ"></span>', t)
    return t

def md_vers_html(md: str) -> str:
    lignes = md.split("\n")
    # retire le H1 et le paragraphe d'intro technique (« Cette fiche est un gabarit… ») et la section d'accompagnement
    if lignes and lignes[0].startswith("# "):
        lignes = lignes[1:]
    texte = "\n".join(lignes)
    texte = re.split(r"\n## Texte d'accompagnement[^\n]*\n", texte)[0]
    texte = re.sub(r"^\s*(Cette fiche est un gabarit à remplir\.[^\n]*|(?:Trois|Quatre|Cinq|Deux) gabarits à recopier[^\n]*)\n", "", texte, flags=re.M)
    out, para, liste, table, ol = [], [], [], [], []
    def flush():
        nonlocal para, liste, table, ol
        if para: out.append("<p>" + inline(" ".join(para)) + "</p>"); para = []
        if liste: out.append("<ul>" + "".join(f"<li>{inline(x)}</li>" for x in liste) + "</ul>"); liste = []
        if ol: out.append("<ol>" + "".join(f"<li>{inline(x)}</li>" for x in ol) + "</ol>"); ol = []
        if table:
            tete, *corps = table
            vide = lambda row: all(not c.strip() for c in row)
            out.append('<table><thead><tr>' + "".join(f"<th>{inline(c)}</th>" for c in tete) + "</tr></thead><tbody>"
                       + "".join("<tr>" + "".join(f"<td>{'&nbsp;' if vide(r) else inline(c)}</td>" for c in r) + "</tr>" for r in corps) + "</tbody></table>")
            table = []
    for brute in texte.split("\n"):
        l = brute.strip()
        if not l: flush(); continue
        if l == "---": flush(); out.append('<hr class="sep" />'); continue
        if l.startswith("|"):
            if para or liste or ol: flush()
            if re.match(r"^\|[\s:|-]+\|$", l) and "-" in l: continue
            table.append([c.strip() for c in l.strip("|").split("|")]); continue
        if table: flush()
        if l.startswith("### "): flush(); out.append(f"<h3>{inline(l[4:])}</h3>"); continue
        if l.startswith("## "):
            flush()
            titre = l[3:]
            if titre.upper().startswith("GABARIT") or titre.isupper():
                out.append(f'<h2 class="gabarit">{inline(titre)}</h2>')
            else:
                out.append(f"<h2>{inline(titre)}</h2>")
            continue
        if l.startswith("- ") or l.startswith("• "):
            if para: out.append("<p>" + inline(" ".join(para)) + "</p>"); para = []
            liste.append(l[2:]); continue
        m = re.match(r"^(\d+)\. (.*)$", l)
        if m and not para:
            ol.append(m.group(2)); continue
        if liste or ol: flush()
        para.append(l)
    flush()
    return "\n".join(out)

CSS = """
@page { size: A4; margin: 18mm 16mm 20mm 16mm; }
* { box-sizing: border-box; }
body { font-family: 'Poppins', 'DejaVu Sans', Arial, sans-serif; font-weight: 300; color: #14213D; font-size: 10.2pt; line-height: 1.45; margin: 0; background: #ffffff; }
strong { font-weight: 600; }
h1 { font-size: 20pt; font-weight: 700; color: #0B2545; margin: 0 0 2mm; line-height: 1.2; }
.sous { font-size: 9.5pt; color: #5B6B82; margin: 0 0 6mm; }
.bande { height: 1.2mm; background: #2F8BD6; margin: 0 0 6mm; border-radius: 1mm; }
h2 { font-size: 13pt; font-weight: 600; color: #0B2545; margin: 7mm 0 2.5mm; padding-bottom: 1.5mm; border-bottom: 1.5px solid #E3EAF2; break-after: avoid; }
h2.gabarit { background: #EAF4FC; border: 1.5px solid #0B2545; border-radius: 2mm; padding: 2.5mm 3.5mm; font-size: 12pt; text-transform: none; letter-spacing: .2px; }
h3 { font-size: 11pt; font-weight: 600; color: #1565A0; margin: 5mm 0 2mm; break-after: avoid; }
p { margin: 0 0 2.5mm; }
ul, ol { margin: 0 0 3mm; padding-left: 5mm; }
li { margin-bottom: 1mm; }
hr.sep { border: 0; border-top: 1px dashed #C9D6E3; margin: 6mm 0; }
table { width: 100%; border-collapse: collapse; margin: 2mm 0 4mm; font-size: 9pt; break-inside: auto; }
th { background: #EAF4FC; color: #0B2545; font-weight: 600; text-align: left; padding: 2mm 2.2mm; border: 1px solid #14213D; }
td { padding: 2.2mm 2.2mm; border: 1px solid #14213D; vertical-align: top; min-height: 7mm; }
tbody tr td:empty::after, td { height: 7.5mm; }
tr { break-inside: avoid; }
.champ { display: inline-block; min-width: 34mm; border-bottom: 1px solid #14213D; height: 4.5mm; vertical-align: baseline; margin: 0 1mm; }
.encadre { border: 1.5px solid #14213D; border-radius: 2mm; padding: 3mm 4mm; background: #ffffff; margin: 3mm 0 5mm; }
.entete { display: flex; justify-content: space-between; align-items: baseline; margin-bottom: 4mm; }
.logo { font-family: 'Poppins', sans-serif; font-weight: 700; font-size: 15pt; color: #0B2545; letter-spacing: .5px; }
.logo span { color: #2F8BD6; }
.ref { font-size: 8.5pt; color: #5B6B82; }
"""

def page_html(code: str, titre: str, module: str, corps: str) -> str:
    return f"""<!doctype html><html lang="fr"><head><meta charset="utf-8"><title>{html.escape(titre)}</title><style>{CSS}</style></head>
<body>
<div class="entete"><div class="logo">IDEA<span>FORMA</span></div><div class="ref">Fiche outil {html.escape(code)} · Management &amp; Leadership</div></div>
<h1>{html.escape(titre)}</h1>
<p class="sous">{html.escape(module)} · Gabarit à remplir, à imprimer ou à recopier dans votre carnet de bord.</p>
<div class="bande"></div>
{corps}
</body></html>"""

def imprimer(html_path: Path, pdf_path: Path, code: str):
    script = f"""
import {{ chromium }} from "/opt/node-tools/node_modules/playwright/index.mjs";
const b = await chromium.launch({{ executablePath: "/opt/pw-browsers/chromium" }});
const p = await b.newPage();
await p.goto("file://{html_path}");
await p.pdf({{ path: "{pdf_path}", format: "A4", printBackground: true, displayHeaderFooter: true,
  margin: {{ top: "18mm", bottom: "20mm", left: "16mm", right: "16mm" }},
  headerTemplate: "<div></div>",
  footerTemplate: `<div style="width:100%;font-family:Poppins,Arial,sans-serif;font-size:8px;color:#5B6B82;padding:0 16mm;display:flex;justify-content:space-between;"><span>IDEAFORMA · Organisme de formation certifié Qualiopi · contact@ideaforma.fr · ideaforma.fr</span><span>Fiche {code} · page <span class="pageNumber"></span> / <span class="totalPages"></span></span></div>` }});
await b.close();
"""
    tmp = Path(tempfile.mkdtemp()) / "print.mjs"
    tmp.write_text(script)
    subprocess.run(["node", str(tmp)], check=True)

tmpdir = Path(tempfile.mkdtemp())
for rel, (code, titre, module) in FICHES.items():
    src = base / rel
    if not src.exists():
        print("absent :", rel); continue
    corps = md_vers_html(src.read_text(encoding="utf-8"))
    html_path = tmpdir / (src.stem + ".html")
    html_path.write_text(page_html(code, titre, module, corps), encoding="utf-8")
    pdf_path = sortie / f"IDEAFORMA_ML_fiche_{code.replace('.', '-')}_{re.sub(r'[^a-z0-9]+', '-', unicodedata.normalize('NFKD', titre.lower()).encode('ascii','ignore').decode())[:50].strip('-')}.pdf"
    imprimer(html_path, pdf_path, code)
    print("ok :", pdf_path.name, f"({pdf_path.stat().st_size // 1024} Ko)")
