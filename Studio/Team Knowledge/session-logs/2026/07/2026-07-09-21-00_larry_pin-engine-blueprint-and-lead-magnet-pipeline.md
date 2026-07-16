---
agent_id: larry
session_id: pin-engine-blueprint-and-lead-magnet-pipeline
timestamp: 2026-07-09T21:00:00Z
type: close-session
linked_sops: []
linked_workstreams: []
linked_guidelines: ["GL-003-design-system"]
mined: true
---

# Pin Engine Blueprint: standing up the lead-magnet pipeline, then rebuilding one lead magnet four times until it was actually good

## Context

Alyssa asked Larry to set up justyn.ai's "One-Command Funnel Blueprint" (research → write → Notion page → landing page → email → deploy) as a real system in this project. Larry and Mack built the scaffolding (Notion pipeline database, three slash commands, Kit research), then ran the pipeline once on a real topic ("Pinterest keywords for your online business using Claude"). What followed was five rounds of Alyssa rejecting the output for being generic, then a prompt-library, then "Claude did nothing," which forced a real rebuild into an installable two-command engine. Session closed with the funnel live, deployed to local preview, and two new standing rules for how Larry builds anything for Alyssa going forward.

## What we did

- **Larry + Mack** stood up the pipeline infrastructure: Notion "Lead Magnet Pipeline" database (data source `de338819-a1a8-4b7f-8348-821d66dd1a8b`), three slash commands (`/lead-magnet`, `/landing-page`, `/execute-lead-magnets`), and confirmed Kit's real mechanism (manual `[Freebie] X Form` + `[Delivery] X` sequence pattern, no generic webhook).
- **Iris** built the reference landing page (`lead-magnet-system/reference/conversion-landing-sample.html`) matching GL-003's oat/linen/AT KING system, flagging the open question of whether outward marketing pages share the vault's token set 1:1.
- **Hermes** wrote and rewrote the Pinterest lead magnet content five times: (1) initial draft — flagged for em dashes and "quieter" (quiet-root AI tell), (2) voice-fixed but "boring, did you do any research?" — rebuilt with real Pinterest stats/algorithm signals/tool comparisons, (3) "still just prompts" — rebuilt around a real duplicable Notion tracker + a Claude Project knowledge file instead of copy-paste prompts, (4) confirmed no overlap with the existing Pin Planner freebie (dropped Status/Publish Date columns from the tracker, trimmed the cadence section to a one-line handoff), (5) niche-specific starter research added (coaches, content creators, online business owners) grounded in real published sources, never fabricated autocomplete data.
- **Larry** caught and fixed a real bug: the tracker database was created as a standalone object and only linked into the page, so duplicating the page would not have duplicated the database — everyone would have shared Alyssa's live data. Moved the database to be a true child of the page via `notion-move-pages`.
- **Larry** fetched Alyssa's real Pin Planner template and a reference article (marketingartfully.com, Claude + PinClicks workflow) after Alyssa said the deliverable "isn't good" and she "didn't think this was working out." Diagnosed the actual failure: the system reorganized the human's labor (tracker to fill in, assistant to feed) instead of removing it. Rebuilt the whole deliverable as **The Pin Engine Blueprint** — two real slash commands (`/pin-research`, `/pin-copy`) that read a blog post, research real keywords, judge winnability, fill the tracker, and write pin copy, with exactly one human taste gate (flip rows to "Ready").
- **Larry** restyled the finished blueprint into Alyssa's actual Notion product grammar (columns, `( O# )` gray callouts, "open me" toggles, checkboxes, embedded live database, terms/copyright footer) after she shared screenshots of her real templates (90 Day Clock In, 5 Minute Newsletter) and said the first version looked like "boring text I know I wouldn't read."
- **Larry** built and deployed the landing page (`website/lead-magnets/pin-engine-blueprint.html`) and delivery email (`lead-magnet-system/reference/emails/pin-engine-blueprint-delivery-email.md`), served it via a new `.claude/launch.json` preview config since the project's `.git` folder is a broken/empty shell (no HEAD, no remote) and git deploy is unavailable this session.
- **Larry** wrote two new standing memory rules at Alyssa's explicit request: [[feedback_engine_test]] (the "plate test" — every idea gets checked for whether it removes labor or just reorganizes it) and updated [[reference_notion_template_format]] to a standing default rather than a one-off pattern.

## Decisions made

