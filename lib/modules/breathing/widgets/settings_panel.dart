import 'package:breathing_app/core/theme/theme.dart';
import 'package:breathing_app/core/widgets/option_chips.dart';
import 'package:breathing_app/core/widgets/settings_tile_subtitle.dart';
import 'package:breathing_app/core/widgets/settings_tile_title.dart';
import 'package:breathing_app/modules/breathing/widgets/advanced_timing_settings.dart';
import 'package:flutter/material.dart';

class BreathingSettingsPanel extends StatelessWidget {
  const BreathingSettingsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
          const SizedBox(height: 20),
          _buildRoundsSection(),
          const SizedBox(height: 20),
          const AdvancedTimingSettings(),
          const SizedBox(height: 20),
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
        const SettingsTileTitle(title: "Breath Duration"),
        const SettingsTileSubtitle(title: "Seconds per phase"),
        const SizedBox(height: 12),
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
        const SettingsTileTitle(title: "Rounds"),
        const SettingsTileSubtitle(title: "Full breathing cycles"),
        const SizedBox(height: 12),
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
        const Expanded(
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
