# Documentation Hygiene Audit Report

**Repository:** aiscr-webamcr-help  
**Date:** 2026-03-11  
**Files audited:** 22 (instruction-bearing and config)  
**Implementations applied:** 2026-03-11 (all recommended and optional fixes)

## Summary

| Check | Status | Findings |
|-------|--------|----------|
| C1 File Discovery | OK | 22 files found |
| C2 Audience Mapping | OK | 0 redundant files |
| C3 Duplication | OK | 0 contradictory; some acceptable redundancy |
| C4 Drift | OK | Fixed (branch placeholder unified to `agent-name`) |
| C5 Cross-References | OK | 0 broken refs |
| C6 Token Efficiency | OK | CLAUDE.md trimmed to pointers |
| C7 Governance | OK | Documentation governance subsection added to AGENTS.md |

---

## C1 — File Discovery

| File | Lines | Language | Apparent audience |
|------|-------|----------|-------------------|
| `README.md` | 100 | CS | GitHub visitors, contributors |
| `README_en.md` | 100 | EN | English-speaking visitors |
| `CONTRIBUTING.md` | 111 | CS | Contributors, AI agents |
| `CLAUDE.md` | 41 | EN | Claude Code (auto-injected) |
| `AGENTS.md` | 260 | EN | AI agents (all), human maintainers |
| `CODEOWNERS` | (root) | — | GitHub (code ownership) |
| `.cursor/rules/repo-rules.mdc` | 25 | EN | Cursor AI (alwaysApply) |
| `.cursor/rules/arena-model-sync.mdc` | 20 | EN | Cursor AI (alwaysApply) |
| `.cursor/README.md` | 20 | EN | Developers using Cursor |
| `.agents/README.md` | 23 | CS | Developers, AI agents |
| `.agents/rules/no-edit-generated.md` | 9 | EN | AI agents |
| `.agents/rules/project-conventions.md` | 11 | EN | AI agents |
| `.agents/rules/pre-pr-check.md` | 17 | EN | AI agents |
| `.agents/rules/subagents.md` | 5 | EN | AI agents |
| `.agents/config/review_config.yaml` | 81 | EN/CS | AI review framework |
| `.agents/config/review_cache.json` | (JSON) | — | Tooling / state |
| `.agents/prompts/review_codebase.md` | 254 | EN | AI agents (review session) |
| `.agents/prompts/audit_doc_hygiene.md` | 239 | EN | AI agents (audit prompt) |
| `.agents/prompts/prompt_evolution/README.md` | 22 | CS | Maintainers |
| `.agents/reports/review_reports/README.md` | 30 | CS | Maintainers |
| `.agents/reports/bugs.md` | 27 | CS | AI agents, maintainers |
| `.agents/reports/refactoring_backlog.md` | 39 | CS | AI agents, maintainers |

**Note:** `CODEOWNERS` lives at **repo root** in this project, not under `.github/`. No `.github/PULL_REQUEST_TEMPLATE.md` found.

---

## C2 — Audience & Responsibility

