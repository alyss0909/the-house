---
title: Next Phase — Post-Bring-It-Home Handoff
date: 2026-07-10
owner: Larry
source_class: map
status: handoff — execute in a fresh session, most items need Alyssa in the room
---

# Next phase — the open loops after Bring It Home

You are Larry, in the vault at `C:\Users\accol\OneDrive\Desktop\the-house`. Read [[HOUSE-MAP]] and [[GL-013-the-house-rules]] first — they are the constitution. This handoff picks up immediately after [[2026-07-10-bring-it-home-handoff]] closed; full mechanics of that restructure are in [[2026-07-10-13-35_larry_bring-it-home-team-and-library-phase]] (session log) and [[2026-07-10-validation-results]] (scores: retrieval gauntlet 10/10 after vs 7/10 before, stranger test clean pass).

## State when this was written

**Done:** Team + Team Knowledge live at `Studio/Team/` + `Studio/Team Knowledge/`. Second Brain dissolved — verbatim work at `Library/Examples/` + `Library/Programs/`, team analysis at `Studio/Analysis/`. All 26 offers merged into `Library/Offers/<offer>/MAP.md`. [[Library/me]] promoted to [[Library/me]] (`promoted_by: alyssa`, 2026-07-10). `PKM/Documents/annapuchin.css` (a stray, unexplained file) deleted at Alyssa's direction. A new real signal was filed: [[Studio/Signals/Developing Ideas/system-already-beats-external-tools]]. Three scheduled tasks that had gone stale from the restructure (`hermes-deep-voice-study`, `hermes-deep-voice-study-645`, `monthly-trend-scout-scrape` — the last one was pointing at a completely different, retired folder, `mypka-scaffold-latest (2)`) were repointed and fixed same-session. Git is LOCAL only — never push. Latest tag: `library-live` (plus the earlier checkpoint tags — see the session log's rollback list).

**Not done — this handoff's job.** Four of these are things Alyssa flagged directly this session (verbatim, lightly cleaned up):

1. "there being overlap generally between hermes, content desk and second brain [now Library/Studio-Analysis]"
2. "the products and offers being in multiple places"
3. "the journal cleanup"
4. "the routines" (the scheduled-task landscape generally, beyond the three already fixed)

Plus items already flagged at the end of the Bring It Home session that are still open: Deliverables drain, the optional Hermes/ folder move, inbox-zero co-processing, Notebook/Todos design.

## Open loop 1 — Hermes / Content desk / Analysis overlap

**The shape of the problem, as best Larry can characterize it without Alyssa's read:** there are now (at least) three places that could each be mistaken for "the voice/content brain":

| Zone | What it actually is | Trust tier |
|---|---|---|
| `Hermes/` | Judgment layer — SOUL/STYLE/TASTE/ANTI-AI + `craft/*.md`. The only voice AUTHORITY per the 2026-07-05 Fable ruling. | Studio — opinion, but the highest-trust opinion in the house |
| `Studio/Analysis/` | The team's AI-mined study of her real work — voice-profile.md, writing-style.md, carousel-slide-by-slide.md, etc. [[Hermes/SOURCES]] already demotes most of it to tier-2 ("navigate with, never voice-train on") and explicitly says its frontmatter claims of primacy are void, superseded by Hermes/JUDGMENT. | Studio — opinion, explicitly subordinate to Hermes |
| `Studio/Content/` | The pitch/dashboard desk — Suki-led, where Angus/Reeve/Cass/Hermes actually produce weekly content. | Studio — working material |

**What's already resolved (don't re-litigate):** [[Hermes/SOURCES]]'s voice-authority ruling already says JUDGMENT (Hermes/) beats Studio/Analysis on any conflict. That's settled.

