import 'package:assignsix/data/datasources/local/database_helper.dart';
import 'package:assignsix/data/models/appointment_model.dart';
import 'package:assignsix/data/repository/appointment_repository_impl.dart';
import 'package:assignsix/presentation/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookAppointmentController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  String? selectedGender;
  String? selectedPurpose;
  AppointmentRepositoryImpl appointmentRepository = AppointmentRepositoryImpl(databaseHelper: DatabaseHelper());

  Future<bool> bookAppointment() async {
    if (nameController.text.isEmpty || dobController.text.isEmpty || selectedGender == null || selectedPurpose == null) {
      AppSnackbar.show(title: "Error", subTitle: "Please fill all the fields");
      return false;
    }
    AppointmentModel appointmentModel = AppointmentModel(
      name: nameController.text,
      dob: dobController.text,
      gender: selectedGender!,
      purpose: selectedPurpose!,
    );
    bool result = await appointmentRepository.saveAppointment(appointment: appointmentModel);
    if (result) {
      Get.back();
    } else {
      AppSnackbar.show(title: "Error", subTitle: "Unable to book appointment");
    }
    return result;
  }
}
