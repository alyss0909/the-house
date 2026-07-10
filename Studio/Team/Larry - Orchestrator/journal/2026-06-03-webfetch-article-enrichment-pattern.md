---
agent_id: larry
type: journal-entry
created: 2026-06-03T12:00:00-04:00
updated: 2026-06-03T12:00:00-04:00
topic: webfetch-article-enrichment
tags: [inbox, capture, second-brain, webfetch]
linked_session_logs: [2026-06-03_larry_morning-triage-inbox-bdow-enrichment]
linked_tasks: []
related_journal_entries: []
status: durable
---

# WebFetch + journal entry is the canonical flow for captured article links

## Context

Three bare Bdow links had been sitting in the vault for months with no content. This session fetched them and filed rich journal entries in one pass — full stats, frameworks, quotes, and a "how I'd use this" section.

## What I learned

When a captured item is a URL (Telegram, Keep, inbox), the right move is: fetch the content with WebFetch, extract stats/frameworks/direct quotes, and file a proper journal entry — not just a saved link. A journal entry with real content is searchable, referencable, and useful. A bare link is a dead end. The "how I'd use this" section should be Alyssa's eventual voice, but seeding it with candidate angles is better than leaving it blank.

For running inspiration lists (like blog-post-ideas), the lighter treatment is correct: short context blurb per link, no full enrichment. The distinction is intent — reference vs. inspiration.

## When this applies

- Any inbox item that's a bare URL with no body content
- Telegram captures that are just links
- KeepSidian notes that are URL-only
- Any time Alyssa says "I want to get the contents of this"

## When this does NOT apply

- Running lists where links are inspiration, not reference (use blurb treatment instead)
- Authenticated/paywalled URLs — WebFetch will fail, flag for Obsidian Web Clipper instead
- Social media URLs — use Apify scrapers, not WebFetch

## Evidence

- `[[2026-06-03_larry_morning-triage-inbox-bdow-enrichment]]`
- `[[PKM/Journal/2026/06/2026-06-03-conversion-rate-optimization-article.md]]`
- `[[PKM/Journal/2026/05/2026-05-14-headline-formulas.md]]`
