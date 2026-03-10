# .agents/

Složka obsahující konfiguraci, prompty a výstupy pro AI coding agenty.

## Struktura

- **rules/** — Sdílená pravidla pro agenty (zdroj pravdy; viz AGENTS.md)
  - `no-edit-generated.md` — Neupravovat `_site/` ani `_freeze/`
  - `project-conventions.md` — Checklist před úpravami
  - `pre-pr-check.md` — Před PR spustit `quarto render`
  - `subagents.md` — Kdy použít code-reviewer / doc review
- **scripts/** — Pomocné skripty
  - `quarto-render-check.ps1` — Spustí `quarto render` z kořene repo (před PR)
- **prompts/** — Předdefinované prompty a návrhy na jejich vylepšení
  - `review_codebase.md` — Hlavní prompt pro review session
  - `prompt_evolution/` — Návrhy na vylepšení promptu z jednotlivých sessions
- **config/** — Konfigurace a perzistentní stav
  - `review_config.yaml` — Konfigurace review tasků
  - `review_cache.json` — Stav a průběh review sessions
- **analysis/** — Výstupy analýz (generované JSON soubory)
- **reports/** — Review reporty a sledování problémů
  - `review_reports/` — Reporty z jednotlivých tasků
  - `bugs.md` — Evidence nalezených chyb
  - `refactoring_backlog.md` — Backlog vylepšení

## Použití

Viz [AGENTS.md](../AGENTS.md) pro pravidla a konvence.
