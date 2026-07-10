---
type: kit-analysis
created: 2026-06-04
source: Kit MCP get_broadcasts_stats
date_range_start: 2024-06-03T00:00:00Z
date_range_end: 2026-06-03T23:59:59Z
rows_reviewed: 351
owner: Larry
---

# Kit Broadcast Performance Analysis

I reviewed the Kit broadcast stats pulled for June 3, 2024 through June 3, 2026.

The raw CSV chunk approach is too annoying to use right now. This note is the actual analysis: what performed, what patterns show up, and what I would do with the data.

## Fast Read

Your best-performing emails are not just "good subject lines." They tend to be one of four things:

1. A clear timed moment: replay expires, class starting now, last chance, open before midnight.
2. A vulnerable or story-driven POV: leaving social, burned down a business, failed, gatekeeping, personal update.
3. A concrete useful asset: workbook, template, checklist, plan, class link, replay link.
4. A high-intent segment: small/private lists often crush rates, but full-list winners are better indicators of scalable subject strategy.

The big pattern: your list responds best when the subject creates a specific situation, not just a topic.

## Best Full-List Opens

These are the strongest scalable open-rate performers among `full_list` broadcasts.

| Broadcast ID | Send At | Subject | Recipients | Open Rate | Click Rate | Total Clicks |
|---:|---|---|---:|---:|---:|---:|
| 18957446 | 2025-05-26T17:30:00Z | re: tmrw’s meeting | 8970 | 57.35 | 0.69 | 80 |
| 17914656 | 2025-01-26T18:15:00Z | 🐌 Why i’m leaving social media \|🍦Soft Sunday | 9409 | 56.59 | 1.25 | 233 |
| 17710020 | 2025-01-27T18:30:00Z | re: tmrw’s Soft CEO meetup | 9317 | 56.5 | 0.61 | 90 |
| 17442195 | 2025-01-19T18:15:00Z | What’s shifting in 2025? Here’s what I’m betting on \|🍦 Soft Sunday | 9455 | 56.12 | 1.08 | 172 |
| 17685964 | 2025-01-12T18:15:00Z | Why I burned down a perfectly good business (on purpose) | 9474 | 56.08 | 1.7 | 482 |
| 17441667 | 2024-12-08T18:15:00Z | What I learned from one simple re-engagement email \| 🍦 Soft Sunday | 9652 | 55.46 | 0.47 | 119 |
| 15748345 | 2025-01-06T18:30:00Z | 👀 You coming tmrw {{ subscriber.first_name }}? | 9407 | 55.18 | 0.73 | 103 |
| 18940263 | 2025-04-28T16:30:00Z | re: tmrw’s planning appointment [🥖 Soft Ceo Session] | 9076 | 55.11 | 0.76 | 79 |
| 18394130 | 2025-02-20T20:43:43Z | This isn’t about email (but it kinda is) | 9075 | 55.03 | 0.33 | 50 |
| 17442039 | 2024-12-15T15:53:34Z | 🔌TRULY logging off starts with this.. \| 🍦 Soft Sunday | 9587 | 54.91 | 0.74 | 187 |

### Open-Rate Pattern

The open-rate winners are mostly not loud. They are relational, reflective, or situation-based:

- `re: tmrw’s meeting`
- `Why i’m leaving social media`
- `What’s shifting in 2025?`
- `Why I burned down a perfectly good business`
- `This isn’t about email`

The strongest openers feel like they contain a real point of view or a real appointment, not a generic marketing topic.

## Best Full-List Click Rates

These are the highest full-list click-rate performers.

