#!/usr/bin/env bash
# Slack Expansion — uninstall script
# Stops the listener, unloads the launchd plist (macOS), clears .env.
# Does NOT remove Team Inbox/slack-* folders by default — that's user data.
set -euo pipefail

EXPANSION_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VAULT_DIR="$(cd "${EXPANSION_DIR}/../.." && pwd)"
PLIST="${HOME}/Library/LaunchAgents/com.mypka.slack-listener.plist"

echo "[mypka-slack:uninstall] Expansion dir: ${EXPANSION_DIR}"

# 1. macOS: unload launchd if present
if [[ "$(uname -s)" == "Darwin" ]] && [[ -f "${PLIST}" ]]; then
  echo "[mypka-slack:uninstall] Unloading launchd plist..."
  launchctl unload "${PLIST}" 2>/dev/null || true
  rm -f "${PLIST}"
  echo "[mypka-slack:uninstall] Removed ${PLIST}"
fi

# 2. Best-effort kill any foreground listener processes
if pgrep -f "node .*Expansions/slack/runtime/index.js" >/dev/null 2>&1; then
  echo "[mypka-slack:uninstall] Killing running listener processes..."
  pkill -f "node .*Expansions/slack/runtime/index.js" 2>/dev/null || true
fi

# 3. Clear .env (the Expansion folder will be removed by Larry's archive step)
if [[ -f "${EXPANSION_DIR}/.env" ]]; then
  : > "${EXPANSION_DIR}/.env"
  echo "[mypka-slack:uninstall] Cleared .env"
fi

# 4. Optional: prompt about user data
echo ""
echo "[mypka-slack:uninstall] Listener stopped. Token file cleared."
echo "[mypka-slack:uninstall] Kept by default (your data, your call):"
echo "    ${VAULT_DIR}/Team Inbox/slack-incoming/"
echo "    ${VAULT_DIR}/Team Inbox/slack-outgoing/"
echo "    /tmp/mypka-slack-listener.log"
echo "    /tmp/mypka-slack-listener.err"
echo "[mypka-slack:uninstall] Delete them manually if you want them gone."
