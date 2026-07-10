# SOP-convert-documents — Convert documents and media between everyday formats

- **Default owner:** Mack. Reusable by any agent.
- **Status:** Installed by the Voice & File Converter v1.0.0. Auto-numbered into `SOP-NNN-convert-documents.md` at install.
- **Triggered by:** a user with a file + a "convert to X" intent — documents (Word/Markdown/HTML/EPUB/ODT/RTF/text), audio formats (MP3/M4A/WAV/FLAC/AAC/OGG), or images (HEIC/JPG/PNG/TIFF/WEBP).
- **References:** `lib/convert-document.sh` and `lib/convert-media.sh` (the executors), [[SOP-convert-images-pdf]], `ADAPT-EXPANSION.md`.

## Purpose

The all-around file converter. Three executors cover the formats a knowledge worker actually deals with:

| Need | Wrapper | Engine |
|---|---|---|
| Document ↔ document (docx, md, html, epub, odt, rtf, txt, tex) | `lib/convert-document.sh` | pandoc |
| PDF → text / Markdown | `lib/convert-document.sh` | poppler `pdftotext` |
| Audio/video format → another format | `lib/convert-media.sh av` | ffmpeg |
| Image format → another (incl. HEIC) | `lib/convert-media.sh image` | sips (macOS) / ImageMagick |

## Inputs

An input file path and an output file path. The conversion is inferred from the extensions.

## Procedure

1. **Confirm intent briefly.** "Convert to X" is explicit — a short confirm is enough.
2. **Pick the wrapper by what is being converted:**
   - Document or PDF-in:
     ```bash
     bash Expansions/converter-pack/lib/convert-document.sh "<input>" "<output>"
     ```
   - Audio/video format change:
     ```bash
     bash Expansions/converter-pack/lib/convert-media.sh av "<input>" "<output>"
     ```
   - Image format change:
     ```bash
     bash Expansions/converter-pack/lib/convert-media.sh image "<input>" "<output>"
     ```
   Each prints the produced file path on success.
3. **Hand off** the result from `cache/` for filing, or place it where the user asked.
4. **Report** the finished result.

## Hard rules

- **All paths validated and quoted.** Inputs are checked for existence/non-emptiness. Never `eval`.
- **Document → PDF is out of scope in v1.** `convert-document.sh` stops with a clear message ("convert to .html/.docx, then Save as PDF"). v1 manages no PDF/LaTeX engine and deliberately does NOT opportunistically use a stray pre-existing one (it may be broken or unmanaged). For images → PDF, use [[SOP-convert-images-pdf]], which IS supported. Do not work around this by adding a PDF engine silently.
- **Scanned PDFs are not OCR'd in v1.** PDF→text on an image-only scan returns little or nothing. OCR (Ghostscript/Tesseract pipeline) is a v2 feature (§12 Q5 — keeps v1 AGPL-free). Tell the user plainly if a PDF is a scan.
- **ffmpeg runs with `-nostdin`.** Never let ffmpeg consume the agent's stdin.

## Failure modes

| Symptom | Cause | Resolution |
|---|---|---|
| `pandoc` / `ffmpeg` / `ImageMagick` not found | install incomplete | Run `scripts/install.sh`. |
| PDF output refused | document→PDF out of scope in v1 | Convert to `.html`/`.docx`, then Save as PDF — as the message says. |
| empty output file | incompatible source/target formats | Report; suggest an intermediate format. |
| PDF→text returns nothing | the PDF is a scanned image | Explain OCR is a v2 feature. |
