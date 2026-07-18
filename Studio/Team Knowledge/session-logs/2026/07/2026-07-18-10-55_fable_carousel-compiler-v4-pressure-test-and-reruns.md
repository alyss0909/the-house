---
agent_id: fable
session_id: 2026-07-18-fable-carousel-compiler-v4-pressure-test-and-reruns
timestamp: 2026-07-18T10:55:00-04:00
type: close-session
linked_sops: ["SOP-011-write-session-log", "SOP-040-the-compounding-loop", "SOP-041-content-production"]
linked_guidelines: ["GL-014-the-compounding-architecture"]
mined: false
---

# Carousel compiler v4: pressure test, her rulings, and two live reruns

## Context

Alyssa ordered a full pressure test of the carousel compiler (Larry's handoff [[Studio/Content/2026-07-17-carousel-compiler-fable-handoff]]): find holes, token leaks, and weak copy, fix the briefs, and loop until the system reliably produces posts she approves. Mid-session she delivered hard rulings (briefs are trash, too much up-front work, her old sequences were stronger), Larry's codex gap report ([[Studio/Content/2026-07-17-fable-followup-carousel-compiler-gaps]]) confirmed the same, and she killed the first rerun batch for voice and hooks. The session ended with a second rerun built on the fully rebuilt v4 stack, four decks Ready for Alyssa on the Content Studio board.

## What we did (Fable, orchestrating; clean writer subagents for all slide copy)

**Round 1, the pressure test (report: [[Studio/Content/2026-07-17-carousel-compiler-pressure-test]]):**
- Found and fixed nine holes: her-carousel-voice missing from the dispatch writer load (the voice-bug regression), concept lock absent from /content-run, the image-ideas contradiction in Stage 6, House Report listed live in two files after its retirement, stale "pack" vocabulary, the two-draft rule conflict, no FTG brief, no belief-fidelity check in the checker, and a too-thin Bingeable brief.
- Ran one cold-writer test on 5MN through the narrow load; it passed the mechanical checker.
- Delivered a 4-version run (2 posts, 2 versions each) to the board; built the six missing offer briefs via a subagent; drained 16 dead files out of Studio/Analysis to `Archive/studio-analysis-drain-2026-07-17/` and rerouted COMPASS + copy-task-routing away from superseded files; slimmed the /saves-sweep daily boot on her yes.

**Round 2, her rulings + the codex report (all executed):**
- Rebuilt the framework cards SEQUENCE-FIRST with her pasted sequences: [[Studio/Analysis/Frameworks/carousels/house-report]] reinstated as a live framework (her paste overrides the retirement), [[Studio/Analysis/Frameworks/carousels/old-way-new-way]] now carries her two sequences (the Exit and the Pivot) with the required middle folded into the steps. Five live frameworks.
- Cut pre-writing paperwork from four artifacts to ONE: the sequence fill (argues / one villain / not-about / the card's steps) in [[Studio/Content/carousel-dispatch]] v2. The seven-job spine became the checker's rubric, not writer paperwork. Writers may propose a NEW argument lane if they prove it from her source lines.
- Rebuilt all briefs as OFFER INTELLIGENCE briefs (model: [[Studio/Content/briefs/the-5-minute-newsletter]]): what it IS, what it sells, buying beliefs, approved argument lanes with villains and do-not-mix guards, then the verbatim bank. 5MN and Bingeable by hand; the other eight via subagent from her real sales pages and Soft Sundays. [[Studio/Content/briefs/ftg-moods]] deleted, replaced by [[Studio/Content/briefs/for-the-girls-brief]] (source brief pointing at her real FTG files; live mood rides the option row). FTG got a real checker inside its card.
- Made carousel-dispatch the single owner of the writer load; MAP, writer-kit, and /content-run now point at it. Corrected the pressure-test report's overclaims (gates, not guarantees).

**Round 3, the reruns:**
- Rerun 1 (before her react): 4 decks. She killed all four: "the output doesnt sound like me and the hooks are shit - tbh the previous version on 16th was getting closer."
- Diagnosed and logged: invented connective tissue (soufflé joke, "opening night") broke the voice; hooks were tidy title-case instead of her cover register. Both distilled in [[Studio/Content/taste-ledger]].
- Rerun 2 on the full v4 stack, writers forming the argument THEMSELVES from brief lanes (the codex understanding-test): four decks, all passed the checker (one em-dash rebuild), delivered Ready for Alyssa. Receipts for all three runs: [[Studio/Content/runs/2026-07-17-run]].

## Decisions made

- House Report is live again; five frameworks total (her call).
- One pre-writing artifact, the sequence fill (her call: too much up-front work).
- Briefs are intelligence briefs with argument lanes (her call plus codex).
- Chat words are permanently off-limits as questions; A Year of Emails PARKED (her call, saved to memory and briefs).
- /saves-sweep boot slimmed to three files (her yes).
- Orchestrator wrote zero slide copy all session; every draft and rebuild went through clean writers (standing rule held).

## Insights

- Exemplars beat rules for voice, and the failure is asymmetric: one invented joke inside her metaphor world reads as more fake than ten plain bridges. The durable form: bridges under 10 words, never extend her bit.
- Her hooks are identifiable by register, not structure: lowercase-casual, weird word choice, spoken directly to the reader. "Grammatically tidy title-case claim" is the AI tell, now in the ledger.
- The compiler's checker catches mechanical failures reliably (em dashes, density, sequence execution) but her kills target register and judgment, which only compound through verbatim reacts in the taste ledger. The loop is working as designed: each react produced a named, testable correction that rode in the next run's prompts.

## Realignments (verbatim)

- "i dont think the briefs are good and the agents have too much up front work to do before getting to the point."
- "i want the writer to be able to follow a good copy framework and sequence ... i really still think some of your older versions were stronger AND i think that we could fold in middle stuff ... the required middle doesnt need to repeat it if we can cleanly say it once"
- "and the briefs are trash"
- "forget about a year of emails for now and forget about the chat words pls dont ask me again i solved this"
- "so far the output doesnt sound like me and the hooks are shit - tbh the previous version on 16th was getting closer"
- (via codex report) "Idk this is too rigid? I want it to understand not follow rules - come up with ideas from understanding deeply"

All logged with distillations in [[Studio/Content/taste-ledger]] same session.

## Open threads

- [ ] Alyssa reacts to the four run-3 decks on the Content Studio board (six burners House Report · quit rewriting How To · sandwich meltdown How To · stop summoning Pivot). Her reacts fill the run-3 receipt and the ledger.
- [ ] Register question flagged on the "stop summoning" page: sentence case with selective bolds vs full caps. Her answer becomes a ledger rule.
- [ ] Promo Planner brief: two lanes are close cousins; if a run shows them collapsing, drop to one lane.
- [ ] tsk-2026-07-17-001 (disable ideation cron, Mack) and tsk-2026-07-17-002 (wire sent-email bodies via Kit API) still open.
- [ ] Older workstream files (WS-006, WS-008, WS-009) and Hermes SOURCES.md still reference the retired taste-log; scoped sweep offered, not yet ordered.
- [ ] Second-appearance watch: "it doesn't sound like me" has now recurred across sessions even after structural fixes; the live hypothesis (invented-bridge asymmetry + hook register) is in the ledger. If run 3 fails on voice again, the next lever is loading one full real deck verbatim into the writer (her compaction-vs-real-artifact instinct), not more rules.

## Next steps

1. Stage 0 of the next /content-run harvests her run-3 reacts verbatim.
2. If a deck is picked: ship path (design is hers); log results with real numbers when available.
3. If voice fails again: switch the writer load to one full verbatim deck as calibration (see last open thread).

## Cross-links

- Prior: [[2026-07-17-23-30_fable_content-engine-rebuild-and-voice-diagnosis]] · [[2026-07-17-21-25_larry_carousel-compiler-fable-handoff]] · [[2026-07-17-21-15_larry_carousel-dispatch-and-compiled-cards]]
- Reports this session: [[Studio/Content/2026-07-17-carousel-compiler-pressure-test]] · [[Studio/Content/2026-07-17-fable-followup-carousel-compiler-gaps]] (reviewed and executed)
- Receipts: [[Studio/Content/runs/2026-07-17-run]] · Archive drain: `Archive/studio-analysis-drain-2026-07-17/README.md`
