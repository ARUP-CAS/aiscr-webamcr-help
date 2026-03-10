# Prompt Evolution

Tato složka eviduje historii vývoje promptů používaných pro AI review sessions.

## Účel

Sledování vývoje systémových promptů umožňuje:

- Reprodukovat výsledky starších review sessions
- Postupně zlepšovat kvalitu review
- Dokumentovat, co fungovalo a co ne

## Konvence pojmenování

```markdown
YYYY-MM-DD-v<verze>-<popis>.md
```

Příklady:

```markdown
2026-03-07-v1.0-initial-bootstrap.md
2026-04-15-v1.1-extended-linkcheck.md
```

## Aktuální verze promptu

Aktuální systémový prompt je vždy v: `.agents/prompts/review_codebase.md`

## Historie verzí

| Verze | Datum | Popis změn |
| ------- | ------- | ----------- |
| v1.0 | 2026-03-07 | Initiální bootstrap — základní review prompt |
