---
agent_id: larry
session_id: second-brain-boh-content-import
timestamp: 2026-06-02T00:00:00Z
type: close-session
linked_sops: []
linked_workstreams: [WS-002-import-external-knowledge-base]
linked_guidelines: []
---

# BOH content import complete — all workbooks filed, format standard locked

## Context

Continued from the 2026-06-01 second-brain-build session. The skeleton was ready; this session was about filling it. Alyssa dropped every BOH workbook (plus the bots CSV and title generator sheet) and the team imported them all into `PKM/Second Brain/`. Significant mid-session course corrections led to a locked format standard that now lives in memory.

---

## What we did

- **Larry** processed P0 workbooks one at a time from MD exports: 0.2 Sign Off Specials, 0.3 Cozy Business Plan, 0.4 Quarterly Recap — strip broken images, strip empty answer tables, format per standard
- **Larry** processed 1.1 Email First Ecosystem from MD export
- **Larry** built `back-of-house/bots.md` from the Bots CSV Alyssa dropped — full roster of 11 bots across 4 departments, with descriptions in Alyssa's own words, module references, and links
- **Larry** filed the Blog Title Generator CSV (`3.1 Blog Title Generator.md`) in P3
- **Larry** executed a major structural refactor mid-session: renamed all 5 phase folders (`welcome` → `0. Welcome`, `phase-one-house-specials` → `1. The House Specials`, etc.), renamed all content files to `N.M Name.md` format, updated all wikilinks, INDEX tables, breadcrumbs, and the BOH master INDEX phase folders table
- **Larry** fixed Obsidian wikilink issues: `[text](#anchor)` TOC links → `[[#Heading|Display]]` format; HTML `<a name>` bot anchors → proper heading-based anchors; bots.md encoding corruption (caused by PowerShell Set-Content BOM) → full file rewrite via Write tool
- **Larry** launched 3 parallel subagents for the 14-docx batch: Agent 1 (P1: 5 files), Agent 2 (P2+P3: 5 files), Agent 3 (P4: 4 files) — all completed with correct format, content, and INDEX updates
- **Larry** did post-agent QA: spotted bracket issue in P1 module frontmatter (`"[1.2]"` instead of `"1.2"`) and missing `---` separator in P1 files; fixed both across all 5 files

---

## Decisions made

- **File naming:** `N. Phase Name` for phase folders, `N.M Module Name.md` for content files — both numbered for Obsidian sidebar ordering AND human-readable by name. No more `workbook-w1.1.md` slugs.
- **Quick Read framing:** "Surfaces in" replaces "When to use." These docs are Alyssa's teachable IP, not a copywriting style guide. Frame where the knowledge shows up in her content/teaching/business — never "use this when writing Alyssa's copy."
- **Obsidian TOC format:** `[[#Heading Text|Display Text]]` only. Standard markdown `[text](#slug)` anchors don't work in Obsidian for in-document navigation.
- **Bot wikilinks:** Always use exact heading text from bots.md — `[[bots#The Brand Bellhop]]` etc. HTML `<a name>` anchors don't work for Obsidian `[[file#anchor]]` navigation.
- **Never use PowerShell Set-Content for vault files:** It creates UTF-8 BOM which corrupts emojis and special chars in Obsidian. Always use the Write tool for vault file operations.
- **Parallel subagents for batch imports:** When 5+ files need the same treatment, launch parallel agents with self-contained prompts including full format standard, input→output path mapping, and exact INDEX strings to replace. Much faster, still quality-controlled with post-agent QA pass.

---

## Insights

- The parallel subagent pattern for batch document processing is highly effective — 14 docx files across 4 phases in ~10 minutes with consistent quality. The key is self-contained agent prompts that include the full format standard explicitly, not by reference.
- PowerShell `Set-Content -Encoding utf8` in Windows PowerShell 5.1 writes UTF-8 with BOM, which corrupts emojis and special characters in Obsidian. Use `[System.IO.File]::WriteAllText()` or the Write tool instead.
- Bot personality descriptions (Magnet Mixologist, Tab Opener, Copy Valet, Pin Keymaster) are rich voice training material — Alyssa's most characterful and specific writing. Worth flagging as priority source material when analysis/ gets built.
- The Buyer Persona in 0.3 Cozy Business Plan contains the most precise cross-program description of Alyssa's ideal client in her own words — highly reusable for any content written on her behalf.

---

## Realignments

- **"I don't approve this file naming — it's clunky and not helpful when looking at my Obsidian graph."** → Rebuilt folder and file naming to numbered prefix format (`0. Welcome`, `1.1 Email First Ecosystem.md`) so Obsidian sidebar sorts in course order. Human-readable names so you can find a doc without knowing its module number.
- **"The 'when to use' and ALL files here... these are my TEACHINGS to students, not just rules to follow — they're things I can share or insights I can teach."** → Reframed Quick Read from "When to use" to "Surfaces in" with IP-first framing. Updated memory and format standard.
- **"The content links do not work on my end."** → Switched Contents TOC from `[text](#anchor-slug)` to `[[#Heading Text|Display]]` Obsidian wikilink format.
- **"Bot wikilinks don't work on my end."** → Rebuilt bot anchor approach: removed HTML `<a name>` tags (Obsidian doesn't resolve these), added clean heading `### The Messaging Maitre-d` so `[[bots#The Messaging Maitre-d]]` resolves correctly.

---

## Open threads

- [ ] **BOH transcripts** — not yet imported. Next session starts here. Drop as MD or docx, label by module, batch in groups of 5+ for parallel agents.
- [ ] **4.2 Simple Socials** — docx was a title page only, no body content. Shell file created. Fill when transcript is available.
- [ ] **The Freebie Framework (1.4)** — separate workbook not yet imported. Slug `workbook-t3.md` still shows ❌ in P1 INDEX.
- [ ] **Notion vault imports** — Hook, RTO, segmentation vaults. Mack's Notion API path, waiting on setup.
- [ ] **NotebookLM Chrome extension** — Alyssa to test `NotebookLM to LaTeX & MD`. If it works, set download folder = vault.
- [ ] **me.md** — not built yet. Rebuild after `examples/` is populated.
- [ ] **Lint workstream** — define as WS-NNN before vault grows unwieldy.
- [ ] **examples/ and analysis/** — not started. Build order: programs → examples → analysis → templates.

---

## Next steps

1. Drop BOH transcripts (MD or docx, labeled by module) — batch 5+ at a time for parallel agents
2. Larry files each as `N.M Module Name Transcript.md`, flips INDEX to ✅
3. Once all transcripts in: move to `examples/` — BOH sales page copy is first
4. Freebie Framework workbook whenever Alyssa locates it

---

## Cross-links

- `[[2026-06-01_larry_second-brain-build]]` — prior session where skeleton was built, format decisions first made, north star confirmed
