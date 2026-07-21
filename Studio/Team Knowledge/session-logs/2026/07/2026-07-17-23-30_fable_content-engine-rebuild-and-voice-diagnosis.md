---
agent_id: fable
session_id: 2026-07-17-fable-content-engine-rebuild-and-voice-diagnosis
timestamp: 2026-07-17T23:30:00Z
type: close-session
linked_sops: ["SOP-011-write-session-log", "SOP-040-the-compounding-loop"]
linked_guidelines: ["GL-014-the-compounding-architecture"]
mined: true
---

# Content engine deep-rebuild and the voice diagnosis

## Context
Alyssa asked for a full audit of how the content team learns across sessions and why it keeps producing carousels she does not believe in. This became an end-to-end rebuild of the carousel pipeline plus a live test that surfaced the real root cause.

## What shipped
- Lean writer architecture: [[Studio/Content/writer-kit]] (rules + Carousel Spine), one verbatim [[Studio/Content/briefs]] file per offer (email lane built: 5MN, Bingeable, List Resuscitator, Email List Revival, A Year of Emails), [[Studio/Content/her-carousel-voice]] (voice exemplar from her real Jan 20 deck), five framework cards under [[Studio/Analysis/Frameworks/carousels]], [[Studio/Content/calendar]].
- [[Studio/Analysis/carousel-slide-by-slide]] tagged (add-only) with framework names.
- Dead-stamped superseded carousel files; rewrote [[Studio/Analysis/INDEX]] and [[Studio/Content/MAP]].
- Rebuilt /content-run (v3) and /saves-sweep: clean writer per post, mechanical checker, julia-child delivery, run receipts. Retired the Content Ideas robo-tray.
- Two decks on the Content Studio board: 5MN How To, Bingeable freebie.
- Fixed 5MN price to $11 in the Products DB.

## Decisions / rulings (all in [[Studio/Content/taste-ledger]])
- Copy-paste law; density floor; don't-invent-belief; no imagery in decks; name what the product IS; teach-the-WHAT-let-the-offer-show-the-HOW; execute the framework's forward sequence; build spine-first (frameworks specialize the spine); orchestrator never writes/patches slides (route to clean writer); voice comes from her real carousels, not her sales pages.

## Root cause found
Two compounding failures: (1) compaction is lossy — writers built from my summaries produce a copy of a copy; (2) no concept-lock — the 5MN deck mashed two arguments (six content channels vs gourmet-email-simplicity). Her ruling: lock one villain first (gourmet out / one-pan in, everything in one 5-min email), load one real full carousel instead of compacted summaries.

## Open threads
- Reconcile [[Studio/Content/carousel-dispatch]] (parallel session's concept-lock front door) with this session's writer-kit / briefs / voice files; they overlap.
- Concept-lock step + real-full-artifact loading (vs compaction) not yet wired into /content-run.
- tsk-2026-07-17-001 disable ideation cron; tsk-2026-07-17-002 wire sent-email bodies via Kit API.
- Alyssa said she has figured the direction out elsewhere; resume when she brings it.

## Next session starts with
Reconcile carousel-dispatch with the writer-kit/briefs/voice stack, then run one post from a locked concept.
