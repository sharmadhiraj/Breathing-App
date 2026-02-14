import 'package:breathing_app/core/widgets/app_bar.dart';
import 'package:breathing_app/core/widgets/responsive_body.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({required this.body, super.key});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BreathingAppBar(),
      body: ResponsiveBody(child: body),
    );
  }
}
