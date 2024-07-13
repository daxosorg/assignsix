class AppointmentEntity {
  const AppointmentEntity({
    this.id,
    required this.name,
    required this.dob,
    required this.gender,
    required this.purpose,
  });

  final int? id;
  final String name;
  final String dob;
  final String gender;
  final String purpose;
}
