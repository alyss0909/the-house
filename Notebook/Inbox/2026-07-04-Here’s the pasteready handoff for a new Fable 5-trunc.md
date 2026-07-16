---
GoogleKeepCreatedDate: 2026-07-04T19:03:18.107000+00:00
GoogleKeepUpdatedDate: 2026-07-04T19:03:19.391000+00:00
GoogleKeepUrl: https://keep.google.com/#NOTE/1UAYgP4I9xYdKkiyoAMCxNTwxDAauh3LM26XUJmmIfRKMPfix9UIpQ7o9i29kQWU-1zI9
KeepSidianLastSyncedDate: 2026-07-16T21:50:12.893Z
---
Here’s the paste-ready handoff for a new Fable 5 chat.

Build Brief: Alyssa Content Relay

Build a local app called Alyssa Content Relay.

This is a personal content production app that runs on my computer every week without needing Fable 5 again after the build. Fable 5’s job is to help architect and code the app this weekend. After that, the app should run locally using my source files, my Obsidian second brain, my Notion-exported content strategy data, local retrieval, and a local model.

The goal is to make a repeatable content assembly line that can take one idea, email, note, transcript, or course/module concept and turn it into a small batch of strategic content assets inside my existing rails.

Core principle

The app must not invent my strategy.

It must load my real source truth first:

- 4 monthly content themes
- weekly breakdowns
- 3 post types per week
- exact CTA keywords from Notion
- exact freebies/products/offers from Notion
- BOH modules and teaching concepts
- best-performing posts/emails
- approved examples
- rejected examples
- my voice rules
- my banned patterns
- my Obsidian notes and second brain

The app’s job is to match, retrieve, deepen, structure, draft, score, and export.

What the app produces

From one idea, the app should be able to create:

1. Edu post
   
   - teaches one small nuanced thing
   - usually drawn from a BOH module or method
   - creates authority through usefulness

2. Offer post
   
   - creates desire for the relevant freebie, product, or Back of House
   - uses the real CTA/keyword from the source map
   - creates a gap without making the reader feel broken

3. For-the-girls post
   
   - relatable, voice-y, pattern-recognition content
   - emotionally precise but still strategic
   - makes experienced business owners feel found

Optional later outputs:

- email version
- email-to-carousel version
- Pinterest/blog brief
- caption-only post
- webinar section
- sales page section

For the MVP, build:

One idea or email → 3 post concepts → 3 finished posts → caption + first comment + real CTA keyword → export file.

What this app is not

Do not build design features.

Do not build Canva generation.

Do not build scheduling.

Do not make up CTAs.

Do not make up freebies.

Do not make up offer language.

Do not make up monthly themes.

Do not chase trends in MVP.

Do not make this a generic AI content generator.

Preferred local app structure

Use the simplest reliable weekend build.

Recommended architecture:

- Local Python app
- Streamlit or simple local web UI
- SQLite for structured source truth and run history
- Local Markdown/CSV/YAML source files
- Local Obsidian vault indexing
- Local LLM connection through Ollama or LM Studio
- Optional local embeddings for retrieval
- Fallback keyword search if embeddings are not ready
- Export to Markdown, CSV, or Notion-ready format

Do not require Notion API in the MVP. Use exported CSV/Markdown/YAML files first. Add Notion API later.

Folder structure

Create a repo like this:

