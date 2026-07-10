# Round Verdict — Sprint 2 Lineups, 2026-07-06 (Mean Alyssa v2 protocol)

Scored per `Deliverables/2026-07-05-social-skills-repo-intake/extracted/mean-alyssa-review-panel-map.md` protocol, against `KEY-do-not-open.md`. Judges wrote independent blind verdicts before this scoring pass. Per the parallel session's calibration intel, judges were instructed that (a) a real post's self-aware em-dash/AI-detection joke and (b) cross-post phrase reuse are open questions, not kill-tells — both are called out explicitly below wherever a judge encountered them.

---

## 1. Calibration gate (Lineup A, all-real control)

Rule: SURE-FAKE on any real item = instant disqualification. More than one LEAN-FAKE = disqualification. COIN-FLIP is honest abstention, not a false positive.

### J1 — PASS (clean)
- Item 1 (real, Jan 20) → LEAN-REAL — correct
- Item 2 (real, Jan 22) → SURE-REAL — correct
- Item 3 (real, Mar 1) → LEAN-REAL — correct
- Item 4 (real, Feb 19) → SURE-REAL — correct
- Item 5 (real, Mar 7) → SURE-REAL — correct
- Tally: 0 LEAN-FAKE, 0 SURE-FAKE. **Clean pass — the first cleanly-calibrated judge across both rounds of this test.**

### J2 — PASS (at the line)
- Item 1 (real, Jan 15) → LEAN-FAKE — **1 false positive** (explicitly did NOT count the em-dash joke as the driver; deducted instead on slides 6-7 thinness)
- Item 2 (real, Feb 6) → SURE-REAL — correct
- Item 3 (real, Mar 3) → LEAN-REAL — correct
- Item 4 (real, Feb 1) → LEAN-REAL — correct
- Item 5 (real, Jan 29) → SURE-REAL — correct
- Tally: 1 LEAN-FAKE, 0 SURE-FAKE. Passes at the maximum allowed threshold.

### J3 — PASS (at the line)
- Item 1 (real, Jan 22) → LEAN-REAL — correct
- Item 2 (real, Feb 10) → SURE-REAL — correct
- Item 3 (real, Mar 10) → COIN-FLIP — honest abstention, not counted
- Item 4 (real, Feb 24) → LEAN-REAL — correct
- Item 5 (real, Jan 15) → LEAN-FAKE — **1 false positive** (again explicitly separated the em-dash joke from the deduction, penalizing slides 6-7 stacking instead)
- Tally: 1 LEAN-FAKE, 0 SURE-FAKE. Passes at the maximum allowed threshold.

**Calibrated judge pool for candidate scoring: J1, J2, J3 — all three pass.** This is an improvement over the prior round (where only 2 of 3 passed and one was disqualified outright). Notably, both J2 and J3 independently threw their one allowed false positive on the SAME real post (Jan 15, "2026 Slow Marketing Trends Pt. 1") for a related-but-not-identical reason (thin back-to-back trend slides 6-7), and both explicitly declined to blame the em-dash joke per the open-question instruction — this is a genuine sign the em-dash carve-out instruction worked, but it also means Jan 15's slides 6-7 density is a live real-source false-positive magnet independent of the em-dash question. See Judge-precision note below.

---

## 2. Candidate scoring (Lineup B, all three judges calibrated)

Each candidate was seen by exactly one judge (no split verdicts possible under this lineup design — this is a structural difference from Round 1, where each candidate was cross-checked by two judges). Per protocol, a single calibrated judge's LEAN-FAKE or SURE-FAKE catch stands as a catch; the tell ledger is the evidence trail, not a second vote.

| Candidate | Judge | Verdict | Score (subtract-points) | Outcome |
|---|---|---|---|---|
| post-1 "Your First Email Already Lost Them." | J1 (Item 2) | LEAN-FAKE | 4/10 | **CAUGHT** |
| post-2 "Your Next Buyer Already Subscribed." | J2 (Item 2) | LEAN-REAL | 7/10 | **SURVIVED** |
| post-3 "Pinterest Already Flagged Your Best Pin." | J3 (Item 4) | SURE-FAKE | 2/10 | **CAUGHT** |
| post-4 "Eight Places Your One Video Never Went." | J1 (Item 4) | SURE-FAKE | 0/10 (floored) | **CAUGHT** |
| post-5 "Your Weird Obsession Is The Business Plan." | J2 (Item 4) | COIN-FLIP | 7/10 | **HUMAN REVIEW RECOMMENDED** (per protocol step 5: coin-flip verdicts do not count as clean catches or clean survivals) |
| post-6 "she asked for a logo. she needed a witness." | J3 (Item 2) | LEAN-FAKE | 6/10 | **CAUGHT** (borderline — see note) |

