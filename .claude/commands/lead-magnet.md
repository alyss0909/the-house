---
name: lead-magnet
description: Research a topic, write the lead magnet content, and create its Notion content page plus a pipeline entry (Status=Draft) in the Lead Magnet Pipeline database.
user_invocable: true
---

# Lead Magnet

Creates a new lead magnet from scratch: research → written content → Notion content page → Notion pipeline tracker entry. This is stage 1 of the pipeline. Stage 2 is `/landing-page`. Stage 3 (batch execution/publish) is `/execute-lead-magnets`.

## Arguments

| Argument | Description |
|---|---|
| `<topic>` | Required. The subject/angle for the lead magnet (e.g. "5 subject lines that get opens"). |
| `--format PDF\|Notion\|Both` | Optional. Defaults to `Notion` if omitted. |

## Notion target

- Database: "Lead Magnet Pipeline" (https://app.notion.com/p/8e70da0d23c74d21bb28c0b3f4cdf54c)
- Data Source ID: `de338819-a1a8-4b7f-8348-821d66dd1a8b`
- Properties: Name (title), Status (select), Format (select), Slug (text), Topic (text), Notion URL (url), Landing URL (url), Kit Form UID (text)

## Steps

1. **Research the topic.** Pull real, current material relevant to `<topic>` — no fabricated stats, no generic platform-news filler. If Alyssa has source material in PKM or Team Knowledge relevant to the topic, use it. Follow [[feedback_trend_research_means_real_posts]] discipline: prefer verbatim real examples over invented ones.

2. **Write the content** in Alyssa's voice. Do not invent a new voice description — follow the established rules in the Hermes JUDGMENT layer, entry point `Studio/Hermes/SOURCES.md` (which routes to `Studio/Hermes/SOUL.md`, `Studio/Hermes/STYLE.md`, `Studio/Hermes/TASTE.md`, `Studio/Hermes/ANTI-AI.md`). Keep hooks to the 10-word cap per [[feedback_hook_ten_word_cap]] if the lead magnet opens with a hook.

3. **Generate a slug** from the title (lowercase, hyphenated, no special characters).

4. **Create the Notion content page** — the actual lead magnet body, as a Notion page. This is the source of truth for the content itself.

5. **Create the Notion pipeline entry** in the Lead Magnet Pipeline database (Data Source ID `de338819-a1a8-4b7f-8348-821d66dd1a8b`):
   - Name: the lead magnet title
   - Status: `Draft`
   - Format: from `--format` argument, default `Notion`
   - Slug: generated slug
   - Topic: `<topic>` as given
   - Notion URL: link to the content page created in step 4
   - Landing URL: leave blank (filled by `/landing-page`)
   - Kit Form UID: leave blank (filled manually by Alyssa in Kit, then pasted into Notion — see notes)

6. **Confirm to Alyssa:**
   - Title, slug, format
   - Link to the Notion content page
   - Link to the pipeline entry
   - Reminder: next step is `/landing-page` to build the delivery page, and that she'll eventually need to create a Kit form for this lead magnet (see Notes).

## Notes

- CTA byline on any generated copy: Alyssa / alyssacoleman.ca.
- This command never sets Status past `Draft`. Advancing to `Ready`/`Execute` is a manual decision Alyssa makes in Notion once she's reviewed the content.
- Kit Form UID cannot be created via API — Kit has no create-form endpoint. Alyssa must manually create a Kit form named `[Freebie] <Title> Form` in Kit's UI and paste the resulting UID into this pipeline entry before `/execute-lead-magnets` can wire the landing page's embed script.
