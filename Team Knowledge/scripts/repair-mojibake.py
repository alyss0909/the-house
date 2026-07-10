#!/usr/bin/env python3
"""
Repair UTF-8 text that was accidentally decoded as Windows-1252 and saved.

Dry-run by default. Use --apply to rewrite changed markdown files.
"""

from __future__ import annotations

import argparse
import re
from pathlib import Path


MOJIBAKE_RUN = re.compile(
    r"[\u0080-\u009f\u00a0-\u00ff\u0152\u0153\u0160\u0161\u0178"
    r"\u017d\u017e\u0192\u02c6\u02dc\u2010-\u203a\u20ac\u2122]+"
)
TRIGGER = re.compile(r"[\u00e2\u00c2\u00c3\u00f0\u00ef\ufffd]")
SKIP_DIRS = {".git", ".obsidian", ".trash", "__pycache__"}


def cp1252_original_bytes(text: str) -> bytes:
    """Map mojibake characters back to the bytes they originally represented."""
    out = bytearray()
    for char in text:
        codepoint = ord(char)
        if 0x80 <= codepoint <= 0x9F:
            out.append(codepoint)
        else:
            out.extend(char.encode("cp1252"))
    return bytes(out)


def fix_run(match: re.Match[str]) -> str:
    candidate = match.group(0)
    if not TRIGGER.search(candidate):
        return candidate

    try:
        return cp1252_original_bytes(candidate).decode("utf-8")
    except (UnicodeEncodeError, UnicodeDecodeError):
        return candidate


def repair_text(text: str) -> str:
    return MOJIBAKE_RUN.sub(fix_run, text)


def iter_markdown(root: Path):
    for path in root.rglob("*.md"):
        if any(part in SKIP_DIRS for part in path.parts):
            continue
        yield path


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("root", nargs="?", default=".", help="myPKA root folder")
    parser.add_argument("--apply", action="store_true", help="rewrite changed files")
    parser.add_argument("--quiet", action="store_true", help="only print summary")
    args = parser.parse_args()

    root = Path(args.root)
    changed: list[Path] = []

    for path in iter_markdown(root):
        text = path.read_text(encoding="utf-8")
        repaired = repair_text(text)
        if repaired == text:
            continue

        changed.append(path)
        if args.apply:
            path.write_text(repaired, encoding="utf-8", newline="\n")
        if not args.quiet:
            print(path)

    action = "repaired" if args.apply else "would repair"
    print(f"{action}: {len(changed)} markdown files")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
