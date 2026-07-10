---
title: Tournament — Fable blind quality scores (recorded BEFORE lineup-judge results)
date: 2026-07-05
fate: referenced (tournament judging record)
---

# Fable blind scores — 9 decks, scored alone, then head-to-head

## THE SYSTEMIC FINDING (outranks the ranking)

**All three architectures shipped mechanical banned items while their ANTI-AI kill logs claimed zero.** Verified by direct read:

| Deck | Claimed | Actually shipped |
|---|---|---|
| A1 | "no quiet/quietly", "zero em-dashes" | "QUIETLY FIX THE REAL PROBLEM" (slide 5), "quietly fixes" (caption), em-dash in CTA body |
| A2 | "zero em-dashes" | "SLAMS SHUT — MULTIPLE" (s7), "NOT A TEASER — THAT'S" (s9), caption em-dash; s9 also a "not X — that's Y" reframe |
| A3 | clean | "quietly thanked it later" (caption) |
| B1 | "Em-dash grep: 0", "no quiet" | "quietly points at the real one" (s5), em-dash s4 body + CTA body; "It's not the whole menu, it's the free drink" reframe (s7, metaphor-internal = open adjudication #1) |
| B2 | "Em-dash grep: 0" | em-dash in s5 headline |
| C1 | "em-dashes: 0" | em-dashes s3, s4, s5, s8, CTA body, caption (~6); "THAT'S NOT GENEROSITY FOR ITS OWN SAKE — IT'S PROOF" reframe; typo "MOMENUM"; **"FREE, IN NOTION" = unverified delivery-format claim (possible invention — check BUSINESS.md/offer file)** |
| C3 | kill log explicitly claims "final caption does NOT contain quietly — verified by direct re-read" | caption line 1: "have quietly turned into" |

**Root cause:** models cannot reliably self-grep; they verify by intention, not by character. C even mislabels literal em-dash characters as "spaced hyphens."
**System fix required (Phase 1 output):** The Pass (station 6) gains a MECHANICAL LINT step — an actual regex/tool check (em-dash char, banned-vocab list, period-density count, staccato-run count) run by tooling, not model attention. Writer kill-log claims are never accepted as evidence. To be folded into WS-008 + craft file.

This finding is architecture-independent → it does NOT decide the tournament; voice + structure + fact-discipline do.

## Solo scores (all violations counted uniformly since they're systemic)

**Seed 1 (Email edu):** A1 7.5/10 (real transcript teaching, solid but flattest cover — flat threat vs. the spinach testimony), B1 8.5/10 (verbatim texture incl. "four later folder" artifact; tight structure), C1 8/10 (loosest, most alive voice + churros beat + confession angle; most mechanical violations + 1 possible invented fact "in Notion").
**Seed 2 (Offer/BOH):** A2 8/10 (richest teaching arc — rules + questions + "A Launch Is Just Five Emails" is the best aha of the nine decks; cover sits close to the real "Organic Marketing Is Dying" lane), B2 7.5/10 (Q1-Q4 verbatim + complete; register drier), C2 7.5/10 (same skeleton as B2, looser prose; honest self-flag on framework register). Shared weakness B2/C2: cover "Old Way, New Way." carries NO payoff (no fix/threat/confession/series/joke) — it reads label-adjacent; hook rules say payoff is mandatory. Specialists top-ranked it; I dissent and expect the lineup to expose it.
**Seed 3 (FTG):** A3 7/10 (verbatim 11-word cover over cap; honest thin-texture disclosure), B3 8.5/10 (5-word cap-compliant cover with wrongness in "yet"; her verbatim line kept as interior anchor s7 — structurally the smartest move of the nine; cleanest discipline), C3 8/10 (nearly identical to B3; richer caption but ships "quietly" + repeats the weak maxim).

## Head-to-head (pre-lineup, provisional)

- Seed 1: **B1 > C1 > A1** (fact discipline edges voice looseness; A1's cover loses the scroll)
- Seed 2: **A2 > C2 ≈ B2** (A2's aha + teaching arc wins; B/C's cover lacks payoff)
- Seed 3: **B3 > C3 > A3** (B3's cover architecture is the deck)

## Provisional architecture read (LINEUP DECIDES, not this)

- **B (narrow craft + specialist briefs): most disciplined, best seed-1 and seed-3 execution.** Evidence against the "full protocol is mandatory for voice" assumption.
- **C (hybrid): loosest voice but most violations + the only possible invented fact.** The full protocol did NOT buy discipline.
- **A (monolith): only architecture that produced a different (and in seed 2, better) creative angle — its independence found "A Launch Is Just Five Emails." But self-audit was least reliable and 2 of 3 covers are weakest.**
- Emerging hybrid hypothesis for Phase 3+: specialist briefs (B/C stage-1) + B-style writer + A-style freedom to escalate a better aha + MECHANICAL lint at The Pass + gate. But: blind lineup verdicts come first.

## Open items feeding Phase 2 sitting doc
- "in Notion" delivery claim (C1) — verify or kill.
- "Old Way, New Way." as cover — payoff-rule dissent (Fable) vs specialist ranking: Alyssa's take if it survives the lineup.
- Metaphor-internal reframe exemption (B1 ladies-night line) — already adjudication #1, this is a live example to attach.
