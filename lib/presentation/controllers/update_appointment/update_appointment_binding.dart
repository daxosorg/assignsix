import 'package:assignsix/presentation/controllers/update_appointment/update_appointment_controller.dart';
import 'package:get/get.dart';

class UpdateAppointmentBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => UpdateAppointmentController());
}
