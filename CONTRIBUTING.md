# Přispívání do repozitáře

Děkujeme za zájem o přispění do uživatelské dokumentace AMČR.  
Níže jsou popsány pracovní postupy pro přispěvatele.

---

## Větve (branches)

| Větev | Účel |
| ------ | ------ |
| `main` | Hlavní větev repozitáře — obsahuje aktuální stav dokumentace |

> **Důležité:** Pull requesty se otevírají **do `main`**.

---

## Konvence pojmenování větví

```markdown
<typ>/<popis-v-kebab-case>
```

Příklady:

```markdown
docs/aktualizace-navodu-amcr
fix/oprava-odkazu-digiarchiv
chore/aktualizace-quarto-verze
agents/claude/review-content-structure
agents/copilot/fix-broken-links
```

### Větve pro AI agenty

AI-generované větve musí dodržovat konvenci:

```markdown
agents/<jmeno-agenta>/<tema>
```

Příklady:

```markdown
agents/claude/review-content-structure
agents/copilot/update-glossary
agents/claude-code/cicd-analysis
```

Větve agentů vždy cílí na `main`.

---

## Typy příspěvků

```markdown
docs:    Nový nebo aktualizovaný obsah dokumentace
fix:     Oprava chyby (rozbité odkazy, překlepy, nesprávné informace)
style:   Změny stylů (CSS/SCSS), bez změn obsahu
chore:   Údržba projektu (aktualizace Quarto, závislostí, CI)
ci:      Změny GitHub Actions workflows
```

---

## Pull Request proces

1. **Vytvořte větev z `main`**
2. **Proveďte změny** v `.qmd` souborech nebo konfiguračních souborech
3. **Lokálně sestavte** dokumentaci:

    ```bash
    quarto render
    ```

4. **Zkontrolujte výstup** v `_site/` — ověřte, že se stránky správně generují
5. **Otevřete PR do `main`** s popisem změn
6. **Počkejte na review** od vlastníků (viz `CODEOWNERS`)
7. Po schválení bude PR mergován

### Co kontrolovat před odesláním PR

- [ ] `quarto render` proběhne bez chyb
- [ ] Všechny nové obrázky jsou uloženy do `figs/`
- [ ] Nové stránky jsou zahrnuty v `_quarto.yml` (navigace / kapitoly)
- [ ] Opravené nebo nové přesměrování odpovídá skutečné URL struktuře
- [ ] Commit messages dodržují konvenci

---

## Commit messages

Formát:

```markdown
<typ>: <stručný popis v češtině nebo angličtině>
```

Příklady:

```markdown
docs: aktualizace návodu pro odevzdání NÁLEZOVÉ ZPRÁVY
fix: oprava rozbité reference na stránce digiarchiv
chore: upgrade Quarto extensions
ci: přidat krok pro kontrolu odkazů
```

---

## Quarto specifika

### Freeze

Repozitář používá `_freeze/` pro reprodukovatelnost R výpočtů.  
Freeze soubory jsou verzovány v Gitu — při změně výpočetního kódu spusťte:

```bash
quarto render --execute
```

### Extensions

Quarto extensions jsou uloženy v `_extensions/`.  
Pro aktualizaci extensions použijte:

```bash
quarto add shafayetShafee/bsicons
```

---

## AI-asistované přispívání

Větve vytvořené AI agenty (Claude Code, GitHub Copilot apod.) musí:

1. Dodržovat konvenci pojmenování `agents/<jmeno-agenta>/<tema>`
2. Cílit na větev `main`
3. Obsahovat v popisu PR jasné označení, že jde o AI-generovaný obsah
4. Projít standardním code review procesem — změny v `docs_agents/` vyžadují **lidský review**

### Jak spustit review session

Otevřete nový kontext AI agenta a jako první zprávu vložte:

```
Přečti docs_agents/PROMPT.md a spusť review session.
```

Agent si načte `AGENTS.md`, kontext z `docs_agents/` a zahájí session dle instrukcí
v `docs_agents/PROMPT.md`. Typy sezení (general-review, content-accuracy,
terminology-review aj.) jsou popsány tamtéž.

---

## Hlášení problémů

Chyby a návrhy na zlepšení hlašte prostřednictvím  
https://github.com/ARUP-CAS/aiscr-webamcr-help/issues

U issues prosím uveďte:

- URL stránky, které se problém týká
- Popis problému nebo návrhu
- Případně screenshot
