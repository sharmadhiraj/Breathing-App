import 'package:breathing_app/modules/breathing/bloc/advanced_timing_event.dart';
import 'package:breathing_app/modules/breathing/bloc/advanced_timing_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdvancedTimingBloc
    extends Bloc<AdvancedTimingEvent, AdvancedTimingState> {
  AdvancedTimingBloc() : super(const AdvancedTimingState()) {
    on<SetAdvancedTiming>((event, emit) {
      emit(
        state.copyWith(
          breatheIn: event.breatheIn,
          holdIn: event.holdIn,
          breatheOut: event.breatheOut,
          holdOut: event.holdOut,
        ),
      );
    });

    on<ToggleAdvancedTimingExpanded>((event, emit) {
      emit(
        state.copyWith(
          isExpanded: !state.isExpanded,
          breatheIn: event.defaultDuration,
          holdIn: event.defaultDuration,
          breatheOut: event.defaultDuration,
          holdOut: event.defaultDuration,
        ),
      );
    });
  }
}
