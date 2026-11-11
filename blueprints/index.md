---
title: Blueprints
description: "Subject-neutral starting points per project type."
---

Every blueprint follows the **newest** personal repos (2026), not the older
majority. The example for all of them is
**Tally** in [`examples/tally/`](https://github.com/Bassiuz/robot-blueprint/tree/main/examples/tally): a list of named counters, with an app, a web
build, a cloud function and a landing page.

| Project type | Page | Example |
|---|---|---|
| Static website | [Static website](/blueprints/static-website) | [`examples/tally/site/`](https://github.com/Bassiuz/robot-blueprint/tree/main/examples/tally/site) |
| Flutter app | [Flutter app](/blueprints/flutter-app) | [`examples/tally/app/`](https://github.com/Bassiuz/robot-blueprint/tree/main/examples/tally/app) |
| Flutter web app | [Flutter web app](/blueprints/flutter-web-app) | [`examples/tally/app/build-web.sh`](https://github.com/Bassiuz/robot-blueprint/blob/main/examples/tally/app/build-web.sh) |
| Cloud functions | [Cloud functions](/blueprints/cloud-functions) | [`examples/tally/functions/`](https://github.com/Bassiuz/robot-blueprint/tree/main/examples/tally/functions) |

Cross-cutting:

- [Firebase data handling](/blueprints/firebase-data): repositories, models, rules, emulators.
- [Local database](/blueprints/local-database): shared_preferences, sqflite, migrations.
- [Repository split](/blueprints/repo-split): one repo per product, and when to split.

Every repo, whatever the type, starts with the four files in [`templates/`](https://github.com/Bassiuz/robot-blueprint/tree/main/templates):
`README.md`, `CLAUDE.md`, `decisions.md`, `engineering.md`.
