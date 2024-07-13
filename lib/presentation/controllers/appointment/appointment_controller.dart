import 'package:assignsix/data/datasources/local/database_helper.dart';
import 'package:assignsix/data/models/appointment_model.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Rx<List<AppointmentModel>> appointments = Rx<List<AppointmentModel>>([]);
}
