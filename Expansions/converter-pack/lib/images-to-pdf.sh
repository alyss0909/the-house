#!/usr/bin/env bash
# images-to-pdf.sh — combine one or more images into a single PDF, or split
#                    a PDF back into per-page images.
# ---------------------------------------------------------------------------
#   Combine:  lib/images-to-pdf.sh combine <out.pdf> <img1> [img2 ...]
#   Split:    lib/images-to-pdf.sh split   <in.pdf>  [output-dir]
#
#   HEIC (iPhone photos) is handled transparently on the combine path:
#   on macOS via the built-in `sips`, elsewhere via ImageMagick (libheif).
#
#   SECURITY: all paths validated; variables quoted; no eval.
# ---------------------------------------------------------------------------
set -euo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/common.sh"

MODE="${1:-}"
shift || true

case "$MODE" in
  combine)
    OUT="${1:-}"; shift || true
    [[ -n "$OUT" ]] || die "combine: no output PDF path given."
    [[ "$#" -ge 1 ]] || die "combine: give at least one image file."
    for f in "$@"; do require_file "$f"; done
    ensure_cache

    MAGICK="$(find_magick)" || die "ImageMagick not found. Run scripts/install.sh first."

    # Pre-convert any HEIC inputs to JPG so every backend can read them.
    CLEAN=()
    TMP="$(mktemp -d "${CONVERTER_CACHE_DIR}/img2pdf.XXXXXX")"
    trap 'rm -rf "$TMP"' EXIT
    for f in "$@"; do
      case "$(lc "$f")" in
        *.heic|*.heif)
          jpg="${TMP}/$(basename -- "${f%.*}").jpg"
          if [[ "$(uname -s)" == "Darwin" ]] && have sips; then
            sips -s format jpeg "$f" --out "$jpg" >/dev/null
          else
            "$MAGICK" "$f" "$jpg"
          fi
          CLEAN+=("$jpg")
          ;;
        *)
          CLEAN+=("$f")
          ;;
      esac
    done

    log "combining ${#CLEAN[@]} image(s) into PDF: $OUT"
    "$MAGICK" "${CLEAN[@]}" "$OUT"
    [[ -s "$OUT" ]] || die "PDF was not produced."
    log "PDF ready: $OUT"
    printf '%s\n' "$OUT"
    ;;

  split)
    IN="${1:-}"
    DIR="${2:-}"
    require_file "$IN"
    [[ -z "$DIR" ]] && DIR="$(cache_path "$IN" d)" && DIR="${DIR%.d}-pages"
    mkdir -p "$DIR"

    log "splitting PDF into per-page images: $DIR"
    if have pdftoppm; then
      # poppler — high quality, no ImageMagick PDF policy issues.
      pdftoppm -png -r 150 "$IN" "${DIR}/page"
    else
      MAGICK="$(find_magick)" || die "need poppler (pdftoppm) or ImageMagick. Run scripts/install.sh."
      "$MAGICK" -density 150 "$IN" "${DIR}/page-%03d.png"
    fi
    COUNT="$(find "$DIR" -name 'page*' -type f | wc -l | tr -d ' ')"
    [[ "$COUNT" -ge 1 ]] || die "no pages were produced."
    log "split into ${COUNT} page image(s): $DIR"
    printf '%s\n' "$DIR"
    ;;

  *)
    die "usage: images-to-pdf.sh combine <out.pdf> <img...>  |  split <in.pdf> [dir]"
    ;;
esac
