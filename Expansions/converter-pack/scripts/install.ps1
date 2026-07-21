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
    @{ id = 'QPDF.QPDF';                      name = 'qpdf' },
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

    # --- Flatten nested layouts -------------------------------------------
    # v1.8.4's whisper-bin-x64.zip is NOT flat: it extracts into a 'Release\'
    # subfolder (bin\Release\main.exe, bin\Release\*.dll). Older archives were
    # flat. Move any nested exe/dll payload up into bin\ so both layouts end up
    # identical -- otherwise the main.exe normalisation below never fires and
    # doctor.ps1 reports whisper missing. (Found live 2026-07-20.)
    foreach ($sub in @('Release', 'bin', 'whisper-bin-x64')) {
        $nested = Join-Path $BinDir $sub
        if (Test-Path $nested) {
            Write-Host "[converter:install]   flattening nested '$sub\' from the archive ..."
            Get-ChildItem -Path $nested -File | ForEach-Object {
                Copy-Item $_.FullName (Join-Path $BinDir $_.Name) -Force
            }
            Remove-Item $nested -Recurse -Force
        }
    }

    # Recent archives ship 'whisper-cli.exe'; older ones 'main.exe'. Normalise.
    if (-not (Test-Path (Join-Path $BinDir 'whisper-cli.exe')) -and `
        (Test-Path (Join-Path $BinDir 'main.exe'))) {
        Copy-Item (Join-Path $BinDir 'main.exe') (Join-Path $BinDir 'whisper-cli.exe')
    }
    if (-not (Test-Path (Join-Path $BinDir 'whisper-cli.exe'))) {
        Write-Host "[converter:install]   warn: no whisper-cli.exe or main.exe found in bin\ after extraction."
        Write-Host "[converter:install]         The archive layout may have changed again - check $BinDir."
    }
    Write-Host "[converter:install] whisper.cpp $WhisperTag installed to bin\."
}

# --- PATH repair for tools winget does NOT put on PATH ---------------------
# Tesseract and qpdf both install to Program Files without touching PATH, so
# Get-Command tesseract / Get-Command qpdf come back empty and doctor.ps1 (and
# ocrmypdf) report them missing even though they are installed. Add their bin
# folders to the USER PATH (persistent) and to this process (so the rest of
# this script and doctor.ps1 can see them immediately). (Found live 2026-07-20.)
function Add-ToUserPath {
    param([string]$Dir, [string]$Label)

    if (-not $Dir -or -not (Test-Path $Dir)) {
        Write-Host "[converter:install]   PATH: $Label not found on disk - skipping."
        return
    }
    $userPath = [Environment]::GetEnvironmentVariable('PATH', 'User')
    if (-not $userPath) { $userPath = '' }
    $entries = $userPath -split ';' | Where-Object { $_ -ne '' }
    if ($entries -contains $Dir) {
        Write-Host "[converter:install]   PATH: $Label already on user PATH."
    } else {
        $newPath = if ($userPath.TrimEnd(';') -eq '') { $Dir } else { $userPath.TrimEnd(';') + ';' + $Dir }
        [Environment]::SetEnvironmentVariable('PATH', $newPath, 'User')
        Write-Host "[converter:install]   PATH: added $Label -> $Dir"
    }
    # Make it visible to this process too (no restart needed for doctor.ps1).
    if (($env:PATH -split ';') -notcontains $Dir) {
        $env:PATH = $env:PATH.TrimEnd(';') + ';' + $Dir
    }
}

# Tesseract: fixed install dir.
$TesseractDir = @(
    "$env:ProgramFiles\Tesseract-OCR",
    "${env:ProgramFiles(x86)}\Tesseract-OCR",
    "$env:LOCALAPPDATA\Programs\Tesseract-OCR"
) | Where-Object { Test-Path (Join-Path $_ 'tesseract.exe') } | Select-Object -First 1
Add-ToUserPath -Dir $TesseractDir -Label 'tesseract'

# qpdf: version-stamped install dir, e.g. "C:\Program Files\qpdf 12.3.2\bin".
# Pick the newest matching folder that actually contains qpdf.exe.
$QpdfDir = Get-ChildItem -Path @("$env:ProgramFiles", "${env:ProgramFiles(x86)}") `
                -Directory -Filter 'qpdf*' -ErrorAction SilentlyContinue |
           Sort-Object Name -Descending |
           ForEach-Object { Join-Path $_.FullName 'bin' } |
           Where-Object { Test-Path (Join-Path $_ 'qpdf.exe') } |
           Select-Object -First 1
Add-ToUserPath -Dir $QpdfDir -Label 'qpdf'

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
