---
id: tsk-2026-06-26-001
title: Run Converter Pack runtime install (Whisper + tools)
status: open
created: 2026-06-26
owner: Mack
priority: medium
linked_sops: [SOP-021-transcribe-audio, SOP-022-transcribe-url, SOP-023-webpage-to-text, SOP-024-convert-images-pdf, SOP-025-convert-documents, SOP-026-ocr-scanned-pdf, SOP-027-inspect-strip-metadata]
linked_workstreams: []
linked_guidelines: []
linked_my_life: []
linked_session_logs: []
linked_journal_entries: []
---

## What needs to happen

The Voice & File Converter Pack v1.1.1 SOPs (021-027) are installed and indexed. The runtime prerequisites have NOT been installed yet. This task completes that.

### Steps for Mack

1. **Run the installer** — `Expansions/converter-pack/scripts/install.ps1` (Windows). Installs: ffmpeg, yt-dlp, pandoc, ImageMagick, qpdf, poppler, trafilatura, whisper.cpp, ExifTool, OCRmyPDF, Tesseract, Ghostscript. If winget is missing, script stops — don't bootstrap it, just walk Alyssa through getting App Installer first.

2. **Choose and download the Whisper model** — `scripts/fetch-models.ps1 <model>`. Ask Alyssa which tier she wants before downloading:
   - `base` — fastest, ~142 MB
   - `small` — recommended, ~466 MB
   - `large-v3-turbo` — most accurate, ~1.5 GB

3. **Run doctor** — `scripts/doctor.ps1`. Must exit 0. If not, report exactly what's missing.

4. **No env config needed** — all 5 env vars are non-sensitive and have defaults. `.env` is copied from `.env.example` automatically.

5. **No runtime to launch** — this is a connector pack. Nothing daemonises.

### Trigger

Alyssa has a voice memo, audio recording, or article URL she wants to transcribe/extract — that's when to do this.

## Notes

Ghostscript (for OCR) is AGPL-3.0. It's installed as a system CLI subprocess by OCRmyPDF; the pack never bundles or modifies it. Disclosure is in [[Expansions/converter-pack/README]].
