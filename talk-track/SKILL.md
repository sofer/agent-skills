---
name: talk-track
description: Use after the narrative spine and slide beats are settled, to turn those atomic beats into the spoken word — a flowing talk track written as prose, the way a brilliant explainer actually talks, not as bullets or terse speaker notes. Models the prose on a transcript of an excellent speaker on a similar topic: study how they put one sentence in front of the next, then render your own beats in that voice. Runs downstream of `narrative` and the slide-beat step of `workshop-design`; its output becomes the deck's speaker notes and the basis of the spoken delivery.
---

# Talk track

Turn a settled narrative spine into the words you will actually say out loud.

The `narrative` skill produces beats: atomic, individually memorable, chained by
recall cues. That spine is a skeleton. It tells you *what* to say and in *what
order*, but a list of beats is not yet a talk. This skill grows the spine into
continuous spoken prose — a talk track — that a person could stand up and deliver,
where each sentence hands off to the next and the whole thing has momentum.

It is the step most talks skip. People memorise bullets and improvise the
connective tissue live, and the connective tissue is exactly where talks live or
die. Writing the prose down first, the way a great explainer would say it, is how
you find the cold open, the hand-offs, and the emotional centre before you are
standing in front of people.

## Where it sits

```
narrative spine  ->  slide beats  ->  TALK TRACK  ->  rehearse / deck speaker notes
   (what + order)     (one idea/slide)   (how it sounds)
```

- **Upstream dependency.** The beats must be settled first. This skill renders
  them; it does not re-sequence the arc or invent new claims. If you find
  yourself wanting to change *what* is said or the order, stop and fix the spine
  (`narrative`), then come back.
- **Two registers, one source.** The spine is the source of truth for content.
  The talk track is the source of truth for voice. The beat's fact must survive
  the rewrite unchanged; only the *saying* of it changes.
- **Downstream.** The finished prose becomes the deck's speaker notes (one beat
  per slide), and the script you rehearse from. It maps one section per slide, so
  it slots straight back into `slides.md` / the Slidev deck.

## Model on a brilliant speaker first

This is the move that makes the skill work, and it is easy to skip. Before
writing a word of your own, get a transcript of an excellent speaker explaining
something adjacent to your topic, and read it for *mechanics*, not content.

The point is not to borrow their material. It is to see, written down in plain
prose, the choices a great explainer makes sentence to sentence — choices that
vanish when you only watch the talk. You are reverse-engineering the physics of
their prose so you can apply it to your own beats.

Read the transcript asking:

- How do they *open*? (Almost always something concrete and nearly mundane, in
  the listener's own experience, long before any history or formalism.)
- How does each sentence hand off to the next? Where is the question that the
  next sentence answers?
- Where do they slow down, repeat, and where do they move fast?
- When do they name the technical term — before or after the intuition?
- Where do they admit something is hard or surprising, rather than smoothing it?

Then write your beats in that voice. Optionally, draft one beat, then ask: "is
this how *that* speaker would have said it?" and close the gap.

**Sourcing the transcript.** YouTube's own "Show transcript" panel (in a normal
browser) is the most reliable. Public transcript-mirror sites and the timedtext
API are frequently blocked from datacenter / sandbox IPs (captcha, 403, empty
body), so do not rely on fetching one from a cloud session — ask for it to be
pasted in, or work from a written version of the source. Always record where the
prose came from, and flag clearly when it is written *in the style of* a speaker
rather than from their verbatim words.

## The moves that turn beats into speech

These are the concrete transformations from a terse beat to a spoken line.

- **Cold open before beat one.** Add a short opening, before the first beat, that
  starts in the audience's own experience — concrete, almost mundane, no jargon,
  no dates. Make them feel the problem before you name the field. Hand off from
  the cold open into beat one.
