#!/usr/bin/env bash
# Slack Expansion — install script
# Installs runtime deps inside runtime/, prepares .env permissions, creates inbox folders.
#
# INTEGRITY ORDERING (v1.0.4 — Vex §5 correction B):
#   1. VERIFY the downloaded pack BEFORE running this script: compute the
#      SHA-256 of the pack zip and confirm it matches the pack hash published
#      with this pack in the myICOR library (the library record is the
#      authoritative source). The member's AI (or the member) confirms the
#      hash matches before extracting.
#   2. INSTALL — this script (npm ci, folder setup).
#   3. CLEAR QUARANTINE — done at the END of this script, never before the
#      integrity check, so macOS Gatekeeper protection is only relaxed on a
#      pack that has already been verified.
set -euo pipefail

EXPANSION_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VAULT_DIR="$(cd "${EXPANSION_DIR}/../.." && pwd)"

echo "[mypka-slack:install] Expansion dir: ${EXPANSION_DIR}"
echo "[mypka-slack:install] Vault dir:     ${VAULT_DIR}"

# 1. Verify Node + npm
if ! command -v node >/dev/null 2>&1; then
  echo "[mypka-slack:install] ERROR: Node.js is required. Install from https://nodejs.org/ (LTS) and re-run." >&2
  exit 1
fi
if ! command -v npm >/dev/null 2>&1; then
  echo "[mypka-slack:install] ERROR: npm is required (ships with Node.js)." >&2
  exit 1
fi

NODE_VERSION="$(node --version)"
echo "[mypka-slack:install] Node version: ${NODE_VERSION}"

# 2. Install runtime deps inside runtime/
#    `npm ci` (not `npm install`): installs strictly from the committed
#    package-lock.json so the dependency tree is exactly the myICOR-audited one.
#    `--omit=dev`: no dev deps. `--ignore-scripts`: blocks dependency lifecycle
#    scripts (pre/post-install) from running arbitrary code on the member's
#    machine. The @slack/* SDKs are pure JS and need no lifecycle scripts.
if [[ ! -f "${EXPANSION_DIR}/runtime/package-lock.json" ]]; then
  echo "[mypka-slack:install] ERROR: runtime/package-lock.json is missing. The pack ships a myICOR-audited lockfile — do not install without it." >&2
  exit 1
fi
echo "[mypka-slack:install] Installing runtime dependencies (npm ci, scripts disabled)..."
( cd "${EXPANSION_DIR}/runtime" && npm ci --omit=dev --ignore-scripts )

# 3. Prepare .env (copy from example if missing, chmod 600)
if [[ ! -f "${EXPANSION_DIR}/.env" ]]; then
  cp "${EXPANSION_DIR}/.env.example" "${EXPANSION_DIR}/.env"
  echo "[mypka-slack:install] Created .env from .env.example. Edit it and paste your Slack tokens."
fi
chmod 600 "${EXPANSION_DIR}/.env"

# 4. Create inbox queues
mkdir -p "${VAULT_DIR}/Team Inbox/slack-incoming/.processed"
mkdir -p "${VAULT_DIR}/Team Inbox/slack-outgoing/.sent"
echo "[mypka-slack:install] Created Team Inbox/slack-incoming/ and Team Inbox/slack-outgoing/"

# 5. macOS: clear the Gatekeeper quarantine flag — LAST (Vex §5 correction B).
#    The pack ships as a downloaded zip, so macOS quarantines every file and
#    double-clicking start.command trips the "could not verify ... malware"
#    warning. We clear the flag ONLY here, at the end of install — after the
#    member/AI has already verified the pack against `manifest_sha256` and
#    after deps are installed. Clearing it earlier would relax Gatekeeper on
#    an unverified pack. install.sh runs from Terminal (not Gatekeeper-gated),
#    so it can clear the flag before the member launches start.command.
if [[ "$(uname -s)" == "Darwin" ]]; then
  xattr -dr com.apple.quarantine "${EXPANSION_DIR}" 2>/dev/null || true
  echo "[mypka-slack:install] Cleared the macOS quarantine flag (post-verify, post-install)."
fi

# 6. Done
echo ""
echo "[mypka-slack:install] Done. Next steps:"
echo "  1. Edit ${EXPANSION_DIR}/.env and paste SLACK_BOT_TOKEN + SLACK_APP_TOKEN"
echo "  2. Launch the listener:"
echo "       macOS:   double-click ${EXPANSION_DIR}/scripts/start.command"
echo "       Linux:   bash ${EXPANSION_DIR}/scripts/start.sh"
echo "       Windows: ${EXPANSION_DIR}/scripts/start.bat"
echo ""
echo "[mypka-slack:install] See INSTALL.md for the Slack-app-creation walkthrough."
