import 'package:breathing_app/core/route.dart';
import 'package:breathing_app/core/widgets/app_bar.dart';
import 'package:breathing_app/core/widgets/button.dart';
import 'package:breathing_app/core/widgets/linear_progress.dart';
import 'package:breathing_app/core/widgets/settings_tile_subtitle.dart';
import 'package:breathing_app/core/widgets/settings_tile_title.dart';
import 'package:breathing_app/modules/breathing/widgets/bubble.dart';
import 'package:flutter/material.dart';

class BreathingScreen extends StatelessWidget {
  const BreathingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const BreathingAppBar(), body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeaderLabel(),
          _buildBubble(),
          const SettingsTileTitle(title: "Breath In"),
          const SettingsTileSubtitle(title: "Nice and slow"),
          const SizedBox(height: 28),
          const AppLinearProgress(progress: 0.5),
          const SizedBox(height: 8),
          _buildCycleLabel(),
          const SizedBox(height: 28),
          AppButton(
            text: "Resume",
            onPressed: () {
              AppRoutes.navigateToReplacement(context, AppRoutes.finish);
            },
            leftIcon: "play",
            backgroundColor: const Color(0xFFEFE6F0),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderLabel() {
    return const Text(
      "You're a natural",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        fontSize: 14,
        height: 1.5,
        letterSpacing: 0,
      ),
    );
  }

  Widget _buildCycleLabel() {
    return const Text(
      "Cycle 1 of 4",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        height: 1.5,
        fontSize: 12,
        letterSpacing: 0,
        color: Color(0XFF630068),
      ),
    );
  }

  Widget _buildBubble() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
      child: const Bubble(value: 1),
    );
  }
}
