# ADAPT-EXPANSION — Voice & File Converter v1.1.1 (LLM operating manual)

This is the LLM-facing operating manual for this Expansion. The user reads `README.md`. Larry / Mack / Vex / Nolan / Silas read this file when WS-003 invokes the Expansion.

---

## What this Expansion is

A **connector** Expansion: Mack-owned SOPs + env vars, with executable scripts (per-OS install scripts and the `lib/` converter wrappers) and fetched binaries/models — but **no long-lived background process**. Nothing daemonises, there is no listener, and there is nothing for Larry to launch. The manifest carries no `runtime` block by design. Conversions run on demand when a SOP is invoked, then exit.

It is NOT an `agent_pack` (no new specialists). It carries **zero credentials** and registers **no MCP server** (§12 Q4 — MCP wrapper deferred). The whole pack is SOP/CLI-driven.

**v1.1.0 note — license surface changed.** v1.1 adds OCR for scanned PDFs (OCRmyPDF + Tesseract + Ghostscript) and a file-metadata inspect/strip skill (ExifTool). The OCR feature pulls in **Ghostscript, which is AGPL-3.0** — v1.0 was deliberately AGPL-free. Ghostscript is never bundled, never modified, never network-exposed: it is fetched by the system package manager and invoked only as a separate local CLI subprocess that OCRmyPDF spawns. The user-facing AGPL disclosure is in `README.md` ("Open-source tools & licenses"). Because the license surface changed, v1.1 **re-triggers the Vex/§8 security gate** before release (WS-003 §8).

## Manifest contract

- `slug: converter-pack` — folder must be `Expansions/converter-pack/`.
- `expansion_type: connector` — SOPs + env vars, no long-lived process; nothing for Larry to launch.
- `requires_agents: [Larry, Mack]` — both pre-hires, present by default in v1.7.0+.
- `env_vars` — five, all `sensitive: false`. There are NO secrets in this pack.

## What WS-003 does for this Expansion

### Step 1 — Larry: present preview

Larry shows the user: 0 agents, 7 SOPs, 5 optional non-sensitive env vars, 0 background processes, ~4 post-install steps. Larry sets the honest expectation: a package-manager prerequisite and a ~466 MB one-time model download (see `README.md` "What to expect").

### Step 2 — Security review

Per **§12 Q1 (Tom-signed): when Vex is NOT a hired agent, Larry runs the §8 security checklist himself** as the gate. The Converter Pack carries zero credentials and no long-lived runtime, so the surface is small and fully checklist-able. The checklist:

1. **Credential sweep.** Grep the whole folder for anything key-shaped (`api_key`, `token`, `secret`, `xoxb-`, `Bearer `, AWS-style keys). There must be ZERO hits. `.env.example` contains only non-sensitive tuning keys with no values. Any hit → RED.
2. **`.env.example` review.** Only `CONVERTER_WHISPER_MODEL`, `CONVERTER_WHISPER_LANG`, `CONVERTER_WHISPER_THREADS`, `CONVERTER_CACHE_DIR`, `CONVERTER_OCR_LANG`. All non-sensitive. No real values beyond `CONVERTER_WHISPER_MODEL=small`. (`common.sh` whitelists exactly these five keys when reading `.env`.)
3. **No bundled binaries.** The folder must contain NO compiled binaries and NO model files. `models/`, `bin/`, `cache/`, `.env` are gitignored and absent from the shipped ZIP. Install scripts FETCH at install time.
4. **Install-script review (`install.sh` / `install.ps1`).**
   - No `curl | sh` / `iwr | iex` bootstrap. Missing package manager → the script STOPS and instructs; it never installs Homebrew/winget/apt itself.
   - macOS/Linux uses Homebrew/apt; the Linux script prints the exact `sudo apt` line for the user to run — it never runs `sudo` itself.
   - Windows fetches whisper.cpp from a **pinned release tag** (`v1.8.4`, asset `whisper-bin-x64.zip`) — never "latest" (§12 Q7).
   - Idempotent: an already-installed tool is skipped.
