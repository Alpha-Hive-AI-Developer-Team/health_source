import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/new_scan_controller.dart';
import '../widgets/scan_step_button.dart';
import '../widgets/scan_step_scaffold.dart';
import '../widgets/scan_step_title.dart';
import '../widgets/scan_type_option.dart';

class ScanTypeView extends GetView<NewScanController> {
  const ScanTypeView({super.key});

  @override
  Widget build(BuildContext context) => ScanStepScaffold(
    child: Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ScanStepTitle(
            title: 'Select Scan Type',
            subtitle:
                'Tap to select the measurements you want to add in your scan',
          ),
          const SizedBox(height: 20),
          ScanTypeOption(
            title: 'Jumping Jacks',
            description:
                'Full-body movement to check how coordinated movement of the limbs is while jumping. It is commonly used for multiple cardio and agility training.',
            selected: controller.selectedScan.value == 'Full Body Scan',
            onTap: () => controller.selectedScan.value = 'Full Body Scan',
          ),
          const SizedBox(height: 7),
          ScanTypeOption(
            title: 'Jumping Jacks',
            description:
                'Full-body exercise that measures movement and overall mobility.',
            selected: controller.selectedScan.value == 'Posture Scan',
            onTap: () => controller.selectedScan.value = 'Posture Scan',
          ),
          const SizedBox(height: 7),
          ScanTypeOption(
            title: 'Jumping Jacks',
            description:
                'Full-body exercise that measures balance, posture and agility.',
            selected: controller.selectedScan.value == 'Balance Scan',
            onTap: () => controller.selectedScan.value = 'Balance Scan',
          ),
          const Spacer(),
          ScanStepButton(label: 'Next', onPressed: controller.continueToReady),
        ],
      ),
    ),
  );
}
