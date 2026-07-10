---
agent_id: larry
session_id: encoding-cleanup-and-emoji-discipline
timestamp: 2026-06-04T15:28:00-04:00
type: close-session
linked_sops: []
linked_workstreams: ["WS-002-import-external-knowledge-base"]
linked_guidelines: ["GL-001-file-naming-conventions"]
---

# Encoding cleanup and emoji discipline

## Context

Alyssa noticed mojibake showing in Obsidian again, especially in the BOH Second Brain index. The session focused on finding when it happened, why it happened, repairing it vault-wide, and adding a lightweight prevention rule.

## What we did

- Larry scanned the vault for broken encoding markers and found 79 affected Markdown files.
- Larry traced the damage pattern: affected files were created across 2026-06-01 through 2026-06-04, but their LastWriteTime clustered on 2026-06-04 between 14:40 and 15:05, indicating a later batch rewrite rather than bad original source text.
- Larry repaired the affected Markdown files.
- Larry added `Team Knowledge/scripts/repair-mojibake.py`, a dry-run-first utility for detecting and repairing UTF-8 text that was accidentally decoded as Windows-1252 and saved.
- Larry documented the utility in `Team Knowledge/scripts/README.md`.
- Larry updated [[WS-002-import-external-knowledge-base]] so future batch imports run the mojibake dry-run before final handoff.
- Larry added a root rule to [[AGENTS]]: use plain-text statuses and symbols by default, preserving emoji only when part of source material, user quotes, brand assets, or deliberately named objects.

## Decisions made

- **Question:** Should the team keep using emoji status markers?
  **Decision:** No. Use plain text by default: `[x]`, `done`, `blocked`, `->`, `--`. Preserve emojis only when source-accurate or intentionally part of the material.
- **Question:** How should the team prevent mojibake from recurring after imports?
  **Decision:** After any batch import, transcript filing, or generated-file cleanup pass, run `Team Knowledge/scripts/repair-mojibake.py` in dry-run mode. If it reports files, apply the repair and scan again before handoff.

## Insights

- The damage was not isolated to one visible Obsidian page; it was a vault-wide Markdown issue concentrated in recently rewritten Second Brain and related team files.
- Older session logs already noted PowerShell / Windows encoding drift as a risk. This session converted that recurring pain into a reusable repair tool and a team-wide writing rule.
- Plain-text operational markers are better for myPKA infrastructure. Emojis still belong in original brand/source content when fidelity matters.

## Realignments

- Alyssa asked to solve the mojibake at the root, not just patch the visible page.
- Alyssa then clarified that the team should probably use fewer emojis overall to reduce risk.

## Open threads

- [ ] Continue preserving emoji in original source material when it is part of Alyssa's brand/copy assets.
- [ ] Continue using plain-text markers in team-created infrastructure files.

## Next steps

- Future batch imports and cleanup passes should run the mojibake dry-run before being considered complete.
- If mojibake appears again, use the repair utility first, then inspect the most recent batch rewrite window.

## Cross-links

- [[2026-06-04-15-15_larry_mojibake-root-cause-and-repair]] - mid-session root-cause note.
- [[2026-06-02_larry_meetily-meeting-capture-workflow]] - earlier log noting mojibake and PowerShell/encoding drift.
- [[2026-06-02_larry_second-brain-boh-content-import]] - earlier log noting Windows PowerShell encoding risk during Second Brain imports.
