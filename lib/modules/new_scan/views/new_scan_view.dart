import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/new_scan_controller.dart';
import '../widgets/patient_result_tile.dart';
import '../widgets/scan_search_field.dart';
import '../widgets/scan_step_button.dart';
import '../widgets/scan_step_scaffold.dart';
import '../widgets/scan_step_title.dart';

class NewScanView extends GetView<NewScanController> {
  const NewScanView({super.key});

  @override
  Widget build(BuildContext context) => ScanStepScaffold(
    child: Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ScanStepTitle(
            title: 'Select Patient',
            subtitle: 'You can select a patient from existing records',
          ),
          const SizedBox(height: 20),
          const Text('Select a patient', style: TextStyle(fontSize: 8)),
          const SizedBox(height: 5),
          ScanSearchField(onChanged: controller.setSearchQuery),
          const SizedBox(height: 7),
          if (controller.searchQuery.value.isNotEmpty)
            ...controller.filteredPatients.map(
              (patient) => Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: PatientResultTile(
                  patient: patient,
                  selected: controller.selectedPatient.value?.id == patient.id,
                  onTap: () => controller.choosePatient(patient),
                ),
              ),
            ),
          if (controller.searchQuery.value.isNotEmpty &&
              controller.filteredPatients.isEmpty)
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text('No patients found', style: TextStyle(fontSize: 8)),
            ),
          const Spacer(),
          ScanStepButton(
            label: 'Next',
            onPressed: controller.selectedPatient.value == null
                ? null
                : controller.continueToScanType,
          ),
        ],
      ),
    ),
  );
}
