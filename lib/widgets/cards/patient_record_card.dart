import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/theme/app_text_styles.dart';
import '../avatars/custom_avatar.dart';
import '../containers/custom_card_container.dart';

/// Row card for "All Patient's Records" list — avatar, name, meta line,
/// trailing status/chevron.
class PatientRecordCard extends StatelessWidget {
  final String name;
  final String subtitle; // e.g. "Age 34 • Last scan 2d ago"
  final String? avatarUrl;
  final VoidCallback? onTap;
  final Widget? trailing;

  const PatientRecordCard({
    super.key,
    required this.name,
    required this.subtitle,
    this.avatarUrl,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCardContainer(
      onTap: onTap,
      child: Row(
        children: [
          CustomAvatar(imageUrl: avatarUrl, size: AppSizes.avatarMd),
          const SizedBox(width: AppSizes.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: AppSizes.xs),
                Text(subtitle, style: AppTextStyles.bodySmall),
              ],
            ),
          ),
          trailing ?? const Icon(Icons.chevron_right, color: AppColors.grey),
        ],
      ),
    );
  }
}
