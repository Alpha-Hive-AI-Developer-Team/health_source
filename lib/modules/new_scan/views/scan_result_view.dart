import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_source/core/constants/app_assets.dart';
import 'package:health_source/modules/new_scan/widgets/retake_button.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/patient_model.dart';
import '../controllers/new_scan_controller.dart';
import '../widgets/scan_summary_section.dart';

class ScanResultView extends GetView<NewScanController> {
  const ScanResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final patient =
        Get.arguments as PatientModel? ?? controller.selectedPatient.value;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(13, 40, 13, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Scan Results',
                    style: AppTextStyles.h4.copyWith(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.file_download_outlined,
                    size: 15,
                    color: AppColors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Download Report',
                    style: AppTextStyles.caption.copyWith(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              ScanSummarySection(
                title: 'General Info',
                rows: [
                  ('Name', patient?.name ?? 'Henry Cooper'),
                  ('Age', '${patient?.age ?? 46} y'),
                  ('Gender', patient?.gender ?? 'Male'),
                ],
              ),
              const SizedBox(height: 18),
              ScanSummarySection(
                title: 'Movements Selected',
                rows: const [
                  ('Jumping Jacks', 'Stable'),
                  ('Overhead squat', 'Erratic'),
                  ('Sample Movement', 'Stable'),
                ],
                valueColors: const {
                  'Stable': AppColors.success,
                  'Erratic': AppColors.error,
                },
              ),
              const SizedBox(height: 18),
              Text(
                'Joints Score',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Center(
                child: GestureDetector(
                  onTap: controller.openDetailedResults,
                  child: Image.asset(
                    AppAssets.human1,
                    height: 320,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Issues Identified:',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '•  Spinal Misalignment or Poor Posture\n•  Pelvic Tilt or Hip Drop',
                style: AppTextStyles.caption.copyWith(
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              RetakeScanButton(onPressed: controller.retakeScan),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
  // Center(
                //   child: BodyScanFigure(
                //     sideView: controller.selectedResultView.value == 'Side View',
                //   ),
                // ),