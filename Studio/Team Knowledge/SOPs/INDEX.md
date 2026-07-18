# SOPs - Index

**SOPs are agent skills.** Each SOP is a canonical procedure: a step-by-step recipe for one job. They are LLM-agnostic and reusable across agents. Each SOP has a default owner, but any agent can invoke it when they need the procedure.

Filename pattern: `SOP-NNN-<title>.md`. See [[GL-001-file-naming-conventions]] for slug rules. Numbering follows authorship order, not topic. Gaps are intentional.

## Active SOPs

| SOP | Title | Default owner | Description |
|---|---|---|---|
| SOP-001 | [[SOP-001-how-to-add-a-new-specialist]] | Nolan | Draft and onboard a new team specialist. |
| SOP-002 | [[SOP-002-convert-mypka-to-sqlite]] | Silas | Generate a SQLite mirror of the myPKA on demand. Markdown stays canonical. |
| SOP-003 | [[SOP-003-keep-notes-to-journal]] | Penn + Larry | Convert Google Keep exports from Notebook/Inbox into properly formatted journal entries. |
| SOP-004 | [[SOP-004-create-task]] | Any agent | Create a new task file with linked context. |
| SOP-005 | [[SOP-005-claim-task]] | Any agent | Claim an existing open task and record the pickup state. |
| SOP-006 | [[SOP-006-close-task]] | Any agent | Close a completed, cancelled, or abandoned task with an outcome. |
| SOP-007 | [[SOP-007-list-open-tasks]] | Any agent | List open work from `Studio/Team Knowledge/tasks/`. |
| SOP-008 | [[SOP-008-rebuild-task-index]] | Larry | Regenerate [[Studio/Team Knowledge/tasks/INDEX]] from task files on disk. |
| SOP-009 | [[SOP-009-write-journal-entry]] | Any agent | Record durable specialist learning in that agent's journal. |
| SOP-010 | [[SOP-010-read-own-journal]] | Any agent | Read an agent's own journal before starting relevant work. |
| SOP-011 | [[SOP-011-write-session-log]] | Larry | Write the end-of-session log. |
| SOP-012 | [[SOP-012-codex-windows-sandbox-recovery]] | Mack + Larry | Restore Codex Desktop local command execution on Windows after sandbox failures. |
| SOP-013 | [[SOP-013-semantic-sweep]] | Larry | Cluster recurring journal themes and feed Signals. |
| SOP-014 | [[SOP-014-author-a-design-system]] | Iris | Populate or extend the design system. |
| SOP-015 | [[SOP-015-audit-content-for-design-system-compliance]] | Iris | Audit visual deliverables against [[GL-003-design-system]]. |
| SOP-016 | [[SOP-016-build-an-infographic]] | Charta | Build a branded infographic or one-pager. |
| SOP-017 | [[SOP-017-generate-a-styled-image]] | Pixel | Produce a styled image using image generation or a design brief. |
| SOP-018 | [[SOP-018-felix-build-a-component]] | Felix | Build a design-system-aware UI component. |
| SOP-019 | [[SOP-019-vex-security-audit]] | Vex | Audit apps, integrations, credentials, and data handling. |
| SOP-020 | [[SOP-020-val-quality-gate]] | Val | Run visual, responsive, and accessibility QA on UI work. |
| SOP-021 | [[SOP-021-transcribe-audio]] | Mack | Transcribe a local audio/video file. Runtime install is tracked in [[tsk-2026-06-26-001-converter-pack-runtime-install]]. |
| SOP-022 | [[SOP-022-transcribe-url]] | Mack | Download/transcribe media from a URL. Runtime install is tracked in [[tsk-2026-06-26-001-converter-pack-runtime-install]]. |
| SOP-023 | [[SOP-023-webpage-to-text]] | Mack | Extract clean readable text from a web page. Runtime install is tracked in [[tsk-2026-06-26-001-converter-pack-runtime-install]]. |
| SOP-024 | [[SOP-024-convert-images-pdf]] | Mack | Combine images into a PDF or extract images from a PDF. Runtime install is tracked in [[tsk-2026-06-26-001-converter-pack-runtime-install]]. |
| SOP-025 | [[SOP-025-convert-documents]] | Mack | Convert documents between common formats. Runtime install is tracked in [[tsk-2026-06-26-001-converter-pack-runtime-install]]. |
| SOP-026 | [[SOP-026-ocr-scanned-pdf]] | Mack | OCR a scanned PDF. Runtime install is tracked in [[tsk-2026-06-26-001-converter-pack-runtime-install]]. |
| SOP-027 | [[SOP-027-inspect-strip-metadata]] | Mack | Inspect or strip file metadata non-destructively. Runtime install is tracked in [[tsk-2026-06-26-001-converter-pack-runtime-install]]. |
| SOP-031 | [[SOP-031-watch-video]] | Mack | Watch a video from a URL or local file using captions/transcript and frames. |
| SOP-032 | [[SOP-032-apply-ponytail-ladder]] | Larry | Apply the lazy senior dev decision ladder from [[GL-008-ponytail-lazy-senior-dev-philosophy]]. |
| SOP-039 | [[SOP-039-house-keeping]] | Larry | Weekly/monthly mechanical maintenance patrol for the house. |
| SOP-040 | [[SOP-040-the-compounding-loop]] | Larry | Every session boots from NOW.md and closes with compounded memory. |
| SOP-041 | [[SOP-041-content-production]] | Larry | The current content pipeline: `/saves-sweep` and `/content-run` under [[Studio/Content/METHOD]]. |

## Retired SOPs

| SOP | Title | Retired | Replacement |
|---|---|---|---|
| SOP-028 | [[SOP-028-slack-incoming-routing]] | 2026-07-16 | Slack runtime is retired unless Alyssa reactivates Slack. |
| SOP-029 | [[SOP-029-slack-post-message]] | 2026-07-16 | Slack runtime is retired unless Alyssa reactivates Slack. |
| SOP-030 | [[SOP-030-slack-listener-health]] | 2026-07-16 | Slack runtime is retired unless Alyssa reactivates Slack. |
| SOP-033 | [[SOP-033-run-trend-scout-brief]] | 2026-07-16 | Trend input now comes from `/saves-sweep` plus [[Studio/Content/trend-scout-monthly-routine]]. |
| SOP-034 | [[SOP-034-write-concept-pitch-brief]] | 2026-07-16 | Concept work now happens inside [[SOP-041-content-production]]. |
| SOP-035 | [[SOP-035-run-hook-bench]] | 2026-07-16 | Hooks are written inside `/content-run` using [[Studio/Analysis/carousel-hook-forensics]]. |
| SOP-036 | [[SOP-036-build-substance-dossier]] | 2026-07-16 | Substance and persuasion live in [[Studio/Content/METHOD]] and the compiled carousel cards. |
| SOP-037 | [[SOP-037-run-mean-alyssa-content-gate]] | 2026-07-16 | Finished-post quality checks live inside [[SOP-041-content-production]]. |
| SOP-038 | [[SOP-038-suki-weekly-strategy-brief]] | 2026-07-16 | Suki is an on-demand/quarterly strategy consult. |

Next available SOP number: SOP-042

## How to add a new SOP

1. Pick the next unused number (`SOP-NNN`) by authorship order.
2. Filename: `SOP-NNN-<kebab-case-title>.md`.
3. Header includes default owner, status, triggers, references, and "Reusable by any agent."
4. Reference [[GL-001-file-naming-conventions]] and any relevant Guideline instead of duplicating rules.
5. Add one row to this index.
