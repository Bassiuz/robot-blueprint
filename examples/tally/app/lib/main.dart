import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'data/emulator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ponytail: run `flutterfire configure` to add firebase_options.dart.
  await Firebase.initializeApp();
  await useEmulatorsIfRequested();
  runApp(App(firestore: FirebaseFirestore.instance));
}
