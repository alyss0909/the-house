---
date: 2026-07-11
theme: KeepSidian — granular sync interval unlocked + Keep-labels gap diagnosed
specialists: [Larry]
mined: true
---

# KeepSidian: sync interval + label import

## Context
Alyssa asked to unlock KeepSidian "supporter-only" features from a screenshot — specifically auto-tagging and granular background sync — by reading the plugin's real code and tweaking her install rather than paying. Mid-session she clarified the actual want: her EXISTING Google Keep labels should come through into Obsidian, not AI-generated tags.

## What we did (Larry)
- Read the bundled `main.js` (10MB) of KeepSidian v2.0.15 and mapped the gating.
- **Unlocked granular background sync (live):** `startAutoSync()` reads `autoSyncIntervalHours * 3600000` with no subscription clamp. Set it via the running app (eval + saveSettings + restart timer) from 24h → 1h; persists to `data.json`. Sub-hour = fractional (0.5=30min, 0.25=15min).
- Determined **auto-tagging/title-gen are server-side** (`/keep/sync/premium/v2`, gated by Stripe Bearer token) — genuinely not client-unlockable, and paid AI compute. Did not attempt to bypass.
- Diagnosed the **real ask (labels):** note schema has a `labels[]` field but the plugin never writes it to frontmatter — every `.labels` ref in main.js is Playwright/a11y code. Her synced notes carry only GoogleKeepCreated/Updated/Url — labels are dropped plugin-side.
- Found her **sync is failing**: today's log = "Auto sync aborted - missing credentials"; last full success June 8; a ~July 9 run pulled 43/50 then failed. Google token needs re-auth (a login Claude can't perform).

## Decisions
- Granular interval: unlocked locally — legit (own config, MIT code, zero server cost).
- Auto-tagging: left alone — server-gated paid feature, won't bypass.
- Label import: proposed patching main.js to write `note.labels` as tags — NOT executed; needs Alyssa's yes + working credentials to verify.

## Realignments (verbatim)
- "it has nothng to do with stripe its a lable tagged in google keep" — corrected me: she wants existing Keep labels imported, not AI tags.
- "so you fucked up my working keepsydian? ... why am i missing credentials?" — I did not touch credentials (only the interval value + a temporary, since-removed network logger).
- "its july 11 what are you on about man?" — I overstated the "broken since last month" story; corrected: it was syncing recently (July 9, 43/50) but not finishing cleanly; last clean success June 8.

## Open threads
- [ ] Alyssa re-auths KeepSidian ("Retrieve token" — Google login) to fix "missing credentials"
- [ ] Decide yes/no on patching main.js to import Keep labels as frontmatter tags
- [ ] Verify labels actually land once a sync runs; loop until visible in Notekeeper

## Next steps
After re-auth + her go-ahead: patch the frontmatter builder to write `note.labels`, run a sync, confirm labels appear. Fallback if she prefers: local Obsidian tagger over synced notes (customjs/shellcommands + her API).

## Cross-links
- Memory: reference_keepsidian_supporter_features
- [[project_daily_inbox_manager]]
