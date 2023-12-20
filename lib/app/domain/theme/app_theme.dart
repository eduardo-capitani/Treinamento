import 'package:flutter/material.dart';
import 'package:treinamento/app/domain/typography/app_text_styles.dart';

class AppTheme {
  static ThemeData get getLightTheme => ThemeData(
    colorScheme: colorScheme,
    textTheme: textTheme,
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all<Color>(const Color(0xFFD9D9D9)),
      thumbColor: MaterialStateProperty.all<Color>(const Color(0xFF163969)),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF163969),
      foregroundColor: Colors.white,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(const Color(0xFF163969)),
    ),
    primaryColor: const Color(0xFF163969),
    scaffoldBackgroundColor: const Color(0xFFf2f4f7),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF163969),
      foregroundColor: Colors.white,
    ),
  );

  static ColorScheme get colorScheme => const ColorScheme(
    primary: Color(0xFF163969),
    onPrimary: Colors.white,
    secondary: Color(0xFF2397D3),
    surface: Color(0xFF163969),
    background: Color(0xFFf2f4f7),
    error: Colors.red,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onBackground: Color(0xFF163969),
    onError: Colors.red,
    brightness: Brightness.light,
  );

  static TextTheme get textTheme => const TextTheme(
    displayLarge: displayLargeStyle,
    displayMedium: displayMediumStyle,
    displaySmall: displaySmallStyle,
    headlineLarge: headlineLargeStyle,
    bodyLarge: bodyLargeStyle,
    bodySmall: bodySmallStyle,
    titleMedium: titleMediumStyle,
    titleLarge: titleLargeStyle,
    labelSmall: labelSmallStyle,
  );
}