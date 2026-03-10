# When to use subagents

For this documentation repo, use subagents (e.g. code-reviewer, document/code-explorer) in these situations:

- **Large or structural changes** (many `.qmd` files, `_quarto.yml` sidebar/nav, new sections): Use a **code-reviewer**-style pass to review structure, cross-references, and YAML in parallel before the user opens a PR.
- **Content vs live app** (updating procedures, terminology, or screenshots): Consider a pass to compare docs to live apps (amcr-info.aiscr.cz, digiarchiv.aiscr.cz) and suggest updates; record discrepancies in `.agents/reports/bugs.md` or refactoring backlog.

Invoke subagents via the appropriate IDE command or task flow when the user requests a review or when the change set is large enough to benefit from a dedicated pass.
