import 'package:breathing_app/core/theme.dart';
import 'package:breathing_app/core/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FinishBreathingScreen extends StatelessWidget {
  const FinishBreathingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            "assets/animations/complete.json",
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
          const Text(
            "You did it! 🎉",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              height: 1.5,
              letterSpacing: 0,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Great rounds of calm, just like that. Your mind thanks you.",
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.5,
              letterSpacing: 0,
              color: AppTheme.textSecondary,
            ),
          ),

          const SizedBox(height: 32),
          AppButton(text: "Start again", onPressed: () {}, rightIcon: "breath"),
          const SizedBox(height: 32),
          AppButton(
            text: "Back to set up",
            onPressed: () {},
            backgroundColor: AppTheme.borderPrimary,
            textColor: AppTheme.textPrimary,
          ),
        ],
      ),
    );
  }
}
