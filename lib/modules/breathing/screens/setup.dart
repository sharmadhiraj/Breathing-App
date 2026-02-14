import 'package:breathing_app/core/theme.dart';
import 'package:breathing_app/core/widgets/button.dart';
import 'package:breathing_app/core/widgets/option_chips.dart';
import 'package:breathing_app/modules/breathing/widgets/settings_tile_subtitle.dart';
import 'package:breathing_app/modules/breathing/widgets/settings_tile_title.dart';
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
          SizedBox(height: 12),
          _buildLabel(),
          SizedBox(height: 16),
          _buildSettingsPanel(),
          SizedBox(height: 16),
          Align(
            child: AppButton(text: "Start breathing", onPressed: () {}),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
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
    return Text(
      "Customise your breathing session. You can always change this later.",
      textAlign: TextAlign.center,
      style: TextStyle(height: 1.5, letterSpacing: 0, color: Color(0XFF737373)),
    );
  }

  Widget _buildSettingsPanel() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0x0A000000)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBreathDurationSection(),
          SizedBox(height: 16),
          _buildRoundsSection(),
          SizedBox(height: 16),
          _buildSoundSection(),
        ],
      ),
    );
  }

  Widget _buildBreathDurationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SettingsTileTitle(title: "Breath Duration"),
        SettingsTileSubtitle(title: "Seconds per phase"),
        SizedBox(height: 12),
        OptionChips(
          options: [3, 4, 5, 10],
          onChanged: (value) {},
          formatLabel: (value) => "${value}s",
        ),
      ],
    );
  }

  Widget _buildRoundsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SettingsTileTitle(title: "Rounds"),
        SettingsTileSubtitle(title: "Full breathing cycles"),
        SizedBox(height: 12),
        OptionChips(
          options: [2, 4, 6, 8, 10],
          onChanged: (value) {},
          formatLabel: (value) => "$value min",
        ),
      ],
    );
  }

  Widget _buildSoundSection() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SettingsTileTitle(title: "Sound"),
              SettingsTileSubtitle(title: "Gentle chime between phases"),
            ],
          ),
        ),
        Transform.scale(
          scale: 0.8,
          child: Switch(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: false,
            onChanged: (value) {},
            activeTrackColor: AppTheme.primaryColor,
            inactiveTrackColor: Colors.black38,
            thumbColor: WidgetStateProperty.all(Colors.white),
            thumbIcon: WidgetStateProperty.all(const Icon(null)),
          ),
        ),
      ],
    );
  }
}
