#!/usr/bin/env bash
# ocr-pdf.sh — turn a scanned (image-only) PDF into a searchable one, and
#              optionally extract the recognised text.
# ---------------------------------------------------------------------------
#   Searchable PDF:   lib/ocr-pdf.sh pdf  <scanned.pdf> [searchable.pdf]
#                     — adds an invisible OCR text layer; the page images are
#                       unchanged, but the PDF becomes selectable/searchable.
#
#   Plain text:       lib/ocr-pdf.sh text <scanned.pdf> [out.txt]
#                     — OCRs the PDF, then extracts the recognised text.
#
#   Toolchain (verified against best practice — see ADAPT-EXPANSION §ocr):
#     OCRmyPDF  — the de-facto CLI wrapper for scanned-PDF -> searchable-PDF.
#     Tesseract — the OCR engine OCRmyPDF drives (Apache-2.0).
#     Ghostscript — OCRmyPDF's PDF rasterise/normalise dependency.
#                   *** Ghostscript is AGPL-3.0. *** It is used ONLY as a
#                   local CLI subprocess that OCRmyPDF spawns — never linked,
#                   never modified, never network-exposed. See the README
#                   "Open-source tools & licenses" section for the user-facing
#                   AGPL disclosure (handoff §2.2).
#
#   SECURITY (handoff §8):
#     - All paths validated (require_file); every variable quoted; no eval.
#     - Runs fully offline. No network, no credentials.
#     - OCRmyPDF never overwrites the input: output is always a new file.
# ---------------------------------------------------------------------------
set -euo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/common.sh"

MODE="${1:-}"
IN="${2:-}"
OUT="${3:-}"
require_file "$IN"

# OCR language(s) for Tesseract, passed straight through to OCRmyPDF's -l.
# Default 'eng'. Override with CONVERTER_OCR_LANG (e.g. eng+deu).
OCR_LANG="${CONVERTER_OCR_LANG:-eng}"

need ocrmypdf  "Run scripts/install.sh first."
# OCRmyPDF drives these two; surface a clear message if either is absent.
have tesseract || die "Tesseract (the OCR engine) is not installed. Run scripts/install.sh first."
have gs        || log "note: Ghostscript not found on PATH — OCRmyPDF may fall back to a slower renderer."

ensure_cache

# OCRmyPDF emits a searchable PDF. We always produce that first; the 'text'
# mode then runs pdftotext over the result.
case "$MODE" in
  pdf)
    [[ -z "$OUT" ]] && OUT="$(cache_path "$IN" pdf)"
    [[ "$OUT" != "$IN" ]] || die "output path must differ from the input."
    log "running OCR on the scanned PDF (language: ${OCR_LANG}) — this can take a while..."
    # --skip-text: pages that already have a text layer are passed through
    #   untouched instead of erroring (handles mixed scanned/born-digital PDFs).
    # --rotate-pages / --deskew: straighten crooked scans for better accuracy.
    ocrmypdf --skip-text --rotate-pages --deskew -l "$OCR_LANG" -- "$IN" "$OUT"
    [[ -s "$OUT" ]] || die "OCR produced no output PDF."
    log "searchable PDF ready: $OUT"
    printf '%s\n' "$OUT"
    ;;

  text)
    [[ -z "$OUT" ]] && OUT="$(cache_path "$IN" txt)"
    need pdftotext "Run scripts/install.sh first."
    SEARCHABLE="$(cache_path "$IN" pdf)"
    log "running OCR on the scanned PDF (language: ${OCR_LANG}) — this can take a while..."
    ocrmypdf --skip-text --rotate-pages --deskew -l "$OCR_LANG" -- "$IN" "$SEARCHABLE"
    [[ -s "$SEARCHABLE" ]] || die "OCR produced no output PDF."
    log "extracting the recognised text..."
    pdftotext -layout "$SEARCHABLE" "$OUT"
    rm -f "$SEARCHABLE"
    [[ -s "$OUT" ]] || die "no text could be recognised — the scan may be blank or unreadable."
    log "recognised text ready: $OUT"
    printf '%s\n' "$OUT"
    ;;

  *)
    die "usage: ocr-pdf.sh pdf <scanned.pdf> [searchable.pdf]  |  text <scanned.pdf> [out.txt]"
    ;;
esac
