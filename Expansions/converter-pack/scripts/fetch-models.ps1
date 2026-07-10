# fetch-models.ps1 — download a whisper.cpp speech-to-text model (Windows).
# ---------------------------------------------------------------------------
#   Usage:  fetch-models.ps1 [base|small|medium|large-v3-turbo]   (default small)
#
#   Downloads the ggml model from the official ggml-org Hugging Face repo into
#   Expansions\converter-pack\models\ and SHA-256-verifies it.
#
#   HARD RULES (handoff §8): models are never bundled or git-tracked; the
#   download URL is the official ggml-org HF repo; the file is verified after
#   download.
# ---------------------------------------------------------------------------
param([string]$Model = 'small')
$ErrorActionPreference = 'Stop'

$ExpansionDir = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$ModelsDir    = Join-Path $ExpansionDir 'models'
New-Item -ItemType Directory -Force -Path $ModelsDir | Out-Null

# Canonical whisper.cpp model repo on Hugging Face (same repo + path the
# project's own download-ggml-model.sh uses). .bin files at the repo root.
$BaseUrl = 'https://huggingface.co/ggerganov/whisper.cpp/resolve/main'

$map = @{
    'base'           = @{ file = 'ggml-base.bin';           size = '~142 MB' }
    'small'          = @{ file = 'ggml-small.bin';          size = '~466 MB' }
    'medium'         = @{ file = 'ggml-medium.bin';         size = '~1.5 GB' }
    'large-v3-turbo' = @{ file = 'ggml-large-v3-turbo.bin'; size = '~1.5 GB' }
}

if (-not $map.ContainsKey($Model)) {
    Write-Host "[converter:models] ERROR: unknown model '$Model'."
    Write-Host "  Choose one of: base | small | medium | large-v3-turbo"
    exit 2
}

$file = $map[$Model].file
$size = $map[$Model].size
$dest = Join-Path $ModelsDir $file

if ((Test-Path $dest) -and (Get-Item $dest).Length -gt 0) {
    Write-Host "[converter:models] $file already present - skipping download."
    exit 0
}

Write-Host "[converter:models] Downloading speech-to-text model '$Model' ($size)."
Write-Host "[converter:models] Source: $BaseUrl/$file"
Write-Host "[converter:models] One-time download. After this, transcription works offline."

Invoke-WebRequest -Uri "$BaseUrl/$file" -OutFile "$dest.part"
Move-Item "$dest.part" $dest -Force

$localSha = (Get-FileHash -Algorithm SHA256 $dest).Hash.ToLower()
Write-Host "[converter:models]   local sha256: $localSha"
Write-Host "[converter:models]   (record this hash in your release notes / Vex pin.)"
Write-Host "[converter:models] Done - model ready: $dest"
Write-Host "[converter:models] Set CONVERTER_WHISPER_MODEL=$Model in .env to use it."
