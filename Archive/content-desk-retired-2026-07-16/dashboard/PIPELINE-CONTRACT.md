---
status: RETIRED 2026-07-16 — the pitch-sheet state machine and its makers are dissolved (Alyssa's restructure). Production runs through /saves-sweep and /content-run on the Notion Content Studio board. Do not build to this contract; kept for history.
title: Content OS Pipeline Contract — the interface the dashboard AND the makers both build to
purpose: Single source of truth for WHERE each stage's output lives in the weekly pitch sheet, and WHAT counts as an approval. If a maker writes off-contract, the dash goes blank (this happened 2026-07-09: arcs written under "## Approved — substance arcs" instead of "## Approved — slide skeletons"). Never let the section names drift.
owner: Larry (contract) · Felix (dashboard side) · Mack (auto-advance watcher) · makers write to it
created: 2026-07-09
---

# Pipeline Contract

The **newest `Studio/Content/YYYY-Www-pitch.md`** is the single state machine. Everything — concepts, arcs, drafts, reacts, approvals — lives in that one file. No loose deck files. The dashboard reads it; the makers write it; the watcher advances it.

## The four stages, their sections, and their approval marks

| Stage | Section header (EXACT) | One block per post | Approval mark (what the dash writes on approve) |
|---|---|---|---|
| 1 Concept | `## Monday — …` / `## Wednesday — …` / `## Friday — …` | `N. Title` + description line ending in `— comment … ` or `— no CTA` | `N. ✓ Title` (✓ prefix) |
| 2 Arc | `## Approved — slide skeletons` | `### <DAYKEY> — <exact concept title>` | ` [approved]` suffix on the `### ` heading |
| 3 Draft | `## Drafts` | `### <DAYKEY> — <exact title>` | ` [shipped]` suffix on the `### ` heading |

`<DAYKEY>` = `MON` · `WED` (or `WED-A` / `WED-B` when a Wednesday A/B split) · `FRI`.

## Block formats (makers MUST match these exactly)

### Arc block (Substance maker → `## Approved — slide skeletons`)
```
### MON — <exact concept title>
**Cover:** <cover line>
1. Cover: <what the slide shows> → so that <belief shifted> — copy: "<real persuasive line>"
2. Frame: … → so that … — copy: "…"
…
7. CTA: … — copy: "comment <WORD> → <Offer>"
Sources: <file> · <file> · …
Note: <optional>
```
- Slide lines start `N. Role:` (Role ∈ Cover/Frame/Proof/Step/CTA). Real numbers only, from her files.
- One arc block per approved concept. Heading title must match the concept title verbatim (the watcher pairs them by string match).

### Draft block (Writer → `## Drafts`)
```
### MON — <exact title>
**Cover:** <cover line>
**Caption:** <caption>
1. <slide 1 copy>
2. <slide 2 copy>
…
```
- Full final deck copy, one numbered line per slide. FTG decks: monospace permission-slip lines, no CTA.
- If `## Drafts` doesn't exist yet, the writer/watcher creates it once at the end of the sheet.

## Auto-advance triggers (the watcher's rules)

The watcher runs each maker exactly once per post, idempotently:

1. **Concept ✓ → build arc.** A concept line `N. ✓ Title` exists AND no `### <DAY> — Title` block in `## Approved — slide skeletons` → run the Substance maker for that concept, append the arc block.
2. **Arc [approved] → write draft.** An arc heading `### <DAY> — Title [approved]` exists AND no matching block in `## Drafts` → run the Writer, append the draft block.
3. **Draft [shipped]** → terminal. Nothing downstream; the post is done.

Idempotency: presence of the downstream block = "already advanced," never re-run. The watcher logs every action to `## Dashboard reacts` as `- [stamp] auto · <stage> · <title> · advanced` so she sees the machine move in the dash.

## Hard rules for every maker (carry into their prompts)
- Write ONLY into your stage's section, in the exact block format above. Never invent a new section name.
- Title in your `### ` heading = the upstream title verbatim (string-paired by the watcher).
- Never CTA to or mention Unignorable Subject Lines (no checkout/wiring). Pinterest is the live chat word this cycle.
- Real numbers from her real files only.
