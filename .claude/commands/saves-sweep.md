---
name: saves-sweep
description: Daily inspo sweep. Reads Alyssa's newest Instagram saves (burner-account sync, lands in Notion), extracts why each stopped her scroll, pairs each mechanic with one of her offers, and delivers 3 to 5 tap-ready post options to the Content Studio board in Notion. Her only job is tapping the ones she likes.
user_invocable: true
---

# /saves-sweep — from her saves to tap-ready options

The saves are the purest positive taste signal in the system: posts that stopped ALYSSA'S scroll. This sweep converts them into options before she finishes her coffee. Options are cheap, her taste is the scarce resource: always deliver more than she needs.

## Boot (light — content sessions skip house ceremony)

Load, in full, ONLY (slimmed 2026-07-17 on Alyssa's yes; METHOD and FUNNEL dropped from the daily boot):
1. `Studio/Analysis/carousel-hook-forensics.md` (the 9 hook shapes + cover gate)
2. `Studio/Content/taste-ledger.md` (her reactions are law; check Positive signal section first)
3. `Studio/Hermes/BUSINESS.md` (live offers, chat words; blank chat word = "manual selection needed")
The stranger test and value law used below are quoted inline in this file's option format; the offer map lives in `Studio/Content/briefs/INDEX.md` (open a single brief only when a pairing needs it). Open METHOD only to settle a dispute, never as boot.

Do NOT run HOUSE-MAP ceremony, journal duty, or the compounding audit here; those belong to Larry at session close. Do log every Alyssa reaction you encounter, verbatim, to the taste ledger — that duty is never skipped.

## The sweep

1. **Pull from the saves tray.** (The Content Ideas robo-tray was retired 2026-07-17 on Alyssa's call; its volume job is folded into the Wildcard rule below. Do not process its old rows.)
   - **Instagram Saves** (raw saves, IDs in Cache): rows with Status "New".
   - **Wildcard rule (the folded-in ideation job):** when fewer than 3 usable saves exist, OR when any lane (Monday education, Wednesday offer, Friday FTG) has zero live options on the board, the sweep adds up to 2 wildcard options for the starved lane, built from the newest trend brief in `Studio/Content/trend-briefs/` or from `Studio/Content/idea-bank.md`, marked "Wildcard" in the Spark line, same format, same quality bar. Wednesday can never starve just because the week's saves were all inspiration-shaped.
2. **Extract the mechanic, not the content.** For each save, one plain sentence: what made her stop. That mechanic sentence IS the tag that matters (her note 2026-07-17: tags that don't relate to taste are filing, not learning). Zero verbatim external text carries forward; external hooks get REWRITTEN into her named shapes.
3. **Pair with her material.** For each mechanic worth using, find the offer or teaching asset of hers it could carry (BUSINESS.md live offers + FUNNEL.md lanes + `Library/Offers/*/MAP.md`). The pairing question: "what is the version of this only Alyssa could make?"
4. **Write 3 to 5 options.** Each option is exactly six parts:
   - **Spark:** the save it came from, and the mechanic in plain words
   - **Concept:** her version, one line, a simple direct promise or bit a stranger stops for
   - **The value:** what a non-buyer walks away with, named concretely (METHOD §1.6 — every post blows someone away with something useful, THEN the ask). FTG options are exempt; their value is the feeling.
   - **Offer:** which offer it feeds and the CTA word (verbatim from BUSINESS.md or "manual selection needed")
   - **Hooks:** 5 options, each ≤10 words, each matching a named shape from the forensics file, each passing the stranger test
   - **Framework:** which of the five production frameworks this wants to be (House Report / How To + version / Old Way New Way / Hot Take / For The Girls), one line on why — this pre-seeds the /content-run brief. House Report reinstated by Alyssa 2026-07-17.
5. **Deliver to the Content Studio board in Notion** (database ID in the Cache section; created 2026-07-16). One row per option: Status = "Option", Lane = the lane it fits, **Offer = a RELATION to the live Products DB row** (data source `collection://2f4c8b43-e565-8149-a25f-000b38310c24` — pass the product page ID, never free text; Alyssa converted this property 2026-07-16), **Inspo (save) = relation to the source save row**, full five-part text in the page body. No vault copy; the board is the single home for options (her picks flow back through /content-run).
6. **Close the tray:** every save used in an option → Status "Reviewed" (→ "Used" once its post ships). Nothing gets processed twice.
7. **Report to Alyssa in one line:** how many options landed, the single best hook of the batch, and the runway (how many approved posts are waiting to be built, so she knows when a 10-minute tap session is due). Nothing else.

## Small bites (hard caps — this is what makes the sweep runnable by ANY model, any day)

- Process at most **10 saves + 5 ideas per run**, newest first. Leftovers wait for the next run; the trays' statuses guarantee nothing is lost or double-processed.
- Deliver **3 to 5 options, never more.** If the material is thin, deliver 2 great ones instead of 5 weak ones. Volume lives in hooks-per-option, not options-per-day.
- **When unsure, don't guess — park.** If a mechanic or pairing is ambiguous, write the question in one plain sentence inside the option body for Alyssa, or skip the item and leave its status untouched for a smarter session. A skipped save costs nothing; a weak option costs her trust.
- The five-part option format and the tray-status updates are NOT optional, whatever model is running. They are the compounding loop; skipping them is how systems rot.

## Quality bar

- Every option passes the stranger test (METHOD §3). If it could belong to ten other creators, rewrite or drop it.
- No platform-news framing, no Mosseri, no feature rollouts (taste ledger 2026-07-09 ruling). The saves themselves are the trend research.
- Never CTA to Unignorable Subject Lines. Never pitch Sunset, Geriatric, or idea-stage products.
- FTG-flavored saves route to the FTG lane rules (METHOD §8), not the carousel rules.

## Cadence

Designed to run daily after the 7am burner sync (external cron wiring is Mack's open task; until it lands, Alyssa or Larry runs `/saves-sweep` on demand and it catches up on all unswept saves).

## Cache

- Pipeline home page "Inspo to Idea" (Notion): `398c8b43-e565-81cf-9ca1-f53f4df742df`
- Instagram Saves raw database (Notion): `b7d1e552-a849-4ae9-aa9a-394eb5ad6127`, data source `collection://9312fe97-dd0c-4532-90f5-20af27748d0d`. Query rows with Status "New"; after using a save in an option, set it to "Reviewed" (and "Used" once its post ships).
- Products DB for the Offer relation: data source `collection://2f4c8b43-e565-8149-a25f-000b38310c24`
- Content Ideas database: RETIRED 2026-07-17 (Alyssa's call). Do not query or promote from it. The unattended ideation cron that fed it should be disabled (open task for Mack). Old IDs kept for history: `589f122c-b458-438c-93f3-904e5dc03530`, data source `collection://ea566bd4-d00f-4da7-864a-e4ac07a2d846`.
- Content Studio board data source (Notion): `collection://89047304-dac5-4668-ac16-a6eaf8721123` (database page `07fc7e627412453f8590d7b867e88613`, lives under Inspo to Idea)
