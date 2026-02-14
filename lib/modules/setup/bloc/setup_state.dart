class SetupState {
  final int breathDuration;
  final int rounds;
  final bool soundEnabled;

  static const defaultDuration = 4;
  static const defaultRounds = 4;

  const SetupState({
    this.breathDuration = defaultDuration,
    this.rounds = defaultRounds,
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
