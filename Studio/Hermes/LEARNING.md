<!-- token_ceiling: 1000 | the get-smarter loop. This file is protocol, not storage. -->

# LEARNING.md — How this brain gets smarter

Everything Alyssa does and says is training signal. The loop keeps the brain sharpening while the token footprint stays flat: **capture → distill → replace → clear.**

## 1. Capture (every session, zero friction)

Append one line per signal to [[Hermes/learning/inbox]], dated, verbatim where possible:
- Any correction ("that's not me," "too AI," a rewrite she makes to your draft — capture her version next to yours).
- Any approval ("yes exactly," a draft shipped unchanged — capture what worked).
- Any new Alyssa-original artifact (new email, carousel, sales page, transcript, journal riff) → log the vault path; nominate standout passages for `Library/Examples/good/`.
- Any product/price/status change she mentions → flag BUSINESS.md volatile table.

Rules: verbatim quotes only, never paraphrase her words. One line each. Corrections are TIER-3 FACTS — they outrank every rule in this brain.

## 2. Distill (when inbox ≥ ~10 entries, or monthly)

Fold inbox into the core files **within their existing token ceilings**:
- A correction that contradicts a rule → the rule loses. Rewrite it, cite the correction with its date.
- A repeated pattern (2+ instances) → becomes a rule; a one-off → stays a dated note in MEMORY.md gaps ledger.
- New golden passage → add to `Library/Examples/good/` and **evict the weakest existing example** (cap: 12 files). Never let examples grow unbounded.
- Compress, don't append: each file's ceiling is in its header comment. If a new rule doesn't fit, a weaker rule gets cut. Weakest = least-cited by real corrections, most inferential.

## 3. Clear

Move processed inbox lines to [[Hermes/learning/log]] with the date of the distillation pass and a one-line note of what changed where. The inbox returns to empty. [[Hermes/learning/log]] is the only file allowed to grow — it's the audit trail, never loaded for writing tasks.

## 4. Re-ground (quarterly or when drift is suspected)

The brain references the Second Brain; it doesn't replace it. Re-verify: SOURCES.md pointers still resolve; BUSINESS.md against Notion; STYLE anchors against 2 newest published pieces (her voice evolves — the newest tier-1 material wins ties against older rules); rerun `tests/` after any SOUL/STYLE/TASTE edit and log to `tests/results/`.

## Standing invariants (never distilled away)

- Tier-1 verbatim beats any rule. Corrections beat everything.
- Never train on quarantined files (SOURCES.md).
- Never invent product facts.
- Ceilings hold: getting smarter means getting sharper, not longer.
