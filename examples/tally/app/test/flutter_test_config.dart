import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Loads real fonts so goldens show type and icons instead of boxes.
/// Tally bundles no font, so Roboto and the icons come from the Flutter SDK;
/// an app with its own fonts loads them from `assets/fonts/` here.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final fonts = '${Platform.environment['FLUTTER_ROOT']}/bin/cache/artifacts/material_fonts';
  ByteData read(String file) => ByteData.sublistView(File('$fonts/$file').readAsBytesSync());

  await (FontLoader('Roboto')
        ..addFont(Future.value(read('Roboto-Regular.ttf')))
        ..addFont(Future.value(read('Roboto-Medium.ttf'))))
      .load();
  await (FontLoader('MaterialIcons')..addFont(Future.value(read('MaterialIcons-Regular.otf')))).load();
  await testMain();
}
