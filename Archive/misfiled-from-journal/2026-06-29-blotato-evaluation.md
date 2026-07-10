---
date: 2026-06-29
tags:
  - tools
  - evaluation
  - content-repurposing
  - ai
note: team-written file misfiled in Alyssa's journal; relocated 2026-07-10 per journal integrity audit
---
# Blotato Claude Skills — Mack Evaluation

**Source:** [Blotato Claude Skills](https://help.blotato.com/claude-skills/claude-skills)
**Action tier:** evaluate → completed 2026-06-29

## What it is

Blotato is a content repurposing tool with free Claude Code/Cowork skills. The skills chain together:
- `content-coach` — orchestrator
- `brand-brief` — voice/brand context
- `post-writer` — writes platform-specific posts
- `post-grader` — scores posts (hook strength weighted 50%)
- `post-scheduler` — schedules via Blotato MCP (optional; falls back to file output)
- `repurpose` — turns one long piece into 3 LinkedIn posts + 5 X threads + 2 short-form video scripts
- `viral-hooks` — library of 100 proven hooks

Works in Claude Code, Claude Desktop, and Claude Cowork. Free to download.

## Verdict for Alyssa

**Partial fit.** The skills framework is solid and the free skills work in Cowork right now. But the default output targets (LinkedIn, X, short-form video) are wrong platform for Alyssa's workflow. Her repurposing is **email → Instagram carousel**, not email → LinkedIn.

**What IS useful:**
- `brand-brief` skill concept — we could build our own version that loads Wren's memory.md as context
- `post-grader` hook scoring approach — worth adapting for Wren's carousel hook evaluation
- `viral-hooks` library — Wren could use this as reference

**What to skip:**
- Blotato MCP for scheduling — she uses Kit, not Blotato's scheduler
- The LinkedIn/X/video repurpose outputs — wrong channels

## Recommended action

Don't install Blotato MCP. The skills are free but the platform targets are wrong. Instead: flag `viral-hooks` library for Wren to review. The hook scoring approach is worth pulling into our carousel-framework.md. Mack: no integration needed.

**Connections:** [[automation]], [[content-repurposing]]
