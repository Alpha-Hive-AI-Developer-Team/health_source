import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/theme/app_text_styles.dart';
import '../containers/custom_card_container.dart';
import 'status_badge.dart';

/// Card summarizing a single scan: thumbnail, title, date, and a
/// status badge (e.g. Completed / Processing).
class ScanHistoryCard extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final ImageProvider? thumbnail;
  final VoidCallback? onTap;

  const ScanHistoryCard({
    super.key,
    required this.title,
    required this.date,
    required this.status,
    this.thumbnail,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCardContainer(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.surfaceElevated,
              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              image: thumbnail != null ? DecorationImage(image: thumbnail!, fit: BoxFit.cover) : null,
            ),
            child: thumbnail == null ? const Icon(Icons.image_outlined, color: AppColors.grey) : null,
          ),
          const SizedBox(width: AppSizes.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: AppSizes.xs),
                Text(date, style: AppTextStyles.bodySmall),
              ],
            ),
          ),
          StatusBadge(label: status),
        ],
      ),
    );
  }
}
