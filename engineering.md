# Engineering

## Run
- Jaspr CLI: `fvm spawn 3.47.9 dart pub global activate jaspr_cli`, then put
  `~/fvm/versions/3.47.9/bin` and `~/.pub-cache/bin` on `PATH`. The `jaspr`
  wrapper calls plain `dart`, so fvm's Dart must be on `PATH`.
- `cd site && jaspr serve` / `jaspr build`.
- `jaspr build` fails while `jaspr serve` runs in the same folder (shared build
  daemon and the fixed proxy port 5567). Stop the dev server first.
- `scripts/check-public.sh` (also the pre-commit hook), `scripts/publish-public.sh <owner/repo>`,
  `scripts/publish-site.sh` (public build to GitHub Pages; stop `jaspr serve` first).

## Layout
- `blueprints/*.md`, `agentic/*.md`: the content, with front matter (`title`,
  `description`) for the site.
- `site/content/index.md`: the site home; `site/content/{blueprints,agentic}`
  are symlinks.
- `site/lib/main.server.dart`: sidebar and the `<AgentFiles/>` / `<SkillTable/>` tags.
- `site/lib/inventory/`: reads `local.yaml` and scans the agent folders (server side, at build).
- `site/lib/components/`: the views; `file_viewer.dart` is the button + `<dialog>`.
- `examples/tally/`: example code. Not built by anything in this repo.

## Conventions
- English everywhere; Dutch only for on-screen text inside `examples/`.
- A page states the pattern, the why, and points to the example file.
