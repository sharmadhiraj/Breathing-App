import 'package:breathing_app/core/theme/app_colors.dart';
import 'package:breathing_app/core/widgets/number_field.dart';
import 'package:breathing_app/core/widgets/settings_tile_subtitle.dart';
import 'package:breathing_app/core/widgets/settings_tile_title.dart';
import 'package:flutter/material.dart';

class AdvancedTimingSettings extends StatefulWidget {
  const AdvancedTimingSettings({super.key});

  @override
  State<AdvancedTimingSettings> createState() => _AdvancedTimingSettingsState();
}

class _AdvancedTimingSettingsState extends State<AdvancedTimingSettings>
    with TickerProviderStateMixin {
  bool isExpanded = false;

  void _toggle() {
    setState(() => isExpanded = !isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          if (isExpanded) ...[
            const SizedBox(height: 12),
            _AdvancedTimingItem(title: "Breathe in", onChanged: (_) {}),
            _AdvancedTimingItem(title: "Hold in", onChanged: (_) {}),
            _AdvancedTimingItem(title: "Breathe out", onChanged: (_) {}),
            _AdvancedTimingItem(title: "Hold out", onChanged: (_) {}),
          ],
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SettingsTileTitle(title: "Advanced timing"),
              SettingsTileSubtitle(
                title: "Set different durations for each phase",
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: _toggle,
          icon: AnimatedRotation(
            turns: isExpanded ? 0.5 : 0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: const Icon(Icons.keyboard_arrow_down),
          ),
        ),
      ],
    );
  }
}

class _AdvancedTimingItem extends StatelessWidget {
  const _AdvancedTimingItem({
    required this.title,
    this.initialValue,
    required this.onChanged,
  });

  final String title;
  final int? initialValue;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surfacePrimary,
        border: Border.all(color: colors.borderPrimary),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: colors.textPrimary,
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(width: 12),
          NumberField(initialValue: initialValue, onChanged: onChanged),
        ],
      ),
    );
  }
}
