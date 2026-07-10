# SOP-inspect-strip-metadata — Inspect or strip embedded file metadata

- **Default owner:** Mack. Reusable by any agent.
- **Status:** Installed by the Voice & File Converter v1.1.0. Auto-numbered into `SOP-NNN-inspect-strip-metadata.md` at install.
- **Triggered by:** a user with a file + a privacy/metadata intent — "what's hidden in this photo," "does this image have GPS in it," "strip the metadata before I file/share this," "clean this document."
- **References:** `lib/strip-metadata.sh` (the executor), `ADAPT-EXPANSION.md`.

## Purpose

Two related operations on the metadata embedded inside a file (EXIF, GPS, XMP, IPTC, camera serials, author names, editing-software tags):

- **Inspect** — show every metadata field a file carries. Read-only; the file is never modified.
- **Strip** — remove all metadata, writing a *cleaned copy* to a new path. The original is **never** modified in place.

This is a privacy capability. The most common silent PKM leak is not the file's content — it is the GPS coordinates, camera serial number, or author name that travels invisibly with an image or document when it is filed, linked, or shared. Backed by ExifTool.

## Inputs

- Inspect: a file path.
- Strip: a file path, plus an optional output path. With no output path, the cleaned copy lands in the Expansion `cache/` scratch.

## Procedure

1. **Confirm intent.** "Strip the metadata" / "clean this" is explicit — a brief confirm is enough. For *inspect*, just run it; it changes nothing.
2. **Run the wrapper.**
   - Inspect:
     ```bash
     bash Expansions/converter-pack/lib/strip-metadata.sh inspect "<file>"
     ```
   - Strip:
     ```bash
     bash Expansions/converter-pack/lib/strip-metadata.sh strip "<file>" ["<output-file>"]
     ```
   Inspect prints the metadata report; strip prints the cleaned copy's path.
3. **Hand off** the cleaned copy from `cache/` for filing, or place it where the user asked.
4. **Report** the finished result — and, on strip, note plainly that the original file is untouched.

## Hard rules

- **The original is never modified.** Strip always writes a separate cleaned copy. The wrapper refuses if the output path equals the input path. Never edit the user's file in place.
- **Inspect is read-only.** It never writes.
- **All paths validated and quoted.** Inputs are checked for existence/non-emptiness. Never `eval`.
- **Some fields survive on purpose.** `-all=` removes every writable metadata block, but a colour (ICC) profile or orientation tag may remain so the image still displays correctly. The wrapper reports how many non-file fields remain — relay that honestly; do not claim "zero bytes of metadata."
- **Offline only.** ExifTool makes zero network calls. No credentials.

## Failure modes

| Symptom | Cause | Resolution |
|---|---|---|
| `'exiftool' is not installed` | install incomplete | Run `scripts/install.sh`. |
| `output path must differ from the input` | strip called with output == input | Give a different output path, or omit it to use `cache/`. |
| strip leaves some fields | ICC profile / orientation kept by design | Expected — explain these are display-critical, not private data. |
| `metadata strip produced an empty file` | unsupported / corrupt input format | Report; confirm the file is a real image/document ExifTool supports. |
