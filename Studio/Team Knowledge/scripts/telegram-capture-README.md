# Telegram Capture MVP

This helper turns Telegram bot messages into markdown captures in `Notebook/Inbox/`.

## Setup

1. Copy `telegram-capture.env.example` to `C:\Users\<you>\.config\telegram-capture\telegram-capture.env` (secrets live outside the OneDrive-synced vault as of 2026-07-10 — see [[Studio/Team Knowledge/session-logs/2026/07/2026-07-10-09-15_mack_telegram-secrets-out-of-vault]]). Do not place it inside this `scripts/` folder.
2. Paste the BotFather token into that file.
3. Run:

```powershell
python "Studio/Team Knowledge/scripts/telegram-capture-mvp.py"
```

Leave the window open while you want Telegram capture running.

For a quick check that the token works:

```powershell
python "Studio/Team Knowledge/scripts/telegram-capture-mvp.py" --health-check
```

For a one-time capture test:

```powershell
python "Studio/Team Knowledge/scripts/telegram-capture-mvp.py" --once
```

## Commands

- `/content`, `/notion`, `/prc`, `/boh` route to the Notion Content Bank queue.
- `/obsidian`, `/parenting`, `/home` route to the Obsidian / myPKA queue.
- No command saves as `needs-routing`.

For Instagram/social inspiration, send the URL with one or more intent tags so processing can tell why the post mattered:

```text
https://www.instagram.com/reel/... #hook #content
```

Useful starting tags: `#recreate`, `#repost`, `#design`, `#content`, `#hook`.

Every capture lands in `Notebook/Inbox/` first. Notion writes and LLM classification are the next layer after the MVP pipe is confirmed.

## Running unattended (Windows Task Scheduler)

The live scheduled task is named `TelegramCaptureBot` (logon trigger, runs `python.exe` directly against this script). A second, older task named `myPKA - Telegram Capture Bot` exists disabled and pointed at a pre-restructure path — leave it disabled.

The script writes its own log to `C:\Users\<you>\.config\telegram-capture\telegram-capture.log` (timestamped, append-only) so there's a diagnostic trail even though the scheduled task itself has no stdout/stderr redirect.

## Security

Do not commit or share `telegram-capture.env`. If a token appears in a screenshot or chat, regenerate the token in BotFather after setup.
