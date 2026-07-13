---
agent_id: mack
session_id: 0c2655a6-4325-4fa1-b3f0-2cf762cb0df6
timestamp: 2026-07-13T11:05:00Z
type: end-of-session
linked_sops: []
linked_workstreams: []
linked_guidelines: ["GL-013-the-house-rules"]
---

# TelegramCaptureBot fixed — restructure left a path bug, not a crash

Larry routed this after [[Studio/Team Knowledge/Weekly Reviews/2026/2026-W28-house-check|the W28 house check]] flagged the capture bot failing since 2026-07-10. Alyssa approved fixing it directly.

## What was actually broken

Two separate things, both traced to the 2026-07-09/10 restructure:

1. **Real bug, still live until this session: `VAULT_ROOT` resolved to the wrong folder.** [[Studio/Team Knowledge/scripts/telegram-capture-mvp]] computed `VAULT_ROOT = SCRIPT_DIR.parents[1]` — correct back when `Team Knowledge/scripts/` lived directly under the vault root, wrong after `git mv Team + Team Knowledge into Studio/` added one more folder level. Since the move, `VAULT_ROOT` silently resolved to `Studio/` instead of the vault root, which meant every future Telegram capture would have been written to `Studio/Notebook/Inbox` (a path that doesn't exist in the real layout) instead of the real `Notebook/Inbox`. No message had come through since the move, so no file was actually misfiled — caught before it did damage. Fixed to `SCRIPT_DIR.parents[2]`, verified `VAULT_ROOT` now resolves to the vault root and `TEAM_INBOX` resolves to the real, existing `Notebook/Inbox`.

2. **The recorded crash (LastTaskResult `0xC0000135` / STATUS_DLL_NOT_FOUND, 2026-07-10 12:57:32 PM) could not be reproduced.** Ran the script manually with the exact interpreter (`python.exe` at the Task Scheduler-configured path) and triggered the live `TelegramCaptureBot` task itself (`schtasks /run`) twice — both succeeded cleanly, health-check passed, and the task's own process stayed alive under Task Scheduler (verified via `tasklist`). Neither `python.exe` nor the script are OneDrive placeholder/cloud-only files (checked via `attrib` — both fully hydrated). The timing lines up with the `git mv` that moved `Team Knowledge/` into `Studio/` that same day; the working theory is a transient race during that active file move (the task's `RestartOnFailure` — 5 attempts over 5 minutes — would also have hit the same failure if the move was still in progress across that window). Nothing in the current environment reproduces the crash, so no further crash-specific fix was needed beyond confirming the current state is healthy.

## What I changed

- [[Studio/Team Knowledge/scripts/telegram-capture-mvp]]:
  - Fixed `VAULT_ROOT` path depth (`parents[1]` → `parents[2]`) with a comment explaining why, so the next folder move doesn't silently reintroduce this.
  - Added an internal `log()` helper that writes timestamped lines to `~/.config/telegram-capture/telegram-capture.log` (outside the vault, alongside the existing secrets/state files) — the live scheduled task has no stdout/stderr redirect, so this was the only gap between "the bot is alive" and "we can tell what it's been doing." Flagged as a known gap in [[Studio/Team Knowledge/session-logs/2026/07/2026-07-10-09-15_mack_telegram-secrets-out-of-vault]], closed here.
  - Wrapped the main poll loop in `main()` in a try/except with backoff (15s * consecutive-error-count, capped at 300s) so a single Telegram API hiccup or network blip no longer kills the whole process. Previously any unhandled exception in `process_updates()` would crash the loop outright with no retry inside the script itself, relying entirely on Task Scheduler's bounded 5-attempt restart policy.
- [[Studio/Team Knowledge/scripts/telegram-capture-README]]: corrected the stale setup instructions (still described the pre-2026-07-10 in-vault env location) to point at `~/.config/telegram-capture/`, and added a short section documenting the live task name (`TelegramCaptureBot`), the disabled dead duplicate (`myPKA - Telegram Capture Bot`, leave disabled), and the new log file location. This was flagged as "fix on next touch" in the 2026-07-10 session log — done here.

## What I did NOT change

- The Windows Scheduled Task definition itself (`TelegramCaptureBot`) — out of scope per this session's brief. I only invoked the existing task (`schtasks /run`, `schtasks /end`) to test it, never edited its action, trigger, or principal.
- `Studio/Team Knowledge/Automations/telegram-service-install.ps1` — registers a differently-named task (`myPKA - Telegram Capture Bot`) with a different launch mechanism (cmd.exe + pythonw.exe + log redirect) and is not what's actually running. Its vault paths are already current (someone updated `$VaultRoot` to the `Studio/` layout previously), so it's not broken, but it's also not the live task — left alone, flagged here for whoever next needs a from-scratch reinstall.

## Verification

- `python.exe telegram-capture-mvp.py --health-check` → `Telegram token is valid for @ideaeaterbot.`
- `python.exe telegram-capture-mvp.py --once` → `No queued Telegram messages found.` (clean exit, no crash)
- `schtasks /run /tn "TelegramCaptureBot"` → task state `Running`, `python.exe` process alive under the correct user session (confirmed via `tasklist`).
- `~/.config/telegram-capture/telegram-capture.log` now has timestamped entries from both manual runs.
- Corrected `VAULT_ROOT`/`TEAM_INBOX` resolution confirmed via direct module import — points at the real `Notebook/Inbox`, which exists.

## What the next agent should know

1. The bot is live right now (started via manual `schtasks /run` this session, since the `LogonTrigger` only fires on an actual Windows logon and the machine hasn't had one since 2026-07-10 — sleep/resume doesn't count). It will also start correctly at the next real logon.
2. If it goes silent again, check `~/.config/telegram-capture/telegram-capture.log` first — that's new as of this session and didn't exist before.
3. The disabled duplicate task (`myPKA - Telegram Capture Bot`, dead pre-migration path) is still sitting there, admin-locked to delete. Noted on [[Notebook/DESK]] as parked, not this session's job.
