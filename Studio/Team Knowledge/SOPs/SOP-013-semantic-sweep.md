<!--
myPKA Scaffold - © 2026 Paperless Movement® S.L.
Licensed under CC BY-NC-SA 4.0 - see LICENSE
-->

# SOP-013 — Semantic Sweep (Redesigned 2026-06-27)

> **Default owner:** Larry
> **Invoked by:** WS-006 (weekly), WS-009 (monthly deep), quarterly review, or on-demand.

The semantic sweep is how the system gets smarter. It reads across journal entries, captures, and voice memos, finds what keeps appearing, names it, and feeds the idea garden. Every sweep adds intelligence. The garden develops ideas. The ideas feed production. Production generates new voice material. New voice material calibrates Hermes. Hermes produces better drafts. Better drafts mean more Alyssa in fewer corrections. This is the intelligence flywheel.

Sweep intelligence is still bound by [[GL-009-source-boundaries-and-promotion]]. A sweep may connect, count, flag, and point. It must not turn generated interpretation into Alyssa-original source. Before creating or updating garden notes, content activation tasks, or Hermes graduation candidates, run [[Hermes/MEAN-ALYSSA]]: would Alyssa expect old source, BOH/freebie/training material, Google Drive/export, Notion, session logs, or external gold-standard proof before this claim becomes knowledge?

---

## Three Modes

| Mode | Cadence | Scope | Depth | Output |
|---|---|---|---|---|
| Light | Weekly (part of WS-006) | Last 7 days | Read + flag | Inline to weekly Brew |
| Deep | Monthly (part of WS-009) | Last 30 days | Full cluster + thesis | Sweep note + signals-index update |
| Full | Quarterly | Last 90 days | Vault-wide intelligence audit | Intelligence report + yes-pattern update |

---

## Weekly Light Sweep

### Step 0 — Scope
Confirm date range: last 7 days. Glob `Notebook/Journal/YYYY/MM/` for entries in range.

### Step 1 — Read and flag
Read each entry. For each entry, check:
- Does it touch a signal slug already in signals-index.md? → Bump recurrence, add wikilink to garden note
- Does it contain a new theme appearing 1st-2nd time? → Note slug for potential radar signal
- Is it clearly content-ready (hook, story with teachable moment, framework)? → Flag for Step 4 (content activation)
- Does it reference a developing idea, the Second Brain, or a team member? → Flag for Step 2

### Step 2 — Feed the garden
For any garden note that received a new entry this week:
- Add the wikilink to "The entries that feed this" in the garden note
- Check: has the signal now hit 6+ recurrence? If yes, check whether a thesis draft has been written. If not, write it now.
- Check: are there new Second Brain assets (Hermes deliverables, analysis files, examples) that should be linked in the garden note?
- Check source boundary: if the connection is generated analysis rather than Alyssa-original source, label it as derived and point to the source it came from. Do not let sweep notes become source.

### Step 3 — Thesis drafts
For any signal that just crossed 6 recurrences: write Larry's thesis draft in the garden note. Write it as Larry speaking directly to Alyssa — "here's what I think you've been trying to say." Not analysis. A draft she can edit.

### Step 4 — Content activation flags
Flag any content-ready entry for content activation (WS-008 routes it: social content → weekly pitch loop, everything else → a task file in `Studio/Team Knowledge/tasks/open/`) with:
- Proposed content type (email / carousel / Soft Sunday / Simmer concept / other)
- Proposed assignee (Hermes / Pax / Charta / etc.)
- Source entry link
- Cross-reference to any developing idea it feeds
- Trust verdict: `proceed`, `read-first`, `search-first`, `use-existing`, `archive-delete`, or `ask-Alyssa` from [[Hermes/MEAN-ALYSSA]]. If external proof or old source discovery is needed, route to Pax or Mack instead of inventing.

### Step 5 — Write to the weekly Brew
The light sweep output is NOT a separate file. It goes inline into Phase 1 (The Brew) of the current week's WS-006 run. Format: new signals found, signals updated, thesis drafts written, content flags raised.

---

## Monthly Deep Sweep

### Step 0 — Scope
Full previous calendar month. Glob all journal entries for the month.

