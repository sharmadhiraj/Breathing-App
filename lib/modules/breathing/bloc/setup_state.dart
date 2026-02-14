

class SetupState {
  final int breathDuration;
  final int rounds;
  final bool soundEnabled;

  const SetupState({
    this.breathDuration = 4,
    this.rounds = 4,
    this.soundEnabled = true,
  });

  SetupState copyWith({
    int? breathDuration,
    int? rounds,
    bool? soundEnabled,
    Map<String, int>? advancedTiming,
  }) {
    return SetupState(
      breathDuration: breathDuration ?? this.breathDuration,
      rounds: rounds ?? this.rounds,
      soundEnabled: soundEnabled ?? this.soundEnabled,
    );
  }
}
