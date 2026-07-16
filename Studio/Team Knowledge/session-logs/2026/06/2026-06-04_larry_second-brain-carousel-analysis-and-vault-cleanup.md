---
agent_id: larry
session_id: second-brain-carousel-analysis-and-vault-cleanup
timestamp: 2026-06-04
type: close-session
linked_sops: []
linked_workstreams: []
linked_guidelines: ["GL-001-file-naming-conventions"]
mined: true
---

# Second Brain — Carousel analysis, framework build, and full vault cleanup

## Context

Alyssa came in wanting a deep, nuanced analysis of 9 top-performing Instagram carousels (Jan–Mar 2026, 80+ slides) to extract repeatable patterns, frameworks, and templates Wren could use to produce 10 new carousels without struggling. She also added three previously-done analysis files from her Claude OS folder for reference. Mid-session she flagged that the Second Brain folder was getting disorganized — confusing naming, unclear distinctions between folders, and poor navigability. The session pivoted to include a full vault structure audit and cleanup. Ended with a regroup on the full Second Brain build status.

---

## What we did

**Larry (orchestration):**
- Inventoried all 9 carousel folders in `examples/Carousels/` and confirmed 80+ slide images were present
- Assessed the three Claude OS files Alyssa shared (`[Analysis] Top IG Hits '26 Report.csv`, `[Framework] Top IG Hits '26 Carousel Analysis.md`, `[Research] Carousel Frameworks.md`) — recommended: CSV incorporated into framework as performance data backbone, Framework MD used as supplementary reference (good on slides 1–6, missing Feb 19/24/March carousels), Research MD too generic to use

