import 'package:breathing_app/modules/setup/bloc/setup_state.dart';
import 'package:equatable/equatable.dart';

class AdvancedTimingState extends Equatable {
  final int breatheIn;
  final int holdIn;
  final int breatheOut;
  final int holdOut;
  final bool isExpanded;


  const AdvancedTimingState({
    this.breatheIn = SetupState.defaultDuration,
    this.holdIn = SetupState.defaultDuration,
    this.breatheOut = SetupState.defaultDuration,
    this.holdOut = SetupState.defaultDuration,
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
