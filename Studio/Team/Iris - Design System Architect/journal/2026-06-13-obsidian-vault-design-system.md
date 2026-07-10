---
agent_id: iris
type: journal-entry
created: 2026-06-13T00:00:00Z
updated: 2026-06-13T00:00:00Z
topic: obsidian-vault-design-system
tags: [vault-css, obsidian, design-system]
linked_session_logs: []
linked_tasks: []
related_journal_entries: []
status: durable
---

# Alyssa's Obsidian vault has a locked design system — oat/linen card layout, AT KING/Karla/Roboto Mono, 5-color pastel palette

## Context
Alyssa and Larry spent a full session (2026-06-12/13) iterating the Obsidian vault's visual design from scratch, modeled on kristenbouchard's inspo vault (reddit.com/r/ObsidianMD/comments/1s96asw). It's now locked and live in `.obsidian/snippets/`.

## What I learned
The finalized system:

- **Structure:** AnuPpuccin's native **Card Layout** variant (Style Settings → Workspace → Workspace Layout → Card) — not hand-rolled CSS. A linen frame `#eee6de` sits behind everything; every pane (sidebar, note, calendar, properties) floats as an oat `#fcfaf5` card with a dark border `rgba(0,0,0,0.35)`, ~10px radius, gaps between cards.
- **Colors:** headings `#1a1a1a`; body text `#2d1a1b`; muted text `#7a5c5e`; accent/links terracotta `#8b4a2f`; UI accent pink `#e8a8bf`; hover state `#c1d17c`.
- **Pastel palette (tags + folders):** `#a186bc` `#fecc86` `#f39ec2` `#c1d17c` `#ffeec6`. Alyssa specifically does NOT want descriptive color names attached (called `#c1d17c` "sage" and she reads it as dusty green) — use hex only.
- **Folder assignments:** PKM → `#c1d17c` + ✦︎ · Team Knowledge → `#fecc86` + ⸬ · Team Inbox → `#f39ec2` + ☾ · Deliverables → `#a186bc` + ⊙ · Team → `#ffeec6`.
- **Typography:** AT KING serif for all headings, letter-spacing `0` (negative values read as too cramped). Karla for body via Google Fonts. Roboto Mono fixed `12px`, uppercase, `0.04em` letter-spacing for sidebar AND tabs — must match exactly or it reads inconsistent.
- **Tabs:** pill-shaped, oat background, dark border, matching the card border color. Active tab = solid pink `#f39ec2` with forced black text. Sidebars get plain borderless icons, not pills — pill styling is scoped to the main note area only.
- **Properties panel:** docked to right sidebar (manual drag setup), invisible until hover.

## When this applies
Any future Obsidian vault UI work — a home dashboard, Bases card gallery view, Custom Frames plugin setup, or any new panel/note-view styling. Match this system; don't introduce new colors or fonts without Alyssa's sign-off.

## When this does NOT apply
This is Obsidian **app-chrome** theming (CSS snippets styling the Obsidian shell itself), not the content-design-system GL-003 governs (brand colors/type/imagery for Charta/Pixel deliverables like carousels, infographics, styled images). Don't conflate the two — GL-003 stays scoped to outward-facing content, this stays scoped to the vault's own interface.

## Evidence
- Live files: `.obsidian/snippets/colors.css`, `fonts.css`, `heading-font.css`, `folder-colors.css`, `tabs.css`, `hide-ui.css`, `properties-panel.css`, `.obsidian/appearance.json`
- Debugging note worth remembering: a tab-bar-disappearing bug took many iterations to find (root cause: `.view-header-title-container { opacity: 0 }` was hiding the tab label text under AnuPpuccin's card layout, compounded by a border color nearly matching its background). Next time a vault CSS bug isn't obvious from reading the file, inspect the live DOM via DevTools (Ctrl+Shift+I) before guessing — much faster than guess-and-reload cycles, and Alyssa notices the difference.
