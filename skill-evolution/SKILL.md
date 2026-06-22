---
name: skill-evolution
description: Update skills or reusable agent workflows when the user explicitly asks for that change. Use for direct skill edits, deprecation, cleanup, or workflow-policy changes. Do not create or offer candidate logs.
---

# Skill evolution

Use this skill to update existing skills or reusable agent workflows when the user asks for the change now.

## Purpose

The goal is to make explicit skill changes directly and with minimal fuss.

This skill should not interrupt ordinary work with suggestions to log, review, or defer possible future improvements. If the user identifies a skill problem and asks for a change, edit the relevant skill now.

Do not create a candidate log. The workflow is immediate change or silence.

## When to use

Use this skill when the user explicitly asks to:

- change, fix, simplify, remove, rename, or deprecate a skill
- change when a skill triggers
- stop a skill from prompting or getting in the way
- turn an accepted repeated workflow into skill instructions
- clean up old skill behaviour

Do not use this skill just because a conversation revealed a preference or possible reusable lesson. Do not proactively suggest using this skill. If the user wants durable memory, workflow notes, or skill changes, they will ask.

## Core workflow

1. Confirm the target skill or workflow from the user's request.
2. Open the current skill file or workflow file.
3. Identify the smallest edit that makes the requested behaviour true.
4. Apply the edit directly.
5. Report exactly what changed and any remaining limitation.

Ask a question only when the requested change could reasonably mean several different incompatible edits, such as deleting a skill entirely versus narrowing its trigger.

## Review behaviour

Do not interrupt deep work to suggest candidate skill changes, review possible future improvements, or ask whether to preserve a workflow lesson.

## Applying changes

Update an actual skill when the user explicitly asks for the change.

When applying a change:

1. Open the existing skill file if there is one.
2. Make the smallest useful edit.
3. Preserve the style and structure of the existing skill.
4. Remove stale instructions that would keep causing the unwanted behaviour.
5. Add a gotcha only if the failure mode is likely to recur.
6. Ask the agent to reread the updated skill before relying on the new behaviour.

## Deprecating this skill

If the user asks to scrap or retire this skill entirely, prefer making it inert rather than deleting files immediately:

- narrow the description so it triggers only on explicit requests
- remove proactive logging/review behaviour
- remove candidate-log instructions

Delete the skill directory only if the user explicitly confirms deletion.

## Gotchas

- Do not offer to log skill-evolution candidates.
- Do not write `~/.agents/skill-evolution-candidates.md`.
- Do not run a candidate review just because this skill was invoked.
- Do not treat a one-off preference as a skill update unless the user explicitly asks to change the skill.
- Do not preserve a candidate when the user asked for an immediate edit.
- Prefer small skill updates over large rewrites.
