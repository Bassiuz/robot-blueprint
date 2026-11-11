#!/usr/bin/env bash
# Fails when a tracked file names a private project. The names come from the
# repo roots and the deny list in local.yaml, so they are never committed here.
# Usage: scripts/check-public.sh [--staged]
set -euo pipefail
cd "$(dirname "$0")/.."

# Process tools that may be named in public, and folder names that are plain words.
ALLOW='^(harbas|agent_petting_zoo|review_coach|project-composer|lifebase|jewelry|test_laser|build_laser|robot_blueprint|assets|tools|equatable|sealed)$'

[[ -f local.yaml ]] || { echo "check-public: no local.yaml, nothing to check against" >&2; exit 0; }

names=$(
  awk '/^[a-z_]+:/{section=$1} section=="repo_roots:" && $1=="dir:"{print $2} ' local.yaml |
    while read -r dir; do ls "${dir/#\~/$HOME}"; done
  awk '/^[a-z_]+:/{section=$1} section=="deny:" && $1=="-"{print $2}' local.yaml
)

if [[ "${1:-}" == "--staged" ]]; then
  files=$(git diff --cached --name-only --diff-filter=ACMR)
else
  files=$(git ls-files --cached --others --exclude-standard)
fi
[[ -z "$files" ]] && exit 0

found=0
while read -r name; do
  base="${name%.*}"; [[ "$name" == *.zip ]] || base="$name"
  [[ -z "$base" || ${#base} -lt 4 ]] && continue
  echo "$base" | grep -qiE "$ALLOW" && continue
  pattern="(^|[^A-Za-z0-9])$(echo "$base" | sed 's/[][\.*^$]/\\&/g; s/[_ -]/[_ -]/g')([^A-Za-z0-9]|$)"
  hits=$(echo "$files" | grep -v '^local' | tr '\n' '\0' | xargs -0 grep -IinE "$pattern" 2>/dev/null || true)
  if [[ -n "$hits" ]]; then
    found=1
    echo "== $base"; echo "$hits" | head -20
  fi
done <<< "$names"

if [[ $found -eq 1 ]]; then
  echo "check-public: private names found (see above)." >&2
  exit 1
fi
echo "check-public: clean"
