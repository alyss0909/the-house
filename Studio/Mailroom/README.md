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

**See "SWITCHED TO NOTION" below — that section is authoritative.** The
interface is the Notion Mailroom database. Alyssa sets `Status`; the
**`/mailroom`** command (`.claude/commands/mailroom.md`) reads the database and
does the real Gmail work with the Composio tools already in Larry's session. No
standalone server, no API keys, no Anthropic billing (Larry drafts in-session).

Retired 2026-07-20 and never to be read for state again: `MAILROOM.md` (the
Obsidian dataviewjs dashboard and its `## Mailroom state` ledger), and
`dashboard.html` (an artifact-only copy whose buttons never worked).

## The daily sweep

1. `/mailroom sweep` (or "clear the mailroom") fetches each inbox and creates
   fresh `Type = noise` rows — promotions and social are the safe noise;
   receipts, payments, security, and real people are never pulled.
2. A message only counts as *needs reply* if the **other person** sent the last
   real message. If Alyssa's side sent last, it's handled and drops — but the
   support auto-responder ("Hang tight. We're on it!") does **not** count as a reply.
3. Alyssa sets `Status = For Larry` or checks `Archive it`; `/mailroom` acts,
   then writes `Filed` with the date.

## Doctrine

- **Archive = remove from inbox only, never delete.** Gmail search finds everything later. No archive-label taxonomy — she wants a clean inbox she can search.
- **Filters** (skip-inbox / label / mark-read) are standing config → show-and-tell + her explicit go before creating any. Live spec: [filter-plan.md](filter-plan.md).
- **Never auto-touch:** failed/declined payments, security alerts, the bookkeeper, real humans, paid-member join requests.
- Norah's Day (Montessori dailies) stays in the inbox unless she says otherwise.

## SWITCHED TO NOTION — 2026-07-20

**The Notion Mailroom database is now the one true interface.** Data source
`collection://ddf15d60-e8b8-40be-a6e9-1c99ba7452bf`, under House Control Room.
The Obsidian [[MAILROOM]] dashboard and its `## Mailroom state` ledger are
**retired**. Never read them for state again.

Why it switched: Alyssa had been clicking in Notion for days while the live
`/mailroom` command still read the Obsidian file. Nothing she clicked was ever
acted on. Every row sat at the old `Sync = new`. That is the failure this
section exists to prevent repeating — **if she is using a surface, that surface
must be the one the command reads, or the desk is lying to her.**

### The two-field contract

- **`Status`** is what Alyssa clicked: `For Alyssa` (her call) → `For Larry`
  (her work queue handoff) → `Drafted` (Larry wrote it, back in her court) →
  `Done`.
- **`Filed`** is a date meaning **the row is finished and nobody has anything left
  to do on it**. It is the LAST thing that happens, set by whoever closes it out,
  Alyssa or Larry. She filters her board on `Filed` is empty, so a Filed date takes
  the row off her screen.

**Filed goes on ONLY alongside `Status = Done`. Never on `Drafted`.** A draft
waiting for her to read and send is an open job she still owes. Filing it hides
that work. This was gotten wrong on 2026-07-20 — four drafts that had been sitting
a week were filed and vanished from her view the moment she found them. Blank Filed
also means the real Gmail action has not happened, so never set it unverified.

Schema notes: `Sync` and `Tag` were deleted 2026-07-20 (two state columns for one
thing, and Tag duplicated what `Details` already said better). `Subject` was
renamed `Details` because it always held Larry's one-line note, not a real
subject line. `Message id` was added because `Gmail link` stores a *search* URL,
which cannot be archived precisely.

### Standing rules

- **Every new row gets the ✈️ paper airplane icon.** Her call, 2026-07-20.
- **`Archive it` on a `reply` or `task` row means nothing** — those boxes are
  leftovers from the default-checked import. Only `Type = noise` is ever archived.
- **There is no push notification from Notion.** The command only runs when she
  asks. Never imply a click was picked up automatically.
- **Verify before claiming success.** `GMAIL_BATCH_MODIFY_MESSAGES` does not
  confirm per-message. Re-query `in:inbox` and confirm before setting Filed.

