import 'package:breathing_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF630068);

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xFFF7F7F7).withValues(alpha: 0.8),
    fontFamily: "Quicksand",
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16, color: Color(0xFF141414)),
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Color(0xFF141414),
      ),
    ),
    dividerColor: const Color(0xFFF5F5F5),
    extensions: [
      const AppColors(
        surfacePrimary: Color(0xFFF7F7F7),
        surfaceSecondary: Color(0xFFFFF8F0),
        borderPrimary: Color(0xFFF5F5F5),
        borderAccent: Color(0xFFE47B00),
        textPrimary: Color(0xFF141414),
        textSecondary: Color(0xFF737373),
        textAccent: Color(0xFFE47B00),
        labelPrimary: primaryColor,
      ),
    ],
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: "Quicksand",
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Color(0xFFFFFFFF),
      ),
    ),
    dividerColor: const Color(0xFF444444),
    extensions: const [
      AppColors(
        surfacePrimary: Color(0xFF1E1E1E),
        surfaceSecondary: Color(0xFF2C2C2C),
        borderPrimary: Color(0xFF444444),
        borderAccent: Color(0xFFE47B00),
        textPrimary: Color(0xFFFFFFFF),
        textSecondary: Color(0xFFB0B0B0),
        textAccent: Color(0xFFE47B00),
        labelPrimary: Colors.white,
      ),
    ],
  );
}
