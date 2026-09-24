import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/theme/app_text_styles.dart';

/// Bordered secondary button — use next to a CustomGradientButton for
/// "Cancel", "Skip", or any lower-priority action.
class CustomOutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final Color borderColor;
  final Color textColor;
  final double? width;

  const CustomOutlineButton({
    super.key,
    required this.label,
    this.onTap,
    this.borderColor = AppColors.grey,
    this.textColor = AppColors.white,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: AppSizes.buttonHeight,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusMd)),
        ),
        child: Text(label, style: AppTextStyles.buttonLarge.copyWith(color: textColor)),
      ),
    );
  }
}

/// Round icon-only button used in app bars / card actions (e.g. search, back).
class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final Color background;
  final Color iconColor;
  final double size;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.background = AppColors.surface,
    this.iconColor = AppColors.white,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusPill),
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: background, shape: BoxShape.circle),
        child: Icon(icon, color: iconColor, size: AppSizes.iconSm),
      ),
    );
  }
}
