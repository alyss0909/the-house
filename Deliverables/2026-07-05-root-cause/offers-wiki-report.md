# Offers Wiki Report — 2026-07-05

Scope: `PKM/My Life/Offers/` made into a well-connected wiki hub. Additive edits only. No prose, prices, or frontmatter values changed except the one approved `[[operations]]` → `[[business]]` substitution in "Part of:" lines. No files moved or rewritten.

## 1. `[[operations]]` → `[[business]]` substitution

Applied to every "Part of:" line inside `PKM/My Life/Offers/` that referenced `[[operations]]` (12 files). No `key_element: operations` or `key_element: work` frontmatter keys exist in any Offers file — the substitution was body-text only.

Files changed:
- 90d-clock-in.md
- back-of-house.md
- best-year-yet.md
- biz-tracker.md (had `[[operations]]` · `[[promos]]` — only operations swapped)
- private-mentorship-w-alyssa.md
- quarter-in-a-day.md (had `[[operations]]` · `[[emails]]` — only operations swapped)
- quarter-prompt.md
- simmer-system.md
- soft-ceo-monthly-notion-template.md
- soft-ceo-sessions.md
- soft-sundays.md (had `[[operations]]` · `[[emails]]` · `[[socials]]` · `[[promos]]` — only operations swapped)
- the-ceo-year-notion-planner.md
- the-90-minute-reset.md (had `[[operations]]` · `[[emails]]` — only operations swapped)
- the-numbers.md
- the-productive-entrepreneur.md
- the-promo-planner-in-notion.md (had `[[operations]]` · `[[promos]]` — only operations swapped)

Files that already used a different Key Element (no substitution needed, left as-is): a-year-of-emails.md, bingeable-newsletters.md, cold-subscriber-automation.md, email-list-revival-plan.md, list-resuscitator.md, pin-planner.md, the-5-minute-newsletter.md, the-daily-profit-activities.md, unignorable-subject-lines.md ([[emails]]/[[socials]]/[[promos]]), rush-order.md ([[back-of-house]]).

Verified: `grep -rn "\[\[operations\]\]" "PKM/My Life/Offers/"` now returns zero matches.

## 2. Per-file "## Wiki" section added

Added a new `## Wiki` section (none of the 25 offer files had an existing related/links section to extend) to every offer file, with: sales page link (where one exists), the canonical facts line to `[[Hermes/BUSINESS]]`, the relevant BOH module(s), real carousel posts (as inline-code folder paths), and funnel neighbors.

