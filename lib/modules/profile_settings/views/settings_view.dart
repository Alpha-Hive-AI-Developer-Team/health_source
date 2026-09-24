import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../controllers/profile_settings_controller.dart';
import '../widgets/glow_divider.dart';
import '../widgets/settings_row.dart';
import '../widgets/settings_scaffold.dart';

class SettingsView extends GetView<ProfileSettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) => SettingsScaffold(
    title: 'Settings',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account',
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.primary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        SettingsRow(
          icon: Icons.person_outline,
          label: 'Edit account',
          onTap: () => Get.toNamed('/profile/edit'),
        ),
        const GlowDivider(),
        SettingsRow(
          icon: Icons.lock_outline,
          label: 'Change Password',
          onTap: () => Get.toNamed('/profile/password'),
        ),
        const GlowDivider(),
        SettingsRow(
          icon: Icons.help_outline,
          label: 'Help',
          onTap: () => Get.toNamed('/profile/help'),
        ),
        const GlowDivider(),
        SettingsRow(
          icon: Icons.logout_rounded,
          label: 'Logout',
          onTap: () => Get.offAllNamed('/login'),
        ),
      ],
    ),
  );
}
