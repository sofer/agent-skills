---
name: workshop-design
description: Use when creating, redesigning, or preparing any workshop-like learning experience. Builds four artefacts in sequence — discussion.md, questions.md, narrative.md, slides.md — before public copy, visuals, module, and delivery artefacts.
---

# Workshop design

Use this as the upstream orchestrator for workshop-like learning experiences:
open workshops, cohort workshops, employer sessions, internal sessions, and
platform modules built around active learner participation.

The core rule is: one workshop story, many artefacts. The first three artefacts
come from the `narrative` skill and must exist before anything else is built.

## Workflow

The four upstream artefacts, in order:

1. **Grilling and discussion** (`discussion.md`)
   Use the `narrative` skill. Work through the topic conversationally, surfacing
   what the user finds hard, where understanding breaks down, key ambiguities,
   and the concepts most important to a learner. Produces `discussion.md`: a
   concise record of the session that contains enough information to derive the
   questions.

2. **Questions** (`questions.md`)
   Still within the `narrative` skill. From `discussion.md`, produce a series of
   atomic Q&A pairs, one per important concept. Each entry: a question that
   probes the concept precisely, and a concise correct answer optimised for
   recall. These questions anchor the narrative and every downstream artefact.

3. **Narrative** (`narrative.md`)
   Still within the `narrative` skill. Turn the questions into a story arc.
   `narrative.md` contains two sections: the **core** (numbered beats, whiteboard
   exercises) and the **extension** (E-numbered beats covering the remaining
   questions pool). `slides.md` draws from the core only. `module.md` covers
   everything: the full core and then the extension. Read `narrative.md` before
   building anything downstream — it is the source of truth for framing,
   vocabulary, beat order, and the core/extension split.

4. **Slides** (`slides.md`)
   Evolve the narrative into a slide beat plan:
   After the earlier story artefacts are in place, use this order of play for
   the live workshop deck:

   1. Complete and freeze the slide beats.
   2. Complete captions for the not-yet-created figures.
   3. Complete provisional questions for each slide where a question is useful.
      Put the question between the figure caption and the beat, and put a short
      model answer beneath the beat. The first slide rarely needs a question.
      Opening, historical-anchor, and transition slides may not need questions.
   4. Do a first pass of the figures, based on the beats, captions, and
      provisional questions.
   5. Create a Slidev test deck with the titles, figures, captions, and
      questions in place, and the beats as speaker notes.
   6. Iterate on the figures and text until done.

   Treat the slide beats as the source for the figures and the deck. The figures
   should come from the beat, caption, and provisional question, not from
   isolated visual ideas. Questions come before figures so the figure has a
   learner action to support, but questions are allowed to change when the
   figure choice reveals a sharper prompt. Use the test deck as a rehearsal
   artefact before treating the final slide deck or module prose as settled.

   Prefer questions that anticipate the next reveal over questions answered by
   the current slide title or caption. If a slide does not have a useful
   question, ask whether the previous slide can pose the question that this
   slide answers. Keep questions sparse: three or four strong discussion prompts
   are better than a question on every slide. Remove questions whose answer is
   already visible in the slide title, caption, or figure.

   When a question introduces the next concept, let the model answer describe
   what is happening before naming the formal term. The next slide can then
   attach the terminology. Prefer open prompts over multiple-choice prompts
   unless the choices are genuinely part of the reasoning task.

   Save slide beats, figure captions, and slide questions in
   `curriculum/<topic>/slides.md` until they are compiled into the Slidev
   deck. Use one section per slide beat, and keep the beat text available as the
   future speaker note.

5. **Website** (`website.md`)
   Write the public workshop description. Derive the framing from `narrative.md`,
   not from scratch. Include the hook, what learners will do, and practical
   details.

6. **LinkedIn** (`linkedin.md`)
   Write the LinkedIn post for the workshop. One post per variant or run. Derive
   voice and hook from the narrative through-line. Use `linkedin-workshop-posts`
   skill when ready to produce.

7. **Module build spine**
   When the workshop has a learner-facing module, design or revise the module
   build spine after the live story and test deck shape are settled. Treat this
   as the learner's eventual practice path: what learners will build, inspect,
   answer, practise, verify, and take away.

   The module should expose the full route through the material. For code-based
   workshops, decide what learners will run, inspect, modify, and verify, and
   validate runnable snippets before treating downstream artefacts as final.

