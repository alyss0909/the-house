---
name: GL-007 — Token Discipline
type: guideline
description: Durable principles for keeping context lean across all team work. Rewritten 2026-07-10 per the durable-vs-method rule (GL-013) — model-tuned arithmetic replaced with principles that don't expire.
last_updated: 2026-07-10
tags: [token-discipline, context, performance]
---

← [[Studio/Team Knowledge/Guidelines/INDEX|Guidelines]]

---

## Why this exists

Context compounds — every file loaded costs tokens before any work starts, and later messages in a session re-read everything before them. This is a durable fact about how these models work. How much it costs, in tokens or dollars, is a moving number that changes with every model generation — that part is not written here as a law.

## The durable principles

1. **Load what the task needs, nothing speculative.** If you don't know whether you'll need a file, don't load it yet — you can always load it later. "Just in case" loading is the recurring failure mode.

2. **Prefer entry points and maps before full loads.** Every navigable area has an entry point (a COMPASS, an INDEX, a MAP) built to be read first and cheaply. Load the entry point, decide what the task actually requires from its routing, then load only that. Don't walk into a folder directly when a map already tells you where to go.

3. **Full originals override thrift for voice work.** When the task is writing or judging in Alyssa's voice, load the real source in full per the writer's protocol — this is a hard exception to "load less," not a violation of it. Voice fidelity depends on seeing her actual words, not a compressed summary of them. This resolves the old contradiction between this guideline and the writer's full-load rule: voice work follows the writer's protocol, everything else follows the principles here.

4. **New topic, new session.** Don't carry unrelated work (a copy task, a system task, a journaling task) forward in the same context — each gets its own session so neither pays for the other's history.

5. **Batch tool and MCP calls where the calls are independent.** Every additional round trip re-injects overhead (tool schemas, prior context). Combine what can be combined.

6. **Any specific number in this house is a dated benchmark, not a law.** File-size caps, message counts, "max N files before you stop," line ceilings — all of it is a measurement taken against a specific model at a specific date. Re-measure on every model upgrade rather than trusting the old number. If you find a hardcoded limit anywhere in this house that reads like arithmetic rather than a principle, treat it as due for re-measurement, not as a rule to defend.

7. **Prefer a reader over a parser.** Don't build exact-string machine-to-machine contracts between two models to save tokens — that trade tends to break the moment either model's output format shifts. Structured routing (entry points, tables, wikilinks) survives model upgrades; brittle string contracts don't.

---

*This guideline applies to all agents. Larry enforces it at session close as part of the Librarian role.*
