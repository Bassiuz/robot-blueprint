import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tally/models/tally.dart';
import 'package:tally/theme/app_theme.dart';
import 'package:tally/widgets/tally_tile.dart';

void main() {
  for (final (name, theme) in [('light', AppTheme.light), ('dark', AppTheme.dark)]) {
    testWidgets('TallyTile $name', (tester) async {
      tester.view.physicalSize = const Size(400, 80);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: Material(
          child: TallyTile(
            tally: const Tally(id: 'a', name: 'Koffie', count: 3),
            onIncrement: () {},
          ),
        ),
      ));

      await expectLater(find.byType(TallyTile), matchesGoldenFile('../goldens/tally_tile_$name.png'));
    });
  }
}
