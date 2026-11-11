import 'dart:async';

import 'package:flutter/foundation.dart';

import '../data/tally_repository.dart';
import '../models/tally.dart';

/// Screen state for the tally list. Subscribes to the repository stream.
class TallyStore extends ChangeNotifier {
  TallyStore(this._repository);

  final TallyRepository _repository;
  StreamSubscription<List<Tally>>? _sub;

  List<Tally> tallies = const [];

  void start() {
    _sub ??= _repository.watchTallies().listen((value) {
      tallies = value;
      notifyListeners();
    });
  }

  Future<void> increment(Tally tally) => _repository.saveTally(tally.copyWith(count: tally.count + 1));

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
