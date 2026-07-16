---
agent_id: larry
session_id: email-examples-second-brain-complete
timestamp: 2026-06-05T00:00:00Z
type: close-session
linked_sops: []
linked_workstreams: [WS-002-import-external-knowledge-base]
linked_guidelines: [GL-004-tag-taxonomy]
mined: true
---

# Second Brain email examples fully populated — Soft Sundays, Simmers, Sales Emails

## Context

Alyssa dropped email examples into Team Inbox in batches throughout the session — Soft Sundays, simmer emails, sales emails, and webinar invite launch emails. The goal was to populate the `examples/` layer of the Second Brain so the email analysis pass (and eventually Simmer + Soft Sunday templates) can be built from real copy. This completed the examples layer that had been blocked since the Second Brain was first scaffolded.

---

## What we did

**Silas** (multiple runs, delegated by Larry) processed all email examples from Team Inbox into the Second Brain:

### Soft Sundays → `PKM/Second Brain/examples/soft-sundays/` (8 total)
1. [[Library/Examples/soft-sundays/i-fixed-your-email-list]] — full re-engagement plan: 3-day action plan, 7 email type prompts
2. [[Library/Examples/soft-sundays/your-list-called-theyre-hungry]] — fridge metaphor / list revival, story-led
3. [[Library/Examples/soft-sundays/i-failed-formula-for-growth]] — stats-fail origin story + 3 business growth formulas
4. [[Library/Examples/soft-sundays/ur-not-new-march-plan]] — Mama Bear energy, 3-step march plan, don't start over
5. [[Library/Examples/soft-sundays/if-lorelai-had-an-online-biz]] — Gilmore Girls themed, 4 Q4 buying windows, Nonna tomato sauce, Seasonal Promo Planner launch (code LUKE)
6. [[Library/Examples/soft-sundays/why-i-burned-down-my-business]] — January origin story, 3 reasons for restructuring (creativity / low maintenance / offline), BOH waitlist
7. [[Library/Examples/soft-sundays/me-i-need-ideas-i-already-had]] — re-commerce themed, 5 sustainability strategies ⚠️ **flagged by Alyssa as feeling too AI** — filed for repurposing reference only, not voice calibration
8. [[Library/Examples/soft-sundays/marketing-predictions-2026]] — 4 predictions for 2026 (organic reach death, conversational SEO, AI kiss of death/tiny audiences, curation over volume), CEO Year Notion Template launch

### Simmer Emails → `PKM/Second Brain/examples/simmers/` (3 total — NEW FOLDER)
1. [[Library/Examples/simmers/my-existential-crisis-and-pinterest]] — wardrobe layering metaphor → no new offers, 2 seasonal reframe tactics, Seasonal Promo Planner
2. [[Library/Examples/simmers/gentle-parent-your-business-model]] — bath-time resistance → launch amnesia, BOH evergreen fix, PIN Keymaster, reply SHAMPOO
3. [[Library/Examples/simmers/when-delta-stole-my-business-idea]] — napkin funnel lost on Delta, the manual for service pros (3-part: Pinterest Traffic Kiosk, Email Reception Desk, Soft Sales Register), reply MANUAL

### Sales / Launch Emails → `PKM/Second Brain/examples/sales-emails/` (4 total)
1. [[Library/Examples/sales-emails/boh-sales-email-pinterest-plan]] — 4-step Pinterest-to-email plan reveals BOH, coupon ORDERUP (subject: `[FIRST NAME]'s Custom Pinterest plan` — fixed mid-session)
2. [[Library/Examples/sales-emails/slowly-viral-webinar-invite]] — Slowly Viral class invite (Feb 26), virality reframe, "what they really want is to stop worrying about where their next client is coming from"
3. [[Library/Examples/sales-emails/slow-marketing-plan-webinar-invite]] — Slow Marketing Plan class invite (Oct 22), antisocial media system, BOH early access waitlist
4. [[Library/Examples/sales-emails/silent-killer-of-good-work]] — high standards creative contrast, BOH as creative time-back system, 4-step Build→Automate→Grow→Sell, Ghost your Feed CTA

**Larry** fixed the sales email subject line mid-session: [[Library/Examples/sales-emails/boh-sales-email-pinterest-plan]] `subject_line:` field was updated from `(not preserved in export)` to `"[FIRST NAME GOES HERE]'s Custom Pinterest plan"`.

**Larry** (Librarian pass):
- [[Archive/Team Inbox/_Processed/Untitled]] (Kit broadcast pull sheet from a prior session) moved to `Team Inbox/_Processed`
- `Email to Carousel Repurposing.md` left in inbox per Alyssa's instruction — a mapping doc linking email↔carousel pairs (Slow Marketing Trends, Cold List, Pinterest), not an email body
- All INDEX files updated across the examples layer throughout
- All 15 source email files deleted from Team Inbox after filing
- All tags verified against GL-004 before use — no new tags invented

---

## Decisions made

- **Simmers get their own folder.** The `examples/simmers/` folder was created this session. Simmer emails are structurally distinct from Soft Sundays (shorter, single-topic, story→CTA, no multi-section newsletter format) and warrant separate filing.
- **Voice flag on AI-feeling email.** [[Library/Examples/soft-sundays/me-i-need-ideas-i-already-had]] carries a visible `⚠️ Voice flag` callout at the top of the body and a `voice_note:` frontmatter field. It should not be used for voice calibration — content/strategy ideas only.
- **Subject line for sales email confirmed.** Alyssa confirmed mid-session: `"[FIRST NAME GOES HERE]'s Custom Pinterest plan"` — updated.
- **Email to Carousel Repurposing.md stays in inbox.** Alyssa chose to leave it — it's a reference mapping doc, not an email example.

---

## Second Brain examples status at close

| Folder | Count | Notes |
|---|---|---|
| `examples/soft-sundays/` | 8 | Exceeds the 5 needed to unlock analysis pass |
| `examples/simmers/` | 3 | New folder created this session |
| `examples/sales-emails/` | 4 | Includes 2 webinar invite / launch emails |

---

## Open threads / next steps

- **Email analysis pass is now unblocked.** The examples layer is populated. Next step: run the Soft Sunday, Simmer, and Sales Email analysis passes to build `analysis/email-soft-sunday.md`, `analysis/email-simmer.md`, and update [[Studio/Analysis/copy-task-routing]] with email-specific routing.
- **Simmer template** (`templates/email-simmer.md`) and **Soft Sunday template** (`templates/email-soft-sunday.md`) can now be built from real examples.
- **`subjects-and-previews.md`** still shows `❌ not started` in `examples/INDEX.md` — preview text is now available from many of the filed emails (captured in each file's `preview_text:` frontmatter field). Populating this file is a quick next step.
- **`Email to Carousel Repurposing.md`** in Team Inbox — Alyssa to handle separately.
- **Weekly review W23** already exists — no nudge needed.
