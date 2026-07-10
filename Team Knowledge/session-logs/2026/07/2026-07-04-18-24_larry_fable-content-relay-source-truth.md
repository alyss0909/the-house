---
agent_id: larry
session_id: fable-content-relay-source-truth
timestamp: 2026-07-04T22:24:00Z
type: close-session
linked_sops: []
linked_workstreams: []
linked_guidelines: []
---

# Fable Content Relay Source Truth

## Context

Alyssa is preparing to use Fable 5 for a short window to deeply understand her Second Brain and eventually power a local, source-grounded content relay that writes, teaches, scores, and exports in her actual strategy and taste. The core risk is creating another generic AI content generator instead of a system grounded in Alyssa's own ideas, BOH modules, emails, themes, offers, CTAs, best performers, and real voice.

## What we did

- Larry clarified the larger project shape: first build a source-truth layer and Fable ingestion path, then later build the relay/agent workflow.
- Larry created a dedicated continuation handoff for the next chat at `[[Deliverables/2026-07-04-fable-content-relay-continuation-handoff]]` because this session contained more strategic project context than the original close-session log captured.
- Silas ran a read-only Second Brain audit to identify which materials are Alyssa-original versus AI-derived, interpreted, or lower-trust.
- Larry confirmed the monthly/weekly social rhythm from Alyssa's planning grid and the Notion Products DB screenshots/context.
- Mack accessed the Notion Products DB and confirmed it is the canonical source for product names, types, prices, themes, sales pages, product links, tags, and chat words.
- Larry added the Guest Cheque Quote source image to `[[PKM/Second Brain/examples/Carousels/2026-03-10-guest-cheque-quote]]`.
- Larry updated `[[PKM/Second Brain/examples/Carousels/INDEX]]` to include Guest Cheque Quote, clarify Cups Labeled / Wasting Time as the same reference lane, and hold the Monthly Repeating Planning Grid.
- Larry removed stale references to the now-removed standalone `content-rails.md` note and made the surviving planning label match Alyssa's wording.

## Decisions made

- **Question:** Is the planning grid March-specific or reusable?
  **Decision:** It is Alyssa's Monthly Repeating planning grid. "March" was only the source file/context, not the meaning of the rhythm.

- **Question:** Are `Theme` and `Focus` separate fields?
  **Decision:** No. Theme and focus mean the same thing for this content system.

- **Question:** Are offer carousels sales-only?
  **Decision:** No. Offer carousels are still educational and high-value; the slot changes CTA pressure and offer proximity, not the standard of usefulness.

- **Question:** Where does the monthly planning rhythm live now?
  **Decision:** It currently lives inside `[[PKM/Second Brain/examples/Carousels/INDEX]]` under Monthly Repeating Planning Grid, not in a separate `content-rails.md` file.

- **Question:** What is the canonical source for product/CTA truth?
  **Decision:** The Notion Products DB is canonical for product facts and ManyChat/chat words. The relay must not invent chat words when none are present.

## Insights

- Alyssa's content relay needs two brains, not one: a deep "Alyssa clone" trained on source truth and a production relay that uses that clone to retrieve, match, deepen, score, and export content.
- The highest-risk failure mode is generic content that sounds technically fine but ignores Alyssa's source truth, nuance, offer map, and audience sophistication.
- The Fable pass should be constrained by an ingestion manifest: what to read as Alyssa-original, what to treat as interpretation, and what to exclude or label as AI-derived.
- Carousel examples should be treated as visual/reference lanes, not just performance examples.
- Friday "For The Girls" posts are not throwaway personality content; they are identity, permission, taste-world, and shareability signals.

## Realignments

- Alyssa corrected the initial scope: she did not want full implementation yet; she wanted ideation and a good plan in ADHD-friendly moves.
- Alyssa then narrowed the action request: do only the specific vault updates already discussed instead of building the whole project.
- Alyssa clarified: "cups labelled and wasting time are the same thing, THIS is guest cheque quote."
- Alyssa clarified that "March" was misleading and renamed the planning context to Monthly Repeating planning grid because it is her repeatable rhythm.
- Alyssa clarified that `content-rails.md` no longer exists, so references to it should not remain active.

## Open threads

- [ ] Start from `[[Deliverables/2026-07-04-fable-content-relay-continuation-handoff]]` in the next chat.
- [ ] Build a Fable 5 ingestion pack/manifest that lists source-truth files, interpreted files, excluded AI-derived files, and task-specific reading paths.
- [ ] Add or confirm the canonical product/freebie/CTA map from the Notion Products DB in a durable vault-friendly form without duplicating product facts.
- [ ] Map BOH modules to public-facing teaching angles so the relay can retrieve one nuanced module lesson per content concept.
- [ ] Decide whether the Monthly Repeating Planning Grid should stay inside the carousel index or graduate into its own source-truth note under a clearer filename.
- [ ] Replace the Guest Cheque Quote Instagram screenshot with a clean cropped export if Alyssa has one later.
- [ ] Continue auditing for non-Alyssa / AI-derived materials before any Fable training or clone-building pass.

## Next steps

- Create the Fable 5 Ingestion Pack from `[[Deliverables/2026-07-04-fable-content-relay-continuation-handoff]]` as the next ADHD-friendly move.
- Use that pack to guide Fable through Alyssa-original source material first, interpreted materials second, and excluded/AI-derived material last or not at all.
- Keep the first build target modest: one source-grounded weekly content stack before attempting the full relay.

## Cross-links

- `[[2026-07-04-18-07_larry_second-brain-carousel-source-cleanup]]` - closest earlier cleanup session for carousel source truth.
- `[[2026-07-04-18-22_larry_carousel-interconnection-rule]]` - related rule about connecting carousel examples.
- `[[2026-07-04-18-22_larry_carousel-notion-taxonomy-rule]]` - related rule about Notion/product taxonomy.
