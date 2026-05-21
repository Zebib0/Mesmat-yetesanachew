import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mesmat_yetesanachew_application/Components/bottomNavigationBar.dart';
import 'package:mesmat_yetesanachew_application/Components/themeNotifier.dart';
import 'package:mesmat_yetesanachew_application/Components/color.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          theme: lightTheme,  // Use the light theme from theme.dart
          darkTheme: darkTheme,  // Use the dark theme from theme.dart
          themeMode: themeNotifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: AnimatedSplashScreen(
            splash: Image.asset('assets/templogo.png'),
            duration: 3000,
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.white,
            nextScreen: BottomNavigation(),
          ),
        );
      },
    );
  }
}
