import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color surfacePrimary;
  final Color surfaceSecondary;
  final Color borderPrimary;
  final Color borderAccent;
  final Color textPrimary;
  final Color textSecondary;
  final Color textAccent;
  final Color labelPrimary;

  const AppColors({
    required this.surfacePrimary,
    required this.surfaceSecondary,
    required this.borderPrimary,
    required this.borderAccent,
    required this.textPrimary,
    required this.textSecondary,
    required this.textAccent,
    required this.labelPrimary,
  });

  @override
  AppColors copyWith({
    Color? surfacePrimary,
    Color? surfaceSecondary,
    Color? borderPrimary,
    Color? borderAccent,
    Color? textPrimary,
    Color? textSecondary,
    Color? textAccent,
    Color? labelPrimary,
  }) {
    return AppColors(
      surfacePrimary: surfacePrimary ?? this.surfacePrimary,
      surfaceSecondary: surfaceSecondary ?? this.surfaceSecondary,
      borderPrimary: borderPrimary ?? this.borderPrimary,
      borderAccent: borderAccent ?? this.borderAccent,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textAccent: textAccent ?? this.textAccent,
      labelPrimary: labelPrimary ?? this.labelPrimary,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      surfacePrimary: Color.lerp(surfacePrimary, other.surfacePrimary, t)!,
      surfaceSecondary: Color.lerp(
        surfaceSecondary,
        other.surfaceSecondary,
        t,
      )!,
      borderPrimary: Color.lerp(borderPrimary, other.borderPrimary, t)!,
      borderAccent: Color.lerp(borderAccent, other.borderAccent, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textAccent: Color.lerp(textAccent, other.textAccent, t)!,
      labelPrimary: Color.lerp(labelPrimary, other.labelPrimary, t)!,
    );
  }
}
