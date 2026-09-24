import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_gradients.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/theme/app_text_styles.dart';
import '../loaders/custom_loader.dart';

/// CTA filled with the brand "grad" (#1F1514 -> #EA1443) gradient.
/// Use for hero actions: "Start New Scan", "Continue", etc.
class CustomGradientButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool isLoading;
  final bool isDisabled;
  final IconData? icon;
  final double? width;
  final Gradient gradient;

  const CustomGradientButton({
    super.key,
    required this.label,
    this.onTap,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
    this.width,
    this.gradient = AppGradients.primary,
  });

  @override
  Widget build(BuildContext context) {
    final disabled = isDisabled || isLoading;
    return Opacity(
      opacity: disabled ? 0.6 : 1,
      child: IgnorePointer(
        ignoring: disabled,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          child: Container(
            width: width ?? double.infinity,
            height: AppSizes.buttonHeight,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            ),
            child: isLoading
                ? const CustomLoader(size: 22, color: AppColors.white)
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) ...[
                        Icon(icon, size: AppSizes.iconSm, color: AppColors.white),
                        const SizedBox(width: AppSizes.sm),
                      ],
                      Text(label, style: AppTextStyles.buttonLarge),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
