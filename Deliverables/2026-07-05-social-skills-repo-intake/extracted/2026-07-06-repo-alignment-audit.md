# Repo Alignment Audit — Social Skills Intake

Date: 2026-07-06
Author: Larry (worker pass)
Status: consolidation pass over existing extraction work — no new repo mining was needed; this file re-frames prior extraction (`social-skill-coverage-map.md`, `hook-patterns-map.md`, `anti-slop-crosswalk.md`, `mean-alyssa-review-panel-map.md`) into ALIGNS / CONFLICTS / BUILD-INTO-INSTRUCTIONS per Alyssa's three-layer doctrine (IG craft → her spin → her teaching).

**Filter used throughout:** Alyssa's rules in `Hermes/craft/captions-carousels.md` (cover rules: ≤7 words, payoff mandatory, no reframe on covers, second-person now LEGAL per 2026-07-06 ruling, period-or-nothing) and `PKM/Second Brain/frameworks/carousel-framework.md` (6 archetypes, THE flow, voice-signature system). Anything that duplicates her existing, more specific rules is marked skip/redundant rather than aligned — redundancy isn't a conflict, but it isn't a new instruction either.

**Note on second-person:** the hook-patterns-map.md and social-skill-coverage-map.md extractions (dated 2026-07-05) still ban "you/your" on covers as a hard rule. Her 2026-07-06 ruling in captions-carousels.md legalized second-person on covers. This audit applies the newer ruling; any "second-person banned" language quoted from the 2026-07-05 extraction files below is historical and should not be read as current law.

---

## (a) One-Screen Verdict Table

