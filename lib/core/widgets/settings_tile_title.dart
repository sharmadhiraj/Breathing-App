import 'package:breathing_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsTileTitle extends StatelessWidget {
  const SettingsTileTitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 1.5,
        letterSpacing: 0,
        color: Theme.of(context).extension<AppColors>()!.textPrimary,
      ),
    );
  }
}
