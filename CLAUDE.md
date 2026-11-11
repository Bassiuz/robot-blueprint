# Robot Blueprint

Read `README.md`, `decisions.md`, `engineering.md` first.

- This repo documents how Bas builds. When you change a blueprint, check the
  example in `examples/tally/` still matches it, and the other way round.
- Paths into `examples/` or `templates/` in a page are links to the file on GitHub
  (`https://github.com/Bassiuz/robot-blueprint/{tree,blob}/main/...`).
- Every page in `blueprints/` and `agentic/` needs `title` front matter and a
  sidebar link in `site/lib/main.server.dart`.
- `agentic/files` and the skill table are rendered from disk by `site/lib/inventory/`; nothing is generated into the repo.
- No secrets, account emails, work detail or names of personal projects in tracked files.
  `scripts/check-public.sh` enforces this (pre-commit hook); only process tools
  (Harbas, Agent Petting Zoo, Review Coach, Project Composer, lifebase, jewelry,
  test_laser, build_laser) may be named. Machine-specific content is read from
  the gitignored `local.yaml` at build time.
- Personal project: agents may commit and push. No AI attribution in commits.
