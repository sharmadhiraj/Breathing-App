import 'package:breathing_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OptionChips extends StatefulWidget {
  final Map<int, String> labels;
  final int initialValue;
  final ValueChanged<int>? onChanged;

  const OptionChips({
    super.key,
    required this.labels,
    required this.initialValue,
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
    selectedValue = widget.initialValue;
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
        children: widget.labels.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: _OptionChip(
              label: entry.value,
              isSelected: selectedValue == entry.key,
              onTap: () => _onChipTap(entry.key),
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
