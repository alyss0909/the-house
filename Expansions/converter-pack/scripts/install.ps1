# install.ps1 — Voice & File Converter: fetch the free, open-source tools (Windows).
# ---------------------------------------------------------------------------
# HARD RULES (handoff §8):
#   - NO binaries bundled. Tools are fetched at install time.
#   - winget is the package manager. If winget is missing, this script STOPS
#     and points the user to the Microsoft Store "App Installer" — it never
#     bootstraps a package manager itself.
#   - whisper.cpp is fetched as a PINNED prebuilt release (v1.8.4) — never
#     "latest" — so every Windows install is reproducible (§12 Q7).
#   - Idempotent: a tool already present is left alone.
# ---------------------------------------------------------------------------
$ErrorActionPreference = 'Stop'

$ExpansionDir = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
Write-Host "[converter:install] Expansion dir: $ExpansionDir"

# --- Package manager check -------------------------------------------------
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host ""
    Write-Host "[converter:install] STOP - winget (Windows Package Manager) was not found."
    Write-Host ""
    Write-Host "  This installer does not install winget for you. Get it from the"
    Write-Host "  Microsoft Store - it is a free Microsoft app called 'App Installer':"
    Write-Host ""
    Write-Host "    https://apps.microsoft.com/detail/9NBLGGH4NNS1"
    Write-Host ""
    Write-Host "  Install it, then re-run this script:"
    Write-Host "    powershell -ExecutionPolicy Bypass -File Expansions\converter-pack\scripts\install.ps1"
    Write-Host ""
    exit 2
}

Write-Host "[converter:install] Using winget."

# --- winget tool set -------------------------------------------------------
# id ............................. friendly
# NOTE: ArtifexSoftware.GhostScript is AGPL-3.0. The pack ships NO Ghostscript
# binary — winget fetches it, and it is used ONLY as a local CLI subprocess
# OCRmyPDF spawns. See README "Open-source tools & licenses".
$pkgs = @(
    @{ id = 'Gyan.FFmpeg';                    name = 'ffmpeg' },
    @{ id = 'yt-dlp.yt-dlp';                  name = 'yt-dlp' },
    @{ id = 'JohnMacFarlane.Pandoc';          name = 'pandoc' },
    @{ id = 'ImageMagick.ImageMagick';        name = 'imagemagick' },
    @{ id = 'qpdf.qpdf';                      name = 'qpdf' },
    @{ id = 'oschwartz10612.Poppler';         name = 'poppler' },
    @{ id = 'OliverBetz.ExifTool';            name = 'exiftool (file metadata)' },
    @{ id = 'UB-Mannheim.TesseractOCR';       name = 'tesseract (OCR engine)' },
    @{ id = 'ArtifexSoftware.GhostScript';    name = 'ghostscript (OCR dependency — AGPL-3.0)' },
    @{ id = 'Python.Python.3.12';             name = 'python (for trafilatura + ocrmypdf)' }
)

foreach ($p in $pkgs) {
    $installed = winget list --id $p.id -e 2>$null | Select-String $p.id
    if ($installed) {
        Write-Host "[converter:install]   $($p.name) - already installed, skipping."
    } else {
        Write-Host "[converter:install]   installing $($p.name) ..."
        winget install --id $p.id -e --accept-source-agreements --accept-package-agreements
    }
}

# trafilatura + ocrmypdf via pipx (isolated; no system-Python pollution).
# trafilatura -> web-page extraction; ocrmypdf -> scanned-PDF OCR (it drives
# the winget-installed Tesseract + Ghostscript as separate subprocesses).
Write-Host "[converter:install]   installing trafilatura + ocrmypdf (via pipx) ..."
try {
    python -m pip install --user --upgrade pipx | Out-Null
    python -m pipx ensurepath | Out-Null
    python -m pipx install trafilatura | Out-Null
    Write-Host "[converter:install]   trafilatura installed."
} catch {
    Write-Host "[converter:install]   warn: could not install trafilatura via pipx."
    Write-Host "[converter:install]         Web-page extraction will fall back to pandoc."
}
try {
    python -m pipx install ocrmypdf | Out-Null
    Write-Host "[converter:install]   ocrmypdf installed."
} catch {
    Write-Host "[converter:install]   warn: could not install ocrmypdf via pipx."
    Write-Host "[converter:install]         Scanned-PDF OCR will be unavailable until this is fixed."
}

# --- whisper.cpp — PINNED prebuilt release (§12 Q7) ------------------------
$WhisperTag  = 'v1.8.4'
$WhisperZip  = 'whisper-bin-x64.zip'
$WhisperUrl  = "https://github.com/ggml-org/whisper.cpp/releases/download/$WhisperTag/$WhisperZip"
$BinDir      = Join-Path $ExpansionDir 'bin'

if (Test-Path (Join-Path $BinDir 'whisper-cli.exe')) {
    Write-Host "[converter:install] whisper.cpp already present in bin/ - skipping."
} else {
    Write-Host "[converter:install] Fetching whisper.cpp $WhisperTag (pinned) ..."
    New-Item -ItemType Directory -Force -Path $BinDir | Out-Null
    $tmpZip = Join-Path $env:TEMP $WhisperZip
    Invoke-WebRequest -Uri $WhisperUrl -OutFile $tmpZip
    Expand-Archive -Path $tmpZip -DestinationPath $BinDir -Force
    Remove-Item $tmpZip -Force
    # Recent archives ship 'whisper-cli.exe'; older ones 'main.exe'. Normalise.
    if (-not (Test-Path (Join-Path $BinDir 'whisper-cli.exe')) -and `
        (Test-Path (Join-Path $BinDir 'main.exe'))) {
        Copy-Item (Join-Path $BinDir 'main.exe') (Join-Path $BinDir 'whisper-cli.exe')
    }
    Write-Host "[converter:install] whisper.cpp $WhisperTag installed to bin\."
}

# --- Scratch dirs + .env ---------------------------------------------------
New-Item -ItemType Directory -Force -Path (Join-Path $ExpansionDir 'cache')  | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $ExpansionDir 'models') | Out-Null
$envFile = Join-Path $ExpansionDir '.env'
if (-not (Test-Path $envFile)) {
    Copy-Item (Join-Path $ExpansionDir '.env.example') $envFile
    Write-Host "[converter:install] Created .env from .env.example (optional tuning only)."
}

Write-Host ""
Write-Host "[converter:install] Tool install step complete."
Write-Host "[converter:install] Next:"
Write-Host "  1. Download the speech-to-text model:"
Write-Host "       powershell -ExecutionPolicy Bypass -File Expansions\converter-pack\scripts\fetch-models.ps1 small"
Write-Host "  2. Verify everything:"
Write-Host "       powershell -ExecutionPolicy Bypass -File Expansions\converter-pack\scripts\doctor.ps1"
