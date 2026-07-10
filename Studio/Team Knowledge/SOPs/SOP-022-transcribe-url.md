# SOP-transcribe-url — Get a transcript from a video or audio link

- **Default owner:** Mack. Reusable by any agent.
- **Status:** Installed by the Voice & File Converter v1.0.0. Auto-numbered into `SOP-NNN-transcribe-url.md` at install.
- **Triggered by:** a user pasting a video/audio URL (YouTube and other yt-dlp-supported sites) **plus intent** — e.g. "get the transcript of this," "transcribe this video."
- **References:** `lib/transcribe-url.sh` (the executor), [[SOP-transcribe-audio]] (the local-file fallback path), `ADAPT-EXPANSION.md`.

## Purpose

Take a user-supplied video/audio URL and return a transcript. Fast path: pull an existing caption/subtitle track (instant). Slow path: if no captions exist, download just the audio and transcribe it locally via [[SOP-transcribe-audio]].

## Inputs

A `http://` or `https://` URL. The URL is **always user-supplied and untrusted.**

## Procedure

1. **Confirm with the user.** A pasted link + intent is a clearer signal than a bare file drop, but still confirm: *"Want me to get the transcript from that video link?"*
2. **Run the wrapper:**
   ```bash
   bash Expansions/converter-pack/lib/transcribe-url.sh "<URL>"
   ```
   It first tries captions via `yt-dlp --no-update`; if none exist it downloads audio and hands off to the local transcription pipeline. It prints the transcript path on success.
3. **Hand off the transcript** exactly as in [[SOP-transcribe-audio]] step 4 — into `cache/`, then Penn/Silas file it.
4. **Report the finished, filed result** to the user.

## Hard rules

- **`yt-dlp --no-update` always.** The wrapper never lets yt-dlp self-update at our call site. Do not remove that flag.
- **URL is untrusted.** Only `http`/`https` are accepted; the wrapper validates the scheme and passes the URL as a single quoted argument. Never `eval`, never word-split a URL.
- **No login, no cookies, no credentials.** This SOP only fetches public content. If a site requires authentication, stop and tell the user — do not supply credentials.
- **Respect the source.** Only transcribe content the user has the right to download. The user is the data controller (see LICENSE).
- **Confirm-first.** Same consent rule as [[SOP-transcribe-audio]].

## Failure modes

| Symptom | Cause | Resolution |
|---|---|---|
| `URL must start with http`... | bad/empty input | Ask the user to paste a full link. |
| `could not download audio` | site blocked, geo-restricted, removed | Report plainly; the link may be private or unavailable. |
| Captions present but garbled | auto-generated low-quality captions | Re-run forcing the audio path, or accept and clean up. |
| `whisper.cpp not found` (audio path) | install incomplete | Run `scripts/install.sh` + `scripts/fetch-models.sh`. |
