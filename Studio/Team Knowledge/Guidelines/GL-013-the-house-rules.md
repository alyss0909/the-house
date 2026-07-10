# GL-013 — The House Rules

- **Status:** ACTIVE (blessed by Alyssa 2026-07-09).
- **Owner:** Larry
- **Applies to:** every agent, every session, every file, everywhere in the house.
- **Supersedes:** the earlier "one home per fact" draft (that rule survives here as Rule 3).
- **Sits above:** this is the constitution. [[GL-009-source-boundaries-and-promotion]] describes the classes; this describes how the house works.

## The house rule (say it, live it)

**Map first. Notebook is mine. Studio is opinion. Library is earned. Link everything.**

## Why the house is shaped this way

The house is organized by **trust, not by birthplace**. For a long time knowledge was stored by where it was born — which sprint, which agent, which project — so every new build made its own copy of the truth and nothing ever migrated. That is what broke trust: the calendar existed five times, prices lived inside a writer's brain, analysis sat next to Alyssa's real words pretending to be equal. The three places fix this by making an address mean a level of trust:

| Place | What it is | Trust |
|---|---|---|
| **Notebook** | Alyssa's raw material — journal, inbox, todos, her drafts, her life. If she made it and hasn't handed it over, it lives here. | It IS her. Absolute. |
| **Studio** | The workshop — every desk, every analysis, every tool, everything in flight. All of it is working material and opinion. | Working. Never source. |
| **Library** | The shelf — her finished work, and anything she promoted on purpose. | Earned. Citable. |
| **Archive** | Where dead and superseded work drains. | Cold storage. |

An agent can never again be confused about whether it is reading her mind, the team's opinion, or the trusted shelf, because the path says so.

## The five rules

### Rule 1 — Notebook is hers. Agents read it, never write it.

No agent writes, edits, appends to, or "improves" anything in the Notebook — not the journal, not raw inbox drops, not her drafts. The one standing exception is Penn performing capture-transcription (WS-001), which writes down what she said in her own voice. Everything an agent thinks *about* her raw material — analysis, signals, theses, interpretation — lives in the Studio and links back to the raw note. Her incoming ideas stay hers, byte for byte. This holds today, before any folder moves.

**The one requested-edit exception.** When Alyssa explicitly asks for it, an agent may make *mechanical, connective* edits to a Notebook file: adding or fixing wikilinks, formatting, tidying frontmatter, connecting a note into the graph. Bounded by three rules:
1. Only on her explicit request for that file or that batch — never on an agent's own initiative, never as a side effect of another task.
2. Structure and connection only. Her words and their meaning are never changed, rewritten, "improved," summarized, or added to. If a change would alter what she said, it is not allowed — it becomes a Studio note that links back instead.
3. Say what changed. The edit is mechanical and visible (links, formatting, frontmatter), so she can see exactly what was touched.

Everything outside that narrow lane stays read-only. When in doubt, treat the file as untouchable and ask.

**The desk exception (standing, granted 2026-07-10).** [[Notebook/DESK]] is the one note in the Notebook the team may update without a per-edit request: it is the passing-notes surface where anything needing Alyssa's eyes gets linked, and ruled-on items come off. Links and one-line link descriptions only — never content, never her other notes. Every report for her goes on the desk; she never browses Deliverables.

### Rule 2 — Studio work is opinion until she promotes it.

Everything the team makes is opinion, no matter how good. Analyzing Alyssa's real work is encouraged — that is how the house gets smarter — but the conclusion is never the truth. It is a labeled interpretation in the Studio. It becomes trusted only when Alyssa promotes it on purpose (a move to the Library plus a stamp: `promoted_by: alyssa`, `promoted_date`). No agent promotes its own work, and no agent proposes-and-executes a promotion in one step.

### Rule 3 — One home per fact. Link, don't copy.

Every fact has exactly one home. Everything else links to it. If you are typing a fact that already lives somewhere, stop and link instead — a second copy is a bug the moment it is written. Prices, chat words, offer status, calendar slots, framework names, taste reacts: typed once into their home, wikilinked everywhere else. One change upstream must never be able to silently desync two files. Quoting Alyssa verbatim with a citation is always welcome; paraphrasing her into a new "version" is not.

The canonical registry (which file owns which fact) lives in [[HOUSE-MAP]]. Facts do not live inside an agent's workspace — Hermes holds judgment, craft, and pointers, never business facts.

### Rule 4 — Cite only what exists.

Never reference a file you have not confirmed on disk this session. A citation to a file that does not exist is fabrication (this is how the house ended up with ghost files it treated as canonical). If what you want to cite does not exist, create it properly or point at the closest real thing and say so.

### Rule 5 — Link everything. Silos get archived.

Alyssa chose Obsidian so ideas connect, collide, and compound. Siloing is the failure that broke this vault. So: every file you create connects to what genuinely relates to it — the notes it grew from, the source it studied, the map that should point back to it. When you touch an old file, leave it more connected than you found it. A file with no real connections is a silo; question whether it should exist. (There is no required number of links — connect what truly relates, never pad to a count.)

## The durable-vs-method test (write every rule this way)

From the Bitter Lesson: human-encoded *process* rots as models improve; human-encoded *goals, facts, taste, and gates* appreciate. So before writing any rule, SOP, contract, or map, ask which kind it is:

- **Goal, fact, taste call, or gate?** Write it tight and permanent. It gets more valuable as the models get smarter.
- **Method** — a format, an order, a file count, a token budget, "do X then Y"? Write it as a **dated default with an escape hatch**, and name the limitation it exists for, so it visibly expires when that limitation dies.
- **Never write a parser where a reader will do.** Exact-string contracts between two models are last-resort, machine-to-machine only.
- **Model-tuned numbers are benchmarks, not laws.** Re-measure them on every model upgrade.

The five rules above are all goals and gates — the durable kind. Everything method-shaped in this house carries a date and an escape hatch.

## Enforcement (light, at the seams)

- **Session close (SOP-011):** one added check — did this session type a fact that already had a home, write into the Notebook, cite a file that does not exist, or leave an orphan? Fix before the log is written.
- **Weekly review (WS-006):** a five-minute lint — a known fact string appearing outside its home, citations to missing files, orphan files, non-Penn writes in the Notebook. Fix in the review.
- **Mean Alyssa gate (GL-009) gains one question:** "Would Alyssa find this same thing in two places and stop trusting both?"

## What this does NOT bind

Alyssa. These rules bind the team, not her. She writes, edits, moves, and duplicates anything she wants, anywhere, without stamps or permission. The gates watch the agents.
