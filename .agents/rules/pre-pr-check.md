# Before opening a PR

When preparing a pull request (or when the user asks to verify the build):

1. **Render the site** from the repo root:
   ```powershell
   quarto render
   ```
   Or use the helper script:
   ```powershell
   .\.agents\scripts\quarto-render-check.ps1
   ```
2. If you changed R code or freeze-related content, run:
   ```powershell
   quarto render --execute
   ```
3. **Inspect** the generated site under `_site/` (e.g. `quarto preview` or open `_site/index.html`) to confirm pages and navigation look correct.
4. Open the PR **to `main`** with a clear description (see CONTRIBUTING.md).

**CI:** The GitHub Actions workflow will run `quarto render` on push to `main`; running locally first avoids failed checks.
