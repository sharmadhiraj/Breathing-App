import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF630068);

  static const surfacePrimary = Color(0xFFF7F7F7);
  static const surfaceSecondary = Color(0xFFFFF8F0);

  static const borderPrimary = Color(0xFFF5F5F5);
  static const borderAccent = Color(0xFFE47B00);

  static const textPrimary = Color(0xFF141414);
  static const textSecondary = Color(0XFF737373);
  static const textAccent = Color(0xFFE47B00);

  static final ThemeData theme = ThemeData(
    primaryColor: primaryColor,
    fontFamily: "Quicksand",
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16),
      titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    ),
  );
}
