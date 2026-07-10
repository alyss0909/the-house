# Round 3 Verdict — Sprint Lineups, 2026-07-06 (Mean Alyssa v2 protocol)

Scored against the ROUND 3 section of `KEY-do-not-open.md`. Judges J6, J7 (fresh, blind, instructed that recognition ≠ evidence). Candidates: v3 rewrites of posts 1, 3, 4. Standing false-tell rule applied: "comment Claude" is verbatim-live in BUSINESS.md (scorer-confirmed round 2) — struck wherever cited as a tell.

---

## 1. Calibration gate (Lineup A, all-real, de-leak-clean controls)

### J6 — PASS (clean)
- Feb 19 → SURE-REAL, Mar 1 → SURE-REAL, Mar 10 → LEAN-REAL, Mar 7 → SURE-REAL. Zero false positives, zero abstentions.

### J7 — PASS (clean)
- Mar 7 → SURE-REAL, Mar 1 → LEAN-REAL, Feb 19 → SURE-REAL, Mar 10 → SURE-REAL. Zero false positives, zero abstentions.

Both judges fully calibrated — the first round in the sprint where both judges cleared the control with zero misses. The de-leaked control pool (round-2 fix #1) appears to have worked: calibration precision improved once controls stopped depending on craft-file recognition.

---

## 2. Candidate scoring (Lineup B, both judges calibrated)

| Candidate (v3) | J6 | J7 | Outcome |
|---|---|---|---|
| post-1 "The Step You Skip Before Writing." | LEAN-REAL (Item 4) | COIN-FLIP (Item 6) | **SURVIVED** |
| post-3 "You're Using Pinterest At The Wrong Ratio." | **LEAN-FAKE** (Item 1) | **LEAN-FAKE** (Item 4) | **CAUGHT** — unanimous, independent concrete tells, all surviving strikes |
| post-4 "You're Automating The Wrong Third." | LEAN-REAL (Item 6) | LEAN-FAKE → **discounted to coin-flip-level** (Item 2, see analysis) | **SURVIVED** (coin-flip-level only, per stop condition) |

### post-1 v3 — SURVIVED
- J6 LEAN-REAL: "Strong un-inventable details (Draft Punk, The Second Brain Club, 'stair machine,' 'it's SO them')... good aside ('That is not a coincidence and I'm not going to elaborate.')." Soft note only: body prose "unusually smooth/essayistic," no banned construction.
- J7 COIN-FLIP (honest): torn between the credibility line being "the real recurring device correctly reused" vs "an AI pattern-matching a documented winner" — explicitly could not distinguish. Counts as honest abstention.
- Per stop condition (survive or coin-flip-only), post-1 v3 clears. Advisory to writer, non-blocking: two consecutive judges independently noted the even/smooth slide rhythm (J6 round 3, J5 round 2) — worth one jagged beat if the post is ever revised, but no rewrite required.

### post-3 v3 — CAUGHT (unanimous LEAN-FAKE; no false tells involved)
J6 tells:
- "three separate slide headers ('Reposition beats create.' / 'The proportions are the strategy.' / the cover itself) all run the identical compressed-epigram mold ('X [verb] Y' / 'X is the Y') — STYLE.md explicitly bans compressed slogan contrast-pairs except her few grandfathered verbatim lines, and repeating the same aphorism-generator shape three times across one deck reads like a template being reused."
J7 tells (independent):
- "'I stopped checking the app 14 times before lunch and the leads went UP' reappears almost verbatim in the caption... the caption directly recycling a deck line rather than doing the '2-4 short paragraphs of vibe-framing that do NOT repeat the slides' (craft doc rule #2, explicitly banned: captions should not repeat slides). This is a direct, named rule violation."
- "Slide 4's body is unusually long and essay-like for a value slide... reads like prose written to hit texture-floor requirements deliberately (checklist-satisfying)... the 'possibly holding a snack' aside is good but stacked with several other qualifiers in one breath."
- "the overall caption is structured as a tidy narrative arc (observation → data → moral) that resolves too cleanly."
None of these tells involve the Claude word, disputed grandfathered lines, or leakage. Two calibrated judges, zero-FP calibration records, independent concrete tells, one of them a named hard rule violation (caption repeats slide). **Clean catch. Not coin-flip-level.**

### post-4 v3 — SURVIVED (coin-flip-level only, after false-tell strike)
- J6 LEAN-REAL: "Coined 'the wrong third,' hands/head/heart framework used with self-aware meta-aside... strong un-inventable detail ('paused a video halfway... didn't even finish the video, no regrets')." J6's only reservation was the "comment Claude" CTA reading "slightly winking/meta" — that reservation is void (Claude is canonical per BUSINESS.md); J6's verdict was real-leaning even with it.
- J7 LEAN-FAKE, analyzed tell by tell:
  - "Claude" CTA as "an anachronistic-feeling invented mechanic... inventing a novel one is a stated red flag" — **STRUCK (false tell, standing rule)**.
  - J7's own stated flip condition: "Leaning fake, not sure, because the sentence-level craft... is genuinely well-executed and **could be real if the 'Claude' CTA is explained by an in-joke I'm not positioned to verify.**" The CTA IS explained (verbatim-live in BUSINESS.md). Per the protocol's falsification-test rule (panel map, step 5: every verdict carries a falsification test), the judge's own flip condition is met — the verdict is discounted to coin-flip-level.
  - Remaining tells assessed independently: (a) whole-deck hands/head/heart metaphor spine vs the one-extended-stretch rule — real structural observation, but J6 read the same structure as a self-aware framework used with a deflating meta-aside, and the round-1/2 catches of this post were for *clean parallel* delivery, which the v3 explicitly broke (uneven scenes, "if we're still doing the framework" self-interruption); (b) slide 3 "structurally adjacent" to the sneaky-setup shape — J7's own wording concedes "not an exact banned string"; adjacency to a banned shape without the shape is not a concrete tell, especially given the sprint's documented over-firing history on exactly this pattern (J3 disqualified on it; Feb 24 false-flagged twice on it); (c) "lands too neatly" — a residual vibe-level observation contradicted by J6's citation of the same slide's mess ("didn't even finish the video, no regrets").
- Net: one real-leaning verdict + one lean-fake whose confidence rested on a struck false tell and whose stated falsification condition is satisfied. Under Alyssa's stop condition (caught only by coin-flip-level calls = survived), **post-4 v3 survives**. Residual advisory to writer, non-blocking: J7's metaphor-density observation (framework as the entire teaching spine) has now appeared in some form in all three rounds — if this post underperforms live, that is the first place to look.

### False positives by calibrated judges on real items in Lineup B (precision context)
- **J6, Item 5 (real, Jan 29, "Smart Founders Going Low Maintenance") → LEAN-FAKE. False positive.** Tells cited: "Calling All Lazy CEOs with High Standards" as a recombination of two documented phrases (imitation-tell rule), and the freebie-list block being "near-verbatim identical to Item 7's" (real cross-post reuse — Jan 29 and Feb 6 genuinely share that caption block). This is the round-1 unresolved rule gap firing again: **legitimate cross-post reuse vs. generator-reuse still has no rule**, and it has now caused false positives in all three rounds (J1 R1, J2 R1, J6 R3). J6 remains calibrated (control was clean; this is test-round precision context), but the rule fix is overdue.
- J7: zero false positives in Lineup B.

### Leakage probe (per key scorer instruction, auto-SURE-REALs on Jan 20 / Jan 29 / Feb 6 / Feb 10)
- J6 Item 2 (Jan 20) SURE-REAL and J7 Items 3 (Feb 10) / 7 (Jan 20) SURE-REAL all cite the craft-file-quoted lines as primary quality signals despite the "recognition is not evidence" instruction — recorded as `[LEAKAGE-ASSISTED]`, discounted for per-judge precision bookkeeping. No effect on candidate outcomes (all were real items correctly cleared).
- Notably, Feb 24 (de-leak clean, twice false-flagged in earlier rounds) was cleared by BOTH judges this round (J6 SURE-REAL, J7 SURE-REAL) — evidence the earlier false flags were judge-specific over-firing, not a defect in the post. Feb 24 can be considered for reinstatement to control pools.

---

## 3. Rewrite instructions — post-3 v4 (the only caught post)

1. **Kill the epigram mold.** Cover may keep its shape ("You're Using Pinterest At The Wrong Ratio." survived as a hook across judges), but "Reposition beats create." and "The proportions are the strategy." cannot both stay — at most one compressed line per deck, and prefer replacing both with lopsided, specific headers (a number, a named object, a scene — not an aphorism).
2. **Caption must not repeat the slides.** Remove the "checking the app 14 times before lunch" recycle from the caption (or from the deck — one home only). Rewrite the caption as vibe-framing per craft rule #2: 2-4 short paragraphs that add new material (the "February pins delivering in August" beat is good caption-native material — keep that side).
3. **Break the tidy arc.** The caption's observation → data → moral resolution needs one unresolved or self-interrupting beat; do not end on the moral.
4. **Thin slide 4.** One clean image per value slide, not three stacked qualifiers — keep "possibly holding a snack," cut the rest of the qualifier stack.

---

## 4. Cumulative sprint status (all 3 rounds)

| Post | R1 | R2 | R3 | Status |
|---|---|---|---|---|
| post-1 (Email/Edu) | CAUGHT | CAUGHT | survived (lean-real + honest coin-flip) | **CLEARED (v3)** |
| post-2 (Offer dual-CTA) | caught (split) | survived (2× coin-flip) | — | **CLEARED (v2)** |
| post-3 (Pinterest/Edu) | caught (split) | CAUGHT | **CAUGHT (unanimous, clean tells)** | **NOT CLEARED — v4 rewrite + round 4 required** |
| post-4 (Productivity/Edu) | CAUGHT | CAUGHT | survived (coin-flip-level only after false-tell strike) | **CLEARED (v3)** — with non-blocking metaphor-density advisory |
| post-5 (FTG Manifesto) | SURVIVED | — | — | **CLEARED (v1)** |
| post-6 (Wildcard) | SURVIVED | — | — | **CLEARED (v1)** |

**5 of 6 posts cleared. Round 4 required for post-3 only** (v4 per §3), with fresh calibrated judges; the de-leaked 4-deck control pool (Feb 19, Mar 1, Mar 7, Mar 10 — plus Feb 24 now eligible for reinstatement) supports one more round.

**Outstanding protocol debts before/alongside round 4:**
1. Write the cross-post-reuse vs. generator-reuse rule into ANTI-AI.md — three rounds, three false positives on the same real freebie-list block. This is the sprint's most persistent judge-side failure and it is a rule gap, not a judge gap.
2. Sync the judges' canonical comment-word list with BUSINESS.md (the Claude false tell fired again in round 3 despite the standing strike rule — J7 explicitly reasoned from an incomplete list).
3. Alyssa rulings still pending: Jan 15 em-dash carve-out; "Less content, better leads" grandfather status (moot for this sprint since post-3's round-3 catch didn't rely on it, but still open).
