import 'package:flutter/material.dart';
import '../../core/constants/app_gradients.dart';
import '../../core/constants/app_sizes.dart';

/// Generic gradient-filled box. Backing block for hero banners, headers,
/// and the "New Scan" CTA panel. Wrap any child in it.
class GradientContainer extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double? width;
  final double? height;

  const GradientContainer({
    super.key,
    required this.child,
    this.gradient = AppGradients.primary,
    this.borderRadius = AppSizes.radiusLg,
    this.padding = const EdgeInsets.all(AppSizes.md),
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
