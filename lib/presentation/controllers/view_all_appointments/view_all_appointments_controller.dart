import 'dart:developer';

import 'package:assignsix/data/datasources/local/database_helper.dart';
import 'package:assignsix/data/models/appointment_model.dart';
import 'package:assignsix/data/repository/appointment_repository_impl.dart';
import 'package:assignsix/presentation/widgets/app_snackbar.dart';
import 'package:get/get.dart';

class ViewAllAppointmentsController extends GetxController {
  RxList<AppointmentModel> appointmentList = <AppointmentModel>[].obs;

  AppointmentRepositoryImpl appointmentRepository = AppointmentRepositoryImpl(databaseHelper: DatabaseHelper());

  @override
  Future<void> onInit() async {
    super.onInit();
    await getAppointmentList();
  }

  Future<void> getAppointmentList() async {
    try {
      List<AppointmentModel> appointments = await appointmentRepository.readAllAppointments();
      // appointmentList.value.clear();
      appointmentList.value = List<AppointmentModel>.from(appointments);
      appointmentList.refresh();
    } catch (e) {
      AppSnackbar.show(title: "Error", subTitle: e.toString());
      log(e.toString());
    }
  }
}
