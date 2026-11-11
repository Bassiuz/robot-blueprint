---
title: Local database
description: "shared_preferences for small state, sqflite with versioned migrations for real data."
---

## Pick the smallest
1. **Firestore offline cache** when the data is already in Firestore. Nothing to add.
2. **`shared_preferences`** for settings and small state. On web this is
   localStorage, which is enough to run a web app with no backend.
3. **`sqflite` with hand-written SQL** when there is real local data.

Not used: drift, isar, hive. The work app uses `hive_ce` with all type ids in one
file; that is the reference if a typed box store is ever needed.

## sqflite migrations
One `Db` class owns the database. The version is a constant, upgrades are
additive and guarded, so a half-migrated database recovers:

```dart
class TallyDatabase {
  static const _version = 2;

  static Future<Database> open(String path) => openDatabase(
        path,
        version: _version,
        onCreate: (db, _) async {
          await db.execute('CREATE TABLE tally (id TEXT PRIMARY KEY, name TEXT, count INTEGER)');
          await _upgrade(db, 1);
        },
        onUpgrade: (db, from, _) => _upgrade(db, from),
      );

  static Future<void> _upgrade(Database db, int from) async {
    if (from < 2 && !await _hasColumn(db, 'tally', 'colour')) {
      await db.execute('ALTER TABLE tally ADD COLUMN colour TEXT');
    }
  }

  static Future<bool> _hasColumn(Database db, String table, String column) async {
    final rows = await db.rawQuery('PRAGMA table_info($table)');
    return rows.any((r) => r['name'] == column);
  }
}
```

- Never edit an old step; add `if (from < N)`.
- A test opens a version-1 database, upgrades it and checks the columns
  (`sqflite_common_ffi` in tests, `test/db_test.dart`).
- Server side (Python on lifebase): SQLite on a `/data` volume, same rule.
