---
agent_id: larry
session_id: understand-open-source-install-and-keep-capture-project
timestamp: 2026-07-17T22:45:00Z
type: close-session
linked_sops: []
linked_workstreams: []
linked_guidelines: []
---

# Installed understand-open-source the house way, then scoped Alyssa's own Keep capture project

## Context

Alyssa ran `/install` on github.com/grandamenium/understand-open-source and asked for it both the house way (Claude Code skill) and "the non-Claude-exclusive way too." After install and a live test on KeepSidian, the session turned into scoping a real future project: her own Google Keep capture layer, because KeepSidian's re-auth keeps breaking and its smart features are gated.

## What we did

- Larry ran due diligence on understand-open-source: thin Claude Code skill (one SKILL.md, single commit, no license), real engine is two external tools.
- Larry caught that `npm install graphify` pulls the WRONG package (an unrelated "Random Graph Generator"); the real tool is `graphifyy` on PyPI (command `graphify`). opensrc is real on npm.
- Larry installed the skill + a thin command wrapper into `.claude/skills/understand-open-source/` and `.claude/commands/understand-open-source.md`, adapted to house rules and with the graphify trap documented.
- Larry installed the two engine tools globally (opensrc via npm, graphifyy via pip) after Alyssa approved the gated system install.
- Larry tested end to end on leftpad (smoke) then KeepSidian (real): opensrc downloaded source, graphify built a 1382-node graph, Larry read the flagged files and wrote a self-contained HTML teardown report. Fixed two upstream errors in the skill (graphify output lands inside `$SRC`, not the run dir; corrected the graphify install line).
- Larry read KeepSidian's real source and confirmed Alyssa's existing memory: interval is client-side/free, auto-tagging is server-side/Stripe-gated. Surfaced the exact endpoints and the two-layer gate.
- Larry scoped the future project [[own-keep-capture]] in Notebook/Life/Projects, wired it to [[systematize-socials]] and the Projects INDEX, and saved the teardown report alongside it as the project's architecture reference.

## Decisions made

- **Question:** Should the "non-Claude-exclusive" standalone version be built?
  **Decision:** No. Alyssa chose to skip it and use Claude for the skill. Only the Claude Code skill + engine tools were installed.
- **Question:** Should Alyssa's own Keep tool replace Keep or build on it?
  **Decision:** Build on it. Keep is her main capture surface (phone-first) and stays. Direction 2: reuse the raw Keep pull, own the tagging/titles/routing/watchdog layer on top.
- **Question:** Bump the KeepSidian re-auth task priority now?
  **Decision:** No. Alyssa cannot fix it right now; leave [[tsk-2026-07-16-001-keepsidian-google-reauth]] as is.

## Insights

- Reading a tool's real source turns fuzzy knowledge into an actionable API map. The KeepSidian teardown gave us its full server contract and the exact free-vs-paid line, which is the head start for the own-keep-capture build. This X-ray move is reusable on any dependency (Composio, Kit, etc.).
- The recurring KeepSidian re-auth pain is inherent, not a plugin flaw: Google Keep has no official API, and the `oauth2_4` master token Google periodically kills is the root cause. Any homemade version inherits it. The honest design goal is loud failure (staleness watchdog) plus fast recovery, not eliminating re-auth.

## Realignments

- Alyssa on the standalone version: "maybe just skip it and i'll use claude for it."
- Alyssa on the north star: "no its specifically about google keep its my main capture place." (Settled Direction 2, not escaping Keep.)
- Alyssa on the re-auth task: "dw about keepsydian i cant fio rn." (Leave the task; do not bump.)

## Open threads

- [ ] `own-keep-capture` remains in planning. First real move when it activates: decide the raw-pull source (KeepSidian free endpoint vs thin gkeepapi script), then build the smallest slice (pull + her-language tagging + staleness watchdog).
- [ ] [[tsk-2026-07-16-001-keepsidian-google-reauth]] still open. Capture is dead until re-auth, but Alyssa is not fixing it right now by her call.

## Next steps

- None queued by Alyssa. `own-keep-capture` waits until she greenlights a build; the re-auth task waits on her.

## Cross-links

- `[[2026-07-17-22-15_larry_github-backup-and-push-on-close-habit]]` — the prior session this evening.
- `[[own-keep-capture]]` — the project scoped this session.
- `[[tsk-2026-07-16-001-keepsidian-google-reauth]]` — the open pain this project addresses.
