import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/theme/app_text_styles.dart';

/// Pill-shaped search bar used on Home / All Patient's Records / New Scan.
class CustomSearchField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;
  final VoidCallback? onTap;
  final double height;

  const CustomSearchField({
    super.key,
    this.controller,
    this.hint = 'Search',
    this.onChanged,
    this.onFilterTap,
    this.onTap,
    this.height = 44,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusPill),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: AppColors.grey,
            size: AppSizes.iconMd,
          ),
          const SizedBox(width: AppSizes.sm),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              onTap: onTap,
              readOnly: onTap != null,
              style: AppTextStyles.bodyLarge,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          if (onFilterTap != null)
            GestureDetector(
              onTap: onFilterTap,
              child: const Icon(
                Icons.tune,
                color: AppColors.grey,
                size: AppSizes.iconMd,
              ),
            ),
        ],
      ),
    );
  }
}