- **Question:** Should the Kit opt-in mechanism be a generic custom webhook (per the blueprint's original spec) or match Alyssa's existing pattern?
  **Decision:** Match her existing pattern — native Kit form embed (`[Freebie] X Form`), created manually per lead magnet since Kit has no create-form API. No generic webhook receiver.
- **Question:** Should the Pinterest lead magnet's Notion tracker include scheduling/status/publish-date fields?
  **Decision:** No — those belong to the existing Pin Planner freebie's content calendar. The tracker stays scoped to keyword research + copy-drafting only, to avoid cannibalizing an existing product.
- **Question:** Is a "Claude Project + copy-paste prompts" deliverable sufficient for an "AI does X for you" lead magnet?
  **Decision:** No. The AI's role must include real analysis/judgment (keyword-cluster-finding, winnability judgment) on real data, and the deliverable must be installable infrastructure (commands + database), not prompts to re-paste. Codified as [[feedback_engine_test]].
- **Question:** Should all future Notion deliverables default to Alyssa's dash/template grammar, or is that a one-off style choice for this lead magnet?
  **Decision:** Standing default, applied automatically without being asked, for every Notion deliverable going forward.

## Insights

- Hermes's self-score checklists (18/18, "no quiet/quietly") can pass while missing root-word variants ("quieter") and em dashes used as connective tissue — self-score needs an explicit grep step, not a mental scan.
- "Is anyone using Claude for X" Reddit-style research requests often can't be fetched directly (Reddit returns 403 to defuddle, WebFetch, and raw curl with a browser UA alike) — when a user pastes a URL like this, ask for pasted content rather than retrying fetch methods repeatedly.
- The single most useful diagnostic question for any AI-workflow deliverable is "what work stopped existing for the user when they're done?" — if the honest answer is "they have a nicer place to do the same work," the structure is wrong regardless of how polished the content is.

## Realignments

- "its still just prompts" — even 4 solid copy-paste prompts don't count as a real deliverable; the bar is a persistent one-time-setup tool (Project/skill file), not chat text to re-paste.
- "its not a keyword finder tho they have to find their own keywords? claude code did nothing?" — an AI assistant that only formats copy around human-found keywords isn't automation; the AI must do the actual research/judgment step.
- "this part makes no sense tho" (setup checklist referencing "paste the row" with no explanation of what that means) — checklist items must be self-contained and concrete regardless of how the surrounding page gets reordered by the user.
- "the tracker will duplicate when they duplicate my whole pinterest thing tho right?" — caught a real duplication bug; any embedded database must be a true child of its page (moved via notion-move-pages) or duplication silently shares live data instead of copying it.
- "CUUUUUUTE i love this so much more ... make it look like me ... save those preferences so it does it from now on" — confirmed the dash/template grammar as a standing, always-applied default, not a one-off restyle.
- "save all the rules you learned from me here ... so that from now on this is how it runs if i come to you with any idea" — explicit instruction to graduate the whole engine-test diagnostic into permanent memory, applied to any future idea, any topic.

## Open threads

- [ ] Kit form for the Pin Engine Blueprint (`[Freebie] Pin Engine Blueprint Form`) still needs manual creation in Kit's UI; landing page currently ships with a clearly-marked placeholder instead of a live embed.
- [ ] Alyssa is evaluating Composio for Kit (broader tool coverage, possibly solves the create-form API gap) — revisit the Kit integration approach once that's connected.
- [ ] Git is unusable in this project (`.git` exists but has no HEAD/refs/remote, likely OneDrive sync damage) — nothing has been committed or deployed; Alyssa said "i dont have git rn," so this is parked, not urgent. Needs `git init` + remote setup whenever she's ready, with her go-ahead first per [[feedback_approve_before_execute]].
- [ ] Optional cosmetic: Alyssa may want a banner cover image on the Pin Engine Blueprint Notion page (like her "Clocking In" template) — deferred to her since it's a visual/brand choice, not a content one.
- [ ] Iris flagged an open design-system question during the reference landing page build: does the lead-magnet funnel share GL-003's token set 1:1 with the vault's app-chrome, or does Alyssa want a distinct "outward marketing" visual variant forked later? Not blocking, not yet answered.

## Next steps

- When Alyssa has a Kit form UID, swap the placeholder embed in `website/lead-magnets/pin-engine-blueprint.html` for the real Kit script tag (a 2-line change).
- When git is restored, commit and push the lead-magnet-system files and deploy per the original `/landing-page` command spec.
- Apply [[feedback_engine_test]] and the Notion dash-grammar default automatically to the next idea Alyssa brings, without needing to be reminded.

## Cross-links

- `[[2026-07-09-14-00_iris_lead-magnet-landing-reference]]` — Iris's reference landing page build earlier the same day, direct predecessor to this session's landing page work.
- `[[2026-07-07-22-00_larry_content-os-head-of-content-hire]]` — general Content OS context (Suki hire), tangential but same week.

Journal: [[2026-07-09-self-score-blind-spots-em-dash-and-quiet-root]]
