import 'package:breathing_app/core/route.dart';
import 'package:breathing_app/core/theme/app_colors.dart';
import 'package:breathing_app/core/widgets/app_bar.dart';
import 'package:breathing_app/core/widgets/button.dart';
import 'package:breathing_app/modules/breathing/widgets/settings_panel.dart';
import 'package:flutter/material.dart';

class SetupScreen extends StatelessWidget {
  const SetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const BreathingAppBar(), body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTitle(context),
          const SizedBox(height: 12),
          _buildLabel(context),
          const SizedBox(height: 16),
          const BreathingSettingsPanel(),
          const SizedBox(height: 24),
          _buildButton(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      "Set your breathing pace",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).extension<AppColors>()!.labelPrimary,
        fontSize: 24,
        height: 1.5,
        letterSpacing: 0,
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Text(
      "Customise your breathing session. You can always change this later.",
      textAlign: TextAlign.center,
      style: TextStyle(
        height: 1.5,
        letterSpacing: 0,
        color: Theme.of(context).extension<AppColors>()!.textSecondary,
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return AppButton(
      text: "Start breathing",
      onPressed: () {
        AppRoutes.navigateTo(context, AppRoutes.breathing);
      },
      rightIcon: "breath",
    );
  }
}
