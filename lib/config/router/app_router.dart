import 'package:assignsix/presentation/controllers/book_appointment/book_appointment_binding.dart';
import 'package:assignsix/presentation/controllers/update_appointment/update_appointment_binding.dart';
import 'package:assignsix/presentation/controllers/view_all_appointments/view_all_appointments_binding.dart';
import 'package:assignsix/presentation/controllers/view_appointment/view_appointment_binding.dart';
import 'package:assignsix/presentation/pages/book_appointment/book_appointment_screen.dart';
import 'package:assignsix/presentation/pages/home/home_screen.dart';
import 'package:assignsix/presentation/pages/update_appointment/update_appointment_screen.dart';
import 'package:assignsix/presentation/pages/view_all_appointments/view_all_appointments_screen.dart';
import 'package:assignsix/presentation/pages/view_appointment/view_appointment_screen.dart';
import 'package:get/get.dart';

class AppRouter {
  AppRouter._();
  static const String initialPage = '/';

  static List<GetPage> pages = [
    GetPage(
      name: HomeScreen.route,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: BookAppointmentScreen.route,
      page: () => const BookAppointmentScreen(),
      binding: BookAppointmentBinding(),
    ),
    GetPage(
      name: ViewAllAppointmentsScreen.route,
      page: () => const ViewAllAppointmentsScreen(),
      binding: ViewAllAppointmentsBinding(),
    ),
    GetPage(
      name: ViewAppointmentScreen.route,
      page: () => ViewAppointmentScreen(),
      binding: ViewAppointmentBinding(),
    ),
    GetPage(
      name: UpdateAppointmentScreen.route,
      page: () => UpdateAppointmentScreen(),
      binding: UpdateAppointmentBinding(),
    ),
  ];
}
