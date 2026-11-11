# Engineering

## Run
- App tests: `cd app && fvm flutter test` (`--update-goldens` to refresh).
- Functions tests: `cd functions && npm test` (pure logic, no emulator).
- Emulators: `firebase emulators:start`; app with `--dart-define=EMULATOR=true`.

## Layout
- `app/lib/models`: `Tally`. `app/lib/data`: `TallyRepository`, emulator switch.
  `app/lib/stores`: `TallyStore`. `app/lib/screens`, `app/lib/widgets`, `app/lib/theme`.
- `functions/src`: one function per file, pure logic in `totals.ts`.

## Firestore model
```
tallies/{id}      name: string, count: int, owner: uid
meta/totals       tallies: int, count: int   (written by onTallyWritten)
```

## Known ceilings
- `meta/totals` is one document: about one write per second. Shard it if tallies get busy.
