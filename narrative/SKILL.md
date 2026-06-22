---
name: narrative
description: Use when building a narrative spine for a topic, before any synopsis, outline, brief, or slides. Produces an ordered set of atomic, individually memorable beats threaded into one story, designed both as a recall aid the user can rehearse and as the kernel a workshop or deck grows from. Run this upstream of workshop-design. Also use to reverse-derive a spine from an existing deck or talk (which doubles as a critique of it), or in source-led Socratic mode to learn a source document by quizzing the user against it so their gaps drive the beats.
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

Work conversationally, one question or claim at a time. Do not assume whether
the user or the agent holds the key knowledge.

1. **Find the topic and why it is worth telling.** Surface what the user already
   knows versus what they would need to learn. The spine is only as honest as
   the user's grasp of the material.

2. **Force out the through-line.** One or two sentences that carry the whole
   story. If it cannot be said in a breath, the story is not clear yet.

3. **Name the arc.** The shape it traverses. Often seed, turn, limitation, what
   comes next, but not required to be historical. The arc is what makes the
   beats feel inevitable rather than listed.

4. **Lay the beats.** Break the arc into 8 to 16 atomic ideas, one idea per
   beat. Around a dozen is the natural size; sixteen is the firm ceiling. This
   is the core craft. Split any beat that smuggles in two ideas. Refuse to cram.
   More than 16 beats means it is two spines, not one. Give each beat a title
   that carries the idea (see Beat shape).

5. **Hang a cue on each beat.** Write a short question answered by the next
   beat's title, so the beats chain into a self-checking sequence (see The
   chaining cue). The cue is the spine's recall engine, not decoration.

6. **Add anchors.** A date, person, paper, image, or vivid object that pins a
   beat in memory, but only where it carries the story, not as passive
   background.

7. **Walk the chain, then trim.** Read the titles alone, top to bottom: do they
   carry the story? Then check each beat is one idea, a fact of a sentence or
   two, and a short cue answered by the next title. Cut any list, caveat, or
   example back to the single idea it illustrates. Fix the beats that break the
   walk.

8. **Hand off.** Offer to pass the spine to `workshop-design` (to grow a full
   workshop) or a slide-deck skill (to grow a deck). The spine maps almost
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

## Artefact

Produce a single `narrative.md` from `templates/narrative.md`. Place it in:

- `curriculum/<topic>/narrative.md` for a story the user wants to know and tell,
  with no workshop committed yet, or
- `workshops/<short-name>/narrative.md` once it is clearly headed for a workshop.

Ask which when it is not obvious. The artefact is self-contained: a spine that
never becomes a workshop is still a finished, useful thing.

## Worked example

- `curriculum/claude-code-best-practices/narrative.md`: source-led Socratic mode,
  ordered by importance. The reference for the action-spine variant: tight beats,
  self-test cues (not chained), and the user's gaps as the load-bearing beats.
- `workshops/perceptrons/narrative.md`: reverse mode, derived from the published
  Perceptrons deck. The 2026-06-20 note in that workshop's `brief.md` is an
  example of the critique reverse mode produces. It predates the tightened beat
  shape, so read it for arc and reverse mode, not for cue style.
