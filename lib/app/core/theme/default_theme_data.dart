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
    primaryColor: DefinitionColors.primaryDarkColor,
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
      primaryVariant: DefinitionColors.primaryLightColor,
      secondary: DefinitionColors.secondaryDarkColor,
      secondaryVariant: DefinitionColors.secondaryLightColor,
      surface: Colors.white,
    ),
  );
}