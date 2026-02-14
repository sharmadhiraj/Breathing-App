import 'package:breathing_app/core/route.dart';
import 'package:breathing_app/core/theme/app_colors.dart';
import 'package:breathing_app/core/widgets/app_bar.dart';
import 'package:breathing_app/core/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const BreathingAppBar(), body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
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
          Text(
            "You did it! 🎉",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              height: 1.5,
              letterSpacing: 0,
              color: colors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Great rounds of calm, just like that. Your mind thanks you.",
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.5,
              letterSpacing: 0,
              color: colors.textSecondary,
            ),
          ),

          const SizedBox(height: 32),
          AppButton(
            text: "Start again",
            onPressed: () =>
                AppRoutes.navigateToReplacement(context, AppRoutes.breathing),
            rightIcon: "breath",
          ),
          const SizedBox(height: 32),
          AppButton(
            text: "Back to set up",
            onPressed: () => AppRoutes.goBack(context),
            backgroundColor: colors.borderPrimary,
            textColor: colors.textPrimary,
          ),
        ],
      ),
    );
  }
}
