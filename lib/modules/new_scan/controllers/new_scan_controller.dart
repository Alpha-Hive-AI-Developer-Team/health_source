import 'dart:async';
import 'package:get/get.dart';
import 'package:health_source/modules/new_scan/views/scan_detailed_result_view.dart';
import '../../../core/utils/helpers.dart';
import '../../../data/models/patient_model.dart';
import '../../../data/repositories/patient_repository.dart';
import '../widgets/export_report_sheet.dart';

class NewScanController extends GetxController {
  final PatientRepository _repository = PatientRepository();
  final patients = <PatientModel>[].obs;
  final searchQuery = ''.obs;
  final selectedPatient = Rxn<PatientModel>();
  final selectedScan = 'Full Body Scan'.obs;
  final selectedResultView = 'Front View'.obs;
  final movements = const ['Overhead squat', 'Jumping Jacks', 'Dummy move'];
  final currentMovementIndex = 0.obs;
  final isMovementComplete = false.obs;
  final isGeneratingReport = false.obs;
  Timer? _timer;

  String get currentMovement => movements[currentMovementIndex.value];
  bool get isLastMovement => currentMovementIndex.value == movements.length - 1;
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

  void openExportSheet() => ExportReportSheet.show(onDownload: downloadReport);

  // TODO: generate and save the real report file.
  void downloadReport(String fileType) => Helpers.showSnackbar(
    'Download Report',
    'Your report will be downloaded as $fileType.',
  );

  void startScan() {
    currentMovementIndex.value = 0;
    isGeneratingReport.value = false;
    _captureMovement();
    Get.toNamed('/new-scan/progress');
  }

  // TODO: replace the timer with real pose capture once the camera is wired up.
  void _captureMovement() {
    isMovementComplete.value = false;
    _timer?.cancel();
    _timer = Timer(
      const Duration(seconds: 3),
      () => isMovementComplete.value = true,
    );
  }

  void nextMovement() {
    if (!isMovementComplete.value || isLastMovement) return;
    currentMovementIndex.value++;
    _captureMovement();
  }

  void endScan() {
    if (!isMovementComplete.value) return;
    isGeneratingReport.value = true;
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 3), () {
      isGeneratingReport.value = false;
      Get.offNamed('/new-scan/result', arguments: selectedPatient.value);
    });
  }

  void cancelScan() {
    _timer?.cancel();
    isMovementComplete.value = false;
    isGeneratingReport.value = false;
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
