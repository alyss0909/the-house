---
agent: felix
date: 2026-07-07
tags: [obsidian, dataviewjs, dashboard, css]
---

# Building live dashboards in Obsidian with DataviewJS

Durable gotchas from building the WS-011 Content Command Center as live vault notes (not just HTML mockups). Read this before any future Obsidian-dashboard task.

- **Injected `<a href>` links do NOT navigate.** DataviewJS HTML with raw `href="Note.md"` does nothing on click. Wire it: after `dv.el(...)`, query the rendered element and `addEventListener("click", () => app.workspace.openLinkText(target, dv.current().file.path, false))`. Used for nav pills, wikilinked sources, and clickable calendar posts.
- **Writing to files works with pure DataviewJS.** `app.vault.append(file, line)` lets inputs/buttons persist data with NO Shell Commands / headless layer. Read the file first to guard against duplicate headings; append-only; never rewrite. This collapsed a whole "phase 2" into phase 1 for react-capture.
- **Tabs = one note per stage** with a shared nav bar; a single note can't do real in-page tabs cleanly. Frontmatter `cssclasses: [dashboard]` scopes all CSS under `.dashboard` so nothing leaks into the rest of the vault — this is mandatory (Alyssa's vault has a heavy custom theme).
- **Full-width — the exact recipe (this comes up every time, save the steps):**
  1. Give the note(s) `cssclasses: [dashboard]` (or whatever class name) in frontmatter — Obsidian auto-applies it as a class on the note's container, scoping everything that follows to just those notes.
  2. Obsidian enforces "readable line length" via two invisible sizer elements: `.markdown-preview-sizer` (reading view) and `.cm-sizer` (edit/live-preview view). These cap content width and auto-center it — that's the mechanism, not a single global toggle.
  3. Override both, prefixed with your cssclass so it never touches other notes:
     ```css
     .dashboard.markdown-preview-view .markdown-preview-sizer,
     .dashboard .markdown-preview-sizer,
     .dashboard .markdown-source-view .cm-sizer,
     .dashboard .cm-sizer {
       max-width: none !important;
       width: 100% !important;
       margin-left: 0 !important;
       margin-right: 0 !important;
       padding-left: 16px !important;
       padding-right: 16px !important;
     }
     ```
  4. `!important` is required — these sizers carry inline-style-level specificity from Obsidian's own JS, a plain rule won't win.
  - This is a general Obsidian technique, not myPKA-specific — reusable in any vault, any snippet, for any note/class that needs to break out of the readable-width column.
- **Notes open in edit mode show raw code blocks.** Dashboard notes want reading view (Homepage plugin can force it).
- **Approving a carousel arc → storyboard, not prose.** Cover card + each slide as a compact mini-card in sequence beats a numbered wall of text; she skims the shape like previewing the real post.
- **Don't over-signal state.** One clear signal (whole-card recolor) beats three (card + corner label + chip). Alyssa cut the redundancy immediately.
- Larry verifies everything on the live vault via the Obsidian CLI (`Obsidian.com` + `dev:screenshot`), and back-up/restores the pitch sheet on every write test — build so that's easy (stable selectors, `data-*` attributes).
- **Standing convention, locked 2026-07-07 (house rule, not a one-off):** any dataviewjs block that does multiple sequential async file loads (`await dv.io.load(...)` or similar) must parallelize them via `Promise.all(...)` instead of awaiting one at a time. Sequential awaits widen the window where Obsidian's Reading-view progressive render shows raw, un-rendered source before the dataviewjs block finishes executing (a core Obsidian rendering limitation — this doesn't eliminate the flash, it minimizes it, and it costs nothing). Already applied in `dashboard/05 Approved.md`; apply it by default in every new or edited dataviewjs block going forward, not just where a flash was reported.
