import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/buttons/expandable_scan_fab.dart';
import '../controllers/profile_settings_controller.dart';
import '../widgets/settings_input.dart';
import '../widgets/settings_label.dart';

class ProfileView extends GetView<ProfileSettingsController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.black,
    floatingActionButton: ExpandableScanFab(
      scanIcon: Icons.person_outline,
      onProfileTap: () => Get.toNamed(AppRoutes.patientRecords),
      onSettingsTap: () => Get.toNamed(AppRoutes.settings),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('My Profile', style: AppTextStyles.h4.copyWith(fontSize: 20)),
            const SizedBox(height: 36),
            const SettingsLabel('First Name'),
            SettingsInput(
              controller.firstNameController,
              'Egnis',
              image: AppAssets.identificationcard,
            ),
            const SizedBox(height: 18),
            const SettingsLabel('Last Name'),
            SettingsInput(
              controller.lastNameController,
              'Nielson',
              image: AppAssets.identificationcard,
            ),
            const SizedBox(height: 18),
            const SettingsLabel('Email'),
            SettingsInput(
              controller.emailController,
              'Hello@tyler.com',
              icon: Icons.mail_outline,
            ),
            const SizedBox(height: 18),
            const SettingsLabel('Password'),
            SettingsInput(
              controller.currentPasswordController,
              '••••••••••',
              icon: Icons.lock_outline,
              obscure: true,
            ),
          ],
        ),
      ),
    ),
  );
}
