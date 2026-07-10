---
session_id: telegram-capture-mvp-handoff
entry_type: close-session
agent: larry
created: 2026-06-02T17:20:00-04:00
topic: telegram-capture-mvp
---

# Telegram capture MVP handoff

## Summary

Alyssa asked to review open tasks/projects/goals and talk through the Telegram automation idea. Larry found the open task `[[tsk-2026-06-01-004-telegram-claude-automation]]`, assigned to Mack, with details previously pending.

Alyssa then provided the actual product shape:

- Telegram should be the fast "send it here before I forget" capture chute.
- LLM/Claude should eventually sort captures to either Obsidian/myPKA or Notion Content Bank.
- Obsidian/myPKA is for personal/private knowledge: parenting, sensory activities, home/garden/office inspiration, personal research, random connected thoughts.
- Notion Content Bank is for team-visible execution: IG reels to recreate, hooks, carousel/reel/email ideas, PRC/client references, Back of House content angles, owner/status/action energy.
- Slash commands should override routing:
  - `/content`, `/notion`, `/prc`, `/boh` -> Notion Content Bank route
  - `/obsidian`, `/parenting`, `/home` -> Obsidian/myPKA route
- The dream is fast capture without drowning later: capture fast, let Claude sort, keep team stuff visible, keep personal stuff connected.

## What was created

Larry/Mack created a fast MVP helper in `Team Knowledge/scripts/`:

- `telegram-capture-mvp.py`
- `telegram-capture.env.example`
- [[Studio/Team Knowledge/scripts/telegram-capture-README]]
- `.gitignore` entries in `Team Knowledge/scripts/` for:
  - `telegram-capture.env`
  - `.telegram-capture-state.json`

The MVP is intentionally simple:

Telegram bot message -> local Python polling helper -> markdown capture file in `Team Inbox/` -> Telegram confirmation reply.

The MVP writes every capture to `Team Inbox/` first, with route hints in frontmatter. LLM classification and Notion writes are explicitly future layers.

## Current state

- Telegram bot was created through BotFather.
- Bot username: `ideaeaterbot`.
- Alyssa sent a test message from her phone.
- The local listener was not successfully started because the local command runner repeatedly hit a Windows sandbox refresh error.
- Because the BotFather token appeared in a screenshot during this session, the token should be treated as exposed and regenerated after the setup is proven.

## Handoff: finish the listener

Give this to whoever finalizes it:

> Please finish the local Telegram capture MVP in my myPKA folder. The helper files are in `Team Knowledge/scripts/`. Create `Team Knowledge/scripts/telegram-capture.env` from `telegram-capture.env.example`, paste the BotFather token into `TELEGRAM_BOT_TOKEN=...`, then run `telegram-capture-mvp.py` with Python from the myPKA root. Confirm that the test message already sent to `ideaeaterbot` creates a new markdown file in `Team Inbox/` and that Telegram replies with a saved confirmation. Once confirmed, ask me to regenerate the BotFather token because the first token was exposed in a screenshot, update `telegram-capture.env` with the new token, and run one final test.

Suggested run command from the myPKA root:

```powershell
python "Team Knowledge/scripts/telegram-capture-mvp.py"
```

If Windows does not find Python, use the bundled Codex Python path:

```powershell
"C:\Users\accol\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe" "Team Knowledge/scripts/telegram-capture-mvp.py"
```

Leave the terminal window open while capture should be active.

## Decisions

- Start with the fast MVP, not the full Notion/LLM classifier.
- First destination is `Team Inbox/`, not direct filing into PKM.
- Commands are route hints, not final routing automation yet.
- Notion Content Bank integration waits until the database and fields are confirmed.

## Open threads

- [ ] Start the local listener successfully.
- [ ] Verify the existing Telegram test message lands in `Team Inbox/`.
- [ ] Regenerate the Telegram bot token after proof-of-pipe.
- [ ] Update the real env file with the regenerated token.
- [ ] Decide whether the listener should remain manual, run at startup, or move to an always-on hosted setup.
- [ ] Later: add LLM classification and Notion Content Bank writes.

## Librarian notes

- No permanent routing rule was graduated yet; this is still an MVP implementation.
- The bot token itself must not be written into markdown notes, session logs, or tracked files.
- The `Team Knowledge/scripts/` location is acceptable for this MVP because the scaffold already contains maintenance scripts there, but future always-on services may deserve a separate external `Automations/` folder.

## Related

- `[[tsk-2026-06-01-004-telegram-claude-automation]]`
- `[[WS-004-inbox-processing]]`
- `[[SOP-003-keep-notes-to-journal]]`
