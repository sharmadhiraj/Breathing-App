abstract class SetupEvent {}

class SetBreathDuration extends SetupEvent {
  final int duration;

  SetBreathDuration(this.duration);
}

class SetRounds extends SetupEvent {
  final int rounds;

  SetRounds(this.rounds);
}

class SetSoundEnabled extends SetupEvent {
  final bool enabled;

  SetSoundEnabled(this.enabled);
}
