import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        const SizedBox(height: 18),
        Text(
          'Important Points to Notice:',
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.primary,
            fontSize: 8,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 7),
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
        const Spacer(),
        ScanStepButton(
          label: 'Start Scan',
          onPressed: () => Get.toNamed('/new-scan/progress'),
        ),
      ],
    ),
  );
}
