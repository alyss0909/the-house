# GL-004 - Tag Taxonomy and Governance

> **This Guideline is the source of truth for tags.** Every agent checks this file before adding or editing a `tags:` frontmatter field. SOPs and Workstreams `[[wikilink]]` here rather than inventing their own tag rules.

Tags are a navigational layer, not a filing system. The vault already has structure: folders, frontmatter fields, `[[wikilinks]]`, Key Elements, Topics, Projects, Offers, and Second Brain indexes. Tags exist only when they help Alyssa or the team retrieve cross-cutting material quickly.

## Purpose

Use tags to support three goals:

1. Help related ideas collide across folders, time, and source type.
2. Help LLMs find the right Second Brain, framework, method, or idea cluster fast.
3. Keep the myPKA software-independent, readable, and durable.

Do not use tags to repeat facts that already live in a folder path, frontmatter field, title, or wikilink.

## Ownership and cadence

- **Owner:** Larry owns tag governance as Librarian.
- **Support owner:** Silas supports Larry with frontmatter parsing, malformed tag audits, import normalization, duplicate detection, and batch cleanup.
- **Every agent:** checks this Guideline before adding or editing tags.
- **New tags:** must be added to this Guideline before or in the same change as first use.
- **Audit cadence:** Larry audits tags at every session close. If work spans a day without a formal close, Larry runs the audit at least once per active day before stopping.

## Tag lanes

| Lane | Meaning |
|---|---|
| `approved` | Normal reusable vault tag. Safe for new notes when the usage boundary fits. |
| `journal-legacy` | Allowed in `Notebook/Journal/` and old imported Journal material. Do not enforce on governed Second Brain or entity notes unless explicitly approved. |
| `review` | Allowed for now, but Alyssa wants to revisit the boundary. Do not expand casually. |
| `prohibited` | Do not use. Remove or replace when found. |
| `retired` | Old tag that has a canonical replacement or deletion rule. |

## Core rules

### 1. Tags cross-cut; structure files

Use a tag when a future search should pull files from multiple places. If the grouping is already captured by folder, title, `type:`, `program:`, `key_element:`, `linked_topics:`, or a `[[wikilink]]`, do not add a tag.

### 2. Second Brain imports do not get structural tags

Second Brain files must not use tags that merely repeat source structure. Do not tag a file `transcript`, `template`, `analysis`, `index`, `program`, `back-of-house`, or `second-brain` just because it lives in that folder or has that `type:`.

Proprietary method tags are allowed when the note is substantively about the method.

### 3. Kebab-case, singular, full form

Tags are lowercase kebab-case. Use singular form unless the term is a proper named phrase.

| Use | Not |
|---|---|
| `back-of-house` | `boh` |
| `framework` | `frameworks` |
| `carousel` | `carousels` |
| `subject-lines` | `sl` |

Approved exception: `inspo`, because Alyssa explicitly kept it.

### 4. No agent names

Agent names are not content tags. If authorship matters, use frontmatter such as `author: wren`.

### 5. Copy-adjacent tags also carry `copy`

Any note tagged `brand-words`, `voice`, or `writing-style` must also carry `copy` while the voice/writing-style boundary is under review.

### 6. New tag procedure

Before adding a new tag:

1. Check the approved, journal-legacy, review, prohibited, and retired tables below.
2. Confirm the tag is cross-cutting and not duplicating folder/type/frontmatter structure.
3. Add a row to this Guideline with exact usage boundary and anchor.
4. Only then add the tag to note frontmatter.

## Approved tag table

