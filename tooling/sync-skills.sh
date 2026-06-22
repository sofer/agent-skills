#!/usr/bin/env bash
set -euo pipefail
# Sync shared skills into this repo for Claude Code and Codex.
#
# Two sources:
#   PUBLIC  (generic skills)  — public repo, clones over HTTPS with no credentials,
#           so it works everywhere including cloud/mobile sandboxes.
#   PRIVATE (private skills)  — private repo, needs git credentials (gh / Keychain),
#           so it works on a configured desktop and is skipped cleanly elsewhere.
#
# Auth: HTTPS. Run `gh auth setup-git` once per machine if private pulls prompt
# for a username. Linking: symlinks by default; set SKILLS_SYNC_MODE=copy for
# sandboxes that do not follow symlinks.
PUBLIC_REPO="https://github.com/sofer/agent-skills.git"
PRIVATE_REPO="https://github.com/sofer/skills.git"
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

clone_or_pull() { # url dest
  local url="$1" dest="$2"
  if [ -d "$dest/.git" ]; then
    git -C "$dest" pull --quiet --ff-only || return 1
  else
    rm -rf "$dest"
    git clone --quiet --depth 1 "$url" "$dest" || return 1
  fi
}

# Place skills in an agent discovery path. Always remove the existing entry first
# so we never create a nested link inside a leftover copy dir.
link_skills() { # source_dir link_path
  local src="$1" link="$2"
  rm -rf "$link"
  if [ "${SKILLS_SYNC_MODE:-symlink}" = "copy" ]; then
    cp -R "$src" "$link"; rm -rf "$link/.git"
  elif ! ln -sfn "$src" "$link" 2>/dev/null; then
    cp -R "$src" "$link"; rm -rf "$link/.git"
  fi
}

mkdir -p "$ROOT/.claude/skills" "$ROOT/.codex/skills"

# Public skills: expected in every environment.
if clone_or_pull "$PUBLIC_REPO" "$ROOT/.agents/skills"; then
  link_skills "$ROOT/.agents/skills" "$ROOT/.claude/skills/shared"
  link_skills "$ROOT/.agents/skills" "$ROOT/.codex/skills/shared"
else
  echo "public skills sync skipped (no access this session)" >&2
fi

# Private skills: desktop only. Skip cleanly where credentials are absent, and
# drop any stale links so private skills never linger in a fresh sandbox.
if clone_or_pull "$PRIVATE_REPO" "$ROOT/.agents/skills-private"; then
  link_skills "$ROOT/.agents/skills-private" "$ROOT/.claude/skills/private"
  link_skills "$ROOT/.agents/skills-private" "$ROOT/.codex/skills/private"
else
  echo "private skills sync skipped (no access this session)" >&2
  rm -rf "$ROOT/.claude/skills/private" "$ROOT/.codex/skills/private"
fi

# Drift watch: warn (to stderr) about unpushed edits in the local authoring
# clones, so skill changes do not silently diverge from the remotes. Absent
# dirs are skipped, so this is a no-op on the phone and machines without them.
for authoring in "$HOME/code/agent-skills" "$HOME/code/skills"; do
  [ -d "$authoring/.git" ] || continue
  dirty="$(git -C "$authoring" status --porcelain 2>/dev/null || true)"
  ahead=""
  if git -C "$authoring" rev-parse '@{u}' >/dev/null 2>&1; then
    ahead="$(git -C "$authoring" log --oneline '@{u}..HEAD' 2>/dev/null || true)"
  fi
  if [ -n "$dirty" ] || [ -n "$ahead" ]; then
    echo "⚠️  skills drift: $authoring has unpushed edits — run: bash \"$HOME/code/agent-skills/tooling/skills-publish.sh\" \"$authoring\"" >&2
  fi
done

if [ -n "${CLAUDE_PROJECT_DIR:-}" ]; then
  echo '{"hookSpecificOutput": {"hookEventName": "SessionStart", "reloadSkills": true}}'
fi
