import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/tally.dart';

/// The only class that talks to the `tallies` collection.
class TallyRepository {
  TallyRepository(this._db);

  final FirebaseFirestore _db;

  CollectionReference<Map<String, dynamic>> get _tallies => _db.collection('tallies');

  Stream<List<Tally>> watchTallies() => _tallies
      .orderBy('name')
      .snapshots()
      .map((snap) => [for (final doc in snap.docs) Tally.fromMap(doc.id, doc.data())]);

  Future<void> saveTally(Tally tally) => _tallies.doc(tally.id).set(tally.toMap());

  Future<void> deleteTally(String id) => _tallies.doc(id).delete();
}
