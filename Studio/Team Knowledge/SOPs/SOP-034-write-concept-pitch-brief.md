# SOP-034 — Write Concept Pitch Brief

- **Default owner:** Angus, Concept Specialist / Suki-directed. Reusable by any agent. *(Hired 2026-07-08 per Gate-3 authorization; runs under Suki's direction, per [[HIRING-PLAN-v2]].)*
- **Status:** Active (Gate-2 approved by Alyssa 2026-07-08).
- **Triggered by:** WS-011 Step 3; "pitch concepts", "concept slate". Runs after SOP-038's slot-offer lock.
- **References:** [[SOP-038-suki-weekly-strategy-brief]], `Hermes/FUNNEL.md`, `Hermes/MAP.md` §3, `Studio/Content/taste-ledger.md`, [[GL-007-token-discipline]].

## Procedure
Generate 10+ concept candidates internally → run [[SOP-037-run-mean-alyssa-content-gate]] → show survivors to Alyssa as **plain-language concepts**. Goal: **3 Mean-Alyssa-surviving concepts per M/W/F slot** before Alyssa chooses.

## Backend fields (per concept — matches professional creative-brief norm, Pax-validated)
audience moment · objective · key insight · single message · desired behavior · **angle (the belief-breaking meaning — named separately from words: Concept owns the angle, Hook owns the words)** · offer/freebie tie · **comment-CTA keyword** · trend signal · Alyssa teaching/source clue · belief it breaks · approval path.

## Alyssa-facing shape (the only thing she sees)
> "A post about [reader problem] and [specific solution/angle], funny/sharp because [belief it breaks], gives them [do-right-now payoff], CTA [freebie/offer]."

## Pass / Fail
- **PASS:** a specific idea a stranger stops for (not a topic); real offer-fit on *meaning*; a real source path exists; earns the comment; angle present but NOT already a hook line.
- **DEADLIEST FAIL:** topic-shaped top-9 regurgitation ("email marketing mistakes") — the mediocre-role tell (Pax: externally, this IS the bottom-two-thirds content failure mode); OR an "angle" that is really a finished hook — kick back, that's Hook's rung.

## Postability rule (one slice, not the whole system)

A single post teaches **ONE self-contained slice** a carousel can actually deliver — the full multi-step system stays the TEASE (that's what the freebie/offer is for). **Over-promising the whole system fails twice: it's un-deliverable in a post AND it gives away the paid thing.** Test every concept: *"Can one carousel actually deliver this, or does it need her whole transcript/module?"* If it needs the module, it's the offer — pick one postable move/decision/number from it and tease the rest. (Origin: Alyssa, 2026-07-08 — "you can't share my ENTIRE batch process in a post, it's literally how long in the transcripts.") Mean Alyssa (SOP-037) kills any concept that promises to teach a whole system.

## Every concept is a how-to, anchored to real current trend data

- **How-to spine (Alyssa, 2026-07-08):** every post is a **HOW TO get a result** — how to DO / BE / HAVE something the reader wants. The concept promises the RESULT; the teaching is one slice of the how. A flat observation or "finding about the world" with no result the reader wants is dead — the reporter POV is the *tone* it's said in, never a replacement for the how-to promise.
- **Trend-anchored, never evergreen-basic (Alyssa, 2026-07-08):** every concept anchors to a **real, current, cited trend signal** from the week's Trend Scout brief (industry shifts/data/debates happening NOW). If a concept is true in any year for any account ("Pinterest traffic runs itself"), it's evergreen filler an AI could generate — cut it. Timely + specific beats correct + generic. Where a signal's confidence is only Medium, frame it as "what's shifting / what's working now," never a fabricated stat.

## Dashboard render contract (MANDATORY — the sheet must parse in the Content Command Center)

The pitch sheet is read by the dashboard's concept parser (`Studio/Content/dashboard/01 Concepts.md`). Write it in EXACTLY this shape or the concepts render blank:

- **NO YAML frontmatter.** The parser stops at the first `---` line — a leading `---` block blanks the whole panel. Put theme/week/status as plain lines under the `# Weekly Pitch Sheet — Www` title, and attribution as a plain `*Prepared by...*` line.
- **Day headers, exact case:** `## Monday — Category (offer)`, `## Wednesday — ...`, `## Friday — ...`. Capitalized as shown — `## MONDAY` will NOT match.
- **Each concept = two parts:** a `N. Short Title` line, then a description line that ENDS with the CTA clause ` — comment WORD → Offer Name` (or ` — no CTA` for Friday). The em-dash + `comment`/`no cta` ending is how the CTA chip is parsed.
- **No `---` between day blocks** (a stray `---` mid-sheet stops parsing). Use a single `---` only before the footer.
- **Killed/parked concepts go in a footer** after that single `---` (in `### ` sections) — off the numbered slate, so they never render on the dash.

Model the format on the last clean sheet (e.g. `2026-W30-pitch.md`). *Latent hardening item for Felix: the parser should skip frontmatter + match day names case-insensitively so a maker slip degrades gracefully instead of blanking.*
