---
agent_id: larry
session_id: obsidian-vault-css-redesign
timestamp: 2026-07-07T22:00:00Z
type: close-session
linked_sops: []
linked_workstreams: []
linked_guidelines: ["GL-003-design-system"]
---

# Obsidian vault aesthetic redesign — locked oat/linen card system after a long debugging saga

## Context

Alyssa wanted a full Obsidian vault redesign from scratch, modeled on kristenbouchard's inspo vault (fonts, colors, tags, folder colors, minimal chrome, hover-reveal properties panel). Session started clean with a planning phase, then hit a rough patch: Larry jumped to execution once, got corrected hard, reset to plan-first. The bulk of the session was CSS trial-and-error — much of it inefficient blind guessing that visibly frustrated Alyssa before the team found the right debugging approach.

## What we did

- Larry built and iterated CSS snippets in `.obsidian/snippets/`: `colors.css`, `fonts.css`, `heading-font.css`, `tabs.css`, `folder-colors.css`, `hide-ui.css`, `properties-panel.css`.
- Larry diagnosed and fixed a multi-cause tab-bar-disappearing bug: root cause was `.view-header-title-container { opacity: 0 }` hiding tab label text under AnuPpuccin's native Card Layout, compounded by manual `.workspace-leaf` card CSS colliding with the theme's own card engine, and separately a border color set nearly identical to its background.
- Larry switched the vault's structural approach mid-session: initially hand-rolled `.workspace-leaf` borders/margins for the floating-card look, then discovered AnuPpuccin has a **native Card Layout variant** (Style Settings → Workspace → Workspace Layout → Card) that does this correctly — removed the hand-rolled version once the native toggle was confirmed working.
- Larry fixed folder-visibility bugs: `_system`, `Expansions`, `scripts` folders were reappearing because `userIgnoreFilters` in `app.json` no longer hides items from the file explorer in modern Obsidian (it only affects search/graph) — moved the hides into `hide-ui.css` instead.
- Larry saved the finalized design system as a journal entry in Iris's own folder (`Team/Iris - Design System Architect/journal/2026-06-13-obsidian-vault-design-system.md`), correctly scoped as separate from GL-003 (which governs outward-facing brand/content design, not the Obsidian app's own interface theming).
- Larry cleaned up a memory duplication (an auto-saved `project_vault_design_system.md` and a redundant Larry-created one) down to one canonical memory entry pointing at Iris's journal.

## Decisions made

- **Question:** Where does the vault theming design system live — GL-003 (Iris's brand-content design system) or somewhere specialist-specific?
  **Decision:** Lives in Iris's own journal, not GL-003. GL-003 stays scoped to outward-facing content (Charta/Pixel deliverables); vault app-chrome theming is a separate concern.
- **Question:** Should tag/folder colors use descriptive names (e.g. "sage") or hex-only?
  **Decision:** Hex-only. Alyssa found the descriptive name for `#c1d17c` ("sage") misleading — she reads it as dusty green, not sage. Noted in memory to prevent recurrence.
- **Question:** Card layout structure — hand-rolled CSS or AnuPpuccin's native Card Layout variant?
  **Decision:** Native Card Layout variant. Hand-rolled `.workspace-leaf` CSS repeatedly collided with the theme's own layout engine and was the root cause of the worst debugging loop this session.

## Insights

- AnuPpuccin's Card Layout variant should be the first thing checked/enabled when attempting a floating-card aesthetic in this theme — attempting to fake it with manual CSS borders/margins is fragile and collides with the theme's internal structure.
- `userIgnoreFilters` in Obsidian's `app.json` is legacy — it no longer hides items from the file explorer in current Obsidian versions, only from search/graph. Folder/file hiding must go through CSS (`display: none` in a snippet) instead.
- When a CSS bug's cause isn't obvious from reading the file, a DevTools inspect (Ctrl+Shift+I → Console, targeted `getComputedStyle` query) finds the real cause far faster than iterative guess-and-reload — graduated to a durable feedback memory this session ([[feedback-css-debugging-approach]]) after the pattern cost significant trust.

## Realignments

- Alyssa, early session: *"i aleways wanna plan unless i say DO IT like fkn ell"* — Larry had jumped to file changes before confirming a plan; reverted immediately, replanned, and only executed after an explicit "DO IT."
- Alyssa, mid-session, after repeated failed CSS fixes: *"it kinda feels like youre making stuff up now"* — Larry had guessed at a Style Settings feature ("Card Shadows") that didn't actually exist as a named toggle. Corrected by only stating what was confirmed present in Alyssa's own screenshots of the Style Settings panel going forward.
- Alyssa, later, after a long unproductive debugging stretch: *"i dont hink larry is the man for the job this is going SO badly"* — Larry stopped blind-guessing, proposed a direct DOM-inspection approach, and that method found the real bug within the next couple of exchanges.
- Alyssa, on saving the finalized system: *"i believe it shoudl be saved with the design team memebr somewhere"* — Larry had default-saved it to general memory only; moved it into Iris's actual journal folder to match the scaffold's convention that specialist-owned knowledge lives with the specialist.

## Open threads

- [ ] Calendar plugin sizing — Alyssa's calendar renders larger than the inspo's; flagged as low priority, not yet addressed.
- [ ] Minor card-border corner-gap artifact — mostly resolved via `overflow: hidden`, small visual notch may remain in some views.
- [ ] Dashboard/Bases card-gallery home page — explicitly scoped to a future project, not started.
- [ ] Custom Frames plugin setup — explicitly scoped to later, not started.
- [ ] Colored Tags plugin — Alyssa needs to enter the 5 hex codes into the plugin's own settings UI (not a file Larry can edit).
- [ ] Consider whether a dedicated vault-design specialist hire (GL-003 "Designer Expansion" slot, currently unfilled) would prevent repeat debugging marathons like this session's — raised by Larry mid-session, not yet actioned via Nolan.

## Next steps

- Any future vault UI work (dashboard, Bases gallery, Custom Frames) starts by reading Iris's `2026-06-13-obsidian-vault-design-system.md` journal entry before touching CSS.
- If another vault CSS bug appears, default to DevTools inspection first per [[feedback-css-debugging-approach]] rather than iterative guessing.

## Cross-links

- `[[2026-07-07-21-30_iris_arc-cover-duplicate-and-spacing-fix]]` — most recent prior session log (different workstream, WS-011 dashboard).
