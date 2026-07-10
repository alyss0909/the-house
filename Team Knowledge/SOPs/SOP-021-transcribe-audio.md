# SOP-transcribe-audio — Turn an audio/video file into searchable text

- **Default owner:** Mack. Reusable by any agent (Penn invokes it for voice memos).
- **Status:** Installed by the Voice & File Converter v1.0.0. Auto-numbered into `SOP-NNN-transcribe-audio.md` at install.
- **Triggered by:** an audio or video FILE appearing in `Team Inbox/` (`.m4a`, `.mp3`, `.wav`, `.aac`, `.flac`, `.ogg`, `.mp4`, `.mov`, `.mkv`, `.webm`, ...). A bare file drop is a **soft trigger** — see Hard rules.
- **References:** `lib/transcribe-audio.sh` (the executor), [[SOP-transcribe-url]] (the URL sibling), `ADAPT-EXPANSION.md`.

## Purpose

Take a local audio/video file and produce a plain-text transcript, fully offline, using ffmpeg (decode) + whisper.cpp (transcription). No upload, no cloud, no credentials.

## Inputs

A media file path. The whisper model is read from `CONVERTER_WHISPER_MODEL` in `.env` (default `small`); the model file must have been downloaded by `scripts/fetch-models.sh`.

## Procedure

1. **Confirm with the user first.** A bare file drop never auto-runs. Larry offers: *"That looks like a voice memo — want me to turn it into searchable text?"* Proceed only on an explicit yes.
2. **Set expectations for long files.** If the recording is long (> ~15 min), tell the user roughly how long it will take before starting (transcription is CPU-bound — roughly real-time-fraction depending on model and machine).
3. **Run the wrapper:**
   ```bash
   bash Expansions/converter-pack/lib/transcribe-audio.sh "<path-to-media>"
   ```
   It prints the transcript path on success (a `.txt` in `cache/`).
4. **Hand off the transcript.** The raw `.txt` lands in the Expansion `cache/` scratch (§12 Q6 — no visible staging folder). Penn captures it into the knowledge base as a journal-shaped note; Silas shapes it if it is entity-bound.
5. **Report to the user** with the finished, filed result — never the raw cache path.

## Hard rules

- **Confirm-first.** Auto-detection identifies the file; it does NOT skip consent. If the user declines, do not re-offer for that same file.
- **Offline only.** This pipeline makes zero network calls. If whisper or ffmpeg is missing, stop and run `scripts/doctor.sh` — never substitute a cloud transcription service.
- **Quote every path.** The file path is user-supplied; the wrapper validates it and quotes it. Never `eval`.
- **Cache is scratch.** Intermediate WAVs and the raw transcript live in `cache/`, which is gitignored and removed on uninstall. The user only ever sees the filed result.

## Failure modes

| Symptom | Cause | Resolution |
|---|---|---|
| `whisper.cpp not found` | install incomplete | Run `scripts/install.sh`. |
| `model '<name>' not downloaded` | model never fetched | Run `scripts/fetch-models.sh <name>`. |
| `transcription produced no text` | silent/corrupt audio | Confirm the file actually contains speech; try a different file. |
| Very slow on a long file | CPU-bound + large model | Tell the user it is working, not stuck; suggest the `base`/`small` model for next time. |
