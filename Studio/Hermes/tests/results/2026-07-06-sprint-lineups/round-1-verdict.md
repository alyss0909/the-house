# Round Verdict — Sprint Lineups, 2026-07-06 (Mean Alyssa v2 protocol)

Scored per [[Deliverables/2026-07-05-social-skills-repo-intake/extracted/mean-alyssa-review-panel-map]] protocol, against `KEY-do-not-open.md` (corrected identity table). Judges wrote independent blind verdicts before this scoring pass.

---

## 1. Calibration gate (Lineup A, all-real control)

Rule: SURE-FAKE on any real item = instant disqualification. More than one LEAN-FAKE = disqualification. COIN-FLIP is honest abstention, not a false positive.

### J1 — PASS (at the line)
- Item 1 (real, Jan 15) → LEAN-FAKE — **1 false positive**
- Item 2 (real, Feb 6) → LEAN-REAL — correct
- Item 3 (real, Mar 10) → SURE-REAL — correct
- Item 4 (real, Mar 3) → COIN-FLIP — honest abstention, not counted
- Item 5 (real, Jan 29) → LEAN-REAL — correct
- Tally: 1 LEAN-FAKE, 0 SURE-FAKE. Passes at the maximum allowed threshold.

### J2 — PASS (at the line)
- Item 1 (real, Jan 20) → LEAN-FAKE — **1 false positive**
- Item 2 (real, Feb 10) → LEAN-REAL — correct
- Item 3 (real, Feb 19) → SURE-REAL — correct
- Item 4 (real, Jan 22) → COIN-FLIP — honest abstention, not counted
- Item 5 (real, Mar 7) → LEAN-REAL — correct
- Tally: 1 LEAN-FAKE, 0 SURE-FAKE. Passes at the maximum allowed threshold.

### J3 — **FAIL / DISQUALIFIED**
- Item 1 (real, Jan 29) → LEAN-REAL — correct
- Item 2 (real, Mar 1) → LEAN-REAL — correct
- Item 3 (real, Mar 10) → COIN-FLIP — honest abstention
- Item 4 (real, Feb 24, "Swapped Instagram for Pinterest") → **SURE-FAKE** — instant disqualification per protocol (sure-confidence false positive on a real control item)
- Item 5 (real, Jan 15) → LEAN-FAKE — a second false positive, independently over the 1-LEAN-FAKE limit
- Tally: 1 SURE-FAKE + 1 LEAN-FAKE. Fails on two independent grounds. **J3's Lineup B verdicts are held at reduced trust, reported `[JUDGE-UNCALIBRATED]`, and excluded from candidate scoring below.**

**Calibrated judge pool for candidate scoring: J1, J2 only.**

---

## 2. Candidate scoring (Lineup B, calibrated judges only)

Item-to-candidate mapping resolved via KEY-do-not-open.md (corrected lineup-J1 table used):

