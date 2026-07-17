---
agent: larry
date: 2026-07-17
slug: github-backup-and-push-on-close-habit
mined: true
---

# Session log — GitHub backup + push-on-close standing habit

## Context
Alyssa asked whether the-house is backed up to her personal GitHub, and told me to make it so.

## What we did
- **Larry** confirmed origin already points to `github.com/alyss0909/the-house` (her personal account, authenticated HTTPS) — the wiring existed but was stale.
- **Larry** found 6 local commits unpushed plus 258 uncommitted working-tree changes (207 modified/deleted + 41 untracked). None of it was on GitHub.
- **Larry** pushed the 6 commits, then staged/committed the full working tree ("Backup checkpoint" commit) and pushed. Repo now in sync, working tree clean except archived third-party intake submodules under `Archive/`.
- **Larry** wired push-on-close as a standing habit: added SOP-040 step 9 ("Back up") and item (6) to the AGENTS.md close block.

## Decisions made
- Push-on-close is now mandatory at every wrap. expires: [[SOP-040-the-compounding-loop]]
- Dirty submodules under `Archive/` (other people's clones) are excluded from backups on purpose. [[project_github_backup]]

## Insights
- The vault had drifted 6 commits + 258 changes behind its own backup remote; a backup remote that isn't pushed to is not a backup. Fate: [[project_github_backup]]

## Realignments
- Alyssa: "sure" — approved making push-on-close the standing habit.

## Open threads
- [ ] None from this session.

## Next steps
- Every future close runs SOP-040 step 9. No new work owed.

## Cross-links
- [[project_github_backup]], [[reference_github_accounts]]
- Prior: [[2026-07-17-21-15_larry_carousel-dispatch-and-compiled-cards]]
