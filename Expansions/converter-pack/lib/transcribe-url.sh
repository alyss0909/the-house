#!/usr/bin/env bash
# transcribe-url.sh — get a transcript from a video/audio URL (YouTube etc.).
# ---------------------------------------------------------------------------
#   Usage:  lib/transcribe-url.sh <video-or-audio-URL> [output.txt]
#
#   Strategy (fast path first):
#     1. Try to fetch an existing subtitle/caption track with yt-dlp.
#        If a real (non-auto or auto) caption track exists, use it — instant,
#        no transcription needed.
#     2. If no captions exist, download just the audio and run the local
#        offline transcription pipeline (transcribe-audio.sh).
#
#   SECURITY (handoff §8):
#     - The URL is ALWAYS user-supplied and untrusted. It is passed as a
#       single quoted argument; never eval'd, never word-split.
#     - yt-dlp runs with --no-update (never self-updates at our call site).
#     - No credentials, no cookies, no login.
# ---------------------------------------------------------------------------
set -euo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/common.sh"

URL="${1:-}"
OUT="${2:-}"
require_url "$URL"
need yt-dlp

ensure_cache
WORK="$(mktemp -d "${CONVERTER_CACHE_DIR}/yturl.XXXXXX")"
trap 'rm -rf "$WORK"' EXIT

[[ -z "$OUT" ]] && OUT="$(cache_path "url-transcript" txt)"

# --- 1. Try captions ------------------------------------------------------
log "checking for an existing caption/subtitle track..."
# --no-update: never self-update. --skip-download: metadata/subs only.
# Restrict to subtitles; write to the temp work dir; convert to plain srt.
if yt-dlp --no-update --no-playlist --skip-download \
      --write-subs --write-auto-subs --sub-langs "${CONVERTER_WHISPER_LANG:-en}.*,en.*" \
      --sub-format "vtt/srt/best" --convert-subs srt \
      -o "${WORK}/sub.%(ext)s" -- "$URL" >/dev/null 2>&1; then
  SUB="$(find "$WORK" -name '*.srt' -print -quit 2>/dev/null || true)"
  if [[ -n "${SUB:-}" && -s "$SUB" ]]; then
    log "caption track found — extracting clean text (no transcription needed)."
    # Strip SRT indices, timestamps, and blank lines -> plain prose.
    sed -E '/^[0-9]+$/d; /-->/d; /^[[:space:]]*$/d' "$SUB" \
      | sed -E 's/<[^>]+>//g' \
      | awk '!seen[$0]++' > "$OUT"
    [[ -s "$OUT" ]] && { log "transcript ready: $OUT"; printf '%s\n' "$OUT"; exit 0; }
  fi
fi

# --- 2. No captions: download audio + transcribe locally ------------------
log "no caption track available — downloading audio to transcribe locally."
yt-dlp --no-update --no-playlist \
  -f "bestaudio/best" -x --audio-format m4a \
  -o "${WORK}/audio.%(ext)s" -- "$URL"

AUDIO="$(find "$WORK" -name 'audio.*' -print -quit 2>/dev/null || true)"
[[ -n "${AUDIO:-}" && -s "$AUDIO" ]] || die "could not download audio from the URL."

log "handing off to the local transcription pipeline..."
"${CONVERTER_LIB_DIR}/transcribe-audio.sh" "$AUDIO" "$OUT" >/dev/null

[[ -s "$OUT" ]] || die "transcription produced no text."
log "transcript ready: $OUT"
printf '%s\n' "$OUT"