| File | Sales page linked | BOH module(s) linked | Carousel(s) linked | Funnel neighbors noted |
|---|---|---|---|---|
| 90d-clock-in.md | yes | 0.3 Cozy Business Plan, 0.1 Inspiration Pantry | 2026-03-01-80-days-until-summer-90d-clock-in | → the-promo-planner-in-notion |
| a-year-of-emails.md | yes | 1.1 Email First Ecosystem, 2.3 The Simmer | none found (gap) | adjacent email ladder, no documented direct link |
| back-of-house.md | yes | 0.3 Cozy Business Plan, 4.1 The Lazy Launch | 2026-03-03-organic-marketing-is-dying | → rush-order |
| best-year-yet.md | yes | 0.4 Quarterly Recap | none found (gap) | none documented |
| bingeable-newsletters.md | yes | 2.3 The Simmer | none found (gap) | → list-resuscitator |
| biz-tracker.md | yes | 0.3 Cozy Business Plan | none found (gap) | none documented |
| cold-subscriber-automation.md | **none found** | 2.2 Not Grandads | none found (gap) | → email-list-revival-plan (bundled) |
| email-list-revival-plan.md | yes | 2.3 The Simmer, 1.4 Double Yes | 2026-01-15…pt-1, 2026-01-20…pt-2 | → list-resuscitator; bundles cold-subscriber-automation |
| list-resuscitator.md | yes | 2.3 The Simmer, 1.4 Double Yes | nearest-lane only (gap for exact slot) | ← email-list-revival-plan |
| pin-planner.md | yes | 3.1 Bread & Butter, 3.3 The Batch | 5 carousels (01-29, 02-10, 02-06, 02-19, 02-24) | → back-of-house |
| private-mentorship-w-alyssa.md | closest-match only (see below) | none single (spans curriculum) | none found (gap) | the-productive-entrepreneur |
| quarter-in-a-day.md | yes | none single (spans curriculum) | none found (gap) | none documented |
| quarter-prompt.md | **none found** | 0.3 Cozy Business Plan, 0.1 Inspiration Pantry | none found (gap) | paired with soft-ceo-sessions (same slot) |
| rush-order.md | not built yet | spans full curriculum | none (idea stage) | ← back-of-house |
| simmer-system.md | none (internal asset) | 2.3 The Simmer Transcript | none (internal, not pitched) | internal mechanism of back-of-house |
| soft-ceo-monthly-notion-template.md | yes | 0.3 Cozy Business Plan, 0.1 Inspiration Pantry | 2026-02-01-feb-is-the-new-jan, 2026-03-01-80-days | ← soft-ceo-sessions |
| soft-ceo-sessions.md | yes | 0.3 Cozy Business Plan | none found (gap) | → soft-ceo-monthly-notion-template |
| soft-sundays.md | yes | 0.3 Cozy Business Plan | none found (gap) | freebie entry point, no single documented next step |
| the-5-minute-newsletter.md | yes | 2.2 Not Grandads, 2.3 The Simmer | none found (gap) | → unignorable-subject-lines |
| the-90-minute-reset.md | yes | none single (spans Phase 0-1) | none found (gap) | → $111 follow-up OTO (same offer) |
| the-ceo-year-notion-planner.md | yes | 0.3 Cozy Business Plan, 0.1 Inspiration Pantry | 2026-02-01-feb-is-the-new-jan, 2026-03-01-80-days | sits alongside soft-ceo-monthly-notion-template, 90d-clock-in |
| the-daily-profit-activities.md | yes | 4.1 The Lazy Launch | none found (gap) | none documented |
| the-numbers.md | yes | 0.3 Cozy Business Plan | none found (gap) | none documented |
| the-productive-entrepreneur.md | yes | none single (spans curriculum) | none found (gap) | private-mentorship-w-alyssa |
| the-promo-planner-in-notion.md | yes | 4.1 Promo Copy Planner, 4.1 The Lazy Launch | 2026-03-03-organic-marketing-is-dying | ← 90d-clock-in (50% bump) |
| unignorable-subject-lines.md | closest-match only (bump copy) | 2.2 Not Grandads | none found (gap) | ← the-5-minute-newsletter |

All 25 offer files also got a `Facts (price/status/chat word): [[Hermes/BUSINESS]] — canonical` line.

## 3. Offers with NO sales page found

- **cold-subscriber-automation.md** — no page in `PKM/Second Brain/examples/sales-pages/`, frontmatter `sales_page_url` is also blank. Noted as gap, linked forward to email-list-revival-plan instead.
- **quarter-prompt.md** — no page found; frontmatter `sales_page_url` blank.
- **rush-order.md** — not built yet (idea stage per its own frontmatter/status); linked to the draft copy doc instead.
- **simmer-system.md** — internal asset, never had a standalone sales page; not pitched directly, so this is expected, not a gap.
- **private-mentorship-w-alyssa.md** and **unignorable-subject-lines.md** — no *dedicated* page exists, but each already had an explicit "closest copy source" documented in its own Notes (The Productive Entrepreneur sales page; The 5 Minute Newsletter bump copy respectively). Linked those explicitly rather than leaving blank.

## 4. Name-matching ambiguities NOT guessed on

