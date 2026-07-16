---
agent_id: iris
session_id: bases-and-canvas-styling-2026-07-11
timestamp: 2026-07-11T13:30:00Z
type: end-of-session
linked_sops: []
linked_workstreams: []
linked_guidelines: [GL-013-the-house-rules]
mined: true
---

# Styled the three new root surfaces (Journal cards, Open tasks, House canvas) to the vault design system

## What I did

New snippet [[.obsidian/snippets/bases-and-canvas.css|bases-and-canvas.css]], enabled in `appearance.json`. It styles only Bases views and Canvas: every rule is scoped under `.workspace-leaf-content[data-type="bases"]`, `.workspace-leaf-content[data-type="canvas"]`, or `.bases-embed`, so nothing can leak into regular notes. Built to the locked system in [[Studio/Team/Iris - Design System Architect/journal/2026-06-13-obsidian-vault-design-system]]: oat cards on the linen frame, 1.5px dark hairline borders, 10px radius, AT KING titles, Karla body, Roboto Mono micro-labels, box-shadow none everywhere (same `--input-shadow` lesson dashboard.css documents). No data logic in [[Journal cards.base]] or [[Open tasks.base]] was touched; [[House.canvas]] was not edited at all.

## Honest limitation, and the exact QA to run

This build session had no shell tool, so I could not run the Obsidian CLI (`obsidian eval`, `dev:errors`) to inspect the live DOM, which the vault's measure-do-not-eyeball rule normally requires. Substitute evidence: class names were harvested from CSS shipped inside this vault's own installed plugins and themes (pretty-properties styles.css, colored-tags main.js, Minimal theme), which are written against this Obsidian build. Confirmed that way: `.bases-view`, `.bases-table`, `.bases-table-container`, `.bases-td`, `.bases-table-cell`, `.bases-rendered-value`, `.bases-cards-line`, `.bases-cards-property`, `.canvas-node-container`, `.canvas-node-label`, `.canvas-wrapper`, `.canvas-controls`, `.canvas-card-menu`. Unverified locally (standard names, written to no-op silently if wrong): `.bases-toolbar`, `.bases-header`, `.bases-tr`, `.bases-th`, `.bases-cards-container`, `.bases-cards-item`, `.bases-cards-group`, `.bases-cards-label`, `.canvas-group-label`, `.canvas-edge-label`.

Whoever has a shell next should run, from the vault:

1. `obsidian open path="Journal cards.base"` then `obsidian eval code="getComputedStyle(document.querySelector('.bases-cards-item')).backgroundColor"` and expect `rgb(252, 250, 245)`. If the selector returns null, run `obsidian eval code="document.querySelector('.bases-view').innerHTML.slice(0,600)"` to read the real card class and rename it in the snippet (one-line fix).
2. Same check on `Open tasks.base` table view: `.bases-th` computed font-family should contain `Roboto Mono`, `.bases-td` background `rgb(252, 250, 245)`.
3. `obsidian open path="House.canvas"` then check `.canvas-node-container` computed `borderRadius` is `10px` and `boxShadow` is `none`, and the canvas floor reads linen `rgb(238, 230, 222)`.
4. `obsidian dev:errors` clean after all three.

## Cross-references

- [[.obsidian/snippets/dashboard.css]], the scoping precedent and the shadow lesson.
- [[Studio/Team Knowledge/session-logs/2026/07/2026-07-10-21-30_felix_home-dashboard-build]], the HOME build this follows.
- [[HOME]], which links to all three surfaces this session styled.
