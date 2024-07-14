import 'package:assignsix/data/datasources/local/database_helper.dart';
import 'package:assignsix/data/models/appointment_model.dart';
import 'package:assignsix/data/repository/appointment_repository_impl.dart';
import 'package:assignsix/presentation/controllers/view_all_appointments/view_all_appointments_controller.dart';
import 'package:assignsix/presentation/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ViewAppointmentController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  String? selectedGender;
  String? selectedPurpose;
  AppointmentRepositoryImpl appointmentRepository = AppointmentRepositoryImpl(databaseHelper: DatabaseHelper());

  bool isNavigatedWithDeepLink = false;

  @override
  void dispose() {
    super.dispose();
    isNavigatedWithDeepLink = false;
  }

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

  void shareAppointment({required AppointmentModel appointment}) async {
    const String deepLinkBase = 'https://clustermap-427204.web.app/appointment';

    const int appointmentId = 0;
    String name = nameController.text;
    String dob = dobController.text;
    String gender = selectedGender ?? "";
    String purpose = selectedPurpose ?? "";

    final Map<String, String> queryParams = {
      'id': appointmentId.toString(),
      'name': name,
      'dob': dob,
      'gender': gender,
      'purpose': purpose,
    };

    final Uri deepLink = Uri(path: deepLinkBase, queryParameters: queryParams);

    Share.share(deepLink.toString());
  }
}
