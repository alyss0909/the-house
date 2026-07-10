# SOP-slack-listener-health — Verify the Slack listener is alive; restart if not

- **Default owner:** Mack. Reusable by any agent.
- **Status:** Installed by the Slack Expansion v1.0.0. Auto-numbered into `SOP-NNN-slack-listener-health.md` at install.
- **Triggered by:** "is Slack listening?", "did Slack drop?", "restart the Slack listener", or any sign the inbound queue isn't filling / outbound queue isn't draining.
- **References:** `runtime/index.js` (the listener), [[SOP-slack-post-message]], [[SOP-slack-incoming-routing]].

## Purpose

Confirm whether the Slack Socket Mode listener process is alive, identify why it isn't if it's down, and restart it. Surface OS notification to the user if `SLACK_NOTIFY_OS=true` and the listener is dead.

## How to check (macOS)

### 1. launchd-managed (autostart enabled)

```bash
launchctl list | grep mypka-slack
```

Expected output:

```
1234   0   com.mypka.slack-listener
```

The first column is the PID. If it's `-` instead of a number, launchd has the job loaded but the process isn't running (it's between restarts or crashed). If the second column is non-zero, the last exit was an error.

### 2. Foreground (start.command launched from Finder)

```bash
pgrep -fl "node .*Expansions/slack/runtime/index.js"
```

Should print one PID + the command line. Empty output → listener is not running.

### 3. Heartbeat in the log

```bash
tail -n 20 /tmp/mypka-slack-listener.log
```

The listener prints `[mypka-slack] heartbeat <ISO ts>` every 60 seconds. If the most recent heartbeat is older than 90 seconds, assume the listener is dead.

### 4. Inbound queue mtime

```bash
ls -lt "Team Inbox/slack-incoming/" | head
```

If the listener is alive AND messages are arriving, the most recent file mtime should match the most recent inbound. If you DM'd the bot 30 seconds ago and there's no new file, the listener is missing events.

## How to check (Linux)

Same as macOS but with `systemd` if that's how it was launched, or `pgrep` for foreground. Logs go wherever the user redirected them; default is stdout/stderr of the foreground terminal.

## How to check (Windows)

```cmd
tasklist | findstr node
```

Look for a `node.exe` running with `Expansions\slack\runtime\index.js` as the script. If absent, the listener is down.

## How to restart

### macOS (launchd)

```bash
launchctl kickstart -k gui/$UID/com.mypka.slack-listener
```

Or, full reload:

```bash
launchctl unload ~/Library/LaunchAgents/com.mypka.slack-listener.plist
launchctl load   ~/Library/LaunchAgents/com.mypka.slack-listener.plist
```

### macOS (foreground)

Close the Terminal window running `start.command`. Double-click `start.command` again from Finder.

### Linux

Re-run `bash Expansions/slack/scripts/start.sh` (background it with `&` and `disown` if needed). Or use systemd-managed unit if you set one up.

### Windows

Re-run `Expansions\slack\scripts\start.bat`.

## Diagnosing why it died

1. **Token revoked.** Check `tail -n 50 /tmp/mypka-slack-listener.err`. Look for `invalid_auth`. Resolution: regenerate tokens at api.slack.com, update `.env`, restart.
2. **Network blip.** The Slack SDK auto-reconnects from transient drops. If the listener died after a long disconnect, restart manually.
3. **Node crashed.** `tail -n 100 /tmp/mypka-slack-listener.err` for the stack. Common: out-of-memory in long-running sessions (very rare for this workload), file-system permission errors.
4. **Disk full.** `df -h ~`. The listener writes inbound files to your myPKA; if the disk is full it will crash on write.
5. **`.env` deleted/corrupted.** Listener startup checks for `SLACK_BOT_TOKEN` and `SLACK_APP_TOKEN`; if either is empty, it exits with FATAL.

## Surface to user

If the listener is dead and `SLACK_NOTIFY_OS=true`, fire an OS notification: `myPKA Slack: listener is down — open Larry to restart.`

If `SLACK_NOTIFY_OS=false`, surface the issue to Larry at his next session via a session-log entry. Larry will tell the user.

## Hard rules

- **NEVER auto-restart silently in a way that masks a recurring crash.** If the listener has crashed more than 3 times in 10 minutes (visible in launchd's exit-status counter), stop trying to restart and surface the issue to the user. ThrottleInterval in the plist already does this at 10s minimum spacing — Mack adds a soft check before manual kickstart.
- **NEVER expose tokens in any error report.** When writing diagnostics to the session-log, redact any line that contains `xoxb-` or `xapp-` substrings.

## When this SOP is invoked

- User says "is Slack listening?" or similar.
- Inbound queue hasn't moved despite the user DM'ing the bot.
- Outbound queue is piling up and not draining.
- Mack notices `.error` files in `slack-outgoing/.error` accumulating.
- After any system reboot or laptop sleep cycle (launchd should auto-restart, but verify).
