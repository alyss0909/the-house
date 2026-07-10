#!/usr/bin/env bash
# doctor.sh — Voice & File Converter: health check (macOS/Linux).
# ---------------------------------------------------------------------------
#   Usage:  doctor.sh [--quiet]
#
#   Verifies every converter tool is installed, the speech-to-text model is
#   present, and the machine has RAM headroom for the chosen model. Exit 0
#   when the core capabilities are usable; non-zero when a core tool is
#   missing. --quiet suppresses the per-tool report (used by
#   post_install_validation in expansion.yaml).
# ---------------------------------------------------------------------------
set -uo pipefail

EXPANSION_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
QUIET=0
[[ "${1:-}" == "--quiet" ]] && QUIET=1

say() { [[ "$QUIET" -eq 1 ]] || printf '%s\n' "$*"; }

# Load .env (tuning only) to learn the selected model.
WHISPER_MODEL="small"
if [[ -f "${EXPANSION_DIR}/.env" ]]; then
  while IFS='=' read -r k v; do
    [[ "$k" == "CONVERTER_WHISPER_MODEL" && -n "$v" ]] && WHISPER_MODEL="${v//\"/}"
  done < "${EXPANSION_DIR}/.env"
fi

FAIL=0
WARN=0

check() {
  # check <label> <core|optional> <command...>
  local label="$1" tier="$2"; shift 2
  if command -v "$1" >/dev/null 2>&1; then
    say "  OK    ${label} ($(command -v "$1"))"
  else
    if [[ "$tier" == core ]]; then
      say "  MISS  ${label} — required. Run scripts/install.sh."
      FAIL=$((FAIL+1))
    else
      say "  warn  ${label} — optional, not installed."
      WARN=$((WARN+1))
    fi
  fi
}

say "Voice & File Converter — health check"
say "-------------------------------------"

# whisper.cpp under any of its known names
if command -v whisper-cli >/dev/null 2>&1 || command -v whisper-cpp >/dev/null 2>&1 \
   || command -v main >/dev/null 2>&1 \
   || [[ -x "${EXPANSION_DIR}/bin/whisper-cli" || -x "${EXPANSION_DIR}/bin/whisper-cli.exe" ]]; then
  say "  OK    whisper.cpp (speech-to-text engine)"
else
  say "  MISS  whisper.cpp — required for transcription. Run scripts/install.sh."
  FAIL=$((FAIL+1))
fi

check "ffmpeg (audio/video decode)"       core ffmpeg
check "yt-dlp (video-link transcripts)"   core yt-dlp
check "pandoc (document conversion)"      core pandoc
check "ImageMagick (image/PDF)"           core magick || true
if ! command -v magick >/dev/null 2>&1 && command -v convert >/dev/null 2>&1; then
  say "  OK    ImageMagick (image/PDF) — v6 'convert'"
  # undo the MISS counted by check above
  FAIL=$((FAIL-1))
fi
check "pdftotext / poppler (PDF text)"    core pdftotext
check "exiftool (file metadata)"          core exiftool
check "ocrmypdf (scanned-PDF OCR)"        core ocrmypdf
check "tesseract (OCR engine)"            core tesseract
check "trafilatura (web-page text)"       optional trafilatura
check "qpdf (PDF merge/split helper)"     optional qpdf
# Ghostscript: OCRmyPDF's recommended PDF renderer (AGPL-3.0, used only as a
# CLI subprocess). Optional — OCRmyPDF can fall back to a slower renderer.
check "ghostscript (OCR PDF renderer)"    optional gs

# --- Model presence -------------------------------------------------------
MODEL_FILE="${EXPANSION_DIR}/models/ggml-${WHISPER_MODEL}.bin"
if [[ -s "$MODEL_FILE" ]]; then
  say "  OK    speech-to-text model '${WHISPER_MODEL}' present"
else
  say "  MISS  speech-to-text model '${WHISPER_MODEL}' — run: scripts/fetch-models.sh ${WHISPER_MODEL}"
  FAIL=$((FAIL+1))
fi

# --- RAM headroom (handoff §8) -------------------------------------------
# Rough working-set need: base ~0.5G, small ~1G, medium ~2.5G, large ~4G.
need_gb=1
case "$WHISPER_MODEL" in
  base) need_gb=1 ;; small) need_gb=2 ;; medium) need_gb=3 ;; large-v3-turbo) need_gb=4 ;;
esac
total_gb=0
if [[ "$(uname -s)" == "Darwin" ]]; then
  total_gb=$(( $(sysctl -n hw.memsize 2>/dev/null || echo 0) / 1073741824 ))
elif [[ -r /proc/meminfo ]]; then
  total_gb=$(( $(awk '/MemTotal/{print $2}' /proc/meminfo) / 1048576 ))
fi
if [[ "$total_gb" -gt 0 ]]; then
  if [[ "$total_gb" -lt $((need_gb + 2)) ]]; then
    say "  warn  ${total_gb} GB RAM — the '${WHISPER_MODEL}' model may run slowly here."
    say "        Consider a smaller model (base/small) for snappier transcription."
    WARN=$((WARN+1))
  else
    say "  OK    ${total_gb} GB RAM — enough headroom for the '${WHISPER_MODEL}' model"
  fi
fi

say "-------------------------------------"
if [[ "$FAIL" -gt 0 ]]; then
  say "RESULT: ${FAIL} required item(s) missing. Run scripts/install.sh and scripts/fetch-models.sh."
  exit 1
fi
say "RESULT: all core tools present${WARN:+ (${WARN} optional warning(s))}. Converter is ready."
exit 0
