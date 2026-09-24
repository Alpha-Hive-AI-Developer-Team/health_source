import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Widget? trailing;

  const SettingsTile(
    this.icon,
    this.title,
    this.subtitle,
    this.onTap, {
    this.trailing,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListTile(
    contentPadding: EdgeInsets.zero,
    onTap: onTap,
    leading: Icon(icon, color: AppColors.primary, size: 21),
    title: Text(
      title,
      style: AppTextStyles.bodyMedium.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
    ),
    subtitle: Text(
      subtitle,
      style: AppTextStyles.caption.copyWith(fontSize: 10),
    ),
    trailing:
        trailing ??
        const Icon(Icons.chevron_right, color: AppColors.grey, size: 19),
  );
}