| Broadcast ID | Send At | Subject | Recipients | Open Rate | Click Rate | Total Clicks |
|---:|---|---|---:|---:|---:|---:|
| 15851886 | 2024-07-18T15:00:00Z | 🙅‍♀️ DON'T “grow your list” do this instead… | 16088 | 34.41 | 5.42 | 1209 |
| 22909048 | 2026-02-26T18:15:00Z | 📌 Class link {{ subscriber.first_name }}! | 8561 | 50.15 | 2.69 | 523 |
| 15851804 | 2024-07-16T17:00:00Z | SECRETS of consistent entrepreneurs 👀 | 16477 | 31.95 | 2.28 | 608 |
| 22908042 | 2026-02-16T18:17:56Z | [INVITE inside] Slowly Viral 💌 free pinterest class inside | 8516 | 48.02 | 2.25 | 568 |
| 22992485 | 2026-03-02T00:00:00Z | [🎥Last Chance] Replay: Slowly Viral 📌 | 8524 | 46.35 | 1.97 | 597 |
| 20993575 | 2025-09-24T14:35:00Z | I need your help! [$39 Q4 planner for FREE in exchange] | 8842 | 50.51 | 1.93 | 279 |
| 20912559 | 2025-10-03T16:14:32Z | Personal Update & a $12,212 coupon 🫢🤯 | 8750 | 48.31 | 1.75 | 629 |
| 17685964 | 2025-01-12T18:15:00Z | Why I burned down a perfectly good business (on purpose) | 9474 | 56.08 | 1.7 | 482 |
| 20848855 | 2025-11-10T16:00:00Z | your 2026 MASTER PLAN inside💸 | 8188 | 48.38 | 1.69 | 309 |
| 22837195 | 2026-02-08T16:45:00Z | oopsie, I've been gatekeeping? | 8467 | 48.81 | 1.67 | 141 |

### Click-Rate Pattern

Full-list click winners usually contain one of these:

- a direct resource promise: `Class link`, `INVITE inside`, `Replay`, `MASTER PLAN`
- a contrarian move: `DON'T “grow your list”`
- a high-value exchange: `$39 planner for FREE`
- a personal/contextual hook attached to a useful link

The best click subject in the pull is `🙅‍♀️ DON'T “grow your list” do this instead…` with `1209` total clicks. That is a huge outlier and worth studying as a template.

## Highest Total Clicks

This is the most practical leaderboard if the goal is impact, not just rate.

| Broadcast ID | Send At | Subject | Recipients | Bucket | Open Rate | Click Rate | Total Clicks |
|---:|---|---|---:|---|---:|---:|---:|
| 15851886 | 2024-07-18T15:00:00Z | 🙅‍♀️ DON'T “grow your list” do this instead… | 16088 | full_list | 34.41 | 5.42 | 1209 |
| 20912559 | 2025-10-03T16:14:32Z | Personal Update & a $12,212 coupon 🫢🤯 | 8750 | full_list | 48.31 | 1.75 | 629 |
| 15851804 | 2024-07-16T17:00:00Z | SECRETS of consistent entrepreneurs 👀 | 16477 | full_list | 31.95 | 2.28 | 608 |
| 22992485 | 2026-03-02T00:00:00Z | [🎥Last Chance] Replay: Slowly Viral 📌 | 8524 | full_list | 46.35 | 1.97 | 597 |
| 22908042 | 2026-02-16T18:17:56Z | [INVITE inside] Slowly Viral 💌 free pinterest class inside | 8516 | full_list | 48.02 | 2.25 | 568 |
| 22909048 | 2026-02-26T18:15:00Z | 📌 Class link {{ subscriber.first_name }}! | 8561 | full_list | 50.15 | 2.69 | 523 |
| 17347200 | 2024-11-24T18:15:00Z | Why email marketing is about to feel...different \| 🍦 Soft Sunday | 15598 | full_list | 34.4 | 0.71 | 514 |
| 22984507 | 2026-02-22T17:30:00Z | ur (not)NEW march plan inside \| 🍦Soft Sundays | 8522 | full_list | 49.52 | 1.46 | 496 |
| 17685964 | 2025-01-12T18:15:00Z | Why I burned down a perfectly good business (on purpose) | 9474 | full_list | 56.08 | 1.7 | 482 |
| 17920106 | 2025-01-14T16:05:00Z | Being ANTISOCIAL & thriving. | 9463 | full_list | 52.39 | 1.37 | 478 |