- **soft-ceo-monthly-notion-template.md vs soft-ceo-sessions.md**: two separate sales pages exist ([[Library/Examples/sales-pages/soft-ceo-monthly-notion-template-sales-page]] and [[Library/Examples/sales-pages/soft-ceo-sessions-sales-page]]) and both matched cleanly by name — no ambiguity, but flagging since the names are close enough to warrant a note.
- **the-numbers.md**: sales page file is named [[Library/Examples/sales-pages/the-numbers-sales-page]] — matched confidently, but the offer's own frontmatter `theme` is `boh_systems` while its "Tier" line inside the body says "Emails" (pre-existing inconsistency in her content, not something I touched or resolved).
- **Carousel-to-offer matching for GAP slots**: MAP.md §3 marks several week/day slots as "GAP — no real post" (W1 Wed, W1 Fri, W3 Mon, W4 Mon, W4 Fri). For offers living in those slots (list-resuscitator's Wed reveal, the-5-minute-newsletter, unignorable-subject-lines, biz-tracker, the-numbers, soft-sundays, soft-ceo-sessions, quarter-prompt, best-year-yet), I did not guess a substitute carousel — I reported the gap explicitly and, where MAP.md flagged a "nearest lane" post, named it only as "nearest lane" (list-resuscitator), never as a direct pitch.
- **PIN vs Pinterest chat-word conflict** (pin-planner.md): flagged in Hermes/MAP.md §7 and BUSINESS.md as her call to make — I did not resolve it, just linked to BUSINESS.md as canonical.
- **Price conflicts** (quarter-in-a-day.md: $2,000 vs $111; the-ceo-year-notion-planner.md: $79 vs $27–47): pre-existing, documented in the files' own Notes already; I referenced MAP.md §7 in the new Wiki line rather than picking a number.

## 5. `[[operations]]` / `[[work]]` links found OUTSIDE Offers/ (report only — not edited)

Frontmatter `key_element: operations` / `key_element: work`:
- [[Deliverables/2026-07-05-vault-learn/learn-goals-life]]
- [[Notebook/Journal/2026/05/2026-05-27-larry-pkm-todos]]
- [[Notebook/Life/Topics/ai-tools]]
- [[Notebook/Life/Topics/instagram-inspiration]]
- [[Notebook/Life/Topics/pkm]]
- [[Notebook/Life/Topics/voice-and-writing-style]]
- [[Studio/Team Knowledge/Guidelines/GL-002-frontmatter-conventions]]
- [[Studio/Team Knowledge/Guidelines/GL-004-tag-taxonomy]]
- [[Studio/Team Knowledge/session-logs/2026/05/2026-05-28-team-inbox-bulk-processing]]
- [[Studio/Team Knowledge/Templates/goal]]
- [[Studio/Team Knowledge/Templates/project]]
- [[Studio/Team Knowledge/Templates/topic]]

Inline `[[operations]]` wikilinks:
- 18 files under `PKM/Journal/2021-2026/...` (life-admin / systematize-socials / back-of-house cross-references)
- `PKM/My Life/Topics/INDEX.md` (line 7 — "pkm" listed "under [[operations]]")
- [[Notebook/Life/Topics/pkm]] ("Part of:** [[operations]]")
- Several `Deliverables/` and `Team Knowledge/session-logs/` docs (historical review notes, session logs) referencing `[[operations]]`/`design`-area mapping decisions

None of these were touched, per scope (edits restricted to `PKM/My Life/Offers/`).

## 6. INDEX.md check

Alyssa's mission brief said rush-order was "exists on disk, missing from the bullet list" — on inspection, **rush-order was already listed** in [[PKM/My Life/Offers/INDEX]] (line: `- [[rush-order]] — Rush Order (idea)`). Cross-checked every file on disk against the INDEX bullet list and every INDEX bullet against disk: all 25 offer files are listed, and all listed files exist. No changes needed or made to INDEX.md.

## Files touched

All under `PKM/My Life/Offers/`:
90d-clock-in.md, a-year-of-emails.md, back-of-house.md, best-year-yet.md, bingeable-newsletters.md, biz-tracker.md, cold-subscriber-automation.md, email-list-revival-plan.md, list-resuscitator.md, pin-planner.md, private-mentorship-w-alyssa.md, quarter-in-a-day.md, quarter-prompt.md, rush-order.md, simmer-system.md, soft-ceo-monthly-notion-template.md, soft-ceo-sessions.md, soft-sundays.md, the-5-minute-newsletter.md, the-90-minute-reset.md, the-ceo-year-notion-planner.md, the-daily-profit-activities.md, the-numbers.md, the-productive-entrepreneur.md, the-promo-planner-in-notion.md, unignorable-subject-lines.md.

INDEX.md: inspected, no changes needed.

No files in `PKM/Second Brain/` or `Hermes/` were modified (read-only, per instructions).
