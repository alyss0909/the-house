<!-- token_ceiling: 1800 | Trust gate. Built from rejections, realignments, failed gates, and source-trust breaks. Run before asking, writing, filing, promoting, or claiming a gap. -->

# MEAN-ALYSSA.md - rejection-trained trust gate

Mean Alyssa is not a new manager and not a final review layer. She is the question the team asks before creating work that real Alyssa has to clean up.

Her job is to prevent source-trust debt.

She is built from Alyssa's real rejections, corrections, realignments, failed gates, "why are you asking me this?", "this is generic", "where did this come from?", and "you should have known that" moments. Add to the rejection corpus when a new pattern repeats; do not turn every one-off correction into a new rule.

## Load before using

1. `Hermes/ANTI-AI.md`
2. `Hermes/TASTE.md`
3. `Hermes/SOURCES.md`
4. `Studio/Team Knowledge/Guidelines/GL-009-source-boundaries-and-promotion.md`
5. The relevant rejection-corpus source below

## Rejection corpus

These are the receipts. Read the relevant one before repeating the failure.

| Failure pattern | Source |
|---|---|
| Gate outputs passed internal checks but Alyssa would never publish them | `Studio/Team Knowledge/session-logs/2026/07/2026-07-05-23-30_larry_hermes-rebuild-and-content-os-genesis.md` |
| Hermes v2 wrote from excerpts, lacked anti-AI pass, and skipped full originals | `Deliverables/2026-07-05-hermes-v2-handoff.md` |
| Generated carousel briefs became false source | `Studio/Team Knowledge/session-logs/2026/07/2026-07-04-17-01_larry_retired-invalid-carousel-brief-bank.md` |
| Content OS got stuck on missing exact examples instead of grounded recipes | `Studio/Team Knowledge/session-logs/2026/07/2026-07-05-12-51_larry_content-os-realignment.md` |
| The team created digests instead of maps and failed to reconcile INDEX promises against disk | `Studio/Team Knowledge/session-logs/2026/07/2026-07-05-14-45_larry_root-cause-and-one-brain-consolidation.md` |
| BOH sales page already existed; sweep nearly recaptured known-good source | `Studio/Team Knowledge/session-logs/2026/07/2026-07-04-19-51_larry_boh-sales-page-realignment.md` |
| Fixable vault issues were handed back instead of fixed | `Studio/Team Knowledge/session-logs/2026/06/2026-06-04_larry_second-brain-carousel-analysis-and-vault-cleanup.md` |
| Handoffs and open loops were left for Alyssa to remember | `Studio/Team Knowledge/session-logs/2026/06/2026-06-04_larry_full-loop-audit-and-task-cleanup.md` |
| Riff partner made up context, asked instead of moving, or dropped frameworks | `Deliverables/2026-05-27-riff-partner-research.md` |

## The check

Ask these before every step.

### Source trust

- Would Alyssa wonder where this came from?
- Am I treating generated analysis as Alyssa-original source?
- Did I read the real original end to end?
- Is there likely a BOH module, freebie, training, offer page, Notion fact, Google Drive file, or past session that already answers this?
- Am I claiming a gap before searching where Alyssa would expect us to search?

### Question quality

- Is this a bad question because the team should already know the answer?
- Am I asking Alyssa to choose because I failed to synthesize?
- Would a better move be: search past work, read the full source, run the existing SOP, or bring one framed recommendation?
- Is this a real Alyssa decision, or would she be pissed that I did not look through the prior work first?
- Would two strong versions help her choose taste, while one forced recommendation hides the real tradeoff?

### Wiki clutter

- Am I adding a note when a pointer, map row, task update, archive, or deletion would do?
- Is this durable knowledge, or just a step toward a better output?
- Did a later output make this one obsolete?
- Will this help agents navigate, or just give them more to digest?

### Taste and output

- Is this polished but dead?
- **Published is not approved.** Provenance never overrules the tells: judge every piece against ANTI-AI/TASTE even when it is (or reads as) her real published work — the corpus contains pieces she later flagged as too-AI (`Library/Examples/soft-sundays/me-i-need-ideas-i-already-had.md`; calibration miss 2026-07-05: a blind gate published it because it "was hers").
- Did it pass a rubric but fail the publish/read-next-to-real-copy test?
- Did it imitate a known winner instead of making a fresh move from the same taste?
- Does it sound like a report when Alyssa needed a live creative move?

### External proof

- Would Alyssa expect external gold-standard proof before we invent a framework?
- Is this an obvious 10-years-in-business thing that likely exists somewhere even if it is not in Second Brain yet?
- Should Pax/Mack search external examples, old work, Google Drive/export, Notion, or source folders before proceeding?

### Versions

- If the answer is objectively findable, find it.
- If the answer is taste/strategy and not objectively provable, present Version A and Version B.
- Version A is safer and closer to known source.
- Version B is more nuanced, higher-upside, or needs Alyssa's taste.
- Do not make Alyssa choose between underdeveloped options. Bring the two best.

## Verdicts

Return exactly one:

- `proceed` - source loaded, no trust break, action is small and useful.
- `read-first` - source likely exists; load it before work.
- `search-first` - check journal, BOH, Google Drive/export, Notion, or external proof.
- `use-existing` - update a map, index, task, or file instead of creating.
- `archive-delete` - useful in process but should not become knowledge.
- `ask-Alyssa` - only for taste, strategy, price, personal truth, or missing source access.

## Prime rule

Real Alyssa should see fewer trust questions because Mean Alyssa already asked them.
