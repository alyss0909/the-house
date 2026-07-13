#!/usr/bin/env python3
"""
Telegram capture MVP for myPKA.

Polls a Telegram bot and writes incoming messages to Notebook/Inbox as markdown
capture notes. This is intentionally simple: command hints decide the route;
LLM classification and Notion writes can be layered on after the pipe works.
"""

from __future__ import annotations

import datetime as dt
import argparse
import json
import os
import re
import time
import urllib.parse
import urllib.request
from pathlib import Path
from typing import Any


SCRIPT_DIR = Path(__file__).resolve().parent
# SCRIPT_DIR = <vault>/Studio/Team Knowledge/scripts -> vault root is 3 levels up.
# NOTE: this was `.parents[1]` (2 levels up) before the 2026-07-09/10 restructure
# moved `Team Knowledge/` one level deeper into `Studio/`. That off-by-one silently
# resolved VAULT_ROOT to `<vault>/Studio` instead of `<vault>`, which would have
# written every future capture to `Studio/Notebook/Inbox` (a folder that doesn't
# exist in the real vault layout) instead of the real `Notebook/Inbox`. Fixed
# 2026-07-13 before any capture landed in the wrong place. If this script or
# `Team Knowledge/` moves again, update this line.
VAULT_ROOT = SCRIPT_DIR.parents[2]
TEAM_INBOX = VAULT_ROOT / "Notebook" / "Inbox"
# Secrets and runtime state live OUTSIDE the vault per security rule
# (no credentials inside the OneDrive-synced vault). Moved 2026-07-10.
CONFIG_DIR = Path.home() / ".config" / "telegram-capture"
ENV_FILE = CONFIG_DIR / "telegram-capture.env"
STATE_FILE = CONFIG_DIR / ".telegram-capture-state.json"
# Internal log, written by the script itself so there's a diagnostic trail
# regardless of how Task Scheduler launches it (the live task has no stdout/
# stderr redirect). Lives outside the vault next to the other runtime state.
LOG_FILE = CONFIG_DIR / "telegram-capture.log"
POLL_TIMEOUT_SECONDS = 30
POLL_ERROR_BACKOFF_SECONDS = 15

ROUTE_COMMANDS = {
    "/content": "notion-content-bank",
    "/notion": "notion-content-bank",
    "/prc": "notion-content-bank",
    "/boh": "notion-content-bank",
    "/obsidian": "obsidian",
    "/parenting": "obsidian-parenting",
    "/home": "obsidian-home",
}


def log(message: str) -> None:
    """Print (for interactive/manual runs) and append to LOG_FILE (for
    unattended Task Scheduler runs, which have no stdout capture)."""
    stamped = f"{dt.datetime.now().astimezone().isoformat(timespec='seconds')} {message}"
    print(stamped, flush=True)
    try:
        LOG_FILE.parent.mkdir(parents=True, exist_ok=True)
        with LOG_FILE.open("a", encoding="utf-8") as handle:
            handle.write(stamped + "\n")
    except OSError:
        pass  # logging must never crash the capture loop


def load_env_file(path: Path) -> None:
    if not path.exists():
        return

    for raw_line in path.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, value = line.split("=", 1)
        os.environ.setdefault(key.strip(), value.strip().strip('"').strip("'"))


def telegram_api(token: str, method: str, params: dict[str, Any]) -> dict[str, Any]:
    query = urllib.parse.urlencode(params)
    url = f"https://api.telegram.org/bot{token}/{method}?{query}"
    with urllib.request.urlopen(url, timeout=POLL_TIMEOUT_SECONDS + 10) as response:
        payload = json.loads(response.read().decode("utf-8"))
    if not payload.get("ok"):
        raise RuntimeError(f"Telegram API error from {method}: {payload}")
    return payload


def load_offset() -> int | None:
    if not STATE_FILE.exists():
        return None
    try:
        return int(json.loads(STATE_FILE.read_text(encoding="utf-8")).get("offset"))
    except Exception:
        return None


def save_offset(offset: int) -> None:
    STATE_FILE.parent.mkdir(parents=True, exist_ok=True)
    STATE_FILE.write_text(json.dumps({"offset": offset}, indent=2), encoding="utf-8")


def slugify(value: str) -> str:
    value = value.lower().strip()
    value = re.sub(r"https?://\S+", " link ", value)
    value = re.sub(r"[^a-z0-9]+", "-", value)
    value = value.strip("-")
    return value[:64] or "telegram-capture"


def extract_text(message: dict[str, Any]) -> str:
    return (
        message.get("text")
        or message.get("caption")
        or "[non-text Telegram message]"
    )


def first_command(text: str) -> str | None:
    first = text.strip().split(maxsplit=1)[0].lower() if text.strip() else ""
    return first if first in ROUTE_COMMANDS else None


def clean_note_text(text: str, command: str | None) -> str:
    if not command:
        return text.strip()
    return text.strip()[len(command):].strip()


