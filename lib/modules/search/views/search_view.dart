import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/cards/patient_summary_card.dart';
import '../../../widgets/text_fields/custom_search_field.dart';
import '../controllers/search_controller.dart' as search;

class SearchView extends GetView<search.SearchController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: Get.back,
                    icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                    color: AppColors.white,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints.tightFor(
                      width: 28,
                      height: 28,
                    ),
                  ),
                  const SizedBox(width: 26),
                  Text(
                    'Search Patient',
                    style: AppTextStyles.h4.copyWith(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 26),
              CustomSearchField(
                controller: controller.queryController,
                hint: 'Search Patients',
              ),
              const SizedBox(height: 18),
              Expanded(
                child: Obx(() {
                  if (controller.filteredPatients.isEmpty) {
                    return Center(
                      child: Text(
                        'No patients found',
                        style: AppTextStyles.bodySmall,
                      ),
                    );
                  }
                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: controller.filteredPatients.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (_, index) => PatientSummaryCard(
                      patient: controller.filteredPatients[index],
                    ),
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
