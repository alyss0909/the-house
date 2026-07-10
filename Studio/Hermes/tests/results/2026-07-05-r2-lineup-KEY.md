---
title: Round 2 Lineup Key — Tournament Blind-Spotting Judging
date: 2026-07-05
fate: referenced
---

# Round 2 Lineup Key

Maps each R2 judge file / lineup to the candidate item (the fake), its position (X/Y/Z, randomized per the fixed Round 1 leak), architecture + seed, and the two real decks used as decoys. Not for judges — reveals which item is the fake in every lineup.

Position note: Round 1 always placed the fake at Item X — a leak. Round 2 randomizes: positions used are Y, Z, Z, X, X, Y across the six candidate lineups (recorded per row below), plus three CONTROL lineups with no fake anywhere.

---

## Judge File 1 ([[Hermes/tests/results/2026-07-05-r2-lineup-judge1]])

| Lineup | Fake position | Candidate | Architecture / Seed | Real deck 1 | Real deck 2 |
|---|---|---|---|---|---|
| 1 | Item Y | C1-R2 — Email edu, "I Stopped Trying To Sell Spinach" | Architecture C, Seed 1 | Item X = Jan 15 "2026 Slow Marketing Trends Pt. 1" | Item Z = Jan 20 "What's Actually Shifting in 2026" |
| 2 | Item Z | B2-R2 — BOH offer, "I Built My Launch From Leftovers" | Architecture B, Seed 2 | Item X = Mar 3 "Organic Marketing Is Dying" | Item Y = Feb 19 "Pinterest Sugar Mama" |
| 3 | none — CONTROL | (FTG lane, all real) | — | Item X = Jan 22 "Wasting Time Is Part of My Process" | Item Y = Feb 24 "Why I Swapped Instagram For Pinterest" · Item Z = Jan 29 "Why Smart Founders Are Going Low Maintenance" |

Real decks used in this file (6 distinct across candidate lineups + 3 in control, no repeats within file): Jan 15, Jan 20, Mar 3, Feb 19, Jan 22, Feb 24, Jan 29.

---

## Judge File 2 ([[Hermes/tests/results/2026-07-05-r2-lineup-judge2]])

| Lineup | Fake position | Candidate | Architecture / Seed | Real deck 1 | Real deck 2 |
|---|---|---|---|---|---|
| 1 | Item Z | B1-R2 — Email edu, "The Smoothie Marketing Problem" | Architecture B, Seed 1 | Item X = Jan 20 "What's Actually Shifting in 2026" | Item Y = Jan 29 "Why Smart Founders Are Going Low Maintenance" |
| 2 | Item X | C3-R2 — For The Girls, "Nothing Has Gone Wrong Yet" | Architecture C, Seed 3 | Item Y = Jan 22 "Wasting Time Is Part of My Process" | Item Z = Feb 10 "How To Get All Your Clients From Pinterest" |
| 3 | none — CONTROL | (BOH-offer lane, all real) | — | Item X = Mar 3 "Organic Marketing Is Dying" | Item Y = Feb 6 "The Pinterest Marketing Plan for Beginners" · Item Z = Feb 19 "Pinterest Sugar Mama" |

Real decks used in this file (no repeats within file): Jan 20, Jan 29, Jan 22, Feb 10, Mar 3, Feb 6, Feb 19.

---

## Judge File 3 ([[Hermes/tests/results/2026-07-05-r2-lineup-judge3]])

| Lineup | Fake position | Candidate | Architecture / Seed | Real deck 1 | Real deck 2 |
|---|---|---|---|---|---|
| 1 | Item X | C2-R2 — BOH offer, "I Built My Launch From Leftovers" | Architecture C, Seed 2 | Item Y = Mar 3 "Organic Marketing Is Dying" | Item Z = Feb 19 "Pinterest Sugar Mama" |
| 2 | Item Y | B3-R2 — For The Girls, "Nothing Has Gone Wrong Yet" | Architecture B, Seed 3 | Item X = Feb 10 "How To Get All Your Clients From Pinterest" | Item Z = Feb 6 "The Pinterest Marketing Plan for Beginners" |
| 3 | none — CONTROL | (email/edu lane, all real) | — | Item X = Jan 15 "2026 Slow Marketing Trends Pt. 1" | Item Y = Jan 20 "What's Actually Shifting in 2026" · Item Z = Jan 29 "Why Smart Founders Are Going Low Maintenance" |

Real decks used in this file (no repeats within file): Mar 3, Feb 19, Feb 10, Feb 6, Jan 15, Jan 20, Jan 29.

Note: C2-R2 and B2-R2 share a near-identical cover line ("I Built My Launch From Leftovers") — this is intentional; both are Seed 2 candidates on the same brief. They are lane-matched against different real decks (Judge 1 vs. Judge 3) and never appear in the same judge file, so no cross-file confusion is possible for any single judge.

---

## Cross-file real-deck usage summary

| Real deck | Used in Judge File(s) |
|---|---|
| Jan 15 — 2026 Slow Marketing Trends Pt. 1 | 1 (control), 3 (control) |
| Jan 20 — What's Actually Shifting in 2026 | 1, 2, 3 (control) |
| Jan 22 — Wasting Time Is Part of My Process | 1 (control), 2 |
| Jan 29 — Smart Founders Going Low Maintenance | 1 (control), 2, 3 (control) |
| Feb 6 — Pinterest Marketing Plan for Beginners | 2 (control), 3 |
| Feb 10 — Get All Your Clients From Pinterest | 2, 3 |
| Feb 19 — Pinterest Sugar Mama | 1, 2 (control), 3 |
| Feb 24 — Why I Swapped Instagram For Pinterest | 1 (control) |
| Mar 3 — Organic Marketing Is Dying | 1, 2 (control), 3 |

