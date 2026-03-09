# Review Reports

Tato složka obsahuje výsledky AI review sessions repozitáře `aiscr-webamcr-help`.

## Konvence pojmenování

```markdown
YYYY-MM-DD-<tema>.md
```

Příklady:

```markdown
2025-10-15-general-review.md
2025-11-02-linkcheck.md
2026-01-20-cicd-review.md
2026-03-07-bootstrap.md
```

## Typy reportů

| Typ | Popis |
| ----- | ------- |
| `general-review` | Komplexní review celého repozitáře |
| `linkcheck` | Kontrola interních a externích odkazů |
| `cicd-review` | Review GitHub Actions workflows |
| `style-review` | Review CSS/SCSS/tématu |
| `content-review` | Review obsahu konkrétní sekce |
| `bootstrap` | Iniciální bootstrap review (první session) |

## Struktura reportu

Každý report by měl obsahovat:

1. **Metadata** — datum, typ, agent, větev
2. **Scope** — co bylo analyzováno
3. **Zjištění** — co bylo nalezeno
4. **Nové bugs** — přidané do `bugs.md`
5. **Nové backlog položky** — přidané do `refactoring_backlog.md`
6. **Stav** — co bylo opraveno v rámci session
