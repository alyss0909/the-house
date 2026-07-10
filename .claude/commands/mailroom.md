---
name: mailroom
description: Read Studio/Mailroom/MAILROOM.md's state ledger and act on every entry marked "queued". A queued reply drafts into that account's Gmail Drafts. A queued archive removes INBOX from that Gmail message. Keyless — uses the Composio Gmail tools already in Larry's session; no server, no API keys. Say "/mailroom sweep" to re-scan all four inboxes and refill the Put-away cards.
user_invocable: true
---

# /mailroom — act on every clicked card

Alyssa clicks a card in `Studio/Mailroom/MAILROOM.md` (a dataviewjs button, styled like her Content OS `01 Concepts.md` Choose/Reject/Save buttons). The click instantly locks the card and writes one line to the hidden `## Mailroom state` ledger at the bottom of the file:

```
<!--state:reply:<acct>:<threadId>:queued-->
<!--state:archive:<acct>:<messageId>:queued-->
<!--state:task:<id>:queued-->   (no Gmail action — just her checklist)
```

This command reads that ledger and does the real work.

Account slug → Composio account id (re-list via COMPOSIO_MANAGE_CONNECTIONS if ids ever drift):
`personal` = accoleman100@gmail.com = `gmail_pubble-mentum` · `support` = productiveentrepreneurteam@gmail.com = `gmail_access-stilly` · `business`/`alyssa` = alyssa@alyssacoleman.ca = `gmail_wende-elbert` · `wellness` = alyssacolemanwellness@gmail.com = `gmail_hangul-macaca`

## One pass (default)

1. **Read** `Studio/Mailroom/MAILROOM.md`. Find every `<!--state:<kind>:<...>:queued-->` line.
2. **Reply kind** (`state:reply:<acct>:<threadId>:queued`):
   - Write the reply in Alyssa's voice (load the Voice desk for anything customer/sales-facing). Body only, no subject.
   - Call `GMAIL_CREATE_EMAIL_DRAFT` with `{ user_id:"me", thread_id:<threadId>, body:<text> }` on that account (leave subject empty so it stays in-thread).
   - Show Alyssa the drafted body in chat.
   - Flip that exact ledger line's status from `queued` to `done` (string-replace, keep the rest of the line identical).
3. **Archive kind** (`state:archive:<acct>:<messageId>:queued`):
   - Batch all queued archive ids for the same account into one `GMAIL_BATCH_MODIFY_MESSAGES` call with `removeLabelIds:["INBOX"]`.
   - Flip each corresponding ledger line to `done`.
4. **Task kind** (`state:task:<id>:queued`): no Gmail action — just flip to `done`.
5. **Log.** Append one line per action to `## Mailroom reacts` (insert directly under the heading, same format as existing entries):
   `- [YYYY-MM-DD HH:MM] <archived N from acct | drafted reply to X | task done: X>`
6. **Report** what changed in chat. Never send an email; drafts only. Never delete; archive removes INBOX only.

## Sweep mode ("/mailroom sweep")

Rebuild the Put-away cards from live mail:
1. For each of the four accounts, `GMAIL_FETCH_EMAILS` `in:inbox category:promotions` and `category:social` (ids + subject + sender, `verbose:false`). These are the safe-to-archive noise (receipts, payments, security, and real people live in Primary/Updates and are never touched).
2. Write one `<!--away:<acct>:<messageId>:<Sender> — <Subject>-->` line per message into the file (anywhere before `## Mailroom state` is fine — the dataviewjs block regex-scans the whole file for these). The dashboard's dataviewjs picks them up as click-to-queue cards on next render — no card is pre-checked, Alyssa decides.
3. Do not set any `state:` lines in sweep mode — only add `away:` data lines. Report counts per inbox.

## Guardrails

- Only ever act on a ledger line whose status is exactly `queued`. `done` = already handled, never repeat.
- If a ledger line looks malformed or a referenced id 404s, skip it, note it in the chat report, and leave its status untouched rather than guessing.
- Bulk historical clears (hundreds of old promotions built up over years, not just the last 14 days) are a separate explicit action — confirm scope with Alyssa first, don't fold them into a normal `/mailroom` or `/mailroom sweep` pass.
