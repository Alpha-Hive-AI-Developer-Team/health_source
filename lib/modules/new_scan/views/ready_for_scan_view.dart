import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_source/widgets/buttons/custom_primary_button.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../controllers/new_scan_controller.dart';
import '../widgets/scan_instruction.dart';
import '../widgets/scan_step_button.dart';
import '../widgets/scan_step_scaffold.dart';
import '../widgets/scan_step_title.dart';

class ReadyForScanView extends GetView<NewScanController> {
  const ReadyForScanView({super.key});

  @override
  Widget build(BuildContext context) => ScanStepScaffold(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ScanStepTitle(
          title: 'Get Ready For Scan',
          subtitle: 'Set up positioning properly',
        ),
        const SizedBox(height: 40),
        Text(
          'Important Points to Notice:',
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        const ScanInstruction(
          number: 1,
          text: 'Place the patient in the marked area.',
        ),
        const ScanInstruction(
          number: 2,
          text: 'Keep the full body in frame, especially the feet.',
        ),
        const ScanInstruction(
          number: 3,
          text: 'Ensure a clear, well-lit background.',
        ),
        const ScanInstruction(
          number: 4,
          text: 'Avoid shaking or fast panning during scan.',
        ),
        // const Spacer(),
        SizedBox(height: 60),
        CustomPrimaryButton(
          height: 40,
          label: 'Start Scan',
          onTap: () => Get.toNamed('/new-scan/progress'),
        ),
      ],
    ),
  );
}
