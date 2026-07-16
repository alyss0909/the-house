---
agent_id: mack
session_id: f24ac8a0-7595-4350-848a-ddfeb0f8ac71
timestamp: 2026-07-10T09:15:00Z
type: end-of-session
linked_sops: []
linked_workstreams: []
linked_guidelines: ["GL-013-the-house-rules"]
mined: true
---

# Telegram bot secrets relocated outside the vault

Alyssa-approved move: the Telegram capture bot's credentials no longer live inside the OneDrive-synced vault.

## What changed

- `telegram-capture.env` (contains TELEGRAM_BOT_TOKEN, masked, never echoed) moved from `Team Knowledge/scripts/` to `C:\Users\accol\.config\telegram-capture\telegram-capture.env`.
- `.telegram-capture-state.json` (poll offset runtime state) moved to the same `.config` folder — runtime state belongs with the secret, out of OneDrive sync.
- [[telegram-capture-mvp]] (`Team Knowledge/scripts/telegram-capture-mvp.py`): `ENV_FILE` and `STATE_FILE` now point at `~/.config/telegram-capture/` via a `CONFIG_DIR` constant; `save_offset()` now mkdirs the config dir; missing-token error prints the full new path.
- `Team Knowledge/Automations/telegram-service-install.ps1`: `.NOTES` block now states the secrets-outside-vault rule and the exact new paths, so a reinstall never recreates the env inside the vault.

## Verification

- `--health-check` passed from the new env location before restart.
- `TelegramCaptureBot` scheduled task restarted: State = Running, bot process alive 20+ seconds after start (a bad env path kills it in under a second).

## What the next agent should know

1. **Two scheduled tasks exist.** The live one is `TelegramCaptureBot` (runs `python.exe` directly, no log redirect). The old `myPKA - Telegram Capture Bot` is Disabled and points at a dead vault path (`mypka-scaffold-latest (2)`) — safe to unregister, left in place because task cleanup was outside this session's lane.
2. **There is no telegram-capture.log.** The live task's action has no stdout/stderr redirect, so the bot currently logs nothing. Pre-existing gap, not introduced here. If observability matters, re-register the task with a cmd.exe redirect wrapper like the install script builds — and point the log outside OneDrive or keep it under the existing `**/*.log` gitignore.
3. [[Studio/Team Knowledge/scripts/telegram-capture-README]] in scripts/ still describes the old env location — not updated (outside lane). Fix on next touch.
4. Gitignore coverage confirmed: `*.env`, `**/.telegram-capture-state.json`, `**/*.log` at root; scripts/.gitignore retains the old explicit entries as defense-in-depth.
