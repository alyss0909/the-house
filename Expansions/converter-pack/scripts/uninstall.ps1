# uninstall.ps1 — Voice & File Converter: clean removal (Windows).
# ---------------------------------------------------------------------------
# Per §12 Q2 (Tom-signed): system tools installed via winget are LEFT IN
# PLACE. This script removes only what is unambiguously this pack's: the
# fetched whisper.cpp binary, the model files, and the scratch cache.
# The Expansion folder + the 5 SOPs are removed by Larry's WS-003 flow.
# ---------------------------------------------------------------------------
$ErrorActionPreference = 'Stop'
$ExpansionDir = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path

Write-Host "[converter:uninstall] Expansion dir: $ExpansionDir"

foreach ($d in @('models', 'cache', 'bin')) {
    $p = Join-Path $ExpansionDir $d
    if (Test-Path $p) {
        Write-Host "[converter:uninstall] Removing $d\ ..."
        Remove-Item $p -Recurse -Force
    }
}

$envFile = Join-Path $ExpansionDir '.env'
if (Test-Path $envFile) {
    Clear-Content $envFile
    Write-Host "[converter:uninstall] Cleared .env"
}

Write-Host ""
Write-Host "[converter:uninstall] Pack-local files removed."
Write-Host "[converter:uninstall] LEFT IN PLACE ON PURPOSE (other apps may use them):"
Write-Host "    ffmpeg, yt-dlp, pandoc, imagemagick, qpdf, poppler, exiftool,"
Write-Host "    tesseract, ghostscript, python/trafilatura/ocrmypdf"
Write-Host "    - installed via winget/pipx. Remove them yourself with"
Write-Host "    'winget uninstall <id>' (or 'pipx uninstall ocrmypdf') only if you"
Write-Host "    are sure nothing else needs them."
