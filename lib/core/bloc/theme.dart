import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class ThemeEvent {}

class ToggleTheme extends ThemeEvent {}

// State
class ThemeState {
  final ThemeMode themeMode;

  ThemeState(this.themeMode);
}

// Bloc
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(ThemeMode.light)) {
    on<ToggleTheme>((event, emit) {
      emit(
        ThemeState(
          state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
        ),
      );
    });
  }
}
