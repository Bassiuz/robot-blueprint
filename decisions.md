# Decisions

## 2026-11-11 One example product for all blueprints
**Why:** Bas's real projects are one product per repo with `app/`, `functions/`,
`site/` side by side. One example (Tally) shows the blueprints *and* the repo
split at once, and avoids four copies of the same models.
**Revisit when:** a blueprint needs something Tally can't show (e.g. a Python
lifebase server).

## 2026-11-11 Blueprints follow the newest repos, not the majority
The 2025 repos use bloc/riverpod, freezed, golden_toolkit and mocktail. The
2026 repos dropped all of that. The blueprints follow
the 2026 style.
**Revisit when:** a new project needs codegen again.

## 2026-11-11 Static website blueprint stays plain HTML; Jaspr is only this repo's site
Every live site is hand-written HTML or Flutter web on GitHub Pages. This repo's
site is the Jaspr experiment (`jaspr_content` docs template). If it holds up,
the static-website blueprint can get a Jaspr variant.
**Revisit when:** the Jaspr site has been used for a month.

## 2026-11-11 The site renders the repo's markdown through symlinks
`site/content/blueprints` and `site/content/agentic` are symlinks to the
top-level folders, so there is one copy of every page and GitHub shows the same
text.

## 2026-11-11 Tracked files are public; private content is read at build time
The repo is published to a public GitHub repo, so tracked files name no
personal project (only process tools like Harbas, Agent Petting Zoo, Review
Coach) and no work detail. The rule, memory and skill lists are read from disk
by the site at build time, using the gitignored `local.yaml`. Without it (the
public repo, or `ROBOT_PUBLIC=1`) those pages show a note instead.
`scripts/check-public.sh` runs as a pre-commit hook; it takes the names to block
from the repo folders in `local.yaml`, so the block list itself is never committed.
**Why:** one repo instead of a private and a public copy drifting apart.

## 2026-11-11 Publishing is a squashed snapshot
`scripts/publish-public.sh <owner/repo>` pushes the committed tree as one fresh
commit. The private history (which did name projects before the scrub) never leaves.

## 2026-11-11 Raw files open in a native `<dialog>`
Every file is rendered into the page at build time; a button calls
`showModal()`, a `<form method="dialog">` closes it. No client-side Jaspr
component, no fetch.
**Revisit when:** the pages get too heavy (files ~0.8 MB, skills ~1.2 MB today).

## 2026-11-11 Work patterns are recorded, not copied
Work patterns (contract repo with generated models, one Firebase codebase per
feature, domain events) appear in `blueprints/repo-split.md` as "when it grows",
without names or business detail.

## 2026-11-11 Site on GitHub Pages from the public repo's gh-pages branch
`scripts/publish-site.sh` builds with `ROBOT_PUBLIC=1`, refuses to publish if any
file dialog is in the output, and force-pushes to `gh-pages` of the public repo,
served at robotblueprint.basdevaan.nl (DNS: CNAME to bassiuz.github.io).
**Why:** the source is already public, so a separate `-web` repo adds nothing here.
