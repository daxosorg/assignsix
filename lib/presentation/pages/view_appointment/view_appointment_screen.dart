import 'package:assignsix/data/models/appointment_model.dart';
import 'package:assignsix/presentation/controllers/update_appointment/update_appointment_controller.dart';
import 'package:assignsix/presentation/controllers/view_appointment/view_appointment_controller.dart';
import 'package:assignsix/presentation/pages/update_appointment/update_appointment_screen.dart';
import 'package:assignsix/presentation/widgets/app_button.dart';
import 'package:assignsix/presentation/widgets/app_dropdown_field.dart';
import 'package:assignsix/presentation/widgets/app_text_form_field.dart';
import 'package:assignsix/presentation/widgets/scaffold_custom_paint.dart';
import 'package:assignsix/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAppointmentScreen extends GetView<ViewAppointmentController> {
  ViewAppointmentScreen({super.key});
  static String route = '/view-appointment';

  final AppointmentModel appointment = Get.arguments['apointment'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("View Appointment", style: kDefaultTextStyle.copyWith(fontSize: 18)),
        centerTitle: true,
        leading: InkWell(onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios, color: Colors.white)),
      ),
      body: Stack(
        children: [
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ScaffoldCustomPaint(),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset('assets/images/img ellipse 1.png', colorBlendMode: BlendMode.srcIn, color: Colors.white24),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextFormField(title: "Name", controller: TextEditingController(text: appointment.name), enabled: false),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(child: AppTextFormField(title: "Date of Birth", controller: TextEditingController(text: appointment.dob), enabled: false)),
                          const SizedBox(width: 22),
                          Expanded(
                            child: AppDropdownField(
                              title: "Gender",
                              items: [appointment.gender],
                              value: appointment.gender,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      AppDropdownField(
                        title: "Purpose",
                        items: [appointment.purpose],
                        value: appointment.purpose,
                      ),
                      SizedBox(height: Get.height * .3),
                      AppButton(
                        buttonName: 'Edit Details',
                        borderColor: Colors.green,
                        buttonColor: Colors.transparent,
                        onPressed: () {
                          UpdateAppointmentController controller = Get.put(UpdateAppointmentController());
                          controller.nameController.text = appointment.name;
                          controller.dobController.text = appointment.dob;
                          controller.selectedGender = appointment.gender;
                          controller.selectedPurpose = appointment.purpose;
                          Get.toNamed(UpdateAppointmentScreen.route, arguments: {'appointment': appointment});
                        },
                      ),
                      const SizedBox(height: 20),
                      AppButton(
                        buttonName: 'Delete Appointment',
                        buttonNameColor: Colors.red,
                        buttonColor: Colors.transparent,
                        onPressed: () => controller.deleteAppointment(id: appointment.id!),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
