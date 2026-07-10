---
agent_id: larry
session_id: internal-skills-discoverability
timestamp: 2026-07-07T15:00:00Z
type: close-session
linked_sops: ["SOP-031-watch-video", "SOP-032-apply-ponytail-ladder"]
linked_workstreams: ["WS-003-install-an-expansion"]
linked_guidelines: ["GL-008-ponytail-lazy-senior-dev-philosophy"]
---

# Internal Skills system: two installs, one discoverability fix

## Context

Session started with a request to install `github.com/bradautomates/claude-video` "not in claude skills but the larry way." That single install exposed a bigger, recurring problem — team members (and fresh agent instances across hosts) keep hunting in native `.claude/skills`/host skill registries and coming up empty, because this myPKA's capabilities never lived there. The session ended up building the actual discoverability fix, not just one install.

## What we did

- **Larry** packaged `bradautomates/claude-video` as `Expansions/claude-video/` (connector type) via [[WS-003-install-an-expansion]] — Vex-equivalent security sweep clean (no committed tokens, MIT license), auto-numbered [[SOP-031-watch-video]] (default owner Mack), indexed in both [[Expansions/INDEX]] and `Team Knowledge/SOPs/INDEX.md`. Logged separately at `[[2026-07-07-13-00_larry_install-claude-video-v0.2.0]]`.
- User asked about `/BenAl-Obsidian-Plugin:setup` — not found anywhere (not installed, not on GitHub, not in this project). No source to act on; deferred, not installed.
- Fixed a broken Markdown table in `Team Knowledge/SOPs/INDEX.md` — three stray blank lines (after SOP-012, SOP-013, SOP-020) were splitting it into disconnected fragments that rendered as broken text past the first break. Now one continuous table, SOP-001 through SOP-032.
- User surfaced the real gap: asked where installed skills "live" and how team members should find them, since they kept looking in native `.claude/skills`. **Larry** added an "Internal Skills" section to root [[AGENTS]] (after Expansion Install Triggers) defining SOPs+Expansions as the vault's actual skill system, plus a self-healing rule: any agent that dead-ends in a native skills folder leaves a redirect note there. Seeded `.claude/skills/README.md` as the first breadcrumb (also flagged that `brand-brief/`, `content-coach/`, `post-writer/`, etc. subfolders there are empty Blotato-shaped stubs, not live capabilities).
- Investigated "ponytail" and "blotato" on request. Found: ponytail was already integrated as [[GL-008-ponytail-lazy-senior-dev-philosophy]] (2026-07-05, sourced from `DietrichGebert/ponytail`) but had no trigger contract — a fresh instance had no way to connect the word "ponytail" to it. Blotato was deliberately never installed raw per its own intake manifest ([[Deliverables/2026-07-05-social-skills-repo-intake/manifest]]) — only vendor-reference `SKILL.md` copies were extracted, pending a proper Content OS/Hermes adaptation pass.
- User: "why don't we just make it an internal skill like all others" — correct call. **Larry** wrapped the existing GL-008 doctrine as `Expansions/ponytail/` (agent_pack, zero code footprint, doesn't duplicate GL-008's content) with a new discoverability SOP, auto-numbered [[SOP-032-apply-ponytail-ladder]]. Logged separately at `[[2026-07-07-14-00_larry_install-ponytail-expansion-v1.0.0]]`.
- **Real-world test failed:** a separate session was asked to "use the ponytail skill" and answered "I don't have a skill called ponytail... (fable-prompt-builder? something else?)" — it checked Claude Code's native Skill-tool registry, never `Team Knowledge/SOPs/INDEX.md`. Root cause: the AGENTS.md rule was buried ~200 lines into the document, too far down to reliably override the native skill-lookup instinct. **Fix:** moved a condensed, MANDATORY version of the rule into the Identity overlay section at the very top of [[AGENTS]] — the one section proven to get followed every session (it's why "I'm Larry" works reliably). Explicitly named as the section to check *before* ever telling the user a capability doesn't exist.

## Decisions made

- **Question:** Package third-party GitHub tools as native Claude Code plugins, or as myPKA Expansions?
  **Decision:** Always Expansions + SOP, per the explicit "the larry way" instruction — one install works across every host (Claude Code, Codex, Cursor, Gemini CLI) instead of a per-host native install.
- **Question:** Does a Guideline (like GL-008) need its own bespoke trigger-wiring mechanism to be callable by name?
  **Decision:** No — fold it into the same Expansions + SOP pipeline as everything else. No more one-off Guideline-trigger patches; "would every agent/host know what to do with this" always routes through the same on-ramp.
- **Question:** Where does the skill-discoverability rule need to live in AGENTS.md to actually get followed?
  **Decision:** In the mandatory Identity overlay at the top, not buried in a later section — placement matters as much as the rule's existence when competing against a strongly-trained native behavior (checking the host's own skill registry).

## Insights

- **A rule's position in AGENTS.md affects compliance as much as its content.** The Identity overlay section (top of file, marked MANDATORY) gets followed reliably every session; a rule 200 lines down competing against a strongly-trained native instinct (checking the Skill tool's own registry) does not, even when clearly written. Any future "make X reliably followed" fix should default to strengthening placement, not just wording.
- **A Guideline with no SOP pointing to it is invisible to trigger-based discovery**, even though its content technically exists in the vault — Guidelines need a callable SOP wrapper to join the Internal Skills system. Generalizes to any future GL-NNN the team wants callable by name.
- Instruction-following via AGENTS.md is a strong lever, not a guarantee — told the user this directly rather than overpromising a "fixed forever" outcome.

## Realignments

- User, on the ponytail Guideline-vs-Skill question: "why don't we just make it an internal skill like all others, stop complicating." Correct redirect — applies going forward as the default: any "make X discoverable/callable" request goes through Expansions + SOP, no bespoke mechanism proposals.
- User, after the real-world ponytail lookup failure: "i thought this wouldnt happen anymore" — surfaced that the earlier AGENTS.md fix was under-strength (right rule, wrong placement). Corrected by relocating the rule to the Identity overlay.

## Open threads

- [ ] **Blotato social-skills set** (brand-brief, content-coach, post-writer, post-grader, post-scheduler, viral-hooks, repurpose) — user said "coming back to that in 1 sec" and never returned before wrap. Needs the Content OS/Hermes adaptation pass per the intake manifest's own rule (no raw installs). Next session should pick this up first.
- [ ] `/BenAl-Obsidian-Plugin:setup` — no source found (not GitHub, not installed). Dead end unless the user provides a path/marketplace/zip.
- [ ] The Internal Skills placement fix has not been re-tested against a fresh session since the relocation. Worth a real check next time the opportunity arises naturally (don't manufacture one).

## Next steps

- Pick up Blotato adaptation first next session — it's the oldest open thread and the user has asked about it twice.
- Any future "make X callable/discoverable" request defaults to Expansions/ + SOP with no separate discussion needed (per this session's realignment).

## Cross-links

- `[[2026-07-07-13-00_larry_install-claude-video-v0.2.0]]`
- `[[2026-07-07-14-00_larry_install-ponytail-expansion-v1.0.0]]`
- `[[2026-07-05-1400_Larry_ponytail-integration]]`
