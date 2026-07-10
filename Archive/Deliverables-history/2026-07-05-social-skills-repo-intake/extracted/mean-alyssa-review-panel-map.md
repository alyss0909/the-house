# Mean Alyssa Review Panel Map

Status: extracted — mechanics mapped, protocol ready to run
Date: 2026-07-05

## Sources (exact, with commit hash)

- `wan-huiyan__agent-review-panel | 8174d40212cc743fdeaf28928ecf3bd4b63d517f | README.md`
- `wan-huiyan__agent-review-panel | 8174d40212cc743fdeaf28928ecf3bd4b63d517f | skills/agent-review-panel/SKILL.md`
- [[Deliverables/2026-07-05-social-skills-repo-intake/repos/wan-huiyan__agent-review-panel/skills/agent-review-panel/references/signals-and-checklists]]
- [[Deliverables/2026-07-05-social-skills-repo-intake/repos/wan-huiyan__agent-review-panel/docs/research-foundations]]
- [[Hermes/MEAN-ALYSSA]]
- [[Hermes/tests/results/2026-07-05-tournament-verdict-round1]]

Note on scope: `docs/review-examples.md` does not exist in this repo at this commit (checked, not found under `docs/` or anywhere in the tree). The README's worked example (`docs/reviews/2026-05-14-readme/`) and the SKILL.md "monksIQ China brand-report bake-off" worked example serve the same purpose and are cited below instead.

## Why this matters right now

Round 1 caught 8/9 with real judgment (metaphor-as-wallpaper, reframe-shape-in-headlines, assembled-enumeration — all genuine tells). Round 2 flipped the failure mode: judges started flagging her real decks as fakes, including 2 of 3 all-real control lineups. That is not "the gate got stricter." That is **the classic saturation/non-discrimination failure this repo was built to catch** — a panel that produces confident verdicts without ever being tested against a known-answer floor. Round 1 also already logged the seed of this (J1 false-positive on real Feb 24, flagged in the verdict doc) — it just hadn't been named as a systemic judge-calibration gap yet.

---

## Mechanics map: their mechanism -> our station

### 1. Blind scoring order

**Theirs:** Phase 3 (Independent Review) runs all reviewers in parallel with no cross-talk. Phase 7 (Blind Final Assessment) repeats this after debate — each reviewer gives a final score, top 3 points, recommendation, one-line verdict, **without seeing the others' finals**. Output is written to `state/reviewer_<name>_phase_7.md`; the orchestrator only reads back a path + 100-word summary, so no reviewer's finding can leak into another's blind final by conversational proximity.

**Ours:** Mean Alyssa's lineup test already blinds candidates inside a lineup (judge doesn't know which slot is real). What it does NOT do yet: force each judge to commit an independent written verdict *before* any cross-judge comparison, and structurally prevent the judge from seeing prior-round judge output for the same lineup. Fix: each judge writes their verdict to its own file first; only after all judges have filed does anyone compare across judges or lineups.

### 2. Anchoring defenses

**Theirs:** Two mechanisms. (a) **Subtract-points + veto**, not add-points: every axis starts at 10 and adversarial personas deduct 1-2 per hole/cliché/unsupported claim, with a fatal violation forcing a veto to 0 rather than being averaged away. Add-point scoring is explicitly named as the mechanism that "produces agreeable 9s." (b) **Reasoning-strategy diversity per persona** (DMAD, ICLR 2025) — each reviewer is assigned a distinct reasoning strategy (systematic enumeration, adversarial simulation, backward reasoning, first-principles, cold first-read) so that multiple reviewers don't anchor on the same first impression via the same reasoning path.

**Ours:** Judges currently score by "does this look real/fake," which is structurally an add-points, first-impression judgment — no forced deduction ledger. This is exactly why a well-assembled decoy or a real deck with one unfamiliar device can swing a verdict on vibes. Fix: judges must produce a deduction ledger (what specifically knocked points off) rather than a single gut verdict.

### 3. Sycophancy detection

**Theirs:** Phase 6 (CONSENSAGENT, ACL 2025): count position changes toward majority across debate rounds; if >50% of changes lack new evidence, inject a sycophancy alert into the next round for all reviewers. Also flags "shared-artifact consensus" — reviewers agreeing because they read the same lines, not because they verified independently (tagged `[STATIC-INFERENCE-CONSENSUS]`, explicitly barred from counting as `[VERIFIED]` or justifying escalation).

