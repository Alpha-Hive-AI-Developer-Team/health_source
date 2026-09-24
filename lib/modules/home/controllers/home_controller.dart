import 'package:get/get.dart';
import '../../../data/models/patient_model.dart';
import '../../../data/repositories/patient_repository.dart';

/// View model for HomeView. Holds reactive state only, without widget code.
/// This is the pattern every module/<feature>/controllers/*_controller.dart follows.
class HomeController extends GetxController {
  final PatientRepository _repository = PatientRepository();

  final isLoading = false.obs;
  final patients = <PatientModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPatients();
  }

  Future<void> fetchPatients() async {
    isLoading.value = true;
    final result = await _repository.getPatients();
    patients.assignAll(result);
    isLoading.value = false;
  }
}
