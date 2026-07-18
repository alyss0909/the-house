---
name: Notion Best Practices
status: planning
key_element: business
linked_topics:
  - pkm
tags:
  - notion
---

# Notion Best Practices

**Part of:** [[business]]
**Sits next to:** [[notion-templates]] (that project = Notion products you *sell*; this project = how your *own* Notion workspace should be built and kept)

## Why this matters

This is the rulebook for how anything gets built inside your own Notion — by you or by the team. Right now those conventions live in your head, so every new page or database is a fresh judgment call and things drift. The goal is one place that says: use these templates, these icons, put new things here, always wire relations, and always trace an idea back to where it came from. Once it's written down, the system can follow it without you re-explaining each time.

This note is the seed. You'll clarify later.

## The seed (your notes, verbatim)

> Know my post templates / icons
>
> Know where to put new stuff
>
> Know that I always want relations when possible
>
> Know the obsidian link hack
>
> sidenote: The ideas need to relate to inspo going forward where it got that idea from

## What I take each of these to mean (to confirm)

1. **Post templates / icons.** There's a set way your pages are supposed to look — page templates and a consistent icon language. The system should pull from those, not invent a new layout each time. *Open: point me at the canonical templates and the icon set so I can write them down.*
2. **Where to put new stuff.** A routing map — new page of type X goes in database/section Y. So nothing lands in a random spot. *Open: does this map exist anywhere, or do we build it from how your workspace is laid out today?*
3. **Always want relations when possible.** Default to wiring relation properties between databases instead of leaving loose text. Every new database gets connected to the ones it touches. *This one I'm confident on — it becomes a standing rule.*
4. **The obsidian link hack — SOLVED, now a standing rule.** This is the `obsidian://open` URI: a link that opens a note straight in the vault from inside Notion. Format: `obsidian://open?vault=the-house&file=<vault path, URL-encoded, .md dropped>` (`/` → `%2F`, space → `%20`). Example: `Studio/Content/dashboard/01 Concepts.md` becomes `obsidian://open?vault=the-house&file=Studio%2FContent%2Fdashboard%2F01%20Concepts`. It lives in an **"Open in vault"** URL property on the row — the House Operations Board and Content Studio board already use this. **Standing rule now saved:** every Notion row that maps to a vault note gets this link, every time. Recorded in memory as [[reference_obsidian_clickable_link]].
5. **Ideas relate to inspo (the sidenote).** Every captured idea carries a relation back to the inspo it came from — the post, the save, the source. This is already the shape of the [[saves-sweep]] → Content Studio board flow (each option knows which save it came from). This rule generalizes that to all idea capture in Notion.

## Icons and views (added 2026-07-17)

Two more standing rules, saved to memory as [[reference_notion_icons_and_views]]:

- **Every page gets an icon.** You hate new pages landing with no icon. Before the team creates pages in a database, it must check whether that database has a **default template** and use it. You've flagged that even when a default template exists, the team skips it — that stops now. Where a database should have a copyable per-database template, we build one and load from it every time.
- **Every new view gets an icon too.** When we add an alternative view, it also always needs an icon. You often like **board view**.

**What I can and can't do here:** Notion's API lets me create pages, set page icons, and wire relation properties. It does **not** let me read or set database templates, view types, or view icons — those only exist in the Notion UI. So for anything template- or view-shaped, I either follow a spec you give me once, or you set it in the UI and I match it. I won't pretend the API did something it can't.

## Design team owns this (added 2026-07-17)

Your call: there should be a **Notion design file** that lives with the design team, and the design team gets **consulted whenever we make Notion things** — because they already know what you do and how you like it to look. This is right, and here's the current state I found:

- **[[GL-003-design-system]]** is the real design source of truth, authored by **Iris** (Design System Architect, edits are Iris-only). But it's built for the **Obsidian vault** — oat/linen cards, dashboard CSS, chip hierarchy. It says nothing about Notion.
- Your Notion visual conventions currently live **only** as a memory pointer ([[reference_notion_template_format]]) — your dash grammar for deliverables. No design-team file, nothing anyone is required to consult.

**The gap:** there's no Notion design file owned by the design team. The plan:

- Iris authors a **Notion design guideline** — the GL-003 sibling for Notion (icons, page templates, view conventions, embed rules, your dash grammar folded in). Authored by Iris, not me — design decisions are hers to make, mine to route.
- **Standing rule:** any time the team builds something in Notion, it reads that file first and consults the design team, the same way visual agents read GL-003 before vault work.

**HTML embeds are now a thing in Notion.** Notion supports HTML embeds now, which opens up custom-styled blocks beyond native Notion formatting. The Notion design file needs to cover **when and how to use HTML embeds** — what they're for, the house style for them, and when to stay native instead. This is a real new capability the design guidance has to account for.

## What I still need from you (the API can't see these)

1. **Per-database templates.** For the databases you create pages in most, tell me (or point me at) the template each should use — layout + which icon. Then I build a copyable template per database and always load from it. Which databases matter most first?
2. **Icon vocabulary.** Do you use emoji icons, custom uploaded icons, or Notion's built-in icon set? Is there a consistent icon per database or per page type? If you tell me the mapping once, I'll apply it every time.
3. **Board view + view icons.** For a database like the Content Studio board or House Operations Board: which views do you keep (Board, Table, etc.), what icon goes on each, and what's the default view? Show me one you consider "done right" and I'll replicate the pattern across the rest.

## How this connects to what already exists

- [[reference_notion_template_format]] — your standing dash grammar for Notion deliverables (O-numbered callouts, open-me toggles, checkboxes, embedded DBs, terms footer). Best practices should absorb this, not compete with it.
- [[saves-sweep]] / Content Studio board — already does "idea knows its inspo source." Item 5 is that pattern made into a general law.
- [[House Control Room]] — the existing Notion oversight board; a live example of how your databases are supposed to relate.

## Open decisions for you to clarify later

- Where the finished rulebook lives: a Notion page in the workspace, a vault note the team reads, or both.
- The actual template + icon set (item 1) — show me the canonical ones.
- The routing map (item 2) — hand me the current layout or the target one.
- Whether this stays a conventions doc or grows into a checklist the team runs before shipping anything to Notion.

## Status

Planning. Seed captured 2026-07-17 from your dump. Not started — waiting on your clarifications above before we turn any of this into a real rulebook.

## Next steps

- You clarify the five items (especially the obsidian link hack, which I won't guess).
- I turn the confirmed ones (relations, idea-to-inspo) into written standing rules first, since those are already clear.
- Decide where the finished rulebook lives.
