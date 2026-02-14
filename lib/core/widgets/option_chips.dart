import 'package:breathing_app/core/theme/app_colors.dart';
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

  const _OptionChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? colors.surfaceSecondary : colors.surfacePrimary,
          border: Border.all(
            color: isSelected ? colors.borderAccent : colors.borderPrimary,
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isSelected ? colors.textAccent : colors.textPrimary,
            height: 1.5,
            letterSpacing: 0,
          ),
        ),
      ),
    );
  }
}