| tag | lane | use when | do not use when | anchor | replacement/notes |
|---|---|---|---|---|---|
| `ai` | approved | AI tools, AI workflows, prompt/eval/memory systems, or AI-assisted work. | The note only mentions a generic tool in passing. | [[ai-tools]] | Replaces `ai-reference`, `llm-guide`, and many generic `prompts` uses. |
| `automation` | approved | Automation workflows, automation setup, or recurring system automation. | General productivity or operations without an automation component. | [[Studio/Team Knowledge/Automations/]] | Kept for automation retrieval outside Second Brain structural imports. |
| `back-of-house` | approved | The note is about the BOH offer/entity itself, not merely stored under Second Brain BOH content. | Second Brain files already in the Back of House folder. | [[back-of-house]] | `boh` is retired. |
| `blog` | approved | Blog ideas, blog inspiration, or blog as a content channel. | Generic writing or email ideas. | [[blog-and-pin]] | Kept as a channel tag. |
| `business` | approved | Broad business-domain entity notes where useful for cross-cutting retrieval. | If `key_element: business` already gives sufficient structure and no tag search is needed. | [[business]] | Used heavily in My Life/Offers. |
| `carousel` | approved | Carousel format, carousel frameworks, carousel examples, or carousel-specific ideas. | Generic social content. | [[carousel-framework]] | Replaces `carousels`. |
| `client` | approved | CRM/client context or client-work notes. | When a person's `relation: client` already covers it and no tag retrieval is needed. | [[clients]] | Replaces `client-work`. |
| `conversion-event` | approved | BOH conversion event concepts: webinar, workshop, hot seat, paid workshop, waitlist event, or similar. | Generic conversion advice without an event mechanic. | [[4.1 Soft Sales Back of House Slides]] | Distinct from `webinar`. |
| `copy` | approved | Copywriting, sales/email/page language, persuasion, hooks, subject lines, and voice-related writing assets. | Purely visual, operational, or technical notes. | [[copy-task-routing]] | Canonical copy tag. |
| `design` | approved | Brand design, visual design, web design, or design collaborators. | General brand strategy without a visual/design component. | [[rebrand]] | Replaces `web-design`, `brand` in design contexts. |
| `double-yes` | approved | Alyssa's Double Yes method or freebie logic. | Generic yes/no decisions. | [[1.4 The Double Yes Method]] | Proprietary method tag. |
| `email` | approved | Email content, email strategy, email examples, email copy, or sender/inbox ideas. | Generic copy with no email use case. | [[emails]] | Broad channel tag. |
| `email-first-offer-suite` | approved | The Email First Offer Suite concept/method. | Separate generic email or offer notes. | [[1.1 Email First Ecosystem]] | `email-first` and `offer-suite` merge here. |
| `email-hooks` | approved | Email hook patterns, CTA/hook logic, or email attention mechanics. | Generic hooks outside email unless explicitly useful. | [[2.2 Not Your Grandads Email Marketing Transcript]] | Replaces `hooks` and `ctas` in BOH email context. |
| `freebie` | approved | Freebie offers, freebie frameworks, opt-in incentives, or lead capture assets. | Generic offer notes with no freebie/opt-in angle. | [[1.4 The Freebie Framework]] | Replaces `lead-magnet` and `opt-in`. |
| `hiring` | approved | Hiring, contractor, assistant, candidate, or team-capacity notes. | Stable CRM facts where role fields are enough. | [[Studio/Team/agent-index]] | Used for Samir/Camila context. |
| `hot-lead-loop` | approved | The Hot Lead Loop in BOH/Soft Sales. | Generic lead nurturing. | [[4.1 Soft Sales Back of House Slides]] | Proprietary method tag. |
| `kit` | approved | Kit/ConvertKit platform setup, examples, or tactics. | Generic email content unrelated to Kit. | [[1.6 The Finishing Touches]] | Keep as tool/platform tag. |
| `mini-promo` | approved | Mini promo mechanics or 72-hour promo concepts. | Full launch/promo cycles where `promo` is enough. | [[4.1 Soft Sales Back of House Slides]] | Proprietary/tactical tag. |
| `newsletter` | approved | Newsletters, newsletter authors, or newsletter format work. | Generic email that is not newsletter-shaped. | [[the-5-minute-newsletter]] | |
| `notion` | approved | Notion products, templates, inspo, systems, or Notion-based offers. | General PKM or second brain work not involving Notion. | [[notion-templates]] | Added to all notes linked from [[notion-templates]]. |
| `notion-social` | approved | The Notion Social concept/offer/workflow. | Generic Notion or social notes. | [[notion-social]] | Proprietary/product tag. |
| `obsidian` | approved | Obsidian-specific design, setup, or workflow notes. | General PKM or second brain work not specific to Obsidian. | [[obsidian-design]] | Kept separate from `pkm`. |
| `pin-batching` | approved | Pinterest batching, bulk create/upload, pin workflow batching, or scheduling batches. | Generic Pinterest strategy where `pinterest` is enough. | [[3.3 The Batch]] | Replaces `bulk-create`, `bulk-upload`, `batching`, `pin-scheduling`. |
| `pin-planner` | approved | Pin Planner offer/product or specific pin-planner assets. | Generic Pinterest planning. | [[pin-planner]] | |
| `pinterest` | approved | Pinterest strategy, Pinterest examples, pin SEO, Pinterest traffic, or Pinterest offer ideas. | Generic social content without Pinterest angle. | [[3.2 Slow Pinterest]] | |
| `podcasting` | approved | Podcast guesting, podcast pitching, outreach, or podcast visibility workflow. | Generic visibility or outreach. | [[podcast-guesting]] | Replaces `visibility` and `outreach` for podcast files. |
| `pretty-links` | approved | Pretty Links setup or link-routing mechanics. | Generic links. | [[1.6 The Finishing Touches]] | |
| `productivity` | approved | Productivity workflows, time/energy systems, or productivity-related tools. | Generic AI tools unless productivity is the point. | [[ai-tools]] | Kept; under-observed in current vault. |
| `promo` | approved | Launches, promos, sales emails, push-to-buy/register copy, or promo cycles. | Generic marketing strategy. | [[4.1 Promo Copy Planner]] | Replaces `launch`, `sales-copy`, `sales-emails`, `lazy-launch`, `push-to-buy`, `push-to-register`. |
| `repurposing` | approved | Repurposing content across channels or formats. | Generic content planning. | [[3.1 Bread and Butter Content]] | |
| `right-time-offers` | approved | Alyssa's Right Time Offers method. | Generic offer strategy. | [[4.1 Soft Sales Back of House Slides]] | Proprietary method tag. |
| `rush-order` | approved | Rush Order offer, copy, or build notes. | Generic BOH or done-with-you concepts. | [[rush-order]] | Replaces `done-with-you` for Rush Order. |
| `second-brain` | approved | Notes about Second Brain construction, enrichment, retrieval, or PKM-to-LLM usage. | Files merely located inside `PKM/Second Brain/`. | [[PKM/Second Brain/INDEX]] | Meta tag only; prohibited as structural tag inside Second Brain content. |
| `signature-dish` | approved | Signature Dish method, signature offer shape, or Alyssa's philosophical offer language. | Generic brand philosophy. | [[1.2 Your Signature Dish]] | Replaces `signature-method`, `signature-offer`, and `philosophy` in BOH context. |
| `simmer-emails` | approved | Simmer emails or the Weekly Simmer method. | Generic email or newsletter. | [[2.3 The Weekly Simmer Slides]] | Replaces `simmer` in email-method context. |
| `slow-marketing` | approved | Slow marketing philosophy or slow marketing plan materials. | Generic marketing. | [[Slow Marketing Plan Class]] | |
| `social` | approved | Social media ideas/inspo where the specific platform is unknown or less important. | Pinterest-specific work, which uses `pinterest`. | [[instagram-inspiration]] | Kept as easy capture lane for social ideas. |
| `storytelling` | approved | Storytelling, story-based content, or narrative conversion. | Generic copy without a story angle. | [[2.1 Wanna Hear the Specials]] | `story` merges here. |
| `subject-lines` | approved | Subject line formulas, subject line operating systems, headlines used as email subject material. | Non-email headlines unless still useful to email copy. | [[subject-line-operating-system]] | |
| `sweet-segments` | approved | Sweet Segments method or segmentation as Alyssa teaches it. | Generic segmentation. | [[2.2 Not Your Grandads Email Marketing Transcript]] | Replaces `segmentation`. |
| `thrivecart` | approved | ThriveCart, checkout, order forms, or checkout setup. | Generic sales pages. | [[1.3 The Main Attraction]] | Replaces `checkout` in BOH context. |
| `traffic` | approved | Traffic systems, traffic sources, reach, visibility channels, or traffic-pantry material. | Podcast visibility, which uses `podcasting`. | [[3. Traffic Pantry/INDEX]] | |
| `tripwire` | approved | Tripwire offer logic, tripwire emails/pages, or BOH tripwire training. | Any small offer that is not tripwire-shaped. | [[1.5 The Perfect Apps]] | |
| `webinar` | approved | Webinars, workshops, webinar transcripts/classes, or webinar conversion events. | Any conversion event not webinar-shaped. | [[workshop-webinar-analysis]] | |
| `welcome-sequence` | approved | Welcome sequence, warm welcome, nurture sequence, or early email sequence content. | Generic email sequence if the welcome/nurture function is absent. | [[2.1 Wanna Hear the Specials]] | Replaces `email-sequence`. |

