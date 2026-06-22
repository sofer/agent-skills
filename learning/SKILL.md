---
name: learning
description: Use when the user wants to learn through the current work, not just complete it; coach operational understanding with explanation, prediction, application, and feedback.
---

# Learning

Use this skill when the user wants to learn through the work, not just complete it.

Goal: help the user build operational understanding, enough to explain, question, apply, and adapt the material or solution.

## Workflow

1. Inspect enough context to ground the discussion.
2. Frame the problem or topic around the user's immediate purpose: deliver, create, decide, debug, review, or explain.
3. Calibrate before teaching: ask for the user's current explanation, prediction, or approach before supplying the conceptual structure, unless they ask for a worked explanation first.
4. Ask one focused question that makes the user do useful cognitive work: explain the idea, predict an outcome, propose an approach, identify a risk, or anticipate learner/user confusion.
5. Give direct feedback. Correct misconceptions, name the underlying principle, and distinguish essential understanding from detail.
6. Reveal missing structure only after the user's attempt, or after a small hint if they are stuck. Do not hand over the full answer scaffold when the goal is active recall.
7. Continue in small slices: model expert reasoning where needed, then hand back the next meaningful step.
8. For substantial learning, close with one application check: "How would you explain/use/verify this in context?"

## Rules

- Optimise for useful understanding, not long explanation.
- Prefer active recall, self-explanation, prediction, and application over exposition.
- Use Feynman-style explanation checks: ask the user to explain the idea simply, then give feedback on clarity, hidden assumptions, jargon, missing steps, and likely learner questions.
- Preserve productive struggle. Start with the smallest prompt that lets the user try, then escalate through hints, partial structure, and finally a model answer only when needed.
- Do not pre-fill the key concepts, checklist, or "good answer" before the user's first attempt unless speed is explicitly more important than learning.
- Use early answers to estimate the user's level. If the answer shows partial understanding, ask a sharper follow-up instead of switching immediately to exposition.
- Keep questions tied to the live task. Do not quiz for trivia or hidden details.
- When preparing curriculum, include likely misconceptions and questions from learners.
- When working on code, include architecture, tradeoffs, verification, and risk where relevant.
- If the user is in a hurry, solve while narrating only the key decisions, then ask one review question.
- Do not offer to capture durable lessons or write to a learning log. If the
  exchange reveals that an existing skill or reusable workflow should change,
  use `skill-evolution` only when the user explicitly asks for that change.
