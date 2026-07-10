---
type: realignment
agent: Larry
date: 2026-07-04
topic: boh-sales-page-realignment
---

# BOH Sales Page Realignment

## Trigger

Alyssa corrected the sales-page import pass: "wait we have the back of house sales page copy in full babe"

## Original direction

Larry/Silas included `[[PKM/My Life/Offers/back-of-house]]` in the batch of URL-backed offers to fetch from public `sales_page_url` values.

## Correction

Back of House already has canonical full sales page copy at `[[PKM/Second Brain/examples/sales-pages/boh-sales-page]]`. Future missing-copy sweeps should treat BOH as complete and should not recapture or overwrite that source file.

## Why it matters

BOH is the flagship reference page and already had the good copy. The sales-page recovery workflow should focus on missing or thin offer pages, not overwrite known-good source material.

## Follow-up

The local import helper was updated to exclude BOH from future batch URL captures.