alyssa-content-relay/
  README.md
  app.py

  config/
    app_config.yaml
    model_config.yaml

  source_truth/
    monthly_themes.csv
    weekly_post_slots.csv
    cta_map.csv
    offers.yaml
    boh_modules.yaml
    voice_rules.md
    banned_patterns.md
    annoyance_rubric.md
    mindblown_gate.md
    content_goals.md

  source_truth/examples/
    best_performing_posts/
    best_performing_emails/
    approved_examples/
    rejected_examples/
    gold_standard_edu_post.md
    gold_standard_offer_post.md
    gold_standard_for_the_girls_post.md
    gold_standard_email_to_carousel.md

  obsidian/
    vault_config.yaml
    index_cache/
    note_cards/

  skills/
    source_truth_loader.md
    idea_intake.md
    theme_router.md
    obsidian_context_loader.md
    best_performer_miner.md
    boh_module_matcher.md
    concept_bakeoff.md
    edu_post_concept.md
    offer_post_concept.md
    for_the_girls_concept.md
    persuasion_arc_builder.md
    hook_sommelier.md
    tiny_teaching_extractor.md
    gap_builder.md
    cta_matcher.md
    carousel_copy_builder.md
    caption_builder.md
    first_comment_builder.md
    annoyance_detector.md
    mindblown_quality_gate.md
    source_truth_checker.md
    export_formatter.md

  src/
    loaders/
      load_source_truth.py
      load_obsidian.py
      load_examples.py

    retrieval/
      build_obsidian_index.py
      search_obsidian.py
      search_examples.py

    workflow/
      run_content_relay.py
      route_theme.py
      match_boh_module.py
      generate_concepts.py
      score_concepts.py
      draft_posts.py
      final_qa.py
      export_batch.py

    models/
      local_llm.py
      prompt_runner.py

    schemas/
      content_input.py
      content_batch.py
      concept.py
      post_output.py
      qa_score.py

  outputs/
    weekly_batches/
    drafts/
    logs/

  tests/
    test_source_truth.py
    test_cta_lookup.py
    test_theme_router.py
    test_annoyance_detector.py
    test_export_format.py

Source truth schemas

"monthly_themes.csv"

Fields:

month
monthly_theme
theme_description
strategic_goal
primary_offer_focus
notes

"weekly_post_slots.csv"

Fields:

month
week_number
week_theme
post_slot_1_type
post_slot_1_goal
post_slot_2_type
post_slot_2_goal
post_slot_3_type
post_slot_3_goal
required_offer_focus
notes

The app should not invent weekly post types. It should read these fields and generate within those slots.

"cta_map.csv"

Fields:

cta_name
exact_keyword
cta_type
freebie_product_or_offer
url_or_flow_name
use_when
avoid_when
related_theme
related_boh_module
cta_intensity
notes

The app must only use CTAs from this file.

If no good CTA match exists, it should say:

No confident CTA match found. Needs manual selection.

It should never invent a keyword.

"offers.yaml"

Include:

back_of_house:
  name:
  positioning:
  promise:
  audience:
  default_cta:
  use_when:
  avoid_when:
  key_beliefs:
  proof_points:
  language_to_use:
  language_to_avoid:

one_good_thought:
  name:
  positioning:
  promise:
  audience:
  default_cta:
  key_beliefs:
  use_when:
  avoid_when:

five_minute_newsletter:
  name:
  positioning:
  promise:
  audience:
  default_cta:
  use_when:
  avoid_when:

"boh_modules.yaml"

Each BOH module should have:

- phase:
  module_name:
  module_summary:
  core_belief:
  public_teaching_slices:
    - one small thing this module can teach in public
  paid_gap:
    what the free content should make them realize they need
  related_ctas:
  related_monthly_themes:
  phrases_to_use:
  phrases_to_avoid:

This matters because public content should teach one small slice of Back of House, not the whole course.

"voice_rules.md"

Must include my voice preferences:

- nuanced, cozy, strategic, not basic
- experienced entrepreneurs have heard normal marketing advice already
- write like a smart voice note with taste and teeth
- dry humor is good
- specificity over slogans
- long sentences are allowed when they carry thought
- metaphors are welcome only when they do strategic work
- no em dashes
- no “it’s not this, it’s that” setup
- no generic productivity advice
- no beginner-coded explanations
- no “your business is broken” framing
- no “ditch the hustle”
- no fake rebellion
- no overexplained obvious points
- no generic AI-marketing cadence
- no made-up examples unless clearly marked as placeholders

"annoyance_rubric.md"

The app should score concepts and drafts against the exact kinds of feedback I usually give when I dislike outputs.

Common rejection patterns:

