---
type: kit-performance-export-index
created: 2026-06-04
source: Kit MCP get_broadcasts_stats
date_range_start: 2024-06-03T00:00:00Z
date_range_end: 2026-06-03T23:59:59Z
export_format: Obsidian CSV chunks
---

# Kit Performance Leaderboard Chunks

This folder contains the full Kit performance leaderboard export in paste-ready CSV chunks.

The local CSV writer was unavailable, so the export is being written as numbered Obsidian markdown files. Each file contains a CSV block with the same header.

## Columns

```csv
broadcast_id,send_at,subject,recipients,audience_bucket,open_rate,click_rate,emails_opened,total_clicks,unsubscribe_rate,unsubscribes
```

## Progress

| Chunk | Rows | File | Next cursor |
|---|---:|---|---|
| 001 | 25 | [[kit_performance_leaderboard_chunk_001]] | `WzIyOTA4OTA5XQ==` |
| 002 | 25 | [[kit_performance_leaderboard_chunk_002]] | `WzIxMzg1NTY0XQ==` |
| 003 | 25 | [[kit_performance_leaderboard_chunk_003]] | `WzIwOTk1NTM4XQ==` |
| 004 | 25 | [[kit_performance_leaderboard_chunk_004]] | `WzIwODQ4ODU4XQ==` |

Rows exported so far: `100`

Next pull should use:

```json
{
  "per_page": 25,
  "after": "WzIwODQ4ODU4XQ==",
  "sent_after": "2024-06-03T00:00:00Z",
  "sent_before": "2026-06-04T00:00:00Z"
}
```
