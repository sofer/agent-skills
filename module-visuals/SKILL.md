---
name: module-visuals
description: Create simple visual-only graphics for workshop or module slide beats, following the local design system.
---

# Module visuals

Use this skill when creating graphics for a workshop or module slide sequence.

## Rules

1. Create one visual for every slide beat.
2. Keep each visual simple and visual-only: no visible labels, captions,
   explanatory text, formulas, or learner-facing scaffolding unless the user
   explicitly asks for a labelled variant.
3. Follow the relevant local design system.
4. Reuse the strongest existing visual as the baseline when one exists. Start
   from the previous working figure before creating a new one from scratch.
5. Keep slide layout and typography in the deck's shared CSS. Do not compensate
   for a weak visual by adding one-off slide positioning unless the user asks
   for a local exception.

## Teaching figure quality

The figure must be visually and conceptually legible in the way the slide beat
depends on. For classification, boundary, or geometry figures:

- design the data first, with balanced classes unless imbalance is the teaching
  point
- keep the same data points across before and after panels; the visual change
  should be the mechanism being introduced
- avoid ambiguous near-boundary points unless ambiguity is the point of the
  slide
- use enough margin that the intended classification is obvious at a glance
- adjust slope and bias deliberately: slope changes the angle, bias shifts the
  line without changing the slope
- prefer one visual change per slide beat

For slide-deck figures, choose an aspect ratio that leaves room for the slide
title, caption, and optional question in the actual deck. Do not assume a
standalone 16:9 figure will fit a teaching slide that also has text.

## Design system

If the project provides a design system or design tokens source (colours, font
stacks, type scale, spacing, radii, border widths), read it first and use it as
the canonical source. Use the light or dark palette that matches the target
artefact, and do not substitute a generic palette when project tokens are
available.

## Verification

Before calling visuals done, render or preview them and check:

- every slide beat has a visual
- the visual contains no visible text unless explicitly requested
- the design choices come from the relevant design system
- the cue is simple enough to recall the beat quickly
- the figure has been checked inside the actual target slide, not just as a
  standalone SVG or image
- classification boundaries, data points, and other geometry are unambiguous
  at slide size
