import 'package:breathing_app/core/theme/theme.dart';
import 'package:breathing_app/core/widgets/option_chips.dart';
import 'package:breathing_app/core/widgets/settings_tile_subtitle.dart';
import 'package:breathing_app/core/widgets/settings_tile_title.dart';
import 'package:breathing_app/modules/breathing/bloc/advanced_timing_bloc.dart';
import 'package:breathing_app/modules/breathing/bloc/advanced_timing_event.dart';
import 'package:breathing_app/modules/breathing/bloc/setup_bloc.dart';
import 'package:breathing_app/modules/breathing/bloc/setup_event.dart';
import 'package:breathing_app/modules/breathing/bloc/setup_state.dart';
import 'package:breathing_app/modules/breathing/widgets/advanced_timing_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          _buildBreathDurationSection(context),
          const SizedBox(height: 20),
          _buildRoundsSection(context),
          const SizedBox(height: 20),
          const AdvancedTimingSettings(),
          const SizedBox(height: 20),
          _buildSoundSection(context),
        ],
      ),
    );
  }

  Widget _buildBreathDurationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SettingsTileTitle(title: "Breath Duration"),
        const SettingsTileSubtitle(title: "Seconds per phase"),
        const SizedBox(height: 12),
        OptionChips(
          onChanged: (value) {
            context.read<SetupBloc>().add(SetBreathDuration(value));
            context.read<AdvancedTimingBloc>().add(
              SetAdvancedTiming(
                breatheIn: value,
                breatheOut: value,
                holdIn: value,
                holdOut: value,
              ),
            );
          },
          labels: {3: "3s", 4: "4s", 5: "5s", 10: "10s"},
          initialValue: SetupState.defaultDuration,
        ),
      ],
    );
  }

  Widget _buildRoundsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SettingsTileTitle(title: "Rounds"),
        const SettingsTileSubtitle(title: "Full breathing cycles"),
        const SizedBox(height: 12),
        OptionChips(
          onChanged: (value) => context.read<SetupBloc>().add(SetRounds(value)),
          labels: {2: "2 quick", 4: "4 calm", 6: "6 deep", 8: "8 zen"},
          initialValue: SetupState.defaultRounds,
        ),
      ],
    );
  }

  Widget _buildSoundSection(BuildContext context) {
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
            value: context.read<SetupBloc>().state.soundEnabled,
            onChanged: (value) =>
                context.read<SetupBloc>().add(SetSoundEnabled(value)),
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
