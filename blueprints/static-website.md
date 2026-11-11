---
title: Static website
description: "Plain HTML, no build step, GitHub Pages."
---

**Example:** [`examples/tally/site/`](https://github.com/Bassiuz/robot-blueprint/tree/main/examples/tally/site).

## Stack
- **Plain HTML + CSS**, no framework, no build. One `index.html` per page;
  sub-pages are folders with their own `index.html` (`privacy/index.html`).
- CSS custom properties as design tokens (`--tally-ink`, `--tally-accent`), one
  shared stylesheet when there is more than one page.
- Fonts self-hosted as woff2 in `fonts/` and preloaded, with the hero image.
- JS only when needed, as plain ES modules. Firebase (read-only) is imported
  from gstatic as ES modules, no bundler.
- `prefers-reduced-motion` respected for any motion.
- For a premium landing page: the **scroll-craft** skill, then **unslop ui**.

## Content and SEO
- Dutch on-screen text, `lang="nl"`, `og:locale nl_NL`.
- `<meta name="description">` and full OpenGraph tags on every page.
- Data that changes lives in a `data.json` / `data.js` next to the HTML, not in a CMS.

## Deploy
GitHub Pages, from a separate `Bassiuz/<name>-web` repo, with DNS on Cloudflare.
`publish-website.sh` (copy from the example):

1. Stage the site into a temp dir, add `CNAME` and `.nojekyll`.
2. `git init` there, commit, force-push to the `-web` repo.
3. `gh api` enables Pages on first run. `--dry-run` stops before the push.

## Not used
Astro, Next, Tailwind, Firebase Hosting, Cloudflare Pages. No sitemap or robots.txt yet.

## Experiment
This repo's own site uses **Jaspr** (`jaspr_content`). See `decisions.md`.
