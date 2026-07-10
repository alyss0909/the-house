# SOP-webpage-to-text — Extract clean readable text from a web page

- **Default owner:** Mack. Reusable by any agent (Penn captures the result; Silas may shape it).
- **Status:** Installed by the Voice & File Converter v1.0.0. Auto-numbered into `SOP-NNN-webpage-to-text.md` at install.
- **Triggered by:** a user pasting an **article / blog / news page URL** plus intent — "save this article," "get the readable text of this page," "make a clean copy of this." NOT a video URL (that is [[SOP-transcribe-url]]).
- **References:** `lib/webpage-to-text.sh` (the executor), `ADAPT-EXPANSION.md`.

## Purpose

Turn a cluttered web page into a clean Markdown "transcript" — just the article body, with navigation, ads, cookie banners, and comment sections stripped out — so it can be captured into the knowledge base as readable text.

## Why this tool (verified)

The extractor is **trafilatura** (primary) with **pandoc html→markdown** (fallback). This was chosen against best practice (Perplexity review, 2026):

- **trafilatura** is best-in-class for main-content extraction / boilerplate removal — top mean F1 in the SIGIR 2023 web-extraction benchmark, actively maintained, pure-Python (no headless browser), works offline, and emits Markdown directly. It handles real-world cluttered pages.
- **pandoc** is the fallback only: it converts raw fetched HTML to Markdown but does NOT do content selection, so it keeps some page chrome. It guarantees *something* readable when trafilatura yields nothing usable.
- `monolith` (whole-page snapshot, no extraction) and raw `pandoc` as the primary were rejected — neither does boilerplate removal.

## Inputs

A `http://` or `https://` URL. **Always user-supplied and untrusted.**

## Procedure

1. **Confirm with the user.** *"Want me to pull the clean, readable text from that page and save it?"*
2. **Run the wrapper:**
   ```bash
   bash Expansions/converter-pack/lib/webpage-to-text.sh "<URL>"
   ```
   It runs trafilatura first; if the output is empty or implausibly short it falls back to pandoc. It prints the `.md` path on success.
3. **Hand off** the Markdown file from `cache/` to Penn (capture into the knowledge base) / Silas (entity shaping).
4. **Report the filed result** to the user.

## Hard rules

- **URL is untrusted.** Only `http`/`https` accepted; scheme validated; URL passed as a single quoted argument. Never `eval`.
- **No login, no credentials.** This SOP fetches public pages only. Paywalled or login-gated content is out of scope — report plainly, do not attempt to bypass.
- **One outbound GET.** The wrapper fetches the page once (trafilatura, or curl for the fallback) with a plain User-Agent. No tracking, no extra requests.
- **Confirm-first**, same consent rule as the transcription SOPs.

## Failure modes

| Symptom | Cause | Resolution |
|---|---|---|
| output is thin / mostly links | trafilatura mis-detected the body | Wrapper auto-falls back to pandoc; if still poor, the page may be JS-rendered — report that. |
| `could not fetch the page` | network error, site blocked the request | Report plainly; the page may be unavailable. |
| `trafilatura` not found | install incomplete | Run `scripts/install.sh`; the wrapper still falls back to pandoc meanwhile. |
| garbled / non-article page | the URL is an app/dashboard, not an article | Tell the user this works for articles, not web apps. |
