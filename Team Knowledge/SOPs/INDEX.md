# SOPs - Index

**SOPs are agent skills.** Each SOP is a canonical procedure — a step-by-step recipe for one job. They are LLM-agnostic and reusable across agents: an SOP has a **default owner** (the specialist who runs it most often), but any agent can invoke an SOP when they need its procedure. Think of SOPs the way Claude skills work — discrete, named, callable.

Filename pattern: `SOP-NNN-<title>.md`. See [[GL-001-file-naming-conventions]] for slug rules. Numbering follows authorship order, not topic — gaps are intentional and reserve slots for future agents.

## Active SOPs

| SOP | Title | Default owner | Description |
|---|---|---|---|
| SOP-001 | [[SOP-001-how-to-add-a-new-specialist]] | Nolan | Step-by-step procedure to draft and onboard a new team specialist. References [[GL-001-file-naming-conventions]]. |
| SOP-002 | [[SOP-002-convert-mypka-to-sqlite]] | Silas (run by the user via paste-into-LLM prompt) | Generate a SQLite mirror of your myPKA on demand. Markdown stays canonical; SQLite is a derived performance layer. Body is a paste-into-LLM prompt. |
| SOP-003 | [[SOP-003-keep-notes-to-journal]] | Penn (filing), Larry (triage + image cleanup) | Convert Google Keep exports from Team Inbox into properly formatted PKM journal entries. Covers frontmatter stripping, image sweep, routing, and KeepSidian log cleanup. |
| SOP-004 | [[SOP-004-create-task]] | Any agent | Create a new task file in `Team Knowledge/tasks/open/` with all six linked arrays populated. |
| SOP-005 | [[SOP-005-claim-task]] | Any agent | Claim an existing open task — add the claiming agent and timestamp, move to in-progress state. |
| SOP-006 | [[SOP-006-close-task]] | Any agent | Close a completed task — write the Outcome, optionally write a journal entry, move file to `closed/`. |
| SOP-007 | [[SOP-007-list-open-tasks]] | Any agent | List all open tasks in `Team Knowledge/tasks/open/` with summary status. |
| SOP-008 | [[SOP-008-rebuild-task-index]] | Larry | Regenerate `Team Knowledge/tasks/INDEX.md` from the open and closed task files. |
| SOP-009 | [[SOP-009-write-journal-entry]] | Penn | Write a durable journal entry under `Team/<agent>/journal/` capturing a learning or insight. |
| SOP-010 | [[SOP-010-read-own-journal]] | Any agent | Read an agent's own journal entries before starting a task, to carry forward prior learnings. |
| SOP-011 | [[SOP-011-write-session-log]] | Larry | Write an end-of-session log entry under `Team Knowledge/session-logs/YYYY/MM/`. |
| SOP-012 | [[SOP-012-codex-windows-sandbox-recovery]] | Mack (runtime/automation), Larry (triage + session continuity) | Restore Codex Desktop local command execution on Windows after sandbox setup refresh failures, corrupted deny-read ACL state, or broken node_repl startup. |
| SOP-013 | [[SOP-013-semantic-sweep]] | Larry | Periodic semantic sweep of journal entries — clusters recurring themes, updates Signals Index, flags Goal alignment/gaps/tensions. Runs automatically during weekly, monthly, and quarterly reviews. |
| SOP-014 | [[SOP-014-author-a-design-system]] | Iris | Guided session to populate GL-003 — identity, color palette, typography, spacing scale, imagery style, voice samples. Installed with Designer Pack v1.1.1. |
| SOP-015 | [[SOP-015-audit-content-for-design-system-compliance]] | Iris | Audit visual deliverables against GL-003 — color, font, spacing, imagery, voice, status-color semantics. Produces a severity-tagged report with fix recommendations. Installed with Designer Pack v1.1.1. |
| SOP-016 | [[SOP-016-build-an-infographic]] | Charta | HTML/CSS/SVG infographic layout → Puppeteer PNG/PDF render. Comparison tables, flowcharts, decision trees, timelines, carousels. Reads GL-003. Installed with Designer Pack v1.1.1. |
| SOP-017 | [[SOP-017-generate-a-styled-image]] | Pixel | Concept → references → five-part prompt → image-gen → score → deliver. Handles local image-gen, Mack-wired external API, and design-brief fallback paths. Reads GL-003. Installed with Designer Pack v1.1.1. |
| SOP-018 | [[SOP-018-felix-build-a-component]] | Felix | Design-system-aware component build end-to-end: spec → inspect codebase → scaffold with tokens → type props → handle all states → accessibility check → breakpoint verify → Val QA handoff. Installed with App Developer Pack v1.0.2. |
| SOP-019 | [[SOP-019-vex-security-audit]] | Vex | Four-phase security audit: credential hygiene → authorization → integration/surface hardening → data-handling/GDPR. Proof-of-exploit per finding. Severity-tagged report. Installed with App Developer Pack v1.0.2. |
| SOP-020 | [[SOP-020-val-quality-gate]] | Val | Six-phase visual + accessibility + responsive QA gate: prep → screenshot capture → visual analysis → responsive verification → WCAG 2.2 AA → report. PASS / CONDITIONAL PASS / FAIL verdict. Installed with App Developer Pack v1.0.2. |
| SOP-021 | [[SOP-021-transcribe-audio]] | Mack | Transcribe a local audio/video file to text using whisper.cpp. Handles .mp3, .m4a, .wav, .mp4, .mov. Installed with Voice & File Converter Pack v1.1.1. |
| SOP-022 | [[SOP-022-transcribe-url]] | Mack | Download audio/video from a URL (YouTube, Vimeo, podcast RSS, etc.) via yt-dlp and transcribe with whisper.cpp. Installed with Voice & File Converter Pack v1.1.1. |
| SOP-023 | [[SOP-023-webpage-to-text]] | Mack | Extract clean text from a web URL using trafilatura (primary) with pandoc fallback. Strips nav/ads/boilerplate. Installed with Voice & File Converter Pack v1.1.1. |
| SOP-024 | [[SOP-024-convert-images-pdf]] | Mack | Combine images into a PDF, or extract images from a PDF, using ImageMagick and qpdf. Installed with Voice & File Converter Pack v1.1.1. |
| SOP-025 | [[SOP-025-convert-documents]] | Mack | Convert between document formats (DOCX, ODT, HTML, EPUB, Markdown, plain text) using pandoc. Installed with Voice & File Converter Pack v1.1.1. |
| SOP-026 | [[SOP-026-ocr-scanned-pdf]] | Mack | Make a scanned/image-only PDF searchable using OCRmyPDF + Tesseract + Ghostscript. Installed with Voice & File Converter Pack v1.1.1. |
| SOP-027 | [[SOP-027-inspect-strip-metadata]] | Mack | Inspect and non-destructively strip metadata from files (EXIF, XMP, IPTC) using ExifTool. Always writes a separate cleaned copy — never overwrites the original. Installed with Voice & File Converter Pack v1.1.1. |
| SOP-028 | [[SOP-028-slack-incoming-routing]] | Larry | Route incoming Slack messages (via Socket Mode listener) to the right specialist. Installed with Slack Expansion v1.0.0. |
| SOP-029 | [[SOP-029-slack-post-message]] | Mack | Post a message to a Slack channel or DM using the Slack Web API. Installed with Slack Expansion v1.0.0. |
| SOP-030 | [[SOP-030-slack-listener-health]] | Mack | Check the health of the Slack Socket Mode listener process — confirm it's running, reconnect if needed. Installed with Slack Expansion v1.0.0. |
| SOP-031 | [[SOP-031-watch-video]] | Mack | Watch a video (URL or local file) — pull captions or Whisper transcript, extract scene-aware frames via yt-dlp/ffmpeg, and answer questions grounded in what's on screen and said. Installed with Claude Video Expansion v0.2.0. |
| SOP-032 | [[SOP-032-apply-ponytail-ladder]] | Larry | Apply the lazy senior dev decision ladder (stop at first rung that holds, reuse before rebuilding, stdlib before custom) to any code/prompt/feature work. Doctrine lives in [[GL-008-ponytail-lazy-senior-dev-philosophy]]; this SOP is the discoverable trigger. Installed with Ponytail Expansion v1.0.0. |
| SOP-033 | [[SOP-033-run-trend-scout-brief]] | Mack (wiring) / Suki (interpretation) | Re-slice the monthly Apify swipe file into the weekly Trend Scout Brief (what's working / stale / cover + slide patterns / Mean Alyssa ammo). Does NOT re-scrape. Content OS pipeline, WS-011 Step 1. |
| SOP-034 | [[SOP-034-write-concept-pitch-brief]] | Concept Specialist / Suki-directed | Turn the weekly bet into 10+ concepts, gate them, show survivors to Alyssa as plain-language concepts (angle named separately from hook). WS-011 Step 3. |
| SOP-035 | [[SOP-035-run-hook-bench]] | Hook Specialist / Suki-directed | Bench hooks for an approved concept; deliver 3 Mean-Alyssa-surviving, comment-driving hooks. WS-011 Step 4. |
| SOP-036 | [[SOP-036-build-substance-dossier]] | Cassius (Substance) | Build the GL-011 arc + provenance sheet from Alyssa's real teaching; $5 test + offer-desire test, evidence-bound. WS-011 Step 5. |
| SOP-037 | [[SOP-037-run-mean-alyssa-content-gate]] | Suki / Larry | The reusable Mean Alyssa kill gate — runs at every content rung (concept/hook/substance/voice) before work reaches Alyssa. Control-calibrated. |
| SOP-038 | [[SOP-038-suki-weekly-strategy-brief]] | Suki | The market→bet translation: a team-usable one-pager (theme, slot-offer lock, stop-list, the one belief, comment keywords) + a 2-line skim for Alyssa. WS-011 Step 2. |

Next available SOP number: SOP-039

## How to add a new SOP

1. Pick the next unused number (`SOP-NNN`) — by authorship order, not topic. Don't reuse reserved numbers.
2. Filename: `SOP-NNN-<kebab-case-title>.md`.
3. Header includes the default owner, status, triggers, references, and an explicit "Reusable by any agent" note — the SOP is a skill, not 1:1 ownership.
4. Reference [[GL-001-file-naming-conventions]] and any other Guideline instead of duplicating its content.
5. Add a row to this index.
