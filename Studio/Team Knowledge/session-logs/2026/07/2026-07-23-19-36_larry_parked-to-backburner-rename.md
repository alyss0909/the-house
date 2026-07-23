---
agent_id: larry
session_id: parked-to-backburner-rename
timestamp: 2026-07-23T19:36:00Z
type: close-session  # close-session | mid-session-insight | realignment | proactive
linked_sops: []
linked_workstreams: []
linked_guidelines: []
---

# Renamed "parked" to "backburner" across every live surface, made it a standing rule

## Context

Alyssa: "go change everywhere that you say parked to backburner and make sure you never use that again." A vocabulary ruling. "Parked" is out of her vocabulary; "backburner" is the word she wants for anything set aside for later.

## What we did

- Larry swept the whole vault for `parked` (100+ files) and split the hits into buckets before touching anything: live standing surfaces, dated records, filename references, and code identifiers.
- Larry asked one scoping question and Alyssa chose "Live surfaces + memory" — change what I read and say going forward, leave dated records and things that would break references.
- Larry rewrote 35 live vault files via a precise string-mapping script (no blind word-swap): NOW.md, the close-session command, Suki/Penn/Cass agent files (`.claude` and `.codex`), MAP, idea-bank, taste-ledger, liked-hooks, tools README, SOP-040, SOP-034, WS-006, WS-002, GL-003, GL-010, GL-011, GL-012, the Suki and Cassius AGENTS files, Hermes ANTI-AI and BUSINESS, DESK, two Signals notes, the Alex report plan, the ikigai synthesis, the open mailroom-bridge task, the house-check script comment, and the four offer-brief files where "A Year of Emails" was tagged PARKED.
- Larry updated the memory layer: renamed the `chat-words-and-parked-offers` memory to `chat-words-and-backburner-offers`, fixed four other memory files and the MEMORY.md index, and wrote a new standing feedback memory `never-say-parked`.
- Larry verified the whole vault and memory dir: every surviving `parked` is an intended exclusion (Archive, dated Mailroom/Hermes logs, Weekly Reviews, done-task records, `Parked.md`/PRECEDENT filename references, CSS class identifiers, and one "sparked joy" false positive).

## Decisions made

- **Question:** How wide should the rename go, given 100+ hits across live docs, dated history, and code?
  **Decision:** Live surfaces plus memory only. Dated session logs, Archive, Weekly Reviews, the append-only Mailroom run logs, done-task records, and code identifiers stay as they were — they are records of what was actually said on a date, or renaming them breaks references for no benefit.
- **Question:** What replaces "parked" when it did not mean "deprioritized"?
  **Decision:** "parked" was doing two jobs. Deprioritized sense → "backburner" / "on the backburner". "Placed/stored here" sense (e.g. an idea filed in the bank) → a plain synonym like "kept" or "filed", because "backburner" would read wrong there. The rule is that the word "parked" never appears on a live surface, not that "backburner" gets forced into sentences it does not fit.

## Insights

- The first vault-wide grep capped at 100 files and silently hid three live `Studio/Content/briefs/` files that tagged A Year of Emails as PARKED. Re-grepping with the history dirs excluded surfaced them. Lesson: when a grep reports exactly 100 (or any round cap) files, assume truncation and re-run narrower before trusting the set is complete.

## Realignments

- _(none this session — a clean directive, executed as asked)_

## Open threads

- [ ] Notion side of the offer briefs: the Products DB / Offer Briefs mirror may still carry the old status label for A Year of Emails, which should read BACKBURNER to match the vault. Larry did not reach into Notion on his own and flagged it. Optional quick edit when Alyssa says go; not a task file, carried here so it does not leak.

## Next steps

- If Alyssa greenlights it, update the A Year of Emails status label in the Notion Products DB / Offer Briefs mirror to BACKBURNER to match the vault.
- NOW.md's open-threads lines will flip to "backburner" on their own at this close, since they regenerate from the newest session log (this one) which uses the new word.

## Cross-links

- `[[2026-07-23-15-40_mack_ig-saves-image-viewing-fix]]` — immediately prior session this day.
- The vocabulary ruling extends the chat-words / A Year of Emails family (memory `[[chat-words-and-backburner-offers]]`, ruled 2026-07-17).

Weekly review pending for week W30 — run /weekly-review to wrap the week.