- too obvious
- too basic
- too simplified
- too generic
- too “content girlie”
- too beginner-coded
- too much metaphor with no mechanism
- too polished but no pulse
- too cute
- not persuasive enough
- lost the original point
- examples are bad
- CTA is made up
- theme or post type is invented
- doesn’t use my existing source truth
- doesn’t respect experienced business owners
- assumes the business is broken
- doesn’t connect to Back of House naturally
- teaches too much
- teaches nothing
- weak hook
- no clear gap
- no useful next action
- sounds like a template
- would make me say “mmm no”

Each concept and draft should get a score from 1 to 10.

Anything under 8 should be revised or flagged.

"mindblown_gate.md"

A great output should meet these standards:

- the idea is clear
- the angle is sharper than the common take
- it uses my source truth
- it feels specific to my business
- it respects an experienced audience
- it teaches one useful thing
- it creates a real gap toward an existing CTA
- it sounds like me
- it has one line worth saving
- it does not flatten the original thought
- it does not invent strategy
- it makes Back of House feel more desirable or more obvious
- it feels like public proof of my private method

Content goal

The goal of my content is:

To turn my best thinking into repeatable belief shifts that make experienced service providers and creatives trust Back of House as the obvious next layer of support.

More specifically, my content should:

1. Make the right people feel found.
2. Name the pattern they are living inside.
3. Teach one small useful thing.
4. Create a gap between what they are doing now and the system they actually need.
5. Move them toward the correct existing CTA, freebie, product, or offer.
6. Build the world of Back of House: email-first, archive-first, systems as relief, slow marketing, Pinterest as discovery, and the idea that their best thinking should become assets instead of expiring in the feed.

Relay architecture

Do not make every post type its own autonomous agent.

Use this structure:

- stages are agents/workflow steps
- post types are skills/templates
- source truth is lookup data
- CTAs are lookup data
- Obsidian is retrieval
- final QA is evaluator logic

Assembly line

The app should run in this order:

1. Load source truth
2. Intake idea/email/note
3. Match to monthly theme + weekly post slots
4. Search Obsidian + best performers
5. Match to BOH module
6. Generate concepts for each required post type
7. Run annoyance detector
8. Select or revise best concepts
9. Build persuasion arc
10. Generate hooks
11. Extract tiny teaching
12. Build gap
13. Match real CTA
14. Draft posts
15. Run source truth check
16. Run voice check
17. Run mind-blown gate
18. Export batch

Parallel generation

After the source truth, theme match, Obsidian search, and BOH module match are complete, the app can run post-type concepting in parallel.

For one idea, generate:

- Edu concept
- Offer concept
- For-the-girls concept

Later optional:

- email version
- Pinterest/blog angle
- productivity/systems angle

Then score all concepts together and choose the strongest set.

Detailed workflow

1. Source Truth Loader

Skill/tool:

source_truth_loader

Loads:

- monthly themes
- weekly post slots
- CTA map
- offer map
- BOH module index
- voice rules
- banned patterns
- annoyance rubric
- mind-blown gate
- best performers
- approved/rejected examples

Output:

{
  "current_month_theme": "...",
  "current_week": "...",
  "required_post_slots": [],
  "available_ctas": [],
  "offer_map": {},
  "boh_modules": [],
  "voice_rules_summary": "...",
  "annoyance_rubric_summary": "..."
}

2. Idea Intake

Skill:

idea_intake

Input can be:

- raw idea
- email
- transcript
- Obsidian note
- course/module concept
- existing post

Output:

{
  "core_idea": "",
  "strongest_original_phrases": [],
  "emotional_charge": "",
  "likely_themes": [],
  "likely_offer_fit": [],
  "what_is_fuzzy": [],
  "do_not_lose": ""
}

3. Theme Router

Skill/tool:

theme_router

Matches the input to the existing monthly theme and weekly post slots.

It should not invent themes.

Output:

{
  "matched_monthly_theme": "",
  "matched_week": "",
  "matched_post_slots": [
    {
      "slot": 1,
      "post_type": "",
      "goal": ""
    }
  ],
  "confidence": 0.0,
  "manual_review_needed": false
}

4. Obsidian Context Loader

Skill/tool:

obsidian_context_loader

Searches local Obsidian vault and returns only compact context cards.

Each note should be preprocessed into a card:

