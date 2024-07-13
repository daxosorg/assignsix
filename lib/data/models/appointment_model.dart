import 'package:assignsix/domain/entities/appointment_entitiy.dart';

class AppointmentModel extends AppointmentEntity {
  const AppointmentModel({
    super.id,
    required super.name,
    required super.dob,
    required super.gender,
    required super.purpose,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'dob': dob,
      'gender': gender,
      'purpose': purpose,
    };
  }

  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      id: map['id'],
      name: map['name'],
      dob: map['dob'],
      gender: map['gender'],
      purpose: map['purpose'],
    );
  }
}
