# BUILD-NOTES — Voice & File Converter

Build record for the Converter Expansion Pack. Linear: AUTO-152 (v1.0 build),
AUTO-153 (v1.1 build), AUTO-82 (delivery design), AUTO-36/AUTO-38 (repo +
pipeline). Built by Mack.

---

## v1.1.1 — 2026-06-18 — scaffold-version-gate removal

Patch release. **Removed the scaffold-version gate** so the pack installs
regardless of the host scaffold version. Specifically:

- Deleted `requires_scaffold_version: ">=1.7.0"` from `expansion.yaml`. The gate
  is dropped entirely rather than re-pinned. Scaffold-presence, `requires_agents`
  (agent-presence), and the §8 security checklist are unchanged and still enforced.
- Removed the `requires_scaffold_version: ">=1.7.0 <2.0.0"` line from the
  "Manifest contract" section of `ADAPT-EXPANSION.md` (it was also stale — the
  manifest field itself read `">=1.7.0"`).
- Bumped `version` 1.1.0 → 1.1.1 in `expansion.yaml` and the `ADAPT-EXPANSION.md`
  header. No SOP, script, lib wrapper, env var, or other content changed.

Historical `requires_scaffold_version` references in the sections below are left
intact as build provenance.

## v1.1.0 — 2026-05-17 — AUTO-153 (Tom-approved tool additions)

After the v1.0.0 build, Mack proposed three already-installed-tool additions
for Tom's approval (see "Proposed additions" below). Tom said "do all things".
v1.1 folds them in — with one judgement call going the other way.

### What v1.1 adds

| Capability | New SOP | New `lib/` wrapper | Tools |
|---|---|---|---|
| Scanned PDF → searchable text/PDF (OCR) | `SOP-ocr-scanned-pdf.md` | `lib/ocr-pdf.sh` | OCRmyPDF + Tesseract + Ghostscript |
| Inspect / strip file metadata (EXIF/GPS/XMP) | `SOP-inspect-strip-metadata.md` | `lib/strip-metadata.sh` | ExifTool |

- Manifest → **v1.1.0**: 5 SOPs → **7**; 4 env vars → **5** (added
  `CONVERTER_OCR_LANG`, non-sensitive). `expansion_type` stays `connector`
  (Vex AUTO-152 F-1 ruling — OCR/metadata add no long-lived process).
- Install scripts fetch the new tools per-OS, no bundling, no `curl|sh`:
  macOS `brew install exiftool ocrmypdf tesseract tesseract-lang ghostscript`;
  Linux apt `libimage-exiftool-perl ocrmypdf tesseract-ocr tesseract-ocr-eng
  ghostscript`; Windows winget `OliverBetz.ExifTool`,
  `UB-Mannheim.TesseractOCR`, `ArtifexSoftware.GhostScript` + `ocrmypdf` via
  pipx. All winget IDs and brew/apt names verified live (2026-05-17).
- `doctor.sh`/`.ps1` extended: `exiftool`, `ocrmypdf`, `tesseract` are core
  checks; `ghostscript` (`gs` / `gswin64c`) is an optional check (OCRmyPDF can
  fall back to a slower renderer).
- `common.sh` whitelist extended with `CONVERTER_OCR_LANG`.

### AGPL — the license-surface change

OCR pulls in **Ghostscript, which is AGPL-3.0**. v1.0 was deliberately
AGPL-free. v1.1 therefore ships the user-facing AGPL disclosure per handoff
§2.2:

- `README.md` — new "Open-source tools & licenses" section states plainly
  that Ghostscript is AGPL-3.0, is used only as a local CLI subprocess
  OCRmyPDF spawns, is never bundled/modified/network-exposed, and that the
  AGPL does not reach this pack or the user's files.
- `LICENSE` — full "AGPL COMPONENT NOTICE — Ghostscript" added; ExifTool,
  OCRmyPDF, Tesseract added to the third-party list.
- `INSTALL.md` — short AGPL note in "What gets installed".

Best-practice verified via Perplexity (2026): OCRmyPDF + Tesseract is the
de-facto CLI standard for scanned-PDF → searchable-PDF; Ghostscript is
OCRmyPDF's recommended renderer; invoking an AGPL tool as a separate
unmodified CLI process does not extend the copyleft to the caller — the
standard, conservative interpretation. Install via system package managers
(not bundling) is the recommended pattern.

### ripgrep — Mack's judgement call (NOT added)

ripgrep was proposed as a transcript/extracted-text search helper. **Decision:
left OUT of v1.1.** Search is a horizontal, vault-wide capability — it applies
to all of myPKA's content, not just converter output. Wiring a generic search
tool into a format-conversion pack would couple unrelated concerns and overlap
with whatever the core scaffold provides for search. Per the task's explicit
instruction not to force it: **recommended to Tom as a core-scaffold search
capability instead.** The converter pack's job is *producing* text artifacts;
*searching* them belongs to core.

### Release status

- **Built and functionally consistent; NOT released.** Adding the AGPL
  Ghostscript component changes the license surface, which per WS-003 §8
  re-triggers the Vex security gate. v1.1 stops here and hands back to Larry
  to route the Vex re-gate. No tag, no push from this build step.
- On approval the release tag is `converter-pack-v1.1.0`; the pipeline pins
  the new manifest hash in `.trusted-sources`.

---

## v1.0.0 — 2026-05-17 — AUTO-152

Linear: AUTO-152 (build), AUTO-82 (delivery design), AUTO-36/AUTO-38 (repo + pipeline). Built by Mack, 2026-05-17.