8. **Teaching plan** *(evolving — use when it helps coordination)*
   When a coordination record is useful, create or update `teaching-plan.md`
   after the story-led slide path has started. It should reflect the settled
   story beats, captions, questions, figures, deck structure, module expansion
   notes, and open decisions. It must not override the beat-first order of play.

   Use it to record the conceptual sequence:
   - story arc
   - learner build path
   - learning steps
   - key word or phrase for each learning step
   - what each concept is and why it matters
   - likely visual cue for each concept, without designing the final figure
   - audience question-answer pair for each concept where a question is useful
   - level check for each question, based on what learners have already seen
   - module expansion notes for details the slides simplify
   - whiteboard questions and reconstruction tasks
   - module transition sequence, when a learner-facing module follows the live
     workshop
   - whether the slide deck should be one continuous sequence or split into
     parts
   - open decisions

   The teaching plan is allowed to change while slides are being drafted. When
   the slide sequence reveals a better narrative or visual progression, update
   `teaching-plan.md` so the module and visuals inherit the settled shape rather
   than accidental slide-draft drift.

   Opening slides usually do not need audience questions. For later learning
   steps, include a question only when it helps learners predict, distinguish,
   reconstruct, or check understanding. Always include the expected answer
   beside the question. Use the answer to check whether the question is fair:
   learners should be able to answer from the concepts, visuals, and vocabulary
   already introduced, not from material that appears later. Module-transition
   slides usually do not need prompts; their job is to orient learners to what
   the module contains and how it follows the live workshop.

   Use this compact structure by default:

   ```markdown
   # Teaching plan

   ## Story arc

   ## Learner build path

   ## Learning-step spine

   For each step:
   - Learning step
   - Key phrase
   - Visual cue
   - What is this?
   - Why does it matter?
   - Question
   - Expected answer
   - Level check

   ## Slide deck structure decision

   ## Module transition

   ## Whiteboard questions

   ## Module expansion notes

   ## Open decisions
   ```

9. **Teaching spine** *(evolving — use when it helps delivery)*
   Turn the narrative, module spine, and teaching plan into the live-learning
   sequence:
   - opening problem or historical frame
   - mechanism made visible
   - learner questions or predictions
   - limitation or failure case
   - path to later developments
   - whiteboard reconstruction or discussion
   - build transition or applied activity

   For live workshops, the slide deck and whiteboarding can become the primary
   conceptual source of truth. The module may function as follow-up practice or
   homework that reinforces, expands, and makes executable what the live session
   established. When that happens, revise module prose after the slide spine
   settles instead of assuming the early module draft controls the slides.

   Check terminology both ways. Prefer recognised domain language over
   simplified invented terms unless the simplified term is explicitly introduced
   as a bridge. If the module uses a more standard term than the slides, update
   the slides rather than dumbing the module down.

   After the learning-step spine is known, decide explicitly whether the slide
   deck should be one continuous sequence or split into two or more parts. Split
   when the workshop changes mode, for example from problem framing to mechanism,
   from forward path to backward path, or from live reconstruction to module
   transition. Record the decision in `teaching-plan.md`.

10. **Visual inventory**
   After the module spine and draft slide plan exist, identify shared visual
   needs before creating assets. Use rough schematics, ASCII, Mermaid, or written
   visual notes in the slide plan first. Then create a compact inventory that
   records:
   - figure name
   - teaching job
   - slide placement
   - module placement
   - format, such as SVG, screenshot, or animation

   When a beat is anchored on a notable paper, a figure may be an image of the
   paper itself rather than a schematic diagram. Use the paper image when the
   historical artefact is the memory cue; use a diagram when the mechanism or
   learner action is the memory cue.

   Pay close attention to figure descriptions while the slide sequence is being
   built. Figure placeholders are part of the teaching design, not production
   notes. Check that each figure description matches the slide's current
   teaching point and does not smuggle in concepts that are introduced later.

   Assume the same canonical visuals will be used in both slides and module
   unless there is a clear reason to do otherwise. The slide deck introduces the
   module, and the module expands the same content, so repeated visuals are a
   feature of the learning design.

   One common slide-specific difference is reveal state. A slide may show a
   partial version of the canonical visual first, such as data points without a
   decision boundary, so learners can discuss or predict before the answer is
   revealed. Treat that as the same visual in the inventory, with slide reveal
   states and a final module version.

   When several adjacent slides or module steps build up one concept, define a
   visual reveal sequence from a shared base visual rather than isolated figures.
   For each step, record:
   - the base visual
   - the focus region
   - the one new detail introduced
   - the details deliberately withheld until later
   - whether the module needs a fuller final version

   Produce durable figures after the inventory is agreed, using `module-visuals`
   one asset at a time. When multiple SVGs, diagrams, or animations are needed,
   create a standalone `visual-prompts.md` or equivalent prompt file first.
   The prompt file should include topic context, design-system references,
   layout, labels, teaching goal, variants, and avoid lists without referring
   back to specific slides, lessons, or module prose. Insert finished figures
   into slides directly. For platform modules where image upload is manual, add
   clear upload instructions at the relevant point rather than pretending the
   markdown embeds the final platform image.

11. **Module expansion notes**
   When useful content is removed from slides for space, pace, or simplicity,
   record the module implication in `teaching-plan.md`. Include:
   - concept or detail simplified or removed from slides
   - why it still matters for the learner path
   - whether it should appear in module prose, code commentary, questions,
     visuals, further reading, or not at all
   - any terminology decision, especially where recognised domain language
     differs from a teaching bridge

   Use a separate temporary carryover file only when a messy redesign needs
   triage. Do not make that the default workflow.

