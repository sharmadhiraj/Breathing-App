import 'package:breathing_app/core/theme/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreathingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BreathingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
      ),
      actions: [
        BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            final isDark = state.themeMode == ThemeMode.dark;
            return GestureDetector(
              onTap: () => context.read<ThemeBloc>().add(ToggleTheme()),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: (isDark ? Colors.white : Colors.black).withValues(
                    alpha: 0.05,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  "assets/icons/${isDark ? "dark" : "light"}_mode.png",
                  width: 24,
                  height: 24,
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