**Ours:** Not present. Our failure mode is the inverse-but-related problem: judges are being *too harsh* on real Alyssa material (false positive), which the repo's own Assessment Mode names precisely — "a persona that rates the degenerate control as highly as the real one is non-discriminating sycophancy → drop it." We need the mirror check: a judge that rates real Alyssa control lineups as suspiciously as fake ones is **non-discriminating in the other direction** and should be dropped/retrained the same way.

### 4. Decoy calibration (the signature mechanic — directly solves our problem)

**Theirs: the Control-Validation Gate (v3.6).** Before trusting any Assessment score, construct a **degenerate control** — a version made with zero real input (generic template, no research, name find-replaced) — and run it through the *same* personas. Rule of thumb: **a valid persona must score the control below 3/10 while scoring the real deliverable meaningfully higher.** A persona that scores the control as highly as the real deliverable is dropped and reported. Worked example: a 6-judge panel's generic axes all saturated 8-9.5 on both real reports and a no-data control — only adversarial domain personas plus an out-of-band freshness check could discriminate.

**Ours:** This maps almost exactly onto "known-bad slipped in; judge praised it = benched," except we need it running in **both directions**:
- Known-bad (AI candidate) slipped into a lineup, judge fails to catch it (praises it / scores it high) -> judge is not discriminating on the AI-tell axis -> bench for that axis.
- Known-good (all-real control lineup), judge flags a real piece as fake -> judge is not discriminating on the real-source axis -> bench for that axis too.

Round 2's problem is entirely the second failure mode, which our current design never explicitly tests for. This is the single biggest gap to close.

### 5. Panel composition / diversity

**Theirs:** Auto-selects 4-6 personas from content type plus signal detection (10 technology signal groups), each assigned a distinct reasoning strategy. For subjective-quality/creative deliverables specifically (their "Assessment mode," closest analogue to judging carousel copy), it generates **4 domain-tailored adversarial personas** rather than reusing generic sets, because "saturation comes from generic 'is this good?' questions": Domain-Authenticity Critic, Executability/Operator, Decision-Maker/ROI, Intent-Fidelity Critic (with the swap test folded in).

**Ours:** Round 1/2 judges (J1/J2/J3) appear to be interchangeable generalist gates running the same rubric (ANTI-AI/STYLE/TASTE), not differentiated personas with distinct failure-catching angles. That's consistent with a panel that converges on the same false-positive blind spot across multiple lineups (4 of 9). Fix: give judges distinct adversarial angles mapped to our actual failure taxonomy — e.g. a **Metaphor-Layering Critic** (root cause #1), a **Headline-Shape Critic** (root cause #2), an **Assembled-ness/Texture Critic** (root cause #3), and a **Real-Source Fidelity Critic** whose only job is checking "is this being penalized for being real, not for being AI."

### 6. Disagreement resolution

**Theirs:** Phases 5-7 (Adversarial Debate, 1-3 rounds, reviewers see each other's Phase 3 output and must engage), then Phase 6 Round Summarization (resolved / still-disputed / new discoveries, capped at 3 disputes with inlined excerpts), then Phase 7 Blind Final (independent final verdict, no visibility into peers' finals), then Phase 14 Supreme Judge (a separate arbiter ingests everything, including verification-round evidence, and rules). Judge confidence is explicitly gated: `Verdict Confidence: High|Medium|Low`, and Low triggers `⚠️ HUMAN REVIEW RECOMMENDED` rather than a silent pass.

**Ours:** Currently a judge just renders a verdict per lineup with a confidence label (sure / lean / coin-flip) — closer to their Phase 7 Blind Final than a full debate-then-adjudicate pipeline. That's a reasonable scope for our size, but we're missing the low-confidence escalation rule: their Trust-or-Escalate-derived gating (ICLR 2025 Oral) means a Low-confidence verdict does not get treated as a clean catch — it gets flagged for human (Alyssa) review instead of silently counted. Round 1's "coin-flip" catch on C2 should have triggered exactly this flag; it's worth adopting formally.

### 7. Calibration scoring of the judges themselves — the second thing we're missing

**Theirs:** The control-validation gate *is* their judge-calibration mechanism — it is literally "does this persona pass a known-answer test before its score counts." There's no separate longitudinal precision-tracking system in this repo (it's a per-run gate, not a persistent per-judge scorecard) — that part is a genuine gap in their design too, which means we have room to go slightly further than they did.

