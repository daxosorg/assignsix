import 'package:assignsix/data/datasources/local/database_helper.dart';
import 'package:assignsix/data/models/appointment_model.dart';
import 'package:assignsix/domain/repositories/appointment_repository.dart';

class AppointmentRepositoryImpl extends AppointmentRepository {
  DatabaseHelper databaseHelper;
  AppointmentRepositoryImpl({required this.databaseHelper});
  @override
  Future<List<AppointmentModel>> readAllAppointments() async => await databaseHelper.getAppointments();

  @override
  Future<bool> deleteAllAppointments() async => await databaseHelper.deleteAllAppointments();

  @override
  Future<bool> deleteAppointmentById({required int id}) async => await databaseHelper.deleteAppointment(id);

  @override
  Future<AppointmentModel?> readAppointmentById({required int id}) async => await databaseHelper.getAppointment(id);

  @override
  Future<bool> updateAppointment({required AppointmentModel appointment}) async => await databaseHelper.updateAppointment(appointment);

  @override
  Future<bool> saveAppointment({required AppointmentModel appointment}) async => await databaseHelper.insertAppointment(appointment);
}
