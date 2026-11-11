---
title: Flutter web app
description: "Same app structure, built with build-web.sh, published to GitHub Pages."
---

**Example:** [`examples/tally/app/build-web.sh`](https://github.com/Bassiuz/robot-blueprint/blob/main/examples/tally/app/build-web.sh), [`examples/tally/app/web/CNAME`](https://github.com/Bassiuz/robot-blueprint/blob/main/examples/tally/app/web/CNAME).

A Flutter web app is the [Flutter app](/blueprints/flutter-app) blueprint plus a
deploy script. Everything under `lib/` is the same.

## Build
```
fvm flutter build web --release --no-tree-shake-icons --pwa-strategy=none \
  --dart-define=SOME_KEY=$SOME_KEY
```
- `--pwa-strategy=none`: the service-worker cache delayed deploys.
- `--no-tree-shake-icons`: icons picked at runtime would otherwise go missing.
- Config through `--dart-define`; the script refuses to build when a required key is empty.

## Deploy
`build-web.sh` stages `build/web`, copies `index.html` to `404.html` (deep
links on Pages), adds `.nojekyll`, `git init`s and force-pushes to
`Bassiuz/<app>-web`. The custom domain is `web/CNAME` (`<app>.basdevaan.nl`).

## Web-only apps
- No backend at all is fine: `shared_preferences` is localStorage on web.
- Platform-specific code in a pair of files picked by conditional import:
  `web_platform_web.dart` / `web_platform_io.dart`.

## Not used
Firebase Hosting. Every web build goes to GitHub Pages.
