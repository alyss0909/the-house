---
week: 2026-W28
date_range: 2026-07-06 to 2026-07-12
session_count: 50
open_threads: 16
---

# Week 28 Wrap-Up (Mon Jul 6 - Sun Jul 12, 2026)

*Written 2026-07-16 as a repair pass — this wrap did not fire in the normal weekly-review chain and is being written retroactively from session logs, per the 2026-07-11 memory autopsy. House-keeping detail for this week already lives in [[Studio/Team Knowledge/Weekly Reviews/2026/2026-W28-house-check]] — not repeated here.*

## Week at a glance

This was the busiest build week in the vault's history: about 50 session logs across seven days. Three things happened at once. The Content OS Command Center dashboard went from mockup to a live, working Obsidian dashboard with real save/reject/approve state (Felix and Iris ran a long joint QA-and-fix loop on July 7 alone). Suki was hired as Head of Content and got a full activation playbook approved the same week, with Larry formally stepping back into a librarian/router role instead of running content strategy himself. And starting July 9, the vault began the "Bring It Home" restructure — the move to the current Notebook/Studio/Library/Archive shape — which landed hard on July 10-11 along with the compounding-loop infrastructure (GL-014, SOP-040) that this very repair task is closing out.

## What shipped

- **WS-011 Content Command Center** — built live in Obsidian and shipped phase 1 (real DataviewJS save/reject persistence, no Shell Commands needed yet) — [[Studio/Team Knowledge/session-logs/2026/07/2026-07-07-16-00_larry_ws011-command-center-shipped]]
- **Concepts/Arc/Hook/Draft dashboard parity pass** — day-long joint Felix/Iris/Val effort: card tweaks locked, calendar-chip hierarchy graduated into GL-003, save/reject persistence fixed, arc/hook button correction, slide-text truncation fix, live-screenshot fixes, cover-duplicate/spacing fix, pitch-sheet parser hardening (July 7-8)
- **Content OS 6-post sprint** — pitched, gated, written, and pressure-tested to 6/6 survival against Mean Alyssa on July 6
- **Suki hired as Head of Content** — DIRECTS the makers (Angus/Reeve/Cassius/Hermes), Alyssa DECIDES, Larry is librarian/router not orchestrator — [[Studio/Team Knowledge/session-logs/2026/07/2026-07-07-22-00_larry_content-os-head-of-content-hire]]
- **Suki activation playbook approved** — "Go FULL team, staged" (hook person first, idea person second); north star reframed to comments (ManyChat -> list/coupon -> sale), sends/shares as distribution levers, not the governing signal
- **Obsidian vault CSS redesign** — oat/linen Card Layout locked after a long debugging saga, hex-only color naming after Alyssa flagged "sage" as misleading
- **Draft tab (04) rewired** to render real decks with [shipped] persistence (Felix, July 9)
- **Pin Engine Blueprint + lead-magnet pipeline** stood up, one lead magnet rebuilt four times until it actually landed (July 9)
- **Vault restructure goal handed to Fable** — research-and-stress-test brief sent, no file movement yet at this point in the week
- **Bring It Home — Team + Library phase executed end to end** — the Notebook/Studio/Library/Archive shape went live, offer files trimmed to link out per GL-013 rule 3, COMPASS/INDEX/BUILD-PLAN/me.md moved to Studio/Analysis (July 10)
- **Ready Queue dissolved** (Version B, per Alyssa) — content activation folded into tasks + idea-bank
- **Whole-house HOME dashboard built** (Felix, July 10)
- **Telegram bot secrets relocated outside the vault**; Meetily iCal launcher hardened; Daily Meeting Clean automation built (Mack, July 10)
- **Home Actions Watcher built** — weekly-review-only, real OS cron, failure surfaces on HOME.md rather than a new notification channel (Mack, July 11)
- **Compounding loop installed** — GL-014-the-compounding-architecture, SOP-040-the-compounding-loop (July 11)
- **Team brain installed**, journal boundary locked (July 11)
- **KeepSidian sync interval + label import work started** (July 11-12, re-auth still pending from Alyssa)
- **Journal backfill + compounding status pass run** (July 12) — this is the session that first surfaced the missing-wrap gap this repair addresses

## Key decisions

