import 'package:fingerprint_aps/app/core/theme/definition_colors.dart';
import 'package:flutter/material.dart';

class DefaultThemeData {
  DefaultThemeData._();

  static ThemeData defaultThemeData = ThemeData(
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
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: DefinitionColors.primaryDarkColor,
    )
  );
}