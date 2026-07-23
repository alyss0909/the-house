---
agent_id: larry
session_id: mailroom-bulk-cleanup-and-archive-label
timestamp: 2026-07-23T15:20:00Z
type: close-session
linked_sops: [SOP-004-create-task]
linked_workstreams: []
linked_guidelines: []
---

# Mailroom bulk historical cleanup, the 🌙 Archive label, and the tasks-board link repair

## Context

Began as the unattended Mailroom daily cycle (2026-07-21) and turned into a live session with Alyssa across two days. She asked for the one-time bulk historical inbox cleanup, a repair of the Agent Tasks board's stale vault links, the filter file surfaced as a task, and — her key clarification — that swept mail be filed under a searchable "Archive" label, not just removed from the inbox.

## What we did

- Larry ran the full Mailroom daily cycle: nothing queued, 28 noise rows surfaced, 9 known-noise auto-filed and verified, spam clean on all four accounts, Agent Tasks reconciled (vault/Notion in sync).
- Larry repaired the Agent Tasks board: 20 closed rows whose "Open in vault" link still pointed at `tasks/open/` were repointed to their real `done/` or `cancelled/` paths.
- Larry ran the bulk historical cleanup with a per-sender human screen: **1,291** archived from personal promotions (back to Aug 2025), **401** from support promotions (back to Sept 2023). Held back the mail the screen caught: Ryan's Google Photos of Norah, a school survey, a kids' sports update, and any `Re:` subject (personal); the Instagram security login alert and the AppSumo purchase/refund thread (support).
- Larry created the **🌙 Archive** Gmail label on personal (support already had hers) and applied it to the full 1,692-message bulk, so the swept mail is filed and searchable rather than floating in All Mail. Verified both labels populated.
- Larry surfaced the Gmail filter file as a board task ([[tsk-2026-07-23-003-review-gmail-filters]]) with the decision framed: build filters vs. lean on the archive habit.

## Decisions made

- **Question:** Should swept mail just leave the inbox, or be filed somewhere searchable?
  **Decision:** Archive now means remove INBOX **and** apply the "🌙 Archive" label, matching the pattern Alyssa set up herself in the support inbox. This supersedes the old "no archive-label taxonomy" rule. Recorded in the Mailroom README doctrine.
- **Question:** Blind archive-all, or screen every batch?
  **Decision:** Keep the per-sender/subject screen even on bulk — it is what catches the rare real message Gmail misfiles into Promotions (Ryan's photos, the security alert). The filter task carries the go-forward flow decision.

## Insights

- On the support inbox, real customer mail lands in Primary, not Promotions — so a Promotions backlog there is safe to bulk-archive after a light sender screen. The only things worth protecting were a security alert and one genuine transaction thread.
- The Composio Gmail batch-modify caps at 1,000 message IDs per call; large batches must be split.
- `resultSizeEstimate` maxes out at 201 ("200+"), so it can't be trusted as a true count — enumerate to know real depth.

## Realignments

- Alyssa, on what "cleanup" should mean: _"i meant more like add to a folder CALLED archive (like i did in the support inbox) that way i can search it later if i want but its out of the main inbox."_ — archived mail gets a searchable Archive label, not just inbox removal.

## Open threads

- [ ] [[tsk-2026-07-23-007-archive-label-wiring]] — wire the 🌙 Archive label into the mailroom sweep and remaining accounts (business + wellness); currently only removes INBOX. Doctrine already in [[run-log]] and the README.
- [ ] [[tsk-2026-07-23-008-remaining-inbox-backlog]] — sweep the remaining backlog in later passes: personal social, business promotions, wellness promotions and social, each still 200+.
- [ ] [[tsk-2026-07-23-003-review-gmail-filters]] — Alyssa to decide filters vs. archive habit.
- [ ] [[tsk-2026-07-23-009-profit-menu-page-polish]] — the nine Notion view layouts, plus the classics-vs-extras aside (final Hermes option, still Alyssa's pick pending) not yet pasted into the live page, plus Hermes's glossary edit/delete list.

## Next steps

- Wire the Archive label into the daily sweep and create it on the two remaining accounts.
- Continue the bulk passes on the remaining promotions/social backlogs when Alyssa wants.

## Cross-links

- [[2026-07-21-agent-task-clearing-wave]] — the prior tasks-board reconciliation pass.
- [[2026-07-23-13-30_larry_profit-menu-views-copy-and-close]] — source of the two leaked threads captured into [[tsk-2026-07-23-009-profit-menu-page-polish]].
