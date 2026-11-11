import 'package:flutter/material.dart';

import '../models/tally.dart';

class TallyTile extends StatelessWidget {
  const TallyTile({super.key, required this.tally, required this.onIncrement});

  final Tally tally;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return ListTile(
      title: Text(tally.name),
      subtitle: Text('${tally.count} keer'),
      trailing: IconButton.filledTonal(
        tooltip: 'Eén erbij',
        icon: const Icon(Icons.add),
        onPressed: onIncrement,
      ),
      leading: Text('${tally.count}', style: text.headlineSmall),
    );
  }
}
