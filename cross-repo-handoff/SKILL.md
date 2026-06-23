---
name: cross-repo-handoff
description: Use when a scoped agent session (e.g. Claude Code on web or phone) produces an artefact that belongs in a different repository it cannot push to — a skill bound for the skills repo, a doc for another project, etc. The session can only push to the one repo it is scoped to, so stage the artefact in the brain repo's tracked inbox/ with a mobile-handoff note, then promote it from an environment that has push access to the destination.
---

# Cross-repo handoff

Carry an artefact out of a session that cannot reach its destination repo.

A cloud or phone agent session is usually scoped to a single repository: it
pushes through an authenticated proxy to that one repo and has only read access
to everything else, even public or personal repos the user owns. So when the work
you produce belongs *somewhere else* — a skill for the skills repo, a doc for
another project — you cannot push it where it goes, and an inbox copy that lives
only in the sandbox dies when the container is reclaimed.

The pattern is a relay. Stage the artefact in the one repo you *can* push to
(`brain`), in its tracked `inbox/`, with a handoff note describing where it
really belongs. A later session in an environment with push access to the
destination promotes it and removes the staged copy.

## When this applies

- The session can push to repo A but the artefact belongs in repo B.
- A direct push or PR to B fails for lack of credentials (`could not read
  Username for 'https://github.com'`), or B simply is not in this session's scope.
- The artefact is durable and worth carrying across environments, not a throwaway.

If the work belongs in the repo you are already scoped to, just commit it
normally — this skill is only for the cross-repo case.

## Why the inbox, not the destination's synced copy

Do not stage the artefact in a directory that is gitignored or overwritten by a
sync. For example, skills sync into `.agents/skills/` (and `.claude/skills/`),
which is gitignored in `brain` and re-pulled at session start — anything written
there is both untracked and wiped next session. The tracked `inbox/` is the
opposite: it travels with the repo and persists until you promote it.

## Process

1. **Confirm you cannot push to the destination.** A failed push or out-of-scope
   repo is the trigger. If you *can* push there, do that instead.
2. **Stage the artefact** under `inbox/<short-name>/` in `brain`, preserving the
   path it will have in the destination (e.g. `inbox/<skill>/SKILL.md`).
3. **Write a handoff note** beside it from `templates/mobile-handoff.md`, naming:
   the destination repo (and whether it is public or private), the exact promote
   commands, a cleanup step that removes the inbox copy once promoted, and any
   open question (e.g. genericising a path before it goes public).
4. **Commit and push to `brain`.** The relay now survives the sandbox.
5. **Promote later**, from an environment with push access: copy the file into
   the destination repo, publish it the way that repo expects, then
   `git rm -r inbox/<short-name>` in `brain` and push.

## Rules

- Only the scoped repo is pushable from a cloud/phone session; never assume write
  access to any other repo, even a public one the user owns.
- Stage in tracked `inbox/`, never in a gitignored or sync-overwritten directory.
- Always pair the artefact with a handoff note that carries the promote and
  cleanup steps; a staged file with no instructions rots.
- Route to the right destination: generic skills to the public skills repo,
  setup-specific skills and personal material to the private one.
- The inbox copy is temporary. Promotion is not done until the staged copy is
  removed.

## Worked example

A phone session working in a personal knowledge repo (`brain`) produced a new
reusable skill (`talk-track`). The session could push to `brain` but was
read-only on the public skills repo. It staged the skill under
`brain/inbox/talk-track-skill/SKILL.md` with a `HANDOFF.md` carrying the exact
promote commands, then committed and pushed. A later desktop session copied the
file into the skills repo, ran the publish script, and removed the inbox copy.
