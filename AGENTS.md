# AGENTS.md — Instructions for AI Agents

This file defines the rules, scope and workflows for AI agents (Claude Code, GitHub Copilot, Cursor, etc.) working in this repository.

Rules in this file apply to the entire repository.  
A nested `AGENTS.md` in a subdirectory takes precedence for that subtree.

---

## Repository Overview

**Repository:** `ARUP-CAS/aiscr-webamcr-help`  
**Type:** Static documentation site (Quarto / R)  
**Published at:** https://amcr-help.aiscr.cz/  
**Content licence:** CC-BY-NC-4.0  
**Version:** v1.1.0 (September 2025)

This repository contains the user documentation for the AMČR system  
(Archaeological Map of the Czech Republic), part of AIS CR.

It is a **static documentation project** — it contains no backend application code.

---

## Repository Orientation (Mandatory First Step)

Before starting any work, agents **must gather repository context**.

Always read the following files first:

| File | Purpose |
| ----- | ----- |
| `docs_agents/repository_map.json` | Repository structure overview |
| `docs_agents/review_cache.json` | State of previous AI review sessions |
| `docs_agents/bugs.md` | Known problems |
| `docs_agents/refactoring_backlog.md` | Proposed improvements |

These files contain context accumulated across previous sessions.  
Reading them prevents duplicated work and helps maintain continuity between review sessions.

For technical review sessions also read:

```markdown
docs_agents/PROMPT.md
```

---

## AI-Generated Content

All artefacts produced by AI agents belong in the `docs_agents/` directory.

Examples include:

- audit reports
- analysis JSON files
- review state updates
- prompt evolution notes

Agent work should be committed to a dedicated branch:

```markdown
agents/<agent_name>/<topic>
```

Examples:

```markdown
agents/claude/review-content-structure
agents/copilot/fix-broken-links
```

These branches must always target **`main`**.

AI-generated artefacts must remain clearly separated from documentation content.

---

## Goal

Keep changes **small, safe and easy to review**, in line with:

- `CONTRIBUTING.md`
- CI workflows
- Quarto documentation structure

Agents must avoid large unrelated refactors.

---

## Agent Behaviour

Agents must follow these behavioural rules:

1. **Always gather context first** (see Repository Orientation).
2. **Do not repeat work** already recorded in `docs_agents/`.
3. Prefer **small incremental changes** over large edits.
4. When identifying issues, record them in:
   - `docs_agents/bugs.md`
   - `docs_agents/refactoring_backlog.md`
5. If new insights about agent workflows arise, suggest updates to this file.

---

## ⚠️ Critical Requirement: Work Against the Documented Live Applications

This repository documents **real, live applications**.

Documentation changes must always be verified against the current  
state of the documented systems.

Never assume the repository content reflects the current application state.

---

## Mandatory Context Sources

Before editing documentation, agents must verify information using  
the following sources.

### Live Websites

| Source | URL | Purpose |
| ------ | ------ | ------ |
| AMČR information site | https://amcr-info.aiscr.cz/ | Feature descriptions, terminology |
| AIS CR main site | https://www.aiscr.cz/ | System overview |
| Digital Archive AMČR | https://digiarchiv.aiscr.cz/ | Archive UI and behaviour |
| AMČR API | https://api.aiscr.cz/ | API structure |

---

### Source Code Repositories

| Repository | URL |
| ------ | ------ |
| AMČR main application | https://github.com/ARUP-CAS/aiscr-webamcr |
| Digital Archive | https://github.com/ARUP-CAS/aiscr-digiarchiv-2 |
| AMČR info site | https://github.com/ARUP-CAS/aiscr-amcr-home |
| AIS CR main site | https://github.com/ARUP-CAS/aiscr-home |
| AMČR API site | https://github.com/ARUP-CAS/aiscr-api-home |

Source code is authoritative for:

- module names
- entity naming
- workflow behaviour

---

### Technical Documentation

| Source | URL |
| ------ | ------ |
| AMČR technical documentation | https://aiscr-webamcr.readthedocs.io/ |

This documentation is authoritative for:

- architecture
- configuration
- system behaviour
- data models

---

## Why Verification Is Critical

Documentation must describe **how the system actually works today**.

Screenshots, terminology and workflows may change over time.

Incorrect documentation can mislead users and create operational problems,  
because AMČR has methodological and legal implications for archaeologists.

---

## Specific Instructions

Before editing documentation:

1. Verify the workflow in the **live application**.
2. Verify terminology against **AMČR UI and amcr-info.aiscr.cz**.
3. When unsure, verify in **source code**.
4. Record discrepancies in:

```markdown
docs_agents/bugs.md
```

---

## Scope

### In Scope

- `.qmd` documentation pages
- `_quarto.yml`
- `soucasti.yml`
- CSS/SCSS themes
- GitHub workflows
- Quarto extensions
- bibliographic references

---

### Out of Scope

Do not edit:

```markdown
_freeze/
_site/
```

These directories contain generated artefacts.

Binary files in:

```markdown
figs/
fonts/
```

should not be modified automatically.

---

## Tech Stack

This repository contains:

- Quarto documentation
- R runtime for some documents
- SCSS/CSS themes
- GitHub Actions CI
- GitHub Pages hosting

It does **not** contain:

- backend code
- databases
- Docker infrastructure
- APIs

---

## Branch and PR Rules

This repository uses a **single-branch workflow**.

Rules:

- All work targets **`main`**
- Never push directly to `main`
- Always open a Pull Request

Branch naming:

```markdown
agents/<agent-name>/<topic>
docs/<topic>
fix/<topic>
chore/<topic>
```

Changes to `docs_agents/` always require **human review**.

---

## docs_agents Structure

```markdown
docs_agents/
├── PROMPT.md
├── PROMPT_RUN.md
├── review_config.yaml
├── repository_map.json
├── dependency_graph.json
├── review_cache.json
├── bugs.md
├── refactoring_backlog.md
├── cicd_analysis.json
├── frontend_analysis.json
├── review_reports/
└── prompt_evolution/
```

For this documentation repository only:

- `cicd_analysis.json`
- `frontend_analysis.json`

are typically relevant.

---

## Key Files

| File | Purpose |
| ----- | ----- |
| `_quarto.yml` | Main Quarto configuration |
| `soucasti.yml` | AIS CR component list |
| `index.qmd` | Landing page |
| `theme.scss` | Custom theme |
| `tiles.ejs` | Landing page tiles |
| `references.bib` | Citations |
| `CITATION.cff` | Citation metadata |
| `DESCRIPTION` | R metadata |

---

## Repository Context in AIS CR

| Repository | Purpose |
| ------ | ------ |
| aiscr-webamcr | Main AMČR application |
| aiscr-digiarchiv-2 | Digital Archive |
| aiscr-webamcr-help | User documentation |
| aiscr-api-home | API documentation |
| aiscr-home | AIS CR main website |
