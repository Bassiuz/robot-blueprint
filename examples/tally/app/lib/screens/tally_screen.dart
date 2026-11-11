import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../stores/tally_store.dart';
import '../widgets/tally_tile.dart';

class TallyScreen extends StatelessWidget {
  const TallyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<TallyStore>();
    return Scaffold(
      appBar: AppBar(title: const Text('Turflijst')),
      body: store.tallies.isEmpty
          ? const Center(child: Text('Nog niets geturfd'))
          : ListView(
              children: [
                for (final tally in store.tallies)
                  TallyTile(tally: tally, onIncrement: () => store.increment(tally)),
              ],
            ),
    );
  }
}
