---
date: 2026-04-04
tags:
  - ai
---
# 6 Ways to Cut Claude Token Usage in Half

Claude Code-specific tips from Sabrina Ramonov. Complementary to [[2026-04-10-how-to-stop-hitting-claude-usage-limits]].

**1. Stop Using Opus for Everything.** Type `/models` in Claude Code. Switch based on task complexity.
- Opus: complex multi-file refactors, architecture decisions, gnarly debugging
- Sonnet: writing tests, simple edits, explaining code, most daily work
- Haiku: quick lookups, formatting, renaming, anything repetitive

**2. Clear Your Context Between Tasks.** Every time you hit enter, Claude Code ships tons of system context first. The longer the session runs, the more bloated it gets.
- `/clear` between unrelated tasks — wipe the slate
- `/compact` before something big — squeezes conversation to just the important parts

**3. Use CLI Tools Instead of MCP.** If a CLI exists, use it over MCP. Faster and cheaper. GitHub: `gh` CLI works better and eats fewer tokens than the GitHub MCP server. MCP tools inject their full schema into context on both sides. Rule: CLI and Skills where possible. MCP if there's no alternative.

**4. Install the Context-Mode Plugin.** [Open source](https://github.com/mksglu/context-mode) — keeps raw MCP tool output from flooding your context window. Cuts MCP token usage by 50-90%.

**5. Keep Your CLAUDE.md Lean.** CLAUDE.md gets injected into EVERY single request. Give it 5 rules and point it to the details when needed. Claude reads linked files only when working on something relevant — not every turn.

**6. Run Claude Code for FREE With Ollama.** $0 forever, fully local, no usage caps. Install Ollama, pull `qwen3-coder`, set:
```
export ANTHROPIC_BASE_URL=http://localhost:11434/v1
export ANTHROPIC_MODEL=qwen3-coder
```
Limits: no prompt caching, quality gap vs Opus on hard problems. Best for lighter tasks.

**Related notes**
- [[2026-04-10-how-to-stop-hitting-claude-usage-limits|Stop Hitting Claude Usage Limits]]

**Connections:** [[ai-tools]] [[pkm]]

*[Source](https://www.sabrina.dev/p/6-ways-i-cut-my-claude-token-usage)*