### Step 1 — Full read and cluster
Read all entries. Build a cluster map: group by underlying theme, not surface words. "I keep procrastinating on recording" and "hard to start video work" are the same signal. Name each cluster (3-6 words, lowercase, hyphenated). Count distinct entry appearances. Note first/last seen.

### Step 2 — Cross-reference goals
Glob `Notebook/Life/Goals/` for active Goals. For each signal with 3+ recurrence: flag alignment (signal supports goal), gap (recurring theme with no goal), or tension (signal conflicts with goal).

### Step 3 — Update signals-index.md
- Update recurrence counts and `last_seen` for all existing signals
- Add new signals at appropriate status
- Promote any signal that has crossed a status threshold
- Update the Sweep History table

### Step 4 — Second Brain cross-reference
For each `developing` or `thesis-ready` signal: check which Second Brain files are relevant. Add missing wikilinks to the garden note. The garden notes should be the most connected files in the vault.

### Step 5 — Thesis drafts
For any signal at 6+ recurrence with no thesis draft: write it now. For any signal where Alyssa has edited the thesis draft: update status to `becoming` in signals-index.

### Step 6 — Voice loop check
Read the last month of `Hermes/learning/inbox.md` and `Hermes/learning/log.md`. Is there a pattern of corrections that should become a standing rule? If so, propose graduating it into `Hermes/STYLE.md`, `TASTE.md`, or `ANTI-AI.md` - Alyssa approves before it lands.

### Step 7 — Taste loop check
Read `Studio/Analysis/taste-log.md`. Are there new approval patterns from the month? Are any YES patterns now strong enough to become standing instructions? Flag in the sweep note.

### Step 8 — Content type classification
For every new signal: add content type tags from the set: `idea | content | teaching | voice`. These drive content activation — `content` and `teaching` signals get prioritized in WS-008.

### Step 9 — Save sweep note
File: `Studio/Team Knowledge/Sweep Notes/YYYY-MM-deep-sweep.md`

Include: new signals, signals promoted, thesis drafts written, Second Brain connections made, voice loop observations, taste loop observations, "What I learned about Alyssa's thinking this month" in Larry's plain voice.

Also include a short "Metabolism links" section: which weekly `Grand metabolism` items this sweep confirms, supersedes, or routes forward. Do not create a second report about the same insight if the weekly wrap already holds it; link and update the owning map/task/Ready Queue item instead.

---

## Quarterly Full Sweep

Larry delegates to a subagent. Brief includes: date range, signals-index at start of period, developing ideas list, and the specific question: *What has the system learned about Alyssa that wasn't true 3 months ago?*

Subagent produces: full intelligence report. Larry writes: 1-page executive summary for Alyssa — plain language, what compounded, what's ready to act on, what needs her input.

Also produces: updated `Studio/Analysis/yes-pattern.md` + proposed Hermes rule graduations (Alyssa approves).

---

## What Larry does / does NOT do

**Larry does:**
- Update counts, statuses, and dates automatically
- Write thesis drafts when recurrence threshold is crossed
- Flag graduation candidates in the sweep note
- Add wikilinks between entries and garden notes
- Flag content activation opportunities for WS-008 (pitch loop or task file)

**Larry does NOT:**
- Auto-graduate a signal — that requires Alyssa's decision
- Auto-dismiss a signal — Alyssa must explicitly decide
- Delete old signals — archive to `Studio/Signals/signals-archive.md` if the list gets unwieldy

---

## Cross-references

- [[Studio/Signals/signals-index.md]] — the living signal tracker
- [[Studio/Signals/Developing Ideas/INDEX.md]] — the idea garden
- [[Hermes/learning/inbox.md]] — voice loop output
- [[Studio/Analysis/taste-log.md]] — taste loop cross-reference
- `Studio/Team Knowledge/tasks/open/` + [[Studio/Content/idea-bank.md]] — content activation outputs (Ready Queue dissolved 2026-07-10 → [[Archive/ready-queue-retired-2026-07-10]])
- [[Studio/Team Knowledge/Workstreams/WS-006-weekly-review.md]] — calls the light sweep
- [[Studio/Team Knowledge/Workstreams/WS-009-monthly-intelligence-update.md]] — calls the deep sweep
