import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_source/core/constants/app_assets.dart';
import 'package:health_source/modules/new_scan/model/joint_model.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/patient_model.dart';
import '../controllers/new_scan_controller.dart';
import '../widgets/joint_detail_list.dart';
import '../widgets/retake_button.dart';
import '../widgets/scan_detail_view_selector.dart';

import '../widgets/scan_summary_section.dart';

class ScanDetailedResultView extends GetView<NewScanController> {
  const ScanDetailedResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final patient =
        Get.arguments as PatientModel? ?? controller.selectedPatient.value;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(13, 20, 13, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
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
                  'Select a view to see detailed score:',
                  style: AppTextStyles.caption.copyWith(fontSize: 13),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => ScanDetailViewSelector(
                    selectedView: controller.selectedDetailView.value,
                    onChanged: controller.selectDetailView,
                  ),
                ),
                const SizedBox(height: 16),
                Obx(
                  () => controller.selectedDetailView.value == 'Front View'
                      ? _FrontViewContent()
                      : const _SideViewContent(),
                ),
                const SizedBox(height: 20),
                RetakeScanButton(onPressed: controller.retakeScan),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FrontViewContent extends StatelessWidget {
  const _FrontViewContent();

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Center(
        child: Image.asset(AppAssets.humanside1, height: 260, fit: BoxFit.contain),
      ),
      // const SizedBox(height: 12),
      //  JointDetailList(joints: frontViewJoints),
    ],
  );
}

class _SideViewContent extends StatelessWidget {
  const _SideViewContent();

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Center(
              child: Image.asset(AppAssets.humanside2, height: 260, fit: BoxFit.contain),
            ),
      // const SizedBox(height: 12),
      // Row(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: const [
      //     Expanded(
      //       child: JointDetailList(
      //         joints: sideViewJointsFront,
      //         showHeaders: false,
      //       ),
      //     ),
      //     SizedBox(width: 8),
      //     Expanded(
      //       child: JointDetailList(
      //         joints: sideViewJointsSide,
      //         showHeaders: false,
      //       ),
      //     ),
      //   ],
      // ),
    ],
  );
}