**What's genuinely still open:** whether `Studio/Analysis/` itself should shrink. Its own SOURCES.md tier-2 listing already flags [[Archive/Studio-Analysis-voice-retired-2026-07-10/voice-profile]], [[Archive/Studio-Analysis-voice-retired-2026-07-10/voice-archive]], and [[Archive/Studio-Analysis-voice-retired-2026-07-10/writing-style]] as "AI-mined/Wren-era, unreviewed by Alyssa" — if Hermes's JUDGMENT layer has fully superseded them in practice, they may be pure redundancy sitting in the vault rather than active-use analysis, which is exactly the kind of drift GL-013 exists to catch. This needs Alyssa's read: does she still want Studio/Analysis's voice files maintained/updated, or are they legacy scaffolding Hermes has outgrown and Studio/Analysis should be pruned down to what's still load-bearing (subject-line.md's real-broadcast stats, the carousel forensics, the frameworks — things that aren't voice-authority claims)? A clean way to start: walk [[Studio/Analysis/COMPASS]]'s routing table with her file by file and ask "does Hermes actually use this, or does Hermes only use its own craft/ files now?"

**Recommended shape for the session:** together with Alyssa, not solo — this is a taste/architecture call, not a mechanical one.

## Open loop 2 — Products/offers in multiple places

Right now a single offer's facts are genuinely split three ways:

1. `Library/Offers/<offer>/MAP.md` — positioning, copy, funnel context. Frontmatter has a `price_point` field too.
2. [[Hermes/BUSINESS]] — declared canonical for price/status/link/chat word, but it's explicitly a **dated snapshot**, not a live source.
3. **Notion Products DB** (collection `2f4c8b43-e565-8149-a25f-000b38310c24`) — the actual live truth per [[Hermes/SOURCES]]'s "Live externals" section.

This mostly works today because everything correctly *defers* to BUSINESS.md rather than duplicating — Larry verified this during the retrieval gauntlet (Q1, Q9) and it held up clean. But it's fragile: [[Library/Offers/back-of-house/MAP]] still carries `price_point: 3000` in its own frontmatter *in addition to* deferring in prose — that's a live duplicate-fact risk (GL-013 Rule 3) sitting in every one of the 26 offer files' frontmatter, not just prose. Worth deciding with Alyssa:

- Should offer-file frontmatter drop `price_point`/`status`/`sales_page_url` entirely and defer 100% to BUSINESS.md (cleanest, but frontmatter loses queryability)?
- Or should BUSINESS.md stop being a manual snapshot and instead genuinely sync from Notion (a Mack automation task, not a content decision)?
- Chat-word conflicts already flagged and unresolved in [[Hermes/MAP]] §7 ("Known broken / waiting on Alyssa"): PIN vs Pinterest (W2), price conflicts on Quarter in a Day ($2,000 vs $111) and CEO Year ($79 vs $27-47). These are real, dated, waiting-on-her items independent of this session's restructure — worth bundling into the same conversation.

**Recommended shape for the session:** together with Alyssa for the "which system wins" architecture call; the actual Notion-sync automation (if she wants it) is then a solo Mack task.

## Open loop 3 — Journal cleanup

544 journal entries, no thematic index beyond the Signals system (which only tracks recurring cross-entry *themes*, not general findability/dedup/broken-link hygiene). Per GL-013 Rule 1, this is Notebook territory — **no agent writes, edits, or reorganizes it without Alyssa explicitly asking, in the room, entry by entry or batch by batch.** This is the same category as the already-flagged "inbox-zero co-processing session" — it's not a new open loop, it's the same one, just named more specifically now. Don't start this solo. When she's ready: ask her what "cleanup" means to her first (broken image embeds? duplicate entries? just better findability?) before touching anything — per [[feedback_dont_guess_ask]].

## Open loop 4 — The routines (scheduled tasks / automations)

Full current landscape, Claude scheduled tasks (`mcp__scheduled-tasks__list_scheduled_tasks`):

