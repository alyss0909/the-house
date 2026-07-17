---
id: tsk-2026-07-17-001
title: Disable the unattended Content Ideas ideation cron
owner: mack
status: open
created: 2026-07-17
source: "[[Studio/Content/MAP]]"
---

# Disable the unattended ideation cron

Alyssa retired the Content Ideas robo-tray on 2026-07-17 (43 untouched rows proved it makes work instead of saving it). The ~7:40am unattended ideation job from the Instagram Saves Engine (built 2026-07-09, OS cron plus Anthropic API) still writes into the retired Notion database `589f122c-b458-438c-93f3-904e5dc03530`.

Job: find and disable that scheduled job only. Do NOT touch the 7am and 7pm burner-account saves sync; the saves pipeline stays live and is now the only ideation source, with the wildcard rule inside the /saves-sweep skill covering thin days.

Done means: the cron no longer fires, the saves sync still runs, and a one-line note lands in the session log.
