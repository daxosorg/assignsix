import 'package:assignsix/presentation/controllers/view_all_appointments/view_all_appointments_controller.dart';
import 'package:assignsix/presentation/widgets/app_appointment.dart';
import 'package:assignsix/presentation/widgets/scaffold_custom_paint.dart';
import 'package:assignsix/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAllAppointmentsScreen extends GetView<ViewAllAppointmentsController> {
  const ViewAllAppointmentsScreen({super.key});

  static String route = '/view-all-appointments';
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: controller.appointmentList.isEmpty
                            ? [
                                SizedBox(height: Get.height * .4),
                                Text(
                                  "No appointments found",
                                  style: kDefaultTextStyle,
                                ),
                              ]
                            : [
                                const SizedBox(height: 40),
                                ...controller.appointmentList.value.map(
                                  (appointment) => AppAppointment(appointment: appointment),
                                ),
                              ],
                      ),
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