{
  "note_id": "",
  "title": "",
  "source_path": "",
  "summary": "",
  "strong_phrases": [],
  "related_offers": [],
  "related_themes": [],
  "tags": [],
  "relevance_reason": ""
}

Do not pass the full vault into the model.

Use top 3 to 8 relevant cards.

5. Best Performer Miner

Skill:

best_performer_miner

Finds related past posts/emails that performed well.

It should extract:

- hook pattern
- angle pattern
- content type
- CTA pattern
- why it likely worked
- reusable phrases
- structure to imitate

6. BOH Module Matcher

Skill:

boh_module_matcher

Matches the idea to the best BOH module or offer concept.

Output:

{
  "matched_module": "",
  "phase": "",
  "why_it_matches": "",
  "public_teaching_slice": "",
  "paid_gap": "",
  "what_not_to_teach": "",
  "related_ctas": []
}

This is a major feature. The app should use my actual Back of House curriculum to teach one small public thing.

7. Concept Bake-Off

Skill:

concept_bakeoff

For each required weekly post slot, create a concept.

For MVP, generate:

{
  "edu_post": {},
  "offer_post": {},
  "for_the_girls_post": {}
}

Each concept should include:

{
  "post_type": "",
  "angle": "",
  "hook_direction": "",
  "teaching_point": "",
  "persuasion_goal": "",
  "boh_module_source": "",
  "gap_created": "",
  "matched_cta_options": [],
  "why_this_fits_the_week": "",
  "risk_flags": []
}

Concepts should be generated before full drafting.

8. Annoyance Detector

Skill/evaluator:

annoyance_detector

Scores each concept before drafting.

Return:

{
  "score": 0,
  "red_flags": [],
  "why_alyssa_might_reject_this": "",
  "what_to_fix": "",
  "revise_or_kill": "revise|kill|approve"
}

Do not draft concepts that fail this step.

9. Concept Ranker

Skill:

concept_ranker

Selects the best concepts and explains why.

Criteria:

- fits real theme
- fits real post slot
- uses real BOH module
- has strong angle
- is not basic
- respects experienced audience
- can create a gap
- can use a real CTA
- has hook potential
- preserves the original spark

10. Persuasion Arc Builder

Skill:

persuasion_arc_builder

Use copywriting frameworks as tools, not cages.

Possible frameworks:

- AIDA
- PAS
- Schwartz awareness
- market sophistication
- belief-shift arc
- teaching arc
- offer-gap arc

Choose the arc based on post type.

For edu posts:

hook → context → tiny teaching → example or mechanism → reframe → CTA

For offer posts:

desire → hidden cost → mechanism → paid gap → CTA

For for-the-girls posts:

relatable moment → pattern recognition → sharper meaning → soft bridge → CTA or save/share

11. Hook Sommelier

Skill:

hook_sommelier

Generate hooks by family:

- pattern observation
- experienced-reader mirror
- soft contrarian
- archive doorway
- mechanism tease
- cozy gut punch
- business model reframe
- tiny rebellion

Score each hook for:

- specificity
- curiosity
- voice match
- non-basicness
- audience sophistication
- fit with post type
- fit with CTA

Choose the best hook.

12. Tiny Teaching Extractor

Skill:

tiny_teaching_extractor

Takes the matched BOH module and extracts one small public teaching.

Rules:

- teach one useful thing
- do not teach the whole module
- do not overwhelm
- do not turn into a generic tip list
- create a clear gap toward the paid method

13. Gap Builder

Skill:

gap_builder

Creates the desire gap.

A good gap makes the reader think:

I understand the problem more clearly now, and I can see why I need the system.

A bad gap makes the reader feel:

I am being manipulated or told my business is broken.

Avoid the bad gap.

14. CTA Matcher

Skill/tool:

cta_matcher

This is lookup-only.

It reads "cta_map.csv" and chooses the best existing CTA.

It returns:

{
  "selected_cta_name": "",
  "exact_keyword": "",
  "freebie_product_or_offer": "",
  "reason": "",
  "confidence": 0.0,
  "manual_review_needed": false
}

If confidence is low, do not invent.

15. Draft Builder

Skills:

carousel_copy_builder
caption_builder
first_comment_builder

