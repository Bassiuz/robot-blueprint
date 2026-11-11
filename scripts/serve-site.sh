#!/usr/bin/env bash
# Runs the Jaspr dev server with fvm's Dart on PATH (the jaspr wrapper calls plain `dart`).
set -euo pipefail
cd "$(dirname "$0")/../site"
FLUTTER="$(sed -E 's/.*"flutter": *"([^"]+)".*/\1/' .fvmrc)"
export PATH="$HOME/fvm/versions/$FLUTTER/bin:$HOME/.pub-cache/bin:$PATH"
exec jaspr serve "$@"
