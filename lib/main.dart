import 'package:breathing_app/core/route.dart';
import 'package:breathing_app/core/theme/bloc.dart';
import 'package:breathing_app/core/theme/theme.dart';
import 'package:breathing_app/core/widgets/background_builder.dart';
import 'package:breathing_app/modules/breathing/bloc/advanced_timing_bloc.dart';
import 'package:breathing_app/modules/breathing/bloc/setup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BreathingApp());
}

class BreathingApp extends StatelessWidget {
  const BreathingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SetupBloc()),
        BlocProvider(create: (_) => AdvancedTimingBloc()),
        BlocProvider(create: (_) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.themeMode,
            initialRoute: AppRoutes.setup,
            routes: AppRoutes.routes,
            builder: (context, child) => BackgroundBuilder(child: child),
          );
        },
      ),
    );
  }
}
