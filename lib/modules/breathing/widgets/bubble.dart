import 'package:breathing_app/core/theme/theme.dart';
import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  final int currentValue;
  final int maxValue;

  const Bubble({super.key, required this.currentValue, required this.maxValue});

  @override
  Widget build(BuildContext context) {
    final sizeFactor = (currentValue / maxValue).clamp(0.3, 1.0);

    return SizedBox(
      width: 196,
      height: 196,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 196 * sizeFactor,
            height: 196 * sizeFactor,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const RadialGradient(
                center: Alignment(0.2, -0.3),
                radius: 0.9,
                colors: [
                  Color.fromRGBO(123, 45, 142, 0.2),
                  Color.fromRGBO(123, 45, 142, 0.05),
                ],
                stops: [0.0, 1.0],
              ),
              border: Border.all(
                color: const Color.fromRGBO(123, 45, 142, 0.12),
              ),
            ),
          ),
          if (currentValue > 0)
            Text(
              currentValue.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
                letterSpacing: 0,
                color: AppTheme.primaryColor,
              ),
            ),
        ],
      ),
    );
  }
}
