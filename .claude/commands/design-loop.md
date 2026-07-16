---
description: Pixel-verified design iteration for Obsidian CSS and dashboards. No guessing, no screenshot ping-pong.
---

# /design-loop: measured design iteration

History shows design sessions are Alyssa's single biggest source of frustration: long screenshot ping-pong, guessed hex codes, changes that regress other things. This command enforces the working method that actually went well.

## Hard rules (from Alyssa's own corrections)

1. **Measure, never eyeball.** Every color, size, and spacing value comes from the live DOM or from measuring her reference screenshot. Use the obsidian-cli skill (screenshot, run JavaScript, inspect DOM) to read exact computed values. Never describe a color in words when a hex code is available.
2. **One batch, one render.** Collect ALL of her notes for the round, number them back to her, fix every one, then show ONE fresh screenshot. Never fix one item and re-render five times.
3. **Do your own review too.** After her list, do an independent frame-by-frame comparison against the reference and add anything she missed. She has asked for this explicitly.
4. **Before and after proof.** Every round ends with a side-by-side statement: item number, what it was (exact value), what it is now (exact value), screenshot.
5. **Save the system.** Any token she approves (color, font, size) gets written into the vault design system record the same session ([[project_vault_design_system]] location: Iris's journal). She has been burned by approved values not being saved.
6. **Design system scope.** Vault UI follows the oat/linen design system. Public-facing pages get their own look (Alyssa ruling, 2026-07-16 commit).

## Loop

1. Get the reference (her screenshot or a linked example). Measure it first: extract the exact values you will target.
2. Screenshot current state via obsidian-cli. Diff against target. List the gaps with measured values.
3. Apply the whole batch of changes to the snippet or CSS file.
4. Reload, screenshot, verify each numbered item, present proof.
5. Repeat only on her new notes.

Route the actual work to Iris when it is design-system authorship; do it directly when it is mechanical CSS matching.