| Repo / Skill | Verdict | One-line why |
|---|---|---|
| **aaaronmiller/create-viral-content** — SKILL.md hook architecture | Partial | Hook taxonomy converges on her 7 formulas (no new shapes); the AI-tell taxonomy and five-pass refinement protocol are genuinely useful process, not copy |
| create-viral-content — `references/refinement-protocol.md` (Skeptic→Expert→Scroller→Competitor→Editor) | Aligned | Adversarial pass order is sound, adopt order not voice; fills a real gap in Mean Alyssa (no Skeptic/Competitor pass today) |
| create-viral-content — `references/title-formulas.md` | Conflicts (mostly) | Curiosity-Gap, Contrarian, Comparison formulas mostly reframe-shaped or generic-viral; "Fix" formula and negative-superlative data point are the only usable pieces |
| create-viral-content — `references/ai-tells.md` | Partial | Organizing taxonomy is useful; several individual bans (blanket adverb kill, blanket passive-voice kill) directly conflict with her voice |
| **blacktwist/social-media-skills** — `hook-writer-sms` | Partial | 9-pattern taxonomy and first-3-words test are useful vocabulary/triage; actual hook copy is below her texture floor |
| blacktwist — `caption-writer-sms` | Partial | Platform character-count mechanics (IG 125-char fold, Pinterest 500-char cap) are new and useful; voice/register guidance is redundant, hers is more forensic |
| blacktwist — `carousel-writer-sms` | Partial | Word-cap-per-zone (30/body, 8/header) is a usable mechanical check; the 4-zone structural framework itself is thinner than THE flow, skip |
| blacktwist — `content-repurposer-sms` | Partial | Repurposing matrix and "don't flood the feed same-day" guardrail useful; per-platform tone table is generic, skip |
| blacktwist — `content-calendar-sms` | Partial | 20-30% flexible-slot rule and no-pillar->40% rule are useful calendar hygiene; batching/review-cadence scaffolding is agency-generic, skip |
| blacktwist — `performance-analyzer-sms` | Partial | "Benchmark against own averages, never industry vanity metrics" worth promoting to explicit rule; generic diagnostic template is lower priority, she already has real per-post data |
| **coreyhaines31/marketingskills** — `copywriting/SKILL.md` | Partial | "So What" bridge test is a clean, adoptable diagnostic; headline formulas/CTA formulas are generic SaaS landing-page conventions, skip |
| marketingskills — `copy-editing/SKILL.md` | Partial | Seven Sweeps framework and banned-vocabulary crosswalk table are useful; page-structure-specific sweeps are irrelevant to carousels/captions |
| marketingskills — `content-strategy/SKILL.md` | Partial | Buyer-stage keyword map and searchable-vs-shareable lens are useful Test Kitchen filters; SEO/keyword-volume content is irrelevant, skip |
| marketingskills — `ab-testing/SKILL.md` | Partial | ICE score (Impact+Confidence+Ease) and "peeking problem" discipline are reusable; statistical test-design mechanics are irrelevant, skip |
| **hardikpandya/stop-slop** — SKILL.md + phrases.md + structures.md | Partial | Wh-opener, false-agency, pleonasm, burstiness tells are genuinely new lint additions; blanket adverb ban and blanket passive-voice ban directly conflict with her voice |
| **shixinzhang/tiktok-viral-hooks** — by-pattern index | Conflicts (as source) / Partial (as method) | Hook corpus is CC BY-NC-SA, food/relationship/non-English niche, near-zero transferability and licensing blocks verbatim use; the forensics METHOD (textual/emotional/keyword breakdown) is a reusable structure, reference-only |
| **wan-huiyan/agent-review-panel** — README + SKILL.md + signals-and-checklists.md + research-foundations.md | Aligned | Control-validation gate (decoy calibration), subtract-points+veto scoring, blind-final ordering, and confidence-gating directly solve Mean Alyssa's Round 2 false-positive problem — highest-value repo in the intake |
| **Blotato** `viral-hooks/SKILL.md` | Conflicts (as source) / Partial (as method) | 100-hook library is dominated by second-person/reframe/generic-viral shapes that mostly fail her rules anyway even post-2026-07-06 ruling (still fails payoff-mandatory + weird-beats); first-3-words test and batch-variety rule are usable process |
| Blotato `post-grader/SKILL.md` | Aligned | Hook-weighted-50%-of-score and mandatory "top 3 fixes" (quote line/why/rewrite) format are cleanly adoptable, most actionable single item for Maitre d' |
| Blotato `post-writer/SKILL.md` | Skip (as source) / Partial (as reference) | Hermes is the only writer per FABLE.md rule 6; "write hook first, iterate 3-5x" and platform-CTA-to-algorithm table are reference-only convergence data |
| Blotato `post-scheduler/SKILL.md` | Irrelevant (for now) | No live scheduling integration exists; mechanical-lint-separate-from-voice-review precedent is a minor confirmation, not new |
| Blotato `repurpose/SKILL.md` | Partial | Strict output-count discipline ("don't pad, produce fewer strong ones") and "reuse a theme only when the angle changes" are good anti-padding rules |
| Blotato `brand-brief/SKILL.md` | Skip (as system) / Partial (as elicitation) | BUSINESS.md/TASTE.md already do this more rigorously; the "wedge" elicitation-pushback question is a usable riff technique only |
| Blotato `content-coach/SKILL.md` | Irrelevant | Beginner onboarding flow, Alyssa is not the target user, no station match |
| Blotato ASO/cold-email/churn-adjacent skills (not present in this intake — none found beyond the 7 listed) | N/A | Not present in this repo set; nothing to dismiss |

---

## (b) Per-Repo Detail

### 1. aaaronmiller/create-viral-content
**License:** none detected — reference-only, no verbatim reuse permitted (per manifest.md).