**3 clean CAUGHT (post-1, post-3, post-4), 1 SURVIVED (post-2), 1 borderline CAUGHT (post-6), 1 HUMAN REVIEW flag (post-5, coin-flip).**

### Structural note on single-judge exposure
Unlike Round 1 (where every candidate got two independent judge reads), this round's lineup design routes each candidate through exactly one calibrated judge. This is faster but loses the cross-judge disagreement signal that surfaced real information last round (e.g., Round 1's post-2/post-3 split verdicts revealed a live ANTI-AI.md gap). Recommend flagging this as a design tradeoff for the next round rather than a silent limitation — see Section 5.

### Precision context — false positives by calibrated judges on real items in Lineup B
- No real item in any Lineup B was flagged LEAN-FAKE or SURE-FAKE by any judge. All four reals per lineup (12 total across J1/J2/J3's lineup-B files) were called SURE-REAL or LEAN-REAL. **This is the first round where the panel threw zero false positives on real material in the actual test round** — a meaningful improvement, though the sample per judge is small (4 reals each) and the false-positive rate on controls (2 of 3 judges, 1 each) suggests the improvement may partly reflect this specific real-post selection rather than a fully resolved miscalibration.

---

## 3. Tell extraction (caught candidates → back to the writer)

### post-1 — "Your First Email Already Lost Them." — CAUGHT (J1, LEAN-FAKE, 4/10)
- Slides 5-7 run a rigid rhetorical-question-then-resolution template ("Name The Start-State... Name The End-State... Every Email In Between Is A Scene") — three consecutive labeled-question slides at ~40-60 words each, not the deeply-textured 300-500-word three-act structure ANTI-AI.md exempts.
- The "documentary" metaphor runs continuously through cover, all 8 slides, AND the caption — a whole-piece extended-stretch metaphor where STYLE.md caps at one moment per piece.
- Caption's closing line ("stop writing five emails that all say the same thing in different outfits") restates the slide argument — repeat-the-point ending.
- Rewrite instruction: cut the documentary metaphor down to 1-2 anchor slides (cover + one turn), not the whole deck and caption; break the start-state/end-state/scene three-slide cadence by giving one of the three a genuinely different shape (longer, messier, a real aside) or merging two into one denser slide; cut the caption's restated closer.

### post-3 — "Pinterest Already Flagged Your Best Pin." — CAUGHT (J3, SURE-FAKE, 2/10)
- Slides 4-5 stack a title-level negative-parallelism construction ("Freshness Is A Combination Problem, Not A Content Problem") immediately followed by a second clean label+description slide — compounding, not isolated.
- Slide 8's "You Don't Have A Content Problem. You Have A Wardrobe You Never Opened." is a second reframe-shaped header in the same deck — two reframe-family headers in one piece is a stacked, not isolated, tell.
- Two overlapping extended metaphor families (capsule wardrobe + historian/pattern-recombination) run back to back — STYLE.md's one-extended-stretch-moment cap is violated twice, not once.
- Caption's closing line restates the slide 8 aha almost verbatim.
- Rewrite instruction: this is the clearest, least-ambiguous catch of the round — pick ONE metaphor (wardrobe OR historian, not both), rewrite both reframe-shaped headers as direct positive claims per ANTI-AI's fix rule (state what freshness IS, not what it "isn't"), and cut the caption's restated closer.

### post-4 — "Eight Places Your One Video Never Went." — CAUGHT (J1, SURE-FAKE, 0/10 floored)
- Slides 4-7 run four consecutive process-labeled slides with near-identical header cadence ("The Chain Starts...", "Then It Becomes...", "Add One...", "Now The Same Piece Feeds...") — textbook shallow enumeration, no slide exceeding ~35 words.
- "that's not a content problem. that's a distribution problem wearing a content problem's outfit" (slide 3) is a costume-metaphor substitution functioning identically to the banned reject-then-replace cadence, despite not literally matching a listed phrase.
- Caption restates the slide 8 aha nearly verbatim ("systemized... just means one action, multiplied through a fixed chain").
- This is the most stacked, most confident catch of the round — four consecutive template-cadence slides plus a disguised reframe plus a repeat-the-point ending.
- Rewrite instruction: break the four-slide process chain — give at least one step real mess (a mistake, a workaround, a specific date or number), cut "wearing a content problem's outfit" and state the distribution claim directly, and cut the caption's restated closer.

### post-6 — "she asked for a logo. she needed a witness." — CAUGHT (borderline, J3, LEAN-FAKE, 6/10)
- The X-then-Y corrective-realization structure ("she asked for a logo.. what she actually needed was a witness") sits in proximity to the banned "not X, it's Y" cadence family without a visible source anchor in the rendered item — J3 explicitly flagged this as the "genuine judge-calibration disagreement" zone per the panel map's own framing (real-source-adjacent construction vs. freshly generated).
- **Important caveat for the writer/Alyssa:** per the build brief (`2026-07-06-sprint-posts-A.md`), this construction is NOT freshly generated — it deliberately mirrors the real, verbatim Odd Connection prompt's own worked example ("I thought my problem was procrastination, but it was actually decision fatigue"). J3 could not see this source anchor because format-parity stripping removed all self-check citations from the rendered item, per the build instruction. This is very likely a false catch driven by the blind-format requirement itself, not a genuine tell — flagging for Alyssa's read rather than treating as a clean catch. See Section 5.
- Rewrite instruction (if Alyssa agrees a change is warranted despite the source anchor): loosen the "two years" specific (currently coined, not sourced) to either a real anchor or a vaguer timeframe, and consider whether the deflating closer ("anyway. no freebie today...") is doing real work or just closing cleanly.

---

## 4. Judge-precision note (calibration intel for future rounds)

- **The em-dash/AI-detection joke carve-out instruction worked.** Both J2 and J3 explicitly separated "It's Not —Just— The Em Dash" from their deduction ledgers and stated so in writing, then found a different, real basis for their one calibration false positive (slides 6-7 thinness on the same Jan 15 post). This confirms the panel map's diagnosis: the em-dash joke itself was never the real problem, the panel's rule-following was. Recommend keeping the explicit open-question framing in all future judge instructions rather than reverting to a silent rule.
- **Jan 15's slides 6-7 are now a two-judge-independent false-positive magnet, separate from the em-dash question.** J2 and J3 both, independently, flagged "Nuance is Making a Comeback" and "Great News for (cool) Small Businesses" as thin/label+description trend-slides. This is worth treating as its own signal: either these two real slides are genuinely thinner than the rest of her corpus (a real-source data point, not a rule problem), or the panel is still slightly over-indexed on "clean parallel bolded-phrase list = AI." Recommend a targeted spot-check against 2-3 more of her real trend-report slides before concluding either way.
- **Cross-post phrase reuse was flagged but NOT weaponized into a false catch this round** — J1 explicitly noted the "one part Pinterest + two parts email" recipe line reappearing across Item 3 (Jan 29) and Item 6 (Feb 6, the line's real origin) in Lineup B, called it an open question per instruction, and did not let it drive either verdict to fake. This is the fix working as intended per the panel map's Section on this exact ambiguity.
- **post-6's catch is very likely an artifact of the blind-format stripping requirement, not a genuine writing flaw.** The build instructions (`KEY-do-not-open.md`, `mean-alyssa-review-panel-map.md` protocol step 1) require stripping all self-check/source-citation annotations before a candidate enters a lineup, for blind-scoring integrity. But post-6's whole justification for its central device rests on a source citation (the verbatim Odd Connection worked example) that the stripping process necessarily removes. This is a structural tension in the protocol worth naming explicitly: **blind formatting can manufacture a false catch on any candidate whose legitimacy depends on an invisible source anchor.** This did not happen to post-1, post-3, or post-4 (their catches rest on structural/cadence tells visible in the copy itself, not on absent citations), but it is a live risk category the protocol should account for on future rounds — e.g., by having the writer flag (to Larry/Alyssa, not the judge) which candidates' legitimacy depends on an invisible citation, so a JUDGE-CAUGHT-ON-STRIPPED-SOURCE flag can be applied post-hoc without contaminating the blind read itself.
- **post-5's coin-flip is a legitimate escalation, not a soft catch or soft survival.** J2's own ledger shows genuine, stated uncertainty about whether slide 7's "it was never who understood the algorithm, it was who cared" is source-anchored (same ambiguity class as post-6, but J2 flagged the uncertainty explicitly rather than resolving it either direction). Per protocol step 5, this goes to Alyssa, not into either outcome column.

---

## 5. Round outcome and next steps

- **Judges calibrated:** J1 (clean pass, first fully clean calibration across both rounds), J2 (pass at the line), J3 (pass at the line). **Zero disqualifications this round** — an improvement over Round 1's one disqualified judge.
- **Candidates CAUGHT (3 clean + 1 borderline = 4 of 6):** post-1, post-3, post-4 (clean, stacked, multi-tell catches — high confidence), post-6 (borderline, likely a stripping-protocol artifact rather than a genuine tell — see Section 4).
- **Candidates SURVIVED (1 of 6):** post-2 (LEAN-REAL from J2, genuine specificity in the CTA line and the "sometimes life gets busy" beat outweighed the clean diagnostic scaffolding).
- **Candidates requiring HUMAN REVIEW (1 of 6):** post-5 (COIN-FLIP; J2 states explicit, unresolved uncertainty about whether the slide 7 realization is source-anchored — Alyssa's read needed, not a system output).
- **Rewrite instructions, in priority order:**
  1. **post-4** (highest-confidence catch, 0/10): break the four-slide process-chain template, cut the disguised "wearing a content problem's outfit" reframe, cut the repeat-the-point caption ending.
  2. **post-3** (second-highest-confidence catch, 2/10): pick one metaphor family (not two), rewrite both reframe-shaped headers as direct positive claims, cut the repeat-the-point caption ending.
  3. **post-1** (moderate-confidence catch, 4/10): shrink the documentary metaphor to 1-2 anchor moments instead of the whole piece, break the three-slide labeled-question cadence, cut the restated caption closer.
  4. **post-6** (borderline, likely artifact): no content rewrite recommended pending Alyssa's read on whether the source anchor (Odd Connection worked example) should be made visible to future judges via a different blinding method, rather than treating this as a writing flaw.
  5. **post-5**: no rewrite — route directly to Alyssa per the coin-flip escalation rule; this is a taste call about the "it was never X, it was Y" construction's source-adjacency, not a system-resolvable tell.
- **Root-cause loop-back required before this round can close (per protocol step 7):**
  1. **Confirmed fix:** the em-dash/AI-detection-joke open-question framing worked as intended in this round (see Section 4) — recommend formalizing this as a permanent instruction in future judge briefs rather than a one-round experiment.
  2. **New finding, not yet fixed:** Jan 15's slides 6-7 remain a two-judge-independent false-positive magnet on a basis OTHER than the em-dash joke. This needs either a craft-file carve-out (if the slides are judged as genuinely acceptable real texture) or a note that this specific real post is a known thin spot in the corpus, not a rule to build future policy on.
  3. **New finding, protocol-level, not content-level:** the blind-stripping requirement can manufacture false catches on candidates whose legitimacy rests on an invisible source citation (post-6). This needs a protocol fix (see Section 4's proposed JUDGE-CAUGHT-ON-STRIPPED-SOURCE flag), not a rewrite of post-6 itself.
- **Re-lineup round required: PARTIAL.** Full re-lineup is not needed — 3 of 6 candidates have high-confidence, well-evidenced catches ready for rewrite-and-resubmit. Recommend: (a) route post-5 to Alyssa directly rather than re-lineup it, (b) resolve the post-6 stripping-artifact question with Alyssa before deciding whether to re-test it or ship it as-is, (c) re-test post-1/post-3/post-4 only after their rewrites land, using fresh reals (not the same 12 reals already seen by this round's judges) to avoid contaminating the next calibration pass.
