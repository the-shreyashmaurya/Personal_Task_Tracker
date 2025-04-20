import 'package:flutter/material.dart';
import 'package:personal_task_tracker/app/colors.dart';

class AppTheme {
  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF1C1F2E),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,

      primary: AppColors().primary, // Yellow Button
      onPrimary: AppColors().black, // Text on Yellow

      secondary: AppColors().textFieldDark, // Input Field BG
      onSecondary: AppColors().white, // Input Text

      surface: AppColors().backgroundDark, // Background surfaces
      onSurface: AppColors().white, // Normal Text
      error: Colors.red,
      onError: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF384250),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(color: Colors.grey[400]),
      labelStyle: TextStyle(color: Colors.white),
    ),
    textTheme: TextTheme(),
    dividerColor: Color(0xFF3B4658),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors().primary,
        foregroundColor: AppColors().black,
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),

    // Text Button
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ).copyWith(
    // Force the same color for all states (pressed/hovered/focused)
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
    overlayColor: WidgetStatePropertyAll<Color>(Colors.transparent), // No ripple
  ),
    ),
  );
}
