# WS-005 - Meeting Capture Processing

- **Status:** Active
- **Type:** Workstream - multi-agent composition
- **Owners:** Larry (routing + cleanup), Mack (automation), Penn (PKM writing), Alyssa (approval gate for raw deletion)
- **References:** [[WS-001-daily-journaling]], [[WS-004-inbox-processing]], [[GL-001-file-naming-conventions]], [[GL-002-frontmatter-conventions]], [[GL-005-team-inbox-protocol]]
- **Triggered by:** Meetily recording completed, a meeting pointer lands in `Notebook/Inbox/Meeting Captures/`, or Alyssa says "process this meeting".

## Purpose

Turn bot-free meeting recordings into useful myPKA memory without hoarding raw audio/video or dumping full transcripts into the vault.

The canonical flow is:

`Meetily raw folder outside vault -> pointer note in Notebook/Inbox -> processed Journal note -> CRM/Project links -> extracted Alyssa/client gold -> media deleted after 7 days -> transcript retired after processed memory exists`

## Storage Rule

Raw meeting audio, video, and transcript files do not live in myPKA. They stay in Meetily's recording folder while they are useful as source evidence.

Audio/video is disposable. **Daily Meeting Clean** deletes bulky media files after 7 days, always.

Transcripts are useful but temporary source. They stay outside the vault until the meeting has been processed, then retire after the processed note has had a safety window. Do not copy a full transcript into the vault unless Alyssa explicitly asks.

`Notebook/Inbox/Meeting Captures/` stores only lightweight pointer notes. The finished knowledge lives in `Notebook/Journal/YYYY/MM/` and links out to CRM People, Projects, Offers, Topics, or Goals as needed.

## Step 1 - Capture Detection

Mack detects a completed Meetily folder containing at least:

- `metadata.json`
- `transcripts.json`
- optionally `audio.mp4`

If automation is not installed yet, Alyssa can paste the raw folder path in chat and Larry runs the same flow manually.

## Step 2 - Pointer Creation

Mack creates a small pointer note in `Notebook/Inbox/Meeting Captures/` with:

- date
- source app
- raw source path
- status: `new`
- optional meeting/person guess
- media cleanup status
- transcript cleanup status

Do not copy the raw transcript into the pointer note.

## Step 3 - Processing

Larry routes the pointer to Penn.

Penn reads the transcript source, distills the meeting into a standalone Journal note, and creates or updates CRM/Project/Offer links following [[WS-001-daily-journaling]] and [[GL-002-frontmatter-conventions]].

The processed note should include, when relevant:

- high-signal summary
- decisions
- action items
- task routing: which action items became open tasks, which were left as notes, and why
- client follow-up capture: what Alyssa sent after the meeting, including links to Trello boards, checklists, recap emails, or shared docs
- client commitments: what the client is supposed to do short-term and long-term
- people notes
- project or offer implications
- follow-up commitments
- exact-word excerpts when Alyssa explains positioning, copy, creative direction, client language, or a phrase she may want to reuse later
- source path and raw cleanup status

## High-Leverage Extraction

The transcript is not clutter; it is temporary source to mine. When processing a meeting, extract the durable value before the transcript retires:

- **Alyssa's consulting language:** how she explains strategy, copy, positioning, scope, and next steps in her own words.
- **Reusable client-facing phrasing:** sentences the client would otherwise have to write down feverishly.
- **Sales page / offer diagnosis patterns:** what Alyssa notices when a client says or shows a specific thing.
- **Meeting structure:** how Alyssa opens, redirects, clarifies, teaches, closes, and assigns next steps.
- **Client objections and hesitations:** the real language clients use when stuck.
- **Voice-of-customer lines:** client words that may become copy, positioning, FAQs, or proof.
- **Follow-up drafts:** recap emails, Trello/list/checklist language, or "here is what you do next" notes.

Do not save all of this as a second transcript. Save selected exact excerpts and patterns inside the processed meeting note, linked tasks, or the relevant Studio analysis surface.

## Meeting Note Output Contract

Every processed meeting note should answer five questions:

1. **What happened?** A clean summary of the conversation.
2. **What matters for memory?** People details, client preferences, project context, decisions, risks, or recurring themes.
3. **What did Alyssa promise or imply she would do?** These become candidate tasks.
4. **What should be quoted exactly?** Capture Alyssa's own wording when it contains useful copy, positioning, creative direction, an explanation of how she would write something, or language likely to be reused.
5. **Where does each output go?** Journal for meeting memory, CRM for people facts, Project/Offer files for durable project context, `Studio/Team Knowledge/tasks/` for reminders and follow-through, and external tools such as Trello when the client-facing action list lives there.

