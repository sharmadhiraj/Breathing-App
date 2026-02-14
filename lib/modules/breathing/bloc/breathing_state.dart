import 'package:breathing_app/modules/breathing/models/breathing_phase.dart';
import 'package:equatable/equatable.dart';

class BreathingState extends Equatable {
  final BreathingPhase phase;
  final int currentPhaseValue;
  final int cycle;
  final bool isPaused;
  final int rounds;

  const BreathingState({
    this.phase = BreathingPhase.getReady,
    this.currentPhaseValue = 2,
    this.cycle = 1,
    this.isPaused = false,
    this.rounds = 4,
  });

  double getProgress() {
    return (cycle - 1) / rounds;
  }

  BreathingState copyWith({
    BreathingPhase? phase,
    int? currentPhaseValue,
    int? cycle,
    bool? isPaused,
  }) {
    return BreathingState(
      phase: phase ?? this.phase,
      currentPhaseValue: currentPhaseValue ?? this.currentPhaseValue,
      cycle: cycle ?? this.cycle,
      isPaused: isPaused ?? this.isPaused,
      rounds: rounds,
    );
  }

  @override
  List<Object?> get props => [
    phase,
    currentPhaseValue,
    cycle,
    isPaused,
    rounds,
  ];
}
