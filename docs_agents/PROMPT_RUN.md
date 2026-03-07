# PROMPT_RUN.md — How to Run an AI Review Session

Step-by-step instructions for AI-assisted review of `aiscr-webamcr-help`.

---

## Prerequisites

- AI agent tool (Claude Code, GitHub Copilot, Cursor, etc.)
- Repository cloned at current `main`
- `AGENTS.md` read in full
- Internet access — required for verifying live documentation sites

---

## ⚠️ Step 0 — Verify Live Application State (MANDATORY, run before anything else)

Before loading any repository files, check that all documented systems are reachable.  
Log any failures in `docs_agents/bugs.md`.

```bash
# 1. Primary documentation reference site
curl -s -o /dev/null -w "amcr-info.aiscr.cz: %{http_code}\n" 'https://amcr-info.aiscr.cz/'
# Expected: 200

# 2. AIS CR main site
curl -s -o /dev/null -w "www.aiscr.cz: %{http_code}\n" 'https://www.aiscr.cz/'
# Expected: 200

# 3. Digital Archive (context for digiarchiv/ section)
curl -s -o /dev/null -w "digiarchiv.aiscr.cz: %{http_code}\n" 'https://digiarchiv.aiscr.cz/'
# Expected: 200

# 4. AMCR API (context for api-related content)
curl -s -o /dev/null -w "api.aiscr.cz: %{http_code}\n" 'https://api.aiscr.cz/'
# Expected: 200
```

If a site returns non-200, note it in the session report — documentation sections
referencing that site may contain stale links or descriptions.

---

## Step 1 — Load Context Files

```plain
AGENTS.md
docs_agents/PROMPT.md
docs_agents/review_config.yaml
docs_agents/repository_map.json
docs_agents/review_cache.json
docs_agents/bugs.md
docs_agents/refactoring_backlog.md
```

---

## Step 2 — Set System Prompt

Use the content of `docs_agents/PROMPT.md` as the system prompt.

---

## Step 3 — Run the Review

**General review:**

```markdown
Review the current state of the aiscr-webamcr-help repository.

Step 0 verification results:
[paste output from Step 0 here]

Focus on:
1. _quarto.yml — navigation structure, section coverage
2. Content sections — completeness, consistency with live amcr-info.aiscr.cz
3. Internal links — broken or stale references
4. CSS/SCSS — styling consistency
5. GitHub Actions workflows

Write to docs_agents/review_reports/YYYY-MM-DD-general-review.md
```

**Content accuracy review:**

```markdown
Perform a content accuracy review for aiscr-webamcr-help.

Step 0 results:
[paste here]

Tasks:
1. Compare section content against current state of https://amcr-info.aiscr.cz/
2. Verify terminology against aiscr-webamcr source (Django models, templates)
3. Check workflow descriptions match current UI behaviour
4. Flag screenshots or steps that appear outdated

Log findings in docs_agents/bugs.md with severity and affected file.
```

---

## Step 4 — Incremental Sessions

```markdown
Continue review from the previous session.
Last report: docs_agents/review_reports/<date-of-last-report>.md
Current bugs: docs_agents/bugs.md

Step 0 verification (today):
[paste current output]
```

---

## Session Types

| Type | Focus | Trigger |
| ------ | ------- | --------- |
| `bootstrap` | Initial framework bootstrap | First session |
| `general-review` | Full repository — structure, content, links | After each release |
| `content-accuracy` | Content vs. live amcr-info.aiscr.cz | After AMČR application updates |
| `terminology-review` | Terminology vs. aiscr-webamcr source | After major app changes |
| `linkcheck` | Broken internal and external links | Monthly |
| `cicd-review` | GitHub Actions workflows | When CI changes |

---

## Output Files

| File | Content |
| ------ | --------- |
| `review_reports/YYYY-MM-DD-<tema>.md` | Detailed report incl. Step 0 output |
| `bugs.md` | New or closed bugs |
| `refactoring_backlog.md` | New improvement suggestions |
| `review_cache.json` | Session state, last reviewed sections |
