import 'package:assignsix/presentation/controllers/view_all_appointments/view_all_appointments_controller.dart';
import 'package:get/get.dart';

class ViewAllAppointmentsBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => ViewAllAppointmentsController());
}
