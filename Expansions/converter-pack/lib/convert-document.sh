#!/usr/bin/env bash
# convert-document.sh — convert documents between everyday formats.
# ---------------------------------------------------------------------------
#   Usage:  lib/convert-document.sh <input-file> <output-file>
#
#   The conversion is inferred from the file extensions. Backed by pandoc,
#   which covers the formats a knowledge worker actually deals with:
#     .docx .md .markdown .html .htm .epub .odt .rst .txt .tex .rtf
#
#   PDF note: pandoc CAN write PDF but needs a LaTeX engine. To keep v1 free
#   of a LaTeX dependency, "<anything>.pdf" output is produced by going
#   document -> html -> PDF only when a suitable engine exists; otherwise we
#   stop with a clear message. PDF *input* extraction (pdf -> text/markdown)
#   uses poppler's pdftotext, which is already a pack tool.
#
#   SECURITY: paths validated; variables quoted; no eval.
# ---------------------------------------------------------------------------
set -euo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/common.sh"

IN="${1:-}"
OUT="${2:-}"
require_file "$IN"
[[ -n "$OUT" ]] || die "no output file path given."

in_ext="$(lc "${IN##*.}")"
out_ext="$(lc "${OUT##*.}")"
ensure_cache

# --- PDF input -> text/markdown (poppler) ---------------------------------
if [[ "$in_ext" == "pdf" ]]; then
  need pdftotext "Run scripts/install.sh first."
  case "$out_ext" in
    txt)
      log "extracting text from PDF (pdftotext)..."
      pdftotext -layout "$IN" "$OUT"
      ;;
    md|markdown)
      log "extracting PDF text and wrapping as Markdown..."
      pdftotext -layout "$IN" "${OUT%.md}.tmp.txt"
      pdftotext -layout "$IN" - > "$OUT"
      rm -f "${OUT%.md}.tmp.txt"
      ;;
    *)
      die "from PDF, v1 supports .txt or .md output only (got .$out_ext)."
      ;;
  esac
  [[ -s "$OUT" ]] || die "no text could be extracted (the PDF may be a scan — OCR is a v2 feature)."
  log "done: $OUT"
  printf '%s\n' "$OUT"
  exit 0
fi

# --- PDF output -----------------------------------------------------------
# v1 deliberately installs and manages NO PDF engine (LaTeX/wkhtmltopdf/etc.).
# We do NOT opportunistically use a stray pre-existing engine — it may be
# broken or unmanaged, which produces confusing failures. v1 policy: document
# -> PDF is out of scope; the user converts to .html/.docx and "Saves as PDF".
# (For images -> PDF, use lib/images-to-pdf.sh, which IS supported in v1.)
if [[ "$out_ext" == "pdf" ]]; then
  die "Converting a document straight to PDF is not part of v1 (it would need a PDF/LaTeX engine this pack does not manage). Tip: convert to .html or .docx first, then use 'Save as PDF' / 'Export as PDF' from your usual app. To turn images into a PDF, use the image-to-PDF skill instead."
fi

# --- General document <-> document via pandoc ----------------------------
need pandoc
log "converting ${in_ext} -> ${out_ext} with pandoc..."
pandoc "$IN" -o "$OUT" --wrap=none
[[ -s "$OUT" ]] || die "conversion produced an empty file — the formats may be incompatible."
log "done: $OUT"
printf '%s\n' "$OUT"
