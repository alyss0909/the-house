---
title: Offer Briefs — Notion sync ledger
type: sync-ledger
status: active — created 2026-07-18
owner: Larry (Mack maintains the mechanism)
rule: This file is the single source of truth for the Notion ⇄ markdown mirror of the offer briefs. The markdown files in this folder are canonical for MEANING; Notion is the review-and-edit surface. Reconcile with /sync-briefs.
---

# Offer Briefs — Notion sync ledger

The content team's offer briefs (`Studio/Content/briefs/*.md`) are mirrored into a Notion
database so Alyssa can read and edit them in one place, with each brief related to its
Products DB offer. This ledger records the mirror and the reconcile protocol.

## The Notion mirror

- **Database:** [Offer Briefs](https://app.notion.com/p/0f1d3f1292f5417a9b5815f248101a48) — lives under the **House Control Room** page.
- **Data source id:** `collection://e6949e46-c40e-4ded-9de8-56a58a4f4e05`
- **Products DB (relation target):** `collection://2f4c8b43-e565-8149-a25f-000b38310c24`
- **Relation property:** `Offer` (two-way; shows as `Offer Brief` on the Products DB side).
- **Other properties:** `Tier`, `Review Status`, `Chat Word`, `Source File`, `Last Synced`, `Open in vault`.

### `Open in vault` links (house convention)
Notion cannot open `obsidian://` URIs, so the clickable jump-to-Obsidian link uses the
vault-links redirector (see `scripts/obsidian-redirect/README.md` and the same rule in
[[AGENTS]] for the Agent Tasks board). Format — never a raw `obsidian://`:

```
https://alyss0909.github.io/vault-links/?f=<URL-encoded path without .md>
```

For every brief that is `Studio/Content/briefs/<slug>.md` the value is
`https://alyss0909.github.io/vault-links/?f=Studio%2FContent%2Fbriefs%2F<slug>`.
`/sync-briefs` keeps this column populated for every row (backfill any that is empty).

## What is canonical

- The **markdown body** (everything below the YAML frontmatter) is the editable content and
  the thing that round-trips. Notion pages carry the body verbatim.
- The **YAML frontmatter** stays authoritative **on disk** and is NOT edited in Notion. On a
  Notion→markdown pull, the file's existing frontmatter is preserved and only the body is
  replaced.
- **Product facts** (price, chat word, status, link) remain canonical in the **Products DB**,
  reached through the `Offer` relation. The `Chat Word` / `Tier` fields on the brief page are
  a convenience snapshot, not truth.

## Page ↔ file map

| Brief | Markdown file | Notion page id | Offer (Products DB) |
|---|---|---|---|
| The 5 Minute Newsletter | `the-5-minute-newsletter.md` | `3a1c8b43-e565-81e8-ae23-e2b1e32f58a7` | The 5 Minute Newsletter |
| Bingeable Newsletters | `bingeable-newsletters.md` | `3a1c8b43-e565-8105-8656-cfbad710343b` | Bingeable Newsletters |
| List Resuscitator | `list-resuscitator.md` | `3a1c8b43-e565-8159-95c2-e40ea3cb35a6` | List Resuscitator |
| Email List Revival Plan | `email-list-revival-plan.md` | `3a1c8b43-e565-81c9-867f-c957d4dbd475` | Email List Revival Plan |
| 90d Clock In | `90d-clock-in.md` | `3a1c8b43-e565-818e-858a-c1181066dbbd` | 90d Clock In |
| The Promo Planner in Notion | `the-promo-planner-in-notion.md` | `3a1c8b43-e565-81f7-8ba0-d36f46dc8326` | The Promo Planner in Notion |
| Back of House | `back-of-house.md` | `3a2c8b43-e565-81f5-8100-c08487dbbe85` | Back of House |
| Soft Sundays | `soft-sundays.md` | `3a2c8b43-e565-8155-a851-d1e0f5a8986e` | Soft Sundays |
| Pin Planner | `pin-planner.md` | `3a2c8b43-e565-81eb-9d7d-f69f2824c8b4` | Pin Planner |
| Soft CEO (Sessions + Monthly) | `soft-ceo.md` | `3a2c8b43-e565-81c9-ad71-dafe7904f26d` | Soft Ceo Sessions + Soft Ceo Monthly Notion Template |
| For The Girls Brief | `for-the-girls-brief.md` | `3a2c8b43-e565-818e-b6af-eddd464b16bd` | — (content-style source, no offer) |
| A Year of Emails | `a-year-of-emails.md` | `3a2c8b43-e565-8130-bc6d-e847a2255981` | A Year of Emails (BACKBURNER) |

## Reconcile protocol (run via /sync-briefs)

The Notion connector is interactively authenticated, so sync runs **inside a Larry session**
(there is no headless cron for it). Two directions:

### Notion → markdown (Alyssa edited in Notion — the common case)
1. For each row, `notion-fetch` the page body.
2. Read the on-disk file; keep its YAML frontmatter unchanged.
3. Replace the body with the fetched Notion body; write the file.
4. Set the page's `Review Status` to **Synced to markdown** and `Last Synced` to today.
5. Report a per-brief diff summary to Alyssa; commit + push the changed markdown.

### markdown → Notion (a brief changed on disk — e.g. a /content-run rebuild)
1. For each changed file, strip the frontmatter and `notion-update-page` (replace_content)
   the matching page body.
2. Refresh `Chat Word` / `Tier` snapshots if they changed.
3. Set `Last Synced` to today.

### Rules
- Never touch a page/file pair that is out of map. New briefs get a row added here first.
- Frontmatter is disk-only; never write it into Notion or read it back from Notion.
- If both sides changed since `Last Synced`, STOP and ask Alyssa which wins — do not auto-merge.
- Product facts flow the other way: they live in the Products DB, surfaced by the `Offer`
  relation; the brief never becomes their source of truth.

## Related
- Index: [[Studio/Content/briefs/INDEX]]
- Command: `/sync-briefs` (`.claude/commands/sync-briefs.md`)
