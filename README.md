# agent-skills

Reusable, generic agent skills, shareable across AI coding assistants (Claude Code, Codex, and any tool that follows the [Agent Skills](https://agentskills.io/) open standard).

This repository is **public** and contains only generic, reusable skills. Personal and organisation-specific skills live in a separate private repository and are synced alongside these when credentials are available (see [Syncing](#syncing-into-a-project-repo)).

## Layout

Each skill is a folder at the repository root containing a `SKILL.md` with `name` and `description` frontmatter:

```
<skill-name>/
└── SKILL.md          # required: name + description frontmatter
    (optional)        # scripts/, templates/, references/, agents/ …
```

Skills are only discovered when they are `<name>/SKILL.md` folders with valid frontmatter. The `tooling/` directory is not a skill.

## Use

Clone (or symlink) this repository into the skills directory your tool reads. For Claude Code:

```bash
git clone https://github.com/sofer/agent-skills.git ~/.claude/skills
# later
git -C ~/.claude/skills pull --ff-only
```

The same clone works for any other tool that reads a skills directory; point it at this checkout.

## Syncing into a project repo

To have a project repo refresh skills automatically on every session start, use the scripts in [`tooling/`](tooling/) (this repo is their source of truth):

- `tooling/sync-skills.sh` — clones/pulls **two** sources into the repo and links them into the discovery paths:
  - the **public** repo (`sofer/agent-skills`, this one) over HTTPS with no credentials, so it works everywhere including cloud/mobile sandboxes → `.claude/skills/shared` and `.codex/skills/shared`;
  - the **private** repo (`sofer/skills`) when git credentials are available, skipped cleanly otherwise → `.claude/skills/private` and `.codex/skills/private`.

  Run `gh auth setup-git` once per machine if the private pull prompts for a username. For sandboxes that do not follow symlinks, set `SKILLS_SYNC_MODE=copy`.
- `tooling/install-skills-sync.sh` — run once from a project root to wire the above in: it writes `.agents/sync-skills.sh`, merges a `SessionStart` hook into `.claude/settings.json` and `.codex/hooks.json` (idempotent, preserves existing settings), and adds the `AGENTS.md` note and `.gitignore` entries.

A consuming repo keeps its own committed bootstrap copy of `sync-skills.sh` (the hook needs the script present before the first clone). When the canonical scripts here change, re-run the installer in a consuming repo to refresh its copy.

## Editing skills (and avoiding drift)

Skills are pulled automatically on every session start, but **edits are pushed deliberately** so nothing auto-commits behind your back. Edit in full authoring clones, one per repo, rather than in the throwaway synced copies:

```bash
git clone https://github.com/sofer/agent-skills.git ~/code/agent-skills   # generic skills
git clone git@github.com:sofer/skills.git           ~/code/skills          # private skills
```

- `tooling/skills-publish.sh` — commit and push edits in an authoring clone (pulls ff-only first, then commits and pushes). Run it from the clone, or pass a path:
  ```bash
  bash ~/code/agent-skills/tooling/skills-publish.sh "Add foo skill"
  bash ~/code/agent-skills/tooling/skills-publish.sh ~/code/skills "Update bar"
  # optional convenience:
  alias skills-publish='bash ~/code/agent-skills/tooling/skills-publish.sh'
  ```
- **Drift watch:** `sync-skills.sh` checks `~/code/agent-skills` and `~/code/skills` at every session start and prints a warning if either has uncommitted or unpushed edits, so you are reminded to publish before the change diverges from the remote. It is a no-op where those clones do not exist (e.g. cloud/mobile).

## Notes

- These are personal but generic skills. Some may reference particular tools and need adapting for other setups.
- Organisation- and platform-specific skills are intentionally kept out of this public repo.
- Skill authoring follows the [Agent Skills](https://agentskills.io/) standard.
