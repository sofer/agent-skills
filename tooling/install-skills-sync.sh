#!/usr/bin/env bash
set -euo pipefail
# Idempotent installer: wire shared-skills sync into the CURRENT repo for both
# Claude Code and Codex. Safe to re-run; it never duplicates hooks or lines.
# Requires: bash, git, jq.
#
# Usage: from any repo root, run this script (or curl it down and run it).

command -v jq >/dev/null 2>&1 || { echo "install-skills-sync: jq is required" >&2; exit 1; }
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
mkdir -p "$ROOT/.agents" "$ROOT/.claude" "$ROOT/.codex"

# 1. Write the canonical sync script.
cat > "$ROOT/.agents/sync-skills.sh" <<'SYNC'
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

if clone_or_pull "$PUBLIC_REPO" "$ROOT/.agents/skills"; then
  link_skills "$ROOT/.agents/skills" "$ROOT/.claude/skills/shared"
  link_skills "$ROOT/.agents/skills" "$ROOT/.codex/skills/shared"
else
  echo "public skills sync skipped (no access this session)" >&2
fi

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
SYNC
chmod +x "$ROOT/.agents/sync-skills.sh"

# 2. Merge the SessionStart hook into a settings/hooks JSON file (idempotent).
merge_hook() {
  local file="$1" cmd="$2"
  [ -f "$file" ] || echo '{}' > "$file"
  if jq -e --arg c "$cmd" '
      any(.hooks.SessionStart[]?.hooks[]?; .command == $c)
    ' "$file" >/dev/null 2>&1; then
    return 0  # already present
  fi
  local tmp; tmp="$(mktemp)"
  jq --arg c "$cmd" '
    .hooks //= {} |
    .hooks.SessionStart //= [] |
    .hooks.SessionStart += [{matcher: "startup|resume", hooks: [{type: "command", command: $c}]}]
  ' "$file" > "$tmp" && mv "$tmp" "$file"
}
merge_hook "$ROOT/.claude/settings.json" 'bash "$CLAUDE_PROJECT_DIR/.agents/sync-skills.sh"'
merge_hook "$ROOT/.codex/hooks.json"     'bash "$(git rev-parse --show-toplevel)/.agents/sync-skills.sh"'

# 3. AGENTS.md note (append once).
AGENTS="$ROOT/AGENTS.md"
if ! { [ -f "$AGENTS" ] && grep -q '^## Skills$' "$AGENTS"; }; then
  printf '\n## Skills\nShared skills are synced at session start: generic skills into `.codex/skills/shared/` (and `.claude/skills/shared/`), plus private skills into `.codex/skills/private/` when credentials are available. Each subfolder contains a SKILL.md; read its description and load the skill when relevant.\n' >> "$AGENTS"
fi

# 4. .gitignore entries (append any that are missing).
GI="$ROOT/.gitignore"
touch "$GI"
for line in '.agents/skills/' '.agents/skills-private/' '.claude/skills/shared' '.claude/skills/private' '.codex/skills/shared' '.codex/skills/private'; do
  grep -qxF "$line" "$GI" || printf '%s\n' "$line" >> "$GI"
done

echo "install-skills-sync: done. Run 'bash .agents/sync-skills.sh' to sync now."
