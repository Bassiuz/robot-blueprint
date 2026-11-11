#!/usr/bin/env bash
# Builds the web app and force-pushes it to the GitHub Pages repo.
# Usage: ./build-web.sh [--dry-run]
set -euo pipefail

PAGES_REPO="git@github.com:Bassiuz/tally-web.git"

cd "$(dirname "$0")"
fvm flutter build web --release --no-tree-shake-icons --pwa-strategy=none

cd build/web
cp index.html 404.html   # deep links on GitHub Pages
touch .nojekyll          # CNAME comes from web/CNAME
if [[ "${1:-}" == "--dry-run" ]]; then echo "Dry run: built into $(pwd)"; exit 0; fi
rm -rf .git && git init -q -b main && git add -A && git commit -qm "Deploy $(date -u +%FT%TZ)"
git push -f "$PAGES_REPO" main
