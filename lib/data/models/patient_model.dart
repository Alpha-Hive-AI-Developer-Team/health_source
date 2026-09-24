/// Example of the pattern every model in data/models should follow:
/// immutable fields + fromJson/toJson. Controllers never touch raw Maps.
class PatientModel {
  final String id;
  final String name;
  final int age;
  final String gender;
  final String lastScanLabel;
  final String? avatarUrl;
  final DateTime lastScanDate;

  const PatientModel({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.lastScanLabel,
    required this.lastScanDate,
    this.avatarUrl,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'] as String,
      name: json['name'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      lastScanLabel: json['last_scan_label'] as String,
      avatarUrl: json['avatar_url'] as String?,
      lastScanDate: DateTime.parse(json['last_scan_date'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'age': age,
    'gender': gender,
    'last_scan_label': lastScanLabel,
    'avatar_url': avatarUrl,
    'last_scan_date': lastScanDate.toIso8601String(),
  };
}