**ALIGNS:**
- Five-pass adversarial refinement protocol — Skeptic ("why should I care, what's actually new") → Expert (technical-accuracy nitpick) → Scroller (attention gate) → Competitor (differentiation vs. recent output) → Editor (cutting pass). Quote: their stated rationale is "no point polishing content that has no value," "hook only matters if content is solid," "differentiation requires strong foundation," "cutting is the final step." This is sound sequencing logic, and Mean Alyssa currently has no Skeptic pass (kills substance-empty concepts before wasting review cycles) and no Competitor pass (checks new concepts against her own recent real decks — this operationalizes her "never recycle a documented winner" rule, currently manual pattern-matching).
- Negative-superlative data point ("negative outperforms positive by 63%, Outbrain-cited") — supports, as evidence, her existing threat-payoff category ("...Is Dying"), not a new shape to add.
- The "So what" / Fix formula ("[Problem]? Here's the fix") maps cleanly onto her existing payoff category #1 (fix).

**CONFLICTS:**
- Most of `title-formulas.md`'s other categories (Curiosity-Gap "what X won't tell you," Contrarian "is dead," Comparison "vs") either violate the reframe ban, are generic-internet-viral (fails texture floor), or invite recycled constructions.
- `ai-tells.md`'s implicit blanket bans on adverbs and passive voice, if adopted mechanically, would sand down her run-on/aside-heavy voice — explicitly named as an over-correction trap in `extracted/anti-slop-crosswalk.md` Section 4.

**BUILD INTO INSTRUCTIONS (source: `repos/aaaronmiller__create-viral-content/references/refinement-protocol.md`):**
- Adopt the pass ORDER (Skeptic → Expert → Scroller → Competitor → Editor) for Mean Alyssa, not their voice/tone language.

---

### 2. blacktwist/social-media-skills
**License:** MIT.

**ALIGNS:**
- `hook-writer-sms/SKILL.md`: the first-3-words test as a standalone gate — "would you stop scrolling for this line if you didn't write it?" A fast pre-Maitre-d' triage. Compatible because it's a filter, not a shape.
- `caption-writer-sms/SKILL.md`: hard platform mechanics her craft file doesn't encode outside IG — IG 125-char fold, FB ~120 mobile fold, Pinterest 500-char description cap; "never duplicate hashtags across platforms."
- `carousel-writer-sms/SKILL.md`: explicit word caps per zone (30 words max per body slide, 8-word header cap) as a hard mechanical check Maitre d' can run independent of content quality. "Write the cover last" as workflow order matches her stated practice of building the argument before the hook.
- `content-repurposer-sms/SKILL.md`: the repurposing matrix (source format → best derivatives → visual asset needed) as lookup scaffolding; explicit anti-pattern "posting all derivatives the same day floods the feed."
- `content-calendar-sms/SKILL.md`: the 20-30% flexible/open slot rule ("reactive capacity isn't wasted capacity") and "no pillar dominates more than 40% of slots" as numeric guardrails.
- `performance-analyzer-sms/SKILL.md`: "benchmark against the user's OWN averages, never industry vanity metrics" — already her implicit practice, worth making explicit.

**CONFLICTS:**
- The actual hook COPY examples ("Stop posting every day," "82% of X fail") are far below her texture floor — generic and pattern-matched, exactly what the weird-beats-formula rule forbids.
- `hook-writer-sms`'s "Empathy" pattern ("If you're struggling to stay consistent...") — a soft second-person opener that, even under the new legal-second-person ruling, still lacks the mandatory payoff and reads as generic engagement bait, not a coined/weird beat.
- Pinterest-style pure-SEO keyword-stuffed titles ("Small Kitchen Organization Ideas for Renters") — pattern-matched by definition, violates her "coined concept beats pattern-matched winner" rule.

**BUILD INTO INSTRUCTIONS (source paths below):**
- First-3-words gate (`skills/hook-writer-sms/SKILL.md`).
- Character-count fold points per platform (`skills/caption-writer-sms/SKILL.md`).
- Word-cap-per-zone mechanical check, 30 words/body slide, 8 words/header (`skills/carousel-writer-sms/SKILL.md`).
- 20-30% flexible calendar slot rule + 40% pillar-dominance cap (`skills/content-calendar-sms/SKILL.md`).
- Benchmark-against-own-averages-only rule (`skills/performance-analyzer-sms/SKILL.md`).

