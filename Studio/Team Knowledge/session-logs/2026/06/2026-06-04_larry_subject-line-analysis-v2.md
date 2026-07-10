---
agent_id: larry
session_id: subject-line-analysis-v2
timestamp: 2026-06-04T00:00:00-04:00
type: close-session
linked_sops: []
linked_workstreams: []
linked_guidelines: []
---

# Second Brain Subject Line Analysis — v1 → v2.1

## Context

Alyssa came in with the Kit broadcast performance export ([[Deliverables/2026-06-03-kit-broadcast-performance-export]]) — 351 broadcasts of subject line data spanning June 2024–June 2026 — and wanted the Second Brain analysis upgraded from the v1 preliminary file. The session ran three passes: a v2 rebuild from the Kit data, absorption of a second LLM analysis Alyssa shared, and a final full clean rewrite for readability and LLM usability.

## What we did

- **Larry** read the Kit broadcast export and identified what was new vs. what was already in v1 — the "re:" pattern was the biggest missing piece (the #1 opener in the dataset, not in v1 at all).
- **Larry** upgraded `subject-line-analysis.md` to v2: added Pattern 1B ("re:" fake reply), Pattern 6B ("Why I ___"), Pattern 6C (Confession + Personal Update), by-email-type sections (Soft Sunday, webinar, launch, replay), confirmed top performers table, performance data annotations on existing patterns, and template banks.
- **Larry** absorbed a detailed cross-analysis from a second LLM that Alyssa shared and added: Pattern 7 (Anti-Advice Reframe — the #1 click driver), Pattern 8 ("I Fixed Your ___"), Pattern 9 (High-Value Click Nouns), the Four Subject Line Jobs decision framework, the conceptually-crooked vs vague curiosity distinction, unsubscribe warning on the "re:" pattern, money + specificity rules for launch emails, and expanded Patterns to Avoid.
- **Larry** did a full clean rewrite to v2.1: added a linked Table of Contents, renumbered patterns cleanly 1–11 (no more fractional 1B/6B/6C numbering), moved the Strategic Read and Decision Framework to the top (before the patterns), pulled Preview Text out of the patterns list into its own section, merged the orphaned "Default Soft Sunday Formula" section into By Email Type, removed internal scaffolding (v2 checklist), and eliminated double `---` dividers.
- **Larry** updated `PKM/Second Brain/analysis/INDEX.md` — status changed from `🔶 v1` to `✅ v2.1 — 2026-06-04`.

## Decisions made

- **Question:** Should the Kit data analysis become a separate deliverable or live inside the Second Brain analysis file?
  **Decision:** All analysis goes directly into `subject-line-analysis.md` as the single canonical file. The raw export in `Deliverables/` is the source; the Second Brain file is the synthesis.

- **Question:** Should benchmarks (average open rate, click rate baselines) be included?
  **Decision:** No. Alyssa said she doesn't care about benchmarks — she wants pattern breakdown and frameworks. Benchmarks were stripped.

- **Question:** How should email type differentiation be handled?
  **Decision:** A dedicated "By Email Type" section with separate formulas, rules, and template banks for Soft Sunday, webinar, launch, and replay. The email type determines which pattern family to pull from.

## Insights

- **The "re:" pattern was completely missing from v1** despite being the #1 open rate pattern in 351 broadcasts (57.35%). Always check what's confirmed by data before assuming the existing analysis is complete.
- **Opens ≠ clicks — they require different formulas.** `re: tmrw's meeting` = 57.35% open rate, 0.69% click rate. `DON'T "grow your list"` = 34.41% open rate, 5.42% click rate. Matching formula to email job is the most important decision before writing any subject line.
- **`Why I burned down a perfectly good business (on purpose)` is the gold standard** — the only subject in 351 broadcasts to crack top performers on both opens and clicks. It layers Pattern 4 (Why I) + Pattern 6 (contradiction). Study this as a template.
- **The Anti-Advice Reframe (DON'T + "do this instead") is the entire BOH philosophy in a subject line** — 5.42% click rate, 1,209 total clicks, #1 in dataset. It works because it calls out the wrong default and promises the better system, which is exactly what BOH sells.
- **Fractional pattern numbering (1B, 6B, 6C) makes files harder for LLMs to navigate** — clean sequential numbering is the right format for any file that will be used by AI team members.
- **Template banks per pattern are the most immediately useful element for Wren** — not the analysis prose, but the fill-in-the-blank templates. Future Second Brain analysis files should include them from the start.

## Realignments

- "idk if i really care that much about the benchmarks what i really want is the pattern breakdown" — stripped benchmarks section, focused entirely on pattern and type differentiation.

## Open threads

- [ ] `PKM/Second Brain/examples/subjects-and-previews.md` is still missing — Wren's routing file references it as a future source of real examples. Build this when the raw Kit subject/preview archive is available. (Carried from prior session.)
- [ ] [[Studio/Analysis/Frameworks/subject-line-operating-system]] references "12 named patterns" in its intro — should be updated to "11 patterns" now that v2.1 is the canonical file. Low priority.
- [ ] The Kit raw export in [[Deliverables/2026-06-03-kit-broadcast-performance-export]] is a data artifact, not a usable analysis file. Can be archived or deleted once Alyssa confirms the Second Brain file has everything she needs.

## Next steps

- When Wren writes subject lines: read `subject-line-analysis.md` v2.1 → identify the email's job (Four Subject Line Jobs) → pick from the matching pattern family → deliver with subject + preview.
- Use [[Studio/Analysis/Frameworks/subject-line-operating-system]] as the Wren interface layer on top of this analysis.
- If the examples file (`examples/subjects-and-previews.md`) gets built, it will strengthen every pattern here with real cited examples — flag that build when there's bandwidth.

## Cross-links

- [[2026-06-03-22-20_larry_kit-subject-line-system]] — prior session that surfaced the Kit data and created the subject-line-operating-system framework
- [[2026-06-03-17-00_larry_second-brain-depth-analysis-and-wren-hire]] — session where Wren was brought on and Second Brain analysis layer was built
- [[2026-06-04_larry_second-brain-carousel-analysis-and-vault-cleanup]] — parallel Second Brain work same day
