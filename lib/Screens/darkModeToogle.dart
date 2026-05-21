// lib/dark_mode_toggle.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mesmat_yetesanachew_application/Components/themeNotifier.dart';

class DarkModeToggle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return Switch(
          value: themeNotifier.isDarkMode,
          onChanged: (value) {
            themeNotifier.toggleTheme();
          },
        );
      },
    );
  }
}
