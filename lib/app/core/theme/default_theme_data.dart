import 'package:fingerprint_aps/app/core/theme/definition_colors.dart';
import 'package:flutter/material.dart';

class DefaultThemeData {
  DefaultThemeData._();

  static ThemeData defaultThemeData = ThemeData(
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      elevation: 2.0,
      backgroundColor: DefinitionColors.primaryDarkColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: DefinitionColors.primaryDarkColor,
      foregroundColor: Colors.white
    ),
    primaryColor: DefinitionColors.primaryDarkColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: DefinitionColors.primaryDarkColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black54,
    ),
    colorScheme: const ColorScheme(
      background: Colors.white,
      brightness: Brightness.light,
      error: DefinitionColors.errorColor,
      onBackground: Colors.black,
      onError: Colors.black,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      primary: DefinitionColors.primaryDarkColor,
      primaryContainer: DefinitionColors.primaryLightColor,
      secondary: DefinitionColors.secondaryDarkColor,
      secondaryContainer: DefinitionColors.secondaryLightColor,
      surface: Colors.white,
    ),
  );
}