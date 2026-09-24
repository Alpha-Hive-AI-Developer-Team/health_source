import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/theme/app_text_styles.dart';

/// Small pill used to show status ("Completed", "Processing", "New").
/// Color-codes automatically for common statuses, or pass [color] to override.
class StatusBadge extends StatelessWidget {
  final String label;
  final Color? color;

  const StatusBadge({super.key, required this.label, this.color});

  Color _resolveColor() {
    if (color != null) return color!;
    switch (label.toLowerCase()) {
      case 'completed':
      case 'done':
        return AppColors.success;
      case 'processing':
      case 'pending':
        return AppColors.warning;
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = _resolveColor();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: 4),
      decoration: BoxDecoration(
        color: c.withOpacity(0.15),
        borderRadius: BorderRadius.circular(AppSizes.radiusPill),
      ),
      child: Text(label, style: AppTextStyles.caption.copyWith(color: c, fontWeight: FontWeight.w600)),
    );
  }
}
