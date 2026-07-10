---
title: The Mailroom — desk charter
status: ACTIVE — created 2026-07-10
owner: Larry
zone: Studio
desk: Mailroom
---

# The Mailroom

The desk that keeps Alyssa's four inboxes clean so she stops avoiding them — no VA required. It triages daily, drafts the replies she has to send, holds her to the tasks only she can do, and pushes recurring noise out of the way before it piles up.

**Everything here is opinion until Alyssa acts.** Nothing sends, archives, or filters without her word.

## The four inboxes (Composio-connected)

| Inbox | Address | Composio account id |
|---|---|---|
| Personal | accoleman100@gmail.com | `gmail_pubble-mentum` |
| Support | productiveentrepreneurteam@gmail.com | `gmail_access-stilly` |
| Business | alyssa@alyssacoleman.ca | `gmail_wende-elbert` |
| Wellness | alyssacolemanwellness@gmail.com | `gmail_hangul-macaca` |

Account ids rotate on reconnect — always re-list via Composio, never hardcode from here.

## The mechanism (keyless — no server, no API keys)

The interface is [MAILROOM.md](MAILROOM.md): a gorgeous Obsidian note where Alyssa **ticks a checkbox** (the click) and the saved file (the notice) is read by the **`/mailroom`** command (`.claude/commands/mailroom.md`). Larry does the Gmail action with the Composio tools already in session — exactly the Content OS file+loop pattern, no standalone server and no Anthropic billing. A checked Put-away box archives that message; a checked Needs-reply box drafts the reply into Gmail Drafts. `dashboard.html` is kept only as the shareable artifact copy.

## The daily sweep

1. `/mailroom sweep` fetches each inbox and refills the Put-away list (promotions + social = safe noise; receipts, payments, security, and real people are left out).
2. A message only counts as *needs reply* if the **other person** sent the last real message. If Alyssa's side sent last, it's handled and drops — but the support auto-responder ("Hang tight. We're on it!") does **not** count as a reply.
3. Alyssa ticks boxes; `/mailroom` acts on them and logs to `## Mailroom reacts`.

## Doctrine

- **Archive = remove from inbox only, never delete.** Gmail search finds everything later. No archive-label taxonomy — she wants a clean inbox she can search.
- **Filters** (skip-inbox / label / mark-read) are standing config → show-and-tell + her explicit go before creating any. Live spec: [filter-plan.md](filter-plan.md).
- **Never auto-touch:** failed/declined payments, security alerts, the bookkeeper, real humans, paid-member join requests.
- Norah's Day (Montessori dailies) stays in the inbox unless she says otherwise.

## Open builds (highest-leverage first)

- **Access-recovery flow** — the "I can't log into my course" reply is her most-repeated human task. Self-serve reset link in the auto-responder + AI first-draft; she handles only edge cases.
- **Make bookkeeping statements unnecessary** — see filter-plan / session notes; goal is Dennis never needs a manually downloaded BMO PDF (delegate access or a bank feed).
- **Scheduling** — server-side daily run (OS cron + API, never an app-open-dependent task), refreshes the dashboard each morning.

See memory: [[project_daily_inbox_manager]].
