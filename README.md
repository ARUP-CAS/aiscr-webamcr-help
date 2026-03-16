# Uživatelská dokumentace AMČR

[![DOI](https://zenodo.org/badge/610682820.svg)](https://zenodo.org/badge/latestdoi/610682820)
[![License: CC BY-NC 4.0](https://img.shields.io/badge/License-CC%20BY--NC%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-nc/4.0/)

Repozitář obsahuje zdrojové soubory uživatelského manuálu k systému [AMČR](https://amcr-info.aiscr.cz/) (Archeologická mapa České republiky).  
Web je publikován na adrese **[amcr-help.aiscr.cz](https://amcr-help.aiscr.cz/)**.

➡ [ENGLISH VERSION HERE](README_en.md)

---

## O projektu

AMČR je součástí [Archeologického informačního systému ČR (AIS CR)](https://aiscr.cz/), který provozuje [Archeologický ústav AV ČR, Praha, v. v. i. (ARÚP)](https://www.arup.cas.cz/) a [Archeologický ústav AV ČR, Brno, v. v. i. (ARÚB)](https://arub.cz/).

Tento repozitář obsahuje uživatelskou dokumentaci pokrývající:

- **AMČR** — webová aplikace pro správu a prezentaci dat o archeologických výzkumech
- **Digitální archiv AMČR** — archiv digitálních dokumentů a nálezových zpráv
- **Základní informace** — přihlášení, role uživatelů, slovník pojmů
- **Metodiku** — pracovní postupy a odevzdání dokumentů
- **Součásti AIS CR** — přehled komponent systému

Technická dokumentace aplikace AMČR je dostupná na [aiscr-webamcr.readthedocs.io](https://aiscr-webamcr.readthedocs.io/cs/latest/).

---

## Technický stack

| Vrstva | Technologie |
| -------- | ------------- |
| Dokumentační framework | [Quarto](https://quarto.org/) |
| Výpočetní prostředí | R |
| Styling | SCSS, CSS (vlastní téma `theme.scss`, `museo.css`) |
| Quarto extensions | `shafayetShafee/bsicons` |
| Publikace | GitHub Pages (vlastní doména `amcr-help.aiscr.cz`) |
| CI/CD | GitHub Actions |
| Citace | CITATION.cff, Zenodo DOI |

---

## Struktura repozitáře

```markdown
aiscr-webamcr-help/
├── _quarto.yml            # Hlavní konfigurace Quarto projektu
├── index.qmd              # Úvodní stránka
├── 404.qmd                # Stránka pro nenalezené URL
├── soucasti.yml           # Konfigurace součástí AIS CR
├── references.bib         # Bibliografické reference
├── theme.scss             # Vlastní téma Bootstrap/Quarto
├── museo.css              # Font Museo
├── styles.css             # Globální styly
├── tiles.ejs              # EJS šablona pro dlaždice
│
├── about/                 # Stránky "O dokumentaci"
├── amcr/                  # Dokumentace webové aplikace AMČR
├── digiarchiv/            # Dokumentace Digitálního archivu
├── figs/                  # Obrázky a screenshoty
├── fonts/                 # Vlastní fonty
├── links/                 # Sdílené odkazy
├── metodika/              # Metodické příručky
├── o-systemu/             # Popis AIS CR a jeho součástí
├── slovnik/               # Slovník pojmů
├── zakladni-info/         # Základní informace pro uživatele
├── zpravodaj/             # Zpravodaj / changelog dokumentace
│
├── _extensions/           # Quarto extensions
├── _freeze/               # Freeze soubory (reproducibilita výpočtů)
├── .github/               # GitHub Actions workflows
│
├── CITATION.cff           # Citační metadata
├── DESCRIPTION            # R package description (pro renv)
├── CODEOWNERS             # Vlastníci kódu
├── AGENTS.md              # Pokyny pro AI agenty
└── .agents/           # AI review infrastruktura
```

---

## Lokální spuštění

### Předpoklady

- [Quarto CLI](https://quarto.org/docs/get-started/) ≥ 1.4
- [R](https://www.r-project.org/) ≥ 4.3
- Doporučeno: [RStudio](https://posit.co/downloads/) nebo VS Code s rozšířením Quarto

### Instalace R závislostí

```r
# Pokud je projekt konfigurován s renv:
renv::restore()
```

### Náhled dokumentace

```bash
quarto preview
```

### Sestavení (render)

```bash
quarto render
```

Výstup je generován do složky `_site/`.

---

## Přispívání

Viz [CONTRIBUTING.md](CONTRIBUTING.md).

---

## Citace

Pokud tuto dokumentaci citujete, použijte prosím metadata v souboru [CITATION.cff](CITATION.cff) nebo citaci z [Zenodo](https://zenodo.org/badge/latestdoi/610682820).

---

## Licence

Obsah repozitáře podléhá licenci [Creative Commons Attribution-NonCommercial 4.0 International](http://creativecommons.org/licenses/by-nc/4.0/).

[![CC BY-NC 4.0](https://licensebuttons.net/l/by-nc/4.0/88x31.png)](http://creativecommons.org/licenses/by-nc/4.0/)

---

## Kontakt

- **Archeologický ústav AV ČR, Praha, v. v. i.**  
  [www.arup.cas.cz](https://www.arup.cas.cz/)
- **Archeologický ústav AV ČR, Brno, v. v. i.**  
  [www.arub.cz](https://www.arub.cz/)
- Podpora: prostřednictvím [GitHub Issues](https://github.com/ARUP-CAS/aiscr-webamcr-help/issues)
