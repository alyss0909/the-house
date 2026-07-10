---
title: Lineup Key — Tournament Blind-Spotting Judging
date: 2026-07-05
fate: referenced
---

# Lineup Key

Maps each judge file / lineup to the candidate item (the fake), its architecture + seed, and the two real decks used as decoys. Not for judges — reveals which item is the fake in every lineup.

---

## Judge File 1 (`2026-07-05-lineup-judge1.md`)

| Lineup | Fake item | Candidate | Architecture / Seed | Real deck 1 | Real deck 2 |
|---|---|---|---|---|---|
| 1 | Item X | A1 — Email edu, "When The Freebie Doesn't Sell Anything" | Architecture A, Seed 1 (spinach/freebie) | Item Y = Jan 15 "2026 Slow Marketing Trends Pt. 1" | Item Z = Jan 20 "What's Actually Shifting in 2026" |
| 2 | Item X | B2 — BOH offer, "Marketing As We Know It Ends" | Architecture B, Seed 2 (Old Way/New Way → Yes Chef) | Item Y = Mar 3 "Organic Marketing Is Dying" | Item Z = Feb 19 "Pinterest Sugar Mama" |
| 3 | Item X | C3 — For The Girls, "I Can't Wait To See Why This Didn't Work Out" | Architecture C, Seed 3 (FTG) | Item Y = Jan 22 "Wasting Time Is Part of My Process" | Item Z = Feb 24 "Why I Swapped Instagram For Pinterest" |

Real decks used in this file (6 distinct, no repeats): Jan 15, Jan 20, Mar 3, Feb 19, Jan 22, Feb 24.

---

## Judge File 2 (`2026-07-05-lineup-judge2.md`)

| Lineup | Fake item | Candidate | Architecture / Seed | Real deck 1 | Real deck 2 |
|---|---|---|---|---|---|
| 1 | Item X | B1 — Email edu, "I Stopped Trying To Sell Spinach" | Architecture B, Seed 1 | Item Y = Jan 20 "What's Actually Shifting in 2026" | Item Z = Jan 29 "Why Smart Founders Are Going Low Maintenance" |
| 2 | Item X | C2 — BOH offer, "Old Way, New Way" | Architecture C, Seed 2 | Item Y = Mar 3 "Organic Marketing Is Dying" | Item Z = Feb 6 "The Pinterest Marketing Plan for Beginners" |
| 3 | Item X | A3 — For The Girls, "I Can't Wait To See Why This Didn't Work Out" | Architecture A, Seed 3 | Item Y = Jan 22 "Wasting Time Is Part of My Process" | Item Z = Feb 10 "How To Get All Your Clients From Pinterest This Year" |

Real decks used in this file (6 distinct, no repeats): Jan 20, Jan 29, Mar 3, Feb 6, Jan 22, Feb 10.

---

## Judge File 3 (`2026-07-05-lineup-judge3.md`)

| Lineup | Fake item | Candidate | Architecture / Seed | Real deck 1 | Real deck 2 |
|---|---|---|---|---|---|
| 1 | Item X | C1 — Email edu, "I Stopped Trying To Sell Spinach" | Architecture C, Seed 1 | Item Y = Jan 29 "Why Smart Founders Are Going Low Maintenance" | Item Z = Jan 15 "2026 Slow Marketing Trends Pt. 1" |
| 2 | Item X | A2 — BOH offer, "This Is The Whole Back Of House" | Architecture A, Seed 2 | Item Y = Feb 24 "Why I Swapped Instagram For Pinterest" | Item Z = Mar 3 "Organic Marketing Is Dying" |
| 3 | Item X | B3 — For The Girls, "Nothing Has Gone Wrong Yet" | Architecture B, Seed 3 | Item Y = Jan 22 "Wasting Time Is Part of My Process" | Item Z = Feb 6 "The Pinterest Marketing Plan for Beginners" |

Real decks used in this file (6 distinct, no repeats): Jan 29, Jan 15, Feb 24, Mar 3, Jan 22, Feb 6.

---

## Cross-file real-deck usage summary

| Real deck | Used in Judge File(s) |
|---|---|
| Jan 15 — Slow Marketing Trends Pt. 1 | 1, 3 |
| Jan 20 — What's Actually Shifting in 2026 | 1, 2 |
| Jan 22 — Wasting Time Is Part of My Process | 1, 2, 3 |
| Jan 29 — Smart Founders Going Low Maintenance | 2, 3 |
| Feb 6 — Pinterest Marketing Plan for Beginners | 2, 3 |
| Feb 10 — Get All Your Clients From Pinterest | 2 |
| Feb 19 — Pinterest Sugar Mama | 1 |
| Feb 24 — Why I Swapped Instagram For Pinterest | 1, 3 |
| Mar 3 — Organic Marketing Is Dying | 1, 2, 3 |

Jan 22 and Mar 3 each appear in all three judge files because they are the only fully-documented real decks in the FTG lane and the BOH-offer lane respectively (the task's own reuse-across-files allowance). No real deck repeats within a single judge file — verified for all three files above.

Lane matching achieved: every email/edu candidate (A1/B1/C1) is lineup'd against email/edu-lane reals (Jan 15, Jan 20, Jan 29 — trend-report/education format); every BOH-offer candidate (A2/B2/C2) is lineup'd against offer-lane reals (Mar 3, Feb 6, Feb 19, Feb 24 — offer-with-CTA format); every FTG candidate (A3/B3/C3) is lineup'd against the one available FTG-lane real (Jan 22) plus one adjacent-lane real as the third item.

---

## Blind-Spot Flags

1. **FTG lane has only one fully-documented real deck (Jan 22).** Every FTG lineup (Judge 1 Lineup 3, Judge 2 Lineup 3, Judge 3 Lineup 3) necessarily pairs the candidate against Jan 22 plus one deck from an adjacent lane (Pinterest offer/education) rather than a second true FTG-format real. This is disclosed, not hidden — a judge who reads all three FTG lineups across files would notice Jan 22 recurring, which could theoretically aid inference if judges compare notes across files (they are told to judge independently, but the corpus constraint is real). The two captions-only decks (Valentine's, March Affirmations, guest-cheque) were deliberately excluded per instructions since no real slide data exists for them.
2. **BOH-offer lane has only one fully-documented real deck (Mar 3).** Same structural note as above — all three BOH-offer lineups pair the candidate against Mar 3 plus one Pinterest-offer-lane real (Feb 6, Feb 19, or Feb 24) as the second decoy, since no second BOH-specific real exists in the documented corpus.
3. **No verbatim cover-line collisions between any candidate and any real deck** in the final version of all three files (checked directly against each real deck's actual documented cover text). An earlier draft pass briefly mismatched a candidate's slide content in Judge File 3 Lineup 3 — corrected before finalizing; Item X there now correctly renders Architecture B's actual Seed 3 deck ("Nothing Has Gone Wrong Yet") and Item Y correctly renders the real Jan 22 deck ("Wasting Time Is Part of My Process").
4. **Thematic (non-verbatim) echo, not a collision:** the "Old Way, New Way" candidates (B2/C2) share a framing device with Mar 3's internal body copy (Mar 3 never uses this as a cover, only as reasoning inside the deck), and several candidates independently arrive at "spinach in the smoothie" as a teaching metaphor because it is genuinely her real transcript material (1.4 The Double Yes Method) — this is a legitimate shared source, not an invented collision, and does not compromise blinding since no real deck in the corpus is itself a "spinach" deck.
