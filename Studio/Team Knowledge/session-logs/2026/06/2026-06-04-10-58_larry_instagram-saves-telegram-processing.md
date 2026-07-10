---
agent_id: larry
session_id: instagram-saves-telegram-processing
timestamp: 2026-06-04T14:58:00Z
type: close-session
linked_sops: []
linked_workstreams: [WS-004-inbox-processing]
linked_guidelines: []
---

# Instagram Saves to Telegram Processing

## Context

Alyssa asked whether Larry could read a Notion page titled "The Instagram Saves Engine" and wanted a practical breakdown for Android phone + Windows desktop use. After reviewing the page through Notion, Alyssa realigned away from browser-cookie automation because letting AI near a logged-in browser felt sketchy.

## What we did

- **Pax** fetched and summarized the Notion page: the useful system is a two-layer pipeline where raw Instagram saves are captured first, then processed later into content ideas.
- **Larry** translated the Mac/Claude-specific instructions into the Android + Windows reality and flagged that Instagram session-cookie capture is the security-sensitive part.
- **Mack** updated [[tsk-2026-06-01-004-telegram-claude-automation]] so the Telegram plan borrows the processing/ideation layer from the Instagram Saves Engine while avoiding browser-cookie capture.
- **Mack** added a capture convention to `Team Knowledge/scripts/telegram-capture-README.md`: Instagram/social URLs should include intent tags like `#recreate`, `#repost`, `#design`, `#content`, and `#hook`.
- **Larry** closed the session and recorded the realignment for future work.

## Decisions made

- **Question:** Should Alyssa use AI/browser access or Instagram cookies to automate saved-post capture?
  **Decision:** No for now. Telegram remains the safer capture layer; AI processes only after Alyssa sends the save through Telegram.

- **Question:** Which part of the Instagram Saves Engine should carry forward?
  **Decision:** Keep the processing architecture: raw captures stay separate from polished ideas, processing happens in batches/on demand, and Alyssa approves what becomes usable content.

- **Question:** How should Telegram captures preserve why a post was saved?
  **Decision:** Send the URL with lightweight intent tags, starting with `#recreate`, `#repost`, `#design`, `#content`, and `#hook`.

## Insights

- The core value of the Instagram Saves Engine is not the risky capture method; it is the separation of capture, processing, approval, and content-idea storage.
- Intent tags are a small habit that can save a lot of later interpretation work. A URL alone says "this mattered"; `#hook #content` says why.

## Realignments

- "cool so maybe we acutally just take the parts of this that are about PROCESSING the ideas since i already have a plan for how i'll capture the saves with telegram (roughly)"
- "i want to be sure to use dif tags like recreate, or repost or design or content or hook etc along with sending the URL so that we can already have some insight on what my intention with the posts are when they come over from telegram"

## Open threads

- [ ] Alyssa regenerates the `@ideaeaterbot` BotFather token and updates `Team Knowledge/scripts/telegram-capture.env` without pasting the token into chat.
- [ ] Mack runs one final Telegram test after token regeneration: health check, Alyssa sends one fresh tagged social URL, then Mack runs one-time capture.
- [ ] Next Telegram design pass should decide whether intent tags remain freeform hashtags or become a normalized routing field during inbox processing.

## SSOT / structural fixes

- Updated [[tsk-2026-06-01-004-telegram-claude-automation]] as the canonical Telegram plan instead of creating a duplicate planning note.
- Added the new session log to the Telegram task's `linked_session_logs`.
- Avoided a broken wikilink for the external Notion page title by keeping it as plain text.
- Checked touched-file references to [[WS-004-inbox-processing]], [[SOP-003-keep-notes-to-journal]], [[SOP-012-codex-windows-sandbox-recovery]], and the related Telegram session logs; all referenced local files exist.

## Next steps

- Start the next Telegram session by finishing the token regeneration/final proof test.
- After proof test, process one tagged Instagram URL end-to-end through Team Inbox to confirm that the intent tags survive into triage.

## Cross-links

- [[2026-06-02-17-20_larry_telegram-capture-mvp-handoff]]
- [[2026-06-03-22-21_larry_telegram-mvp-and-open-loop-realignment]]
- [[2026-06-03-22-31_larry_telegram-mvp-wrap]]
