---
agent_id: larry
session_id: for-the-girls-slide-copy-and-skill
timestamp: 2026-07-07T22:45:00Z
type: close-session
linked_sops: []
linked_workstreams: ["WS-011-carousel-workflow"]
linked_guidelines: []
---

# For The Girls — verbatim slide-copy reference + reusable writing skill captured

## Context

Alyssa asked how many "For The Girls" examples we hold and whether their slide copy was transcribed anywhere. It was not (only one was partially covered in analysis). She then dropped a full authored "girls posts" writing skill from a team member who helps write these, and asked to make it usable. Session goal: capture the FTG examples as clean copy + install the skill where the writer loads it.

## What we did

- Larry located all 4 For The Girls examples in `PKM/Second Brain/examples/Carousels/` (Wasting Time, Valentine Love Letters, March Affirmations, Guest Cheque Quote) and confirmed only Wasting Time had any prior transcription.
- Larry read all 22 real slide images and transcribed them **verbatim** (reading order + rhythmic line breaks preserved; two real typos kept and flagged `[sic]` — `PERMISSIOIN`, doubled `AT THE THE ALGORITHM'S`) into a new reference: [[examples/Carousels/for-the-girls-slide-copy|for-the-girls-slide-copy.md]].
- Larry linked that doc into [[examples/Carousels/INDEX|the Carousels INDEX]] under the "before using these examples, read" list.
- Larry captured Alyssa's team member's "girls posts" writing skill **verbatim** into Hermes's craft layer as a new dedicated file: `Hermes/craft/for-the-girls-posts.md` (job of the post, 4 magic formulas, cadence/tone rules, reusable structures, deeper thesis). Marked provenance: collaborator's method, not Alyssa's verbatim voice — JUDGMENT layer still wins on conflict.
- Larry cross-linked method↔evidence both ways, and added a load pointer in `Hermes/craft/captions-carousels.md` telling the writer to load the FTG skill before writing that lane.

## Decisions made

- **Question:** Where does an authored FTG writing skill live — Second Brain source, or Hermes craft?
  **Decision:** Hermes `craft/` (the writer's load layer), as method, with an explicit provenance/precedence note so it never overrides the JUDGMENT voice authority. Kept verbatim, not digested (per map-don't-digest — authored doctrine is preserved whole).
- **Question:** Should the skill actually govern writing, or just sit as reference?
  **Decision:** Wired a load pointer in `captions-carousels.md` so Hermes loads it for the FTG lane. Flagged this one wiring change to Alyssa for visibility; she approved the session's work.

## Insights

- FTG is now the first carousel lane with both a verbatim example set (evidence) AND a dedicated craft skill (method), cross-linked. This is the model for future lanes if more skills surface.
- Reading the real slide images (not captions) is what makes the copy reference trustworthy — the caption ("guys, i think i figured it out") tells you nothing about the on-slide manifesto.

## Realignments

- _(none this session — Alyssa confirmed the approach at each step)_

## Open threads

- [ ] Alyssa is sourcing more For The Girls examples; when they arrive, transcribe verbatim (read the images) and append to `for-the-girls-slide-copy.md` in the same format.
- [ ] Optional/next: if the FTG skill proves load-bearing across drafts, consider graduating the load into a README.md recipe rather than a pointer inside captions-carousels.md (system wiring — show Alyssa first).

## Next steps

- On next FTG carousel pitch/write (WS-011), Hermes loads `craft/for-the-girls-posts.md` + reads one example from `for-the-girls-slide-copy.md` in slide order before drafting.

## Cross-links

- `[[2026-07-04-18-49_larry_carousel-example-gap-map]]` — the example-gap map this session partially fills (FTG copy gap now closed).
- `[[2026-07-04-20-07_larry_second-brain-carousel-offer-linking-close]]` — prior carousel/Second Brain structuring.
- `[[2026-06-04_larry_second-brain-carousel-analysis-and-vault-cleanup]]` — original carousel analysis these examples came from.
