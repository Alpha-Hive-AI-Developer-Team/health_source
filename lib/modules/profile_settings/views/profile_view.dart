import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_settings_controller.dart';
import '../widgets/avatar.dart';
import '../widgets/primary_button.dart';
import '../widgets/settings_input.dart';
import '../widgets/settings_label.dart';
import '../widgets/settings_scaffold.dart';

class ProfileView extends GetView<ProfileSettingsController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) => SettingsScaffold(
    title: 'My Profile',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileAvatar(),
        const SizedBox(height: 24),
        const SettingsLabel('Full Name'),
        SettingsInput(
          controller.nameController,
          'Josh Smith',
       icon:   Icons.badge_outlined,
        ),
        const SizedBox(height: 14),
        const SettingsLabel('Email Address'),
        SettingsInput(
          controller.emailController,
          'josh@example.com',
          icon:  Icons.alternate_email,
        ),
        const SizedBox(height: 14),
        const SettingsLabel('Phone Number'),
        SettingsInput(
          controller.phoneController,
          '+1 234 567 890',
          icon: Icons.phone_outlined,
        ),
        const SizedBox(height: 14),
        const SettingsLabel('Password'),
        SettingsInput(
          controller.currentPasswordController,
          '********',
          icon: Icons.lock_outline,
          obscure: true,
        ),
        const SizedBox(height: 24),
        PrimaryButton(label: 'Save Changes', onTap: controller.saveProfile),
      ],
    ),
  );
}
