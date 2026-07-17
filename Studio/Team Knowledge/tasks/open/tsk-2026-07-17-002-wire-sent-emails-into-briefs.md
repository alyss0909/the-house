---
id: tsk-2026-07-17-002
title: Wire her sent-email bodies into the offer briefs via the Kit API
owner: mack
status: open
created: 2026-07-17
source: "[[Studio/Content/briefs/INDEX]]"
---

# Fold her real sent-email copy into the offer briefs

Every offer has related SENT EMAILS linked by relation in the Notion Products DB (property "Related Emails"). Those rows carry the subject line, real open and click rates, the email type (Simmer etc.), and a ckarchive.com URL, but the Notion page bodies are BLANK. The actual email prose lives at Kit/ConvertKit (ckarchive is Kit's archive domain). Her sent emails are arguably her purest voice source, better than the pitchy sales pages, and content has been ignoring them.

WebFetch on the ckarchive URL returns only the subject, so scraping does not work. The Kit MCP server is already connected in this house (list_broadcasts, get_broadcast, get_stats_for_a_list_of_broadcasts, list_posts, get_post).

Job:
1. Match each offer's related-email rows to Kit broadcasts/posts (by subject line or date).
2. Pull the verbatim body and true open/click rate for each.
3. Add a "Her sent-email lines" section to each offer brief in `Studio/Content/briefs/`, quoting the strongest verbatim lines, with the real open rate as proof.
4. Confirm whether this can run as a mechanical refresh (re-pull when she sends a new email for an offer) rather than a one-time job.

Start with the email lane (5MN, Bingeable, List Resuscitator, Email List Revival, A Year of Emails). Known example: "telling you what to do [list inside]" — Simmer, 43% open, related to 5MN and the Monday-education product.
