import 'package:flutter/material.dart';

class NumberField extends StatefulWidget {
  final int? initialValue;

  final ValueChanged<int> onChanged;

  const NumberField({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<NumberField> createState() => _NumberFieldState();
}

class _NumberFieldState extends State<NumberField> {
  late int value;
  final int minValue = 1;
  final int maxValue = 24;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue ?? minValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _CircleButton(icon: Icons.remove, onTap: _decrement),
          const SizedBox(width: 12),
          SizedBox(
            width: 40,
            child: Text(
              "${value}s",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                letterSpacing: 0,
                height: 1.5,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
            ),
          ),
          const SizedBox(width: 12),
          _CircleButton(icon: Icons.add, onTap: _increment),
        ],
      ),
    );
  }

  void _increment() {
    if (value < maxValue) {
      setState(() => value++);
      widget.onChanged.call(value);
    }
  }

  void _decrement() {
    if (value > minValue) {
      setState(() => value--);
      widget.onChanged.call(value);
    }
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }
}