No real deck repeats within any single judge file (verified row-by-row above). Reuse across files follows the same documented-corpus constraint as Round 1: only nine reals have full slide-by-slide detail (Jan 15, Jan 20, Jan 22, Jan 29, Feb 6, Feb 10, Feb 19, Feb 24, Mar 3), so heavy cross-file reuse is structural, not sloppiness.

Lane matching achieved: every email/edu candidate (B1-R2/C1-R2) is lineup'd against email/edu-lane reals (Jan 15, Jan 20, Jan 29 — trend-report/education format); every BOH-offer candidate (B2-R2/C2-R2) is lineup'd against offer-lane reals (Mar 3, Feb 6, Feb 19, Feb 24 — offer-with-CTA format); every FTG candidate (C3-R2/B3-R2) is lineup'd against Jan 22 (the one fully-documented FTG-lane real) plus one Pinterest-lane adjacent real as the third item.

---

## Position randomization record (fixes the Round 1 leak)

| Judge file | Lineup 1 fake position | Lineup 2 fake position | Lineup 3 |
|---|---|---|---|
| 1 | Y | Z | control (no fake) |
| 2 | Z | X | control (no fake) |
| 3 | X | Y | control (no fake) |

Positions used across the six candidate lineups: Y, Z, Z, X, X, Y. No lineup places the fake at X more than twice total across all six, and X/Y/Z are each used twice — the fake is not predictably in any one slot, unlike Round 1.

---

## Blind-Spot Flags

1. **FTG lane has only one fully-documented real deck (Jan 22).** Both FTG candidate lineups (Judge 2 Lineup 2, Judge 3 Lineup 2) necessarily pair the candidate against Jan 22 or an adjacent Pinterest-lane real rather than a second true FTG-format real — Judge 2 Lineup 2 pairs against Jan 22 + Feb 10; Judge 3 Lineup 2 pairs against Feb 10 + Feb 6 (no Jan 22 in that lineup, to avoid over-repeating it against the same candidate seed twice). This is disclosed, not hidden.
2. **BOH-offer lane has only one fully-documented real deck (Mar 3).** All BOH-offer lineups (Judge 1 Lineup 2, Judge 3 Lineup 1, plus both offer-lane controls) draw on Mar 3 plus a Pinterest-offer-lane real (Feb 6, Feb 19, or Feb 24) as the second/third item, since no second BOH-specific real exists in the documented corpus.
3. **Verification pass performed (per bookkeeping rule).** Every judge file was re-opened after writing and checked line-by-line against the candidate/real source text claimed in this KEY:
   - Judge 1 Lineup 1: Item X verified as Jan 15 (matches analysis file verbatim slide content), Item Y verified as C1-R2 (matches tournament-r2-C.md verbatim), Item Z verified as Jan 20 (matches analysis file).
   - Judge 1 Lineup 2: **Caught and fixed an error during verification** — Item Z was initially drafted with C2-R2's text ("40 client offers," "the same folder" caption) instead of B2-R2's text. Corrected to B2-R2's actual content ("found out I'd already written half of it," Q1-Q4 workbook framing, "copied off myself" caption) per tournament-r2-B.md. Item X (Mar 3) and Item Y (Feb 19) verified correct.
   - Judge 1 Lineup 3 (control): all three items (Jan 22, Feb 24, Jan 29) verified against source, no candidate content present.
   - Judge 2 Lineup 1: Item X (Jan 20), Item Y (Jan 29), Item Z (B1-R2, "smoothie marketing problem" / "churros level of desire" — verified against tournament-r2-B.md) all confirmed correct.
   - Judge 2 Lineup 2: Item X (C3-R2, "self sabotage" corrected spelling, "I'm not saying dream small" — verified against tournament-r2-C.md, distinct from B3-R2's "self sabatoge" [sic] wording), Item Y (Jan 22), Item Z (Feb 10) all confirmed correct.
   - Judge 2 Lineup 3 (control): Mar 3, Feb 6, Feb 19 verified against source, no candidate content present.
   - Judge 3 Lineup 1: Item X (C2-R2, verified — this is the correct file for C2-R2's "40 client offers" text per the fix applied to Judge 1), Item Y (Mar 3), Item Z (Feb 19) all confirmed correct.
   - Judge 3 Lineup 2: Item X (Feb 10), Item Y (B3-R2, verified — "self sabatoge" [sic] with "2019... every October" phrasing, distinct from C3-R2's corrected-spelling version used in Judge 2), Item Z (Feb 6) all confirmed correct.
   - Judge 3 Lineup 3 (control): Jan 15, Jan 20, Jan 29 verified against source, no candidate content present.
   - Cross-check: confirmed B2-R2 and C2-R2 never appear in the same judge file (B2-R2 in Judge 1, C2-R2 in Judge 3), and B3-R2/C3-R2 never appear in the same judge file (C3-R2 in Judge 2, B3-R2 in Judge 3) — eliminates the specific Round-1-style swap risk for the near-identical Seed 2 and Seed 3 pairs.
4. **No verbatim cover-line collisions between any candidate and any real deck** confirmed in the final version of all three files. The Seed 2 candidates (B2-R2/C2-R2) share the cover line "I Built My Launch From Leftovers" with each other (not with any real deck) — flagged as a same-brief convergence, not a blinding risk, since they never appear together.
5. **Thematic (non-verbatim) echo, not a collision:** several candidates independently arrive at "spinach in the smoothie" (B1-R2, C1-R2) and "Nothing Has Gone Wrong Yet" (B3-R2, C3-R2) as shared source material or near-identical briefs — legitimate shared-source convergence, not an invented collision, and no real deck in the corpus uses either as a cover line.
