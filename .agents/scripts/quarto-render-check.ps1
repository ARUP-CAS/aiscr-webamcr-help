# Pre-PR Quarto render check for aiscr-webamcr-help
# Run from repo root: .\.agents\scripts\quarto-render-check.ps1
# Requires: Quarto CLI (quarto render), optionally R for executed chunks

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
Set-Location $root

Write-Host "Running Quarto render (no execute)..." -ForegroundColor Cyan
& quarto render 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "Quarto render failed. Fix errors before opening a PR." -ForegroundColor Red
    exit $LASTEXITCODE
}

Write-Host "Quarto render succeeded. Check _site/ locally if needed, then open a PR to main." -ForegroundColor Green
exit 0
