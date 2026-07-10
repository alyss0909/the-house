---
name: landing-page
description: Build the conversion landing page HTML (with Kit form embed wired in) and the delivery email for a lead magnet, then commit and push.
user_invocable: true
---

# Landing Page

Stage 2 of the lead magnet pipeline. Takes a pipeline entry that already has content (from `/lead-magnet`) and produces the public landing page plus the delivery email copy.

## Arguments

| Argument | Description |
|---|---|
| `<slug>` or `<name>` | Required. Identifies the pipeline entry to build a landing page for. |

## Notion target

Same database as `/lead-magnet`: Data Source ID `de338819-a1a8-4b7f-8348-821d66dd1a8b`.

## Steps

1. **Look up the pipeline entry** by slug or name. Read its Topic, Notion URL (content page), Format, and Kit Form UID fields.

2. **Research pass** — re-check the content page and topic for anything the landing page copy needs (proof points, specific promise, who it's for). Do not re-litigate voice; that was set in `/lead-magnet`.

3. **Build the landing page HTML** at `website/lead-magnets/<slug>.html`:
   - Start from `lead-magnet-system/reference/conversion-landing-sample.html` as the structural/visual reference. Do not rebuild the design system — copy its structure (oat/linen palette, AT KING/Georgia headings, Karla body, Roboto Mono uppercase labels, light/dark via `data-theme` + localStorage) and swap in this lead magnet's copy.
   - In the form-card section, wire in Kit's native embed:
     ```html
     <script src="https://alyssa-coleman.kit.com/{FORM_UID}/index.js"></script>
     <div data-uid="{FORM_UID}"></div>
     ```
     Replace `{FORM_UID}` with the value from the pipeline entry's Kit Form UID field.
   - **If Kit Form UID is blank**, insert a clearly marked placeholder comment (`<!-- KIT_FORM_UID_PENDING: Alyssa must create form "[Freebie] <Title> Form" in Kit and paste UID here -->`) instead of a broken script tag, so the page still renders without a dead embed.

4. **Write the delivery email** (the email Kit's `[Delivery] <Name>` sequence will send once the form is submitted):
   - Voice: Hermes JUDGMENT layer (`Studio/Hermes/SOURCES.md`), same as the lead magnet content itself.
   - Merge tag for first name: `{{ subscriber.first_name }}` (Kit's liquid syntax — not ConvertKit's old `{{contact.first_name}}`).
   - CTA byline: Alyssa / alyssacoleman.ca.
   - Save the email draft to `lead-magnet-system/reference/emails/<slug>-delivery-email.md` (create the folder if it doesn't exist).

5. **Update the Notion pipeline entry:** set Landing URL to the local/relative path (or deployed URL once known).

6. **Commit and push:**
   - `git add website/lead-magnets/<slug>.html lead-magnet-system/reference/emails/<slug>-delivery-email.md`
   - Commit message describing the new landing page and delivery email.
   - Push to the current branch.

7. **Confirm to Alyssa:**
   - Path to the landing page HTML
   - Path to the delivery email draft
   - Whether the Kit embed is live or pending (call out clearly if pending)
   - Commit hash / push status

## Notes

- Never auto-launch or preview-serve the page — announce the path, Alyssa/Silas opens it.
- If Kit Form UID is missing, this command still completes but the page ships with the placeholder. Flag it loudly in the confirmation — don't bury it.
- Design file is finished and should not be modified: `lead-magnet-system/reference/conversion-landing-sample.html`.