---

### 3. coreyhaines31/marketingskills
**License:** MIT.

**ALIGNS:**
- `copywriting/SKILL.md`: the "So What" bridge test ("which means...") as a per-claim diagnostic — does every stated feature/mechanic actually land a benefit, or is it a dangling fact?
- `copy-editing/SKILL.md`: the Seven Sweeps framework (Clarity → Voice/Tone → So What → Prove It → Specificity → Heightened Emotion → Zero Risk, looping back through prior sweeps) as an optional deep-edit pass for high-stakes copy (sales pages, launch emails), not routine carousels. The word-level banned-vocabulary crosswalk table (utilize→use, leverage→use, robust→strong) worth checking against ANTI-AI.md for gaps.
- `content-strategy/SKILL.md`: "searchable vs. shareable, prioritize in that order" as a two-axis lens for judging whether a pitch concept is chasing the wrong kind of reach.
- `ab-testing/SKILL.md`: the ICE score (Impact + Confidence + Ease / 3) as a clean 3-factor prioritization shorthand; the "peeking problem" (don't call a winner before enough signal, pre-commit to a decision point) as a discipline analogy for blind scoring.

**CONFLICTS:**
- Headline formulas and CTA formula ("[Action Verb] + [What They Get]") are generic SaaS-landing-page conventions, irrelevant to carousel/caption format — not a rule violation so much as a category mismatch.
- SEO-specific content strategy mechanics (hub-and-spoke URLs, keyword-volume scoring) — irrelevant, her business doesn't run on organic search content.

**BUILD INTO INSTRUCTIONS (source paths below):**
- "So what?" per-claim bridge test (`repos/coreyhaines31__marketingskills/skills/copywriting/SKILL.md`).
- ICE score as a tie-breaker when multiple concepts clear Mean Alyssa in the same batch (`repos/coreyhaines31__marketingskills/skills/ab-testing/SKILL.md`).

---

### 4. hardikpandya/stop-slop
**License:** MIT.

**ALIGNS:**
- Several NEW anti-AI tells not yet in `Hermes/ANTI-AI.md`, each screened against her voice carve-outs in `extracted/anti-slop-crosswalk.md` Section 2: Wh-word sentence openers as rhetorical setup; false agency verbs ("the data tells us," "the market rewards" — scoped to a specific verb list, not banning all abstract subjects); narrator-from-a-distance ("people tend to..." vs. her actual direct-to-"you" address — this one actually reinforces her voice); pleonasms/tautologies ("true fact," "end result," "revert back"); burstiness/uniform-sentence-length as a length-variance heuristic (aligns with her "always long sentences, staccato only at peak" rule); paragraph-initial hedge words beyond her existing list ("Overall," "Importantly,").

**CONFLICTS:**
- Blanket adverb ban ("kill all adverbs, no -ly words") — direct conflict, her voice runs on run-ons and natural spoken rhythm; ANTI-AI.md never bans adverbs as a class, and this would sand toward the "aggressively choppy, adverb-free prose is its own AI template" she explicitly warned against.
- Blanket passive-voice ban ("every sentence needs a human subject doing something") — too rigid for her long winding sentence style; some passive constructions read naturally inside a run-on aside.
- "Two items beat three" / no-three-item-lists-ever — collides with her own grandfathered real three-act structures (e.g., "Reason nO1/nO2/nO3"); her narrower version (ban shallow enumeration only) already supersedes this.

**BUILD INTO INSTRUCTIONS (source: `repos/hardikpandya__stop-slop/SKILL.md`, `references/phrases.md`, `references/structures.md`):**
- Wh-opener, false-agency (scoped verb list), narrator-from-a-distance, pleonasm, burstiness, and paragraph-initial-hedge lint additions — all as SUPPORT LAYER flags for human review, never auto-kill, per `extracted/anti-slop-crosswalk.md` Section 3.

---

### 5. shixinzhang/tiktok-viral-hooks
**License:** CC BY-NC-SA 4.0 — reference-only, no commercial verbatim reuse, attribution required if used at all.

**ALIGNS:**
- The hook-forensics METHOD itself: breaking a hook into "what happens textually / why it stops the scroll / emotional rhythm / keyword density / what you can steal" — a reusable analytical template independent of the content it's applied to.
- The reach-word vs. emotional-word two-layer lens (e.g., "juice, carrot, organic" = reach; "quintet, strain, secret rule" = emotion) — her hooks already do this instinctively ("chat-written" = emotional, "Pinterest/marketing/2026" = reach) but doesn't currently name the split as a discrete check.

**CONFLICTS:**
- The actual hook corpus: food/relationship/entertainment niche, mostly non-English-origin machine-translated content — near-zero transferability to a coaching/business audience even before voice-rule filtering, and the CC BY-NC-SA license blocks any verbatim commercial use regardless.
- TikTok-native spoken-hook conventions ("wait for it," "POV:") — platform-wrong, these are talking-head-video conventions for a format Alyssa doesn't run.
- Astrological-authority and call-and-response patterns sampled from the corpus — niche-wrong, zero transferability.

**BUILD INTO INSTRUCTIONS (source: `repos/shixinzhang__tiktok-viral-hooks/by-pattern/en/`):**
- Dual-layer keyword check: every cover needs one reach-word (topical/searchable) and one coined/emotional word — as a Maitre d' checklist line, reference-only, not sourced verbatim from the corpus text.

---

### 6. wan-huiyan/agent-review-panel
**License:** MIT. **Highest-value repo in the intake — directly solves an active, named problem (Mean Alyssa Round 2's false-positive-on-real-material failure).**

**ALIGNS:**
- Control-Validation Gate (v3.6): before trusting any score, run a degenerate control (zero real input) through the same judges; a valid judge must score the control below 3/10 while scoring the real deliverable meaningfully higher, or be dropped. This is the exact missing piece for Mean Alyssa's Round 2 problem, run in the inverse direction: known-good all-real control lineups, judge must NOT flag them as fake.
- Subtract-points + veto scoring (start every axis at 10, deduct 1-2 per hole/cliché/unsupported claim, fatal violation = veto to 0) instead of add-points — their research names add-point scoring as the direct cause of "agreeable 9s" / non-discriminating panels.
- Blind Final ordering (Phase 7): each judge files an independent written verdict before any cross-judge comparison, no visibility into peers' finals.
- Confidence gating (Trust-or-Escalate, ICLR 2025 Oral): verdicts carry explicit High/Medium/Low confidence; Low triggers mandatory human-review flag rather than a silent pass.
- Correlated-bias warning: when all reviewers agree with score spread < 2, that's flagged as the MOST dangerous failure mode (likely shared model bias), not the safest.
- Reasoning-strategy diversity per persona (DMAD, ICLR 2025) — assign each judge a distinct reasoning strategy/failure-catching angle rather than reusing generalist gates.

**CONFLICTS:**
- None identified — this repo's mechanics are process/QA infrastructure, not voice or content, so there's no direct collision with her craft rules. The only caution: don't import panel prose as team canon without provenance (per manifest.md prohibited_use), and don't let their per-run-only calibration replace the extended per-judge, cross-round precision tracking already planned in `mean-alyssa-review-panel-map.md`.

**BUILD INTO INSTRUCTIONS (source: `repos/wan-huiyan__agent-review-panel/README.md`, `skills/agent-review-panel/SKILL.md`, `docs/research-foundations.md`):**
- Judge-calibration protocol run before every round (3-5 known all-real control lineups; judge passes only if ≤1 non-"sure" false positive, zero "sure"-confidence false positives).
- Subtract-points + veto scoring replacing "does this look real/fake" gut verdicts.
- Correlated-bias flag when judge score spread < 2 across a lineup.
- Per-judge, per-round precision tracking (extension beyond the repo's per-run-only design), per `extracted/mean-alyssa-review-panel-map.md`'s "Mean Alyssa v2 protocol," steps 2 and 6.

---

### 7. Blotato skills (blotato-skills/ + blotato-official/)
**License:** vendor/private, license unknown — reference-only, do not activate raw, do not blend into Alyssa source without provenance (per manifest.md).

**ALIGNS:**
- `post-grader/SKILL.md`: hook weighted at 50% of total score — the single most transferable mechanic in the whole intake. Quote: no post can score above ~7.5 with a weak hook. The mandatory "top 3 fixes" output discipline — every flagged issue must cite the exact line, state why it hurts, and give the specific rewrite (not "make the hook better"). The voice-rules audit as pass/fail line items run as a separate mechanical layer BEFORE the subjective score — confirms the existing "MECHANICAL lint by actual tool run" split in FABLE.md §3.
- `viral-hooks/SKILL.md`: the first-3-words test run as a formal, repeatable step; explicit instruction to vary hook category across a batch so a feed doesn't read as formulaic — reinforces her "never recycle a construction" rule from a batch-level angle.
- `repurpose/SKILL.md`: strict output-count discipline ("exactly 3 LinkedIn, 5 threads... don't pad if the source is too thin, produce fewer strong ones instead"); "reuse a strong theme across formats only when the angle changes — do not publish the same post twice in different fonts."
- `post-writer/SKILL.md`: "write the hook first, iterate 3-5 times, don't touch the body until the hook clears" — independent convergence with her own practice, reference-only since Hermes is the sole writer.

**CONFLICTS:**
- The 100-hook library in `viral-hooks/SKILL.md` is dominated by second-person, reframe-adjacent, and generic-viral shapes. Even under the 2026-07-06 second-person-is-legal ruling, most of these still fail the payoff-mandatory and weird-beats-formula rules — they're pattern-matched templates, the exact thing "coined concept beats pattern-matched winner" forbids. Do not adopt hook TEXT from this library, only the process mechanics.
- `brand-brief/SKILL.md`'s file structure — BUSINESS.md + TASTE.md already do this job more rigorously with verbatim sourcing; adopting the Blotato structure would be a downgrade.
- `content-coach/SKILL.md` — fully out of scope, Alyssa isn't a content-coaching beginner.

**BUILD INTO INSTRUCTIONS (source paths below):**
- Hook = 50% of Maitre d' score, hard ceiling ~7.5 with a weak hook (`blotato-skills/post-grader/SKILL.md`).
- Three-part rejection format: quote line → why it hurts → exact rewrite (`blotato-skills/post-grader/SKILL.md`).
- Batch-variety rule: no more than 2 of 5 pitched concepts may share a hook formula (`blotato-skills/viral-hooks/SKILL.md`).
- Anti-padding output-count discipline: produce fewer strong derivatives rather than padding to a requested count (`blotato-skills/repurpose/SKILL.md`).

---

## (c) Build Into Instructions — Final Distilled Rule Set

These are the concrete, ready-to-adopt rules distilled from the ALIGNS material above. Each is standing mandatory-load instruction for pitch/hook/caption work going forward, with its source file cited.

1. **Hook = 50% of Maitre d's score; no post/deck can score above ~7.5/10 if the hook scores below 8.**
   Source: `Deliverables/2026-07-05-social-skills-repo-intake/blotato-skills/post-grader/SKILL.md`

2. **Every Maitre d'/Mean Alyssa rejection must use the three-part fix format: quote the exact line → state specifically why it hurts (cite the broken rule) → give the specific rewrite.** Never a bare "tighten this."
   Source: `Deliverables/2026-07-05-social-skills-repo-intake/blotato-skills/post-grader/SKILL.md`

3. **Run the first-3-words test as a discrete, named pre-Maitre-d' gate on every cover:** isolate the first 3 words alone and ask whether they create alarm, curiosity, or a claim independent of the rest of the sentence.
   Source: `Deliverables/2026-07-05-social-skills-repo-intake/repos/blacktwist__social-media-skills/skills/hook-writer-sms/SKILL.md`; corroborated by `blotato-skills/viral-hooks/SKILL.md`

4. **Batch-variety gate: if Test Kitchen pitches 5 concepts, no more than 2 may share a hook formula** (Paradox, Bold Outcome, Personal Testimony, Trend Alarm, Reframe Question, Audience Identity, Visual Joke). Enforce at pitch stage, before Mean Alyssa scoring.
   Source: `Deliverables/2026-07-05-social-skills-repo-intake/blotato-skills/viral-hooks/SKILL.md`; also `repos/blacktwist__social-media-skills/skills/content-repurposer-sms/SKILL.md`

5. **Dual-layer keyword check: every cover needs one reach-word (topical/searchable) and one coined/emotional word.** Check both are present before a cover ships.
   Source: `Deliverables/2026-07-05-social-skills-repo-intake/repos/shixinzhang__tiktok-viral-hooks/by-pattern/en/` (method only, no corpus text used — CC BY-NC-SA)

6. **"So what?" bridge test on every hook and every teaching claim: after drafting, ask "so what?" once, out loud. If nothing answers, it's a label, not a hook** (or a dangling fact, not a benefit, for teaching claims).
   Source: `Deliverables/2026-07-05-social-skills-repo-intake/repos/coreyhaines31__marketingskills/skills/copywriting/SKILL.md`

7. **Add a Skeptic pass to Mean Alyssa BEFORE the ANTI-AI senior pass: "why should I care, what's actually new here?"** Kill substance-empty concepts before spending review cycles polishing their voice.
   Source: `Deliverables/2026-07-05-social-skills-repo-intake/repos/aaaronmiller__create-viral-content/references/refinement-protocol.md`

8. **Add a formal Competitor pass to Mean Alyssa's tournament: check each surviving concept against Alyssa's own recent real decks/captions**, operationalizing the "never recycle a documented winner" rule instead of leaving it to manual pattern-matching.
   Source: `Deliverables/2026-07-05-social-skills-repo-intake/repos/aaaronmiller__create-viral-content/references/refinement-protocol.md`

9. **Judge calibration protocol, run before every Mean Alyssa tournament round:** give each judge 3-5 control lineups that are 100% real Alyssa decks (unknown to the judge). A judge advances only if they clear these controls — at most one non-"sure" false positive, zero "sure"-confidence false positives on real material. A judge who fails is not used for that round; misfires get folded back into ANTI-AI/STYLE carve-outs if they reveal a real pattern being over-penalized.
   Source: `Deliverables/2026-07-05-social-skills-repo-intake/repos/wan-huiyan__agent-review-panel/` (README.md, skills/agent-review-panel/SKILL.md, docs/research-foundations.md); adapted in `Deliverables/2026-07-05-social-skills-repo-intake/extracted/mean-alyssa-review-panel-map.md`

10. **Mean Alyssa scoring runs subtract-points-from-10-per-axis with veto, not add-points.** Judge states which specific cliché/hole/tell caused each deduction; any fatal tell (banned reframe shape, non-real-source device passed off as real) is a veto to 0 on that axis, never averaged away.
    Source: `Deliverables/2026-07-05-social-skills-repo-intake/repos/wan-huiyan__agent-review-panel/docs/research-foundations.md`

11. **Correlated-bias flag: when all Mean Alyssa judges agree on a lineup with score spread < 2, treat that as the most dangerous failure signal (shared bias), not confirmation** — escalate to human review rather than logging as a clean, confident catch.
    Source: `Deliverables/2026-07-05-social-skills-repo-intake/repos/wan-huiyan__agent-review-panel/docs/research-foundations.md`

12. **Track judge precision per judge, per round, over time** (real-source false-positive rate; candidate-catch true-positive rate). A judge with a repeat pattern of real-source false positives across rounds gets retrained or retired from judging.
    Source: `Deliverables/2026-07-05-social-skills-repo-intake/extracted/mean-alyssa-review-panel-map.md` (extension beyond the source repo's per-run-only design)

13. **Word-cap-per-zone mechanical check for carousels: 30 words max per body slide, 8-word cap on headers**, run as a hard Maitre d' check independent of content quality.
    Source: `Deliverables/2026-07-05-social-skills-repo-intake/repos/blacktwist__social-media-skills/skills/carousel-writer-sms/SKILL.md`

14. **Platform character-fold checklist for The Pass when publishing outside pure-IG-carousel: IG caption fold ~125 chars, FB mobile fold ~120 chars, Pinterest description cap 500 chars. Never duplicate hashtags across platforms.**
    Source: `Deliverables/2026-07-05-social-skills-repo-intake/repos/blacktwist__social-media-skills/skills/caption-writer-sms/SKILL.md`

15. **Anti-padding output-count discipline for repurposing/derivatives: produce exactly the strong count the source supports — don't pad to a requested number with weak filler.** Reuse a theme across formats only when the angle actually changes; never publish the same post twice in different fonts.
    Source: `Deliverables/2026-07-05-social-skills-repo-intake/blotato-skills/repurpose/SKILL.md`

16. **Calendar hygiene guardrails: keep 20-30% of slots flexible/open (reactive capacity isn't wasted capacity); no single content pillar occupies more than 40% of slots in a given period.**
    Source: `Deliverables/2026-07-05-social-skills-repo-intake/repos/blacktwist__social-media-skills/skills/content-calendar-sms/SKILL.md`

17. **Post-performance review rule: benchmark every post only against Alyssa's own historical averages, never industry vanity-metric benchmarks.**
    Source: `Deliverables/2026-07-05-social-skills-repo-intake/repos/blacktwist__social-media-skills/skills/performance-analyzer-sms/SKILL.md`

18. **ICE score (Impact + Confidence + Ease / 3) as Larry's tie-breaker when multiple concepts clear Mean Alyssa in the same batch and only one can be built first.**
    Source: `Deliverables/2026-07-05-social-skills-repo-intake/repos/coreyhaines31__marketingskills/skills/ab-testing/SKILL.md`

19. **Anti-AI lint additions (support-layer, human-review-only, never auto-kill): Wh- word rhetorical openers; false-agency verbs scoped to a specific list (becomes/emerges/shifts/unlocks, "the data tells us," "the market rewards"); narrator-from-a-distance phrasing ("people tend to," "nobody designed this"); pleonasms/tautologies (true fact, end result, revert back); burstiness (4+ consecutive sentences in a narrow word-count band); paragraph-initial hedges beyond the existing list (Overall,/Importantly,).** Explicitly do NOT adopt: blanket adverb bans, blanket passive-voice bans, or a "two beats three" list-length rule — all three conflict with her actual voice and are already rejected in `anti-slop-crosswalk.md` Section 4.
    Source: `Deliverables/2026-07-05-social-skills-repo-intake/repos/hardikpandya__stop-slop/` (SKILL.md, references/phrases.md, references/structures.md); full spec in `Deliverables/2026-07-05-social-skills-repo-intake/extracted/anti-slop-crosswalk.md` Section 3

20. **Repurposing-matrix lookup for The Pass (source format → best derivative → asset needed), built from Alyssa's real formats only, plus the guardrail "don't post all derivatives of one source the same day — it floods the feed."**
    Source: `Deliverables/2026-07-05-social-skills-repo-intake/repos/blacktwist__social-media-skills/skills/content-repurposer-sms/SKILL.md`

---

**Distilled rule count: 20.**
