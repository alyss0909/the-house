---
title: Mailroom — Gmail filter plan
status: AWAITING ALYSSA GO (2026-07-10)
owner: Larry
zone: Studio
desk: Mailroom
---

# Filter plan — awaiting Alyssa's go before creating

Decided with Alyssa 2026-07-10. Filters are standing config, so nothing is created until she says go. All are reversible; none delete mail.

## 1. Skip the inbox (arrive already-read, straight to All Mail)

**Social recaps**
- Instagram digests — `posts-recap@mail.instagram.com`, `posts-recaps@mail.instagram.com`
- Snapchat — `informational@email.snapchat.com`
- LinkedIn job alerts — `jobs-listings@linkedin.com`
- Nextdoor — `*@*.nextdoor.com`

**Event reminders (but NOT Zoom recaps)**
- Zoom reminders only — `from:no-reply@zoom.us subject:(reminder)` → skip. This intentionally leaves "Meeting assets … are ready" (the recaps she uses) in the inbox.
- Kajabi / Wake Up To Freedom session reminders — `noreply@communities.kajabimail.com subject:(reminder OR "live session")`

## 2. Keep in inbox, apply label "Tool updates" (she sometimes reads these)

`marcom@riverside.fm`, `*@m.leadpages.com`, `*@e.bluehost.com`, `marketing@engage.canva.com`,
`hello@creativemarket.com`, `info@metricool.com`, `info@make.com`, `olly@senja.io`,
`*@mail.notion.so`, `growth@thrivecart.com`, `affiliates@thrivecart.com`, `help@convertkit.com`,
`*@daniellelaporte.com`

## 3. Keep in inbox, mark as read on arrival (she likes to see them, then clears)

System notices — `googleplay-noreply@google.com`, `google-noreply@google.com` (Terms updates),
`notification@lunchmoney.app`, `notifications@o.wealthsimple.com`

## Never filtered (must arrive unread, in the inbox)

- Google **security** alerts (`no-reply@accounts.google.com`) — different sender from the Terms notices above; untouched.
- Failed / declined payments (Stripe, ThriveCart "Failed payment", Notionsocial)
- Her bookkeeper (`dennis@fint.cloud`), real humans, paid-member join requests
- Her own broadcasts (she reads them), Zoom "Meeting assets ready" recaps

## To build (on her go)

1. Create the `Tool updates` label.
2. Create the filters above via Composio Gmail (per-inbox where relevant).
3. Spot-check: confirm no security/payment/human mail matches any rule.
