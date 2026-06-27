---
name: narrative
description: Use when building a narrative spine for a topic, before any slides or workshop artefacts. Produces three artefacts in sequence: discussion.md (discussion record — what was hard, ambiguous, important), questions.md (atomic Q&A pairs for recall), and narrative.md (ordered beats threaded into a story arc, plus whiteboard exercises). Run this upstream of workshop-design. Also use to reverse-derive a spine from an existing deck or talk, or in source-led Socratic mode.
---

# Narrative

Build a narrative spine: a short story made of a dozen-ish atomic beats, each one
individually memorable, threaded into a single arc.

The spine has two jobs at once, and they are the same job:

- a recall aid the user can rehearse and tell from memory
- the kernel a workshop, deck, or post later grows from

It is recall-first, not production-first. It comes before the synopsis, the
outline, the brief, and the slides. Those derive from it.

## The tension this resolves

Atomic facts are hard to recall alone because they have weak retrieval cues. A
narrative is the retrieval scaffold: a chain the user walks along, where each
beat triggers the next. One idea per slide is the same atomic constraint that
communication forces; the talk-track is the narrative the slide omits.

So a good spine holds three layers at once:

1. **Through-line**: the whole story in a breath.
2. **Beats**: the ordered atomic ideas, one idea each. The beat title carries
   the idea as a short, sayable line; that title is the thing you memorise.
3. **Cues**: one short recall question per beat, answered by the next beat's
   title. The cues chain the beats into a self-checking sequence.

## Beat shape

A beat is small on purpose: its job is to be easy to remember the shape of.

- **Title carries the idea.** Write it as a short, sayable line, imperative or
  plain declarative ("Bias sets the position", "Give it a check it can run").
  The title is what gets memorised; everything else is scaffolding.
- **A line or two of fact.** One or two short sentences elaborating the title,
  no more. No lists, no caveats, no examples; that is completeness, which
  belongs in the deck or module, not the spine. Brevity and rhythm matter, not a
  fixed length.
- **One short cue.** A single question, answered by the next beat's title.

Read the titles alone, top to bottom, as the test: they should sound like a
sequence you could repeat after one read. If a beat needs a list to be true, the
list belongs downstream; keep only the one idea it illustrates.

## The chaining cue

The cue is the spine's recall engine, not decoration. Each beat's cue is answered
by the next beat's title, so rehearsal is self-checking: read a title, recall its
fact, ask its cue, then produce the next title from memory. The right answer and
the next beat are the same act, so there is no separate answer layer to learn.

- **The answer may describe before the next title names.** A cue can be answered
  by the plain-language version of what the next title formally terms: "the
  position moves" answers a cue whose next title is "Bias". The spoken answer
  leads; the term follows.
- **The chain is also an arc test.** If you cannot write a cue at one beat whose
  answer is the next beat's title, that beat probably does not follow from the
  previous one. Treat it as a sequencing problem, not a wording problem.

Write an explicit answer only where the chain cannot carry it: the final beat
(nothing follows it), or a backward-looking comprehension cue that tests the
current beat instead of pointing forward.

When a spine is ordered by importance rather than narrative flow, the chain does
not apply: beat N+1 no longer follows from beat N, so the cues self-test each
beat instead (see Source-led Socratic mode).

## Process

The sequence is fixed: grilling first, questions second, narrative third.
The questions are the spec; the narrative is built to cover each one.

Work conversationally throughout.

1. **Grill and discuss.** Work through the topic conversationally, one question
   or claim at a time. Surface what the user already knows, where understanding
   is thin, and where correction was needed. The spine is only as honest as the
   user's grasp of the material. Do not summarise or move on until the
   understanding is genuinely shared.

   Produce `discussion.md` at the end of this step: a concise record of the
   session. Include what the user found conceptually hard, where understanding
   needed correction, key ambiguities, and the concepts that were most important
   to their understanding. This file must contain enough information to derive
   the questions artefact that follows.

2. **Produce questions.md.** From `discussion.md`, produce a series of atomic Q&A
   pairs, one per important concept from the discussion. Each entry: a question
   that probes the concept precisely, and a concise correct answer. Optimise for
   recall. Confirm the list with the user before proceeding. The questions are a
   pool: the narrative draws from them editorially, not exhaustively. Some
   questions will be cut, combined, or deferred to a follow-up session.

3. **Design the whiteboard exercises.** From `questions.md` — specifically the
   questions that were hardest, required correction, or involve a spatial or
   formulaic component — identify 3 to 5 whiteboard exercises. Confirm the list
   with the user before proceeding.

   Each exercise must:
   - Require constructing something (drawing, deriving, labelling a diagram)
     rather than recalling a fact.
   - Be visual or diagrammatic where the concept has a spatial or formulaic
     component.
   - Be stated as a prompt, not a quiz question: "Draw a single connection
     between two nodes and label every term in the weight update" rather than
     "What is the weight update formula?"
   - Be answerable only by someone who genuinely understood the concept, not
     someone who memorised a title.

   Each exercise is immediately followed by a brief model answer: a labelled
   diagram description, a formula with terms named, or a one-line explanation —
   enough to show what a correct response looks like and to confirm the exercise
   is well-formed. A vague model answer means the exercise needs sharpening.

   When the topic builds on a prior pass or upstream mechanism (for example,
   backpropagation building on the forward pass), include a reconstruction
   exercise for that upstream mechanism as the first exercise. It acts as a
   checkpoint: participants who cannot do it are not ready to continue. Its
   home beat is the last beat of the upstream section.