5. **`fetch-models.sh` / `.ps1` review.** Downloads only from the official whisper.cpp model repo on Hugging Face (`huggingface.co/ggerganov/whisper.cpp` — the exact repo whisper.cpp's own `download-ggml-model.sh` uses). SHA-256-verifies the file after download; a mismatch deletes the file and fails. Models are never git-tracked.
6. **`lib/` wrapper review.** All nine wrappers source `lib/common.sh`, which validates input paths/URLs, quotes all variables, and never `eval`s. User-supplied URLs are scheme-checked (`http`/`https` only) and passed as single quoted args. `yt-dlp` is always called with `--no-update`. `ffmpeg` is always called with `-nostdin`. The two v1.1 wrappers — `strip-metadata.sh` and `ocr-pdf.sh` — never overwrite the user's input in place (output is always a separate file; the wrapper refuses if output == input). `ocr-pdf.sh` runs OCRmyPDF, which spawns Tesseract and Ghostscript as separate local subprocesses — no network, no credentials.
7. **Permission surface.** Manifest declares `env_vars` (five, non-sensitive) only. No `runtime` block, no `mcp_servers`, no `adds_agents`. File tree is only `lib/`, `scripts/`, `sops/` + trinity files + `INSTALL.md` + `LICENSE` + `.env.example` + `.gitignore`.
8. **License hygiene — CHANGED IN v1.1.** v1.1 adds OCR, which pulls in **Ghostscript (AGPL-3.0)** — v1.0 was deliberately AGPL-free. The pack ships NO Ghostscript binary or source; it is fetched by the package manager and used only as a CLI subprocess (no linking, no modification, no network exposure). The user-facing AGPL disclosure is in `README.md` ("Open-source tools & licenses") and the full notice is in `LICENSE`. The gate must confirm: the README AGPL disclosure is present and plainly worded; `LICENSE` lists Ghostscript as AGPL-3.0 and every other fetched tool's license; no Ghostscript binary is in the tree. **Because the license surface changed, v1.1 re-triggers this gate even though v1.0 passed — this is a fresh review, not a re-stamp.**

First time this `(slug, version)` is presented, the manifest hash is not yet in `.trusted-sources` — the gate returns YELLOW the first time, GREEN on subsequent installs of the same pair after the hash is pinned. The release pipeline (`release-pack.yml`) appends the pin on tag.

### Step 3 — Nolan: merge

Seven SOPs auto-numbered into `Team Knowledge/SOPs/`, all default owner **Mack**:

- `sops/SOP-transcribe-audio.md` → `SOP-NNN-transcribe-audio.md`
- `sops/SOP-transcribe-url.md` → `SOP-NNN-transcribe-url.md`
- `sops/SOP-webpage-to-text.md` → `SOP-NNN-webpage-to-text.md`
- `sops/SOP-convert-images-pdf.md` → `SOP-NNN-convert-images-pdf.md`
- `sops/SOP-convert-documents.md` → `SOP-NNN-convert-documents.md`
- `sops/SOP-ocr-scanned-pdf.md` → `SOP-NNN-ocr-scanned-pdf.md`        (new in v1.1)
- `sops/SOP-inspect-strip-metadata.md` → `SOP-NNN-inspect-strip-metadata.md`  (new in v1.1)

No agents. No guidelines. No templates. No new workstreams.

### Step 4 — Silas: integrity

Confirm the seven SOPs validate frontmatter, wikilinks resolve, and the SOP index has the new rows.

### Step 5 — Mack: tool wiring (the meat)

1. **Run the installer.** macOS/Linux: `scripts/install.sh`. Windows: `scripts/install.ps1`. The installer fetches ffmpeg, yt-dlp, pandoc, ImageMagick, qpdf, poppler, trafilatura, whisper.cpp, ExifTool, OCRmyPDF, Tesseract, and Ghostscript. If the package manager is missing, the installer stops — walk the user through getting Homebrew (macOS) / App Installer (Windows) / the `sudo apt` line (Linux). NEVER bootstrap a package manager for them.
2. **Fetch the model.** `scripts/fetch-models.sh small` (default — §12 Q3). Offer the three-way quality choice (Quicker = `base`, Recommended = `small`, Most accurate = `large-v3-turbo`) before downloading. Narrate the ~466 MB download with progress.
3. **Verify.** Run `scripts/doctor.sh` (`doctor.ps1` on Windows). It must exit 0. `post_install_validation` runs `doctor.sh --quiet`. doctor checks the OCR trio (ocrmypdf/tesseract core, ghostscript optional) and exiftool as well.
4. **No env prompts needed.** All five env vars are optional and non-sensitive; `.env` is copied from `.env.example` automatically. Do not prompt the user for anything unless they want to tune.
5. **No runtime to launch.** This is a `connector` — there is no background process and no `runtime` block. Do not launch anything.

### Step 6 — Larry: post-install validation

`Team Knowledge/SOPs/` exists; `doctor.sh --quiet` exits 0.

### Step 7 — Larry: archive + announce

Archive to `Expansions/_installed/converter-pack-1.1.0/.manifest.json`. Update `Expansions/INDEX.md`. Announce per `README.md` "completion message" — point the user at dropping a test voice memo into `Team Inbox/`.

---

## Operating notes for Larry

- **Soft trigger.** A bare audio/video file in `Team Inbox/` identifies the input but does NOT auto-run. Larry OFFERS ("that looks like a voice memo — want a transcript?") and waits for an explicit yes. If the user declines, do not re-offer for that same file.
- **The vaguer the signal, the more explicit the offer.** A bare file drop → a full offer. An explicit "transcribe this link" → a brief confirm. An explicit "make these a PDF" → a one-line confirm, then proceed.
- **Pick the right SOP** by the input: audio/video file → `SOP-transcribe-audio`; video/audio URL → `SOP-transcribe-url`; article/web-page URL → `SOP-webpage-to-text`; images↔PDF → `SOP-convert-images-pdf`; document/media format conversion → `SOP-convert-documents`; a scanned/image-only PDF the user wants searchable → `SOP-ocr-scanned-pdf`; "what's hidden in this file" / "strip the metadata" → `SOP-inspect-strip-metadata`.
- **Scanned PDF vs born-digital PDF.** If a PDF already has selectable text, plain extraction (`SOP-convert-documents`, `pdftotext`) is right. Use `SOP-ocr-scanned-pdf` only when the PDF is image-only — `pdftotext` returns little or nothing.
- **Communicate slowness kindly.** Transcription is CPU-bound. For long files, give a concrete estimate before starting and reassure mid-run ("working on it, not stuck").
- **Outputs land in `cache/`** (scratch — §12 Q6). The user never sees the raw cache path; Penn/Silas file the result and Larry reports the finished, filed note.

## Operating notes for Mack

- The `lib/` wrappers are the executors; the SOPs document the contract and the manual fallback. Always invoke the wrapper rather than re-deriving the command.
- If a tool is missing, run `scripts/doctor.sh` and report exactly what is missing — never substitute a cloud service for a missing local tool.
- The webpage extractor is **trafilatura primary, pandoc fallback** — the choice was verified against best practice (SIGIR 2023 benchmark; trafilatura top mean F1 for boilerplate removal). Do not swap it without re-verifying.
- OCR is **OCRmyPDF driving Tesseract, with Ghostscript as OCRmyPDF's renderer** — the de-facto CLI standard for scanned-PDF→searchable-PDF, verified against best practice (Perplexity, 2026). `ocr-pdf.sh` passes `--skip-text --rotate-pages --deskew`. Ghostscript is invoked only by OCRmyPDF as a subprocess — never embed or link it; the subprocess boundary is what keeps the AGPL copyleft off this pack.
- The metadata tool is **ExifTool**. `strip-metadata.sh` is non-destructive by contract: it always writes a separate cleaned copy and never edits the user's original in place. Some fields (ICC colour profile, orientation) survive `-all=` by design so the image still displays — report that honestly, do not claim "zero metadata."

## Uninstall

Symmetric. `scripts/uninstall.sh` (`uninstall.ps1` on Windows) removes the pack-local `models/`, `cache/`, and `bin/` and clears `.env`. Nolan removes the seven SOPs from `Team Knowledge/SOPs/`. Silas validates. Larry archives and `rm-rf`s the folder.

**System package-manager tools are LEFT IN PLACE** (§12 Q2 — ffmpeg, pandoc, Ghostscript, Tesseract, etc. may be used by other software; ripping them out is destructive). The README states this plainly. There is nothing in `uninstall.residual_paths` outside the seven SOPs — `cache/` and `models/` are inside the Expansion folder and gitignored, so there is no leftover.

## Open items / known gaps

- **MCP wrapper** — a converter MCP server so conversions are callable as tools, not only via SOP/CLI. No end-user-visible benefit; deferred (§12 Q4).
- **Batch conversion** — convert a whole folder in one pass. Still open.
- **Document → PDF output** — the pack does not do document→PDF at all (no managed PDF engine; it will not use a stray unmanaged one). A later version may add a lightweight, pack-managed HTML→PDF path.
- **ripgrep / transcript search** — fast full-text search over transcripts and extracted text was a proposed addition. Mack's AUTO-153 ruling: **search is a horizontal, vault-wide capability that belongs to the core scaffold's search layer, not to a format-conversion pack** — wiring it here would couple a generic search tool to a converter toolkit and overlap with core. Left out of v1.1; recommended to Tom as a core-scaffold capability.

### Delivered in v1.1.0 (AUTO-153)

- **OCR for scanned PDFs** — `SOP-ocr-scanned-pdf` + `lib/ocr-pdf.sh` (OCRmyPDF + Tesseract + Ghostscript). Adds the AGPL Ghostscript component; the README carries the AGPL disclosure. `expansion_type` stays `connector` (Vex AUTO-152 F-1 ruling — OCR adds no long-lived process).
- **File metadata inspect/strip** — `SOP-inspect-strip-metadata` + `lib/strip-metadata.sh` (ExifTool). Privacy capability; non-destructive.