**4 parallel subagents (Larry-dispatched image analysis):**
- Agent 1: Full slide-by-slide analysis of Jan 15 (Slow Marketing Trends pt 1) + Jan 20 (What's Actually Shifting pt 2) — 19 slides
- Agent 2: Full analysis of Jan 22 (Wasting Time For The Girls) + Jan 29 (Why Smart Founders Going Low Maintenance) — 17 slides
- Agent 3: Full analysis of Feb 6 (Pinterest For Beginners) + Feb 10 (Get All Your Clients) — 19 slides
- Agent 4: Full analysis of Feb 19 (Pinterest Sugar Mama) + Feb 24 (Swapped IG for Pinterest) + March 3 (Organic Marketing Is Dying) — 26 slides
- Each agent returned: full text transcription, content analysis, copy analysis, design analysis, pacing/structure map

**Larry (synthesis + Second Brain build):**
- Created `analysis/carousel-analysis.md` — performance data table, archetype→metric mapping, 7 pattern observations, voice patterns, design patterns
- Created [[Studio/Analysis/Frameworks/carousel-framework]] — 6 archetypes with full arcs, 7 hook formulas with writing rules, 3-layer copy system, design rules, series architecture
- Created [[Studio/Analysis/Templates/carousel-brief]] — pre-production checklist (5 decisions before writing) + 10 fully scoped ready-to-write carousel briefs
- Created `examples/Carousels/INDEX.md` — image folders mapped with archetype + top metric for each
- Deleted root-level `[Framework] Carousel Playbook.md` (orphaned, replaced by the 3 properly-filed documents)
- Updated 4 INDEX files: `analysis/INDEX.md`, `frameworks/INDEX.md`, `templates/INDEX.md`, `examples/INDEX.md`
- Renamed `analysis/about_me.md` → `analysis/about-me.md` → [[Archive/Studio-Analysis-voice-retired-2026-07-10/voice-profile]] (two-pass rename for clarity)
- Updated all 6 reference locations: `analysis/INDEX.md`, [[Archive/Studio-Analysis-voice-retired-2026-07-10/voice-archive]], [[Studio/Analysis/copy-task-routing]], `memory/reference_voice_profile_methodology.md`, `memory/reference_second_brain_voice_layer.md`, `memory/MEMORY.md`
- Fixed `analysis/subject-line-analysis.md` — renumbered patterns from 1, 1B, 2…6, 6B, 6C, 7, 8, 9 → clean sequential 1–12; removed 3 double `---` separators; updated reference table and version note
- Added "Vault cleanliness — agent duty" section to [[Studio/Team Knowledge/Guidelines/GL-001-file-naming-conventions]]
- Added `feedback_fix_dont_flag.md` to memory and updated `MEMORY.md` index
- Rewrote [[PKM/Second Brain/INDEX]] entirely — "START HERE" entry point to copy-task-routing.md, corrected workflow order, "when to open it" folder table, quick-reference task-to-files table, key files table
- Updated [[Studio/Analysis/copy-task-routing]] — added full carousel routing with archetype→metric map and pre-production checklist note; split "social media copy" entry into separate carousel + IG caption routes; updated subject line entry to point to `subject-line-analysis.md` as primary read
- Updated [[Studio/Analysis/BUILD-PLAN]] — reflected true current state (BOH fully imported, carousels done, me.md exists, all analysis files built, email examples still missing)

---

## Decisions made

- **`about-me.md` → [[Archive/Studio-Analysis-voice-retired-2026-07-10/voice-profile]]:** The file is Alyssa's AI-ready voice profile (XML `<about_me>` format). Renaming to [[Archive/Studio-Analysis-voice-retired-2026-07-10/voice-profile]] removes the false association with her about PAGE and makes its purpose immediately clear. All references updated.

- **Carousel work split into 3 files, not 1:** `carousel-analysis.md` (what we found) + [[Studio/Analysis/Frameworks/carousel-framework]] (rules to follow) + [[Studio/Analysis/Templates/carousel-brief]] (fill in the blank). One monolithic playbook dumped at the root was the wrong shape — three focused files in their correct folders is navigable and purpose-clear.

- **"Fix don't flag" is now a codified team rule:** Any fixable vault issue (naming, broken links, misplaced files) gets fixed immediately, not flagged. Graduated to GL-001 and memory. No agent should surface a fixable problem to Alyssa as an action item.

- **Second Brain INDEX.md purpose:** The INDEX is navigation, not documentation. "START HERE → copy-task-routing.md" is the first thing an agent sees. The folder table answers "when to open it," not "what's in it."

- **Vault cleanliness is ongoing baseline work:** Not a cleanup sprint. Every session, every agent, every file touched — maintain kebab-case, update relevant INDEX files, fix what you find.

---

## Insights

- **4-agent parallel image analysis is fast and viable.** 80+ slides across 9 carousels analyzed in one pass with no context overflow. The key: assign 2–3 carousels per agent with tight structured output requirements (5 sections: transcription, content, copy, design, pacing). Agents return full text transcriptions that persist as a reference layer even when images aren't open.

- **The carousel analysis revealed a consistent archetype→metric map.** Trend Reports → saves. Manifestos → shares (even with no CTA). Provocations/visual jokes → maximum shares. Data Arguments → follows. Story/POV → comments. This is decision-useful data for Wren — she should pick the format based on the goal, not just the topic.

- **The Second Brain folder structure is correct; the INDEX was wrong.** The confusion Alyssa felt was not the folders — it was that the INDEX described what was IN each folder instead of WHEN to open it. Fixing the orientation layer fixed the navigation without restructuring anything.

- **"Fix don't flag" applies to more than naming.** The principle generalizes: if an agent spots something fixable in the course of their work — a broken link, a misplaced file, a stale reference — they fix it inline and don't surface it. The vault should always be cleaner after a session than before.

---

## Realignments

- **"Flag it, we'll fix it later" is not the pattern.** Alyssa's words: "if the job wouldn't take you too long i always want you to fix it instead of flagging it for me... your job is to always keep this vault clean." Graduated to GL-001 and memory immediately. Going forward: fix inline, don't create action items for Alyssa.

- **Frameworks ≠ templates.** When Alyssa asked if they were duplicates, it revealed the INDEX wasn't explaining the distinction clearly enough. Fixed: the INDEX now shows each folder with "open it when..." not just "what's in it."

- **The INDEX had the workflow steps in the wrong order.** Previous version said "check frameworks first" — but frameworks are step 3 or 4, not step 1. The voice layer always comes first. Corrected in the rewrite.

---

## Open threads

- [ ] **Alyssa to review [[Archive/Studio-Analysis-voice-retired-2026-07-10/voice-profile]]** — AI-mined draft, awaiting her annotation pass and 100-question interview to fill LOW/MED confidence gaps
- [ ] **5 Simmer emails needed** — the highest-priority Second Brain gap; once filed, enables building the Simmer template (most important email template for Wren)
- [ ] **5 Soft Sunday emails needed** — second-priority email gap
- [ ] **Notion vaults** — Mack to set up API connection to import hook vault, RTO vault, PS vault, segmentation vault, sequence prompts into `frameworks/`
- [ ] **Workshop/webinar analysis** — both webinar transcripts are now in `programs/back-of-house/webinars/` and can be built this session or next
- [ ] **Obsidian vault refresh** — `[Framework] Carousel Playbook` file is confirmed deleted but still showing in Obsidian cache; clears on Ctrl+Shift+R

---

## Next steps

1. Drop 5 Simmer emails into `examples/simmers/` — Larry reads them → builds `analysis/simmer-analysis.md` → builds `templates/email-simmer.md`
2. Drop 5 Soft Sunday emails into `examples/soft-sundays/` — same process
3. Have Mack start Notion API connection for frameworks/ vaults
4. Run [[Studio/Analysis/workshop-webinar-analysis]] — transcripts are ready, just needs a session

---

## Cross-links

- [[2026-06-03-17-00_larry_second-brain-depth-analysis-and-wren-hire]] — previous Second Brain depth session; hired Wren, built voice layer
- [[2026-06-03_larry_second-brain-web-copy-and-analysis]] — web copy and page analysis session
- [[2026-06-03_larry_second-brain-slowly-viral-import]] — Slowly Viral content import session
- [[2026-06-01_larry_second-brain-build]] — original Second Brain build session
