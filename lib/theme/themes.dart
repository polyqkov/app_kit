import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

/// Light Theme
ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: 'JakartaSans',
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: AppColors.white,
  ),
  scaffoldBackgroundColor: AppColors.white,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.gray06Dark,
    selectionColor: AppColors.black.withOpacity(0.4),
    selectionHandleColor: AppColors.gray06Dark,
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.gray06Light,
    onPrimary: AppColors.gray06Dark,
    secondary: AppColors.gray05Light,
    onSecondary: AppColors.gray06Dark,
    tertiary: AppColors.gray04Light,
    onTertiary: AppColors.gray06Dark,
    background: AppColors.white,
    onBackground: AppColors.gray06Dark,
    surface: AppColors.gray03Dark,
    onSurface: AppColors.gray06Dark,
    error: AppColors.redLight,
    onError: AppColors.white,
  ),
);

/// Dark Theme
ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  fontFamily: 'JakartaSans',
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    backgroundColor: AppColors.black,
  ),
  scaffoldBackgroundColor: AppColors.black,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.gray06Light,
    selectionColor: AppColors.white.withOpacity(0.4),
    selectionHandleColor: AppColors.gray06Light,
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.gray06Dark,
    onPrimary: AppColors.gray06Light,
    secondary: AppColors.gray05Dark,
    onSecondary: AppColors.gray06Light,
    tertiary: AppColors.gray04Dark,
    onTertiary: AppColors.gray06Light,
    background: AppColors.black,
    onBackground: AppColors.gray06Light,
    surface: AppColors.gray03Dark,
    onSurface: AppColors.gray06Light,
    error: AppColors.redDark,
    onError: AppColors.white,
  ),
);

extension ColorExt on ColorScheme {
  Color get primaryBrandColor => AppColors.primary;
  Color get onPrimaryBrandColor => AppColors.onPrimary;
  Color get white => AppColors.white;
  Color get black => AppColors.black;
}
