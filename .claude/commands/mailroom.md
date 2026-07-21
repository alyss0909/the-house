---
name: mailroom
description: Read the Notion Mailroom database and act on everything Alyssa has handed over. A row set to "For Larry" gets a reply drafted into that account's Gmail Drafts. A noise row with "Archive it" checked gets INBOX removed. Keyless — uses the Composio Gmail tools already in Larry's session. Say "/mailroom sweep" (or "clear the mailroom") to also re-scan all four inboxes and add fresh noise rows.
user_invocable: true
---

# /mailroom — act on the Notion board

**The board is the Notion Mailroom database**, under House Control Room.
Data source: `collection://ddf15d60-e8b8-40be-a6e9-1c99ba7452bf`

The Obsidian `Studio/Mailroom/MAILROOM.md` dashboard and its `## Mailroom state`
ledger are **retired as of 2026-07-20**. Never read them for state again.

## The two-field contract (do not blur these)

- **`Status`** is what *Alyssa* clicked. Four values:
  - `For Alyssa` — it landed, her call, not yours.
  - `For Larry` — she handed it over. **This is your work queue.**
  - `Drafted` — you wrote it, it's in her Gmail Drafts, back in her court.
  - `Done` — finished, drops off her board.
- **`Filed`** is a date meaning **the row is finished and nobody has anything left
  to do on it.** It is the LAST thing that happens, set by whoever closes it out.
  Alyssa filters her board on **`Filed` is empty**, so a Filed date makes the row
  disappear from her screen.
  **Filed goes on ONLY at the same time as `Status = Done`. Never on `Drafted`.**
  A draft waiting for her to read and send is an OPEN job, not a finished one —
  filing it hides work she still owes. That mistake was made on 2026-07-20 and
  buried four drafts that had been waiting a week.
  Blank Filed also still means the real Gmail action has not happened, so never
  set it on an unverified action either.

`Tell Larry` is her free-text instruction on a row. Always read it before writing.
Blank means use judgment.

## Account slug to Composio account id

Re-list via `COMPOSIO_MANAGE_CONNECTIONS` if ids drift (they rotate on reconnect):
`personal` = accoleman100@gmail.com = `gmail_pubble-mentum` ·
`support` = productiveentrepreneurteam@gmail.com = `gmail_access-stilly` ·
`business` = alyssa@alyssacoleman.ca = `gmail_wende-elbert` ·
`wellness` = alyssacolemanwellness@gmail.com = `gmail_hangul-macaca`

Note `gmail_byword-woodsy` (ameliegreen09@gmail.com) is also connected and is
**not** one of the four Mailroom inboxes. Never touch it.

## One pass (default)

1. **Query** the data source for actionable rows:
   - `Type = 'reply'` AND `Status = 'For Larry'`
   - `Type = 'noise'` AND `Archive it = '__YES__'` AND `Filed` is empty
   - Task rows are never yours. She self-marks those Done.

2. **Reply rows.**
   - Read `Tell Larry`, `Details`, and the source email the reply-word came from.
     For a reply-word (VAULT, SWEET, STATS…), you MUST trace it back to the
     broadcast that carried it before writing. See
     [[Studio/Mailroom/keyword-reply-voice]] — the reply inherits the feature and
     the reason-to-join-now from that specific email. Never write one generically.
   - Write the body in Alyssa's voice. Body only, no subject, so it stays in-thread.
   - `GMAIL_CREATE_EMAIL_DRAFT` with `{ user_id:"me", thread_id:<threadId>, body:<text> }`
     on that account.
   - Show her the drafted body in chat.
   - Set `Status = Drafted`. **Leave `Filed` EMPTY** — she still has to read and
     send it, so it stays on her board. **Never send.**

3. **Noise rows.**
   - If `Message id` is empty, resolve it first: `GMAIL_FETCH_EMAILS` with
     `in:inbox` plus the row's search terms, then match sender AND subject against
     the row before accepting the id. Write the id back to `Message id`.
     If no confident single match, skip the row and say so. Never guess.
   - Batch all resolved ids for the same account into one
     `GMAIL_BATCH_MODIFY_MESSAGES` with `remove_label_ids:["INBOX"]`.
   - **Verify before claiming success.** Gmail's batch call does not confirm
     per-message. Re-query `in:inbox` and confirm the ids are gone.
   - Only then set `Status = Done` and `Filed = today`.

4. **Report** what changed in chat, per inbox. Never send an email; drafts only.
   Never delete; archive removes INBOX only.

## Sweep mode ("/mailroom sweep", "clear the mailroom")

1. For each of the four accounts, `GMAIL_FETCH_EMAILS` on `in:inbox category:promotions`
   and `in:inbox category:social`. These are the safe-to-archive noise. Receipts,
   payments, security, and real people live in Primary/Updates and are never pulled.
2. De-dupe against existing rows by `Message id` before creating anything.
3. Create one row per new message with:
   `Email` = sender · `Details` = subject · `Inbox` = slug · `Type` = noise ·
   `Message id` = the real id · `Gmail link` = direct thread URL ·
   `When` = the message date · `Status` = For Alyssa · `Archive it` = checked ·
   `Filed` = **empty** · **icon = ✈️ paper airplane**
4. Report counts per inbox.

## Standing rules

- **Every new row gets the paper airplane icon.** Her call, 2026-07-20. No exceptions.
- Only ever act on `For Larry` or a checked-and-unpostmarked noise row.
  `Drafted`, `Done`, and anything already Filed are finished. Never repeat.
- **`Archive it` on a `reply` or `task` row means nothing.** Those checkboxes are
  leftovers from the default-checked import. Only `Type = noise` is ever archived.
- **Never auto-touch:** failed or declined payments, security alerts, the bookkeeper
  (Dennis Dampil), real humans, paid-member join requests. If one appears in a noise
  pull, drop it and say so.
- If a row is malformed or an id 404s, skip it, name it in the report, and leave
  `Filed` empty rather than guessing.
- Bulk historical clears (the hundreds of old promotions going back years, not just
  the recent window) are a separate explicitly-confirmed action. Never fold them
  into a normal pass.
- There is no push notification from Notion. This command only runs when Alyssa
  asks. Do not tell her a click was picked up automatically.
