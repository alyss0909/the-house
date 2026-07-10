#!/usr/bin/env bash
# common.sh — shared helpers for the Voice & File Converter lib wrappers.
# Sourced by every lib/*.sh wrapper. Not executed directly.
# ---------------------------------------------------------------------------
# Hard rules enforced here (handoff §8):
#   - Quote every variable. Validate input paths. Never eval user input.
#   - User-supplied URLs/paths are untrusted — treat accordingly.
#   - No credentials anywhere. No network calls except the converters' own.
# ---------------------------------------------------------------------------

# --- Resolve pack layout --------------------------------------------------
# lib/common.sh -> pack dir is the parent of lib/.
CONVERTER_LIB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONVERTER_PACK_DIR="$(cd "${CONVERTER_LIB_DIR}/.." && pwd)"

# --- Load optional .env (non-sensitive tuning only) -----------------------
# .env carries no secrets. We read it line-by-line; we never `eval` it or
# `source` arbitrary content.
if [[ -f "${CONVERTER_PACK_DIR}/.env" ]]; then
  while IFS='=' read -r _k _v; do
    case "$_k" in
      ''|\#*) continue ;;
      CONVERTER_WHISPER_MODEL|CONVERTER_WHISPER_LANG|CONVERTER_CACHE_DIR|CONVERTER_WHISPER_THREADS|CONVERTER_OCR_LANG)
        # strip surrounding quotes/whitespace; assign only known keys
        _v="${_v%\"}"; _v="${_v#\"}"; _v="${_v## }"; _v="${_v%% }"
        [[ -n "$_v" ]] && export "$_k=$_v"
        ;;
    esac
  done < "${CONVERTER_PACK_DIR}/.env"
fi

# --- Defaults -------------------------------------------------------------
CONVERTER_WHISPER_MODEL="${CONVERTER_WHISPER_MODEL:-small}"
CONVERTER_CACHE_DIR="${CONVERTER_CACHE_DIR:-${CONVERTER_PACK_DIR}/cache}"
CONVERTER_MODELS_DIR="${CONVERTER_PACK_DIR}/models"
CONVERTER_BIN_DIR="${CONVERTER_PACK_DIR}/bin"   # OS-specific fetched binaries (Windows whisper)

# --- String helpers (bash 3.2 compatible — macOS ships bash 3.2) ----------
# Lowercase a string. The ${var,,} form is bash 4+ only; we use tr instead.
lc() { printf '%s' "$1" | tr '[:upper:]' '[:lower:]'; }

# --- Logging --------------------------------------------------------------
log()  { printf '[converter] %s\n'  "$*" >&2; }
err()  { printf '[converter] ERROR: %s\n' "$*" >&2; }
die()  { err "$*"; exit 1; }

# --- Tool discovery -------------------------------------------------------
# Prefer a system tool on PATH; allow a pack-local fetched binary as fallback.
have() { command -v "$1" >/dev/null 2>&1; }

need() {
  # need <tool> [friendly hint]
  if ! have "$1"; then
    die "'$1' is not installed. Run scripts/install.sh (or doctor.sh) first.${2:+ $2}"
  fi
}

# whisper.cpp CLI: known under several names across versions/platforms.
find_whisper() {
  local c
  for c in whisper-cli whisper-cpp main; do
    have "$c" && { echo "$c"; return 0; }
  done
  # Windows / pack-local fetched binary
  for c in "${CONVERTER_BIN_DIR}/whisper-cli" "${CONVERTER_BIN_DIR}/whisper-cli.exe" \
           "${CONVERTER_BIN_DIR}/main.exe"; do
    [[ -x "$c" ]] && { echo "$c"; return 0; }
  done
  return 1
}

# ImageMagick: v7 is `magick`, v6 is `convert`.
find_magick() {
  if have magick; then echo "magick"; return 0; fi
  if have convert; then echo "convert"; return 0; fi
  return 1
}

# --- Input validation -----------------------------------------------------
# Validate a local input file path. Rejects missing files and empties.
require_file() {
  local f="$1"
  [[ -n "$f" ]]    || die "no input file given."
  [[ -e "$f" ]]    || die "input file does not exist: $f"
  [[ -f "$f" ]]    || die "input path is not a regular file: $f"
  [[ -s "$f" ]]    || die "input file is empty: $f"
}

# Validate a user-supplied URL. We only accept http/https. We never execute
# the URL — it is passed as a single quoted argument to the converter tool.
require_url() {
  local u="$1"
  [[ -n "$u" ]] || die "no URL given."
  case "$u" in
    http://*|https://*) : ;;
    *) die "URL must start with http:// or https:// — got: $u" ;;
  esac
}

# Ensure the scratch cache exists.
ensure_cache() { mkdir -p "$CONVERTER_CACHE_DIR"; }

# Build a safe, unique output path inside the cache.
# usage: cache_path <basename> <extension>
cache_path() {
  ensure_cache
  local base ext
  base="$(basename -- "${1:-out}")"
  base="${base%.*}"
  # strip anything that is not a safe filename char
  base="$(printf '%s' "$base" | tr -c 'A-Za-z0-9._-' '_')"
  ext="${2#.}"
  printf '%s/%s-%s.%s' "$CONVERTER_CACHE_DIR" "$base" "$(date +%Y%m%d-%H%M%S)" "$ext"
}
