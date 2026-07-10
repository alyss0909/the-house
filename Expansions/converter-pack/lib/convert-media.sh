#!/usr/bin/env bash
# convert-media.sh — convert audio/video between formats, and HEIC->JPG/PNG.
# ---------------------------------------------------------------------------
#   Audio/video:  lib/convert-media.sh av    <input>  <output>
#                 (format inferred from the output extension — ffmpeg)
#   Image:        lib/convert-media.sh image <input>  <output>
#                 (HEIC/PNG/JPG/TIFF/WEBP — sips on macOS, ImageMagick else)
#
#   SECURITY: paths validated; variables quoted; ffmpeg run with -nostdin; no eval.
# ---------------------------------------------------------------------------
set -euo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/common.sh"

MODE="${1:-}"
IN="${2:-}"
OUT="${3:-}"
require_file "$IN"
[[ -n "$OUT" ]] || die "no output path given."
ensure_cache

case "$MODE" in
  av)
    need ffmpeg
    log "converting media -> $(basename -- "$OUT") (ffmpeg)..."
    ffmpeg -nostdin -hide_banner -loglevel error -y -i "$IN" "$OUT"
    [[ -s "$OUT" ]] || die "ffmpeg produced no output — the formats may be incompatible."
    ;;

  image)
    out_ext="$(lc "${OUT##*.}")"
    in_ext="$(lc "${IN##*.}")"
    if [[ "$(uname -s)" == "Darwin" ]] && have sips; then
      log "converting image ${in_ext} -> ${out_ext} (sips)..."
      case "$out_ext" in
        jpg|jpeg) sips -s format jpeg "$IN" --out "$OUT" >/dev/null ;;
        png)      sips -s format png  "$IN" --out "$OUT" >/dev/null ;;
        tiff|tif) sips -s format tiff "$IN" --out "$OUT" >/dev/null ;;
        *)        MAGICK="$(find_magick)" || die "ImageMagick needed for .$out_ext."
                  "$MAGICK" "$IN" "$OUT" ;;
      esac
    else
      MAGICK="$(find_magick)" || die "ImageMagick not found. Run scripts/install.sh first."
      log "converting image ${in_ext} -> ${out_ext} (ImageMagick)..."
      "$MAGICK" "$IN" "$OUT"
    fi
    [[ -s "$OUT" ]] || die "image conversion produced no output."
    ;;

  *)
    die "usage: convert-media.sh av <in> <out>  |  image <in> <out>"
    ;;
esac

log "done: $OUT"
printf '%s\n' "$OUT"
