# doctor.ps1 — Voice & File Converter: health check (Windows).
# ---------------------------------------------------------------------------
#   Usage:  doctor.ps1 [-Quiet]
#   Verifies tools + model are present and reports RAM headroom.
#   Exit 0 when core capabilities are usable; non-zero when a core tool is missing.
# ---------------------------------------------------------------------------
param([switch]$Quiet)
$ExpansionDir = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path

function Say($m) { if (-not $Quiet) { Write-Host $m } }

# Selected model from .env
$model = 'small'
$envFile = Join-Path $ExpansionDir '.env'
if (Test-Path $envFile) {
    foreach ($line in Get-Content $envFile) {
        if ($line -match '^\s*CONVERTER_WHISPER_MODEL\s*=\s*(.+?)\s*$') {
            $v = $matches[1].Trim('"'); if ($v) { $model = $v }
        }
    }
}

$fail = 0; $warn = 0
Say "Voice & File Converter - health check"
Say "-------------------------------------"

function Check($label, $tier, $cmd) {
    if (Get-Command $cmd -ErrorAction SilentlyContinue) {
        Say "  OK    $label"
    } elseif ($tier -eq 'core') {
        Say "  MISS  $label - required. Run scripts\install.ps1."
        $script:fail++
    } else {
        Say "  warn  $label - optional, not installed."
        $script:warn++
    }
}

# whisper.cpp (pack-local pinned binary, or on PATH)
$whisper = (Join-Path $ExpansionDir 'bin\whisper-cli.exe')
if ((Test-Path $whisper) -or (Get-Command whisper-cli -ErrorAction SilentlyContinue)) {
    Say "  OK    whisper.cpp (speech-to-text engine)"
} else {
    Say "  MISS  whisper.cpp - required. Run scripts\install.ps1."
    $fail++
}

Check 'ffmpeg (audio/video decode)'      'core'     'ffmpeg'
Check 'yt-dlp (video-link transcripts)'  'core'     'yt-dlp'
Check 'pandoc (document conversion)'     'core'     'pandoc'
Check 'ImageMagick (image/PDF)'          'core'     'magick'
Check 'pdftotext / poppler (PDF text)'   'core'     'pdftotext'
Check 'exiftool (file metadata)'         'core'     'exiftool'
Check 'ocrmypdf (scanned-PDF OCR)'       'core'     'ocrmypdf'
Check 'tesseract (OCR engine)'           'core'     'tesseract'
Check 'trafilatura (web-page text)'      'optional' 'trafilatura'
Check 'qpdf (PDF helper)'                'optional' 'qpdf'
# Ghostscript (AGPL-3.0) — OCRmyPDF's recommended renderer, used only as a
# CLI subprocess. Optional: OCRmyPDF can fall back to a slower renderer.
# The Windows console binary is 'gswin64c'.
Check 'ghostscript (OCR PDF renderer)'   'optional' 'gswin64c'

# Model presence
$modelFile = Join-Path $ExpansionDir "models\ggml-$model.bin"
if ((Test-Path $modelFile) -and (Get-Item $modelFile).Length -gt 0) {
    Say "  OK    speech-to-text model '$model' present"
} else {
    Say "  MISS  speech-to-text model '$model' - run: scripts\fetch-models.ps1 $model"
    $fail++
}

# RAM headroom
$needGb = @{ 'base'=1; 'small'=2; 'medium'=3; 'large-v3-turbo'=4 }[$model]
if (-not $needGb) { $needGb = 2 }
$totalGb = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB)
if ($totalGb -lt ($needGb + 2)) {
    Say "  warn  $totalGb GB RAM - the '$model' model may run slowly here."
    $warn++
} else {
    Say "  OK    $totalGb GB RAM - enough headroom for the '$model' model"
}

Say "-------------------------------------"
if ($fail -gt 0) {
    Say "RESULT: $fail required item(s) missing. Run install.ps1 and fetch-models.ps1."
    exit 1
}
Say "RESULT: all core tools present ($warn optional warning(s)). Converter is ready."
exit 0
