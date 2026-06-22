#!/usr/bin/env bash
set -euo pipefail
# Commit and push skill edits in an authoring clone (sofer/agent-skills or
# sofer/skills). Pulls first (ff-only) to stay current, then commits and pushes.
#
# Usage:
#   skills-publish.sh                          # publish cwd, default message
#   skills-publish.sh "Add foo skill"          # publish cwd with a message
#   skills-publish.sh ~/code/skills "msg…"     # publish a specific clone
#
# Tip: alias skills-publish='bash ~/code/agent-skills/tooling/skills-publish.sh'

repo="$PWD"
if [ "${1:-}" ] && [ -d "$1" ]; then repo="$1"; shift; fi
msg="${*:-Update skills $(date +%Y-%m-%d)}"

cd "$repo"
url="$(git remote get-url origin 2>/dev/null || true)"
case "$url" in
  *sofer/agent-skills*|*sofer/skills*) : ;;
  *) echo "skills-publish: $repo is not a skills authoring clone (origin: ${url:-none})" >&2; exit 1 ;;
esac

# Nothing to do?
if [ -z "$(git status --porcelain)" ] \
   && git rev-parse '@{u}' >/dev/null 2>&1 \
   && [ -z "$(git log --oneline '@{u}..HEAD')" ]; then
  echo "skills-publish: nothing to publish in $repo"
  exit 0
fi

git pull --quiet --ff-only || {
  echo "skills-publish: ff-only pull failed in $repo (diverged from origin) — resolve manually." >&2
  exit 1
}
git add -A
git commit -m "$msg" || true   # tolerate "nothing to commit" when only unpushed commits remain
git push
echo "skills-publish: pushed $repo"
