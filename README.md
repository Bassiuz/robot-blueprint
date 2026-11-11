# Robot Blueprint

The starting point for every new project Bas sets up with an AI agent, and the
map of how he works with agents.

- `blueprints/`: one page per project type (static website, Flutter app,
  Flutter web app, cloud functions), plus the cross-cutting pages: Firebase
  data handling, local databases, repository split.
- `examples/tally/`: one small product, **Tally**, built from all four
  blueprints at once. It only has to prove the point, not ship.
- `templates/`: the files copied into every new repo (`CLAUDE.md`,
  `decisions.md`, `engineering.md`, `README.md`).
- `agentic/`: the agentic coding setup: toolkit, agents, skills, retired
  skills, config and hooks, rules, and every rule and memory file on the machine
  (read at build time, never committed).
- `site/`: a Jaspr static site that renders `blueprints/` and `agentic/`.

## Starting a new project

1. Pick the blueprint(s) in `blueprints/`.
2. Copy `templates/*` into the new repo and fill the blanks.
3. Point the agent at the blueprint page and the matching folder in `examples/tally/`.

## Site

```sh
scripts/serve-site.sh       # http://localhost:4747
cd site && jaspr build      # output in site/build/jaspr
```

`jaspr` is installed with fvm's Dart; see `engineering.md`.

## Private and public
- `cp local.example.yaml local.yaml` and point it at your agent config folders
  and repo folders. The site reads it at build time; it is gitignored.
- `git config core.hooksPath .githooks` once: the pre-commit hook runs
  `scripts/check-public.sh`, which blocks private project names.
- `scripts/publish-public.sh <owner/repo>` pushes a squashed snapshot to a public repo.
