import 'package:flutter/material.dart';

class SettingsTileSubtitle extends StatelessWidget {
  const SettingsTileSubtitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.5,
        letterSpacing: 0,
        color: Color(0xFF737373),
      ),
    );
  }
}
