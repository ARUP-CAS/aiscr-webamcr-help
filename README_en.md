# AMČR User Documentation

[![DOI](https://zenodo.org/badge/610682820.svg)](https://zenodo.org/badge/latestdoi/610682820)
[![License: CC BY-NC 4.0](https://img.shields.io/badge/License-CC%20BY--NC%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-nc/4.0/)

This repository contains the source files for the user manual of [AMČR](https://amcr-info.aiscr.cz/) (Archaeological Map of the Czech Republic).  
The documentation is published at **[amcr-help.aiscr.cz](https://amcr-help.aiscr.cz/)**.

Czech version: see [README.md](README.md)

---

## About

AMČR is part of the [Archaeological Information System of the Czech Republic (AIS CR)](https://aiscr.cz/), operated jointly by the [Institute of Archaeology of the Czech Academy of Sciences, Prague (ARÚP)](https://www.arup.cas.cz/) and [Institute of Archaeology of the Czech Academy of Sciences, Brno (ARÚB)](https://arub.cz/).

This repository contains user-facing documentation covering:

- **AMČR** — web application for managing and presenting archaeological fieldwork data
- **Digital Archive of AMČR** — archive of digital documents and excavation reports
- **Basic information** — login, user roles, glossary of terms
- **Methodology** — workflows and document submission procedures
- **AIS CR components** — overview of the system's components

Technical documentation for the AMČR application is available at [aiscr-webamcr.readthedocs.io](https://aiscr-webamcr.readthedocs.io/cs/latest/).

---

## Technical Stack

| Layer | Technology |
| ------- | ------------ |
| Documentation framework | [Quarto](https://quarto.org/) |
| Computational environment | R |
| Styling | SCSS, CSS (custom theme `theme.scss`, `museo.css`) |
| Quarto extensions | `shafayetShafee/bsicons` |
| Publishing | GitHub Pages (custom domain `amcr-help.aiscr.cz`) |
| CI/CD | GitHub Actions |
| Citation | CITATION.cff, Zenodo DOI |

---

## Repository Structure

```markdown
aiscr-webamcr-help/
├── _quarto.yml            # Main Quarto project configuration
├── index.qmd              # Home page
├── 404.qmd                # 404 not found page
├── soucasti.yml           # AIS CR components configuration
├── references.bib         # Bibliographic references
├── theme.scss             # Custom Bootstrap/Quarto theme
├── museo.css              # Museo font
├── styles.css             # Global styles
├── tiles.ejs              # EJS template for tiles
│
├── about/                 # About the documentation
├── amcr/                  # AMČR web application documentation
├── digiarchiv/            # Digital Archive documentation
├── figs/                  # Figures and screenshots
├── fonts/                 # Custom fonts
├── links/                 # Shared link references
├── metodika/              # Methodological guides
├── o-systemu/             # AIS CR system overview
├── slovnik/               # Glossary
├── zakladni-info/         # Basic user information
├── zpravodaj/             # Documentation changelog / newsletter
│
├── _extensions/           # Quarto extensions
├── _freeze/               # Freeze files (reproducibility)
├── .github/               # GitHub Actions workflows
│
├── CITATION.cff           # Citation metadata
├── DESCRIPTION            # R package description (for renv)
├── CODEOWNERS             # Code ownership
├── AGENTS.md              # Instructions for AI agents
└── docs_agents/           # AI review infrastructure
```

---

## Local Development

### Prerequisites

- [Quarto CLI](https://quarto.org/docs/get-started/) ≥ 1.4
- [R](https://www.r-project.org/) ≥ 4.3
- Recommended: [RStudio](https://posit.co/downloads/) or VS Code with the Quarto extension

### Install R Dependencies

```r
# If the project uses renv:
renv::restore()
```

### Preview

```bash
quarto preview
```

### Build (render)

```bash
quarto render
```

Output is generated into the `_site/` directory.

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

---

## Citation

If you use or reference this documentation, please use the metadata in [CITATION.cff](CITATION.cff) or cite via [Zenodo](https://zenodo.org/badge/latestdoi/610682820).

---

## Licence

Content in this repository is licenced under [Creative Commons Attribution-NonCommercial 4.0 International](http://creativecommons.org/licenses/by-nc/4.0/).

[![CC BY-NC 4.0](https://licensebuttons.net/l/by-nc/4.0/88x31.png)](http://creativecommons.org/licenses/by-nc/4.0/)

---

## Contact

- **Institute of Archaeology of the Czech Academy of Sciences, Prague**  
  [www.arup.cas.cz](https://www.arup.cas.cz/)
- **Institute of Archaeology of the Czech Academy of Sciences, Brno**  
  [www.arub.cz](https://www.arub.cz/)
- Support: via [GitHub Issues](https://github.com/ARUP-CAS/aiscr-webamcr-help/issues)
