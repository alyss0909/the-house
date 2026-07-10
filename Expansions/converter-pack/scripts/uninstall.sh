#!/usr/bin/env bash
# uninstall.sh — Voice & File Converter: clean removal (macOS/Linux).
# ---------------------------------------------------------------------------
# Per §12 Q2 (Tom-signed): system package-manager tools (ffmpeg, pandoc, etc.)
# are LEFT IN PLACE. Other software on the machine may depend on them; ripping
# them out is destructive and out of scope for "remove a pack". This script
# only removes what is unambiguously this pack's: the fetched model files and
# the scratch cache inside the Expansion folder.
#
# The Expansion folder itself and the 5 SOPs are removed by Larry's WS-003
# uninstall flow (rm-rf-folder + residual_paths) — not here.
# ---------------------------------------------------------------------------
set -euo pipefail

EXPANSION_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "[converter:uninstall] Expansion dir: ${EXPANSION_DIR}"

# Remove the downloaded model files (can be 1.5 GB+).
if [[ -d "${EXPANSION_DIR}/models" ]]; then
  echo "[converter:uninstall] Removing downloaded speech-to-text model(s)..."
  rm -rf "${EXPANSION_DIR}/models"
fi

# Remove the scratch cache (intermediate + output files).
if [[ -d "${EXPANSION_DIR}/cache" ]]; then
  echo "[converter:uninstall] Removing the scratch cache..."
  rm -rf "${EXPANSION_DIR}/cache"
fi

# Remove any Windows-pinned binary fetched into bin/.
if [[ -d "${EXPANSION_DIR}/bin" ]]; then
  echo "[converter:uninstall] Removing pack-local fetched binaries..."
  rm -rf "${EXPANSION_DIR}/bin"
fi

# Clear .env (no secrets, but tidy).
[[ -f "${EXPANSION_DIR}/.env" ]] && { : > "${EXPANSION_DIR}/.env"; echo "[converter:uninstall] Cleared .env"; }

echo ""
echo "[converter:uninstall] Pack-local files removed."
echo "[converter:uninstall] LEFT IN PLACE ON PURPOSE (other apps may use them):"
echo "    the system tools ffmpeg, yt-dlp, pandoc, imagemagick, qpdf, poppler,"
echo "    trafilatura, whisper-cpp, exiftool, ocrmypdf, tesseract, ghostscript"
echo "    — installed via your package manager."
echo "    Remove them yourself only if you are sure nothing else needs them,"
echo "    e.g.  brew uninstall ffmpeg   (macOS)   /   sudo apt remove ffmpeg (Linux)."
