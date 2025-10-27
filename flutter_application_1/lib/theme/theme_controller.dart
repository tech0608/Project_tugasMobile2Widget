import 'package:flutter/material.dart';

// A small global controller to hold the current ThemeMode and helpers to cycle it.
final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(
  ThemeMode.system,
);

void cycleThemeMode() {
  final current = themeModeNotifier.value;
  if (current == ThemeMode.system) {
    themeModeNotifier.value = ThemeMode.light;
  } else if (current == ThemeMode.light) {
    themeModeNotifier.value = ThemeMode.dark;
  } else {
    themeModeNotifier.value = ThemeMode.system;
  }
}

IconData themeIconFor(ThemeMode mode) {
  switch (mode) {
    case ThemeMode.light:
      return Icons.light_mode;
    case ThemeMode.dark:
      return Icons.dark_mode;
    case ThemeMode.system:
      return Icons.brightness_auto;
  }
}
