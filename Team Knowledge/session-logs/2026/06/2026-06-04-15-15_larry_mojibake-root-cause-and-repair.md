---
agent_id: larry
session_id: mojibake-root-cause-and-repair
timestamp: 2026-06-04T15:15:00-04:00
type: mid-session-insight
linked_sops: []
linked_workstreams: ["WS-002-import-external-knowledge-base"]
linked_guidelines: []
---

# Mojibake root cause and repair

## Context

Alyssa noticed broken mojibake characters showing in Obsidian, especially in `PKM/Second Brain/programs/back-of-house/INDEX.md`. The visible symptoms were broken em dashes, arrows, checkmarks, bullets, and emoji.

## What we did

- Larry scanned the vault for mojibake markers and found 79 affected Markdown files.
- Larry checked timestamps before repair. Affected files had CreationTime spread across 2026-06-01 through 2026-06-04, but LastWriteTime clustered tightly on 2026-06-04 between 14:40 and 15:05.
- Larry added `Team Knowledge/scripts/repair-mojibake.py`, a dry-run-first repair utility.
- Larry documented the utility in `Team Knowledge/scripts/README.md`.
- Larry updated [[WS-002-import-external-knowledge-base]] so future batch imports run the mojibake scan before final handoff.
- Larry repaired all affected Markdown files and verified the scan returned zero remaining files.

## Decisions made

- **Question:** How should the team prevent this from recurring?
  **Decision:** After any batch import, transcript filing, or generated-file cleanup pass, run `Team Knowledge/scripts/repair-mojibake.py` in dry-run mode before calling the work complete. If it reports files, apply the repair and scan again.

## Insights

- The files were not originally created broken. They were damaged by a later batch rewrite that treated UTF-8 bytes as Windows-1252 text and saved the decoded result back to disk.
- This is detectable by pattern: strings beginning with codepoints like `\u00e2`, `\u00c2`, `\u00c3`, `\u00f0`, or `\u00ef` around punctuation or emoji are usually UTF-8 mojibake, not authorial text.
- The repair is reversible in practice for this class of corruption: reinterpret the broken Windows-1252-looking runs back into their original bytes, then decode those bytes as UTF-8.

## Realignments

- _(none this session)_

## Open threads

- [ ] Keep an eye on future batch-generated Markdown files for the same pattern, especially files created or rewritten from Windows tooling.

## Next steps

- Run the repair utility dry-run after future imports and cleanups.

## Cross-links

- [[2026-06-04_larry_boh-index-interlinking-and-cleanup]] - nearby Second Brain / BOH index cleanup session.
- [[2026-06-04_larry_second-brain-transcript-mass-import]] - nearby transcript mass import session.
