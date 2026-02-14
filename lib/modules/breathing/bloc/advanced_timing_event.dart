abstract class AdvancedTimingEvent {}

class ToggleAdvancedTimingExpanded extends AdvancedTimingEvent {}

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