## Task Routing Rule

Action items are not allowed to live only inside the meeting note when they require follow-up.

Use this rule:

- If Alyssa needs to do it, create or update a task in `Studio/Team Knowledge/tasks/open/` with `assignee: alyssa`.
- If the team needs to do it, create or update a task with the responsible specialist as assignee.
- If it is just a fact or preference, keep it in the Journal/CRM/Project note.
- If it is a recurring habit or dashboard-worthy routine, connect it to the relevant Project, Key Element, or future dashboard view.

The meeting note should link to any created tasks so the memory and reminder stay connected.

## Client Follow-Up Rule

If Alyssa sends a client recap, Trello list, checklist, action plan, Loom, shared doc, or "here is what you do next" message after the meeting, capture that follow-up as part of the meeting record.

The processed note should distinguish:

- **Alyssa follow-up:** what Alyssa needs to send or already sent.
- **Client short-term tasks:** what the client is supposed to do next.
- **Client long-term tasks:** larger commitments, upcoming decisions, or future implementation steps.
- **External task system:** Trello board/list/card, shared doc, email thread, or other source of truth if the client-facing list lives outside myPKA.

If the client-facing task list lives in Trello or another external tool, myPKA should link to it and summarize its purpose. Do not duplicate the whole external task list unless Alyssa asks.

## Step 3b - Project and Offer cross-linking

After Penn files the Journal note, Larry checks `Notebook/Life/Projects/` and `Library/Offers/` for a file that matches the meeting's subject.

If a matching Project or Offer file exists:
1. Add a **Status update** or **Open threads** entry to the Project/Offer file noting the meeting happened and linking to the Journal entry.
2. Add a `[[wikilink]]` to the Project/Offer file from the Journal entry's "Related notes" section.

This step is mandatory. A meeting without a project cross-link is a ghost in the system — the Journal entry exists but the project file doesn't know the meeting happened.

If no matching Project file exists but the meeting clearly relates to ongoing project work, Larry creates a stub Project file following the template in `Studio/Team Knowledge/Templates/project.md` and links it.

## Step 4 - Raw Source Cleanup

Media cleanup is automatic:

- **Audio/video:** deleted after 7 days by `Studio/Team Knowledge/Automations/meetily-inbox-prep.ps1`.
- **Transcript:** retained as temporary source until a processed meeting note exists, then retired after the transcript-retention window.

After the processed note exists, Larry updates the pointer note:

- `status: processed`
- `processed_at: <timestamp>`
- `processed_note: [[...]]`

If a full raw folder cleanup is still needed after transcript retirement, Larry asks Alyssa to approve one of:

- **Delete now** - remove the raw Meetily folder immediately.
- **Quarantine** - move the raw folder into a local `_ready-to-delete` folder for regular cleanup.
- **Keep** - leave the raw folder in place.

Default recommendation: delete the shell folder after media is gone and the processed note is trusted. Keep transcripts only while they are actively useful as source.

## Step 5 - Weekly Meeting Processing

During **Weekly Meeting Processing**, `Notebook/Inbox/Meeting Captures/` is reviewed as a batch.

Meeting capture pointers are processed before general ideas when they contain time-sensitive action items or follow-ups. Urgent meetings can still be processed on demand when Alyssa says "process this meeting."

## Automation Target

Mack's automation target:

1. Scan or watch the Meetily recordings folder for newly completed meeting folders.
2. Wait until `metadata.json` says `status: completed`.
3. Create a pointer note in `Notebook/Inbox/Meeting Captures/`.
4. Delete audio/video older than 7 days.
5. Retire transcripts only after the pointer is marked processed and the transcript-retention window has elapsed.
6. Optionally notify Alyssa that a meeting is ready for processing.
7. During Weekly Meeting Processing, process meeting pointers through Larry/Penn judgment.

## What Not To Do

- Do not store raw audio in Obsidian.
- Do not copy full raw transcripts into the vault unless Alyssa explicitly asks.
- Do not delete transcripts before a processed Journal note exists.
- Do not create People/Project facts in multiple places. CRM/Project files are the source of truth; Journal notes link to them.
