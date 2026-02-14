import 'package:equatable/equatable.dart';

class AdvancedTimingState extends Equatable {
  final int breatheIn;
  final int holdIn;
  final int breatheOut;
  final int holdOut;
  final bool isExpanded;

  static const int defaultDuration = 4;

  const AdvancedTimingState({
    this.breatheIn = defaultDuration,
    this.holdIn = defaultDuration,
    this.breatheOut = defaultDuration,
    this.holdOut = defaultDuration,
    this.isExpanded = false,
  });

  AdvancedTimingState copyWith({
    int? breatheIn,
    int? holdIn,
    int? breatheOut,
    int? holdOut,
    bool? isExpanded,
  }) {
    return AdvancedTimingState(
      breatheIn: breatheIn ?? this.breatheIn,
      holdIn: holdIn ?? this.holdIn,
      breatheOut: breatheOut ?? this.breatheOut,
      holdOut: holdOut ?? this.holdOut,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }

  @override
  List<Object?> get props => [
    breatheIn,
    holdIn,
    breatheOut,
    holdOut,
    isExpanded,
  ];
}
