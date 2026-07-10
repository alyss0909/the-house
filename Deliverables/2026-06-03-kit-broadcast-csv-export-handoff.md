---
type: deliverable
created: 2026-06-03
status: blocked-by-local-runner
owner: Larry
source: Kit MCP
---

# Kit Broadcast CSV Export Handoff

## Goal

Create CSV exports for all sent Kit broadcasts between:

- Start: `2024-06-03T00:00:00Z`
- End: `2026-06-03T23:59:59Z`

Do not include drafts.

Use `send_at` as the date filter, not `created_at`.

Preserve exact subject lines and preview text, including emojis, spacing, punctuation, and Liquid tags like `{{ subscriber.first_name }}`.

Use `broadcast_id` as the cross-reference key between files.

## Files To Create

### 1. Subject + Preview Archive

Filename:

```text
kit_subject_preview_archive_2024-06-03_to_2026-06-03.csv
```

Columns:

```csv
broadcast_id,send_at,published_at,created_at,subject,preview_text,description
```

Data source:

```text
Kit list_broadcasts
```

Include only rows where:

- `status == "completed"`
- `send_at` is not null
- `send_at` is between `2024-06-03T00:00:00Z` and `2026-06-03T23:59:59Z`

Sort:

- `send_at` descending

### 2. Performance Leaderboard

Filename:

```text
kit_performance_leaderboard_2024-06-03_to_2026-06-03.csv
```

Columns:

```csv
broadcast_id,send_at,subject,recipients,audience_bucket,open_rate,click_rate,emails_opened,total_clicks,unsubscribe_rate,unsubscribes
```

Data source:

```text
Kit get_broadcasts_stats
```

Pagination:

- `per_page: 100`
- Use `after: pagination.end_cursor`
- Continue until `pagination.has_next_page == false`

Date filter:

- `sent_after: 2024-06-03T00:00:00Z`
- `sent_before: 2026-06-04T00:00:00Z`

Audience bucket rules:

```text
tiny_segment = recipients under 100
small_segment = 100 to 999 recipients
mid_list = 1000 to 4999 recipients
full_list = 5000+ recipients
```

Sort:

- `send_at` descending

### 3. Top Opens Full List

Filename:

```text
kit_top_opens_full_list.csv
```

Source:

- Performance leaderboard rows only where `audience_bucket == "full_list"`

Sort:

- `open_rate` descending

### 4. Top Clicks Full List

Filename:

```text
kit_top_clicks_full_list.csv
```

Source:

- Performance leaderboard rows only where `audience_bucket == "full_list"`

Sort:

- `click_rate` descending

### 5. Top Total Clicks

Filename:

```text
kit_top_total_clicks.csv
```

Source:

- All performance leaderboard rows

Sort:

- `total_clicks` descending

## Confirmed Kit MCP Status

Kit MCP is available in this session.

Confirmed available tools:

- `list_broadcasts`
- `get_broadcasts_stats`
- `get_broadcast`
- `get_broadcast_stats`

## Completed Pull

The full `get_broadcasts_stats` pagination was completed for:

```json
{
  "per_page": 100,
  "sent_after": "2024-06-03T00:00:00Z",
  "sent_before": "2026-06-04T00:00:00Z"
}
```

Observed performance rows:

```text
351
```

The stats endpoint returned only completed sends in the pulled range.

## Local Runner Block

CSV file creation was blocked because both shell and Node local execution failed before commands could start.

Error:

```text
windows sandbox: setup refresh failed
```

The patch writer still works, which is why this handoff note could be created.

## Cleanest Next Step

Restart Codex Desktop, reopen this workspace, then ask:

```text
Larry, rerun the Kit CSV export from the handoff note.
```

The export should then be run with a real CSV writer so commas, quotes, emojis, Liquid tags, and line breaks are escaped correctly.