### Total Click Pattern

The top total-click emails balance:

- broad relevance
- a concrete promised action
- clear stakes
- a subject that feels like a real opinion, not a label

`DON'T “grow your list” do this instead…` is the standout because it pairs a contrarian command with a useful alternative. That format is highly reusable.

## Small Segment Caution

Small segments can look incredible by rate:

| Broadcast ID | Subject | Recipients | Open Rate | Click Rate | Total Clicks |
|---:|---|---:|---:|---:|---:|
| 23099865 | you coming? | 189 | 76.72 | 38.62 | 141 |
| 21291633 | REPLAY INSIDE 📁 \| The Slow Marketing Plan | 314 | 73.25 | 30.25 | 254 |
| 24244560 | Appreciate you! (here's my newsletter template as a TY) | 104 | 38.46 | 22.12 | 42 |
| 22909113 | [replay inside] Slowly Viral + $1k off BOH | 836 | 60.05 | 18.54 | 370 |
| 22968825 | Early Access[$1k off + my email vault for 5 of you] | 841 | 58.62 | 11.89 | 380 |

These are useful for understanding high-intent buyer behavior, but I would not compare them directly to full-list sends. Use them to study offer language, not list-wide subject strategy.

## What Seems To Work

### 1. Appointment Language

Subjects like these repeatedly perform:

- `re: tmrw’s meeting`
- `You coming tmrw`
- `Class link`
- `Starting NOW`
- `See you in 1 hour`

This works because it creates a specific moment. It does not ask the reader to evaluate a broad idea; it asks them to attend to something happening.

### 2. Soft Vulnerability With a Concrete Angle

High-performing examples:

- `Why i’m leaving social media`
- `Why I burned down a perfectly good business`
- `oopsie, I've been gatekeeping?`
- `I failed`
- `This isn’t about email`

These work because they imply a story and a takeaway.

### 3. Contrarian Business Advice

The biggest click outlier is:

- `DON'T “grow your list” do this instead…`

This suggests a strong reusable formula:

```text
DON'T [common advice] — do this instead
```

or:

```text
Stop [default behavior], try [better behavior]
```

### 4. Specific Free/Useful Assets

Strong performers include:

- class links
- replay links
- templates
- planners
- checklists
- “custom plan” language

The more concrete the asset, the more clickable the email.

## What I Would Repeat

Use these subject-line families again:

```text
re: tmrw’s [specific appointment]
```

```text
Why I [surprising personal decision]
```

```text
DON'T [common business advice] — do this instead
```

```text
[resource] inside for [specific outcome]
```

```text
You coming, {{ subscriber.first_name }}?
```

```text
I [failed / left / burned down / gatekept] this, here’s what changed
```

## What I Would Stop Overvaluing

I would not overvalue:

- emoji density by itself
- cleverness without a clear action
- vague “plan inside” subjects unless the plan is tied to a specific moment or problem
- small-segment click rates as proof of full-list scalability

The winners are not just cute. They are situational, useful, and often slightly provocative.

## Practical Recommendations

1. Build a reusable “appointment email” subject bank.
2. For launches, combine personal story plus concrete action earlier in the sequence.
3. Keep using Soft Sunday as a trust-building lane, but reserve sharper CTAs for launch/event emails.
4. Use segmented “personal message” emails for high-intent groups, but judge them separately from full-list sends.
5. Create a mini swipe file from the outliers:
   - `DON'T “grow your list” do this instead…`
   - `Why I burned down a perfectly good business (on purpose)`
   - `re: tmrw’s meeting`
   - `Class link {{ subscriber.first_name }}!`
   - `Personal Update & a $12,212 coupon 🫢🤯`

## Bottom Line

Your strongest emails feel like a person with a point of view interrupting the reader for a real reason.

Best openers: personal, timely, relational.

Best clickers: useful, urgent, concrete.

Best total impact: contrarian advice + clear next action.

