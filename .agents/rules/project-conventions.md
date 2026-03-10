# Project conventions checklist

Before making substantive documentation or config changes, ensure:

1. **Context:** Read `.agents/analysis/repository_map.json`, `.agents/config/review_cache.json`, `.agents/reports/bugs.md`, and `.agents/reports/refactoring_backlog.md` when relevant (see AGENTS.md).
2. **Verification:** Documentation must match the live applications. When unsure, verify against:
   - AMČR info: https://amcr-info.aiscr.cz/
   - Digital Archive: https://digiarchiv.aiscr.cz/
   - Technical docs: https://aiscr-webamcr.readthedocs.io/
3. **No generated edits:** Do not edit `_site/` or `_freeze/` (see `no-edit-generated.md`).
4. **Branch/PR:** Work on a branch; PR target is always `main`. Use branch names: `docs/<topic>`, `fix/<topic>`, `chore/<topic>`, or `agents/<agent-name>/<topic>`.
5. **Scope:** Prefer small, incremental changes. Record issues in `.agents/reports/bugs.md` or `refactoring_backlog.md` as appropriate.

**Canonical sources:** AGENTS.md, CONTRIBUTING.md.
