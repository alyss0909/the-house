---
title: Gmail filters — paste-and-go
status: hers to run, whenever
owner: Alyssa
zone: Studio
desk: Mailroom
updated: 2026-07-13 — rebuilt after first version wrongly mixed senders from all 4 accounts into one list
---

# Gmail filters — paste-and-go

**v2 — every sender below was re-verified against live mail pulled from your 4 inboxes on 2026-07-13, and split by which account it actually belongs to.** The first version of this file bundled senders from all four accounts into single combined strings — the data itself was real, but pasting a cross-account blob into one inbox's filter search made most of it look like zero matches. That's fixed: each section below only ever goes into the ONE account named in its header.

**How:** In that account's Gmail → settings gear → See all settings → Filters and Blocked Addresses → Create a new filter. Paste the string into "From" (and "Subject" where noted). Click **Search** to preview matches before creating — you should now actually see real mail show up.

---

## Business — alyssa@alyssacoleman.ca

**Skip inbox — Zoom reminders only** (not "meeting assets ready" recaps, those stay):
From: `no-reply@zoom.us` · Subject: `reminder`
Actions: Skip Inbox, Mark as read

**Skip inbox — Kajabi / Wake Up To Freedom reminders:**
From: `noreply@communities.kajabimail.com` · Subject: `reminder OR "live session"`
Actions: Skip Inbox, Mark as read

**Label "Tool updates"** (create the label first):
From: `info@metricool.com OR *@mail.notion.so OR affiliates@thrivecart.com OR growth@thrivecart.com OR help@convertkit.com OR olly@senja.io`
Action: Apply label "Tool updates" — leave in inbox.

## Personal — accoleman100@gmail.com

**Skip inbox — social recaps:**
From: `informational@email.snapchat.com OR jobs-listings@linkedin.com OR *@*.nextdoor.com`
Actions: Skip Inbox, Mark as read

**Label "Tool updates":**
From: `*@m.leadpages.com OR *@notifications.leadpages.com OR *@e.bluehost.com`
Action: Apply label "Tool updates" — leave in inbox.

**Mark as read only** (system/account notices you like to see, then clear):
From: `googleplay-noreply@google.com OR news-googleplay@google.com OR notification@lunchmoney.app OR notifications@o.wealthsimple.com`
Action: Mark as read only, stays in inbox.

## Support — productiveentrepreneurteam@gmail.com

**Skip inbox — Instagram recaps:**
From: `posts-recap@mail.instagram.com OR posts-recaps@mail.instagram.com`
Actions: Skip Inbox, Mark as read

**Label "Tool updates":**
From: `marcom@riverside.fm OR info@make.com OR olly@senja.io OR help@convertkit.com`
Action: Apply label "Tool updates" — leave in inbox.

**Mark as read only:**
From: `google-noreply@google.com`
Action: Mark as read only, stays in inbox.

## Wellness — alyssacolemanwellness@gmail.com

**Label "Tool updates":**
From: `marketing@engage.canva.com OR hello@creativemarket.com OR *@daniellelaporte.com`
Action: Apply label "Tool updates" — leave in inbox.

**Mark as read only:**
From: `google-noreply@google.com`
Action: Mark as read only, stays in inbox.

---

## Never filter — must always arrive unread, in the inbox, in every account

- Google **security** alerts — `no-reply@accounts.google.com` (different sender from the "Terms updates" one above — do not confuse them)
- Failed/declined payments (Stripe, ThriveCart "Failed payment", Notionsocial)
- Dennis (bookkeeper) — `dennis@fint.cloud` (business account)
- Real humans, paid-member join requests
- Your own broadcasts, Zoom "Meeting assets ready" recaps

Run each From string through Gmail search first and eyeball the results before creating the filter — you should see real matches now, in the account named in that section's header.
