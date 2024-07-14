import 'dart:async';

import 'package:assignsix/config/router/app_router.dart';
import 'package:assignsix/data/models/appointment_model.dart';
import 'package:assignsix/presentation/controllers/view_appointment/view_appointment_controller.dart';
import 'package:assignsix/presentation/pages/view_appointment/view_appointment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_links2/uni_links.dart';

late String? initialLink;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initialLink = await getInitialLink();
  if (initialLink != null) {
    final Uri deepLink = Uri.parse(Uri.decodeFull(initialLink!));
    final Map<String, String> queryParams = deepLink.queryParameters;

    ViewAppointmentController controller = Get.put(ViewAppointmentController());
    controller.nameController.text = queryParams["name"] ?? '';
    controller.dobController.text = queryParams["dob"] ?? '';
    controller.selectedGender = queryParams["gender"] ?? '';
    controller.selectedPurpose = queryParams["purpose"] ?? '';
    AppointmentModel appointmentModel = AppointmentModel(
      name: queryParams["name"]!,
      dob: queryParams["dob"]!,
      gender: queryParams["gender"]!,
      purpose: queryParams["purpose"]!,
    );

    controller.isNavigatedWithDeepLink = true;
    Future.delayed(const Duration(seconds: 1), () {
      Get.toNamed(ViewAppointmentScreen.route, arguments: {'apointment': appointmentModel});
    });
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
      initialRoute: AppRouter.initialPage,
      getPages: AppRouter.pages,
    );
  }
}
