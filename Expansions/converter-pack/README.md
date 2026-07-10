# Voice & File Converter

Turn voice memos, recordings, and video links into searchable text — and convert between the everyday file formats you actually deal with. Everything runs on your own computer. Nothing is uploaded.

## What this pack does

Drop in a voice memo, a recording, or a video link and get back clean, searchable text. Combine images into a PDF, split a PDF back into pages, and convert documents between Word, Markdown, web pages, and e-book formats. It runs entirely on your machine — your recordings and your files never leave your computer.

It is for knowledge workers who want their recordings and files turned into text they can search, link, and keep — without sending anything to a cloud service.

## What you can do with it

Use it to:

- Turn a quick voice memo into notes you can search later.
- Get a transcript of a meeting or call so you can pull out action items.
- Get the transcript from a YouTube or video link without rewatching it.
- Pull the clean, readable text out of a cluttered web article — ads and menus removed.
- Combine a set of images into a single PDF — or split a PDF into pages.
- Convert a document between Word, Markdown, web page, and e-book formats.
- Convert audio between formats (MP3, M4A, WAV, and more), and turn iPhone photos (HEIC) into standard images.
- Make a scanned PDF searchable — turn a scan into text you can select and search.
- See what hidden information a file carries (like GPS location or camera details) — and strip it out before you file or share the file.

## How it works in practice

1. **Drop a file, or paste a link.** Put a voice memo, recording, or video into your Team Inbox folder — or paste a video or article link and ask for the text.
2. **Your team offers to help.** When it spots a recording, it ASKS if you want a transcript. It never starts on its own.
3. **It runs on your computer.** Transcription and conversion happen locally. A 30-minute recording usually takes a few minutes.
4. **You get text back.** The result is saved and your team captures it into your knowledge base.

## What to expect

- **Setup:** about 5–15 minutes the first time, mostly a one-time download.
- **Privacy:** everything runs on your own computer. Your recordings, files, and transcripts are never uploaded.
- **Speed:** short memos finish in well under a minute. A 30-minute recording typically takes a few minutes. Long recordings take longer — your team will tell you before it starts.
- **Quality:** clear speech with one or two speakers works best. Noisy rooms or lots of cross-talk can reduce accuracy.

## Getting started

1. Drop this folder into your `Expansions/` directory in your myPKA folder. Larry detects it and runs [[WS-003-install-an-expansion]].
2. Larry walks you through installing the free helper tools and downloading the speech-to-text engine. See `INSTALL.md` for the step-by-step.
3. Drop a short voice memo into your `Team Inbox/` folder.
4. When Larry offers, say "yes, transcribe it."
5. Open the transcript Larry captured into your knowledge base. Done.

## Good to know

- **Choosing transcription quality.** Three settings: *Quicker* (smaller, faster), *Recommended* (the default — best balance), *Most accurate* (largest, best with accents and noise). You can change it any time; it never affects your existing notes. See "For power users" below.
- **Supported file formats.**
  - Audio/video in: m4a, mp3, wav, aac, flac, ogg, mp4, mov, mkv, webm.
  - Documents: docx, md, html, epub, odt, rtf, txt, and more (via pandoc).
  - Images: jpg, png, tiff, webp, heic.
  - PDF: combine images → PDF, split PDF → pages, extract PDF text, and make a scanned PDF searchable.
- **Making a scanned PDF searchable.** If a PDF is a scan — pages that are pictures, where you can't select the text — ask your team to make it searchable. It reads the words off the page and adds them back as selectable, searchable text.
- **Checking and removing hidden file information.** Photos and documents often carry hidden details — where a photo was taken (GPS), the camera used, the author's name. Ask your team to "check what's hidden in this file," or to "strip the metadata" before you file or share it. Stripping always makes a clean copy; your original file is never changed.
- **How to remove this pack.** Tell Larry "remove the Voice & File Converter." Larry removes the pack folder and its 7 skills. The free helper tools installed on your system (for handling audio, video, documents, scanned PDFs, and file metadata) are **left in place** — other apps on your computer may use them. You can remove those yourself later if you want.
- **If something goes wrong.** Ask Larry to "run the converter health check." It checks every tool and the model and tells you exactly what, if anything, is missing.
- **More coming.** We're exploring cleaner transcript formatting and batch conversion of whole folders at once. No firm dates — we'll tell you when they land.

## For power users

- **Changing the model.** Set `CONVERTER_WHISPER_MODEL` in `.env` to `base`, `small`, `medium`, or `large-v3-turbo`, then run `scripts/fetch-models.sh <model>`. `.env` is optional — the pack works with no configuration at all.
- **Other `.env` settings.** `CONVERTER_WHISPER_LANG` forces a transcription language; `CONVERTER_WHISPER_THREADS` sets CPU threads; `CONVERTER_CACHE_DIR` relocates the scratch folder; `CONVERTER_OCR_LANG` sets the language for scanned-PDF text recognition (default English). See `.env.example`.
- **The seven skills (SOPs)** this pack adds, all owned by Mack: transcribe an audio/video file, transcribe a video link, extract readable text from a web page, combine/split image↔PDF, convert documents/media between formats, make a scanned PDF searchable, and inspect/strip file metadata.
- **Architecture.** This is a tool-driven Expansion: no background process, no MCP server, no credentials. The skills call small, audited bash wrappers in `lib/` that drive free, open-source tools (ffmpeg, whisper.cpp, yt-dlp, pandoc, ImageMagick, poppler, trafilatura, ExifTool, OCRmyPDF, Tesseract, Ghostscript). See `ADAPT-EXPANSION.md`.

## Privacy & security

- **Nothing is uploaded.** Transcription and conversion run entirely on your machine. No cloud service, no API, no account.
- **No credentials.** This pack has no API keys and never asks for one. `.env` holds only non-sensitive tuning settings.
- **No background process.** Nothing runs unless you ask for a conversion.
- **You stay in control.** Your team always asks before transcribing or converting a file. It never starts on its own.
- The free tools this pack uses are fetched from their official sources at install time — never bundled, never from an untrusted location.

## Open-source tools & licenses

This pack does not ship any tools itself. During setup it fetches a set of free, open-source helper tools from their official sources, and they run entirely on your own computer. Each tool keeps its own license; the full list is in `LICENSE`.

One of those tools is worth calling out plainly:

- **Ghostscript** — used only by the "make a scanned PDF searchable" feature. Ghostscript is licensed under the **GNU Affero General Public License v3.0 (AGPL-3.0)**. This pack does not bundle it, does not modify it, and never exposes it over a network — it is fetched by your system's package manager and used only as a separate command-line program on your own machine, alongside the OCR tool. The AGPL applies to Ghostscript itself; it does not affect this pack, your notes, or your files. If you never use the scanned-PDF feature, Ghostscript is never run.

All the other helper tools are under permissive or standard open-source licenses (MIT, Apache-2.0, GPL, LGPL, MPL-2.0). The full per-tool list, with links, is in `LICENSE`.

## License

Proprietary — myICOR AI Library Software License. See `LICENSE`. The third-party open-source tools this pack fetches are each under their own licenses, listed in `LICENSE`, including the AGPL-3.0 note for Ghostscript above.