### Reply-word replies (VAULT, SWEET, STATS…)

These are the second half of a Right Time Offer, not a request for a freebie.
Trace the word back to the broadcast that carried it, pull that email's feature
and its reason-to-join-now, and continue *that* conversation. Full doctrine:
[[keyword-reply-voice]].

### Superseded draft artifacts (kept for history only)
- [[notion-mailroom-BUILD-SPEC]] — the Notion database schema, seed rows, and the button/view steps (buttons and views are UI-only in Notion, added by hand).
- [[notion-bridge/SETUP]] — the near-instant Cloudflare Worker webhook bridge (Notion button -> Gmail via Composio/Anthropic), gated on Alyssa's secrets + a Vex security pass.
- [[mailroom-notion-command-DRAFT]] — drafted `/mailroom` repoint to read the Notion database (the durable polled fallback behind the instant bridge).

## Open builds (highest-leverage first)

- **Scheduling** — the sweep is entirely manual right now (Alyssa clicks "Check inboxes" → `/mailroom` reads the trigger next time Larry checks in). No cron, no auto-refresh. Wire OS cron + API (never an app-open-dependent Claude scheduled task) to run the sweep every morning on its own.
- **Access-recovery flow** — the "I can't log into my course" reply is her most-repeated human task (Breannah, Jennifer, Anna all hit this). Self-serve reset link in the auto-responder + AI first-draft; she handles only edge cases.
- **Make bookkeeping statements unnecessary** — see filter-plan / session notes; goal is Dennis never needs a manually downloaded BMO PDF. Best path discussed: ask him to set up a BMO bank feed so statements aren't needed at all, not a smarter download.
- **Gmail filters not yet built** — full spec is locked in filter-plan.md, but `GMAIL_CREATE_FILTER` returns `403 ACCESS_TOKEN_SCOPE_INSUFFICIENT` on the current Composio Gmail connection (it has read/modify scope, not the separate Gmail settings scope filters need). Two ways forward: (a) fold the same rules into the daily `/mailroom sweep` instead of native Gmail filters — same effect, no missing permission; (b) hand Alyssa the three ready-made search strings to paste into Gmail's own filter UI herself, which runs in real time instead of once a day. Neither is built yet.
- **Paid-invoice auto-forward** — Alyssa wants Manychat/ThriveCart/PayPal paid-invoice emails forwarded to `alyssa.coleman.alyssa.coleman.corp@receiptbank.me` then archived, feeding Xero. Gmail-native auto-forward needs its own scope + a one-time verification handshake Composio can't do; the workaround is folding "forward then archive" into the sweep using the send permission already available. Not built — waiting on her confirming the full sender list.
- **Bulk historical cleanup** — the daily sweep only looks at ~14 days. Alyssa's personal inbox alone has 400+ promotions and 400+ social emails going back years, never archived. A separate, explicitly-confirmed one-time bulk pass (not folded into the daily sweep) would actually get the inbox to zero — see `/mailroom.md`'s guardrails, this is deliberately gated behind her yes.

## Design preferences (locked — read before changing anything visual)

Built against the Content OS `dashboard.css` design system (`Studio/Content/dashboard/`), not invented fresh. Alyssa's specific calls, in order of how many rounds it took to get right:

