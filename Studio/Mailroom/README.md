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

The interface is [MAILROOM.md](MAILROOM.md): a card-based Obsidian dashboard built on the exact `db-card`/`db-react-btn` grammar from the Content OS Command Center (`Studio/Content/dashboard/`, see `01 Concepts.md`'s Choose/Reject/Save buttons for the reference pattern). Clicking a card's button is instant — Dataview's JS runs inside Obsidian itself (not a sandboxed webview), so it locks/recolors the card immediately and writes one line to a hidden `## Mailroom state` ledger. The **`/mailroom`** command (`.claude/commands/mailroom.md`) then reads that ledger and does the real Gmail work with the Composio tools already in Larry's session — no standalone server, no API keys, no Anthropic billing (Larry drafts in-session). `dashboard.html` (an artifact-only copy, buttons non-functional there) and a checkbox-based draft are retired; the ledger+button version is the one true interface.

## The daily sweep

1. `/mailroom sweep` fetches each inbox and writes fresh `<!--away:...-->` data lines (promotions + social = safe noise; receipts, payments, security, and real people are left out) — these render as new click-to-queue cards on next load.
2. A message only counts as *needs reply* if the **other person** sent the last real message. If Alyssa's side sent last, it's handled and drops — but the support auto-responder ("Hang tight. We're on it!") does **not** count as a reply.
3. Alyssa clicks cards; `/mailroom` acts on every `queued` ledger entry and logs to `## Mailroom reacts`.

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
