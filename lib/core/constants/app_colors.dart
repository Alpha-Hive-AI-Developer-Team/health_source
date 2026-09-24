import 'package:flutter/material.dart';

/// Centralized color tokens pulled from the HealthSource design file.
/// Never hardcode a hex value in a screen/widget — reference these instead.
class AppColors {
  AppColors._();

  // Brand
  static const Color primary = Color(0xFFEA1443); // grad end / accent red
  static const Color primaryDark = Color(0xFF1F1514); // grad start / bg
  static const Color grey = Color(0xFF8D8D8D); // secondary text / icons
  static const Color white = Color(0xFFFFFFFF);

  // Backgrounds
  static const Color background = Color(0xFF1A1414);
  static const Color surface = Color(0xFF241C1B);
  static const Color surfaceElevated = Color(0xFF2E2321);

  // Text
  static const Color textPrimary = white;
  static const Color textSecondary = grey;
  static const Color textDisabled = Color(0xFF5C5555);

  // Status
  static const Color success = Color(0xFF2ECC71);
  static const Color warning = Color(0xFFF5A623);
  static const Color error = Color(0xFFEA1443);

  // Utility
  static const Color divider = Color(0xFF3A2E2C);
  static const Color overlay = Color(0x99000000);
  static const Color shimmerBase = Color(0xFF2A2020);
  static const Color shimmerHighlight = Color(0xFF3D2F2D);
    static const Color black = Color(0xFF000000);
}
