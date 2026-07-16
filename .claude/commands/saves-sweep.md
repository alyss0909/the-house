---
name: saves-sweep
description: Daily inspo sweep. Reads Alyssa's newest Instagram saves (burner-account sync, lands in Notion), extracts why each stopped her scroll, pairs each mechanic with one of her offers, and delivers 3 to 5 tap-ready post options to the Content Studio board in Notion. Her only job is tapping the ones she likes.
user_invocable: true
---

# /saves-sweep — from her saves to tap-ready options

The saves are the purest positive taste signal in the system: posts that stopped ALYSSA'S scroll. This sweep converts them into options before she finishes her coffee. Options are cheap, her taste is the scarce resource: always deliver more than she needs.

## Boot (light — content sessions skip house ceremony)

Load, in full, ONLY:
1. `Studio/Content/METHOD.md` (the craft authority; §3 stranger test applies to every option)
2. `Studio/Analysis/carousel-hook-forensics.md` (the 9 hook shapes + cover gate)
3. `Studio/Content/taste-ledger.md` (her reactions are law; check Positive signal section first)
4. `Studio/Hermes/BUSINESS.md` (live offers, chat words; blank chat word = "manual selection needed")
5. `Studio/Hermes/FUNNEL.md` (which offer each lane feeds)

Do NOT run HOUSE-MAP ceremony, journal duty, or the compounding audit here; those belong to Larry at session close. Do log every Alyssa reaction you encounter, verbatim, to the taste ledger — that duty is never skipped.

## The sweep

1. **Pull the new saves.** In Notion, open the Instagram Saves / Inspo intake (find via `notion-search` for "Inspo to Idea Home" or the saves database; once found, record its ID in the Cache section at the bottom of this file so future sweeps skip the search). Take everything new since the last sweep (check the board for the newest option's date).
2. **Extract the mechanic, not the content.** For each save, one plain sentence: what made her stop (the hook shape, the bit, the format move, the feeling). Zero verbatim text carries forward.
3. **Pair with her material.** For each mechanic worth using, find the offer or teaching asset of hers it could carry (BUSINESS.md live offers + FUNNEL.md lanes + `Library/Offers/*/MAP.md`). The pairing question: "what is the version of this only Alyssa could make?"
4. **Write 3 to 5 options.** Each option is exactly four parts:
   - **Spark:** the save it came from (link or description) and the mechanic in plain words
   - **Concept:** her version, one line, a simple direct promise or bit a stranger stops for
   - **Offer:** which offer it feeds and the CTA word (verbatim from BUSINESS.md or "manual selection needed")
   - **Hooks:** 5 options, each ≤10 words, each matching a named shape from the forensics file, each passing the stranger test
5. **Deliver to the Content Studio board in Notion** (database ID in the Cache section; created 2026-07-16). One row per option: Status = "Option", Type = the lane it fits, full four-part text in the page body. No vault copy; the board is the single home for options (her picks flow back through /content-run).
6. **Report to Alyssa in one line:** how many options landed and the single best hook of the batch. Nothing else.

## Quality bar

- Every option passes the stranger test (METHOD §3). If it could belong to ten other creators, rewrite or drop it.
- No platform-news framing, no Mosseri, no feature rollouts (taste ledger 2026-07-09 ruling). The saves themselves are the trend research.
- Never CTA to Unignorable Subject Lines. Never pitch Sunset, Geriatric, or idea-stage products.
- FTG-flavored saves route to the FTG lane rules (METHOD §8), not the carousel rules.

## Cadence

Designed to run daily after the 7am burner sync (external cron wiring is Mack's open task; until it lands, Alyssa or Larry runs `/saves-sweep` on demand and it catches up on all unswept saves).

## Cache

- Pipeline home page "Inspo to Idea" (Notion): `398c8b43-e565-81cf-9ca1-f53f4df742df`
- Instagram Saves raw database (Notion): `b7d1e552-a849-4ae9-aa9a-394eb5ad6127`
- Content Studio board data source (Notion): `collection://89047304-dac5-4668-ac16-a6eaf8721123` (database page `07fc7e627412453f8590d7b867e88613`, lives under Inspo to Idea)
