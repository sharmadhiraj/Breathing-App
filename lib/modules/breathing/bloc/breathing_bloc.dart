import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:breathing_app/modules/breathing/bloc/advanced_timing_state.dart';
import 'package:breathing_app/modules/breathing/bloc/breathing_event.dart';
import 'package:breathing_app/modules/breathing/bloc/breathing_state.dart';
import 'package:breathing_app/modules/breathing/bloc/setup_state.dart';
import 'package:breathing_app/modules/breathing/models/breathing_phase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreathingBloc extends Bloc<BreathingEvent, BreathingState> {
  Timer? _timer;

  final Map<BreathingPhase, int> phaseDurations;

  BreathingBloc({
    required SetupState setup,
    required AdvancedTimingState advanced,
  }) : phaseDurations = {
         BreathingPhase.breatheIn: advanced.breatheIn,
         BreathingPhase.holdIn: advanced.holdIn,
         BreathingPhase.breatheOut: advanced.breatheOut,
         BreathingPhase.holdOut: advanced.holdOut,
         BreathingPhase.getReady: 3,
       },
       super(BreathingState(rounds: setup.rounds)) {
    on<GettingReady>(_onGettingReady);
    on<PauseBreathing>(_onPause);
    on<ResumeBreathing>(_onResume);
    on<NextPhase>(_onNextPhase);
    on<PhaseTick>(_onPhaseTick);
  }

  int getDuration(BreathingPhase phase) => phaseDurations[phase]!;

  void _onGettingReady(GettingReady event, Emitter<BreathingState> emit) {
    _startTimer(emit);
  }

  void _onPause(PauseBreathing event, Emitter<BreathingState> emit) {
    _timer?.cancel();
    emit(state.copyWith(isPaused: true));
  }

  void _onResume(ResumeBreathing event, Emitter<BreathingState> emit) {
    emit(state.copyWith(isPaused: false));
    _startTimer(emit);
  }

  void _onPhaseTick(PhaseTick event, Emitter<BreathingState> emit) {
    int newValue = state.currentPhaseValue;

    if (state.phase.up) {
      newValue = newValue + 1;
    } else {
      newValue = newValue - 1;
    }
    if ((state.phase.up && newValue > getDuration(state.phase)) ||
        (!state.phase.up && newValue < 0)) {
      _timer?.cancel();
      add(NextPhase());
    } else {
      emit(state.copyWith(currentPhaseValue: newValue));
    }
  }

  void _onNextPhase(NextPhase event, Emitter<BreathingState> emit) {
    final nextPhase = _getNextPhase(state.phase);
    int nextCycle = state.cycle;
    if (state.phase == BreathingPhase.holdOut) {
      AudioPlayer().play(AssetSource("sounds/chime.mp3"));
      nextCycle += 1;
      if (nextCycle > state.rounds) {
        Future.delayed(
          const Duration(milliseconds: 500),
          () => emit(state.copyWith(cycle: nextCycle)),
        );
        return;
      }
    }
    emit(
      state.copyWith(
        phase: nextPhase,
        cycle: nextCycle,
        currentPhaseValue: nextPhase.up ? 0 : getDuration(nextPhase),
      ),
    );
    _startTimer(emit);
  }

  BreathingPhase _getNextPhase(BreathingPhase phase) {
    switch (phase) {
      case BreathingPhase.getReady:
        return BreathingPhase.breatheIn;
      case BreathingPhase.breatheIn:
        return BreathingPhase.holdIn;
      case BreathingPhase.holdIn:
        return BreathingPhase.breatheOut;
      case BreathingPhase.breatheOut:
        return BreathingPhase.holdOut;
      case BreathingPhase.holdOut:
        return BreathingPhase.breatheIn;
    }
  }

  void _startTimer(Emitter<BreathingState> emit) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.isPaused) return;
      add(PhaseTick());
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
