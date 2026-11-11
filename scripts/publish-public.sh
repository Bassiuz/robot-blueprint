#!/usr/bin/env bash
# Publishes the committed tree as ONE fresh commit to a public GitHub repo, so
# the private history never leaves this machine. local.yaml is gitignored and
# never included.
# Usage: scripts/publish-public.sh <owner/repo> [--dry-run]
set -euo pipefail
cd "$(dirname "$0")/.."

REPO="${1:?usage: scripts/publish-public.sh <owner/repo> [--dry-run]}"

scripts/check-public.sh
[[ -z "$(git status --porcelain)" ]] || { echo "Commit or stash your changes first." >&2; exit 1; }

STAGE="$(mktemp -d)"
git archive HEAD | tar -x -C "$STAGE"
echo "Staged $(git rev-parse --short HEAD) in $STAGE"
[[ "${2:-}" == "--dry-run" ]] && exit 0

cd "$STAGE"
git init -q -b main && git add -A && git commit -qm "Publish $(date -u +%F)"
gh repo view "$REPO" >/dev/null 2>&1 || gh repo create "$REPO" --public
git push -f "https://github.com/$REPO.git" main
echo "Published to https://github.com/$REPO"
