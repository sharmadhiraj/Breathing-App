import 'package:breathing_app/core/theme.dart';
import 'package:breathing_app/modules/breathing/screens/setup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BreathingApp());
}

class BreathingApp extends StatelessWidget {
  const BreathingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Breathing App",
      theme: AppTheme.theme,
      home: BreathingSetupScreen(),
    );
  }
}
