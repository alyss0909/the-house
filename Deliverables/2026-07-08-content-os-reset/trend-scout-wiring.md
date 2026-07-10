---
title: Trend Scout Wiring — Mack spec for SOP-033 + WS-011
owner: Mack (automation) / Suki (interpretation)
status: draft for Alyssa approval (Gate 2, HANDOFF-3)
---

# Trend Scout Wiring

## 1. The existing monthly scrape (DOCUMENT, DO NOT REBUILD)

- **What it is:** a monthly scrape currently run via **Apify** (`instagram-post-scraper`,
  confirmed run id `KM38FSuIlxdZk0Yvq`, seeded 2026-07-07) against the 16 Layer-1
  trusted accounts in `Team Inbox/pitches/trusted-sources.md`.
- **HANDOFF-3 calls this a "Claude Routine visible in the Claude app."** The artifact I can
  see on disk is an Apify actor run, not a Claude Routine object. These may be the same
  thing (a Claude Routine that *invokes* the Apify actor) or two different descriptions of
  one pipeline. **CONFIRM WITH ALYSSA: is the monthly scrape a Claude Routine that calls
  Apify, or is "Claude Routine" describing something else entirely (e.g. a scheduled
  prompt in the Claude app UI)?** I am not touching either until this is confirmed.
- **Cadence:** monthly (per `trusted-sources.md` frontmatter: `scrape_cadence: monthly`).
  **CONFIRM WITH ALYSSA: exact day-of-month it fires, and whether it's on a schedule or
  manually kicked off inside the Claude app.**
- **What it scrapes:** top posts by saves/reach (winners only) from the Layer-1 accounts,
  reads slide images (vision/OCR) for cover + hook + slide-structure — captions are
  low-priority/proxy only. Also retries the known-private accounts each run
  (@cassklass_, @hellomedia, @milanasarenac).
- **Output path (known):** `Team Inbox/pitches/swipe/YYYY-MM-swipe.md` — confirmed to exist
  (`2026-07-swipe.md`, 255 lines, plus a `covers-2026-07` asset folder alongside it).
- **Output shape (known, observed):** frontmatter (title/source/note) + a "Verified top
  covers" table (account, likes, verbatim cover text read off the image, the move/mechanic)
  + presumably more sections below (not fully read here — token discipline). Ranked by
  likes, carousels prioritized.
- **CONFIRM WITH ALYSSA: is the Apify spend/routine still "pre-approved" on an ongoing
  monthly basis, or was 2026-07-07 a one-time seed run that needs to be scheduled?**
- **CONFIRM WITH ALYSSA: where does the "Claude Routine" itself live/trigger from** — is
  there a routine definition file, or is it purely inside the Claude app with no vault
  artifact? If there's no vault artifact, Mack has nothing to wire *to* except the output
  path, which is enough for SOP-033 but not for health-checking the routine's execution
  directly (see §4).

## 2. Monthly Swipe File spec (confirmed, already live)

- **Path:** `Team Inbox/pitches/swipe/YYYY-MM-swipe.md`
- **Holds:** verbatim covers/hooks read off slide images (not captions) for the month's
  top-performing posts across Layer-1 trusted accounts, ranked by likes/saves, carousels
  first. Includes source run id and a caption-is-only-a-proxy disclaimer. Companion asset
  folder `covers-YYYY-MM/` holds the actual cover images referenced.
- This file is the **swipe layer** — raw craft evidence. It is not analysis and not voice.
  Nobody (including Alyssa) needs to watch it land; it's an input to the weekly brief.

## 3. Proposed WEEKLY Trend Scout Brief routine

- **Owner:** Mack wires the mechanics; Suki (or a future Trend Specialist) interprets.
- **Trigger:** weekly, ahead of the Monday concept-pitch cycle (WS-011 step 1). Proposed:
  runs the morning before Suki's Weekly Strategy Brief is due, so SOP-033 output is ready
  as an input. **CONFIRM WITH ALYSSA: exact day/time** — suggest Sunday evening or Monday
  early AM, matching the existing W28/W29 pitch-file cadence already in
  `Team Inbox/pitches/`.