- **No emoji** in section headers or copy, anywhere. She said it plainly: "not in the design guide not the vibe."
- **Generous internal card spacing.** The single biggest visual complaint across this whole build was cramped cards — twice. First cause: chips sitting flush together with no gap. Second, bigger cause: Mailroom's cards sit inside a shared `.db-grid` wrapper that Concepts also uses for its dense 3-across layout (`.db-grid > .db-card { padding: 15px 13px }`) — that tight rule leaked in silently. Fixed with a scoped override (`.db-mail-wrap .db-grid > .db-card { padding: 20px 22px }` + explicit margins between chip-row/title/body/buttons). **If a future card feels cramped again, check for a leaking shared-class rule before adding padding by hand.**
- **Tags/chips small and tinted, not flat grey.** She specifically referenced a pink "DECISION" pill from an earlier mockup. Tags are pastel-tinted per section now (`color-mix(in srgb, var(--db-pink) 45%, var(--db-oat))` etc.) with terracotta text — not the shared vault `.db-chip` grey.
- **Buttons: regular weight, not bold.** `font-weight: 400` on `.db-mail-btn`, explicitly requested after the first pass shipped bold.
- **Timestamps ("Jul 10 · waiting on you") are right-justified, no underline.** Both were tried and reversed — she wanted them pushed to the chip row's right edge via `margin-left: auto`, with the underline removed entirely, not styled as a link.
- **No unnecessary copy.** The instructional paragraph under the H1 ("Four inboxes, one desk...") got cut once the buttons were self-explanatory. Default to less text, not more, once a mechanic is visually obvious.
- **Ship-button styling for the one primary top-level action** ("Check inboxes") — AT KING serif, pink pill, larger than the small action buttons — reused directly from Content OS's `04 Draft.md` `.db-ship-btn`, not a new style.
- **Cards should visually confirm a click and then get out of the way** — not sit inline forever in a done/greyed state. See "the interaction model" below; this shaped the whole review-strip mechanism.
- **No solid-fill ivory/yellow callout boxes — full stop.** This isn't a new rule, it's an existing locked one (see `dashboard.css`'s own history: "the big yellow boxes are a hard no" from the Concepts page redesign) that got violated twice in Mailroom before being caught. Every box here is oat + hairline border, matching every other card. Check `dashboard.css`'s change history before introducing ANY new solid-color callout anywhere in this vault.
- **Bulk actions (Put Away) get grouped checkbox-style rows + one "Archive checked" button per group, not one card per email.** Individual button-cards are right for Needs Reply / Tasks (a handful of one-off decisions); they don't scale to 20-50 noise emails a day. This was a reversal — first built as cards, changed back to the original artifact's grouped-list mechanic on her explicit ask.
- **Internal bookkeeping (the reacts log, trigger flag, state ledger) stays hidden, not headlined.** Collapsed behind one tiny `▸ mailroom internals` toggle at the very bottom — she doesn't need to see this day to day, it's Larry's own audit trail.
- **Every "waiting on Larry" or "done" item needs a real Open-in-Gmail link.** Status text alone is a dead end — she asked "where do I go to review Larry's draft?" and the honest answer was "nowhere, I never wired that." Any strip row that touches Gmail (reply or archive) gets an Open ↗ link to the actual thread; task rows don't need one since there's no Gmail side to check.
- **Minimize copy aggressively once the UI is self-explanatory.** Cut in three separate rounds: the top intro paragraph, then every section subtitle ("click to have Larry draft it" etc.), then the "already replied, cleared: ..." note. If a button's label already says what it does, a sentence above it explaining the same thing is noise, not help.

## Hard-won technical fixes (read this before touching the dataviewjs block)

Three real bugs got hit and fixed while building this. All three are the kind of thing that looks fine until you click something — worth internalizing before extending this file or copying its pattern elsewhere.

1. **Obsidian buttons can only work if you use Obsidian's own DOM, not a webpage's.** First two attempts were a standalone artifact (Claude's sandboxed preview) and an in-chat widget — both looked identical to the final version but their buttons could never do anything, because neither has a channel back into either Obsidian's `app.vault` or this chat. The only place a button can *actually* archive an email or write to a file is inside a **dataviewjs block running live in Obsidian**, because Dataview executes with real `app`/`vault` access. If a future request is "make X clickable" for anything touching the vault or Gmail, it has to be a dataviewjs note, not an artifact or a chat widget — those can only ever fake it (copy-to-clipboard, "tell me the phrase").

2. **Build the whole section as one HTML string, insert once, wire once — don't attach listeners while creating elements one at a time.** The first working-buttons attempt created each card individually (`grid.createEl(...)` + `card.querySelector("button").addEventListener(...)` inside the loop) and every click silently did nothing. The fix was copying `01 Concepts.md`'s actual proven pattern exactly: assemble the entire section's HTML as a string, insert it **once** via `dv.el(...)`, then do a **single wiring pass** with `wrap.querySelectorAll(...)` over the now-stable, already-attached DOM. Never split helper functions across two separate `dataviewjs` fences relying on a shared `window` object either — keep everything one self-contained block per note.

3. **Never plain-substring `.replace(headingText, ...)` against the whole file to find a markdown heading — it will find itself instead.** This one actually broke the whole dashboard (SyntaxError, red error box) mid-session. The click handler searched the *entire file text* (`app.vault.read()` returns the raw file **including the dataviewjs code fence itself**) for the literal string `"## Mailroom state"` to know where to insert a line. That exact text also appears inside the script's own `const STATE_HEAD = "## Mailroom state";` — and JS's `.replace()` grabs whichever occurrence comes first, which was the source code, not the real heading. It spliced the click's data straight into the middle of a JS string literal and broke the file. **Fix, now the standing rule for any self-modifying dataviewjs note:** always locate a heading by splitting into lines and doing an exact full-line match (`lines.findIndex(l => l.trim() === HEADING)`), never a whole-file substring search. A full-line match can't collide with the same text sitting mid-line inside your own source, because your source line is never *just* the heading text — it's always wrapped in `const X = "...";`.

4. **A real `<input type="checkbox">` inside a dataviewjs block gets silently intercepted by Obsidian's Reading View.** Obsidian has its own built-in handling for checkboxes belonging to real markdown task lists (`- [ ]`), and it grabs the click for *any* checkbox rendered inside `.markdown-preview-view` — including ones a plugin renders that have nothing to do with a task list — and blocks the native toggle. Confirmed by direct testing via the `obsidian` CLI's `eval` command: calling `.click()` on the checkbox never flipped `.checked`, and no `change` event ever fired. Buttons are unaffected (that's why Draft/Mark done/Archive always worked while Put Away's checkboxes never did). **Fix: use a `<button>` styled to look like a checkbox** (`.db-mail-check`, toggled via an `is-checked` class, not the native `checked` property) for any check-style toggle in a dataviewjs note — never a real `<input type="checkbox">`.

5. **Obsidian's in-memory copy of a file can silently drift from disk when it's edited by tools outside Obsidian's own save pipeline**, and a note can also silently be sitting in Source/Live-Preview edit mode (where code blocks render as plain text, not executed HTML) rather than Reading View. Both looked identical to "the dashboard is broken" from the outside. Diagnose with the `obsidian` CLI, don't guess:
   - `obsidian eval code="app.vault.read(abs).then(t=>t.length)"` vs. the actual on-disk byte count (`wc -c`) — a mismatch means Obsidian's cache is stale; force a resync with `app.vault.modify(abs, await app.vault.adapter.read(path))` (writes the same content back through the real Vault API, which busts the cache).
   - `obsidian eval code="app.workspace.getActiveViewOfType(require('obsidian').MarkdownView)?.getMode()"` — if it returns `"source"` instead of `"preview"`, that's why nothing is rendering. Fix with `.setState({mode:'preview'}, {})`, or tell Alyssa to press **Ctrl+E** herself next time — it's the same toggle, no need to wait on Larry for it.
   - `obsidian command id="dataview:dataview-drop-cache"` then `id="dataview:dataview-force-refresh-views"` clears Dataview's own separate query cache when neither of the above explains a stale render.

## The interaction model (why cards disappear)

Three states, each meaning something specific — don't blur them:
- **`queued`** — she clicked Draft/Archive; waiting on `/mailroom` to actually touch Gmail. Reversible (Undo).
- **`done`** — task-only. Self-serve, no Gmail action ever needed, so no reason to wait on Larry. Reversible any time.
- **`handled`** — `/mailroom` actually drafted or archived. Final. Never offer Undo for this one — the real email action already happened.

Unlocked items render as full cards in the grid. The moment an item locks (any of the three states above), it fades out and moves into a collapsed `<details>` "N handled — click to review" strip instead of sitting inline greyed-out — that's the actual fix for "should things disappear as I check them." The click optimistically fades the card via CSS, then persists the state to the file; Dataview auto-reruns the whole block on that file write (confirmed behavior, not an assumption — it's literally what surfaced bug #3 above), and the re-render correctly places the item in the strip. No manual DOM bookkeeping needed for placement — lean on Dataview's own reactivity rather than fighting it.

See memory: [[project_daily_inbox_manager]].
