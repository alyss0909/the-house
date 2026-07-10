# SOP-ocr-scanned-pdf — Turn a scanned PDF into searchable text

- **Default owner:** Mack. Reusable by any agent (Penn captures the text; Silas may shape it).
- **Status:** Installed by the Voice & File Converter v1.1.0. Auto-numbered into `SOP-NNN-ocr-scanned-pdf.md` at install.
- **Triggered by:** a user with a **scanned / image-only PDF** + intent — "make this scan searchable," "I can't select the text in this PDF," "get the text out of this scanned document." For a born-digital PDF that already has selectable text, use [[SOP-convert-documents]] instead (its `pdftotext` path).
- **References:** `lib/ocr-pdf.sh` (the executor), [[SOP-convert-documents]], `ADAPT-EXPANSION.md`.

## Purpose

Take a scanned PDF — one whose pages are images, with no selectable text — and recognise the words on it. Two output shapes:

- **Searchable PDF** — the original page images are kept, with an invisible text layer added underneath, so the PDF becomes selectable and searchable.
- **Plain text** — the recognised text extracted as a `.txt` for capture into the knowledge base.

## Why this toolchain (verified)

OCR is **OCRmyPDF** driving the **Tesseract** OCR engine, with **Ghostscript** as OCRmyPDF's PDF rasterise/normalise dependency. This was checked against best practice (Perplexity review, 2026): OCRmyPDF + Tesseract is the de-facto CLI standard for scanned-PDF → searchable-PDF, OCRmyPDF handles deskew/rotation/cleanup, and Ghostscript is the recommended renderer for robust behaviour.

**Licensing note (important).** Ghostscript is **AGPL-3.0**. It is used here **only** as a local CLI subprocess that OCRmyPDF spawns — never linked into our code, never modified, never network-exposed. This is the standard, copyleft-safe pattern (separate-process invocation does not extend AGPL to the caller). The user-facing README states this plainly under "Open-source tools & licenses" (handoff §2.2). Do not embed or link Ghostscript; the subprocess boundary is what keeps this clean.

## Inputs

A scanned PDF path. Optional output path. OCR language defaults to `eng`; override with `CONVERTER_OCR_LANG` in `.env` (e.g. `eng+deu` for mixed-language documents).

## Procedure

1. **Confirm intent.** "Make this searchable" / "get the text out" is explicit — a brief confirm is enough. For a long scan, set the expectation: OCR is slower than plain text extraction.
2. **Run the wrapper.**
   - Searchable PDF:
     ```bash
     bash Expansions/converter-pack/lib/ocr-pdf.sh pdf "<scanned.pdf>" ["<searchable.pdf>"]
     ```
   - Plain text:
     ```bash
     bash Expansions/converter-pack/lib/ocr-pdf.sh text "<scanned.pdf>" ["<out.txt>"]
     ```
   Each prints the produced file path on success.
3. **Hand off** the result from `cache/` — Penn captures the text into the knowledge base; the searchable PDF is placed where the user asked.
4. **Report** the finished result.

## Hard rules

- **The input is never overwritten.** OCRmyPDF always writes a new output file; the wrapper refuses if output equals input.
- **All paths validated and quoted.** Inputs checked for existence/non-emptiness. Never `eval`.
- **Offline only.** OCR runs entirely on the machine — no network, no credentials, no cloud OCR service. If a tool is missing, run `scripts/doctor.sh`; never substitute a cloud OCR API.
- **Ghostscript stays a subprocess.** It is invoked only as the OCRmyPDF dependency, as a separate process. Do not embed or link it. The README carries the AGPL disclosure — keep it.
- **Mixed PDFs are safe.** The wrapper passes `--skip-text`, so pages that already have a text layer are passed through untouched rather than erroring.

## Failure modes

| Symptom | Cause | Resolution |
|---|---|---|
| `'ocrmypdf' is not installed` | install incomplete | Run `scripts/install.sh`. |
| `Tesseract ... is not installed` | OCR engine missing | Run `scripts/install.sh`. |
| OCR is very slow | large/high-res scan; OCR is CPU-bound | Tell the user it is working, not stuck. |
| recognised text is poor | low-resolution or skewed scan, wrong language | Re-scan at higher DPI if possible; set `CONVERTER_OCR_LANG` to the document's language. |
| `no text could be recognised` | the scan is blank, or pure graphics | Confirm the PDF actually contains text/printed words. |