5. **Force out the through-line.** One or two sentences that carry the whole
   story. If it cannot be said in a breath, the story is not clear yet.

6. **Name the arc.** The shape it traverses. Often seed, turn, limitation, what
   comes next, but not required to be historical. The arc is what makes the
   beats feel inevitable rather than listed.

7. **Write the motivation.** Before the numbered beats, write a motivation: the
   problem-hook that explains why the problem is worth solving — the force that
   makes the arc feel necessary rather than arbitrary. It has the same shape as
   a beat — a short sayable title, a sentence or two of fact, and a cue that
   leads into beat 1 — but it is not numbered. It precedes the arc rather than
   belonging to it.

8. **Lay the beats.** Break the arc into 8 to 16 atomic ideas, one idea per
   beat. Around a dozen is the natural size; sixteen is the firm ceiling. Split
   any beat that smuggles in two ideas. Refuse to cram. More than 16 beats means
   it is two spines, not one. Give each beat a title that carries the idea (see
   Beat shape). The narrative is an editorial selection from `questions.md`, not
   a complete coverage of it. Choose the questions that make the best coherent
   story; defer the rest to the extension. A beat earns its place in the core
   if it is the bare minimum needed for the story to hold together and for
   participants to be able to answer the whiteboard exercises. Both tests apply:
   narrative coherence and exercise competency. A beat that serves neither
   belongs in the extension.

9. **Hang a cue on each beat.** Write a short question answered by the next
   beat's title, so the beats chain into a self-checking sequence (see The
   chaining cue). The cue is the spine's recall engine, not decoration.

10. **Add anchors.** A date, person, paper, image, or vivid object that pins a
    beat in memory, but only where it carries the story, not as passive
    background.

11. **Walk the chain, then verify.** Read the titles alone, top to bottom: do
    they carry the story? Check each beat is one idea, a fact of a sentence or
    two, and a short cue answered by the next title. Then apply the prefiguring
    check: for every whiteboard exercise, every diagram and formula it requires
    must have appeared explicitly in at least one beat. Nothing should appear for
    the first time in an exercise. If a visual or formula is missing from the
    beats, add it. Questions deferred from `questions.md` do not need to appear.

    Each exercise must also declare a **home beat**: the single beat after which
    a participant has everything they need to attempt the exercise, and where the
    exercise prompt would naturally appear as a slide in the deck. If a home beat
    cannot be named, the beats are not doing their job — either a beat is missing
    or the exercise is under-specified.

12. **Produce the extension.** Identify questions from `questions.md` not covered
    by the core beats and not required for any whiteboard exercise. Arrange them
    into an `## Extension` section within the same `narrative.md` file. The
    extension has its own through-line, arc, and beats with cues — the same
    format as the core, but the ceiling is looser because module learners can
    take their time. Label extension beats E1, E2, etc. to distinguish them from
    core beats.

    A concept belongs in the extension if it is not needed for the story to
    hold together and not needed to answer the whiteboard exercises. Both tests
    apply: a concept that passes either one may stay in the core.
    The extension is not leftovers. `slides.md` draws from the core only.
    `module.md` covers everything: the full core narrative and then the
    extension. The live session introduces the core; the module re-covers it
    and then goes further.

13. **Hand off.** Offer to pass the spine to `workshop-design` (to grow a full
    workshop) or `fac-workshop-slides` (to grow a deck). The spine maps almost
    mechanically: beat title becomes the slide title, fact becomes the speaker
    note, cue becomes the reveal question, anchor becomes the caption or paper
    front.

## Reverse mode: spine from an existing artefact

The default direction is forward: spine first, then deck. But when a deck, talk,
notes, or paper already exist (often one the user did not write), derive the
spine from them instead of from a blank page. The steps are the same: recover
the through-line, name the arc, lay the beats, hang the cues.

The gap between the spine and the source is a critique:

- a beat that holds two ideas marks an overloaded slide
- a missing beat marks a hole in the arc
- a beat with no crisp cue marks a slide that does not earn its place
- beats that resist a clean recall order mark a sequencing problem

Output the spine plus a short list of candidate improvements. Do not edit the
source artefact. Record candidates where its design notes live, for example the
workshop `brief.md` recent notes, so the owner decides whether to act.

## Source-led Socratic mode

Use this when a source document (a doc, paper, or guide) holds content the user
wants to learn, not just retell. Producing a spine straight from the source hands
them an abbreviated list of something they do not yet own. Instead, the
conversation is the learning, and the beats are its residue.