## Journal legacy tags

These tags are allowed in Journal/imported Journal material. Do not require new Second Brain or entity notes to use them unless a row above also approves the tag.

| tag | lane | use when | do not use when | anchor | replacement/notes |
|---|---|---|---|---|---|
| `brand-words` | journal-legacy | Capturing Alyssa vocabulary, phrases, metaphors, or word-bank material. | Generic copy or voice analysis without a word-bank function. | [[voice-and-writing-style]] | Must also carry `copy`; boundary with `voice` is under review. |
| `idea` | journal-legacy | Imported or captured ideas. | Governed Second Brain method/content files. | n/a | Kept always. |
| `inspo` | journal-legacy | Inspiration/reference captures, especially imported notes. | Governed Second Brain method/content files unless explicitly useful. | n/a | Approved abbreviation exception. |
| `meeting` | journal-legacy | Journal notes that are meeting captures. | CRM People or formal meeting-capture workflow notes unless needed. | [[WS-005-meeting-capture-processing]] | |
| `montessori` | journal-legacy | Legacy personal/lifestyle Montessori notes. | Business or Second Brain content. | n/a | |
| `musings` | journal-legacy | Personal Journal reflections or loose thought pieces. | Governed Second Brain or entity notes. | n/a | Kept always. |
| `planning` | journal-legacy | Journal planning notes or imported planning material. | Second Brain files where `type:` or folder structure explains the planning context. | n/a | Keep out of Second Brain structural imports. |
| `recipes` | journal-legacy | Personal recipe Journal notes. | Business or Second Brain content. | n/a | Kept always. |

