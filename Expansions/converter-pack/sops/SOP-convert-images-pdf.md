# SOP-convert-images-pdf — Combine images into a PDF, or split a PDF into pages

- **Default owner:** Mack. Reusable by any agent.
- **Status:** Installed by the Voice & File Converter v1.0.0. Auto-numbered into `SOP-NNN-convert-images-pdf.md` at install.
- **Triggered by:** a user with image files + intent ("make these a PDF," "combine these scans"), or a PDF + intent ("split this PDF into pages / images").
- **References:** `lib/images-to-pdf.sh` (the executor), [[SOP-convert-documents]] (PDF text extraction), `ADAPT-EXPANSION.md`.

## Purpose

Two related operations:
- **Combine** — merge one or more images (JPG, PNG, TIFF, WEBP, **HEIC** iPhone photos) into a single PDF.
- **Split** — render a PDF back into one image file per page.

Backed by ImageMagick (combine) and poppler `pdftoppm` (split). HEIC inputs are converted transparently — via macOS's built-in `sips`, or ImageMagick/libheif elsewhere.

## Inputs

- Combine: an output PDF path + one or more image file paths.
- Split: an input PDF path + an optional output directory.

## Procedure

1. **Confirm intent.** Explicit instruction ("make these a PDF") is a clear signal — a brief confirm is enough: *"Combining those 3 images into one PDF — one moment."*
2. **Run the wrapper.**
   - Combine:
     ```bash
     bash Expansions/converter-pack/lib/images-to-pdf.sh combine "<out.pdf>" "<img1>" "<img2>" ...
     ```
   - Split:
     ```bash
     bash Expansions/converter-pack/lib/images-to-pdf.sh split "<in.pdf>" ["<output-dir>"]
     ```
   The wrapper prints the produced PDF path (combine) or page directory (split).
3. **Hand off** the result from `cache/` for filing, or place it where the user asked.
4. **Report** the finished result.

## Hard rules

- **All paths validated.** Every input file is checked for existence and non-emptiness; every path is quoted. Never `eval`.
- **HEIC handled, not refused.** iPhone photos are first-class inputs. Do not tell the user to convert them first — the wrapper does it.
- **Order matters on combine.** Images become PDF pages in the order given. Pass them in the intended page order.

## Failure modes

| Symptom | Cause | Resolution |
|---|---|---|
| `ImageMagick not found` | install incomplete | Run `scripts/install.sh`. |
| HEIC input fails on Linux | libheif missing | Ensure `libheif1` is installed (apt line in `install.sh`). |
| PDF produced but huge | very high-res source images | Acceptable; offer to downscale if the user asks. |
| `no pages were produced` (split) | corrupt/encrypted PDF | Report; an encrypted PDF must be unlocked first. |
