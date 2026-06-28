---
name: fac-workshop-slides
description: Use when creating, revising, outlining, or reviewing FAC workshop slide decks. Renders FAC-style live-teaching decks from an upstream narrative spine: sparse visible text, speaker notes, end-grouped whiteboard prompts, canonical markdown, and Reveal.js HTML delivery only after design sign-off.
---

# FAC workshop slides

Use this skill for slide-deck work in the current repo: creating, revising,
reviewing, outlining, or producing decks.

The deck is for live teaching. It should expose the core structure, give the
workshop leader room to explain, and draw learners into questions,
reconstruction, and discussion.

## Routing

In this repo, default to this skill for any slide-deck request. Use another
presentation skill only when the user explicitly asks for a different artefact
or workflow.

This skill is downstream rendering, not conceptual design. The story, arc, and
framing are built upstream in [[narrative]] (the recall-first spine the user
rehearses and can deliver from memory, in the Feynman sense) and developed by
[[workshop-design]]. Do not reinvent the arc or re-derive the framing here.

## Where this skill starts

Begin from the upstream artefacts; do not regenerate them.

- If a `narrative.md` spine exists, it is the source. The spine maps almost
  mechanically onto slides: beat title becomes the slide title, fact becomes the
  speaker note, cue becomes the reveal question, anchor becomes the caption or
  paper front.
- If `workshop-design` has run, also start from the workshop story brief,
  teaching plan, teaching spine, frozen slide beats, visual inventory, audience,
  learner promise, active learner build, minimum vocabulary, constraints,
  inspected source artefacts, and open decisions.
- If no spine exists and the user wants to teach something, stop and build it
  with [[narrative]] first. That construction is where the user's own
  understanding is upgraded, so it must not be shortcut with a framing step here.
- If a deck or talk already exists, derive the spine with [[narrative]] reverse
  mode (which also critiques the source), then render here.