12. **Artefact plan**
   Choose only the outputs needed for the workshop. Common handoffs:
   - `linkedin-workshop-posts` for public LinkedIn posts
   - `fac-workshop-slides` for FAC slide decks and whiteboard targets
   - `curriculum-module` for platform-ready learner-facing module content
   - `module-review` for learner-facing modules before import or delivery,
     including code verification when the module contains runnable code
   - `module-visuals` for diagrams, animations, and whiteboard visuals

13. **Verification**
   Before treating a learner-facing module as ready for platform import or
   delivery, run `module-review`. Check continuity, completeness, relevance,
   platform fit, questions, and setup. When the module contains runnable code,
   include code verification: learner commands, snippets, expected outputs,
   stochastic behaviour, and final behaviour.

14. **Handoff**
   Pass the same story brief and teaching spine to every downstream skill. Do
   not let each artefact invent its own framing.

## Rules

- The four upstream artefacts (discussion.md, questions.md, narrative.md,
  slides.md) must exist before any public copy, visuals, or module is built.
- Read `narrative.md` before building anything downstream. It is the source of
  truth for framing, vocabulary, and beat order.
- Prefer one coherent story over several interesting side stories.
- Use failure cases and limitations as bridges to the next concept.
- Default artefact order: discussion.md, questions.md, narrative.md, slides.md,
  website.md, linkedin.md, visual artefacts, Slidev deck, module, verification.
- Learner-facing modules must be reviewed with `module-review` before they are
  treated as ready for platform import or delivery.
- Preserve vocabulary and framing across website copy, LinkedIn posts, slides,
  module content, and visuals. Derive all of these from the narrative, not
  independently.
- When the requested work starts from an existing narrative.md, skip grilling
  and questions and proceed directly from the spine.

## File layout

For concrete workshops in `/Users/dsofer/code/brain`, topics live under
`curriculum/` with a short, human-readable folder name:

```text
curriculum/perceptrons/
curriculum/backpropagation/
curriculum/agent-harness/
```

Keep the topic's source-of-truth artefacts together in that folder, in
production order:

```text
curriculum/<topic>/
  discussion.md
  questions.md
  narrative.md
  slides.md
  website.md
  linkedin.md
  module.md
  teaching-plan.md
  delivery.md
  assets/
```

Use these roles:

- `discussion.md`: record of the grilling session — what the user found hard,
  ambiguities, corrections, and the concepts most important to understanding.
  Produced by the `narrative` skill. Must contain enough to derive questions.md.
- `questions.md`: atomic Q&A pairs drawn from discussion.md, one per important
  concept, optimised for recall. Produced by the `narrative` skill.
- `narrative.md`: the spine — through-line, arc, core beats with cues and
  anchors, whiteboard exercises (with home beats), and an extension section of
  E-numbered beats. Produced by the `narrative` skill. Source of truth for all
  downstream artefacts. `slides.md` draws from core only; `module.md` covers
  core and extension.
- `slides.md`: canonical slide-story source. Slide beats, figure captions, and
  slide questions. One section per beat. The beat becomes the speaker note in
  the Slidev deck.
- `website.md`: website workshop description and practical details.
- `linkedin.md`: LinkedIn post drafts, variants, and posting notes.
- `module.md`: complete learner journey or platform-content design.
- `teaching-plan.md`: coordination record (evolving) — concept sequence,
  visual cues, module expansion notes, open decisions.
- `delivery.md`: facilitator notes, timing, setup, risks, and rehearsal notes.
- `assets/`: workshop-specific source assets, diagrams, images, screenshots,
  animation scripts, thumbnails, and generated media.

Keep shared slide infrastructure and generated delivery files in `slides/`:

```text
slides/style.css
slides/deck-matter/
slides/assets/
slides/<short-name>.slides.md
slides/exports/<short-name>.pdf
slides/exports/<short-name>.pptx
```

For Slidev decks, keep workshop sources and deck-served files distinct:

```text
workshops/<short-name>/assets/   # editable source assets
slides/assets/<short-name>/      # real files served by the Slidev deck
```

Use `./assets/<short-name>/...` inside the Slidev deck. If an editable source
asset is also used by the deck, copy the deck-consumable file into
`slides/assets/<short-name>/` rather than relying on a symlink or parent-folder
reference. Keep only genuinely shared deck assets directly under
`slides/assets/`, such as FAC branding, paper fronts reused across decks, QR
codes, and standard closing images.

Rule of thumb: source thinking lives in `workshops/<short-name>/`; shared
rendering systems and generated slide exports live in `slides/`; cross-workshop
operations such as the rolling LinkedIn calendar may stay in `attention/` while
the canonical copy for an individual workshop lives with that workshop.
