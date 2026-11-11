# Tally

Example product for the Robot Blueprint: a list of named counters. It only has
to prove the point; it is not deployed.

- `app/`: Flutter app (mobile, and web via `app/build-web.sh`).
- `functions/`: Firebase Functions Gen2, TypeScript.
- `site/`: plain HTML landing page, `site/publish-website.sh`.
- `firebase.json`, `firestore.rules`, `firestore.indexes.json`: shared by app and functions.

## Running
```sh
cd app && fvm flutter test
cd functions && npm install && npm test
firebase emulators:start   # then: cd app && fvm flutter run --dart-define=EMULATOR=true
```
Platform folders are not committed; `cd app && fvm flutter create --platforms=ios,android,web .` adds them.
