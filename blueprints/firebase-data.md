---
title: Firebase data handling
description: "One repository per collection, plain models, rules in the repo, emulators by flag."
---

**Example:** [`examples/tally/app/lib/data/`](https://github.com/Bassiuz/robot-blueprint/tree/main/examples/tally/app/lib/data), [`examples/tally/firestore.rules`](https://github.com/Bassiuz/robot-blueprint/blob/main/examples/tally/firestore.rules).

## Projects
- **One Firebase project per product.** `.firebaserc` has only `default`.
- No dev/prod split for personal projects. Add one (two projects, `.firebaserc`
  aliases, `main_dev.dart` / `main_prod.dart`) only when real users can be hurt
  by testing. That is the work setup.
- A small side tool may live in a bigger product's project with a collection
  prefix (`tool_…`), and merges its rules into that ruleset.

## Repositories
- One class per collection or area in `lib/data/<thing>_repository.dart`.
- It is **the only code that imports `cloud_firestore`** for that data.
- `FirebaseFirestore` comes in through the constructor, so tests pass a
  `FakeFirebaseFirestore`.
- It exposes `Stream<List<T>> watchX()` and `Future<void> saveX(T)` /
  `deleteX(id)`. A `ChangeNotifier` store subscribes to the stream.
- No interface + implementation pair unless there is a second implementation.

## Models
- Hand-written immutable classes, one per file in `lib/models/`.
- `factory Tally.fromMap(String id, Map<String, dynamic> data)` and
  `Map<String, dynamic> toMap()`. No `withConverter`, no codegen.
- Defensive reads: `(data['count'] as num?)?.toInt() ?? 0`.

## Paths
- Top-level collections. Owner-only data in a subcollection
  (`users/{uid}/private/…`), lookup collections for joins (`codes/{code}`).
- The schema is written down as a tree in `engineering.md` ("Firestore model").

## Rules and indexes
- `firestore.rules` and `firestore.indexes.json` at the repo root, wired in `firebase.json`.
- Helpers `isSignedIn()`, `isOwner(uid)`; field validation with
  `keys().hasOnly([...])` and `diff().affectedKeys()`.
- Rules tests with `@firebase/rules-unit-testing` under `firebase emulators:exec`
  (`test/rules/`).
- Never ship the expiring test-mode rule.

## Emulators
- `--dart-define=EMULATOR=true` switches the app to the emulators; Android uses
  `10.0.2.2`. Bind to `0.0.0.0` to test on a real device.

## Writes through functions
Derived data (totals, counters) is written by a function, not by the client,
so the rules can forbid client writes to it. The work web client goes further:
it only reads, and every write is a function call.
