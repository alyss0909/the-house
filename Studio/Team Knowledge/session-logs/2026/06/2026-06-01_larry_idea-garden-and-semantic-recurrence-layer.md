---
agent_id: larry
session_id: idea-garden-and-semantic-recurrence-layer
timestamp: 2026-06-01T00:00:00Z
type: close-session
linked_sops: []
linked_workstreams: []
linked_guidelines: []
---

# Idea garden concept exploration + semantic recurrence layer design

## Context

Alyssa came in with a YouTube video demonstrating an "idea garden" workflow: a raw idea dump in Obsidian, scored periodically by Claude Code (running inline via the Terminal plugin), with recurrence-based signal detection and a threshold system for deciding when to act. The session started as concept exploration — how does this differ from PKM? — and ended with a full plan for adding a semantic recurrence layer to myPKA.

## What we did

- **Vera** synthesized the architectural difference between idea garden and PKM: idea garden delays judgment (no categorization at capture), PKM is optimized for ideas you already understand. Mapped the idea garden as a pre-PKM filter sitting upstream of the Team Inbox.
- **Larry** updated `feedback_vera_riff_style.md` memory after Alyssa gave direct feedback that Vera jumped to planning/execution mode instead of riffing.
- **Larry** riffed directly with Alyssa on: how semantic patterning works (LLM meaning-matching across time, not keywords), cross-source recurrence (same theme appearing in journal + goal notes + key elements = stronger signal), and how the iCOR daily routine maps to the idea garden model.
- **Background Explore agent** investigated the date-in-filename convention — confirmed the date is structural (powers wiki links, folder routing, SQLite migration) and cannot be changed without a migration script. The Properties panel date display is a separate UI toggle.
- **Background Explore agent** scanned the scaffold for existing periodic review processes — found none. No weekly/monthly/quarterly review SOPs exist yet.
- **Larry** wrote the Semantic Recurrence Layer plan at `C:\Users\accol\.claude\plans\k-make-a-note-iridescent-acorn.md`.

## Decisions made

- **Journal = the garden.** No separate raw dump file needed. The semantic layer reads across existing journal entries. One capture track, invisible to Alyssa.
- **One-time stuff gets processed normally.** All captures go to Penn as journal entries. The semantic layer only flags recurring themes — it doesn't hold non-recurring ideas in a separate pile.
- **Recurrence reflection plugs into existing cadences.** Weekly (light), monthly (medium), quarterly (deep) — anchored to the habits already identified in the scaffold (ops-review, quarterly-plan).
- **Date-in-filename change parked.** Moving the date to the end of the filename is viable (wiki links updatable via script) but out of scope for this session.

## Insights

- Semantic patterning works via language model meaning-matching — not keywords. The same underlying pull can be described 4 different ways across 4 months and Claude still clusters them as one theme. Traditional tagging/folder systems can't do this.
- Cross-source recurrence (theme appearing in journal + goals + key elements) is a stronger signal than recurrence within just the dump. The PKM already knows what matters to Alyssa — the semantic layer reads across it.
- myPKA already has AI as the organizer (Penn routes everything). The friction isn't "you have to categorize" — it's that the system is optimized for ideas that already have a shape. The semantic layer fills the gap for pre-structural ideas.
- No periodic review SOPs exist yet in the scaffold. The Semantic Recurrence Layer plan creates the first one (SOP-004).

## Realignments

- **Vera riff style (direct feedback):** "vera babe idk how ur so bad at riffing when riffing is your job" — Vera presented a 4-layer build plan with team assignments when Alyssa wanted intellectual exploration of the idea. Vera should stay in idea space during riff sessions, not jump to execution. Memory updated in `feedback_vera_riff_style.md`.
- **"Too rigid" critique walked back:** Larry said myPKA was "too rigid" for messy thinkers. Alyssa pushed back: myPKA already has AI as the organizer, not her. Correct framing: the system is well-suited for things with a shape; the semantic layer is the add for things that don't have a shape yet.
- **Two capture tracks:** Larry proposed two visible capture tracks (structured + raw dump). Alyssa: one experience only, fine if two tracks exist in the background but she doesn't want to see or manage them.

## Open threads

- [ ] Approve and execute Semantic Recurrence Layer plan (`C:\Users\accol\.claude\plans\k-make-a-note-iridescent-acorn.md`) — creates SOP-004, Signals Index, GL-002 Signal schema, AGENTS.md sweep behavior
- [ ] Date in filename — moving date to end of filename (e.g., `note-slug-2026-05-29.md`). Alyssa confirmed it's worth doing; wiki links updatable via script. Needs its own session.
- [ ] Homepage / workspace view in Obsidian — simple pinned note: quick capture, view of what's ripe, links to active work. Mentioned but not scoped.
- [ ] Obsidian Properties panel — if the date is showing visually at the top of notes, fix is: Settings → Editor → Properties in document → Hidden.

## Next steps

- Open next session by pulling up the Semantic Recurrence Layer plan and getting approval to execute
- After execution: test a semantic sweep manually (give Larry a date range, ask for sweep output, verify Signals Index populates)

## Cross-links

- `[[2026-05-27_larry_pka-working-style-riff-and-ke-audit]]` — prior riff session on working style and PKM structure
