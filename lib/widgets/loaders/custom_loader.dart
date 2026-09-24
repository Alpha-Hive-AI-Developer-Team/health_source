import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

/// Standard spinner. Use everywhere instead of a bare CircularProgressIndicator
/// so stroke width / color stay consistent app-wide.
class CustomLoader extends StatelessWidget {
  final double size;
  final Color color;
  final double strokeWidth;

  const CustomLoader({
    super.key,
    this.size = 28,
    this.color = AppColors.primary,
    this.strokeWidth = 2.5,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}

/// Full-screen loading overlay — drop into GetX's Obx to show/hide
/// based on a controller's `isLoading` observable.
class CustomLoadingOverlay extends StatelessWidget {
  const CustomLoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.overlay,
      alignment: Alignment.center,
      child: const CustomLoader(),
    );
  }
}
