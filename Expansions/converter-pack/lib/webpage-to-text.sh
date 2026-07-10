#!/usr/bin/env bash
# webpage-to-text.sh — extract clean, readable article text from a web page.
# ---------------------------------------------------------------------------
#   Usage:  lib/webpage-to-text.sh <article-URL> [output.md]
#
#   Produces a clean Markdown "transcript" of an article/blog/news page:
#   the main body text only — navigation, ads, cookie banners, comment
#   sections and other boilerplate are stripped out.
#
#   Approach (verified against best practice — see ADAPT-EXPANSION §webpage):
#     PRIMARY  : trafilatura — best-in-class boilerplate removal (SIGIR 2023
#                top mean F1), pure-Python, no headless browser, offline,
#                emits Markdown directly. Handles real-world cluttered pages.
#     FALLBACK : pandoc html->markdown on the raw page. Lower precision (keeps
#                some chrome) but guarantees *something* readable if
#                trafilatura yields nothing usable.
#
#   SECURITY (handoff §8):
#     - The URL is ALWAYS user-supplied and untrusted. Passed as a single
#       quoted argument; only http/https accepted; never eval'd.
#     - trafilatura does the fetch itself (one outbound GET to the URL).
#       No credentials, no cookies.
# ---------------------------------------------------------------------------
set -euo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/common.sh"

URL="${1:-}"
OUT="${2:-}"
require_url "$URL"

[[ -z "$OUT" ]] && OUT="$(cache_path "webpage" md)"
ensure_cache

# --- PRIMARY: trafilatura -------------------------------------------------
if have trafilatura; then
  log "extracting readable article text with trafilatura..."
  # -u <url>: trafilatura fetches; --output-format markdown; metadata header.
  if trafilatura -u "$URL" --output-format markdown --with-metadata \
        --no-comments --no-tables > "$OUT" 2>/dev/null && [[ -s "$OUT" ]]; then
    # Sanity check: a real article is more than a handful of bytes.
    if [[ "$(wc -c < "$OUT" | tr -d ' ')" -ge 200 ]]; then
      log "clean article text ready: $OUT"
      printf '%s\n' "$OUT"
      exit 0
    fi
    log "trafilatura output looked too thin — trying the fallback."
  else
    log "trafilatura could not extract this page — trying the fallback."
  fi
fi

# --- FALLBACK: pandoc html -> markdown ------------------------------------
need pandoc "Run scripts/install.sh first."
log "falling back to pandoc html->markdown (lower precision; may keep some page chrome)."
RAW="$(cache_path "webpage-raw" html)"

# Fetch with curl: -L follow redirects, -f fail on HTTP error, --max-time cap,
# a UA string so sites that block empty UAs still serve content.
if have curl; then
  # -o before the URL; `--` ends option parsing so the URL can't be read as
  # a flag even if a malicious URL starts with a dash.
  curl -fsSL --max-time 60 \
    -A "Mozilla/5.0 (compatible; myPKA-converter/1.0)" \
    -o "$RAW" -- "$URL" || die "could not fetch the page (network error or blocked)."
else
  die "neither trafilatura nor curl is available — cannot fetch the page."
fi

[[ -s "$RAW" ]] || die "fetched page was empty."
pandoc -f html -t markdown_strict --wrap=none "$RAW" -o "$OUT"
rm -f "$RAW"

[[ -s "$OUT" ]] || die "could not produce readable text from this page."
log "readable text ready (fallback): $OUT"
printf '%s\n' "$OUT"
