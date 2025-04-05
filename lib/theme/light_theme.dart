import 'package:flutter/material.dart';

final lightColorScheme = ColorScheme.fromSeed(seedColor: Colors.blue.shade400);
final defaultTheme = ThemeData.light();
final lightTheme = defaultTheme.copyWith(
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: lightColorScheme.inversePrimary,
    foregroundColor: lightColorScheme.onPrimaryContainer,
  ),
  scaffoldBackgroundColor: lightColorScheme.secondaryContainer,
);