For each post, output:

{
  "post_type": "",
  "theme": "",
  "week": "",
  "concept": "",
  "hook": "",
  "carousel_slides": [
    {
      "slide_number": 1,
      "slide_role": "",
      "copy": ""
    }
  ],
  "caption": "",
  "first_comment": "",
  "cta_keyword": "",
  "cta_name": "",
  "boh_module_source": "",
  "designer_note": "",
  "status": "ready_for_review"
}

Carousel slide roles should be explicit:

slide 1: hook
slide 2: context
slides 3 to 7: teaching, mechanism, example, or pattern
slide 8 or 9: reframe
final slide: CTA or save/share bridge

The app does not design the carousel. It only writes the slide copy and handoff notes.

16. Source Truth Checker

Skill/evaluator:

source_truth_checker

Checks:

- CTA is from source map
- keyword is real
- theme is real
- post slot is real
- BOH module is real
- offer language is not invented
- source references are included

If it fails, flag and revise.

17. Voice Keeper

Skill:

voice_keeper

Checks:

- no em dashes
- no “it’s not this, it’s that”
- no generic AI cadence
- no fake rebellion
- no beginner-coded advice
- no “your business is broken”
- no overexplaining obvious marketing basics
- no useless cozy filler
- no invented examples
- keep specificity
- keep dry humor where appropriate
- keep the original strong phrase if it carries the thought

18. Mind-Blown Quality Gate

Skill/evaluator:

mindblown_quality_gate

Final score from 1 to 10.

Pass threshold: 8.5 or higher.

Score categories:

{
  "source_truth": 0,
  "theme_fit": 0,
  "post_type_fit": 0,
  "hook_strength": 0,
  "depth": 0,
  "usefulness": 0,
  "persuasion": 0,
  "voice_match": 0,
  "cta_fit": 0,
  "boh_alignment": 0,
  "overall": 0,
  "what_still_needs_work": []
}

19. Export Formatter

Skill/tool:

export_formatter

Exports the batch as:

- Markdown
- CSV
- Notion-ready table format
- optional JSON

Each post should include:

Title / internal label
Monthly theme
Week
Post type
BOH module
CTA keyword
Freebie/product/offer
Concept
Hook
Slide copy
Caption
First comment
Designer note
QA score
Status

Token minimization strategy

This app needs to run with very few tokens.

Do this by creating a compact source-knowledge layer.

Do not pass full files every time.

Instead:

1. Preprocess every source into compact cards.
2. Store source truth in structured CSV/YAML.
3. Use retrieval to pull only relevant cards.
4. Cache summaries.
5. Use deterministic lookup for CTAs, themes, weekly slots, and BOH modules.
6. Pass only the top relevant context into the model.
7. Use JSON outputs between steps.
8. Use short skill prompts with strict schemas.
9. Use examples only when relevant.
10. Reuse approved examples as pattern references, not giant context dumps.

Obsidian note card format

Each Obsidian note becomes:

{
  "note_id": "",
  "title": "",
  "path": "",
  "summary": "",
  "strong_phrases": [],
  "themes": [],
  "offers": [],
  "content_uses": [],
  "related_boh_modules": [],
  "status": "raw|promising|approved|archived"
}

Best performer card format

Each best-performing post/email becomes:

{
  "asset_id": "",
  "asset_type": "",
  "topic": "",
  "hook": "",
  "structure": "",
  "cta": "",
  "why_it_worked": "",
  "reusable_pattern": "",
  "phrases_to_reuse": [],
  "performance_notes": ""
}

Gold standard examples

I should provide one gold standard example for each:

- edu post
- offer post
- for-the-girls post
- email-to-carousel
- caption + first comment
- ManyChat CTA post
- Soft Sunday email
- launch email
- Pinterest/blog brief

The app should use these as quality references.

MVP screen flow

Build a local UI with these screens:

Screen 1: Source Status

Show:

- monthly themes loaded
- weekly post slots loaded
- CTA map loaded
- offers loaded
- BOH modules loaded
- Obsidian index status
- best performer examples loaded
- approved examples loaded
- rejected examples loaded

Screen 2: