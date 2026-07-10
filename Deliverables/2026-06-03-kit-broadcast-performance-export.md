---
type: kit-export
created: 2026-06-03
source: Kit MCP get_broadcasts_stats
date_range_start: 2024-06-03T00:00:00Z
date_range_end: 2026-06-03T23:59:59Z
rows_observed: 351
status: fallback-export
---

# Kit Broadcast Performance Export

Kit MCP worked. Local CSV writing did not, so this is the fallback export: paste-ready CSV blocks built from the Kit stats pull.

Date range covered:

- `2024-06-03T00:00:00Z` through `2026-06-03T23:59:59Z`

Rows pulled from Kit stats:

- `351`

Rows skipped:

- Drafts: skipped by using Kit stats completed sends and the sent-date range.
- Broadcasts without `send_at`: skipped by the sent-date range.
- Outside date range: skipped by `sent_after` / `sent_before`.

Audience bucket rules:

- `tiny_segment` = recipients under 100
- `small_segment` = 100 to 999 recipients
- `mid_list` = 1000 to 4999 recipients
- `full_list` = 5000+ recipients

## kit_top_opens_full_list.csv

```csv
broadcast_id,send_at,subject,recipients,audience_bucket,open_rate,click_rate,emails_opened,total_clicks,unsubscribe_rate,unsubscribes
18957446,2025-05-26T17:30:00Z,"re: tmrw’s meeting",8970,full_list,57.35,0.69,5144,80,0.41,37
17914656,2025-01-26T18:15:00Z,"🐌 Why i’m leaving social media |🍦Soft Sunday",9409,full_list,56.59,1.25,5325,233,0.09,8
17710020,2025-01-27T18:30:00Z,"re: tmrw’s Soft CEO meetup",9317,full_list,56.5,0.61,5264,90,0.26,24
17442195,2025-01-19T18:15:00Z,"What’s shifting in 2025? Here’s what I’m betting on |🍦 Soft Sunday",9455,full_list,56.12,1.08,5306,172,0.21,20
17685964,2025-01-12T18:15:00Z,"Why I burned down a perfectly good business (on purpose)",9474,full_list,56.08,1.7,5313,482,0.22,21
17441667,2024-12-08T18:15:00Z,"What I learned from one simple re-engagement email  | 🍦 Soft Sunday",9652,full_list,55.46,0.47,5353,119,0.16,15
15748345,2025-01-06T18:30:00Z,"👀 You coming tmrw {{ subscriber.first_name }}?",9407,full_list,55.18,0.73,5191,103,0.39,37
18940263,2025-04-28T16:30:00Z," re: tmrw’s planning appointment [🥖 Soft Ceo Session]",9076,full_list,55.11,0.76,5002,79,0.22,20
18394130,2025-02-20T20:43:43Z,"This isn’t about email (but it kinda is)",9075,full_list,55.03,0.33,4994,50,0.22,20
17442039,2024-12-15T15:53:34Z,"🔌TRULY logging off starts with this.. | 🍦 Soft Sunday",9587,full_list,54.91,0.74,5264,187,0.23,22
18175711,2025-02-02T18:15:00Z,"☕ End of Month CEO reflection |🍦Soft Sunday",9359,full_list,54.17,0.68,5070,97,0.13,12
18739589,2025-03-23T15:00:00Z,"Me: I need ideas. Also me: forgets 87 I already had |🍦Soft Sunday ",9223,full_list,54.04,0.53,4984,104,0.14,13
17261409,2024-12-28T18:00:00Z,"SALE ALERT [year-long-planning-workshop] 🍾🍾",9285,full_list,53.96,0.9,5010,133,0.22,20
15709860,2025-01-07T18:15:00Z,"Soft Ceo Session happening NOW! ☁️",9375,full_list,53.93,0.92,5056,139,0.14,13
18751826,2025-03-24T16:30:00Z,"tomorrow: stable April vibes",9131,full_list,53.93,0.25,4924,29,0.23,21
17965291,2025-01-31T18:00:00Z,"Hate marketing? You’ll love this. 😏",9063,full_list,53.7,0.23,4867,29,0.2,18
17323683,2024-12-13T16:00:00Z,"🎁 DAY 5: 15% off everything! CHRISTMAS COUPONS 🎁",9417,full_list,53.66,1.2,5053,469,0.13,12
17964987,2025-01-23T18:00:00Z,"🙅STOP marketing like this [pssst, the waitlist is open!!!] ",9218,full_list,53.55,0.34,4936,62,0.17,16
17710158,2025-01-28T18:15:00Z,"Soft Ceo Session happening NOW! ☁️",9303,full_list,53.53,0.57,4980,66,0.23,21
19653476,2025-05-29T19:04:15Z,"🧸 let me gentle parent your business model. ",9006,full_list,53.39,0.3,4808,68,0.13,12
```

