---
date: 2026-05-29
tags:
  - inspo
  - obsidian
---
# Obsidian Design

Running collection of aesthetic inspiration, themes, and CSS snippets for vault design.

---

## Dashboard

Loved the multi-column homepage layout with a banner image + categorised link cards. That's **Dashboard++**.

Not a plugin — a **CSS snippet** that transforms a single note into a card-grid homepage. Works in reading view. When the Obsidian window is wide enough, the note breaks into columns with sections and emoji headers.

Originated by **TfTHacker**:
- [Dashboard++ — full write-up](https://tfthacker.com/article-obsidian-dashboardplusplus2022)
- [Forum thread — community examples + screenshots](https://forum.obsidian.md/t/dashboard-a-simple-organization-and-navigation-method-for-obsidian-vaults/33197)
- [CSS gist — copy-paste starting point](https://gist.github.com/emisjerry/05ec8bca17899908c80d0b68fbfdd43a)

**How to set it up:**
1. Drop the CSS file into `.obsidian/snippets/` and enable it in Settings → Appearance → CSS Snippets
2. Create a Home note and set it as your vault homepage
3. Set default view to **Reading view**
4. Structure the note with `##` headings as section titles — CSS turns them into card columns
5. Add links under each heading — they become clickable items in each card

**What I want mine to include:** Banner image at top, sections for Business / Home / PKM / Parenting, quick links to most-used notes + Key Elements.

**Alternative:** [Obsidian Canvas homepage](https://medium.com/obsidian-observer/my-obsidian-canvas-homepage-dashboard-67c6ce1613c5) — uses built-in Canvas instead of CSS, no snippet needed.

---

## Themes

| Theme | Vibe | Notes |
|---|---|---|
| **Cupertino** | Soft, iOS-native, rounded | Won Best New Theme 2024. Not productivity-bro at all. |
| **Catppuccin (Latte)** | Warm creams, dusty rose, mauve | Light palette reads genuinely soft + feminine. Coordinates across apps. |
| **Minimal** | Ultra-clean, blank canvas | Most downloaded. Boring out of box, gorgeous with Style Settings plugin. |
| **Pink Topaz** | Full pink everything | Niche, less supported, but it exists. |

Install **Style Settings plugin** first — makes any major theme customisable via GUI sliders, no CSS needed.

Research brief with full theme breakdowns: [[2026-05-29-obsidian-aesthetic-note-design]] *(in Deliverables)*

---

## CSS Snippets

- [Iterative Rainbow Folder Colors](https://forum.obsidian.md/t/iterative-rainbow-folder-colors-css/21066) — auto-assigns a different color to each top-level folder in the sidebar, cycling through a rainbow palette. Drop the snippet in and it just works.
- [Modular CSS Layout — Efemkay](https://efemkay.github.io/obsidian-modular-css-layout/) — multi-column callouts, float callouts, gallery cards. Structural layout changes, no plugin needed.
- [27 aesthetic snippets — Prakash Joshi Pax](https://prakashjoshipax.com/obsidian-css-snippets/) — rainbow tags, gradient workspace, pretty tables, hover effects on images.
- [breezy-codes callout collection](https://github.com/breezy-codes/Obsidian-Callouts) — ready-to-use styled callout definitions, drop in snippets folder.

---

## Callout Boxes

Built into Obsidian — no plugin needed. Syntax:

```
> [!tip] Optional title
> Content here. Supports **bold**, [[wikilinks]], anything.
```

Foldable: `+` expands on load, `-` collapses on load.

Custom callout types via CSS:
```css
.callout[data-callout="journal"] {
  --callout-color: 180, 120, 220;
  --callout-icon: lucide-book-open;
}
```

13 built-in types: `note` `tip` `info` `warning` `quote` `todo` `success` `question` `failure` `danger` `bug` `example` `abstract`

---

## Local Graph (the mini connection map)

Leah Ferguson's site shows a mini interactive graph in the top-right corner of each page — it visualises all notes directly connected to the current one via wikilinks.

**In your local vault (free):** Command palette → *"Open local graph"* — opens in the right sidebar for whichever note you're on. Depth, filters, and display are all adjustable.

**On Obsidian Publish (paid):** A toggle in the Publish site settings — enable "Local graph" and it appears on every published page automatically. That's what Leah has.

You don't need Publish to use it — the local graph panel works right now in your vault.

---

## Creators to Follow

- 📺 [Nicole van der Hoeven — YouTube](https://www.youtube.com/@nicolevdh) — best female Obsidian creator with public vault. Watch: [Vault Tour 2023](https://www.youtube.com/watch?v=vAwS-js2iB0)
- 🌐 [Leah Ferguson — public vault](https://notes.leahferguson.com/Home) — graphic designer, daily note workflow
- 📺 Search YouTube: **"obsidian aesthetic vault 2025"** and **"obsidian pretty notes"** — this niche lives on YouTube/TikTok, not well indexed

**Related notes**
- [[2026-05-28-githubs-im-into|GitHubs I'm Into]]
- [[2026-05-27-larry-pkm-todos|Larry PKM To-Dos]]

**Connections:** [[pkm]]
