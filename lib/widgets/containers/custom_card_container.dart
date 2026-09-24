import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';

/// Base surface card. Every list-item card (patient record, scan history,
/// settings row) should wrap this rather than re-declaring a BoxDecoration.
class CustomCardContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color color;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Border? border;

  const CustomCardContainer({
    super.key,
    required this.child,
    this.onTap,
    this.color = AppColors.surface,
    this.padding = const EdgeInsets.all(AppSizes.md),
    this.borderRadius = AppSizes.radiusMd,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
            border: border,
          ),
          child: child,
        ),
      ),
    );
  }
}
