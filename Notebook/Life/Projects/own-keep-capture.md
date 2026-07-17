---
name: Own Keep Capture
status: planning
key_element: pkm
linked_offers:
---

# Own Keep Capture

**Part of:** [[pkm]]
**Replaces the pain in:** [[tsk-2026-07-16-001-keepsidian-google-reauth]]
**Feeds:** [[systematize-socials]] (the "Keep + IG saved to Claude to Notion" thread)

## Why this matters

Google Keep is my main capture place. I jot everything there, especially on my phone. Right now that capture reaches my vault through the KeepSidian plugin, and it keeps letting me down in two ways. It breaks quietly, so the sync died on June 8 and I did not notice for weeks. And the smart parts I actually want, like good tags and titles, are either generic or locked behind a supporter subscription. I want my own version that works the way I work, tags things in my own language, and tells me loudly when it breaks instead of going dark.

This is a future project, not started yet. This note is the plan.

## The one hard truth to design around

Google Keep has no official public way in. KeepSidian gets your notes by logging in with an unofficial Google master token, the kind that starts with `oauth2_4`. Google kills those tokens every so often, and that is the real reason the sync goes stale and needs re-authorizing. This is not a KeepSidian flaw I can out-build. Any version that reads from Keep, including mine, will need re-auth from time to time.

So my own version does not try to make re-auth disappear. It makes it painless: it notices the moment capture stops flowing and tells me, and it makes reconnecting a quick two-minute ritual instead of a silent failure I stumble on later. Everything else, I own.

## What my version owns (the build)

These are the parts KeepSidian either gates, does generically, or does not do at all. This is the real value of building my own.

1. **Tagging in my own language.** Notes get tagged against my actual Key Element tree, not generic AI tags and not a paid feature. My taxonomy, my rules.
2. **Titles in my voice.** Short, useful titles that sound like me, applied on the way in.
3. **Routing into the journal automatically.** Captured notes land where Penn can process them into the journal, instead of sitting in a raw folder.
4. **A staleness watchdog.** If no new Keep note has arrived in a set number of days, it pings me. This is the direct fix for the June 8 silent death. The failure becomes loud.
5. **No subscription wall.** The smart features run on my side, so there is nothing to pay for and nothing to unlock.

## What we reuse (do not rebuild)

The raw pull of notes out of Keep is the hard, brittle part, and it is not where my value is. We reuse it rather than rebuild it. That can be KeepSidian's own free download path, or a thin script that does just the Keep login and note fetch. Either way, my layer sits on top of the raw notes it produces.

## The head start we already have

Before this project even begins, we read KeepSidian's real source code and wrote down its full contract: every server endpoint, the token exchange flow, and exactly where the free line ends and the paid line starts. So whichever way we pull the raw notes, we are not guessing at how any of it works. The teardown report is saved with this project: [KeepSidian teardown report](own-keep-capture-keepsidian-teardown.html) (open in a browser).

## How it would flow, plainly

1. Raw Keep notes are pulled in (reused pull, on our own schedule, not dependent on Obsidian being open).
2. Each note passes through my layer: tag it against my Key Element tree, give it a title in my voice.
3. The finished note lands in the journal inbox for Penn.
4. A watchdog checks that notes are still arriving, and pings me the moment they stop.

## Open decisions for me to make later

- **Where the raw pull comes from.** Reuse KeepSidian's free endpoint, or run a small dedicated Keep login script. Both work; one is less setup, one is more independent.
- **How the watchdog reaches me.** A note in the vault, an email, or a calendar-style nudge. This should follow the no-Claude-scheduled-tasks rule and use the OS-cron-plus-API pattern the Saves Engine already uses.
- **How much tagging is automatic versus one taste gate.** Fully automatic, or a quick review step where I approve tags before they stick.

## Status

Planning. Not started. Opened 2026-07-17 after we read the real KeepSidian source and confirmed Keep is the capture surface to keep, not replace. The immediate related task is still just re-authorizing the current plugin so capture is not dead in the meantime: [[tsk-2026-07-16-001-keepsidian-google-reauth]].

## Next steps

- Re-auth the current KeepSidian plugin so capture flows again while this is built.
- Decide the raw-pull source (first open decision above).
- Build the smallest useful slice first: pull plus my-language tagging plus the staleness watchdog.
