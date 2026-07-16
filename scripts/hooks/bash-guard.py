"""PreToolUse guard for Bash/PowerShell on this Windows machine.

Catches the two command mistakes that have burned real time in past sessions:
  1. `python3 ...`  -> Windows has no python3 launcher here (10 past failures). Use `python`.
  2. leading `cd ...` into the working directory -> already there; triggers extra
     permission prompts and pollutes the allowlist (574 past occurrences).

Inert until wired into .claude/settings.local.json (needs Alyssa approval):
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash|PowerShell",
        "hooks": [{ "type": "command", "command": "python scripts/hooks/bash-guard.py" }]
      }
    ]
  }
}
"""
import json
import re
import sys

data = json.load(sys.stdin)
cmd = (data.get("tool_input") or {}).get("command", "")

problems = []
if re.search(r"(^|[;&|]\s*)python3\b", cmd):
    problems.append("This machine has no `python3`; use `python` instead.")
if re.match(r"^\s*cd\s+\"?C:.Users.accol.OneDrive.Desktop.the-house\"?\s*(&&|;)", cmd):
    problems.append("Already in the vault working directory; drop the leading `cd`.")

if problems:
    print(json.dumps({
        "hookSpecificOutput": {
            "hookEventName": "PreToolUse",
            "permissionDecision": "deny",
            "permissionDecisionReason": " ".join(problems) + " Rewrite the command and retry.",
        }
    }))
    sys.exit(0)

sys.exit(0)
