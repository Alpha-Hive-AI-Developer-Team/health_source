import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_source/core/constants/app_assets.dart';
import '../../../data/models/patient_model.dart';
import '../../../data/repositories/patient_repository.dart';
import '../../../widgets/dialogs/blurred_overlay.dart';

class PatientRecordsController extends GetxController {
  final PatientRepository _repository = PatientRepository();
  final patients = <PatientModel>[].obs;
  final selectedPatient = Rxn<PatientModel>();

  @override
  void onInit() {
    super.onInit();
    loadPatients();
  }

  Future<void> loadPatients() async =>
      patients.assignAll(await _repository.getPatients());

  void selectPatient(PatientModel patient) {
    selectedPatient.value = patient;
    Get.toNamed('/patient-records/detail');
  }

  void addPatient(String name, String gender, DateTime dateOfBirth) {
    patients.add(
      PatientModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        gender: gender,
        age: DateTime.now().year - dateOfBirth.year,
        lastScanLabel: '--',
        lastScanDate: DateTime.now(),
      ),
    );
    Get.back();
    _showSuccess('You have added a new patient successfully!');
  }

  void updatePatient(String name, String gender, DateTime dateOfBirth) {
    final patient = selectedPatient.value;
    if (patient == null) return;
    final updated = PatientModel(
      id: patient.id,
      name: name,
      gender: gender,
      age: DateTime.now().year - dateOfBirth.year,
      lastScanLabel: patient.lastScanLabel,
      lastScanDate: patient.lastScanDate,
    );
    final index = patients.indexWhere((item) => item.id == patient.id);
    if (index != -1) patients[index] = updated;
    selectedPatient.value = updated;
    Get.back();
    _showSuccess('Patient record has been updated successfully!');
  }

  void deleteSelected() {
    final patient = selectedPatient.value;
    if (patient == null) return;
    patients.removeWhere((item) => item.id == patient.id);
    Get.back();
    _showSuccess("Patient's record has been deleted successfully!");
  }

 
void _showSuccess(String message) {
    Get.dialog(
      _SuccessDialog(message: message),
      barrierColor: Colors.transparent, // blur is drawn by the dialog itself
      barrierDismissible: true,
    );
  }
}

class _SuccessDialog extends StatelessWidget {
  final String message;
  const _SuccessDialog({required this.message});

  // static const String _successImage = 'assets/images/success_mark.png';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: Get.back, // tap outside to close
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          color: Colors.black.withOpacity(0.35),
          alignment: Alignment.center, // centered, not bottom
          child: GestureDetector(
            onTap: () {}, // taps inside the box don't close it
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 36),
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppAssets.successmark,
                      width: 99,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Successful!',
                      textAlign: TextAlign.center,
                      style: Get.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
