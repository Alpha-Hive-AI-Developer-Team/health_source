import '../models/patient_model.dart';

/// Static repository used while the patient API is not connected.
class PatientRepository {
  static final _patients = [
    PatientModel(
      id: 'patient-1',
      name: 'John Jones',
      age: 33,
      gender: 'Male',
      lastScanLabel: '2/12',
      lastScanDate: DateTime(2026, 2, 12),
    ),
    PatientModel(
      id: 'patient-2',
      name: 'Sarah Jones',
      age: 30,
      gender: 'Female',
      lastScanLabel: '3/12',
      lastScanDate: DateTime(2026, 3, 12),
    ),
    PatientModel(
      id: 'patient-3',
      name: 'Sarah Jones',
      age: 30,
      gender: 'Female',
      lastScanLabel: '3/12',
      lastScanDate: DateTime(2026, 3, 12),
    ),
  ];

  Future<List<PatientModel>> getPatients() async {
    return List.unmodifiable(_patients);
  }
}
