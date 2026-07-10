#!/usr/bin/env bash
# strip-metadata.sh — read or strip embedded metadata (EXIF/GPS/XMP/IPTC) from
#                     images and documents, using ExifTool.
# ---------------------------------------------------------------------------
#   Inspect:  lib/strip-metadata.sh inspect <file>
#             — dumps every metadata field the file carries (read-only).
#
#   Strip:    lib/strip-metadata.sh strip   <file> [output-file]
#             — removes ALL metadata. With an output path, the original is
#               left untouched and a cleaned copy is written there. Without
#               one, a cleaned copy is written into the cache/ scratch and
#               the original is NEVER modified in place.
#
#   Privacy fit: voice memos aside, the riskiest PKM leak is an image's
#   embedded GPS coordinates, camera serial, or author name travelling with
#   a file the user files or shares. This wrapper makes "strip before filing"
#   a one-step, non-destructive operation.
#
#   SECURITY (handoff §8):
#     - All paths validated (require_file); every variable quoted; no eval.
#     - The wrapper NEVER overwrites the user's input in place. The original
#       is always preserved — output is a separate file.
#     - ExifTool runs fully offline; no network, no credentials.
# ---------------------------------------------------------------------------
set -euo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/common.sh"

MODE="${1:-}"
shift || true

# ExifTool ships as the `exiftool` command on every platform (the apt
# package libimage-exiftool-perl also installs the `exiftool` binary).
need_exiftool() {
  if ! have exiftool; then
    die "'exiftool' is not installed. Run scripts/install.sh (or doctor.sh) first."
  fi
}

case "$MODE" in
  inspect)
    IN="${1:-}"
    require_file "$IN"
    need_exiftool
    log "reading metadata from: $(basename -- "$IN")"
    # -a: allow duplicate tags  -G1: show the group each tag belongs to
    # -s: show tag names (not descriptions). Read-only — the file is untouched.
    exiftool -a -G1 -s -- "$IN"
    ;;

  strip)
    IN="${1:-}"
    OUT="${2:-}"
    require_file "$IN"
    need_exiftool
    ensure_cache

    # Non-destructive by contract: if no output path is given, write the
    # cleaned copy into the cache scratch. The input is never modified.
    if [[ -z "$OUT" ]]; then
      ext="${IN##*.}"
      OUT="$(cache_path "$IN" "$ext")"
    fi

    # Refuse to clobber the input even if the caller passes it back as OUT.
    if [[ "$(cd "$(dirname -- "$IN")" && pwd)/$(basename -- "$IN")" \
          == "$(cd "$(dirname -- "$OUT")" 2>/dev/null && pwd)/$(basename -- "$OUT")" ]]; then
      die "output path must differ from the input — this wrapper never edits the original in place."
    fi

    log "stripping all metadata -> $(basename -- "$OUT")"
    # Copy first so the cleaned file is a separate artifact and the original
    # stays pristine; then strip in place on the COPY.
    cp -- "$IN" "$OUT"
    # -all= removes every writable metadata block. -overwrite_original
    # avoids ExifTool leaving a "<file>_original" backup beside our copy
    # (we already preserved the real original — the user's input file).
    exiftool -all= -overwrite_original -- "$OUT" >/dev/null
    [[ -s "$OUT" ]] || die "metadata strip produced an empty file."

    # Report what (if anything) survived — some formats keep an ICC colour
    # profile or orientation tag by design; surface that honestly.
    remaining="$(exiftool -a -G1 -s -- "$OUT" 2>/dev/null \
                  | grep -Ev '^\[(File|ExifTool)\]' | wc -l | tr -d ' ')"
    if [[ "${remaining:-0}" -gt 0 ]]; then
      log "cleaned. ${remaining} non-file field(s) remain (e.g. colour profile / orientation — kept so the image still displays correctly)."
    else
      log "cleaned — no embedded metadata remains."
    fi
    log "cleaned copy ready: $OUT  (original untouched: $IN)"
    printf '%s\n' "$OUT"
    ;;

  *)
    die "usage: strip-metadata.sh inspect <file>  |  strip <file> [output-file]"
    ;;
esac