- **README / README_en:** GitHub visitors; project overview, tech stack, structure, link to CONTRIBUTING. Distinct (language).
- **CONTRIBUTING.md:** Human contributors and AI; branch naming, PR process, Quarto/freeze, AI-assisted contributing. Unique.
- **CLAUDE.md:** Claude Code sessions; quick reference, pointers to AGENTS.md and .agents/rules. Unique (explicitly "quick reference only").
- **AGENTS.md:** All AI agents and maintainers; canonical scope, orientation, verification URLs, branch/PR, .agents structure. Unique.
- **.cursor/rules/*:** Cursor IDE only; gotchas and branch workflow; point to .agents/rules. Unique.
- **.agents/rules/*:** Shared agent rules; single source of truth for "do not edit _site/_freeze", pre-PR check, conventions, subagents. Unique.
- **.agents/prompts/*:** Session prompts (review, audit). Unique.
- **.agents/config/*:** Review configuration and session state. Unique.
- **.agents/reports/*:** Bugs, backlog, report placeholders. Unique.

**Result:** No redundant file serving the same audience with the same responsibility.

---

## C3 — Content Duplication

**Topics and locations:**

| Topic | Files | Classification |
|-------|--------|----------------|
| Branch workflow (main, PR to main, branch naming) | CONTRIBUTING, AGENTS.md, repo-rules.mdc, CLAUDE.md | **Acceptable** — CONTRIBUTING canonical for humans; AGENTS/CLAUDE/repo-rules for AI; each points to canonical or .agents. |
| Do not edit _site/_, _freeze/_ | no-edit-generated.md, AGENTS.md (Scope), repo-rules.mdc, CLAUDE.md | **Acceptable** — Rule lives in .agents/rules; others reference it. |
| Pre-PR: quarto render (and --execute if freeze) | pre-pr-check.md, AGENTS.md, CLAUDE.md, CONTRIBUTING | **Acceptable** — Same rule, different audiences; pre-pr-check.md is canonical for the procedure. |
| Key files / repo structure | README, README_en, AGENTS.md, CLAUDE.md, repository_map.json | **Acceptable** — README for visitors; AGENTS/CLAUDE for agents; repository_map for tooling. |
| Verification URLs (amcr-info, digiarchiv, readthedocs) | AGENTS.md, review_codebase.md, project-conventions.md | **Acceptable** — AGENTS and review prompt need them; conventions point to AGENTS. |
| .agents structure / reports (bugs, refactoring_backlog) | AGENTS.md, .agents/README, CLAUDE.md, repo-rules.mdc | **Acceptable** — AGENTS is canonical; others are pointers or summaries. |

**Contradictory duplication:** None found.

**Redundant duplication:** No pair of files that share the same audience and repeat the same rule without cross-referring; pointers are used appropriately.

---

## C4 — Drift

**1. Branch naming placeholder (minor)** — **FIXED**

- **.cursor/rules/repo-rules.mdc**, **AGENTS.md**, **CLAUDE.md**, **.agents/rules/project-conventions.md** now all use `agents/<agent-name>/<topic>` (hyphen) consistently.

**2. CODEOWNERS location**

- **audit_doc_hygiene.md** lists `.github/CODEOWNERS` as a typical candidate.
- This repo uses **root** `CODEOWNERS`. No drift; adaptation table in audit prompt updated to note CODEOWNERS may live at repo root.

**3. repository_map.json vs AGENTS.md**

- **repository_map.json** `external_systems.amcr_app.url`: `https://amcr.aiscr.cz/`.
- **AGENTS.md** "AMČR information site": `https://amcr-info.aiscr.cz/`.
- Different sites (app vs info). No contradiction.

---

## C5 — Cross-Reference Integrity

Verified:

- README / README_en → CONTRIBUTING.md (file exists).
- CLAUDE.md → AGENTS.md, .agents/rules/, repository_map.json, bugs.md, refactoring_backlog.md (all exist).
- AGENTS.md → .agents/ paths, CONTRIBUTING.md (all exist).
- .agents/README → AGENTS.md (exists).
- pre-pr-check.md → CONTRIBUTING.md (exists).
- project-conventions.md → AGENTS.md, CONTRIBUTING.md (exist).
- CONTRIBUTING.md → CODEOWNERS, .agents/prompts/review_codebase.md (exist).
- review_codebase.md → AGENTS.md, review_config.yaml, review_cache.json, bugs.md, refactoring_backlog.md (exist).
- no-edit-generated.md → AGENTS.md (Scope) (exists).

No section-level refs (e.g. "CONTRIBUTING.md §Testing") were found; only file-level refs. **Result:** No broken or stale cross-references.

---

## C6 — Token Efficiency (AI-specific)

**Auto-injected / frequently loaded:** CLAUDE.md, .cursor rules (repo-rules.mdc, arena-model-sync.mdc). AGENTS.md is also loaded for agents.

- **CLAUDE.md** — **UPDATED:** Full "Key files" table and long "Gotchas" list replaced with one-line pointers to AGENTS.md and .agents/rules. "Quick start" and "Context to read when editing" retained. Estimated token savings ~200–400 per session.
- **repo-rules.mdc:** Short; points to AGENTS.md and .agents/. Limited redundancy.
- **arena-model-sync.mdc:** Local Cursor/model sync only; no overlap with AGENTS/CLAUDE.

---

## C7 — Governance Rules Presence

- **Present:** AGENTS.md defines "Resolving Inconsistencies" and **"Documentation governance"** (added 2026-03-11): which file owns what (CONTRIBUTING.md, AGENTS.md, .agents/rules) and that duplication should be avoided in favour of cross-references. .agents/rules are the shared source of truth for agents; repo-rules.mdc points to canonical docs.
- **Result:** OK — explicit documentation governance subsection now in AGENTS.md.

---

## Implementations applied (2026-03-11)

All recommended and optional fixes from this audit were implemented:

1. **Branch placeholder consistency** — Updated `.cursor/rules/repo-rules.mdc`, `AGENTS.md` (AI-Generated Content), `CLAUDE.md`, and `.agents/rules/project-conventions.md` to use `agents/<agent-name>/<topic>` consistently.
2. **Token efficiency** — Trimmed `CLAUDE.md`: replaced full "Key files" table and long "Gotchas" list with one-line pointers to AGENTS.md and .agents/rules; kept "Quick start" and "Context to read when editing."
3. **Explicit documentation governance** — Added "Documentation governance" subsection to `AGENTS.md` (after "Resolving Inconsistencies") stating which file owns what and that duplication should be avoided in favour of cross-references.
4. **CODEOWNERS location** — Added row to adaptation table in `.agents/prompts/audit_doc_hygiene.md`: `CODEOWNERS` may live at repo root instead of `.github/`.
5. **repository_map.json** — Set `last_updated` to `2026-03-11`.

---

## Recommended Fixes (historical; all applied)

### Critical (FAIL)

_None._

### Important (WARN) — all applied

1. **Branch placeholder consistency** — **File:** `.cursor/rules/repo-rules.mdc` (+ AGENTS.md, CLAUDE.md, project-conventions.md) — **Done:** Unified to `agents/<agent-name>/<topic>`.

2. **Token efficiency** — **File:** `CLAUDE.md` — **Done:** Key files and Gotchas replaced with pointers to AGENTS.md and .agents/rules.

3. **Explicit documentation governance** — **File:** `AGENTS.md` — **Done:** Added "Documentation governance" subsection.

### Optional improvements — applied

1. **CODEOWNERS:** Added note in `.agents/prompts/audit_doc_hygiene.md` adaptation table that CODEOWNERS may live at repo root.
2. **repository_map.json:** Updated `last_updated` to 2026-03-11.
