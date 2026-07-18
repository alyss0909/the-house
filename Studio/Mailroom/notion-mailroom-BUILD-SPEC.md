---
title: Notion Mailroom — build spec (for Larry to execute via Composio)
status: DRAFT — additive, do not touch the live Obsidian /mailroom
owner: Mack
zone: Studio
desk: Mailroom
---

# Notion Mailroom — build spec

> **BUILT 2026-07-17 — current truth, read this first.** The database is live
> under House Control Room. Database `ee22093d51044162800354e40cb2bad4` · data
> source `ddf15d60-e8b8-40be-a6e9-1c99ba7452bf`. Type options `reply` / `task`
> / `noise` (as in the seed tables below). Three views: **Needs reply**,
> **Your tasks**, **Put away**. 24 real items seeded. worker.js
> `MAILROOM_DB_IDS` points at this id. (A grouped single-view rebuild was tried
> 2026-07-17 and reverted — Alyssa preferred the three-tab layout.) The button
> hand-step (section 5) is still pending Alyssa.

The Notion mirror of the Obsidian [[MAILROOM]] dashboard. Mack scoped and
seeded it here; **Larry runs the actual Notion writes in his Composio
session** (Mack's subagent session has no Notion access). Additive only —
the Obsidian dashboard and its `/mailroom` command stay live in parallel.

Split of labor, forced by two hard Notion-API limits:
- **Programmatic (Larry via Composio):** create the database, all non-button
  properties, and seed the rows.
- **Notion UI, by hand (unavoidable):** the three button properties and the
  three filtered views. Neither buttons nor views exist in the public Notion
  API — Composio cannot create them. Steps for both are below.

## 1. Create the database

- Parent page: **House Control Room** (`39fc8b43-e565-81b3-b559-c0fb9c6468bd`),
  so it sits beside the existing House Operations Board and Agent Tasks DB.
- Title: **Mailroom**
- No emoji anywhere (locked design rule). Minimal copy.

## 2. Properties (create all of these via Composio)

| Property | Type | Options / notes |
|---|---|---|
| **Name** | Title | The "who" — sender or task text |
| **Inbox** | Select | `personal`, `support`, `business`, `wellness` |
| **Subject** | Text | The `subj` field |
| **Type** | Select | `reply`, `task`, `noise` |
| **Status** | Select | `new`, `queued`, `done`, `handled` — the property buttons flip and the runner reads |
| **Gmail link** | URL | Built from the sweep pattern; exact strings in the seed table |
| **When** | Text | e.g. `Jul 10 · waiting on you` |
| **Tag** | Text | `Draft` / `Options` / `Money` / `Revenue` / `Security` / `Noise` etc. |

**Status meanings (match [[README]] exactly):**
- `new` — freshly swept, untouched.
- `queued` — she clicked; waiting on Larry / the bridge to do the real Gmail
  work. Reversible.
- `done` — self-serve task complete, no Gmail action ever needed. Reversible.
- `handled` — Larry/the bridge actually drafted or archived. Final.

Button properties are added in the UI (section 5) — they are not in this
table because the API can't create them.

## 3. Seed rows — Needs reply (Type = reply, Status = new)

| Name | Inbox | Subject | Tag | When | Gmail link |
|---|---|---|---|---|---|
| Dennis Dampil — bookkeeper | business | Needs your June 2026 bank statements to close the books. | Draft | Jul 10 · waiting on you | `https://mail.google.com/mail/u/?authuser=alyssa%40alyssacoleman.ca#search/Dennis%20bank%20statements%20June` |
| Julien — Routine AI | support | Partnership proposal, sent demo videos, waiting on you. | Options | Jul 5 · your call | `https://mail.google.com/mail/u/?authuser=productiveentrepreneurteam%40gmail.com#search/Julien%20Routine%20AI%20partnership` |
| Bundles That Benefit | business | Online Business Bundle 2026 invite — drafted, review before sending. | Draft | Jul 13 · drafted | `https://mail.google.com/mail/u/?authuser=alyssa%40alyssacoleman.ca#search/Online%20Business%20Bundle%202026` |
| Natalie Tomasik | business | Replied "Vault" to your Soft Sunday email — needs your call on what to send. | Your call | Jul 12 · found by manual audit | `https://mail.google.com/mail/u/?authuser=alyssa%40alyssacoleman.ca#search/Natalie%20Tomasik%20Vault` |
| Lily | business | Replied "Vault" to your Soft Sunday email — needs your call on what to send. | Your call | Jul 12 · found by manual audit | `https://mail.google.com/mail/u/?authuser=alyssa%40alyssacoleman.ca#search/Lily%20Vault` |
| Gisele Plamondon | support | Payment info error on her account — drafted, review before sending. | Draft | Jul 14 · drafted | `https://mail.google.com/mail/u/?authuser=productiveentrepreneurteam%40gmail.com#search/Gisele%20Plamondon%20update%20payment%20info` |
| Pamela Dunn | support | September Summit call — drafted, review before sending. | Draft | Jul 14 · drafted | `https://mail.google.com/mail/u/?authuser=productiveentrepreneurteam%40gmail.com#search/Pamela%20Dunn%20interview%20summit` |
| Julia Briski (IHN) | wellness | Asking if you're ready for another Co-op student — old thread, still unread. | New | Jul 14 · found by sweep | `https://mail.google.com/mail/u/?authuser=alyssacolemanwellness%40gmail.com#search/Julia%20Briski%20Co-op%20student` |

## 4. Seed rows — Your tasks (Type = task, Status = new)

| Name | Inbox | Subject | Tag | Gmail link |
|---|---|---|---|---|
| Send June bank statements to Dennis | business | Pairs with the draft above. | Money | `https://mail.google.com/mail/u/?authuser=alyssa%40alyssacoleman.ca#search/Dennis%20bank%20statements%20June` |
| Approve Ananya into Back of House group | wellness | She paid $198 and is waiting at the door. | Revenue | `https://mail.google.com/mail/u/?authuser=alyssacolemanwellness%40gmail.com#search/Ananya%20Totiger%20Back%20of%20House` |
| Notionsocial card failing — $144 | business | Update the card or cancel before cut-off. | Money | `https://mail.google.com/mail/u/?authuser=alyssa%40alyssacoleman.ca#search/Notionsocial%20payment%20unsuccessful` |
| Back of House — 2 failed payments | business | Check ThriveCart dunning — recoverable revenue. | Revenue | `https://mail.google.com/mail/u/?authuser=alyssa%40alyssacoleman.ca#search/Failed%20payment%20Back%20of%20House` |
| Close out Camila on Upwork | business | $460 paid. Reply + leave feedback. | Wrap-up | `https://mail.google.com/mail/u/?authuser=alyssa%40alyssacoleman.ca#search/Camila%20Upwork` |
| Google security check | personal | "Someone tried to view saved passwords." 60-sec check. | Security | `https://mail.google.com/mail/u/?authuser=accoleman100%40gmail.com#search/Critical%20security%20alert%20passwords` |
| Horizon workflow — fixed | support | Commit 8a47c5d landed. Watch tomorrow's run go green. | Handled by Larry | `https://mail.google.com/mail/u/?authuser=productiveentrepreneurteam%40gmail.com#search/Daily%20Horizon%20Summary` |
| AddEvent plan limit approaching | support | Upgrade or prune before invites stop. | Tool admin | `https://mail.google.com/mail/u/?authuser=productiveentrepreneurteam%40gmail.com#search/AddEvent%20plan%20limit` |

## 4b. Seed rows — Put away sample (Type = noise, Status = new)

Eight recent items from the newest sweep blocks (2026-07-17), as examples —
the full noise backlog is not seeded.

| Name | Inbox | Subject | Tag | Gmail link |
|---|---|---|---|---|
| Indigo | personal | Watched The Odyssey? Read the epic. | Noise | `https://mail.google.com/mail/u/?authuser=accoleman100%40gmail.com#search/Indigo%20Watched%20The%20Odyssey` |
| Bluehost | personal | Save $300+/Month/Site with Bluehost Agency Hosting | Noise | `https://mail.google.com/mail/u/?authuser=accoleman100%40gmail.com#search/Bluehost%20Agency%20Hosting` |
| ThriveCart Team | personal | [ThriveCart Insider] Major New Security Milestone | Noise | `https://mail.google.com/mail/u/?authuser=accoleman100%40gmail.com#search/ThriveCart%20Insider%20Security%20Milestone` |
| Justin DeMers | business | new is the enemy of freedom | Noise | `https://mail.google.com/mail/u/?authuser=alyssa%40alyssacoleman.ca#search/Justin%20DeMers%20freedom` |
| ThriveCart Team | business | [ThriveCart Insider] New Monthly Pricing Plans | Noise | `https://mail.google.com/mail/u/?authuser=alyssa%40alyssacoleman.ca#search/ThriveCart%20Insider%20Pricing%20Plans` |
| Gilded | personal | A billion dollar idea! | Noise | `https://mail.google.com/mail/u/?authuser=accoleman100%40gmail.com#search/Gilded%20billion%20dollar%20idea` |
| Instagram | support | digitalbackofhouse, catch up on moments you've missed | Noise | `https://mail.google.com/mail/u/?authuser=productiveentrepreneurteam%40gmail.com#search/Instagram%20digitalbackofhouse` |
| Deepak Chopra | personal | The Deepak Chopra Newsletter | Noise | `https://mail.google.com/mail/u/?authuser=accoleman100%40gmail.com#search/Deepak%20Chopra%20Newsletter` |

## 5. Button properties — add by hand in the Notion UI

Buttons are not in the public API. Add three button properties on the DB
(``• • •`` -> Properties -> New property -> Button). Each carries TWO actions:
a durable property-set **and** the instant webhook (see
[[notion-bridge/SETUP]] for the webhook half).

| Button label | Shown on view | Action 1: Edit property | Action 2: Send webhook body |
|---|---|---|---|
| Draft this | Needs reply | `Status` = `queued` | `{ "action": "draft", "pageId": "{{Page ID}}" }` |
| Mark done | Your tasks | `Status` = `done` | `{ "action": "done", "pageId": "{{Page ID}}" }` |
| Archive | Put away | `Status` = `queued` | `{ "action": "archive", "pageId": "{{Page ID}}" }` |

All webhooks add custom header `X-Mailroom-Secret` = the shared secret (auth).
Design note: build the property-set action now regardless of whether the
webhook is live yet — it works standalone (durable path). The webhook action
layers on top without rebuilding the button.

Labels stay plain (no emoji) to match locked design rules. The Obsidian
version uses "Draft this ↩"; drop the arrow in Notion since button styling is
fixed and minimal-copy is the rule.

## 6. Views — create by hand in the Notion UI (API can't create views)

Three views, each a table (or board) filtered by Type, hiding cleared rows so
items disappear as she clears them (mirrors the Obsidian "things disappear as
you check them" behavior):

| View name | Filter |
|---|---|
| Needs reply | `Type` is `reply` **AND** `Status` is not `handled` |
| Your tasks | `Type` is `task` **AND** `Status` is not `done` **AND** `Status` is not `handled` |
| Put away | `Type` is `noise` **AND** `Status` is not `handled` |

Put the matching button property (section 5) on each view so only the right
action shows. Hide the technical columns (Gmail link can stay as a clickable
"Open" link; hide Status if she prefers, though it's harmless to show).

## 7. After the show-and-tell (NOT now)

Once Alyssa approves, Larry adds a **Mailroom** row to the House Operations
Board. Do not mark the Operations Board yet.
