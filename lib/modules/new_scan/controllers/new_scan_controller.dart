import 'dart:async';
import 'package:get/get.dart';
import 'package:health_source/modules/new_scan/views/scan_detailed_result_view.dart';
import '../../../data/models/patient_model.dart';
import '../../../data/repositories/patient_repository.dart';

class NewScanController extends GetxController {
  final PatientRepository _repository = PatientRepository();
  final patients = <PatientModel>[].obs;
  final searchQuery = ''.obs;
  final selectedPatient = Rxn<PatientModel>();
  final selectedScan = 'Full Body Scan'.obs;
  final selectedResultView = 'Front View'.obs;
  final progress = 0.0.obs;
  final isScanning = false.obs;
  Timer? _timer;
final selectedDetailView = 'Front View'.obs;

  void selectDetailView(String view) => selectedDetailView.value = view;

  void openDetailedResults() {
    Get.to(
      () => const ScanDetailedResultView(),
      arguments: selectedPatient.value,
    );
  }
  @override
  void onInit() {
    super.onInit();
    _loadPatients();
    final argument = Get.arguments;
    if (argument is PatientModel) selectedPatient.value = argument;
  }

  Future<void> _loadPatients() async =>
      patients.assignAll(await _repository.getPatients());

  List<PatientModel> get filteredPatients {
    final query = searchQuery.value.trim().toLowerCase();
    if (query.isEmpty) return patients;
    return patients
        .where((patient) => patient.name.toLowerCase().contains(query))
        .toList();
  }

  void choosePatient(PatientModel patient) => selectedPatient.value = patient;

  void setSearchQuery(String query) => searchQuery.value = query;

  void continueToScanType() {
    if (selectedPatient.value != null) Get.toNamed('/new-scan/instructions');
  }

  void continueToReady() => Get.toNamed('/new-scan/ready');

  void selectResultView(String view) => selectedResultView.value = view;

  void retakeScan() => Get.offNamed('/new-scan');

  void startScan() {
    isScanning.value = true;
    progress.value = 0;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 180), (timer) {
      progress.value = (progress.value + .025).clamp(0, 1);
      if (progress.value >= 1) {
        timer.cancel();
        isScanning.value = false;
        Get.toNamed('/new-scan/result', arguments: selectedPatient.value);
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
