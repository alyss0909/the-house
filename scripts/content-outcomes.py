#!/usr/bin/env python3
"""
content-outcomes.py — the deterministic half of outcome writeback.

WHAT IT DOES
  Reads a Kit broadcast-stats pull (JSON) plus an optional offer/mechanic map,
  buckets sends by audience size (a 666-person class segment is NOT comparable
  to an 8,000-person broadcast), computes a segment-aware baseline (median open
  and click per bucket), and tags every send over / under / on-par against its
  OWN bucket's baseline. It rewrites the table block in
  Studio/Content/outcomes-ledger.md between the OUTCOMES markers.

WHAT IT DELIBERATELY DOES NOT DO
  It never changes a weight, a rule, a brief, or any future behavior. It only
  SURFACES what happened. How an "under" should change the next post is a
  design decision for Alyssa (see Deliverables/2026-07-20_mack_outcome-writeback-design.md),
  not something this script is allowed to decide. Surfacing is mechanical;
  learning is not. Keep that wall.

REFRESH (mechanical, agent-driven — Kit is MCP-only in this house, no API key)
  1. Pull via the Kit MCP:  get_stats_for_a_list_of_broadcasts (status=completed).
  2. Save the returned `broadcasts` array into scripts/data/kit-broadcasts-sample.json
     (keep the {"broadcasts":[...]} wrapper; extra keys are ignored).
  3. Optionally edit scripts/data/outcome-map.json to tag broadcast_id -> offer/lane/mechanic.
  4. Run:  python3 scripts/content-outcomes.py
  Kit open/click settle ~48h after a send; re-pull after that.

No dependencies beyond the standard library.
"""
import json, os, statistics, sys, datetime

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
DATA = os.path.join(HERE, "data", "kit-broadcasts-sample.json")
MAP = os.path.join(HERE, "data", "outcome-map.json")
LEDGER = os.path.join(ROOT, "Studio", "Content", "outcomes-ledger.md")

# ---- tunables (documented; the "on-par" band is a JUDGEMENT knob, see design doc) ----
SEGMENT_MAX = 2000          # recipients < this = "segment" bucket, else "broadcast"
OPEN_BAND = 3.0             # within +/- this many points of baseline open = "on par"
CLICK_BAND_REL = 0.40       # within +/- this fraction of baseline click = "on par"

HS, HE = "<!-- OUTCOMES:START -->", "<!-- OUTCOMES:END -->"


def load(path, default):
    if not os.path.exists(path):
        return default
    with open(path, encoding="utf-8") as f:
        return json.load(f)


def bucket_of(recipients):
    return "segment" if recipients < SEGMENT_MAX else "broadcast"


def tag(value, baseline, band, relative=False):
    if baseline is None:
        return "n/a"
    lo = baseline * (1 - band) if relative else baseline - band
    hi = baseline * (1 + band) if relative else baseline + band
    if value > hi:
        return "OVER"
    if value < lo:
        return "under"
    return "on par"


def main():
    raw = load(DATA, {})
    broadcasts = raw.get("broadcasts", raw if isinstance(raw, list) else [])
    if not broadcasts:
        print(f"No broadcasts found in {DATA}. Nothing to do.")
        return
    omap = load(MAP, {})

    rows = []
    for b in broadcasts:
        s = b.get("stats", {})
        rows.append({
            "id": b.get("id"),
            "subject": (b.get("subject") or "").strip(),
            "send_at": (b.get("send_at") or "")[:10],
            "recipients": s.get("recipients", 0),
            "open_rate": s.get("open_rate", 0.0),
            "click_rate": s.get("click_rate", 0.0),
            "bucket": bucket_of(s.get("recipients", 0)),
            "map": omap.get(str(b.get("id")), {}),
        })

    # ---- segment-aware baselines (median per bucket) ----
    baselines = {}
    for bkt in ("broadcast", "segment"):
        opens = [r["open_rate"] for r in rows if r["bucket"] == bkt]
        clicks = [r["click_rate"] for r in rows if r["bucket"] == bkt]
        baselines[bkt] = {
            "n": len(opens),
            "open": round(statistics.median(opens), 2) if opens else None,
            "click": round(statistics.median(clicks), 2) if clicks else None,
        }

    for r in rows:
        base = baselines[r["bucket"]]
        r["open_tag"] = tag(r["open_rate"], base["open"], OPEN_BAND)
        r["click_tag"] = tag(r["click_rate"], base["click"], CLICK_BAND_REL, relative=True)

    rows.sort(key=lambda r: r["send_at"], reverse=True)

    # ---- render ----
    out = []
    out.append(f"_Refreshed {datetime.date.today().isoformat()} from `{os.path.relpath(DATA, ROOT)}` "
               f"(Kit pull). Surfaced, not acted on — see the design doc for the learning proposal._")
    out.append("")
    out.append("**Segment-aware baselines (median of this pull):**")
    for bkt in ("broadcast", "segment"):
        base = baselines[bkt]
        if base["n"]:
            label = "full-list broadcasts (>=%d recipients)" % SEGMENT_MAX if bkt == "broadcast" \
                else "small segments (<%d recipients)" % SEGMENT_MAX
            out.append(f"- {label}: open **{base['open']}%**, click **{base['click']}%** "
                       f"(n={base['n']}). On-par band: open +/-{OPEN_BAND}pt, click +/-{int(CLICK_BAND_REL*100)}%.")
    out.append("")
    out.append("| Sent | Subject | Bucket | Recip | Open % | vs base | Click % | vs base | Offer / mechanic |")
    out.append("|---|---|---|---|---|---|---|---|---|")
    for r in rows:
        m = r["map"]
        mapping = " / ".join(x for x in [m.get("offer"), m.get("lane"), m.get("mechanic")] if x) or "—"
        subj = r["subject"].replace("|", "\\|")
        if len(subj) > 42:
            subj = subj[:41] + "…"
        out.append(f"| {r['send_at']} | {subj} | {r['bucket']} | {r['recipients']} | "
                   f"{r['open_rate']} | {r['open_tag']} | {r['click_rate']} | {r['click_tag']} | {mapping} |")
    block = "\n".join(out)

    # ---- write into the ledger between markers, else stdout ----
    if os.path.exists(LEDGER):
        text = open(LEDGER, encoding="utf-8").read()
        if HS in text and HE in text:
            pre = text.split(HS)[0]
            post = text.split(HE)[1]
            open(LEDGER, "w", encoding="utf-8").write(pre + HS + "\n" + block + "\n" + HE + post)
            print(f"outcomes-ledger.md refreshed: {len(rows)} sends, "
                  f"{sum(r['open_tag']=='OVER' for r in rows)} over / "
                  f"{sum(r['open_tag']=='under' for r in rows)} under (open, vs bucket baseline).")
            return
    print(block)
    print("\n(No OUTCOMES markers found in the ledger — printed above instead of writing.)",
          file=sys.stderr)


if __name__ == "__main__":
    main()
