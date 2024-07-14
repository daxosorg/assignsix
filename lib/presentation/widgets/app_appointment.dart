import 'package:assignsix/data/models/appointment_model.dart';
import 'package:assignsix/presentation/controllers/view_appointment/view_appointment_controller.dart';
import 'package:assignsix/presentation/pages/view_appointment/view_appointment_screen.dart';
import 'package:assignsix/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppAppointment extends StatelessWidget {
  const AppAppointment({
    super.key,
    required this.appointment,
  });
  final AppointmentModel appointment;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ViewAppointmentController controller = Get.put(ViewAppointmentController());
        controller.nameController.text = appointment.name;
        controller.dobController.text = appointment.dob;
        controller.selectedGender = appointment.gender;
        controller.selectedPurpose = appointment.purpose;
        Get.toNamed(ViewAppointmentScreen.route, arguments: {'apointment': appointment});
      },
      child: Container(
        height: 54,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(color: kTextFieldColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              appointment.name,
              style: kDefaultTextStyle.copyWith(fontSize: 18),
            ),
            Text(
              "View",
              style: kDefaultTextStyle.copyWith(fontSize: 13, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
