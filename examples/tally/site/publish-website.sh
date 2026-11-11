#!/usr/bin/env bash
# Publishes this folder to GitHub Pages via a separate -web repo.
# Usage: ./publish-website.sh [--dry-run]
set -euo pipefail

REPO="Bassiuz/tally-site-web"
FILES=(index.html CNAME)

cd "$(dirname "$0")"
STAGE="$(mktemp -d)"
cp -R "${FILES[@]}" "$STAGE/"
touch "$STAGE/.nojekyll"
if [[ "${1:-}" == "--dry-run" ]]; then echo "Dry run: staged in $STAGE"; exit 0; fi

cd "$STAGE"
git init -q -b main && git add -A && git commit -qm "Publish $(date -u +%FT%TZ)"
gh repo view "$REPO" >/dev/null 2>&1 || gh repo create "$REPO" --public
git push -f "git@github.com:$REPO.git" main
gh api -X POST "repos/$REPO/pages" -f "source[branch]=main" -f "source[path]=/" >/dev/null 2>&1 || true