- Only a purely mechanical render (template preview, format conversion, or
  someone else's already-settled content) needs no spine and no framing.

## Reference points

Look for existing decks in `slides/` as examples of the expected HTML structure
and CSS class conventions. Look for `slides/style.css` as the style reference.
For a user-provided template or target deck, inspect that artefact and adapt the
layout rules to it.

## FAC visual system

Follow the FAC teaching-slide grammar:

- white background
- FAC mark in the top-right
- bottom hatch/footer image
- high-contrast black text
- Montserrat/Arial-style typography
- strong, simple slide titles
- sparse visible text
- simple teaching visuals
- bordered screenshots, paper fronts, diagrams, and media where useful
- minimal template structure

Bundled FAC chrome:

- `assets/template-hatch.png`
- `assets/template-logo.png`

Workshop-specific assets:

- Keep source assets in `workshops/<short-name>/assets/`.
- Put the assets used by a deck in `slides/assets/<short-name>/` as real files,
  not symlinks.
- When an asset is both a source artefact and used by a deck, keep the editable
  source in `workshops/<short-name>/assets/` and copy the deck-consumable file
  into `slides/assets/<short-name>/`.
- Reference deck assets as `./assets/<short-name>/...` from the HTML file.
- Do not create topic-specific sibling folders such as
  `workshops/<topic>-assets/` once a canonical `workshops/<short-name>/`
  folder exists.
- Do not use symlinks as the default asset layout. Use a symlink only as a
  documented workaround when duplicating/copying files is genuinely worse.
- Keep genuinely shared assets in `slides/assets/`, for example FAC branding,
  paper fronts reused across decks, QR codes, and standard closing images.

The FAC chrome is applied via `style.css` pseudo-elements on the Reveal.js slide
container. The usual geometry:

```css
.reveal .slides section::before {
  content: "";
  position: absolute;
  top: 8px;
  right: 5px;
  z-index: 1;
  width: 73px;
  height: 73px;
  pointer-events: none;
  background: url("./assets/fac-brand/template-logo.png") center center / contain no-repeat;
}

.reveal .slides section::after {
  content: "";
  position: absolute;
  left: -1.14%;
  bottom: -9.94%;
  z-index: 0;
  width: 101.22%;
  height: 18.86%;
  pointer-events: none;
  background: url("./assets/fac-brand/template-hatch.png") left top / 100% 100% no-repeat;
}
```

Link `style.css` in the deck's `<head>`:

```html
<link rel="stylesheet" href="./style.css">
```

## Deck furniture

Distinguish between repeated visual chrome and repeated deck matter.

Visual chrome appears on every slide through the template: FAC mark, bottom
hatch/footer image, typography, and shared CSS.

Deck matter is made of actual slides that frame the session. Every FAC workshop
deck should include appropriate opening and closing slides unless the user
explicitly asks for a fragment or mini-deck.

This applies when creating a deck from scratch and when copying, renaming, or
migrating an existing deck. If an existing deck is used as the starting point,
check whether the standard deck matter is present and add it before calling the
new deck ready.

Default opening matter:

- one practical welcome slide at the very beginning: workshop/materials QR,
  Discord QR, Wi-Fi details, and start time. Recreate it from
  `slides/deck-matter/open-workshop-welcome.md`.

Default closing matter:

- exactly five standard slides for public/open workshops.
- The first closing slide should be a centred transition slide: `One more thing...`.
- The second closing slide should move learners into the next action, usually the
  platform module or workshop materials.
- Two slides should introduce the Machine Learning Apprenticeship: one programme
  summary and one eligibility slide.
- The final slide should handle the application/signup close, using the agreed
  FAC open-workshop pattern. Recreate the five-slide sequence
  from `slides/deck-matter/open-workshop-closing.md`.

Do not call this a header or footer. Treat it as deck-level opening and closing
matter. It should be planned alongside the teaching sequence and included in
the inline deck review.

These deck-matter files are reusable source partials, not generated output.
Copy their slides into the workshop deck and replace QR paths, labels, module
cards, start time, and signup targets for the specific workshop.

Deck-matter verification:

- exactly one welcome slide before the title/content sequence for public/open
  workshops
- exactly five standard closing slides for public/open workshops, unless the
  next-action slide has deliberately been moved earlier as the transition into
  practical work
- the `One more thing...` transition slide is present at the top of the closing
  sequence
- both Machine Learning Apprenticeship slides are present when the programme is
  relevant: programme summary and eligibility
- all QR, card, and logo assets referenced by those slides exist
- generated short-name decks have the same required deck matter as original
  decks

## Design principles

- Preserve the workshop story brief. Do not invent a separate historical frame,
  learner promise, or reason for the workshop.
- Use history as active teaching material when it carries the problem,
  breakthrough, limitation, or next development. Do not add passive historical
  background that does not create learner action.
- Use one concept, question, or visual move per slide. This is the same atomic
  constraint as one idea per beat in [[narrative]]; inherit it from the spine
  rather than re-deriving it.
- Keep visible text sparse: definitions, prompts, short contrasts, and labels.
- Put explanations, caveats, and answers in speaker notes.
- Make speaker notes memorable and professional: short, precise, and speakable.
- Write speaker notes as words the workshop leader could say to the audience,
  not as private production instructions to the speaker or agent. Avoid notes
  such as "keep this qualitative", "connect this back", or "do not derive this"
  unless they are delivery notes outside the slide deck.
- When a slide has a prompt, include the expected answer in the speaker note.
  Make it easy for the speaker to check correctness without doing fresh work
  live. A concise `Answer:` sentence is usually enough.
- Design for live teaching; keep detail in the module and speaker notes.
- Prefer live-teaching moves: define, compare, predict, classify, explain,
  reconstruct, and critique.
- Use fresh slide text aligned to this workshop.
- Keep terminology aligned with the module or teaching sequence.
- Check terminology both ways. If module prose or recognised domain usage has a
  better term than a simplified slide phrase, prefer the standard term and make
  the slide explanation clearer rather than inventing a new label.
- When a useful concept, caveat, graph, derivation, or terminology explanation
  is removed from slides for space or pacing, record the module implication in
  the workshop's `teaching-plan.md` module expansion notes so it can be
  considered for the learner-facing module. Use a separate carryover file only
  as temporary triage during a messy redesign.

## Whiteboard placement

Whiteboard exercises are always grouped at the end of a FAC slide deck,
immediately before the build transition or closing slide.

Use an early organising slide to preview the structure learners will reconstruct
later. That early slide creates anticipation for the final reconstruction.

Use mid-deck questions as comprehension or prediction checks. They may be reveal
questions. They are not whiteboard prompts.

If the user asks for separate mini-decks or separate teaching sessions, treat
each one as its own FAC slide deck. Each deck groups its whiteboard exercises at
the end.

## Gates

- Confirm the upstream spine and brief are in place (or route to [[narrative]])
  before drafting any slide artefact.
- Agree each teaching visual's job and storyboard before creating the asset.
- Get full inline deck sign-off before creating the delivery format.
- Group whiteboard exercises at the end.

## Workflow

Use this after the narrative spine and, where it exists, the `workshop-design`
brief, frozen beats, and visual inventory are settled. This skill renders that
settled story into a FAC deck; it does not design the story. For module intro
decks, the deck gives learners enough conceptual scaffolding to begin the module.

1. **Confirm the upstream artefacts**
   Check that a `narrative.md` spine exists, plus the brief, frozen beats, and
   visual inventory when `workshop-design` has run. If they are missing, route to
   [[narrative]] (forward to build the spine, reverse to derive it from an
   existing deck) rather than reconstructing the arc here. Only skip this for a
   purely mechanical render. If `teaching-plan.md` exists, read it and treat it
   as the coordination point for concept sequence, vocabulary staging, and visual
   reveal sequences.

2. **Map the spine onto slides**
   Turn each beat into a slide: beat title to slide title, fact to speaker note,
   cue to reveal question, anchor to caption or paper front. Keep the spine's
   order and vocabulary. Do not add slides that introduce arc the spine does not
   have. For intro decks, default to 10-20 minutes and 8-12 slides; propose a
   longer structure before drafting if the concept needs it.

3. **Add the deck matter**
   Add the opening welcome slide and the closing sequence from
   `slides/deck-matter/` (see Deck furniture). Plan them alongside the teaching
   slides, not as an afterthought.

4. **Place the whiteboard target**
   Decide what learners reconstruct at the end (a diagram, labelled pipeline,
   partially filled structure, or compact question set), group the whiteboard
   exercises after the full teaching sequence, and add an early organising slide
   (often slide 3) that previews that target (see Whiteboard placement).

5. **Place the figures**
   Take figures from the visual inventory. Where one is missing, add a figure
   marker stating the visual's teaching job, focus region, the one new element it
   introduces, and what stays hidden for later slides, then produce it with
   `module-visuals` after the marker is agreed. Prefer simple diagrams over
   explanatory text, and design reveal sequences for concepts that build across
   adjacent slides rather than overloading one figure.

6. **Add short visible text and speaker notes**
   Add the shortest useful phrase under each title or image, treated as a label
   or continuation of the title. Put explanations, caveats, and answers in
   speaker notes. Every prompt or reveal question must have its expected answer
   in the note (see Design principles).

7. **Review the full deck inline for sign-off**
   Before producing any delivery format, show the whole deck inline: every slide
   title, visible text, figure marker, reveal question, and speaker note,
   including opening and closing matter. Check it against the whiteboard target:
   can learners reconstruct it from the deck? If the rendering reveals a better
   order or a hole in the arc, fix it upstream in `narrative.md` /
   `teaching-plan.md`, not only in the deck.

8. **Create the canonical markdown source**
   Keep a plain markdown source as the source of truth: slide titles, visible
   text, figure markers, reveal questions, and speaker notes, with no
   delivery-format wrappers. Use this format unless the repo already has a
   stronger convention:
   - `---` separates slides.
   - `#` is the deck title slide title.
   - `###` is a normal slide title.
   - fenced figure markers identify visuals:
     ```text
     [FIGURE: ./assets/example.svg | Accessible alt text | wide]
     ```
   - `Question: ...` marks a reveal question.
   - `Note: ...` marks speaker notes.

9. **Generate the delivery format**
   After canonical markdown sign-off, convert it into the delivery format:
   Reveal.js HTML, HackMD, Google Slides, or PowerPoint. Apply format-specific
   rules last. When existing generated files predate the design gates, classify
   them as scratch unless the user explicitly accepts them as canonical.

10. **Prepare delivery rehearsal**
    Provide a markdown list of slide titles with speaker notes for memorisation.
    For voice-mode rehearsal, use `references/rehearsal.md`.

## Delivery formats

For Reveal.js decks, the file relationship:

- `<deck>.md` - canonical plain markdown source (design and teaching content)
- `<deck>.html` - generated Reveal.js delivery file (what gets published)
- `assets/*.svg` - editable visual assets referenced by the deck
- `assets/*.png` - rendered previews or raster assets

The HTML deck is a self-contained Reveal.js file. Skeleton:

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Deck title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reveal.js@5/dist/reveal.css">
  <link rel="stylesheet" href="./style.css">
</head>
<body>
  <div class="reveal">
    <div class="slides">
      <section>
        <!-- slide content -->
        <aside class="notes">Speaker notes here.</aside>
      </section>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/reveal.js@5/dist/reveal.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/reveal.js@5/plugin/notes/notes.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/reveal.js@5/plugin/math/math.js"></script>
  <script>
    Reveal.initialize({
      hash: true,
      width: 1280,
      height: 720,
      transition: 'slide',
      transitionSpeed: 'fast',
      plugins: [RevealNotes, RevealMath.KaTeX]
    });
  </script>
</body>
</html>
```

Key Reveal.js patterns:

| Concept | Syntax |
|---------|--------|
| Slide boundary | `<section>` element |
| Speaker notes | `<aside class="notes">text</aside>` inside section |
| Fragment reveal | `class="fragment"` on the element |
| Math (KaTeX) | `\[ \hat{y} = ... \]` (block); `\( x \)` (inline) |
| Ampersand in LaTeX | `&amp;` (HTML-escaped) |

Keep deck assets in `slides/assets/<short-name>/` and reference them as
`./assets/<short-name>/...` from the HTML file.

For local preview, serve the `slides/` directory:

```bash
python3 -m http.server 3000 --directory slides
# open http://localhost:3000/<deck>.html
```

The HTML opens directly as a file URL too, but some browsers restrict local font
loading; a local server is more reliable.

Press `S` to open the speaker notes window. Press `F` for full screen.

For HackMD, use `---` slide boundaries, `###` slide titles when space is tight,
`Note:` for speaker notes, and fragment paragraphs for reveal questions.

## Review questions

Use these before calling a deck ready:

- Does every slide have exactly one job?
- Could the visible text fit on a board while someone is speaking?
- Is the answer in the speaker notes rather than on the question slide?
- Does every prompt have an explicit expected answer in the speaker note?
- Does any subheading answer a reveal question too early?
- Are subtle multi-slide abstractions signposted by an organising slide and
  checked with short questions?
- Does each visual help someone understand, compare, or reconstruct?
- Do figure descriptions match the slide's current teaching point?
- Where slides build a concept step by step, do the figure descriptions form a
  coherent reveal sequence rather than repeating or overloading the same idea?
- Are paper references accurate and tied to the narrative?
- Are whiteboard prompts one-line, concrete, and grouped at the end?
- Does the deck use the same terms as the module?
- Has copied material from other workshops been replaced with fresh text?
- Are exact technical distinctions preserved where they matter?
- Do speaker notes use precise actors where possible?
- Is transformation wording process-explicit?

## Gotchas

Use gotchas as compact warnings for known traps, not as the main workflow.

- For ML-specific slide traps, read `references/ml-slide-gotchas.md` when the
  deck touches embeddings, Word2Vec, semantic search, or related topics.
