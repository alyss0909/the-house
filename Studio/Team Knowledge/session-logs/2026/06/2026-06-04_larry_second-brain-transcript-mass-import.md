---
agent_id: larry
session_id: 2026-06-04-second-brain-transcript-mass-import
timestamp: 2026-06-04T00:00:00Z
type: close-session
linked_sops: []
linked_workstreams: [WS-002-import-external-knowledge-base]
linked_guidelines: []
---

# Second Brain — Transcript Mass Import, Webinar Analysis, and INDEX Audit

## Context

Alyssa returned to the Second Brain project after a full status review. The vault was substantially built but transcripts were largely unfiled. The session focused on: completing a full BOH transcript import, building the webinar analysis document, auditing the BOH INDEX against the filesystem, and cleaning up structural issues. By end of session, 21 of 24 BOH video transcripts are filed and the Second Brain is near-complete for program content.

---

## What we did

- **Larry** — ran full Second Brain status review: assessed all phases, voice layer, analysis docs, templates, frameworks, open gaps. Answered questions on phase welcome video strategy, transcript deletion, and Double Yes overlap.
- **Pax** (subagent) — built `PKM/Second Brain/analysis/workshop-webinar-analysis.md` from scratch: individual analysis of Out of Office Webinar + Slowly Viral Class, cross-webinar synthesis, and Wren routing guide.
- **Silas** (subagent) — ran full BOH INDEX audit against filesystem. Returned structured gap report: 7 of 24 transcripts existed, 18/19 workbooks existed, all 8 slide sets existed, 4 Notion dashboards with 0 local mirrors, `bots.md` more complete than INDEX Bot Roster (2 bots missing from INDEX).
- **Larry** — BOH INDEX fixes: added Notion shortlinks as clickable URLs for all 4 dashboards, added Brand Bellhop + Postmaster to Bot Roster, added 1.2 Sales Pages slides entry, marked 4.2 Simple Socials as skipped.
- **Larry** — filed 21 transcripts across all BOH phases (see list below). Created `transcripts/` subfolders where missing (Phase 0, Phase 1). Updated INDEX with ✅ wikilinks after each batch.
- **Larry** — filed `Slow Marketing Plan Class.md` in `programs/back-of-house/webinars/`.
- **Pax** (subagent) — updated `workshop-webinar-analysis.md` to add Section 3 (Slow Marketing Plan Class individual analysis), expanded Cross-Webinar Synthesis to cover all three, updated "For Wren" routing section with pitch-class distinctions.
- **Larry** — updated `BUILD-PLAN.md` and `tsk-2026-06-01-002-second-brain` to reflect session progress.
- **Larry** — Librarian: flagged orphan `[Framework] Carousel Playbook.md` at Second Brain root (deletion blocked by auto-mode — see Open Threads).

### Transcripts filed this session

| File | Module |
|---|---|
| `0.0 Welcome to BOH Transcript.md` | 0.0 |
| `0.1 The Prep Work Transcript.md` | 0.1 |
| `0.2 Sign Off Specials Transcript.md` | 0.2 |
| `0.3 Cozy Biz Plan Transcript.md` | 0.3 |
| `1.1 Welcome to Phase One Transcript.md` | 1.1 intro |
| `1.1 Email First Business Model Transcript.md` | 1.1 Email First Offer Suite (15m) |
| `1.2 Your Signature Dish Transcript.md` | 1.2 |
| `1.4 The Double Yes Freebie Transcript.md` | 1.4 (Double Yes Method 40m) |
| `2.0 Welcome to Phase Two Transcript.md` | 2.0 |
| `2.1 Warm Plates - Sequence Writing Transcript.md` | 2.1 (supplementary) |
| `3.0 Welcome to Phase Three Transcript.md` | 3.0 |
| `3.1 Bread and Butter Transcript.md` | 3.1 |
| `4.0 Welcome to Phase Four Transcript.md` | 4.0 |
| `Congrats Transcript.md` | Wrap Up |

Previously existing (not touched): 2.1 Warm Welcome Sequence, 2.2 Not Grandad's Email, 2.3 The Simmer, 3.2 The Keywords, 3.3 The Batch, 3.3 The Rotation, 4.1 The Lazy Launch.

---

## Decisions made

