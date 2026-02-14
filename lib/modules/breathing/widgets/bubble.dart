import 'package:breathing_app/core/theme.dart';
import 'package:flutter/material.dart';

class RadialContainer extends StatelessWidget {
  final int value;

  const RadialContainer({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 196,
          height: 196,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const RadialGradient(
              center: Alignment(0.2, -0.3), // approx 40% 35%
              radius: 0.9,
              colors: [
                Color.fromRGBO(123, 45, 142, 0.2),
                Color.fromRGBO(123, 45, 142, 0.05),
              ],
              stops: [0.0, 1.0],
            ),
            border: Border.all(color: const Color.fromRGBO(123, 45, 142, 0.12)),
          ),
          child: Center(
            child: Text(
              value.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
                letterSpacing: 0,
                color: AppTheme.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
