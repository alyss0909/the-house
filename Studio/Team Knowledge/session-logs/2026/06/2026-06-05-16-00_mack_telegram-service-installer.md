---
agent_id: mack
session_id: telegram-service-installer-2026-06-05
timestamp: 2026-06-05T16:00:00Z
type: end-of-session
linked_sops: []
linked_workstreams: []
linked_guidelines: []
mined: true
---

# Mack - Telegram Service Installer

## What I did

Built `Team Knowledge/Automations/telegram-service-install.ps1` — a one-run PowerShell script that registers the Telegram capture bot as a persistent Windows Task Scheduler task. No third-party tools required.

## Technical decisions made

**pythonw.exe over python.exe.** pythonw suppresses the console window entirely. Using the full path `C:\Users\accol\AppData\Local\Programs\Python\Python313\pythonw.exe` confirmed present on this machine. No hardcoded version guesses needed beyond what `which pythonw` returned.

**cmd.exe wrapper for log redirection.** Task Scheduler cannot redirect stdout/stderr natively in its GUI/API. The action runs `cmd.exe /c "pythonw.exe script.py" >> logfile 2>&1` which appends all output to `Team Knowledge/scripts/telegram-capture.log` in append mode.

**LogonType: Password (not Interactive).** Running "whether user is logged on or not" requires Password logon type. This prompts Alyssa for her Windows password at install time — stored securely by Windows, never written to any file. Running as SYSTEM was rejected because the bot writes to the user's OneDrive vault folder.

**Restart policy.** `New-ScheduledTaskSettingsSet` `-RestartCount 3 -RestartInterval 1min` plus `schtasks /change /ri 1 /rc 3` patches the failure-action chain. Covers both clean exits and crash scenarios.

**StartWhenAvailable: true.** If the machine was off at last boot trigger, Task Scheduler will start the task immediately when the machine next comes online.

## Files touched

- Created: `Team Knowledge/Automations/telegram-service-install.ps1`
- Updated: [[Studio/Team Knowledge/tasks/open/tsk-2026-06-01-004-telegram-claude-automation]] (update entry + timestamp)
- Log file will be created at runtime: `Team Knowledge/scripts/telegram-capture.log`

## What remains

One action for Alyssa: run `telegram-service-install.ps1` once as Administrator. After that, the bot is permanent — survives reboots, restarts on crash, no window visible.

## Caveats surfaced

- If Alyssa's Windows password changes, the scheduled task will fail silently (it stores the password at registration time). She will need to re-run the installer with the new password.
- The log file grows indefinitely in append mode. No rotation is built in. If the bot runs for months, the log may need manual trimming. This is a known trade-off for simplicity.
- Task Scheduler's "run when logged off" does require an internet connection to reach Telegram. The `-RunOnlyIfNetworkAvailable:$false` flag is set, so the task will start; it will simply retry Telegram connections internally until the network comes up.
