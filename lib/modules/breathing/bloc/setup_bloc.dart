import 'package:breathing_app/modules/breathing/bloc/setup_event.dart';
import 'package:breathing_app/modules/breathing/bloc/setup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetupBloc extends Bloc<SetupEvent, SetupState> {
  SetupBloc() : super(const SetupState()) {
    on<SetBreathDuration>((event, emit) {
      emit(state.copyWith(breathDuration: event.duration));
    });

    on<SetRounds>((event, emit) {
      emit(state.copyWith(rounds: event.rounds));
    });

    on<SetSoundEnabled>((event, emit) {
      emit(state.copyWith(soundEnabled: event.enabled));
    });
  }
}
