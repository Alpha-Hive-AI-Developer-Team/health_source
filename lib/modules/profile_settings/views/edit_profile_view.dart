import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_source/core/constants/app_assets.dart';

import '../controllers/profile_settings_controller.dart';
import '../widgets/primary_button.dart';
import '../widgets/settings_input.dart';
import '../widgets/settings_label.dart';
import '../widgets/settings_scaffold.dart';

class EditProfileView extends GetView<ProfileSettingsController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) => SettingsScaffold(
    title: 'Edit Profile',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsLabel('Full Name'),
        SettingsInput(
          controller.nameController,
          'First Name',
          image: AppAssets.identificationcard,
        ),
        const SizedBox(height: 14),
        const SettingsLabel('Last Name'),
        SettingsInput(
          controller.emailController,
          'Last Name',
       image: AppAssets.identificationcard,
        ),
        // const SizedBox(height: 14),
        // const SettingsLabel('Phone Number'),
        // SettingsInput(
        //   controller.phoneController,
        //   'Phone Number',
        //   Icons.phone_outlined,
        // ),
        const SizedBox(height: 28),
        PrimaryButton(label: 'Save Changes', onTap: controller.saveProfile),
      ],
    ),
  );
}