## §12 build decisions (AUTO-82 §8 — Tom-greenlit via "create the Converter Pack!")

| # | Decision | How it shows up in the build |
|---|---|---|
| Q1 | Larry runs the §8 security checklist when Vex is absent | `ADAPT-EXPANSION.md` Step 2 carries the full 8-point checklist for Larry. |
| Q2 | System package-manager tools left in place on uninstall | `uninstall.sh` / `.ps1` remove only `models/`, `cache/`, `bin/`; README says so plainly. |
| Q3 | Default whisper model `small` (~466 MB) | `.env.example` `CONVERTER_WHISPER_MODEL=small`; `fetch-models.sh` default `small`. |
| Q4 | No MCP wrapper in v1 — SOP/CLI-driven | No `mcp_servers` in manifest; pack is `lib/` bash wrappers + SOPs. |
| Q5 | OCR + Ghostscript deferred to v2 — v1 stays AGPL-free | No Ghostscript, no OCR. `LICENSE` notes v1 ships no AGPL component. |
| Q6 | Transcripts/outputs land in `cache/` scratch | `lib/common.sh` `cache_path()`; `cache/` gitignored; nothing in `uninstall.residual_paths` beyond the SOPs. |
| Q7 | Windows whisper.cpp pinned to a specific release tag | `install.ps1` pins `v1.8.4`, asset `whisper-bin-x64.zip` (verified live on GitHub, published 2026-03-19). |

## Webpage→text approach (AUTO-152 expanded scope item 2)

**Chosen: trafilatura (primary) + pandoc html→markdown (fallback).** Verified against best practice via Perplexity (2026): trafilatura had the top mean F1 in the SIGIR 2023 web-content-extraction benchmark, is actively maintained (2.x), pure-Python (no headless browser), works offline, and emits Markdown directly. Rejected: `monolith` (whole-page snapshot, no content extraction), raw `pandoc` as primary (no boilerplate removal). Install: `brew install trafilatura` (macOS — confirmed a real formula), `pipx install trafilatura` (Linux/Windows — no native apt/winget package).

## Machine survey — `brew list` on the build Mac (2026-05-17)

Already installed and relevant to a converter pack — what was found:

| Tool | Status | Decision |
|---|---|---|
| ffmpeg | installed | v1 core — installer ensures it. |
| yt-dlp | installed (pip) | v1 core. |
| pandoc | installed | v1 core. |
| whisper-cpp + ggml | installed (`whisper-cli`) | v1 core — `find_whisper()` finds it under any name. |
| tesseract + tesseract-lang | installed | **Proposed v2** — natural OCR engine; not used in v1 (Q5 keeps v1 AGPL-free; Tesseract itself is Apache-2.0 but the OCR-PDF pipeline pulls Ghostscript). |
| poppler (pdftotext, pdftoppm, pdfunite, pdfimages) | installed | v1 core — used for PDF text + PDF→image split. |
| jq | installed | Used ad hoc; no dedicated SOP. |
| ripgrep | installed | **Proposed** — fast transcript/extracted-text search; obvious knowledge-worker fit, judgement call. |
| sips | macOS built-in | v1 core — HEIC/image conversion on macOS, no extra install. |
| img2pdf | installed (pip) | Not adopted — ImageMagick covers image→PDF; avoids a second dependency. |
| gnupg | installed | Out of scope for a converter pack. |
| ImageMagick | **NOT installed** | v1 core — installer FETCHES it. (qpdf also not installed — installer fetches it.) |

## Proposed already-installed-tool additions — for Tom's approval

Clearly-obvious fits included in v1: ffmpeg, yt-dlp, pandoc, whisper.cpp, poppler, sips. ImageMagick + qpdf are v1 core but fetched (not yet on this Mac).

**Judgement calls — NOT silently added; proposed for Tom:**

1. **`exiftool`** (not currently installed) — read/strip image & document metadata. Strong privacy fit for a PKM pack ("strip EXIF/GPS before filing a photo"). Proposed as a v1.1 converter + SOP. Free (Artistic/GPL). *Needs Tom's nod — it is an addition, not already installed, so it widens the install set.*
2. **`ripgrep`** (installed) — fast full-text search across transcripts and extracted article text. Genuine knowledge-worker fit, but search arguably belongs to the core scaffold's search capability, not a converter pack. Proposed as optional — *Tom decides whether transcript search lives here or in core.*
3. **`tesseract`** (installed) — OCR for scanned PDFs/images. Already the planned v2 feature (Q5). Flagged so Tom knows the OCR engine is already on the machine; the only v2 blocker is the Ghostscript/AGPL question, not Tesseract itself.

v1 ships the obvious fits. None of the three judgement-call tools are wired into v1 SOPs.

## Pack location

Built in the `mypka-expansions` private repo at `packs/converter-pack/` (per AUTO-36/AUTO-38 — this repo is the home for Expansion packs, with the tag-triggered `release-pack.yml` pipeline). Release: tag `converter-pack-v1.0.0` once Vex/Larry sign the security gate.

## Open items for Tom

- Library display name vs manifest `name` (AUTO-82 §1.1): manifest `name` is set to `Voice & File Converter` (the friendly name) on the assumption the Library renders `name` verbatim. Confirm.
- The three proposed tool additions above (exiftool / ripgrep / tesseract-OCR scope).
- Q1 precedent and Q3 product-posture remain Tom's formal calls (AUTO-82 §8.1) — the build follows the recommended answers.