- **Skipped transcripts (permanent):** 1.3 The Main Attraction, 1.6 The Finishing Touches, 1.4 How to Use the Frameworks, Notion Sig Method Tutorial. These are not worth the import effort given they cover workbook delivery rather than teachable content.
- **4.2 Simple Socials scrapped entirely:** No workbook exists, video not available. Removed from transcript wishlist.
- **Phase welcome videos:** Filed individually (not merged into a combined doc). Too short to justify a combined view; individual files give better INDEX linking.
- **Double Yes naming:** `1.4 The Double Yes Freebie Transcript` is the correct filing for the 40m "Double Yes Method" video. The filename Alyssa provided ("1.5") was a naming artifact — content confirms 1.4.
- **Transcripts in Downloads:** Safe to delete once confirmed filed in Second Brain.

---

## Insights

- **The BOH INDEX audit pattern works well as a pre-import check.** Before any batch transcript import, run a glob against the transcript subfolder and cross-reference the INDEX quick-scan. Doing this first would have surfaced the exact gap list without manual enumeration.
- **Pitch-class webinars (selling the program) and teaching webinars (being the program) require distinct analysis dimensions.** The Slow Marketing Plan Class broke the existing two-section synthesis — catching this distinction upfront would have set a better structure from the start. In future multi-webinar corpora: classify each recording's purpose before writing the analysis.
- **Alyssa sends transcripts with her own naming conventions** (e.g. "1.5 The Double Yes Freebie" for what's actually module 1.4). Don't trust the filename number — read the content and match to INDEX module descriptions.

---

## Realignments

- Alyssa initially said "welcome to phase 3, I don't think we need that" — then confirmed it was fine to file. Filed.
- Phase 4 beyond 4.1 was explicitly skipped ("don't worry about phase 4 transcripts"). 4.0 welcome was later sent and filed, but 4.2 Simple Socials was confirmed scrapped.
- Alyssa thought she'd already sent Phase 2 and 4 welcome transcripts — they weren't in Downloads. Confirmed gap, not a filing issue.

---

## Open threads

- [ ] **Delete orphan** `PKM/Second Brain/[Framework] Carousel Playbook.md` — auto-mode classifier blocked deletion. Alyssa to delete manually, or confirm in next session and Larry will delete.
- [ ] **1.1 Signature Method transcript** (20m Notion method video) — still needed. High value for Wren when writing BOH teaching copy.
- [ ] **1.5 The Perfect Apps transcript** (45m tripwire module) — still needed. High priority — covers tripwire framework in depth.
- [ ] **Carousel copy extraction** — carousel example folders contain images but no .md copy text. Wren can't read the actual copy. Decide: extract slide copy to .md, or accept that the analysis + framework is enough?
- [ ] **Voice profile review** — `voice-profile.md` and `voice-archive.md` are AI drafts. Alyssa's own 100-question interview pass is still pending.
- [ ] **Simmer emails (5) + Soft Sunday emails (5)** — still the highest-value unlock. Once filed: enables Simmer analysis, Simmer template, Soft Sunday template.
- [ ] **Notion vaults** — Mack to set up Notion API. 9 frameworks pending: hook vault, RTO vault, PS vault, segmentation vault, sequence prompts, YOE email concepts, editorial calendar, Pinterest blog concepts, promo planner reframe.
- [ ] **Phase 1 audit** — Alyssa flagged confusion around what's in Phase 1 (Signature Method vs. Signature Dish vs. Email First Model). Reserved for next session with fresh context.

---

## Next steps

1. Delete orphan Carousel Playbook (1 min — Alyssa or Larry with permission)
2. Phase 1 audit: map exactly what's in each 1.1–1.2 transcript, resolve any genuine overlaps
3. Drop 1.1 Signature Method + 1.5 The Perfect Apps transcripts when available
4. Drop 5 Simmer emails → Larry formats → analysis + template built in one session

---

## Cross-links

- [[2026-06-03-17-00_larry_second-brain-depth-analysis-and-wren-hire]] — Wren hired; voice profile methodology; Second Brain voice layer built
- [[2026-06-04_larry_second-brain-carousel-analysis-and-vault-cleanup]] — carousel system + 9 carousel examples added
- [[2026-06-03_larry_second-brain-web-copy-and-analysis]] — about/home/sales page analysis + BOH sales page filed
- [[2026-06-02_larry_second-brain-boh-content-import]] — first BOH workbooks and slides import
