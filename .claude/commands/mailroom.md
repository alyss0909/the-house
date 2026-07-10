---
name: mailroom
description: Read Studio/Mailroom/MAILROOM.md, act on every ticked box, and log it back. Checked Put-away box → archive that Gmail message (remove INBOX only). Checked Needs-reply box → draft a reply in Alyssa's voice into that account's Gmail Drafts. Keyless — uses the Composio Gmail tools already in Larry's session; no server, no API keys. Say "/mailroom sweep" to re-scan all four inboxes and refill the Put-away list.
user_invocable: true
---

# /mailroom — the desk that acts on ticked boxes

Alyssa ticks boxes in `Studio/Mailroom/MAILROOM.md` (Obsidian checkboxes = the click; the saved file = the notice). This command reads that file and does the work with the Composio Gmail tools already in session. Nothing sends or deletes.

Account slug → Composio account id (re-list via COMPOSIO_MANAGE_CONNECTIONS if ids ever drift):
`personal` = accoleman100@gmail.com = `gmail_pubble-mentum` ·
`support` = productiveentrepreneurteam@gmail.com = `gmail_access-stilly` ·
`alyssa` = alyssa@alyssacoleman.ca = `gmail_wende-elbert` ·
`wellness` = alyssacolemanwellness@gmail.com = `gmail_hangul-macaca`

## One pass (default)

1. **Read** `Studio/Mailroom/MAILROOM.md`.
2. **Archive.** For each `- [x]` line under `## 📥 Put away` carrying `<!--arc:<acct>:<id>-->` that is NOT yet marked ` ✓ archived`:
   - Call `GMAIL_BATCH_MODIFY_MESSAGES` (account = the slug's id) with `removeLabelIds:["INBOX"]`, batching all ids for the same account into one call.
   - Edit the line to append ` ✓ archived`.
3. **Draft.** For each `- [x]` line under `## ✍️ Needs reply` carrying `<!--draft:<acct>:<threadId>-->` not yet marked ` ✓ drafted`:
   - Write the reply yourself in Alyssa's voice (load the Voice desk if it's a customer/sales reply; a quick friendly note otherwise). Body only, no subject.
   - Call `GMAIL_CREATE_EMAIL_DRAFT` with `{ user_id:"me", thread_id:<threadId>, body:<text> }` on that account. Leave subject empty so it stays in-thread.
   - Edit the line to append ` ✓ drafted` and show Alyssa the drafted body in chat.
4. **Tasks.** A `- [x]` under `## ✅ Your tasks` needs no Gmail action — just leave it checked.
5. **Log.** Append one line per action to `## Mailroom reacts`:
   `- [YYYY-MM-DD HH:MM] Larry · <archived N from acct | drafted reply to X> · done`
6. **Report** what changed in chat. Never send an email; drafts only. Never delete; archive removes INBOX only.

## Sweep mode ("/mailroom sweep")

Rebuild the Put-away list from live mail:
1. For each of the four accounts, `GMAIL_FETCH_EMAILS` `in:inbox category:promotions` and `category:social` (ids + subject + sender, `verbose:false`). These are the safe-to-archive noise.
2. Drop anything that is a receipt, failed/declined payment, security alert, or from a real person (Primary/Updates are left out by only scanning promotions+social).
3. Rewrite `## 📥 Put away` as one `- [ ] <acct> · <Sender> — <Subject> <!--arc:<acct>:<id>-->` per message, newest first, grouped by account. Leave every box UNCHECKED — Alyssa decides.
4. Report the counts per inbox. Do not archive anything in sweep mode — only refill the list.

## Guardrails

- Only ever act on a box that is checked `[x]`. An unchecked box is "keep."
- Idempotent: the ` ✓ archived` / ` ✓ drafted` suffix means "already done" — never repeat it.
- Read the file from disk; if a tick seems missing, ask Alyssa to Ctrl-S in Obsidian and re-run (buffer-vs-disk race, same as `/loop`).
- Bulk historical clears (hundreds of old promotions) are a separate explicit action — confirm scope with Alyssa first, don't fold them into a normal pass.
