---
name: agent-learning
description: Deprecated compatibility route for old learning-log requests. Do not write to ~/.agents/learning-log.md. When the user asks to change agent behaviour, identify the existing skill or workflow that should change and use skill-evolution to update it immediately.
---

# Agent learning

This skill no longer captures durable lessons in a learning log.

Use this skill only as a compatibility route when an old instruction or user
phrase asks to "capture a lesson", "log a learning", or write to the learning
log.

## Rules

- Do not write to `~/.agents/learning-log.md`.
- Do not offer to capture reusable lessons.
- Do not create candidate logs.
- Do not preserve routine preferences, workflow observations, or tool quirks in
  a holding file.
- If the issue implies an existing skill or reusable workflow should change, use
  `skill-evolution` only when the user explicitly asks for that change.
- If the user asks to "capture" something and no existing skill or workflow is
  the right target, say that there is no learning-log workflow now and ask what
  skill or instruction should be updated.

## Workflow

1. Identify the behaviour the user wants to preserve or prevent.
2. Identify the existing skill, workflow, or instruction file that controls that
   behaviour.
3. If the user has asked for the change now, invoke `skill-evolution` and update
   that file directly.
4. If the user has not asked for a skill or workflow change, stay silent. Do not
   offer capture, logging, or later review.

## Non-goals

- No learning-log appends.
- No flashcard-style recall prompts.
- No future candidate queues.
- No proactive offers to preserve a lesson.