## kit_top_clicks_full_list.csv

```csv
broadcast_id,send_at,subject,recipients,audience_bucket,open_rate,click_rate,emails_opened,total_clicks,unsubscribe_rate,unsubscribes
15851886,2024-07-18T15:00:00Z,"🙅‍♀️ DON'T “grow your list” do this instead…",16088,full_list,34.41,5.42,5536,1209,0.09,14
22909048,2026-02-26T18:15:00Z,"📌 Class link {{ subscriber.first_name }}!",8561,full_list,50.15,2.69,4293,523,0.19,16
15851804,2024-07-16T17:00:00Z,"SECRETS of consistent entrepreneurs 👀",16477,full_list,31.95,2.28,5264,608,0.07,11
22908042,2026-02-16T18:17:56Z,"[INVITE inside] Slowly Viral 💌  free pinterest class inside",8516,full_list,48.02,2.25,4089,568,0.15,13
22992485,2026-03-02T00:00:00Z,"[🎥Last Chance] Replay: Slowly Viral 📌",8524,full_list,46.35,1.97,3951,597,0.07,6
20993575,2025-09-24T14:35:00Z,"I need your help! [$39 Q4 planner for FREE in exchange]",8842,full_list,50.51,1.93,4466,279,0.16,14
20912559,2025-10-03T16:14:32Z,"Personal Update & a $12,212 coupon 🫢🤯",8750,full_list,48.31,1.75,4227,629,0.11,10
17685964,2025-01-12T18:15:00Z,"Why I burned down a perfectly good business (on purpose)",9474,full_list,56.08,1.7,5313,482,0.22,21
20848855,2025-11-10T16:00:00Z,"your 2026 MASTER PLAN inside💸",8188,full_list,48.38,1.69,3961,309,0.12,10
22837195,2026-02-08T16:45:00Z,"oopsie, I've been gatekeeping?",8467,full_list,48.81,1.67,4133,141,0.21,18
18226029,2025-02-16T22:00:00Z,"[🎥Last Chance] Replay: Anti-Social Marketing",9287,full_list,53.02,1.55,4924,267,0.08,7
23358828,2026-03-22T14:50:00Z,"Your list called, they're hungry 👀",8558,full_list,44.12,1.47,3776,349,0.23,20
22984507,2026-02-22T17:30:00Z,"ur (not)NEW march plan inside | 🍦Soft Sundays",8522,full_list,49.52,1.46,4220,496,0.13,11
20913200,2025-12-28T18:00:00Z,"SALE ALERT [year-long-planning-workshop] 🍾🍾",7956,full_list,47.18,1.42,3754,306,0.09,7
21288442,2025-10-13T14:00:00Z,"Your 2026 business plan inside 📈",8730,full_list,50.05,1.41,4369,329,0.08,7
18225873,2025-02-14T16:00:00Z,"[MISSED IT?] Replay for ya for a limited time 💻",9300,full_list,50.83,1.41,4727,256,0.09,8
22992641,2026-03-02T18:00:00Z,"Back of House just went God Mode 😮‍💨 ($500 INSIDE)",8431,full_list,44.89,1.38,3785,469,0.26,22
20942960,2025-10-12T15:40:00Z,"🪄 I FIXED your email list (the plan inside) | 🍦Soft Sundays",8737,full_list,52.36,1.38,4575,358,0.1,9
20851164,2025-12-26T18:00:00Z,"Coupon Inside - 70% off my planning system 🥂📈",7965,full_list,47.06,1.38,3748,377,0.16,13
17920106,2025-01-14T16:05:00Z,"Being ANTISOCIAL & thriving.",9463,full_list,52.39,1.37,4958,478,0.16,15
```

## kit_top_total_clicks.csv

