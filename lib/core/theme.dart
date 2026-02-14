import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF630068);

  static final ThemeData theme = ThemeData(
    primaryColor: primaryColor,
    fontFamily: 'Quicksand',
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16),
      titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    ),
  );
}
