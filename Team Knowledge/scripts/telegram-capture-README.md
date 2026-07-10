# Telegram Capture MVP

This helper turns Telegram bot messages into markdown captures in `Notebook/Inbox/`.

## Setup

1. Copy `telegram-capture.env.example` to `telegram-capture.env`.
2. Paste the BotFather token into `telegram-capture.env`.
3. Run:

```powershell
python "Team Knowledge/scripts/telegram-capture-mvp.py"
```

Leave the window open while you want Telegram capture running.

For a quick check that the token works:

```powershell
python "Team Knowledge/scripts/telegram-capture-mvp.py" --health-check
```

For a one-time capture test:

```powershell
python "Team Knowledge/scripts/telegram-capture-mvp.py" --once
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

## Security

Do not commit or share `telegram-capture.env`. If a token appears in a screenshot or chat, regenerate the token in BotFather after setup.
