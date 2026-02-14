import 'package:breathing_app/core/theme.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final String? leftIcon;
  final String? rightIcon;
  final Color textColor;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppTheme.primaryColor,
    this.textColor = Colors.white,
    this.leftIcon,
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
          elevation: 0,
          minimumSize: Size.zero,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leftIcon != null) ...[
              Image.asset("assets/icons/$leftIcon.png", width: 24, height: 24),
              const SizedBox(width: 16),
            ],
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                height: 1.5,
                color: textColor,
              ),
            ),
            if (rightIcon != null) ...[
              const SizedBox(width: 16),
              Image.asset("assets/icons/$rightIcon.png", width: 24, height: 24),
            ],
          ],
        ),
      ),
    );
  }
}
