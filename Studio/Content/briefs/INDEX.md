---
title: Offer briefs index
type: index
status: active
rule: One brief per offer; a writer loads ONLY its post's brief, never this folder. Since 2026-07-17 briefs are OFFER INTELLIGENCE briefs (model: [[Studio/Content/briefs/the-5-minute-newsletter]]): what this IS, what it sells, buying beliefs, approved argument lanes (one lane per deck, each with point, villain, promise, best frameworks, do-not-mix, and its verbatim lines), then the verbatim copy bank sorted by job, boundaries, and open questions. Quotes are her exact words, never a summary. A writer may PROPOSE a new lane proven with her source lines (dispatch Step 1). Chat words come from the Products DB at ship time, never from her.
---

# Offer briefs

> **Sent-email wiring (tsk-2026-07-17-002, done 2026-07-20 by Mack).** Her sent emails are her purest voice, so each email-lane brief now carries a "## Her sent-email lines" section: verbatim body lines pulled live from Kit with the real open rate attached as proof. Done for the five email-lane offers — 5MN, Bingeable, List Resuscitator, Email List Revival (A Year of Emails is on the BACKBURNER **and** has zero Related Emails, so it was left untouched). 8 unique sends pulled. Path used: Products DB **Related Emails** relation → **Sent Emails** DB (subject, date, Kit/ckarchive URL) → match to Kit broadcast by subject → `get_broadcast` (verbatim body) + `get_stats_for_a_broadcast` (true open/click). Kit is the source of truth for rates; the Notion-stored open rates matched within ~0.1%.
>
> **Refresh verdict: this is a MECHANICAL REFRESH, not a one-time job.** Re-run the path above whenever she sends a new email and relates it to an offer in the Products DB; it re-pulls the fresh body + real open rate with no judgement calls. Three caveats: (1) it is gated on the Notion **Related Emails** relation being kept current — that link is still added by hand in Notion, so the refresh is only as fresh as that relation; (2) matching is by exact subject line between the Sent Emails DB and Kit — a subject edit breaks the match (the stored Kit URL's publication_id is the more stable key if that ever bites); (3) Kit open/click settle ~48h after a send, so re-pull after that. One correction surfaced: the Resuscitator proof line "telling you what to do [list inside]" is actually a **5MN** send (now filed under 5MN).

Built as verbatim banks from her real sales pages:
- [[Studio/Content/briefs/the-5-minute-newsletter]] — paid, $11, chat word blank
- [[Studio/Content/briefs/bingeable-newsletters]] — freebie, chat word blank
- [[Studio/Content/briefs/list-resuscitator]] — paid, $11, chat word "Cold", Notion done-for-you
- [[Studio/Content/briefs/email-list-revival-plan]] — paid, chat word "List", the plan/strategy sibling of Resuscitator
- [[Studio/Content/briefs/a-year-of-emails]] — BACKBURNER (her call 2026-07-17): do not run, do not pitch, do not ask
- [[Studio/Content/briefs/for-the-girls-brief]] — the FTG source brief (points at her real FTG files; the live mood rides the option row, never a database in this file)
- [[Studio/Content/briefs/pin-planner]] — freebie, free, chat word pull from Products DB
- [[Studio/Content/briefs/back-of-house]] — flagship program, $3,000, chat word pull from Products DB (sales page + July '26 launch emails)
- [[Studio/Content/briefs/soft-sundays]] — freebie, free, chat word "Sunday"; short sales page, real issue bodies are the deeper well
- [[Studio/Content/briefs/the-promo-planner-in-notion]] — low ticket, $59, chat word pull from Products DB; also the 50% bump on 90d Clock In
- [[Studio/Content/briefs/soft-ceo]] — ONE brief for both variants: Sessions (freebie, chat word "Softceo") + Monthly Notion Template ($37, chat word "Ceo")
- [[Studio/Content/briefs/90d-clock-in]] — low ticket, $19, chat word pull from Products DB

## Notion mirror (read + edit surface)

These briefs are mirrored into a Notion database — **[Offer Briefs](https://app.notion.com/p/0f1d3f1292f5417a9b5815f248101a48)**, under the House Control Room page — so Alyssa can read and edit them in one place, each related to its Products DB offer. Notion is the review surface; these markdown files stay canonical for meaning. Reconcile edits both ways with `/sync-briefs`. Full mapping + protocol: [[Studio/Content/briefs/notion-sync]].

Deeper voice source to fold in per offer: her related SENT EMAILS (linked by relation in the Products DB, real bodies at Kit/ckarchive). Pull bodies + true open rates via the Kit API — WIRED for the email-lane offers 2026-07-20 (task tsk-2026-07-17-002); see the refresh note at the top of this file. Not yet folded into the non-email offers (Pin Planner, Back of House, Soft Sundays, Promo Planner, Soft CEO, 90d Clock In) — same mechanical path applies when wanted.

Not built yet: none — all live offers now have a brief (built 2026-07-17; beliefs still flagged for her react on first /content-run use).

Never CTA to: Unignorable Subject Lines (bump), Slowly Viral (not live), Postmaster (bump on the 5MN checkout).