## Review tags

These tags may remain for now. Alyssa wants to revisit their boundaries.

| tag | lane | use when | do not use when | anchor | replacement/notes |
|---|---|---|---|---|---|
| `voice` | review | Voice calibration, voice profile, or "does this sound like Alyssa?" material. | Generic copy output. | [[voice-and-writing-style]] | Must also carry `copy`; review with `writing-style` and `brand-words`. |
| `writing-style` | review | Writing pattern analysis, rhythm, sentence structure, or style mechanics. | Generic copy output. | [[writing-style]] | Must also carry `copy`; likely merge candidate with `voice`. |
| `seo` | review | SEO-specific goals, blog/search strategy, or search optimization notes. | Pinterest keyword work where `pinterest` or `traffic` is clearer. | [[blog-and-pin]] | Under review because current use is low. |

## Prohibited and retired tags

These tags are not valid for new use. If found, remove or replace according to the table.

| tag | lane | use when | do not use when | anchor | replacement/notes |
|---|---|---|---|---|---|
| `ai-reference` | retired | Never. | Always. | n/a | Replace with `ai`. |
| `analysis` | prohibited | Never as a Second Brain structural tag. | Always. | n/a | Use `type: analysis` or folder context. |
| `back-of-house` as structural tag | prohibited | Never just because a file lives in BOH Second Brain. | Always. | n/a | Use only for the offer/entity itself. |
| `boh` | retired | Never. | Always. | n/a | Replace with `back-of-house` only when the tag is substantively needed. |
| `carousels` | retired | Never. | Always. | n/a | Replace with `carousel`. |
| `content` | retired | Never. | Always. | n/a | Too broad; replace with `social`, `email`, `copy`, or a specific method tag. |
| `copywriting` | retired | Never. | Always. | n/a | Replace with `copy`. |
| `creator` | retired | Never as a tag. | Always. | n/a | Use CRM `role` field instead. |
| `framework` | prohibited | Never as a generic structure tag. | Always. | n/a | Use a specific method tag or `type: framework`. |
| `index` | prohibited | Never. | Always. | n/a | Use filename/folder structure. |
| `llm-guide` | retired | Never. | Always. | n/a | Usually replace with `ai` if needed. |
| `operations` | retired | Never. | Always. | n/a | Use role/body/project context. |
| `page` | retired | Never. | Always. | n/a | Too vague. |
| `program` | prohibited | Never. | Always. | n/a | Use `program:` frontmatter. |
| `sales-pages` | retired | Never. | Always. | n/a | Replace with `sales-page` only if the page type is truly a needed retrieval tag; otherwise use `type:`. |
| `second-brain` as structural tag | prohibited | Never for files inside `PKM/Second Brain/`. | Always. | n/a | Allowed only for notes about Second Brain work. |
| `slides` | prohibited | Never as a Second Brain structural tag. | Always. | n/a | Use `type: slides`. |
| `template` | prohibited | Never as a generic structure tag. | Always. | n/a | Use `type: template` or a specific product tag like `notion`. |
| `templates` | retired | Never. | Always. | n/a | Replace with `template` only if explicitly approved; otherwise remove. |
| `transcript` | prohibited | Never as a Second Brain structural tag. | Always. | n/a | Use `type: transcript`. |
| `webinars` | retired | Never. | Always. | n/a | Replace with `webinar`. |
| `work` | retired | Never. | Always. | n/a | Use `key_element: business` or body context. |
| `workbook` | prohibited | Never as a Second Brain structural tag. | Always. | n/a | Use `type: workbook`. |
| `wren` | retired | Never. | Always. | n/a | Use `author: wren` if needed. |

## Larry audit checklist

At session close or at least once per active day, Larry checks:

- Any tag in changed files that is missing from GL-004.
- Any prohibited structural tag in Second Brain content.
- Any journal-legacy tag outside Journal.
- Duplicate/plural/abbreviation variants.
- Tags used fewer than 3 times as consolidation candidates, not automatic deletes.
- Inline body hashtags that accidentally become Obsidian tags, such as `#life` in quotes.

Larry fixes clear structural drift and asks Alyssa before changing content meaning.

## Open review task

The boundary between `voice`, `writing-style`, `brand-words`, and `copy` is intentionally unresolved. See [[tsk-2026-06-04-002-review-copy-voice-brand-words-tags]].

## Updates to this Guideline

If the approved list needs to grow, update this file first or in the same change as the first tag use. Do not add tags outside this Guideline.