def extract_links(text: str) -> list[str]:
    return re.findall(r"https?://\S+", text)


def media_summary(message: dict[str, Any]) -> list[str]:
    media = []
    for key in ("photo", "voice", "video", "document", "audio", "animation"):
        if key in message:
            media.append(key)
    return media


def write_capture(message: dict[str, Any]) -> Path:
    now = dt.datetime.now().astimezone()
    text = extract_text(message)
    command = first_command(text)
    route = ROUTE_COMMANDS.get(command or "", "needs-routing")
    note_text = clean_note_text(text, command)
    links = extract_links(text)
    media = media_summary(message)
    chat = message.get("chat", {})
    sender = message.get("from", {})
    title_source = note_text or "telegram capture"
    filename = f"{now:%Y-%m-%d-%H-%M}-{slugify(title_source)}.md"
    target = TEAM_INBOX / filename

    frontmatter = {
        "source": "telegram",
        "status": "inbox",
        "route_hint": route,
        "command": command,
        "captured_at": now.isoformat(timespec="seconds"),
        "telegram_message_id": message.get("message_id"),
        "telegram_chat_id": chat.get("id"),
        "telegram_from": sender.get("username") or sender.get("first_name"),
        "links": links,
        "media": media,
    }

    yaml_lines = ["---"]
    for key, value in frontmatter.items():
        yaml_lines.append(f"{key}: {json.dumps(value, ensure_ascii=False)}")
    yaml_lines.append("---")

    body = [
        *yaml_lines,
        "",
        f"# Telegram capture - {now:%Y-%m-%d %H:%M}",
        "",
        "## Note",
        "",
        note_text or "_No note text provided._",
        "",
        "## Links",
        "",
        *(f"- {link}" for link in links),
        "",
        "## Raw Telegram Text",
        "",
        "```text",
        text,
        "```",
        "",
    ]

    if media:
        body.extend(["## Media", "", *(f"- {item}" for item in media), ""])

    TEAM_INBOX.mkdir(parents=True, exist_ok=True)
    target.write_text("\n".join(body), encoding="utf-8")
    return target


def send_confirmation(token: str, message: dict[str, Any], path: Path) -> None:
    chat_id = message.get("chat", {}).get("id")
    if not chat_id:
        return
    text = f"Saved to Notebook/Inbox: {path.name}"
    telegram_api(token, "sendMessage", {"chat_id": chat_id, "text": text})


def process_updates(token: str, offset: int | None, timeout: int) -> tuple[int | None, int]:
    params: dict[str, Any] = {"timeout": timeout}
    if offset is not None:
        params["offset"] = offset

    payload = telegram_api(token, "getUpdates", params)
    saved_count = 0
    for update in payload.get("result", []):
        offset = update["update_id"] + 1
        save_offset(offset)
        message = update.get("message") or update.get("edited_message")
        if not message:
            continue
        capture_path = write_capture(message)
        send_confirmation(token, message, capture_path)
        saved_count += 1
        log(f"Saved {capture_path}")

    return offset, saved_count


def main() -> None:
    parser = argparse.ArgumentParser(description="Poll Telegram and save captures to Notebook/Inbox.")
    parser.add_argument("--once", action="store_true", help="Poll once, save any queued messages, then exit.")
    parser.add_argument("--health-check", action="store_true", help="Check that the token can reach Telegram, then exit.")
    parser.add_argument("--timeout", type=int, default=POLL_TIMEOUT_SECONDS, help="Telegram long-poll timeout in seconds.")
    args = parser.parse_args()

    load_env_file(ENV_FILE)
    token = os.environ.get("TELEGRAM_BOT_TOKEN")
    if not token:
        raise SystemExit(
            "Missing TELEGRAM_BOT_TOKEN. Add it to "
            f"{ENV_FILE} or set it as an environment variable."
        )

    if args.health_check:
        me = telegram_api(token, "getMe", {})
        username = me.get("result", {}).get("username", "unknown")
        log(f"Telegram token is valid for @{username}.")
        return

    offset = load_offset()
    if args.once:
        offset, saved_count = process_updates(token, offset, args.timeout)
        if saved_count == 0:
            log("No queued Telegram messages found.")
        return

    log("Telegram capture MVP is running. Press Ctrl+C to stop.")
    consecutive_errors = 0
    while True:
        try:
            offset, _ = process_updates(token, offset, args.timeout)
            consecutive_errors = 0
        except KeyboardInterrupt:
            raise
        except Exception as exc:  # noqa: BLE001 - a poll failure must never kill the loop
            consecutive_errors += 1
            log(f"Poll error ({consecutive_errors} in a row): {exc!r}")
            time.sleep(min(POLL_ERROR_BACKOFF_SECONDS * consecutive_errors, 300))
            continue
        time.sleep(1)


if __name__ == "__main__":
    main()
