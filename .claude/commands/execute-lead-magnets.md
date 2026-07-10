---
name: execute-lead-magnets
description: Batch-process every pipeline entry with Status=Execute — set up Kit delivery sequence (if Kit MCP tools are bound), finalize format, mark Complete, commit/push, and summarize.
user_invocable: true
---

# Execute Lead Magnets

Stage 3 of the pipeline. Run when one or more entries in the Lead Magnet Pipeline database are staged with Status = `Execute`, ready to go live.

## Notion target

Data Source ID `de338819-a1a8-4b7f-8348-821d66dd1a8b`.

## Steps

1. **Query pipeline entries** where Status = `Execute`. If none, report that and stop.

2. **For each entry, mark Status = `In Progress`** immediately, so re-runs don't double-process.

3. **Branch on Format:**
   - **PDF**: Render the Notion content page (or landing page content) to PDF via the puppeteer scripts in `lead-magnet-system/scripts/` (create the render script here if it doesn't exist yet — puppeteer is already installed at the repo root). Output to `lead-magnet-system/output/<slug>.pdf`.
   - **Notion**: Confirm the Notion content page (linked via Notion URL) is shared/public as needed. No file render required.
   - **Both**: Do both of the above.

4. **Kit delivery sequence step.** Check whether Kit MCP tools are bound in the current session (tools like `create_sequence`, `create_sequence_email`).
   - **If bound:** Create a sequence named `[Delivery] <Name>` and add the delivery email (from `lead-magnet-system/reference/emails/<slug>-delivery-email.md`, written by `/landing-page`) as its first email via `create_sequence_email`. Record the sequence name back as a note on the pipeline entry (Notion has no dedicated sequence-ID field — add it to the page body or a comment).
   - **If not bound:** Do not attempt this over any other channel. Instead, tell Alyssa explicitly, per entry:
     - Create sequence `[Delivery] <Name>` in Kit
     - Add the delivery email at `lead-magnet-system/reference/emails/<slug>-delivery-email.md` as its first email
     - Confirm the Kit form (`[Freebie] <Name> Form`) is connected to trigger that sequence

5. **Verify Kit Form UID is present** on the pipeline entry and that the landing page's embed script is not still the `KIT_FORM_UID_PENDING` placeholder. If it's still pending, do not mark Complete for this entry — leave it at `In Progress`, flag it, and skip to the next entry.

6. **Mark Status = `Complete`** for entries that passed step 5 and had their format output finished.

7. **Commit and push** any new/changed files (PDFs, notes on sequence creation, etc.):
   - `git add lead-magnet-system/output/ lead-magnet-system/reference/emails/`
   - Commit message summarizing the batch (names + count).
   - Push to the current branch.

8. **Summarize to Alyssa:**
   - Table: Name | Format | Sequence created? (yes/manual-needed) | Kit UID present? | Final Status
   - Explicit manual-action list for any entry still needing the Kit form UID or a manually-created sequence.
   - Rate limits / idempotency note: this command is safe to re-run — entries not in `Execute` status are untouched, and `In Progress` entries left incomplete (e.g. missing Kit UID) will need Status reset to `Execute` by Alyssa once she's filled the gap, so they get picked up again.

## Notes

- This command never auto-launches anything user-facing — PDFs and landing pages are artifacts, not runtimes; no server is started.
- Kit form creation is never attempted here or anywhere in this pipeline — it has no API. It is always the manual gate between `/lead-magnet` and a Complete entry.
- Idempotency: re-running is safe because Status gating prevents reprocessing Complete or still-Draft entries.
