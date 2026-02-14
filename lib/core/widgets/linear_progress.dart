import 'package:breathing_app/core/theme/theme.dart';
import 'package:flutter/material.dart';

class AppLinearProgress extends StatelessWidget {
  final double progress;

  const AppLinearProgress({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      width: double.maxFinite,
      height: 8,
      decoration: BoxDecoration(
        color: const Color(0xFFEFE6F0),
        borderRadius: BorderRadius.circular(4),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