- **Hand-offs, not bullets.** End each beat by opening the question the next beat
  answers. The spine's recall cues are the raw material: a cue is a question whose
  answer is the next beat's title, so spoken aloud it becomes the transition. The
  listener should feel pulled, never marched.
- **Say it like a person talks.** Short sentences. Direct address ("you"),
  contractions, plain words. One idea per breath. Read it aloud and the rhythm
  has to survive the mouth, not just the eye.
- **Intuition first, term second.** Describe what is happening in plain language,
  then attach the formal name to it ("the line rotates — so the weights are
  literally the angle of the decision"). The term lands on a thing the listener
  can already see.
- **Find the emotional centre and play it.** Most arcs have one turn that matters
  most — usually the limitation or failure case. Do not state it as a bullet.
  Stage it: set it up, invite the listener to try, let them hit the wall, then
  explain *why* the wall is there. That beat earns more words than the others.
- **Callback close.** End by returning to the opening image or the through-line,
  so the talk feels closed rather than stopped.
- **Honesty over hype.** Name what is hard or unresolved and let it sit. A puzzle
  the listener can feel ("if it worked in 1960, why did the field stall?") pulls
  harder than a claim that everything is amazing.

## Process

1. **Confirm the spine is settled.** Read `narrative.md` and the slide beats. If
   the arc or the claims are still moving, go back to `narrative` first. This
   skill assumes the *what* is fixed.
2. **Get a model transcript** of a brilliant speaker on an adjacent topic, and
   read it for mechanics (see above). Record the source.
3. **Write a cold open** that starts in the audience's experience and hands off
   into beat one.
4. **Render each beat as prose**, in order, one short section per beat so it maps
   back to its slide. Keep the beat's fact intact; change only how it is said.
   Use the spine's cue as the spoken hand-off into the next beat.
5. **Stage the emotional centre.** Give the key turn room; trim the supporting
   beats so it stands out.
6. **Write the callback close.**
7. **Read the whole thing aloud.** Where you run out of breath, stumble, or speed
   up, cut. Breath points are edit points. Mark the draft as something to react
   to, not to memorise.
8. **Add a short notes block** at the end: where the model prose came from (and
   whether it is verbatim or in-the-style-of), what changed versus the terse
   beats, and any timing/trim guidance.
9. **Hand back.** The prose is now the deck's speaker notes and the rehearsal
   script. Offer to fold it into `slides.md` / the Slidev deck.

## Rules

- The spine is upstream and authoritative for content. Render it; do not rewrite
  the arc or smuggle in new claims. Wanting to change the content means the spine
  needs another pass, not the talk track.
- Model on a real speaker's prose before writing your own. Borrow the mechanics,
  never the material.
- It is a draft to react to and rehearse from, not a script to memorise
  word-for-word. Reading aloud is the test.
- One section per beat, mapping to one slide, so it returns cleanly to the deck
  as speaker notes.
- Prefer concrete over abstract, intuition before terminology, hand-offs over
  bullets, and honesty over hype.
- Always record the provenance of any modelled prose, and flag in-the-style-of
  versus verbatim.

## Artefact

Produce a single prose file alongside the other workshop artefacts:

```
workshops/<short-name>/narrative-spoken.md
```

Title it as the spoken version of the narrative. Map one section per beat to one
slide, open with the cold open, close with the callback, and end with the notes
block. For a standalone talk with no workshop folder, place it next to the spine
it grew from.

## Worked example

- `workshops/perceptrons/narrative-spoken.md` (in the `brain` repo): the
  reference output. The 15-beat perceptron spine rendered as spoken prose — a
  handwritten-digit cold open, each historical and mechanical beat handing off
  via its cue, the XOR limit staged as the emotional centre, and a callback close
  that returns to Rosenblatt's machine. Its notes block records that the modelled
  prose was written *in the style of* 3Blue1Brown's "But what is a neural
  network?" (the verbatim transcript was blocked from the sandbox), what changed
  versus the terse Socratic slide notes, and how to trim it for time.
