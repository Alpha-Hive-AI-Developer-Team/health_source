import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/patient_model.dart';
import '../../../data/repositories/patient_repository.dart';

class SearchController extends GetxController {
  final PatientRepository _repository = PatientRepository();
  final queryController = TextEditingController();
  final patients = <PatientModel>[].obs;
  final filteredPatients = <PatientModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadPatients();
    queryController.addListener(_filterPatients);
  }

  Future<void> _loadPatients() async {
    patients.assignAll(await _repository.getPatients());
    filteredPatients.assignAll(patients);
  }

  void _filterPatients() {
    final query = queryController.text.trim().toLowerCase();
    filteredPatients.assignAll(
      patients.where((patient) => patient.name.toLowerCase().contains(query)),
    );
  }

  @override
  void onClose() {
    queryController.dispose();
    super.onClose();
  }
}
