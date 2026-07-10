---
# Identity
id: tsk-2026-07-07-001
title: "Build WS-011 Content Pitch Command Center in Obsidian"

# Ownership & priority
assignee: larry
priority: 1

# Status
status: open
blocked_reason: null
blocked_by: null

# Time
created: 2026-07-07T00:00:00Z
updated: 2026-07-07T00:00:00Z
due: null

# Provenance
created_by: larry
source: chat — Alyssa go 2026-07-07
parent: null

# Cross-references
linked_sops: [SOP-031-watch-video]
linked_workstreams: [WS-011-weekly-carousel-pitch]
linked_guidelines: [GL-010-content-pitch-operating-brain]
linked_my_life: [pkm]
linked_session_logs: []
linked_journal_entries: [2026-06-17-obsidian-command-center, 2026-06-12-obsidian-dashboard-inspo]

# Tagging
tags: [obsidian, ws-011, dashboard, content-os]
---

# Build WS-011 Content Pitch Command Center in Obsidian

## What this is

An approval dashboard for the weekly carousel pipeline, built inside Obsidian per Ben AI's "option 2" recipe (video 1x32W8zAtrg, watched in full 2026-07-07 via SOP-031). Content flow FIRST; general vault dashboard (tsk-2026-06-01-001) is a later sibling.

Tab per pipeline stage: CONCEPTS → ARCS → HOOKS → DRAFTS (+ PARKED strip). Each card gets one-click ✅/❌/🔁 plus a verbatim-note field that logs to the taste ledger (GL-010 §2.3: her exact words, typos included).

## Approval chain (Alyssa's ruling)

1. Felix builds a static HTML mockup → `Deliverables/2026-07-07-ws011-dashboard-mockup.html` — **in progress**
2. Val quality-gates it
3. Larry delivers to Alyssa; she approves the mockup
4. Only then: install plugins (CustomJS, Dataview, Shell Commands, Terminal), build the real `dashboard/` in the vault
5. Action buttons LAST, per Ben's mindset slide — Claude headless mode only (local, subscription, never API); buttons trigger full WS-011 prompts (ledger loads, LOOK step) — no shortcut prompts

## Design system

Locked per Alyssa 2026-07-07: oat `#fcfaf5` cards on linen `#eee6de` frame, dark 1.5px borders, 10px radius; AT KING headings / Karla body / Roboto Mono labels; pastel palette sage-peach-pink-lavender-ivory; pill tabs, active = pink `#f39ec2`. Full spec in Iris's journal (2026-06-13-obsidian-vault-design-system.md) and memory.

## Success criteria

- Alyssa can gut-react to a weekly pitch sheet in ≤60 seconds without opening raw markdown
- Reacts land verbatim in [[Studio/Content/taste-ledger]]
- Parked escalations are visible on every visit, plain words
- Zero tool-specific syntax written into pitch/note content (portability rule — dashboard note is the exception layer)
- Buttons run Claude headless, never the API

## Updates

- 2026-07-07 (larry) — created after Alyssa's go; Ben AI video watched via /watch skill; Felix dispatched on mockup
- 2026-07-07 (larry) — **Phase 1 SHIPPED live in vault.** Felix built `dashboard/` (7 notes) + `.obsidian/snippets/dashboard.css`; Val gated the mockup. Iterated ~7 passes on Alyssa's live reacts via the Obsidian CLI. Now live: numbered tabs, feedback-everywhere saving to the pitch sheet (`## Dashboard reacts`, append-only — verified safe repeatedly), Arc storyboard, month calendar with color-coded week themes + day-types + clickable posts, freebie pills, green-card approval. React target corrected ledger→pitch-sheet per Alyssa. Iris redesigned the week chips (pending her review). Reacts go to the PITCH SHEET, not the ledger — success criterion above superseded (see [[feedback_reacts_routing]]).

## Open (carried to next session)

- [ ] Home page redesign — Alyssa picks direction (Mission Control / Big Calendar / Cockpit / mash-up) before Larry builds
- [ ] Review Iris's week-chip restyle
- [ ] Phase 2 (headless action buttons) — after she's used it daily
- [ ] Alyssa: point Homepage plugin at `00 Content Command Center`

## Outcome

Phase 1 (visual + real feedback-saving) shipped and verified live 2026-07-07. Phase 2 (actions) and home-page redesign remain. Task stays **open** until home page + Alyssa sign-off.