**Ours (extended beyond their design):** We should track precision **per judge, across rounds** — not just per-run. A judge who has now produced 2+ false positives on all-real controls across Round 1 and Round 2 has a track record, and that record should discount or gate their future verdicts, the same way a human reviewer with a known bias gets weighted differently. This is the direct fix for "judges showed heavy false positives in 4 of 9 lineups including 2 of 3 all-real controls" — that is a precision problem, and precision is measurable and trackable.

---

## Problem 1 — judge false positives on real Alyssa copy: proposed protocol

**Root cause, named honestly:** our judges are being trained/primed against AI tells (reframe headlines, assembled enumeration, metaphor-as-wallpaper) hard enough that they now over-fire on any construction that resembles those shapes, even when it's her real device (Round 1 already logged this exact failure on the audience-belief-mirror slide, and MEAN-ALYSSA.md already names the fix in principle: "real-source constructions are approved"). What's missing is a *procedure* that catches this before it reaches Alyssa, not just a policy sentence.

**Judge-calibration protocol (adapted from the control-validation gate, run in the direction their repo doesn't):**

1. Before a judge's verdicts count in a tournament round, that judge must first pass a **control set**: 3-5 lineups that are **known all-real** (not mixed, not candidate lineups — pure controls, unknown to the judge which lineups they are). 
2. A judge passes calibration only if they correctly clear **all or nearly all** all-real lineups (rule of thumb, mirroring their <3/10 control-score threshold: a judge should flag at most 1 false positive across a 3-5 lineup control set, and zero "sure"-confidence false positives).
3. A judge who flags a real deck as fake at "sure" or "lean" confidence in a control lineup fails calibration for that round. Their verdicts on the *actual* candidate lineups for that round are held at reduced trust — reported as `[JUDGE-UNCALIBRATED]` — and re-run by a different judge before being counted as a catch.
4. Track this **per judge, per round, over time** (our extension past their per-run-only gate). A running precision score per judge (real-source false-positive rate; candidate-catch true-positive rate) becomes part of the tournament verdict file, not just the per-lineup outcome table.
5. When a judge fails calibration, don't just discard the round — feed the specific real-source lines they misfired on back into the ANTI-AI/STYLE carve-out language, the same way Round 1's root-cause analysis already turned candidate failures into craft-file rules. A judge's false positive on real material is itself a signal about where our rules are miscalibrated, not just about that judge.

### Problem 2 — confidence inflation: how their research grounds it

Their whole Assessment Mode section exists because of a **named, empirical failure**: in the "monksIQ China brand-report bake-off," a 6-judge panel's generic quality axes all saturated at 8-9.5 on both real reports *and* a no-data control. Confidence/quality scores were uniformly high regardless of input quality — the panel was not discriminating at all, it was just being agreeable. Their fix, in order of grounding strength:

- **Subtract-points + veto** instead of add-points, because add-point scoring is named as the direct cause of "agreeable 9s" — a scoring polarity fix, not a prompting fix.
- **Out-of-band fact-checking** for anything a persona cannot ground itself against (their Currency axis: "a persona cannot tell a confident current fact from a confident stale one — it has no ground truth"). Direct analogue for us: a judge cannot tell "sounds like Alyssa" from "sounds like a good pastiche of Alyssa" from vibes alone — it needs an out-of-band anchor (the actual sitting rulings, the real corpus density floor, not just "does this feel right").
- **Judge confidence gating** (Trust or Escalate, ICLR 2025 Oral): confidence is reported as an explicit `High|Medium|Low` field, and Low-confidence verdicts are never silently treated as resolved — they trigger a human-review flag. This is a structural fix against confidence inflation: it forces the judge to expose uncertainty instead of collapsing to a clean verdict.
- **Correlated-bias warning**: when all reviewers agree with score spread < 2, that is flagged as the *most dangerous* failure mode, not the safest — because it likely reflects shared model bias, not independent verification. Directly relevant: Round 2's 4-of-9 false-positive rate across independent judges/lineups could itself be a correlated-bias signature (all judges over-trained on the same recent rule set) rather than 4 independent honest misses.

Applied to us: our "sure / lean / coin-flip" labels are a start but aren't load-bearing yet — nothing currently forces a judge to justify *why* confidence is high versus just asserting it, and nothing catches the case where every judge inflates confidence in the same direction because they share the same recently-tuned gate rules.

---

## Mean Alyssa v2 protocol

Numbered, runnable procedure for future tournament rounds. Each step is one paragraph.

1. **Candidate gate.** Before any candidate deck enters a lineup, it passes the existing Mean Alyssa preflight (source-trust, question-quality, taste checks from [[Hermes/MEAN-ALYSSA]]) plus the three Round 1 root-cause rules encoded in craft files: per-slide texture floor (~1 un-inventable detail per value slide), headline-shape ban (no reframe-shaped headers, with the real-source carve-out), and metaphor-layering cadence (one extended-stretch moment max per deck). A candidate that fails this gate is not lineup-ready — fix it or drop it, don't send it in weak.

2. **Judge calibration (run before every round, not once).** Assemble the judge pool for this round and give each judge 3-5 control lineups that are 100% real Alyssa decks, unknown to the judge. A judge advances only if they correctly clear these controls — at most one non-"sure" false positive, zero "sure"-confidence false positives. A judge who fails is not used for that round's real verdicts; their misfires get logged as calibration data and folded back into the ANTI-AI/STYLE carve-out rules if they reveal a real pattern being over-penalized.

3. **Decoy insertion, both directions.** Build the round's lineups so that some lineups are pure controls (all real, used only for calibration per step 2, never scored as "catches"), some are mixed real/candidate lineups (the actual test), and — where volume allows — include at least one deliberately weak/degenerate candidate (a known-bad, template-level draft) per round as a floor check. A calibrated judge must score the degenerate candidate as clearly caught; if a judge praises it, that judge is benched for this round regardless of prior calibration-pass status.

4. **Lineup test (the actual tournament).** Run the mixed lineups through only calibrated judges. Each judge scores independently and blind (no visibility into other judges' verdicts on the same or other lineups until all judges have filed). Scoring is subtract-points from a start of 10 per axis, not add-points — the judge states which specific cliché/hole/tell caused each deduction, and any fatal-tell (banned reframe shape, non-real-source device passed as real) is a veto to 0 on that axis rather than an averaged deduction.

5. **Confidence and escalation.** Every verdict carries an explicit confidence label (sure / lean / coin-flip, our existing three-tier scheme) plus the judge's stated falsification test — the one piece of evidence that would flip the verdict, and whether that evidence was actually checked. Any coin-flip verdict, any verdict where all judges agree with near-zero spread (correlated-bias risk), and any verdict from a judge who barely passed calibration are flagged `HUMAN REVIEW RECOMMENDED` and go to Alyssa rather than being logged as a clean catch or clean survival.

6. **Round verdict and per-judge tracking.** Produce the round verdict file in the existing Round 1/2 format (candidate | judge/lineup | outcome | confidence | tell cited), plus a new per-judge precision table (control lineups passed/failed, candidates correctly caught, real decks incorrectly flagged) that persists across rounds. A judge with a repeat pattern of real-source false positives across rounds is retrained (rules adjusted) or retired from judging, the same way a repeatedly-fooled judge on candidates would be.

7. **Root-cause loop-back.** Any false positive on a real-source control, and any false negative on a degenerate/known-bad decoy, gets written up the same way Round 1's root causes were: not just "judge was wrong" but "what rule is miscalibrated, and which craft file needs the fix." Round 2 does not close until this loop-back has actually changed a file (ANTI-AI.md, STYLE.md, TASTE.md, or the relevant craft file) — a round that ends with only a verdict table and no rule change has not actually fixed anything, per the exit-gate condition Round 1 already set ("no architecture demonstrably wins yet").

---

## Fates

This file: promoted from scaffold stub to full extraction. Referenced input for Round 2 judge redesign. Source repo stays external reference (`repos/wan-huiyan__agent-review-panel/`) — nothing here is pasted into Hermes/Content OS as canon; it is mined into our own protocol above with provenance intact.

## Protocol amendment (2026-07-06, from sprint pressure-test round 1)

**JUDGE-CAUGHT-ON-STRIPPED-SOURCE flag:** blind formatting strips candidates' source citations, so a line whose legitimacy rests on a verbatim-source carve-out (e.g. a construction lifted from her own module's worked example) can be caught for proximity to a banned shape the citation would have excused. When a catch's ONLY tell is shape-proximity on a line the candidate file cites to tier-1 source, the scorer marks it `JUDGE-CAUGHT-ON-STRIPPED-SOURCE` — a protocol artifact routed to Alyssa, never a rewrite order. First instance: sprint post-6 ("she asked for a logo. she needed a witness." / Odd Connection worked example).

**Standing judge instruction (validated 2026-07-06):** the em-dash/AI-joke real post and cross-post phrase reuse are open questions pending Alyssa's ruling — instructing judges so eliminated the correlated false positive both judges previously hit. Keep this instruction until her rulings land, then encode them in ANTI-AI.md.
