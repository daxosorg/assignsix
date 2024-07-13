import 'package:assignsix/presentation/controllers/appointment/appointment_controller.dart';
import 'package:assignsix/presentation/pages/book_appointment/book_appointment_screen.dart';
import 'package:assignsix/presentation/pages/view_all_appointments/view_all_appointments_screen.dart';
import 'package:assignsix/presentation/widgets/app_button.dart';
import 'package:assignsix/presentation/widgets/scaffold_custom_paint.dart';
import 'package:assignsix/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String route = '/';

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AppointmentController());
    return Scaffold(
      body: Stack(
        children: [
          const SizedBox(width: double.infinity, height: double.infinity, child: ScaffoldCustomPaint()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/spherepng2x.png', colorBlendMode: BlendMode.color, color: kScaffoldMiddleColor),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text("WELCOME TO", style: kDefaultTextStyle.copyWith(fontSize: 23, fontFamily: "Perpetua Titling MT", fontWeight: FontWeight.w300)),
                    Text("Moshi Moshi", style: kDefaultTextStyle.copyWith(fontSize: 58, fontFamily: "Bell MT")),
                    const SizedBox(height: 10),
                    Text(
                      "Say goodbye to scheduling chaos! With Moshi Moshi, book and manage your appointments with ease.",
                      style: kDefaultTextStyle.copyWith(fontWeight: FontWeight.w300, height: 26 / 14),
                    ),
                    const SizedBox(height: 100),
                    AppButton(buttonName: 'Book appointment', onPressed: () => Get.toNamed(BookAppointmentScreen.route)),
                    const SizedBox(height: 20),
                    AppButton(buttonName: 'View appointment', buttonColor: Colors.transparent, onPressed: () => Get.toNamed(ViewAllAppointmentsScreen.route)),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