| Task | Status this session | Notes |
|---|---|---|
| `hermes-deep-voice-study` + `-645` | **Fixed this session** | Two bugs, both fixed: (1) dead `PKM/Second Brain/` paths post-restructure, repointed to `Library/Examples/`, `Library/Programs/`; (2) the cron was scoped to `5-7 7 *` (day 5-7, July only) — a one-week pilot window that was never lifted to a recurring schedule, so both tasks were stuck not firing again until July 2027. Fixed to run daily (`0 4,5 * * *` and `45 6 * * *`); confirmed `nextRunAt` is now 2026-07-11. |
| `monthly-trend-scout-scrape` | **Fixed this session** | Was pointing at a completely different, retired folder (`mypka-scaffold-latest (2)`) — not this vault at all. Repointed to `the-house` + [[Studio/Content/trusted-sources]] + `Studio/Content/swipe/`. |
| `instagram-saves-health-check`, `instagram-saves-ideation` | Untouched, already correct | Reference `C:\Users\accol\instagram-saves-engine\` (outside the vault) and Notion DBs directly — no vault-path dependency to break. |
| `house-keeping-weekly`, `house-keeping-monthly-deep` | Fixed in the Bring It Home session | Repointed to `Studio/Team Knowledge/SOPs/SOP-039...` and `HOUSE-MAP`. |

Windows Task Scheduler (`Get-ScheduledTask`):

| Task | State | Notes |
|---|---|---|
| `TelegramCaptureBot` | Running, correct | Fixed during Bring It Home — points at `Studio/Team Knowledge/scripts/`. |
| `Meetily Weekly Launcher` | Ready, correct | Fixed during Bring It Home — points at `Studio/Team Knowledge/Automations/`. |
| `myPKA - Telegram Capture Bot` | **Disabled, stale — deletion blocked on Administrator rights** | Alyssa said kill it. Attempted via `Unregister-ScheduledTask` and `schtasks.exe /Delete` from this session's shell — both refused with Access Denied. The task was registered elevated (`RunLevel Highest`, S4U) by `telegram-service-install.ps1`, so removing it needs an elevated shell too. **Next session (or Alyssa directly): open PowerShell as Administrator and run** `Unregister-ScheduledTask -TaskName "myPKA - Telegram Capture Bot" -Confirm:$false`. Harmless sitting there in the meantime. |

**Recommended shape for the session:** the two fixes above are already done; the one remaining item (the stale Disabled Windows task) is a 30-second solo cleanup once Alyssa confirms she's fine with it being removed — genuinely doesn't need a sit-down, just a yes/no.

## Already-flagged, still open (from the Bring It Home close-out)

- **Deliverables drain** — large legacy pile, drains gradually via `house-keeping-monthly-deep`. Not a session-worthy task; the patrol handles it.
- **Hermes/ folder move** into a formal Studio/Voice desk name — still optional/parked. No urgency.
- **Inbox-zero co-processing session** — same category as Open loop 3 above; together with Alyssa.
- **Notebook/Todos design session** — structure not yet decided; together with Alyssa.

## Recommended order, next session

1. Quick confirms with Alyssa (5 min): "delete the stale Windows task?" (probably yes).
2. Products/offers architecture call (Open loop 2) — bundle in the known chat-word/price conflicts from [[Hermes/MAP]] §7 so it's one conversation, not three.
3. Hermes/Content-desk/Analysis overlap audit (Open loop 1) — walk [[Studio/Analysis/COMPASS]] together, decide what's load-bearing vs. legacy.
4. Journal cleanup + inbox-zero (Open loop 3, same as the already-flagged item) — together, entry by entry or batch by batch, on her terms.
5. Notebook/Todos design — whenever she wants to think through it.

None of these block each other. Take them in whatever order she's in the mood for.

## Guardrails (same as the last handoff, still true)

- Never edit her words. Never promote into Library yourself — flag promotion candidates, she decides (as with [[Library/me]] this session).
- Notebook is read-only except her explicit ask, batch by batch.
- Every move: git mv, sweep live refs, verify by grep + running the actual scripts, THEN commit + tag. If verification fails, roll back — never leave the vault half-moved.
- If a concurrent session might be active (check `git log -1` for a commit you didn't make), stop and ask before touching shared files — this happened once already this project and cost nothing to pause for.
- Before moving/renaming a file, consider whether Alyssa might have it open in Obsidian — ask if unsure, per this session's near-miss.

## Cross-links

- [[2026-07-10-bring-it-home-handoff]] — the restructure this session's work built on.
- [[2026-07-10-13-35_larry_bring-it-home-team-and-library-phase]] — full session log, mechanics, insights.
- [[2026-07-10-validation-results]] — retrieval gauntlet + stranger test scores.
- [[HOUSE-MAP]], [[GL-013-the-house-rules]] — the constitution.
- [[Hermes/SOURCES]], [[Hermes/MAP]] — voice-authority ruling and the known chat-word/price conflicts feeding Open loop 2.
- [[Studio/Analysis/COMPASS]] — the file to walk together for Open loop 1.
