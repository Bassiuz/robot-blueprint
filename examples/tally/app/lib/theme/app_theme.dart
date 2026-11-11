import 'package:flutter/material.dart';

/// All colours and spacing. Widgets never use literal values.
abstract final class AppTheme {
  static const seed = Color(0xFF2F6B4F);
  static const gap = 12.0;

  static final light = ThemeData(colorSchemeSeed: seed, brightness: Brightness.light);
  static final dark = ThemeData(colorSchemeSeed: seed, brightness: Brightness.dark);
}
