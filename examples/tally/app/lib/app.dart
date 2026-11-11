import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/tally_repository.dart';
import 'screens/tally_screen.dart';
import 'stores/tally_store.dart';
import 'theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key, required this.firestore});

  final FirebaseFirestore firestore;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TallyStore(TallyRepository(firestore))..start(),
      child: MaterialApp(
        title: 'Tally',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        home: const TallyScreen(),
      ),
    );
  }
}
