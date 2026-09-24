import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/patient_model.dart';
import '../../../widgets/dialogs/blurred_overlay.dart';
import '../controllers/patient_records_controller.dart';
import '../widgets/patient_delete_dialog.dart';
import '../widgets/patient_detail_widgets.dart';
import 'patient_records_view.dart';

class PatientDetailView extends GetView<PatientRecordsController> {
  const PatientDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Obx(() {
          final patient = controller.selectedPatient.value;
          if (patient == null) return const SizedBox.shrink();
          return Padding(
            padding: const EdgeInsets.fromLTRB(18, 15, 18, 20),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: Get.back,
                      icon: const Icon(Icons.arrow_back_ios_new, size: 17),
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      'Patient Details',
                      style: AppTextStyles.h4.copyWith(fontSize: 17),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => _showMenu(context, patient),
                      icon: const Icon(Icons.more_vert, size: 21),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                const PatientDetailSectionTitle('General Info'),
                PatientInfoRow('Name', patient.name),
                PatientInfoRow('Age', '${patient.age} y'),
                PatientInfoRow('Gender', patient.gender),
                const SizedBox(height: 15),
                const Divider(color: AppColors.divider, height: 1),
                const SizedBox(height: 13),
                const PatientDetailSectionTitle('Scan History'),
                const SizedBox(height: 9),
                ...['2/12', '3/11', '22/11'].map(
                  (date) => Padding(
                    padding: const EdgeInsets.only(bottom: 9),
                    child: PatientScanRow(date: date),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        Get.toNamed('/new-scan', arguments: patient),
                    child: const Text(
                      'New Scan',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  void _showMenu(BuildContext context, PatientModel patient) {
    Get.dialog(
      BlurredOverlay(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.paddingOf(context).top + 48,
            right: 24,
          ),
          child: Material(
            color: Colors.black,
            borderRadius: BorderRadius.circular(7),
            child: SizedBox(
              width: 150,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PatientDetailMenuItem(
                    icon: Icons.edit_outlined,
                    label: 'Edit Record',
                    onTap: () {
                      Get.back();
                      Get.bottomSheet(
                        BlurredOverlay(
                          child: PatientFormSheet(
                            patient: patient,
                            onSubmit: controller.updatePatient,
                          ),
                        ),
                        isScrollControlled: true,
                        barrierColor: Colors.transparent,
                      );
                    },
                  ),
                  const Divider(color: AppColors.divider, height: 1),
                  PatientDetailMenuItem(
                    icon: Icons.remove_circle_outline,
                    label: 'Remove Record',
                    onTap: () {
                      Get.back();
                      _showDeleteConfirmation();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierColor: Colors.transparent,
    );
  }

  void _showDeleteConfirmation() {
    Get.dialog(
      PatientDeleteDialog(onDelete: controller.deleteSelected),
      barrierColor: Colors.transparent,
    );
  }
}
