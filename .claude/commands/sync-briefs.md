---
description: Reconcile the offer briefs between Notion and the markdown files (two-way).
---

# /sync-briefs

Reconcile the **Offer Briefs** Notion database with the markdown briefs in
`Studio/Content/briefs/`. The ledger and page↔file map live in
[[Studio/Content/briefs/notion-sync]] — read it first, every run.

Default direction is **Notion → markdown** (Alyssa reads/edits in Notion, edits flow back to
the files). Pass `push` to go the other way (`/sync-briefs push`) when a brief changed on disk
and Notion needs updating.

## Steps

1. **Load the ledger.** Read [[Studio/Content/briefs/notion-sync]] for the data source id
   (`collection://e6949e46-c40e-4ded-9de8-56a58a4f4e05`) and the page↔file map. If a brief file
   exists with no row in the map, stop and add it to the ledger (and create/relate its Notion
   page) before syncing.

2. **Notion → markdown (default):** for each mapped page:
   - `notion-fetch` the page; take the body (everything after the title heading).
   - Read the on-disk file. **Preserve its YAML frontmatter exactly.** Replace only the body.
   - Write the file. If the body is unchanged, skip (no-op).
   - After a real change, set the page `Review Status` → **Synced to markdown**,
     `Last Synced` → today.

3. **markdown → Notion (`push`):** for each changed file, strip the frontmatter and
   `notion-update-page` (`replace_content`) the matching page body; refresh the
   `Chat Word` / `Tier` snapshot if it drifted; set `Last Synced` → today.

4. **Conflict guard:** if a file AND its page both changed since the page's `Last Synced`,
   do NOT auto-merge — show Alyssa both and ask which wins.

5. **Report + commit:** give Alyssa a one-line-per-brief diff summary. For markdown changes,
   commit + push on the working branch. Never edit the frontmatter through Notion, and never
   let a brief become the source of truth for product facts (those stay in the Products DB,
   surfaced by the `Offer` relation).

6. **Vault links:** ensure every row's `Open in vault` URL is set to
   `https://alyss0909.github.io/vault-links/?f=<URL-encoded path without .md>` (the house
   redirector convention — never a raw `obsidian://`). Backfill any empty one.

## Guardrails
- Frontmatter is disk-only.
- Out-of-map pairs are never touched.
- Product price/chat-word/status/link are canonical in the Products DB, not the brief.
- `Open in vault` uses the vault-links redirector, never a raw `obsidian://` URI.
