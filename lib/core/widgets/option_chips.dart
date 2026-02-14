import 'package:flutter/material.dart';

class OptionChips extends StatefulWidget {
  final List<int> options;
  final int? initialValue;
  final ValueChanged<int>? onChanged;
  final String Function(int)? formatLabel;

  const OptionChips({
    super.key,
    required this.options,
    this.formatLabel,
    this.initialValue,
    this.onChanged,
  });

  @override
  State<OptionChips> createState() => _OptionChipsState();
}

class _OptionChipsState extends State<OptionChips> {
  late int selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue ?? widget.options.first;
  }

  void _onChipTap(int value) {
    setState(() => selectedValue = value);
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: widget.options.map((option) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: _OptionChip(
              label: widget.formatLabel?.call(option) ?? option.toString(),
              isSelected: selectedValue == option,
              onTap: () => _onChipTap(option),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _OptionChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  static const Color selectedBg = Color(0xFFFFF8F0);
  static const Color unselectedBg = Color(0xFFF7F7F7);
  static const Color selectedBorder = Color(0xFFE47B00);
  static const Color unselectedBorder = Color(0xFFF5F5F5);
  static const Color selectedText = Color(0xFFE47B00);
  static const Color unselectedText = Colors.black;

  const _OptionChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? selectedBg : unselectedBg,
          border: Border.all(
            color: isSelected ? selectedBorder : unselectedBorder,
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isSelected ? selectedText : unselectedText,
            height: 1.5,
            letterSpacing: 0,
          ),
        ),
      ),
    );
  }
}
