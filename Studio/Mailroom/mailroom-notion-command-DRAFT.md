---
title: /mailroom repoint to Notion — DRAFT proposal (not activated)
status: DRAFT — for Larry to show Alyssa. Do NOT overwrite the live command.
owner: Mack
zone: Studio
desk: Mailroom
---

# /mailroom repoint to Notion — DRAFT

This is a **proposal** for how the live `.claude/commands/mailroom.md` would
be rewritten to read the Notion Mailroom database instead of the Obsidian
`## Mailroom state` ledger. **Nothing here is activated.** The live command
and the Obsidian [[MAILROOM]] dashboard keep running untouched until Alyssa
says switch. Keyless / in-session, same as today — the runner uses the
Composio Gmail tools already in Larry's session; no API keys added to the
command itself.

Relationship to the webhook bridge ([[notion-bridge/SETUP]]): the bridge is
the near-instant path; **this polled command is the durable fallback.** They
coexist. A button sets `Status = queued`; if the bridge handles it, Status is
already `handled` by the time this runs (nothing to do); if the bridge was
down, this command catches the still-`queued` row and does the Gmail work.
Same guardrails, same end state.

## What changes vs. the live command

| Live (Obsidian) | Proposed (Notion) |
|---|---|
| Read `MAILROOM.md`, parse `## Mailroom state` HTML-comment ledger | Query the Notion Mailroom DB for rows where `Status = queued` |
| `state:reply:...:queued` / `state:archive:...:queued` lines | `Type = reply` + `Status = queued` / `Type = noise` + `Status = queued` |
| Flip ledger line `queued` -> `handled` via string-replace | `NOTION_UPDATE_PAGE` set `Status = handled` on that row |
| Log to `## Mailroom reacts` | (optional) still log to session, or a Notion "Log" note |
| Sweep writes `<!--away:-->` lines into the file | Sweep creates `Type = noise, Status = new` rows in the DB |

## Proposed command body (draft)

```
1. Query the Notion Mailroom database (data source under House Control Room)
   for every row where Status = queued. Also read Type, Inbox, Subject,
   Name, Tag, and Gmail link on each. (Composio: NOTION_QUERY_DATABASE with a
   filter on Status = queued.)

2. For each queued row:
   - Reply rows (Type = reply):
       * Write the reply in Alyssa's voice (load the Voice desk for
         customer/sales-facing). Body only, no subject.
       * Resolve the Gmail thread from the row's Gmail link query (or a
         stored threadId if we add that column later).
       * GMAIL_CREATE_EMAIL_DRAFT on that account (in-thread, subject empty).
       * Show her the drafted body in chat.
       * NOTION_UPDATE_PAGE: set Status = handled on that row. Final.
   - Noise rows (Type = noise):
       * Batch all queued noise rows for the same Inbox into one
         GMAIL_BATCH_MODIFY_MESSAGES removeLabelIds:["INBOX"].
       * NOTION_UPDATE_PAGE: set Status = handled on each. Final.
   - Task rows never appear here (they go straight to Status = done,
     self-serve, never Larry's job).

3. Report what changed in chat. Never send an email; drafts only. Never
   delete; archive removes INBOX only.
```

## Sweep mode (draft)

```
"/mailroom sweep": for each of the four accounts, GMAIL_FETCH_EMAILS
in:inbox category:promotions and category:social. For each message not
already a row, NOTION_CREATE_NOTION_PAGE in the Mailroom DB with
Type = noise, Status = new, Inbox = <acct>, Name = sender, Subject = subject,
Tag = Noise, Gmail link = built from the sweep pattern. Skip messageIds
already present (query first to de-dupe). Report counts per inbox.
```

## Guardrails (unchanged from live)

- Only ever act on rows where `Status` is exactly `queued`. `handled` / `done`
  = already resolved, never repeat.
- Never auto-touch failed/declined payments, security alerts, the bookkeeper,
  real humans, paid-member join requests. (Rows tagged Money / Security /
  Revenue are never archived — the bridge enforces this too.)
- Bulk historical clears are a separate explicit action; confirm scope with
  Alyssa first, never fold into a normal pass.
- If a row is malformed or an id 404s, skip it, note it in the report, leave
  Status untouched.

## Account slug -> Composio account id

Re-list via COMPOSIO_MANAGE_CONNECTIONS if ids drift (they rotate on reconnect):
`personal` = accoleman100@gmail.com = `gmail_pubble-mentum` ·
`support` = productiveentrepreneurteam@gmail.com = `gmail_access-stilly` ·
`business` = alyssa@alyssacoleman.ca = `gmail_wende-elbert` ·
`wellness` = alyssacolemanwellness@gmail.com = `gmail_hangul-macaca`

## Activation (when Alyssa says go — NOT now)

Replace the body of `.claude/commands/mailroom.md` with the Notion version
above, or keep both behind a flag during a transition window. Retire the
Obsidian `## Mailroom state` ledger only after she confirms the Notion board
is the one she uses.
