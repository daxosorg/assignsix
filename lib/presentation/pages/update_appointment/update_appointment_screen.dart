import 'package:assignsix/data/models/appointment_model.dart';
import 'package:assignsix/presentation/controllers/update_appointment/update_appointment_controller.dart';
import 'package:assignsix/presentation/widgets/app_button.dart';
import 'package:assignsix/presentation/widgets/app_dropdown_field.dart';
import 'package:assignsix/presentation/widgets/app_text_form_field.dart';
import 'package:assignsix/presentation/widgets/scaffold_custom_paint.dart';
import 'package:assignsix/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateAppointmentScreen extends GetView<UpdateAppointmentController> {
  UpdateAppointmentScreen({super.key});
  static String route = '/update-appointment-details';

  final AppointmentModel appointment = Get.arguments['appointment'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Update Appointment", style: kDefaultTextStyle.copyWith(fontSize: 18)),
        centerTitle: true,
        leading: InkWell(onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios, color: Colors.white)),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
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
                        AppTextFormField(title: "Name", controller: controller.nameController),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                                child: AppTextFormField(
                              title: "Date of birth",
                              controller: controller.dobController,
                            )),
                            const SizedBox(width: 22),
                            Expanded(
                              child: AppDropdownField(
                                title: "Gender",
                                hintText: "Select Gender",
                                items: kGenderList,
                                value: controller.selectedGender,
                                onChanged: (value) => controller.selectedGender = value,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        AppDropdownField(
                          title: "Purpose",
                          hintText: "Select appointment purpose",
                          items: kPurposeList,
                          value: controller.selectedPurpose,
                          onChanged: (value) => controller.selectedPurpose = value,
                        ),
                        SizedBox(height: Get.height * .4),
                        AppButton(buttonName: "Update Appointment", onPressed: () => controller.updateAppointmentDetails(id: appointment.id!))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
