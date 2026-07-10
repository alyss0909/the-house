#!/usr/bin/env bash
# transcribe-audio.sh — local offline transcription of an audio/video FILE.
# ---------------------------------------------------------------------------
#   Usage:  lib/transcribe-audio.sh <input-media-file> [output.txt]
#
#   Pipeline:  ffmpeg (decode -> 16 kHz mono WAV)  ->  whisper.cpp  ->  text
#   Runs 100% offline. No network. No upload. CPU-bound — long files are slow.
#
#   Model:    $CONVERTER_WHISPER_MODEL (default 'small'); file must have been
#             fetched by scripts/fetch-models.sh into models/.
#   Output:   plain-text transcript written to the cache (or the given path).
# ---------------------------------------------------------------------------
set -euo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/common.sh"

INPUT="${1:-}"
OUT="${2:-}"
require_file "$INPUT"

need ffmpeg
WHISPER="$(find_whisper)" || die "whisper.cpp not found. Run scripts/install.sh and scripts/fetch-models.sh first."

MODEL_FILE="${CONVERTER_MODELS_DIR}/ggml-${CONVERTER_WHISPER_MODEL}.bin"
[[ -f "$MODEL_FILE" ]] || die "model '${CONVERTER_WHISPER_MODEL}' not downloaded. Run: scripts/fetch-models.sh ${CONVERTER_WHISPER_MODEL}"

[[ -z "$OUT" ]] && OUT="$(cache_path "$INPUT" txt)"
ensure_cache
WAV="$(cache_path "$INPUT" wav)"

# whisper.cpp writes <prefix>.txt; give it a prefix without extension.
OUT_PREFIX="${OUT%.txt}"

log "decoding to 16 kHz mono WAV (ffmpeg)..."
# -nostdin: ffmpeg never reads our stdin; -y: overwrite the scratch WAV.
ffmpeg -nostdin -hide_banner -loglevel error -y \
  -i "$INPUT" -ar 16000 -ac 1 -c:a pcm_s16le "$WAV"

# Optional whisper args. Built as a flat list of words. bash 3.2 + `set -u`
# treats "${empty_array[@]}" as unbound, so we build a normal array and only
# expand it when non-empty (the ${arr+"${arr[@]}"} idiom is the safe form).
OPT_ARGS=()
[[ -n "${CONVERTER_WHISPER_LANG:-}" ]]    && OPT_ARGS+=(-l "$CONVERTER_WHISPER_LANG")
[[ -n "${CONVERTER_WHISPER_THREADS:-}" ]] && OPT_ARGS+=(-t "$CONVERTER_WHISPER_THREADS")

log "transcribing with whisper.cpp (model: ${CONVERTER_WHISPER_MODEL}) — this is the slow part..."
"$WHISPER" -m "$MODEL_FILE" -f "$WAV" \
  ${OPT_ARGS+"${OPT_ARGS[@]}"} \
  -otxt -of "$OUT_PREFIX"

rm -f "$WAV"

[[ -s "$OUT" ]] || die "transcription produced no text. The audio may be silent or unreadable."
log "transcript ready: $OUT"
printf '%s\n' "$OUT"
