import 'package:flutter/material.dart';
import 'package:personal_task_tracker/app/colors.dart';

class AppFonts {
  static TextStyle displayLarge(BuildContext context) {
    return const TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w700,
    ).apply(
      color: Theme.of(context).textTheme.displayLarge?.color,
    );
  }

    static TextStyle displayMedium(BuildContext context) {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ).apply(
      color: Theme.of(context).textTheme.displayLarge?.color,
    );
  }

  
    static TextStyle displaySmall(BuildContext context) {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ).apply(
      color: Theme.of(context).textTheme.displayLarge?.color,
    );
  }

      static TextStyle display16(BuildContext context) {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ).apply(
      color: Theme.of(context).textTheme.displayLarge?.color,
    );
  }

  static TextStyle labelMedium(BuildContext context) {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ).apply(
      color: AppColors().onbackgroundDark,
    );
  }
}