| Question | Decision | Source |
|---|---|---|
| Do judge-discovered rule gaps go straight into ANTI-AI.md? | No — proposals go to the learning inbox and decisions queue (approve-before-execute) | [[2026-07-06-content-os-six-post-sprint-complete]] |
| Invented "voice-texture" anecdotes, disclosed as fiction — allowed? | No, never fabricated biography in her mouth, disclosed or not | [[2026-07-06-content-os-six-post-sprint-complete]] |
| Package third-party tools as native plugins or myPKA Expansions? | Always Expansions + SOP — one install works across every host | [[2026-07-07-15-00_larry_internal-skills-discoverability]] |
| Where do dashboard reacts get written? | The pitch sheet (`## Dashboard reacts`, append-only), never the taste ledger | [[2026-07-07-16-00_larry_ws011-command-center-shipped]] |
| Build headless action buttons now? | No — phase 1 is visual + real react-saving only; phase 2 waits until Alyssa uses it daily | [[2026-07-07-16-00_larry_ws011-command-center-shipped]] |
| Hire a Head of Content? | Yes — Suki, who directs makers and never does their work herself | [[2026-07-07-22-00_larry_content-os-head-of-content-hire]] |
| Is Larry the content orchestrator? | No — Larry is a librarian/router; content strategy belongs to Suki | [[2026-07-07-22-00_larry_content-os-head-of-content-hire]] |
| Where does the vault theming design system live? | Iris's own journal, not GL-003 (GL-003 stays scoped to outward-facing content) | [[2026-07-07-22-00_larry_obsidian-vault-css-redesign]] |
| Tag/folder colors: descriptive names or hex? | Hex-only — Alyssa found "sage" misleading for that shade | [[2026-07-07-22-00_larry_obsidian-vault-css-redesign]] |
| Full team hire, staged or all at once? | Staged — hook person first, idea person second | [[2026-07-08_larry_suki-activation-playbook-and-hiring-plan]] |
| What's the north star signal for content? | Comments convert; sends/shares distribute; saves support reference-heavy lanes | [[2026-07-08-12-59_larry_suki-social-grid-and-strategy-alignment]] |
| Should the vault restructure happen immediately? | No — Fable researches and stress-tests first, no file movement yet at that point | [[2026-07-09-19-41_larry_vault-restructure-fable-handoff]] |
| Where do the 21 offer files' embedded sales-page copy go? | Trim to a link into Library/Examples, per GL-013 rule 3 (one home per fact) | [[2026-07-10-13-35_larry_bring-it-home-team-and-library-phase]] |
| Should Meetily auto-start recording? | No — automation opens Meetily two minutes early, Alyssa still clicks Start | [[2026-07-10-11-24_larry_meetily-ical-launcher-hardening]] |
| Should Home Actions Watcher failures use a new notification channel? | No — reuse the existing HOME.md "Actions reacts" surface plus health.json | [[2026-07-11-12-00_mack_home-actions-watcher-build]] |

## Insights not yet graduated

- **DataviewJS blocks with multiple sequential async file loads should always parallelize via `Promise.all`, never sequential `await`** — locked as a standing rule in Felix's journal, judged out of scope for AGENTS.md/GL-003 — source: [[2026-07-07-23-00_larry_dashboard-live-qa-and-home-page-mockups]]
- **The Internal Skills / Expansions pipeline is now the single on-ramp for "would every agent/host know what to do with this"** — no more one-off Guideline-trigger patches, regardless of whether the underlying thing is a script, a doctrine, or a connector — source: [[2026-07-07-14-00_larry_install-ponytail-expansion-v1.0.0]]
- **A vault with two independent sources of truth (INDEX tables vs. filesystem) and no standing reconciliation step will drift** — this exact failure mode (placeholder scaffolding never un-written, renames that stop at the first hop, INDEX files edited reactively) is the root cause behind several misplacement bugs found this week — source: [[Archive/Deliverables-history/2026-07-05-root-cause/misplacement-evidence]]

## Open threads — by area

### Content OS / WS-011
- [ ] Home page redesign direction (Mission Control / Big Calendar / Cockpit / mash-up) — still Alyssa's call, carried across multiple sessions this week
- [ ] Phase 2 headless action buttons (Shell Commands wiring) — waits until the dashboard has been used daily
- [ ] Suki's step 1 — fresh-eyes audit of the whole Content OS, does not start until Alyssa says go
- [ ] Cassius (substance) — retrain, rebuild, or keep; re-test under the new playbook before calling the role solid
- [ ] Install the "Blotato job" skills (brand-brief, content-coach, post-writer, post-grader, post-scheduler, viral-hooks, repurpose) into loadable maker skills
- [ ] Arm Mean Alyssa per gate — Alyssa wants to do this with Suki directly
- [ ] Apify wire-fix (Mack) so the 3 indie swipe-file accounts actually scrape
- [ ] 05 Approved month-aggregation bug — confirmed root cause (only reads the newest pitch sheet), not yet fixed

### Vault Restructure
- [ ] Fable's research-backed architecture stress test — still in flight as of week's end
- [ ] `PKM/Documents/` fate — has an unexplained `annapuchin.css` file, flagged for Alyssa
- [ ] [[Library/me]] — review-then-promote candidate, not decided this week
- [ ] Deliverables drain — large legacy pile, drains gradually via weekly/monthly housekeeping, not a one-session job

### Automations
- [ ] Alyssa re-auths KeepSidian ("Retrieve token") to fix missing credentials
- [ ] Decide yes/no on patching main.js to import Keep labels as frontmatter tags
- [ ] Home Actions Watcher — Alyssa needs to paste her real Anthropic API key into config.json and run register-task.ps1 as Administrator once

### Hiring & Team
- [ ] Full content-team hiring plan needs a plain-English rewrite (per-rung inputs, kill criteria, survivor count, approval point) before Alyssa is asked to approve individual hires

## Next week setup

- Pick up first: the immediate repairs the July 11 compounding-loop session flagged and left undispatched — this W28 wrap (now done), Hermes deep-read cron re-scope, signals-index regeneration, and the KeepSidian re-sync.
- Home page direction is the long-standing #1 content-dashboard pickup — three live Cockpit iterations didn't land; consider building Mission Control or Big Calendar as a real comparable mockup instead of iterating Cockpit again, or ask Alyssa directly what isn't working.
- Context to load: [[Studio/Team Knowledge/Guidelines/GL-014-the-compounding-architecture]] and [[Studio/Team Knowledge/SOPs/SOP-040-the-compounding-loop]] before any close-session work — this is the new standing protocol as of this week.
