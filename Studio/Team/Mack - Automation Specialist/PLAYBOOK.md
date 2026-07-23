---
title: PLAYBOOK - Mack
date: 2026-07-13
owner: Mack
status: living - updated at every close-session where Alyssa reacted to this desk's work
---

# PLAYBOOK - Mack

Load this BEFORE any Mack task. Contract: [[AGENTS]]. Shared context: [[Studio/Team/TEAM-BRAIN]].

## Alyssa patterns (what she asks for / what she rejects - verbatim, dated)
- 2026-07-13 - First Mack task under the compounding loop; no Alyssa-specific Mack reaction captured yet.

### Pre-apply (do without asking)
- Prefer the smallest reliable setup path for CLIs, auth flows, MCP servers, and automations.
- Verify the command exists after installation.
- Keep credentials out of repo files and session logs.

### Pre-reject (kill before she sees it)
- Do not bury setup status in theory.
- Do not log tokens, auth URLs with secrets, or credentials.
- Do not introduce runtimes inside the myPKA folder.

## Craft precedents (reuse before you rebuild - link every prior decision)
- 2026-06-05 - Register Windows Scheduled Tasks with the standard "Interactive" logon principal, not "Highest" run level: Highest requires admin elevation and can silently block registration on this machine. Mined 2026-07-16.
- 2026-07-13 - Mack owns external CLI/auth setup and leaves persistent knowledge in session logs when the work is non-trivial -> [[Studio/Team/Mack - Automation Specialist/AGENTS]].
- 2026-07-17 - A vault folder restructure that moves an automation's own script isn't done until every Scheduled Task action AND every script's own `$PSScriptRoot`-relative path climb is re-audited against the new location - neither shows up in a normal wikilink sweep. Root cause of the `Daily Meeting Clean` failure -> [[Studio/Team Knowledge/session-logs/2026/07/2026-07-17-11-45_mack_daily-meeting-clean-repair]].
- 2026-07-22 - Before asking Alyssa to do a manual credential fix (re-extract cookies, re-auth), rule out that the failure is in the request construction, not the credential. A burner IG session passed `validate_session()` with real account data while `collections/list` served an HTML login-wall; the fix was a missing browser header (`Sec-Fetch-Site: same-origin`), not stale cookies. She refreshed the cookie on the first (wrong) diagnosis and it changed nothing. Two failure modes can present identically - re-test after the "obvious" fix and isolate candidate headers/cookies one at a time against the live endpoint before concluding. Same family as the house rule *fix defects, don't bounce them to her* -> [[Studio/Team Knowledge/session-logs/2026/07/2026-07-22-11-30_mack_ig-saves-collections-list-header-fix-and-backfill]].

## Working with the team (what other desks need from you / you from them)
- Mack establishes connections and verifies tooling; Silas owns import shape and structured knowledge writes.
