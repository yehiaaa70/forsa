import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      // secondary: AppColors.secondary,
    ),
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: AppColors.transparent,
      iconTheme: IconThemeData(color: AppColors.primary),
    ),
    brightness: Brightness.light,
    fontFamily: AppStrings.fontFamily,
    textTheme:  TextTheme(
      displayLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
