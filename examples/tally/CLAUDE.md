# Tally

Read `README.md`, `decisions.md` and `engineering.md` before changing anything.
Record new decisions in `decisions.md`, new commands or gotchas in `engineering.md`.

## Working
- Analysis before action: when asked "why" or "look at", report and stop.
- Verified means observed: say what you actually ran and saw. Tests passing is not proof a feature works.
- Do what was asked, not more. New ideas go to the inbox (Harbas / zoo), not into this change.
- Personal project: commit and push are fine. Never add AI attribution to commits or PRs.

## Code
- English in code, comments, tests, logs and docs. Dutch only for on-screen text.
- Delete unused code. No abstractions with one implementation.
- Flutter: always `fvm flutter` / `fvm dart`. Never edit generated files.
- One class per file, no private `_Widget` classes, small widgets.
- Colours, spacing and text styles come from the app theme, never literals.

## Tests
- A golden test for every UI element; a unit test for every piece of logic.
- Write a test before refactoring.
- Tests are the truth: ask before changing an existing test.