```csv
broadcast_id,send_at,subject,recipients,audience_bucket,open_rate,click_rate,emails_opened,total_clicks,unsubscribe_rate,unsubscribes
15851886,2024-07-18T15:00:00Z,"🙅‍♀️ DON'T “grow your list” do this instead…",16088,full_list,34.41,5.42,5536,1209,0.09,14
20912559,2025-10-03T16:14:32Z,"Personal Update & a $12,212 coupon 🫢🤯",8750,full_list,48.31,1.75,4227,629,0.11,10
15851804,2024-07-16T17:00:00Z,"SECRETS of consistent entrepreneurs 👀",16477,full_list,31.95,2.28,5264,608,0.07,11
22992485,2026-03-02T00:00:00Z,"[🎥Last Chance] Replay: Slowly Viral 📌",8524,full_list,46.35,1.97,3951,597,0.07,6
22908042,2026-02-16T18:17:56Z,"[INVITE inside] Slowly Viral 💌  free pinterest class inside",8516,full_list,48.02,2.25,4089,568,0.15,13
22909048,2026-02-26T18:15:00Z,"📌 Class link {{ subscriber.first_name }}!",8561,full_list,50.15,2.69,4293,523,0.19,16
17347200,2024-11-24T18:15:00Z,"Why email marketing is about to feel...different | 🍦 Soft Sunday",15598,full_list,34.4,0.71,5366,514,0.09,14
22984507,2026-02-22T17:30:00Z,"ur (not)NEW march plan inside | 🍦Soft Sundays",8522,full_list,49.52,1.46,4220,496,0.13,11
17685964,2025-01-12T18:15:00Z,"Why I burned down a perfectly good business (on purpose)",9474,full_list,56.08,1.7,5313,482,0.22,21
17920106,2025-01-14T16:05:00Z,"Being ANTISOCIAL & thriving.",9463,full_list,52.39,1.37,4958,478,0.16,15
22992641,2026-03-02T18:00:00Z,"Back of House just went God Mode 😮‍💨 ($500 INSIDE)",8431,full_list,44.89,1.38,3785,469,0.26,22
17323683,2024-12-13T16:00:00Z,"🎁 DAY 5: 15% off everything! CHRISTMAS COUPONS 🎁",9417,full_list,53.66,1.2,5053,469,0.13,12
17178397,2024-11-10T18:15:00Z,"Your Pre-Plan Checklist for 2025 |🍦 Soft Sunday",15744,full_list,33.23,1.11,5232,457,0.08,12
18393984,2025-02-19T20:34:22Z,"The silent killer of GOOD work. (pls avoid!⚠️)",9141,full_list,53.91,0.93,4928,451,0.14,13
17163970,2024-11-11T16:00:00Z,"your 2025 MASTER PLAN inside💸",15613,full_list,30.15,1.17,4707,424,0.08,12
20912560,2025-10-05T15:15:00Z," Your Q4 pre-sale to-do list | 🍦 Soft Sundays",8756,full_list,52.42,1.19,4590,408,0.15,13
20942821,2025-11-16T17:50:00Z,"No BFri offer? No problem, Fix Inside | 🍦Soft Sunday",8556,full_list,39.59,1.2,3387,404,0.14,12
20912561,2025-10-06T15:00:00Z,"my social media TO DON'T LIST inside 🤓📈",8752,full_list,48.0,0.96,4201,386,0.09,8
22968825,2026-02-28T17:45:00Z,"Early Access[$1k off + my email vault for 5 of you]  ",841,small_segment,58.62,11.89,493,380,0.36,3
20851164,2025-12-26T18:00:00Z,"Coupon Inside - 70% off my planning system 🥂📈",7965,full_list,47.06,1.38,3748,377,0.16,13
22909113,2026-02-27T16:00:00Z,"[replay inside] Slowly Viral + $1k off BOH",836,small_segment,60.05,18.54,502,370,0.12,1
20942960,2025-10-12T15:40:00Z,"🪄 I FIXED your email list (the plan inside) | 🍦Soft Sundays",8737,full_list,52.36,1.38,4575,358,0.1,9
20848854,2025-11-09T16:50:00Z,"Interview with 2026 |🍦 Soft Sunday",8633,full_list,52.31,1.33,4516,355,0.16,14
23358828,2026-03-22T14:50:00Z,"Your list called, they're hungry 👀",8558,full_list,44.12,1.47,3776,349,0.23,20
17323100,2024-12-10T16:00:00Z,"🎁 50% off inside DAY 2 CHRISTMAS COUPONS 🎁",9449,full_list,51.47,0.99,4863,346,0.04,4
23543489,2026-04-05T22:08:29Z,"I failed |🍦Soft Sunday",8537,full_list,44.95,1.36,3837,341,0.18,15
16763714,2024-10-04T15:00:00Z,"Personal Update & a $14,395 coupon 🫢🤯",15818,full_list,29.5,0.84,4667,332,0.06,10
21288442,2025-10-13T14:00:00Z,"Your 2026 business plan inside 📈",8730,full_list,50.05,1.41,4369,329,0.08,7
20574670,2025-08-17T16:15:00Z,"3 emails to ctrl+c and $$ |🍦Soft Sunday",9082,full_list,51.74,0.95,4699,324,0.32,29
20848855,2025-11-10T16:00:00Z,"your 2026 MASTER PLAN inside💸",8188,full_list,48.38,1.69,3961,309,0.12,10
```

