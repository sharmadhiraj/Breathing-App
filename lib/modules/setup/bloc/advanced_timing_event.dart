abstract class AdvancedTimingEvent {}

class ToggleAdvancedTimingExpanded extends AdvancedTimingEvent {
  final int defaultDuration;

  ToggleAdvancedTimingExpanded({required this.defaultDuration});
}

class SetAdvancedTiming extends AdvancedTimingEvent {
  final int? breatheIn;
  final int? holdIn;
  final int? breatheOut;
  final int? holdOut;

  SetAdvancedTiming({
    this.breatheIn,
    this.holdIn,
    this.breatheOut,
    this.holdOut,
  });
}
