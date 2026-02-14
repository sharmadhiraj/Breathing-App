import 'package:breathing_app/core/theme.dart';
import 'package:breathing_app/core/widgets/button.dart';
import 'package:breathing_app/modules/breathing/widgets/settings_panel.dart';
import 'package:flutter/material.dart';

class BreathingSetupScreen extends StatelessWidget {
  const BreathingSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar();
  }

  Widget _buildBody() {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTitle(),
          const SizedBox(height: 12),
          _buildLabel(),
          const SizedBox(height: 16),
          const BreathingSettingsPanel(),
          const SizedBox(height: 24),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      "Set your breathing pace",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppTheme.primaryColor,
        fontSize: 24,
        height: 1.5,
        letterSpacing: 0,
      ),
    );
  }

  Widget _buildLabel() {
    return const Text(
      "Customise your breathing session. You can always change this later.",
      textAlign: TextAlign.center,
      style: TextStyle(
        height: 1.5,
        letterSpacing: 0,
        color: AppTheme.textSecondary,
      ),
    );
  }

  Widget _buildButton() {
    return AppButton(
      text: "Start breathing",
      onPressed: () {},
      rightIcon: "breath",
    );
  }
}
