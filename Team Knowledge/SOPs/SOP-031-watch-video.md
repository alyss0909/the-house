# SOP-watch-video — Watch a video and answer a question about it

- **Default owner:** Mack. Reusable by any agent.
- **Status:** Installed by the Claude Video Expansion. Auto-numbered into `SOP-NNN-watch-video.md` at install.
- **Triggered by:** a user pasting a video URL (YouTube, Loom, TikTok, X, Instagram, Vimeo, or any yt-dlp-supported site) or a local video path (`.mp4`, `.mov`, `.mkv`, `.webm`) **plus a question or intent** — e.g. "what happens at 0:30", "summarize this video", "what's wrong in this screen recording".
- **References:** `lib/watch.py` (entry point), `lib/SKILL.md` (full upstream contract — read this before the first run of a session), `lib/setup.py` (preflight/installer), `ADAPT-EXPANSION.md`.

## Purpose

Take a user-supplied video (URL or local file) and a question, and answer it grounded in what is actually on screen and said — not a guessed summary from a title. The script pulls captions first (free, instant), falls back to Whisper transcription only when no captions exist, extracts frames at an auto-scaled budget, and hands frame paths + timestamped transcript back for the agent to `Read` and reason over.

## Inputs

A video URL (`http://`/`https://`, always user-supplied and untrusted) or a local file path, plus the user's question.

## Procedure

1. **Confirm with the user** if intent is ambiguous — a pasted link/path plus a question is usually clear enough to proceed without asking.
2. **First run of a session:** read `Expansions/claude-video/lib/SKILL.md` in full — it is the canonical, actively-maintained contract for flags, detail modes, and frame budgets. Run preflight:
   ```bash
   python3 Expansions/claude-video/lib/setup.py --json
   ```
   Follow its `first_run` / `missing_binaries` / `needs_key` branches exactly as documented in `SKILL.md` Step 0. A missing Whisper key is not a blocker — captions cover most public videos for free.
3. **Run the watcher:**
   ```bash
   python3 Expansions/claude-video/lib/watch.py "<url-or-path>" [--start T1] [--end T2] [--detail transcript|efficient|balanced|token-burner]
   ```
   Use `--start`/`--end` whenever the user names a specific moment — denser frame budget, lower token cost than a full-video scan.
4. **`Read` every frame path** the script prints (in parallel), and read the printed transcript.
5. **Answer the user's question** grounded in the frames actually seen and the transcript actually read — never "based on the title" or a guessed summary.
6. **Cleanup.** The script prints a working directory at the end. If the user isn't asking follow-ups about the same video, remove it.

## Hard rules

- **URL is untrusted.** Only `http`/`https` schemes are passed through; never `eval`, never word-split a URL before handing it to the script.
- **No login, no cookies, no credentials.** This SOP only fetches public content. If a site requires authentication, stop and tell the user.
- **Respect the source.** Only watch content the user has the right to download/view. The user is the data controller.
- **Confirm-first** on ambiguous intent, same as [[SOP-022-transcribe-url]].
- **Whisper key handling.** `GROQ_API_KEY` / `OPENAI_API_KEY` live only in `~/.config/watch/.env` (mode `0600`), never committed, never echoed unmasked.
- **Long videos:** on capped detail modes (`efficient`, `balanced`), coverage thins past ~10 minutes. Re-run focused with `--start`/`--end`, or use `--detail token-burner` for full uncapped coverage.

## Failure modes

| Symptom | Cause | Resolution |
|---|---|---|
| `scripts/watch.py not found` | wrong working directory | Run from myPKA root; the script path is `Expansions/claude-video/lib/watch.py`. |
| `ffmpeg` / `yt-dlp` missing | first-run setup incomplete | Re-run `lib/setup.py --json`, follow the printed install commands for the platform. |
| "sparse scan" warning | long video on a capped detail mode | Re-run focused with `--start`/`--end`, or `--detail token-burner`. |
| No transcript, no Whisper key | no captions on source, no API key set | Encourage a Groq or OpenAI key, or accept frames-only answering. |
| Download blocked/geo-restricted | source site refuses the request | Report plainly; the link may be private or region-locked. |
