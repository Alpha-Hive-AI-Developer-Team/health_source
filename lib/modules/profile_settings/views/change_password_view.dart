import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_settings_controller.dart';
import '../widgets/primary_button.dart';
import '../widgets/settings_input.dart';
import '../widgets/settings_label.dart';
import '../widgets/settings_scaffold.dart';

class ChangePasswordView extends GetView<ProfileSettingsController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) => SettingsScaffold(
    title: 'Change Password',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsLabel('Old Password'),
        SettingsInput(
          controller.currentPasswordController,
          'Enter old password',
          icon: Icons.lock_outline,
          obscure: true,
        ),
        const SizedBox(height: 14),
        const SettingsLabel('New Password'),
        SettingsInput(
          controller.newPasswordController,
          'Enter new password',
          icon: Icons.lock_outline,
          obscure: true,
        ),
        const SizedBox(height: 14),
        const SettingsLabel('Confirm Password'),
        SettingsInput(
          controller.confirmPasswordController,
          'Confirm new password',
          icon: Icons.lock_outline,
          obscure: true,
        ),
        const SizedBox(height: 28),
        PrimaryButton(label: 'Save Changes', onTap: controller.savePassword),
      ],
    ),
  );
}
