---
name: "source-command-loop"
description: "Content OS auto-advance loop. Polls the newest weekly pitch sheet for approvals and, on each trigger, dispatches the correct maker (Cass for arcs, Hermes for drafts) via the Agent tool so approved stages advance without a human relay. Implements Studio/Content/dashboard/PIPELINE-CONTRACT.md. This is the mechanism that works here because the headless `Codex -p` CLI is not installed (verified 2026-07-09)."
---

# source-command-loop

Use this skill when the user asks to run the migrated source command `loop`.

## Command Template

# /loop — Larry-driven pipeline auto-advance

Alyssa's order: "make approval auto advance." When she approves a stage in the
dashboard, the next maker runs automatically and writes its output back where the
dash renders it. The clean version is a background daemon shelling out to
`Codex -p`, but that binary is not available in this environment (see
`Studio/Content/dashboard/advance-watch.mjs` header for the verification). So Larry IS the loop:
this command runs the detector, then dispatches the makers via the Agent tool.

Contract: `Studio/Content/dashboard/PIPELINE-CONTRACT.md`. Detector: `Studio/Content/dashboard/advance-watch.mjs`.

## One pass (default)

1. **Detect.** Run:
   ```
   node "Studio/Content/dashboard/advance-watch.mjs" --once --json
   ```
   Parse the `pending` array. Each entry is `{ trigger, stage, maker, dayKey, title }`.
   If `pending` is empty, report "pipeline caught up" and STOP — nothing to advance.

2. **Re-read guard (buffer race).** Before dispatching, note the sheet's current
   contents. If Alyssa is mid-edit in Obsidian, her approval may not be flushed to
   disk yet — the detector reads disk. If a trigger looks stale or half-written,
   wait one poll (~10s) and re-run step 1. Never dispatch on a half-saved sheet.

3. **Dispatch, idempotently, one maker per pending entry.** For each entry, get the
   exact maker prompt from the detector module (it reproduces the makers' mandatory
   file-loads and hard rules verbatim):
   - `trigger 1 / stage arc` → dispatch **`subagent_type: cass`** with `arcPrompt({sheetPath, dayKey, title})`.
   - `trigger 2 / stage draft` → dispatch **`subagent_type: hermes`** with `draftPrompt({sheetPath, dayKey, title})`.

   To fetch a prompt string without hand-copying it, run:
   ```
   node -e "import('./Studio/Content/dashboard/advance-watch.mjs').then(m=>console.log(m.arcPrompt({sheetPath:process.argv[1],dayKey:process.argv[2],title:process.argv[3]})))" "<sheetPath>" "<DAYKEY>" "<title>"
   ```
   (swap `arcPrompt`→`draftPrompt` for drafts). Pass that string as the Agent task.

   Multiple pending entries with no dependency between them may be dispatched in
   parallel from a single message. Do NOT dispatch a draft for a post whose arc is
   being built in the same pass — let the arc land first, pick up the draft next pass.

4. **Verify the write landed on-contract.** After each maker returns, re-run the
   detector. That same pending entry MUST now be gone (the downstream block exists).
   If it is still pending, the maker wrote off-contract (wrong section header or a
   title that doesn't string-pair). Fix the section/title, do NOT re-run the maker
   blindly — a duplicate block is worse than a missed advance.

5. **Log the advance.** For each entry that successfully advanced, append one line
   to the sheet's `## Dashboard reacts` section, exactly:
   ```
   - [YYYY-MM-DD HH:MM] auto · <stage> · <title> · advanced
   ```
   Use `reactsLogLine({stage, title})` from the module to get the exact string.

## Continuous mode

If Alyssa says "keep looping" / "run the loop", repeat the one-pass cycle after a
~10s wait, until `pending` is empty for two consecutive passes, then stop and report.
Do not spin faster than the detector's 10s poll — each pass that dispatches a maker
costs real tokens (a full Cass or Hermes context load). Empty passes are cheap
(one `node` call), so idle polling is nearly free.

## Hard rules (carried from the contract + GL-010)

- Never CTA to or mention **Unignorable Subject Lines** (no checkout/wiring).
  **Pinterest** is the only live chat word this cycle. Both maker prompts enforce this.
- Larry's gate is mechanical only: makers own the craft, Alyssa owns taste. Do not
  editorialize a maker's output — just verify it landed on-contract and log it.
- Never invent prices/chat words. Makers flag blanks; surface those to Alyssa.
- The detector and this command only ever touch the **newest** `YYYY-Www-pitch.md`.
