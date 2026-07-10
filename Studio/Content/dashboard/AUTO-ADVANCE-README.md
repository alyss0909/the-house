# Auto-Advance — how approvals move themselves down the pipeline

Built by Mack, 2026-07-09. Implements `Studio/Content/dashboard/PIPELINE-CONTRACT.md`.

## What it does

You approve a stage in the dashboard. The next maker runs on its own and writes
its output back into the pitch sheet, right where the dash renders it. No copying
between people, no "ok now go build the arc" relay.

- Approve a **concept** (it turns `✓`) → the **arc** gets built for it (Cass).
- Approve an **arc** (it gets `[approved]`) → the **draft** gets written (Hermes).
- A draft marked `[shipped]` is done — nothing runs after it.

It never re-runs a stage that already has its output (idempotent), and it only ever
touches the **newest** `Studio/Content/YYYY-Www-pitch.md`.

## Which mechanism you have

There are two possible engines. Which one is live depends on your machine.

| Engine | Needs | Status here (2026-07-09) |
|---|---|---|
| **A. Background daemon** — spawns the makers itself via `claude -p` | a headless `claude` CLI installed | **NOT available.** No `claude` binary, npm global, or npx path exists on this machine. The daemon cannot run. |
| **B. Larry-driven `/loop`** — Larry dispatches the makers via the Agent tool | nothing extra; works in Claude Code today | **This is what you use.** |

If a headless `claude` CLI is ever installed, Engine A can be switched on by flipping
`RUN_MODE` in `Studio/Content/dashboard/advance-watch.mjs` and wiring the included `spawnMaker` stub.
Until then, use Engine B below.

## How to turn it ON (Engine B — what you have)

In your Claude Code chat with Larry, say:

> **/loop**

That's it. Larry checks the newest pitch sheet, finds anything you've approved that
hasn't advanced yet, runs the right maker for each, writes the result back into the
sheet, and logs each advance under `## Dashboard reacts`.

To keep it advancing continuously as you approve things, say:

> **run the loop until it's caught up**

Larry re-checks every ~10 seconds and stops once there's nothing left to advance.

### Peek without advancing anything

To just see what's pending — read-only, changes nothing:

```
node "Studio/Content/dashboard/advance-watch.mjs" --once
```

To watch it live (prints whenever the sheet changes; still read-only):

```
node "Studio/Content/dashboard/advance-watch.mjs" --watch
```

Optional npm shortcuts — add these to a `package.json` in `Studio/Content/dashboard/` if you want
`npm run advance` instead of the full node command (not required):

```json
{
  "scripts": {
    "advance": "node advance-watch.mjs --once",
    "advance:watch": "node advance-watch.mjs --watch"
  }
}
```

## How to turn it OFF

- **Engine B / `/loop`:** it's not a background process — it only runs when you say
  `/loop`. To stop, just don't say it again. If you asked Larry to "run until caught
  up," say **"stop the loop"** and he stops after the current maker finishes.
- **The `--watch` detector** (if you started it in a terminal): press **Ctrl-C**. It
  holds no locks and writes nothing to the sheet, so killing it mid-run is always safe.

## What it costs

- **Peeking / watching** (`--once`, `--watch`): effectively free — one small `node`
  read of one file, no model tokens.
- **Advancing** costs real model tokens each time a maker runs: a full Cass (arc) or
  Hermes (draft) context — each loads her real slides + analysis + source files per
  its agent contract. Budget one maker's worth of tokens per post per stage. Empty
  passes (nothing to advance) are nearly free, so leaving `/loop` polling while you
  work is cheap; the cost only lands when you actually approve something.

## Risks / things to watch

1. **Obsidian buffer vs disk (the known race).** The detector reads the sheet from
   **disk**. Obsidian keeps your unsaved edits in an **editor buffer** and only writes
   them to disk on save (or after autosave). If you approve a stage and the loop reads
   the file before Obsidian has saved, it sees the old bytes and does nothing that
   pass — it picks the approval up on the next ~10s poll once the buffer flushes. The
   detector never writes, so the worst case is a one-cycle delay, never a lost or
   doubled advance. If an approval seems ignored, **Ctrl-S in Obsidian** and it moves.
2. **Off-contract writes blank the dash.** If a maker ever writes an arc under the
   wrong header (this happened 2026-07-09: arcs under `## Approved — substance arcs`
   instead of `## Approved — slide skeletons`), the dashboard goes blank for that
   stage. `/loop` step 4 re-checks after each maker and catches this — the pending
   entry stays pending until the block is on-contract. Never fix it by re-running the
   maker (that risks a duplicate block); fix the header/title in place.
3. **Idempotency is by title string.** A stage advances only if the downstream block
   with the **same day + title** is missing. If a maker's heading title drifts from the
   concept title, the loop thinks the post hasn't advanced and may run the maker again.
   Titles must match verbatim across stages (the contract requires this; the detector
   normalizes Friday/FTG concept lines that pack title + description on one line).
4. **Tokens on a tight loop.** Don't run continuous mode faster than the 10s poll.
   Each dispatching pass costs a maker's context; empty passes are cheap.

## The moving parts

- `Studio/Content/dashboard/PIPELINE-CONTRACT.md` — the contract (sections, blocks, approval marks, triggers).
- `Studio/Content/dashboard/advance-watch.mjs` — the trigger **detector** + the maker **prompts** (reproduce Cass's and Hermes's mandatory loads and rules). Read-only against the sheet.
- `.claude/commands/loop.md` — the `/loop` command Larry runs to dispatch the makers.
