import 'package:assignsix/presentation/controllers/view_appointment/view_appointment_controller.dart';
import 'package:get/get.dart';

class ViewAppointmentBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => ViewAppointmentController());
}