| Candidate | J1 verdict | J2 verdict | Outcome |
|---|---|---|---|
| post-1 "Your Emails Don't Have A Flavor" | COIN-FLIP (Item 8) | **SURE-FAKE** (Item 2) | **CAUGHT** |
| post-2 "The Numbers" | **LEAN-FAKE** (Item 1) | LEAN-REAL (Item 4) | **CAUGHT** (J1's concrete tells stand; split verdict) |
| post-3 "One Ingredient, Not The Meal" | **LEAN-FAKE** (Item 3) | LEAN-REAL (Item 6) | **CAUGHT** (J1's concrete tells stand; split verdict) |
| post-4 "Head, Hands, Heart" | LEAN-REAL (Item 5) | **LEAN-FAKE** (Item 8) | **CAUGHT** (J2's concrete tells stand; split verdict) |
| post-5 "I Trust The Plan That Doesn't Work Out" | LEAN-REAL (Item 6) | LEAN-REAL (Item 9) | **SURVIVED** — both calibrated judges independently called it real |
| post-6 "guys, i think this one's actually working" | SURE-REAL (Item 9) | COIN-FLIP (Item 11) | **SURVIVED** — no calibrated judge caught it; J1 sure-real, J2 honest abstention |

**4 of 6 candidates caught. 2 survived.**

### Precision context — false positives by calibrated judges on real items in Lineup B
- J1, Item 11 (real, Feb 10, "How To Get All Your Clients From Pinterest") → LEAN-FAKE. False positive.
- J2, Item 3 (real, Mar 3, "Organic Marketing Is Dying") → LEAN-FAKE. False positive.
- J2, Item 5 (real, Feb 6, "Pinterest...Hidden Gem" content-calendar promo) → LEAN-FAKE. False positive.
- J2, Item 7 (real, Jan 29, "Why Smart Founders...") → COIN-FLIP. Honest abstention, not a false positive, but flagged: J2 explicitly cites suspicion of cross-post line reuse as the driver — worth noting as a live miscalibration risk even where the final call was honest.

Both calibrated judges continue to throw real-source false positives in the actual test round (not just the control), consistent with the root-cause finding in the panel map (over-trained against AI-tell shapes, now over-firing on her real recycled-construction and label-list habits). This is a precision problem to track per judge across future rounds, not disqualifying on its own since it stayed at LEAN not SURE.

---

## 3. Tell extraction (caught candidates → back to the writer)

### post-1 — "Your Emails Don't Have A Flavor" — CAUGHT (J2, SURE-FAKE)
- "slides 4-7 are a rigid rhetorical-question template ('After they read it, how do they feel?' / 'What do they actually leave with?' / 'What do your emails LOOK like?' / 'When do you actually write it?') — four near-identical parallel questions, each answered with a clean 2-3 item mini-list."
- "'flavor' as the extended controlling metaphor run continuously through the ENTIRE piece (cover, 8 slides, caption) violates STYLE.md §4 directly: 'Never run a cooking allegory through the middle of an argument. One extended-stretch moment per piece max.'"
- "'A mindset shift, a practical thing to try today, or just a story that stuck with them.. pick one on purpose' — a rule-of-three, cleanly enumerated, no lopsided break."
- Note: J1 (uncaught side, COIN-FLIP) independently flagged the *same* structural risk even while abstaining: "runs unusually clean and parallel-structured across four consecutive 'what/when' question-slides with matching resolutions."

### post-2 — "The Numbers" — CAUGHT (J1, LEAN-FAKE)
- "reads competent and well-structured but has the hallmark TASTE.md 'too AI' signature: clean, parallel-structured teaching beats ('Know the exact number, not a vibe' / 'Most people are shocked...') with tidy resolutions and no mess or self-interruption."
- "The two-CTA-branch structure ('depending on what's actually stuck for you') is neat in a way that feels engineered rather than discovered."
- "the joke lands as explained humor, not discovered."
- Note: J2 (LEAN-REAL) actually liked this piece and cited "340 people this quarter, not 3,400" and "take that calculus prof" as genuine specific texture — the writer should treat this as a near-miss, not a clean failure; the CTA-branch neatness is the one thing to loosen.

### post-3 — "One Ingredient, Not The Meal" — CAUGHT (J1, LEAN-FAKE)
- "The title itself is a metaphor-based negative-parallelism construction ('not X, Y' shape wearing a food metaphor: 'not the meal')."
- "Body text is very well organized labeled-step teaching ('The ratio matters more than the platform') with clean, parallel texture per slide — competent but thin per TASTE.md's 'clean label + description' red flag."
- "It closely echoes Item 2/Lineup-A-Item-2's recipe language almost verbatim ('one part Pinterest + two parts email + a handful of evergreen assets') — recycling her own construction near-verbatim is itself flagged in ANTI-AI.md as an imitation tell."
- Note: J2 (LEAN-REAL) read the same reuse as legitimate voice consistency, not a violation — this is a genuine judge-calibration disagreement about how much cross-piece phrase reuse is allowed. Worth resolving in ANTI-AI.md before the next round (see Judge-precision note below).

### post-4 — "Head, Hands, Heart" — CAUGHT (J2, LEAN-FAKE)
- "The 'hands/head/heart' three-part framework is a clean rule-of-three with a named acronym-like structure and near-identical parallel headers ('THE HANDS ARE THE REPS,' 'THE HEAD IS THE STRATEGY,' 'THE HEART IS THE PART NO TOOL TOUCHES') — textbook enumeration TASTE.md's rule-of-three ban targets."
- "'I found the head/hands/heart split on 2026-06-05...' dropped as a slide body fragment reads like a leftover research citation/date-stamp bleeding into the copy — a strong tell of drafting scaffolding not fully cleaned out."
- "'Here's the part nobody says out loud' is dangerously close to the banned 'Nobody is talking about' dead-opening family."
- "Caption's 'it was about automating the wrong third' restates the pivot cleanly right after already stating it in the slides — a repeat-the-point ending, which ANTI-AI.md's final checklist explicitly flags."
- Note: J1 independently called this SURE-FAKE in its own file terms (their harshest verdict of either lineup, even though it lands on the real-slot pairing — see Judge-precision note below for the cross-judge nuance on this exact framework appearing twice).

---

## 4. Judge-precision note (calibration intel for future rounds)

- **The em-dash / "It's Not —Just— The Em Dash" real post** (Jan 15/Jan 20 lane) was flagged as LEAN-FAKE by both J1 and J2 in their own calibration lineups — a real post that runs a knowing meta-joke about AI-detection got penalized by the panel's own zero-em-dash and negative-parallelism rules. This is exactly the "real post that breaks a stated rule" case the protocol calls protocol-tuning data, not a candidate failure. **Recommend:** carve out an explicit exception in ANTI-AI.md for self-aware, thematically-justified rule-breaks (a post *about* AI-detection referencing an em-dash ironically should not trip the zero-em-dash ban) — both calibrated judges hit this same false positive independently, which is a correlated-bias signature worth fixing at the rule level, not the judge level.
- **The recipe/food-metaphor phrase reuse across pieces** ("one part Pinterest + two parts email + a handful of evergreen assets," "turns 4 pieces of content into...") is being read two opposite ways by the two calibrated judges: J1 treats cross-piece reuse as an "imitation tell" (candidate copying her own real winning line), J2 treats the same reuse as legitimate voice-consistency (she really does recycle hooks across a content series). This ambiguity directly caused the split verdicts on post-2 and post-3. **Recommend:** ANTI-AI.md needs an explicit rule distinguishing "AI recycling a documented real line as pattern-matching" from "her own legitimate cross-post phrase reuse" — right now the panel has no way to tell these apart and is guessing in both directions.
- J3's two false positives both landed on the **"Most people think X... BUT Y" sneaky-setup shape** — correctly identified as a genuine banned pattern in principle, but J3 is over-firing on it (caught it twice in five real control items, once at SURE confidence), suggesting this specific rule needs a real-source carve-out check before the next round, or J3 needs recalibration specifically on this one axis before rejoining the panel.

---

## 5. Round outcome and next steps

- **Judges calibrated:** J1, J2 (both passed at the maximum allowed 1-LEAN-FAKE threshold — worth flagging that neither judge cleared the control cleanly; both are borderline-passing, not comfortably calibrated).
- **Judge disqualified:** J3 (SURE-FAKE on a real control item, plus a second LEAN-FAKE independently over the limit). J3's candidate verdicts are excluded from scoring; J3 needs recalibration on the "sneaky setup / reject-then-replace" rule before being trusted in a future round.
- **Candidates CAUGHT (4/6):** post-1 (SURE-FAKE, clean catch), post-2 (split, caught on J1's tells), post-3 (split, caught on J1's tells, contested by J2), post-4 (split, caught on J2's tells).
- **Candidates SURVIVED (2/6):** post-5 ("I Trust The Plan That Doesn't Work Out" — unanimous LEAN-REAL from both calibrated judges), post-6 (wildcard single-image — SURE-REAL + COIN-FLIP, no catch).
- **Rewrite instructions:** apply the tell-specific fixes above to post-1 (kill the 4-slide rhetorical-question template and the whole-piece flavor metaphor), post-2 (loosen the CTA-branch neatness, keep the "340/calculus prof" specificity that already landed), post-3 (either drop the near-verbatim recipe-line reuse or, pending the ANTI-AI.md rule fix below, accept the risk), post-4 (remove the leftover date-stamp fragment, break the even rule-of-three, cut the repeat-the-point caption ending, avoid the "nobody says out loud" opening).
- **Root-cause loop-back required before this round can close (per protocol step 7):** two rule fixes are needed, not just a verdict table — (1) an explicit self-aware/ironic-reference carve-out for the zero-em-dash and negative-parallelism bans in ANTI-AI.md, and (2) a rule distinguishing legitimate cross-post phrase reuse from AI-imitation phrase recycling. Until these are written into the craft files, post-2 and post-3's split verdicts cannot be resolved with confidence, and the same false positive will likely recur on the next real-post control.
- **Re-lineup round required: YES.** Recommend a Round 2 sub-round that (a) recalibrates J3 specifically on the sneaky-setup shape using a fresh control set, (b) re-tests post-2 and post-3 once the two ANTI-AI.md rule fixes above are written, since their CAUGHT status currently rests on a real, unresolved judge disagreement rather than a clean tell both judges agree on.
