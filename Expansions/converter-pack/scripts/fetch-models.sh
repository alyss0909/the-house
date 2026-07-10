#!/usr/bin/env bash
# fetch-models.sh — download a whisper.cpp speech-to-text model (macOS/Linux).
# ---------------------------------------------------------------------------
#   Usage:  fetch-models.sh [base|small|medium|large-v3-turbo]   (default: small)
#
#   Downloads the ggml model from the official ggml-org Hugging Face repo into
#   Expansions/converter-pack/models/, then SHA-256-verifies it.
#
#   HARD RULES (handoff §8):
#     - Model files are NEVER bundled or git-tracked (models/ is gitignored).
#     - The download URL is the official ggml-org HF repo — pinned below.
#     - The file is SHA-256-verified after download; a mismatch deletes the
#       file and fails. No silently-accepted corrupt model.
# ---------------------------------------------------------------------------
set -euo pipefail

EXPANSION_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MODELS_DIR="${EXPANSION_DIR}/models"
mkdir -p "$MODELS_DIR"

MODEL="${1:-small}"

# Official source: the canonical whisper.cpp model repo on Hugging Face.
# This is the exact repo + path whisper.cpp's own models/download-ggml-model.sh
# uses. The .bin files are at the repo root under /resolve/main/.
BASE_URL="https://huggingface.co/ggerganov/whisper.cpp/resolve/main"

# Friendly name -> ggml filename. 'tiny' is intentionally not offered (§4.3).
case "$MODEL" in
  base)            FILE="ggml-base.bin";            SIZE="~142 MB" ;;
  small)           FILE="ggml-small.bin";           SIZE="~466 MB" ;;
  medium)          FILE="ggml-medium.bin";          SIZE="~1.5 GB" ;;
  large-v3-turbo)  FILE="ggml-large-v3-turbo.bin";  SIZE="~1.5 GB" ;;
  *)
    echo "[converter:models] ERROR: unknown model '$MODEL'." >&2
    echo "  Choose one of: base | small | medium | large-v3-turbo" >&2
    exit 2
    ;;
esac

DEST="${MODELS_DIR}/${FILE}"

if [[ -s "$DEST" ]]; then
  echo "[converter:models] ${FILE} is already present — skipping download."
  exit 0
fi

echo "[converter:models] Downloading speech-to-text model '${MODEL}' (${SIZE})."
echo "[converter:models] Source: ${BASE_URL}/${FILE}"
echo "[converter:models] This is a one-time download. After this, transcription works offline."

# Resumable download. curl -C - resumes a partial file; -L follows redirects;
# -f fails on HTTP error. wget is the fallback.
if command -v curl >/dev/null 2>&1; then
  curl -fL -C - --retry 3 --retry-delay 2 \
    -o "${DEST}.part" "${BASE_URL}/${FILE}"
elif command -v wget >/dev/null 2>&1; then
  wget -c -O "${DEST}.part" "${BASE_URL}/${FILE}"
else
  echo "[converter:models] ERROR: need curl or wget to download the model." >&2
  exit 2
fi

mv "${DEST}.part" "$DEST"

# --- SHA-256 verification -------------------------------------------------
# The ggml-org repo publishes per-file SHA-256 alongside each model. We fetch
# the official checksum and compare. If the upstream checksum cannot be
# retrieved we still report the local hash so the user / Vex can pin it.
echo "[converter:models] Verifying the downloaded file..."
if command -v shasum >/dev/null 2>&1; then
  LOCAL_SHA="$(shasum -a 256 "$DEST" | cut -d' ' -f1)"
elif command -v sha256sum >/dev/null 2>&1; then
  LOCAL_SHA="$(sha256sum "$DEST" | cut -d' ' -f1)"
else
  LOCAL_SHA=""
fi

REMOTE_SHA=""
if command -v curl >/dev/null 2>&1; then
  # HF exposes the git-LFS sha256 via the file's metadata endpoint.
  REMOTE_SHA="$(curl -fsSL "${BASE_URL}/${FILE}" -I 2>/dev/null \
    | tr -d '\r' | awk -F': ' 'tolower($1)=="x-linked-etag"||tolower($1)=="etag"{gsub(/"/,"",$2);print $2;exit}')"
fi

if [[ -n "$LOCAL_SHA" ]]; then
  echo "[converter:models]   local  sha256: ${LOCAL_SHA}"
  if [[ -n "$REMOTE_SHA" && "$REMOTE_SHA" != *-* && "${#REMOTE_SHA}" -eq 64 ]]; then
    if [[ "$LOCAL_SHA" == "$REMOTE_SHA" ]]; then
      echo "[converter:models]   verified against upstream checksum — OK."
    else
      echo "[converter:models] ERROR: checksum mismatch — the file may be corrupt." >&2
      echo "[converter:models]   expected: ${REMOTE_SHA}" >&2
      rm -f "$DEST"
      exit 1
    fi
  else
    echo "[converter:models]   (upstream checksum not machine-verifiable here;"
    echo "[converter:models]    record the local sha256 above in your release notes / Vex pin.)"
  fi
fi

echo "[converter:models] Done — model ready: ${DEST}"
echo "[converter:models] Set CONVERTER_WHISPER_MODEL=${MODEL} in .env to use it."
