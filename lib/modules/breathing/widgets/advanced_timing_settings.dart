import 'package:breathing_app/core/theme/app_colors.dart';
import 'package:breathing_app/core/widgets/number_field.dart';
import 'package:breathing_app/core/widgets/settings_tile_subtitle.dart';
import 'package:breathing_app/core/widgets/settings_tile_title.dart';
import 'package:breathing_app/modules/breathing/bloc/advanced_timing_bloc.dart';
import 'package:breathing_app/modules/breathing/bloc/advanced_timing_event.dart';
import 'package:breathing_app/modules/breathing/bloc/advanced_timing_state.dart';
import 'package:breathing_app/modules/breathing/bloc/setup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdvancedTimingSettings extends StatelessWidget {
  const AdvancedTimingSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedTimingBloc, AdvancedTimingState>(
      builder: (context, state) {
        return AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, state.isExpanded),
              if (state.isExpanded) ...[
                const SizedBox(height: 12),
                _AdvancedTimingItem(
                  title: "Breathe in",
                  initialValue: state.breatheIn,
                  onChanged: (value) =>
                      context
                          .read<AdvancedTimingBloc>()
                          .add(SetAdvancedTiming(breatheIn: value)),
                ),
                _AdvancedTimingItem(
                  title: "Hold in",
                  initialValue: state.holdIn,
                  onChanged: (value) =>
                      context
                          .read<AdvancedTimingBloc>()
                          .add(SetAdvancedTiming(holdIn: value)),
                ),
                _AdvancedTimingItem(
                  title: "Breathe out",
                  initialValue: state.breatheOut,
                  onChanged: (value) =>
                      context
                          .read<AdvancedTimingBloc>()
                          .add(SetAdvancedTiming(breatheOut: value)),
                ),
                _AdvancedTimingItem(
                  title: "Hold out",
                  initialValue: state.holdOut,
                  onChanged: (value) =>
                      context
                          .read<AdvancedTimingBloc>()
                          .add(SetAdvancedTiming(holdOut: value)),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, bool isExpanded) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SettingsTileTitle(title: "Advanced timing"),
              SettingsTileSubtitle(
                title: "Set different durations for each phase",
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            final setupState = context
                .read<SetupBloc>()
                .state;
            context.read<AdvancedTimingBloc>().add(
              ToggleAdvancedTimingExpanded(
                defaultDuration: setupState.breathDuration,
              ),
            );
          },
          icon: AnimatedRotation(
            turns: isExpanded ? 0.5 : 0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: const Icon(Icons.keyboard_arrow_down),
          ),
        ),
      ],
    );
  }
}

class _AdvancedTimingItem extends StatelessWidget {
  const _AdvancedTimingItem({
    required this.title,
    required this.initialValue,
    required this.onChanged,
  });

  final String title;
  final int? initialValue;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surfacePrimary,
        border: Border.all(color: colors.borderPrimary),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: colors.textPrimary,
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(width: 12),
          NumberField(initialValue: initialValue, onChanged: onChanged),
        ],
      ),
    );
  }
}
