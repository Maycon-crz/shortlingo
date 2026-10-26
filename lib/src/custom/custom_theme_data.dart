import 'package:flutter/material.dart';

class CustomThemeData {
  static const Color primary = Color(0xFF58CC02);

  static ThemeData getAppTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: primary),
      appBarTheme: const AppBarTheme(centerTitle: true),
    );
  }
}
