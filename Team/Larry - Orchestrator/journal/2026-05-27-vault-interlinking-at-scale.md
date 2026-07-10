---
agent_id: larry
type: journal-entry
created: 2026-05-27T00:00:00Z
updated: 2026-05-27T00:00:00Z
topic: vault-interlinking
tags: []
linked_session_logs: [2026-05-27_larry_vault-enrichment-interlinking-and-cleanup]
linked_tasks: []
related_journal_entries: []
status: durable
---

# Slug-inference + merge-pass is the right method for vault-wide interlinking

## Context

Needed to add peer-to-peer **Related notes** sections to ~130 journal entries across 18 topic clusters without reading every file. The vault had 280+ notes.

## What I learned

Build clusters from slug names first — accuracy is ~90% for a well-named vault. Do targeted reads only for ambiguous slugs (20–30 files, not 280). Then use a merge-pass: build a `note → Set<related>` lookup that unions all cluster memberships before writing, so notes in multiple clusters get one combined write rather than sequential overwrites. This avoids the "already has Related notes, skip" logic eating legitimate multi-cluster notes.

The script pattern that works:
1. Define clusters as flat arrays of slugs
2. Loop clusters → build `$noteToRelated` HashSet per note (union across all clusters the note appears in)
3. Single write pass over `$noteToRelated.Keys` — each note written exactly once

## When this applies

Any time Alyssa asks for large-scale topical interlinking across journal entries. Also applies to any "add field X to all notes in category Y" operation — the merge-first approach prevents partial writes.

## When this does NOT apply

Small targeted edits (1–5 files) — just use Edit directly. No need for cluster logic.

## Evidence

- `[[2026-05-27_larry_vault-enrichment-interlinking-and-cleanup]]` — 167 notes updated, 18 clusters, 2 edge-case patches
