import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/cards/patient_summary_card.dart';
import '../../../widgets/buttons/expandable_scan_fab.dart';
import '../../../widgets/text_fields/custom_search_field.dart';
import '../../../core/routes/app_routes.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ExpandableScanFab(
        onProfileTap: () => Get.toNamed(AppRoutes.patientRecords),
        onSettingsTap: () => Get.toNamed(AppRoutes.settings),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Josh!',
                style: AppTextStyles.h3.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 28),
              CustomSearchField(
                hint: 'Search Patients',
                onTap: () => Get.toNamed(AppRoutes.search),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.newScan),
                child: Container(
                  height: 113,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 16,
                        top: 34,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.note_add_outlined,
                              size: 21,
                              color: AppColors.white,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Start a new Scan',
                              style: AppTextStyles.bodyMedium.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        bottom: 8,
                        width: 112,
                        child: Image.asset(
                          AppAssets.home_image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Text(
                    'Patients History',
                    style: AppTextStyles.h4.copyWith(fontSize: 16),
                  ),
                  const Spacer(),
                  Text(
                    'view all',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.white,
                      fontSize: 9,
                    ),
                  ),
                  const SizedBox(width: 3),
                  const Icon(
                    Icons.arrow_outward,
                    color: AppColors.white,
                    size: 12,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Obx(() {
                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: controller.patients.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 13),
                    itemBuilder: (_, i) {
                      return PatientSummaryCard(
                        patient: controller.patients[i],
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