- **Inputs:**
  - current month's `Team Inbox/pitches/swipe/YYYY-MM-swipe.md` (most recent monthly scrape)
  - `Team Inbox/pitches/trusted-sources.md` (Layer 3 macro feeds, read weekly — newengen +
    creatorflow links)
  - `Team Inbox/pitches/taste-ledger.md` (what Alyssa has already reacted to, so the brief
    doesn't re-pitch dead mechanics)
  - prior week's `Team Inbox/pitches/YYYY-Www-pitch.md` if one exists (avoid repeat ammo)
- **Output path:** `Team Inbox/pitches/trend-briefs/YYYY-Www-trend-brief.md`
  (folder does not exist yet — Mack creates on first run)
- **Required sections:**
  1. What's working now (patterns with real examples, not vibes)
  2. What's stale / overused this week
  3. Top cover mechanics (named + example accounts)
  4. Top slide-structure patterns (named + example accounts)
  5. Examples from trusted accounts (verbatim, cited, cover+likes)
  6. Opportunity notes for Alyssa's offers (where a trend mechanic could carry a real
     BOH/offer angle — tie to `Hermes/FUNNEL.md` if available downstream, Suki's call)
  7. Mean Alyssa ammo (specific reasons a lazy pitch would die this week)
  8. Scrape gaps (accounts that failed/were private, any staleness in the source swipe file)

## 4. Health checks

- **No-run detection:** before generating a weekly brief, check whether the current
  month's swipe file (`swipe/YYYY-MM-swipe.md`) exists and has a modified date within the
  last ~35 days. If missing or stale, the weekly brief output must open with a **"SCRAPE
  STALE / DID NOT RUN"** banner naming the last successful month, rather than silently
  reusing old data as if fresh.
  - **Ceiling:** this is a file-existence/mtime check only. It cannot see *inside* the
    Claude app to confirm the monthly routine actually fired on schedule — it only proves
    a swipe file landed in the vault. If the routine fires but writes nowhere Mack can see,
    this check will falsely report "no-run." **CONFIRM WITH ALYSSA** once the Claude
    Routine question above is resolved, so this check can point at the real trigger if one
    becomes visible.
- **Failed/empty-scrape reporting:** the weekly brief's "scrape gaps" section must always
  list which Layer-1 accounts had zero winning posts pulled that cycle (private/removed/no
  qualifying post) — carried forward from the swipe file's own gap list
  (e.g. @cassklass_, @hellomedia, @milanasarenac already flagged).
  - **Ceiling:** this only reports gaps the swipe file itself already recorded. It cannot
    independently verify Apify run success/failure logs; that visibility depends on
    whichever system (Claude Routine or Apify dashboard) owns the run.
- **Staleness alert:** if the weekly brief is generated using a swipe file older than one
  full month-cycle, OR reuses more than ~50% of examples from the prior week's brief,
  flag it inline as "LOW-NOVELTY WEEK" so Suki/Alyssa know the ammo is thin rather than
  assuming full freshness.
  - **Ceiling:** overlap detection is a naive text/account-name match, not semantic
    dedup — it will miss a reworded restatement of the same mechanic.

## 5. Mack-ready wiring for SOP-033 + WS-011

- **SOP-033 inputs, confirmed against real paths:**
  `Team Inbox/pitches/swipe/YYYY-MM-swipe.md`, `Team Inbox/pitches/trusted-sources.md`
  (Layer 3 links), `Team Inbox/pitches/taste-ledger.md`.
- **SOP-033 output, confirmed path:** `Team Inbox/pitches/trend-briefs/YYYY-Www-trend-brief.md`
  (new folder, created on first run — no other setup needed).
- **How revised WS-011 calls it:** WS-011 step 1 invokes SOP-033 before Suki's Weekly
  Strategy Brief (step 2). SOP-033 does not run the monthly scrape — it only reads the
  latest swipe file plus Layer 3 feeds and taste ledger, and writes the weekly brief. If
  the no-run health check trips, WS-011 step 1 halts with the stale-scrape banner surfaced
  to Suki before step 2 proceeds, rather than pitching concepts on dead data.
- **Rate limits / retry / idempotency:** the weekly brief routine is read-only against
  vault files (no external API calls of its own), so no rate limit exposure. Idempotent —
  re-running for the same ISO week overwrites/regenerates `YYYY-Www-trend-brief.md`
  rather than appending. The monthly Apify scrape (upstream, out of scope here) already
  has its own retry-the-private-accounts behavior noted in `trusted-sources.md`; Mack does
  not change that.

---

## UNKNOWNS — need Alyssa's confirmation before Gate 2

1. Is the "monthly Trend Scout Claude Routine" the same artifact as the Apify
   `instagram-post-scraper` run I found, or a separate Claude-app object that calls it?
2. Exact schedule/day-of-month the monthly scrape fires (or is it manual-trigger only)?
3. Is Apify spend for this routine ongoing/scheduled, or was 2026-07-07 a one-time seed
   that still needs to be put on a recurring schedule?
4. Where (if anywhere) does the Claude Routine definition live so Mack can wire a real
   no-run health check against it, instead of the file-existence proxy in §4?
5. Confirmed day/time for the new weekly Trend Scout Brief run (proposed: Sun evening /
   Mon early AM).
