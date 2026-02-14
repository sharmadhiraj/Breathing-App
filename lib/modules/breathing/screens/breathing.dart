import 'package:breathing_app/core/route.dart';
import 'package:breathing_app/core/theme/app_colors.dart';
import 'package:breathing_app/core/widgets/app_scaffold.dart';
import 'package:breathing_app/core/widgets/button.dart';
import 'package:breathing_app/core/widgets/linear_progress.dart';
import 'package:breathing_app/core/widgets/settings_tile_subtitle.dart';
import 'package:breathing_app/core/widgets/settings_tile_title.dart';
import 'package:breathing_app/modules/breathing/bloc/advanced_timing_bloc.dart';
import 'package:breathing_app/modules/breathing/bloc/breathing_bloc.dart';
import 'package:breathing_app/modules/breathing/bloc/breathing_event.dart';
import 'package:breathing_app/modules/breathing/bloc/breathing_state.dart';
import 'package:breathing_app/modules/breathing/bloc/setup_bloc.dart';
import 'package:breathing_app/modules/breathing/models/breathing_phase.dart';
import 'package:breathing_app/modules/breathing/widgets/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreathingScreen extends StatelessWidget {
  const BreathingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    final setupState = context.read<SetupBloc>().state;
    final advancedState = context.read<AdvancedTimingBloc>().state;
    return BlocProvider(
      create: (_) =>
          BreathingBloc(setup: setupState, advanced: advancedState)
            ..add(GettingReady()),
      child: BlocListener<BreathingBloc, BreathingState>(
        listener: (context, state) {
          if (state.getProgress() == 1) {
            AppRoutes.navigateToReplacement(context, AppRoutes.finish);
          }
        },
        child: BlocBuilder<BreathingBloc, BreathingState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 16),
                  _buildHeaderLabel(),
                  _buildBubble(state, context),
                  SettingsTileTitle(title: state.phase.name),
                  const SizedBox(height: 8),
                  SettingsTileSubtitle(title: state.phase.label),
                  _buildControls(context, state),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Container _buildBubble(BreathingState state, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
      child: Bubble(
        currentValue: state.currentPhaseValue,
        maxValue: state.phase == BreathingPhase.getReady
            ? state.currentPhaseValue
            : context.read<BreathingBloc>().getDuration(state.phase),
      ),
    );
  }

  Widget _buildControls(BuildContext context, BreathingState state) {
    return Opacity(
      opacity: state.phase == BreathingPhase.getReady ? 0 : 1,
      child: Column(
        children: [
          const SizedBox(height: 28),
          AppLinearProgress(progress: state.getProgress()),
          const SizedBox(height: 8),
          Text(
            "Cycle ${state.cycle} of ${state.rounds}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              height: 1.5,
              fontSize: 12,
              letterSpacing: 0,
              color: Color(0XFF630068),
            ),
          ),
          const SizedBox(height: 28),
          AppButton(
            text: state.isPaused ? "Resume" : "Pause",
            onPressed: () {
              final bloc = context.read<BreathingBloc>();
              if (state.isPaused) {
                bloc.add(ResumeBreathing());
              } else {
                bloc.add(PauseBreathing());
              }
            },
            leftIcon: state.isPaused ? "play" : "pause",
            backgroundColor: const Color(0xFFEFE6F0),
            textColor: Theme.of(context).extension<AppColors>()!.labelPrimary,
          ),
          const SizedBox(height: 12),
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
}
