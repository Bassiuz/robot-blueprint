/// A named counter. Stored in the `tallies` collection.
class Tally {
  const Tally({required this.id, required this.name, required this.count});

  factory Tally.fromMap(String id, Map<String, dynamic> data) => Tally(
        id: id,
        name: data['name'] as String? ?? '',
        count: (data['count'] as num?)?.toInt() ?? 0,
      );

  final String id;
  final String name;
  final int count;

  Map<String, dynamic> toMap() => {'name': name, 'count': count};

  Tally copyWith({String? name, int? count}) =>
      Tally(id: id, name: name ?? this.name, count: count ?? this.count);
}
