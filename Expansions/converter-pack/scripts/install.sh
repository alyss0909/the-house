#!/usr/bin/env bash
# install.sh — Voice & File Converter: fetch the free, open-source tools.
# ---------------------------------------------------------------------------
# macOS + Linux installer. Windows users run scripts/install.ps1 instead.
#
# HARD RULES (handoff §8):
#   - NO binaries are bundled. Every tool is fetched at install time from the
#     system package manager's official channel.
#   - NO `curl | sh` bootstrap. If no package manager is found, this script
#     STOPS and instructs the user — it never installs Homebrew/apt itself.
#   - Idempotent: a tool already present is left alone.
#   - No credentials. No network calls except the package manager's own.
#   - macOS apt-equivalent: Homebrew. Linux: apt. (Other managers: instruct.)
# ---------------------------------------------------------------------------
set -euo pipefail

EXPANSION_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OS="$(uname -s)"

echo "[converter:install] Expansion dir: ${EXPANSION_DIR}"
echo "[converter:install] OS: ${OS}"

# macOS: clear the Gatekeeper quarantine flag on the downloaded pack so the
# shell scripts run without the "could not verify" warning. install.sh runs
# from Terminal (not Gatekeeper-gated), so it can clear the flag.
if [[ "$OS" == "Darwin" ]]; then
  xattr -dr com.apple.quarantine "${EXPANSION_DIR}" 2>/dev/null || true
  echo "[converter:install] Cleared the macOS quarantine flag."
fi

# Tools we want present. v1.1 set (handoff §9 + AUTO-152/AUTO-153 scope):
#   ffmpeg yt-dlp pandoc imagemagick qpdf poppler trafilatura  (+ libheif on Linux)
#   exiftool                          — read/strip file metadata (AUTO-153)
#   ocrmypdf tesseract ghostscript     — scanned-PDF OCR (AUTO-153 / AUTO-82 v2)
# whisper.cpp is handled separately (brew formula on macOS/Linux; pinned
# release on Windows via install.ps1).
#
# NOTE on Ghostscript: it is AGPL-3.0. The pack ships NO Ghostscript binary —
# the package manager fetches it, and it is used ONLY as a local CLI
# subprocess that OCRmyPDF spawns. See README "Open-source tools & licenses".

# ---------------------------------------------------------------------------
install_macos() {
  if ! command -v brew >/dev/null 2>&1; then
    cat >&2 <<'EOF'

[converter:install] STOP — Homebrew is required and was not found.

  This installer does not install Homebrew for you (piping an install
  script straight into a shell is unsafe, and we will not do it on your
  behalf). You install Homebrew yourself, then re-run this installer.

  1. Open Terminal (Cmd+Space, type "Terminal", Enter).
  2. Run the official command from https://brew.sh :

       /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  3. Follow Homebrew's prompts, then re-run this installer:

       bash Expansions/converter-pack/scripts/install.sh

EOF
    exit 2
  fi

  echo "[converter:install] Using Homebrew."
  # tesseract-lang installs the extra OCR language data alongside the engine.
  local pkgs=(ffmpeg yt-dlp pandoc imagemagick qpdf poppler trafilatura whisper-cpp \
              exiftool ocrmypdf tesseract tesseract-lang ghostscript)
  for p in "${pkgs[@]}"; do
    if brew list --formula 2>/dev/null | grep -qx "$p"; then
      echo "[converter:install]   $p — already installed, skipping."
    else
      echo "[converter:install]   installing $p ..."
      brew install "$p"
    fi
  done
}

# ---------------------------------------------------------------------------
install_linux() {
  if command -v apt-get >/dev/null 2>&1; then
    cat <<'EOF'

[converter:install] Linux — the converter tools install through apt.
  This installer will NOT run sudo for you. Copy and run this single
  command yourself (it installs only what this pack needs):

    sudo apt update && sudo apt install -y \
      ffmpeg yt-dlp imagemagick qpdf poppler-utils pandoc libheif1 pipx whisper-cpp \
      libimage-exiftool-perl ocrmypdf tesseract-ocr tesseract-ocr-eng ghostscript

  Then install the article-text extractor (isolated, no system pollution):

    pipx install trafilatura

  Note: 'whisper-cpp' is in recent Debian/Ubuntu; if apt reports it is not
  found, build it from https://github.com/ggml-org/whisper.cpp or install
  via your distro's backports. trafilatura has no apt package — pipx is the
  recommended scriptable install.

  'ghostscript' above is AGPL-3.0. This pack ships NO Ghostscript binary —
  apt fetches it, and it is used ONLY as a local CLI subprocess that OCRmyPDF
  spawns for scanned-PDF OCR. For other OCR languages add e.g.
  'tesseract-ocr-deu' (German), 'tesseract-ocr-fra' (French).

  Once those are in, re-run this installer to verify:

    bash Expansions/converter-pack/scripts/install.sh --verify-only

EOF
    if [[ "${1:-}" == "--verify-only" ]]; then
      return 0
    fi
    exit 2
  fi

  cat >&2 <<'EOF'

[converter:install] STOP — no supported package manager (apt) was found.
  This pack's automatic install supports apt-based Linux. On other distros,
  install these packages with your distribution's package manager:

    ffmpeg  yt-dlp  imagemagick  qpdf  poppler-utils  pandoc  libheif
    whisper.cpp (whisper-cli)   trafilatura (via pipx)
    exiftool  ocrmypdf  tesseract (+ language data)  ghostscript

  Then run:  bash Expansions/converter-pack/scripts/install.sh --verify-only

EOF
  exit 2
}

# ---------------------------------------------------------------------------
case "$OS" in
  Darwin) install_macos ;;
  Linux)  install_linux "${1:-}" ;;
  *)
    echo "[converter:install] Unsupported OS '$OS'. On Windows, run scripts/install.ps1." >&2
    exit 2
    ;;
esac

# Prepare the scratch cache + models dir (gitignored).
mkdir -p "${EXPANSION_DIR}/cache" "${EXPANSION_DIR}/models"

# Copy .env.example -> .env if absent (no secrets; tuning only).
if [[ ! -f "${EXPANSION_DIR}/.env" ]]; then
  cp "${EXPANSION_DIR}/.env.example" "${EXPANSION_DIR}/.env"
  echo "[converter:install] Created .env from .env.example (optional tuning only)."
fi

echo ""
echo "[converter:install] Tool install step complete."
echo "[converter:install] Next:"
echo "  1. Download the speech-to-text model:"
echo "       bash Expansions/converter-pack/scripts/fetch-models.sh small"
echo "  2. Verify everything:"
echo "       bash Expansions/converter-pack/scripts/doctor.sh"
