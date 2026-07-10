# Voice & File Converter — Install Walkthrough

Setup takes about 5–15 minutes the first time — mostly a one-time download. You only do this once. Larry walks you through it conversationally; this file is the reference if you want to see every step.

## What gets installed

- A handful of **free, open-source helper tools** for handling audio, video, images, PDFs, documents, scanned-PDF text recognition, and file metadata (ffmpeg, yt-dlp, pandoc, ImageMagick, qpdf, poppler, trafilatura, ExifTool, OCRmyPDF, Tesseract, Ghostscript).
- A **speech-to-text engine** (whisper.cpp) plus one **model file** — a one-time ~466 MB download (the "Recommended" quality).
- **7 new skills** added to your team.

Nothing is bundled in this pack — the helper tools and the model are fetched fresh from their official sources during install. Nothing is uploaded from your computer at any point.

> One of the helper tools, **Ghostscript**, is licensed under the AGPL-3.0. It is used only by the scanned-PDF feature, only as a separate program on your own machine, and is never network-exposed. See the README's "Open-source tools & licenses" section. If you do not OCR scanned PDFs, it is never used.

---

## 1. You need a package manager

The installer fetches the helper tools through your system's package manager. It will **not** install a package manager for you (piping an install script into your shell is unsafe). If you do not have one, the installer stops and tells you exactly how to get it:

| Your computer | Package manager | If you do not have it |
|---|---|---|
| macOS | Homebrew | Install from https://brew.sh (~2–5 min, one Terminal command) |
| Windows | winget (App Installer) | Free from the Microsoft Store: https://apps.microsoft.com/detail/9NBLGGH4NNS1 |
| Linux (Debian/Ubuntu) | apt | Already on your system |

Larry walks you through this gently if you are missing it — it is never a dead end.

---

## 2. Run the installer

**macOS / Linux:**

```bash
bash Expansions/converter-pack/scripts/install.sh
```

On **Linux**, the installer prints a single `sudo apt` command for you to copy and run yourself — it never runs `sudo` on your behalf. Run it, then re-run the installer with `--verify-only`.

**Windows:**

```powershell
powershell -ExecutionPolicy Bypass -File Expansions\converter-pack\scripts\install.ps1
```

The installer skips any tool you already have, so it is safe to re-run.

---

## 3. Download the speech-to-text model

Pick a quality level, then download it:

| Setting | Model | Size | Best for |
|---|---|---|---|
| Quicker | `base` | ~142 MB | Clear single-speaker audio; older/slower computers |
| **Recommended** | `small` | **~466 MB** | **Most people — meetings, lectures, memos (the default)** |
| Most accurate | `large-v3-turbo` | ~1.5 GB | Accents, background noise, cross-talk |

**macOS / Linux:**

```bash
bash Expansions/converter-pack/scripts/fetch-models.sh small
```

**Windows:**

```powershell
powershell -ExecutionPolicy Bypass -File Expansions\converter-pack\scripts\fetch-models.ps1 small
```

The file is checked for integrity after it downloads. You can change the model later — it never affects any of your notes.

---

## 4. Verify everything

**macOS / Linux:**

```bash
bash Expansions/converter-pack/scripts/doctor.sh
```

**Windows:**

```powershell
powershell -ExecutionPolicy Bypass -File Expansions\converter-pack\scripts\doctor.ps1
```

You should see `RESULT: all core tools present`. If anything is missing, the health check tells you exactly which step to re-run.

---

## 5. (Optional) Tune the defaults

The pack works with **zero configuration**. Only if you want to change something:

```bash
cp Expansions/converter-pack/.env.example Expansions/converter-pack/.env
```

`.env` holds only non-sensitive settings (which model, transcription language, CPU threads, scratch folder, OCR language). There are no passwords or API keys anywhere in this pack.

---

## 6. Try it

Drop a short voice memo into your `Team Inbox/` folder. Larry will offer to transcribe it. Say "yes," and the transcript is captured into your knowledge base.

---

## Troubleshooting

- **macOS: "install.sh cannot be opened" / "Apple could not verify…":** this is the Gatekeeper quarantine flag on the downloaded pack — not a real problem. Run the installer from Terminal (as in step 2); it clears the flag automatically. If you still hit it, run `xattr -dr com.apple.quarantine "<path-to-your-myPKA>/Expansions/converter-pack"`.
- **"Homebrew not found" (macOS):** install Homebrew from https://brew.sh, then re-run the installer. Larry can walk you through it.
- **"winget not found" (Windows):** install **App Installer** from the Microsoft Store, then re-run.
- **The model download was interrupted:** just re-run `fetch-models.sh` — it resumes where it stopped.
- **A transcription is very slow:** long recordings on the "Most accurate" setting take a while on older computers. It is working, not stuck. Switch to the "Recommended" or "Quicker" model in `.env` for next time.
- **A web page came out messy:** the page may be a web app rather than an article, or it may render its content with JavaScript. The extractor works best on articles, blog posts, and news pages.

For ongoing checks, ask Larry to "run the converter health check" any time.
