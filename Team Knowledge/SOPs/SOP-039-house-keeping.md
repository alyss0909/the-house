# SOP-039 — House-Keeping (the standing maintenance protocol)

- **Status:** Active
- **Owner:** Larry (any model tier — this SOP is deliberately mechanical)
- **Cadence:** the LIGHT pass runs inside every [[WS-006-weekly-review]] Phase 5; the DEEP pass runs inside every [[WS-007-monthly-review]]
- **Authored:** 2026-07-10 by the Fable-tier model, designed for routine execution by smaller models. Every check below is a grep-and-fix, not a judgment call. Where judgment IS required, the check says "flag for Alyssa" — never decide.
- **Governing law:** [[GL-013-the-house-rules]]. This SOP is its immune system.

## Why this exists

The house is organized by trust (Notebook = hers, Studio = opinion, Library = earned). That geography decays the same way the old vault decayed — one stray file, one retyped fact, one dead link at a time — unless something patrols it on a schedule. This SOP is the patrol. It exists so the vault NEVER needs another big restructure: entropy gets caught weekly while it's still one file, not one hundred.

## The LIGHT pass (weekly, ~10 minutes, runs in WS-006 Phase 5)

Run each check. Fix mechanical hits immediately (fix-don't-flag). Log one line per check in the weekly wrap's `## House check` section: ✅ clean, or what was found and fixed.

**1. Notebook write-lock.** `git log --since="7 days ago" --name-only -- Notebook/` — every change must trace to Penn capture (WS-001) or an Alyssa-requested connective edit noted in a session log. Anything else: revert it, flag the session that did it.

**2. Library stamp check.** Any file created/modified in `Library/` this week must be Alyssa-verbatim or carry `promoted_by: alyssa` frontmatter. Unstamped derived file → move it back to the Studio, flag in the wrap.

**3. One-home-per-fact lint.** Grep 2–3 known fact strings (a current price, the active chat word — read them from their canonical home first) across live files. A hit outside the home (excluding dated Deliverables/session-logs) → strip to a wikilink.

**4. Ghost citation check.** From this week's new/modified live files, extract full-path `[[...]]` wikilinks and path references; verify each target exists on disk. Dead reference → fix the path (the target usually moved) or remove the claim.

**5. Orphan check.** Files created this week with zero wikilinks in or out: add the genuine connections, or ask whether the file should exist (GL-013 Rule 5). Silos get archived.

**6. Studio desk hygiene.** No loose files at `Studio/` root — everything inside a desk. New work sits in a dated project folder at its desk, never a new top-level folder (the birthplace rule).

**7. Task truth.** Skim `Team Knowledge/tasks/open/` — any task whose work is visibly done (deliverable exists, feature live) gets its status updated. Stale statuses are how trust died last time.

**8. Capture pulse.** Confirm the automations left fresh footprints this week: newest file timestamp in the Telegram write target, and the scheduled tasks still enabled (`Get-ScheduledTask` on the known names). A silently-dead automation loses days of capture.

## The DEEP pass (monthly, ~30 minutes, runs in WS-007)

Everything in the light pass, plus:

**9. Transition-table truth.** Read [[VAULT-MAP]]'s transition table. Verify every row against disk. Any completed move not marked MOVED (or vice versa) → correct the table. The map must never lie; a lying map is worse than no map.

**10. MOVED-stub retirement.** For each `MOVED.md` redirect stub older than two clean weekly reviews with zero old-path hits in new session logs: delete the stub and its empty parent folder. Stubs are scaffolding, not furniture.

**11. INDEX/MAP freshness.** For each zone MAP and surviving INDEX: spot-check 5 links resolve and the folder listing matches reality. Hand-maintained truth claims rot — this is the check that catches it (the old Journal INDEX lied for months).

**12. Retired-agent sweep.** Grep live routing surfaces (agent-index, AGENTS.md, .claude/agents/) for agents marked RETIRED still receiving routes or holding live loads. Retirement means the station is dismantled, not haunted.

**13. Deliverables drain.** Pick the 5 oldest files in `Deliverables/` and give each a GL-009 fate (promote / archive / delete / pointer-ize). The pile only shrinks if someone shovels weekly-scale amounts monthly.

**14. Secret scan.** `git log --all --name-only --since="1 month ago" | grep -iE "\.env|token|secret|credential"` must return nothing vault-tracked; confirm known secrets still live outside the vault (`C:\Users\accol\.config\`).

## Escape hatches (per the durable-vs-method rule)

- The grep patterns and file counts above are **dated defaults (2026-07-10)**, not laws — re-tune them when the vault's shape changes, and note the change here with a date.
- If a check is repeatedly ✅ for 8+ weeks, it may move from weekly to monthly (note the demotion here).
- If any check needs a judgment call this SOP doesn't cover: **flag for Alyssa in the wrap, never improvise policy.** New policy comes from Alyssa through GL-013 amendments, not from a maintenance run.

## What this SOP may never do

Move zone folders, rewrite GL-013, promote anything into the Library, edit Notebook content beyond Alyssa-requested link fixes, or delete anything that isn't a verified-stale redirect stub. Maintenance keeps the house clean; it does not renovate.
