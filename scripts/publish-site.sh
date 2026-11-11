#!/usr/bin/env bash
# Builds the PUBLIC site (no local.yaml content) and force-pushes it to the
# gh-pages branch of the public repo. With DOMAIN set it is served there;
# without, at https://bassiuz.github.io/robot-blueprint/ (links get that prefix).
# Usage: [DOMAIN=robotblueprint.basdevaan.nl] scripts/publish-site.sh [--dry-run]
set -euo pipefail
cd "$(dirname "$0")/../site"

REPO="Bassiuz/robot-blueprint"
DOMAIN="${DOMAIN:-}"  # ponytail: set to robotblueprint.basdevaan.nl once its DNS resolves

FLUTTER="$(sed -E 's/.*"flutter": *"([^"]+)".*/\1/' .fvmrc)"
export PATH="$HOME/fvm/versions/$FLUTTER/bin:$HOME/.pub-cache/bin:$PATH"

ROBOT_PUBLIC=1 jaspr build
cd build/jaspr
# Guard: a public build renders no file dialogs at all.
if grep -rlq 'class="rb-dialog' .; then echo "Private file content in the build; aborting." >&2; exit 1; fi
if [[ -n "$DOMAIN" ]]; then
  echo "$DOMAIN" > CNAME
else
  # Project pages live under /<repo>/; Jaspr has no base-href, so prefix root links.
  BASE="/${REPO#*/}"
  find . -name '*.html' -exec sed -i '' -E "s#(href|src)=\"/([^/])#\1=\"$BASE/\2#g; s#(href|src)=\"/\"#\1=\"$BASE/\"#g" {} +
fi
touch .nojekyll
[[ "${1:-}" == "--dry-run" ]] && { echo "Dry run: built in $(pwd)"; exit 0; }

rm -rf .git && git init -q -b gh-pages && git add -A && git commit -qm "Site $(date -u +%F)"
git push -f "https://github.com/$REPO.git" gh-pages
# Pushing gh-pages usually enables Pages already; create only when it didn't.
gh api "repos/$REPO/pages" >/dev/null 2>&1 ||
  gh api -X POST "repos/$REPO/pages" -f "source[branch]=gh-pages" -f "source[path]=/" >/dev/null 2>&1 || true
if [[ -n "$DOMAIN" ]]; then
  gh api -X PUT "repos/$REPO/pages" -f "cname=$DOMAIN" >/dev/null
  echo "Published https://$DOMAIN"
else
  gh api -X PUT "repos/$REPO/pages" -F "cname=null" >/dev/null
  echo "Published https://${REPO%%/*}.github.io$BASE/" | tr '[:upper:]' '[:lower:]'
fi
