# CLAUDE.md — Project context for Claude Code

This repo is a **static documentation site** (Quarto + R) for AMČR user help, published at https://amcr-help.aiscr.cz/. No backend or app code — content is in `.qmd` files; styling in `theme.scss`, `styles.css`, `museo.css`.

**Canonical agent rules:** Read **AGENTS.md** and **.agents/rules/** before substantive edits. This file gives quick reference only.

---

## Quick start

```bash
# R deps (if using renv)
# R: renv::restore()

# Preview (live reload)
quarto preview

# Full build → output in _site/
quarto render

# After changing R code or freeze: re-execute and update _freeze/
quarto render --execute
```

**Pre-PR check:** Run `quarto render` (or `.\.agents\scripts\quarto-render-check.ps1` on Windows). If R/freeze changed, run `quarto render --execute`.

---

## Key files

See **AGENTS.md** → Key Files for the full table. Content dirs: `amcr/`, `digiarchiv/`, `metodika/`, `slovnik/`, `zakladni-info/`, `o-systemu/`, `about/`, `zpravodaj/`, `links/`. Images in `figs/`; do not auto-edit `figs/` or `fonts/`.

---

## Gotchas

See **AGENTS.md** (Scope, Branch and PR Rules) and **.agents/rules/no-edit-generated.md**. In short: do not edit `_site/` or `_freeze/`; verify docs against live apps (amcr-info.aiscr.cz, digiarchiv.aiscr.cz); branch naming `docs/<topic>`, `fix/<topic>`, `chore/<topic>`, or `agents/<agent-name>/<topic>`; AI output under `.agents/`; run `quarto render` (and `--execute` if R/freeze changed) before PR.

---

## Context to read when editing

- **First:** `.agents/analysis/repository_map.json`, `.agents/reports/bugs.md`, `.agents/reports/refactoring_backlog.md` (see AGENTS.md).
- **Rules:** `.agents/rules/no-edit-generated.md`, `project-conventions.md`, `pre-pr-check.md`, `subagents.md`.

For full orientation, verification URLs, scope, and branch rules, see **AGENTS.md** and **CONTRIBUTING.md**.

---

**Tip:** Use `.claude.local.md` for personal/local overrides (e.g. add to `.gitignore`). Press `#` during a session to have Claude suggest updates to this file.
