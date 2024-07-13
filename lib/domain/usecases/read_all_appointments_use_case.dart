import 'package:assignsix/config/core/usecases/no_param_usecase.dart';
import 'package:assignsix/domain/entities/appointment_entitiy.dart';
import 'package:assignsix/domain/repositories/appointment_repository.dart';

class ReadAllAppointmentsUseCase extends NoParamUseCase {
  final AppointmentRepository _repo;
  ReadAllAppointmentsUseCase(this._repo);

  @override
  Future<List<AppointmentEntity>> execute() {
    return _repo.readAllAppointments();
  }
}
