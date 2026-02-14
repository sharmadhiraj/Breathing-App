import 'package:breathing_app/modules/breathing/screens/breathing.dart';
import 'package:breathing_app/modules/breathing/screens/finish.dart';
import 'package:breathing_app/modules/breathing/screens/setup.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const setup = '/setup';
  static const breathing = '/breathing';
  static const finish = '/finish';

  static Map<String, WidgetBuilder> get routes => {
    setup: (_) => const SetupScreen(),
    breathing: (_) => const BreathingScreen(),
    finish: (_) => const FinishScreen(),
  };

  static void navigateTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  static void navigateToReplacement(BuildContext context, String route) {
    Navigator.pushReplacementNamed(context, route);
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}
