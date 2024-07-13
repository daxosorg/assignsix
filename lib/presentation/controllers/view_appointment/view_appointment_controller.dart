import 'package:assignsix/data/datasources/local/database_helper.dart';
import 'package:assignsix/data/repository/appointment_repository_impl.dart';
import 'package:assignsix/presentation/controllers/view_all_appointments/view_all_appointments_controller.dart';
import 'package:assignsix/presentation/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAppointmentController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  String? selectedGender;
  String? selectedPurpose;
  AppointmentRepositoryImpl appointmentRepository = AppointmentRepositoryImpl(databaseHelper: DatabaseHelper());

  Future<bool> deleteAppointment({required int id}) async {
    bool result = await appointmentRepository.deleteAppointmentById(id: id);
    if (result) {
      Get.find<ViewAllAppointmentsController>().appointmentList
        ..removeWhere((element) => element.id == id)
        ..refresh();
      Get.back();
    } else {
      AppSnackbar.show(title: "Error", subTitle: "Unable to delete appointment");
    }
    return result;
  }
}