1. Read the source and list its points.
2. Quiz the user, one question at a time, on what they should *do* or understand.
   Ask blind: do not put the answer in the question, and keep your assessment to
   yourself until they have committed an answer.
3. Compare each answer with the source and keep a running gap log: where they
   trip, where they reach for the wrong tool, where they stay abstract.
4. Build the spine from the conversation. The gaps become the load-bearing beats,
   with the sharpest cues; the points they had cold stay terse. The source still
   supplies the full arc, so the story stays coherent rather than holey.

The content is the spine; the conversation decides which parts to surface and how
hard. It is slower than summarising, on purpose. A beat earns depth because the
quiz showed it was non-obvious to this learner, not because the source flagged it
as important.

A spine can be ordered by narrative flow or by importance. When it is ranked by
importance (an action checklist, most-leverage first), the chaining cue does not
hold, because beat N+1 no longer follows from beat N. There the cues self-test
each beat instead of pointing at the next title. Treat that as an action-spine
variant, and say which ordering a given spine uses.

## Rules

- Recall-first. The test is "can I tell this story from memory", not "is this
  complete". Completeness is the workshop's job, not the spine's.
- One idea per beat. Atomicity serves memory and communication equally.
- Keep beats short. The title carries the idea, the fact is a sentence or two,
  the cue is one question. Aim for brevity and rhythm, not a fixed length. Read
  the titles alone as the test.
- The chain is the recall engine. Each cue is answered by the next beat's title;
  rehearsal walks the chain and checks itself.
- 8 to 16 beats. Around a commute-sized dozen, sixteen at the very most. Beyond
  that, split the spine.
- Anchors that carry the story, never passive background.
- The spine is upstream. When it feeds a workshop, the brief and slides derive
  from it; do not let downstream artefacts reinvent the arc.

## Artefacts

This skill produces three artefacts in sequence, all in `curriculum/<topic>/`:

**`discussion.md`** — record of the discussion session. What the user found
conceptually hard, where understanding needed correction, key ambiguities, and
the concepts most important to their understanding. Must contain enough
information to derive the questions artefact.

**`questions.md`** — atomic Q&A pairs drawn from `discussion.md`. One question
and answer per important concept, optimised for recall. These anchor the
narrative and every downstream artefact.

**`narrative.md`** — the spine. Contains, in order:

- Through-line and arc
- Motivation beat (unnumbered, precedes the arc)
- Numbered core beats with cues and anchors
- `## Whiteboard questions` section: 3–5 constructive prompts drawn from the
  load-bearing beats, each immediately followed by its home beat (the single
  beat after which the exercise can be attempted), the beats that prefigure it,
  and a model answer
- `## Extension` section: its own through-line, arc, and beats (labelled E1,
  E2, etc.) covering the questions from `questions.md` not required for the
  whiteboard exercises. `slides.md` draws from the core beats only; `module.md`
  draws from both core and extension.

Each artefact is self-contained. A grilling and questions file with no narrative
is still a useful record. A spine that never becomes a workshop is still a
finished, useful thing.

## Spoken narrative

A companion artefact to the spine: the beats expanded into continuous prose,
written the way a speaker would say them rather than as a structured list. Not a
script to memorise, but a register-neutral rendering of the arc that works both in
live delivery and as self-paced reading.

Produce it as `spoken-narrative.md` in the same directory as `narrative.md`. It
follows the same beat order; each section maps to one slide or module step. Write
in second person, present tense, short paragraphs, one idea handing off to the
next — the same constraint as the spine, loosened into prose rhythm.

Avoid time-anchored phrases ("tonight", "this evening") so the text works equally
in a live room and in a self-paced module.

The file starts directly with the first section — no preamble, no explanatory
header, no trailing notes. The title is `# <Topic>: spoken narrative` and the
first heading is the motivation beat or beat 1. Meta-commentary belongs in
`brief.md`, not in the spoken narrative itself.

While writing, surface any recommendations that arise — slides that need creating,
beats that need splitting, artefacts that are out of sync with the spine — as a
short list at the end of the conversation, not embedded in the file. Do not act on
them until the user approves.

## Worked example

- `curriculum/claude-code-best-practices/narrative.md`: source-led Socratic mode,
  ordered by importance. The reference for the action-spine variant: tight beats,
  self-test cues (not chained), and the user's gaps as the load-bearing beats.
- `curriculum/perceptrons/narrative.md`: reverse mode, derived from the published
  Perceptrons deck. The 2026-06-20 note in that workshop's `brief.md` is an
  example of the critique reverse mode produces. It predates the tightened beat
  shape, so read it for arc and reverse mode, not for cue style.
- `curriculum/perceptrons/spoken-narrative.md`: the perceptrons spine expanded into
  prose. The reference for the spoken narrative artefact: register-neutral phrasing,
  live-delivery energy, no time-anchored phrases.
