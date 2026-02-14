import 'package:breathing_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsTileSubtitle extends StatelessWidget {
  const SettingsTileSubtitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.5,
        letterSpacing: 0,
        color: Theme.of(context).extension<AppColors>()!.textSecondary,
      ),
    );
  }
}
