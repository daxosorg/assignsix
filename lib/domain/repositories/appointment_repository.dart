import 'package:assignsix/data/models/appointment_model.dart';
import 'package:assignsix/domain/entities/appointment_entitiy.dart';

abstract class AppointmentRepository {
  Future<bool> saveAppointment({required AppointmentModel appointment});
  Future<List<AppointmentEntity>> readAllAppointments();
  Future<AppointmentModel?> readAppointmentById({required int id});
  Future<bool> updateAppointment({required AppointmentModel appointment});
  Future<bool> deleteAppointmentById({required int id});
  Future<bool> deleteAllAppointments();
}
