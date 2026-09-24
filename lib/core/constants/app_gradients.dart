import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Reusable gradients captured from Figma ("grad": linear #1F1514 -> #EA1443)
class AppGradients {
  AppGradients._();

  static const LinearGradient primary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.primaryDark, AppColors.primary],
  );

  static const LinearGradient primaryVertical = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.primaryDark, AppColors.primary],
  );

  static LinearGradient primaryFade = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.primaryDark, AppColors.primary.withOpacity(0.85)],
  );

  static const LinearGradient shimmer = LinearGradient(
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    colors: [AppColors.shimmerBase, AppColors.shimmerHighlight, AppColors.shimmerBase],
  );
}
