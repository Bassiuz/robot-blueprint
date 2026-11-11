---
title: Flutter app
description: "fvm, layer folders, ChangeNotifier stores, repositories, golden tests."
---

**Example:** [`examples/tally/app/`](https://github.com/Bassiuz/robot-blueprint/tree/main/examples/tally/app).

## Tooling
- **fvm always.** `.fvmrc` pins the version (`3.47.9`), every command is
  `fvm flutter …` / `fvm dart …`.
- `flutter_lints`, almost no custom rules.
- No melos, no flavors, no Makefile. Small scripts go in `tool/`.
- Store builds through Codemagic (`codemagic.yaml`) when the app ships.

## Layout of `lib/`
Split by layer, no `features/` folder until the app is big:

```
lib/
  main.dart            # Firebase init, emulator switch, runApp
  app.dart             # MaterialApp, theme, providers
  models/              # immutable data classes, fromMap/toMap
  data/                # repositories: the only code that talks to Firestore/DB
  stores/              # ChangeNotifier state, subscribes to repositories
  screens/             # one file per screen
  widgets/             # small reusable widgets
  theme/app_theme.dart # all colours, spacing, text styles
```

## Rules for UI code
- **One class per file**, no private `_Widget` classes.
- **Small widgets.** Screens stay under ~450 lines; split before that.
- **Theme only:** no literal colours or magic numbers in widgets.
- **On-screen text Dutch**, code, comments, logs and tests English.
- `l10n.yaml` with `app_nl.arb` as template only when a second language is real.

## State and DI
- `ChangeNotifier` stores, provided with `provider` (`ChangeNotifierProvider`)
  or a hand-written `InheritedNotifier` scope.
- **Constructor injection** (`TallyRepository(this._db)`). No get_it, no riverpod,
  no bloc, no codegen.
- Navigation with `Navigator.push`. go_router only once deep links matter.

## Data
See [Firebase data handling](/blueprints/firebase-data) and [Local database](/blueprints/local-database).

## Tests
- **Golden for every UI element**, plain `matchesGoldenFile`.
  `test/flutter_test_config.dart` loads the real fonts and Material icons so
  goldens show text, not boxes. Images in `test/goldens/`.
- A golden helper renders each widget in **light and dark**, in Dutch, with a
  fixed clock.
- **Fakes over mocks:** `fake_cloud_firestore` and hand-written `Fake…` classes.
- Pure logic gets plain unit tests in `test/logic/`.
- Integration and video goldens with **jewelry** (own package) on the emulators.
- Run tests with **test_laser**; `fvm flutter test --update-goldens` to refresh.
- Tests are the truth: an agent asks before changing a test.

## Not used any more
bloc, riverpod, freezed, json_serializable, golden_toolkit, mocktail, very_good_analysis.
They came with the 2025 repos and were dropped for less code and no build_runner.
