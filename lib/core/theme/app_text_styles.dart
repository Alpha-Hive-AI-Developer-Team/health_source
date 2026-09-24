import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

/// Typography scale. Base captured from Figma: Poppins / 600 / 22px / 100% / 0%.
/// Everything else extrapolates a standard type scale around that token.
class AppTextStyles {
  AppTextStyles._();

  static TextStyle _base({
    required double size,
    required FontWeight weight,
    Color color = AppColors.textPrimary,
    double? letterSpacing,
    double? height,
  }) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: weight,
      color: color,
      letterSpacing: letterSpacing ?? 0,
      height: height ?? 1.0, // 100% line height per design
    );
  }

  // Headings
  static TextStyle h1 = _base(size: 28, weight: FontWeight.w600);
  static TextStyle h2 = _base(size: 24, weight: FontWeight.w600);
  // Exact Figma token: "Welcome Back!" — Poppins / SemiBold(600) / 22 / 100% / 0%
  static TextStyle h3 = _base(size: 22, weight: FontWeight.w600);
  static TextStyle h4 = _base(size: 18, weight: FontWeight.w600);

  // Body
  static TextStyle bodyLarge = _base(size: 16, weight: FontWeight.w400, height: 1.4);
  static TextStyle bodyMedium = _base(size: 14, weight: FontWeight.w400, height: 1.4);
  static TextStyle bodySmall = _base(size: 12, weight: FontWeight.w400, height: 1.3, color: AppColors.textSecondary);

  // Labels / buttons
  static TextStyle buttonLarge = _base(size: 16, weight: FontWeight.w600);
  static TextStyle buttonMedium = _base(size: 14, weight: FontWeight.w600);
  static TextStyle caption = _base(size: 11, weight: FontWeight.w500, color: AppColors.textSecondary, letterSpacing: 0.2);

  static TextStyle secondary(TextStyle style) => style.copyWith(color: AppColors.textSecondary);
}
