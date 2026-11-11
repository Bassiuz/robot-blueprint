import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tally/data/tally_repository.dart';
import 'package:tally/models/tally.dart';

void main() {
  test('saved tallies come back sorted by name', () async {
    final repository = TallyRepository(FakeFirebaseFirestore());

    await repository.saveTally(const Tally(id: 'b', name: 'Thee', count: 1));
    await repository.saveTally(const Tally(id: 'a', name: 'Koffie', count: 3));

    final tallies = await repository.watchTallies().first;
    expect([for (final t in tallies) t.name], ['Koffie', 'Thee']);
    expect(tallies.first.count, 3);
  });
}
