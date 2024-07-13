import 'package:assignsix/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackbar {
  static show({required String title, required String subTitle}) => Get.snackbar(title, subTitle, backgroundColor: kTextFieldColor, colorText: Colors.white);
}
