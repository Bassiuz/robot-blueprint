---
title: Cloud functions
description: "Firebase Functions Gen2 in TypeScript, one function per file, pure logic apart."
---

**Example:** [`examples/tally/functions/`](https://github.com/Bassiuz/robot-blueprint/tree/main/examples/tally/functions).

## Stack
- **Gen2 only** (`firebase-functions/v2`), TypeScript, Node 22.
- Region set once: `setGlobalOptions({ region: "europe-west4" })`.
- `functions/` lives inside the product repo, next to `app/`.

## Layout
```
functions/
  src/
    index.ts             # only re-exports
    onTallyWritten.ts    # one function per file, named after the trigger
    addTally.ts          # onCall
    totals.ts            # pure logic, no Firebase imports
    totals.test.ts       # node --test
  package.json           # build, test, serve, deploy
  tsconfig.json          # outDir lib/
```

## Rules
- **Pure logic in Firebase-free modules**, so it tests with `node --test`
  and no emulator.
- `onCall` for app actions, `onDocumentWritten` for derived data,
  `onSchedule` for jobs. `onRequest` only for outside callers.
- Callables check `request.auth` first and validate input before touching data.
- Secrets with `defineSecret("NAME")`, never in code or `.env` in git.
- One-off admin scripts in `functions/scripts/`, run by hand.

## Emulators and deploy
- `firebase.json` emulators: auth 9099, firestore 8080, functions 5001,
  storage 9199, `singleProjectMode: true`.
- `npm test` builds and runs `node --test lib/*.test.js`.
- Deploy pins project **and** account, so the work account (the gcloud/firebase
  default) is never used for personal projects:
  `firebase deploy --only functions --project <id> --account <personal account>`.

## When it grows (the work pattern)
The work codebase shows where this goes at scale: entries → handlers →
services, a shared `BaseRepository<T>` with mappers between camelCase models and
stored documents, constructor injection with production defaults, one Firebase
*codebase* per feature, features talking through domain events on Pub/Sub,
Vitest against the Firestore emulator. Adopt a piece only when the pain shows up.

## Other backends
- **Python service on lifebase**: `server/` next to `app/`, `python:3.12-slim`,
  SQLite on a `/data` volume, pytest, deployed in a lifebase Compose stack and
  reached over Tailscale.
- **Local tool**: Nuxt 4 + Nitro + better-sqlite3 + Vitest, pnpm, launchd
  autostart (harbas, agent_petting_zoo, review_coach).
