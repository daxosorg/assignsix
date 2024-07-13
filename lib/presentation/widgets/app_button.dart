import 'package:assignsix/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, this.borderColor, this.buttonNameColor = Colors.white, this.buttonColor, this.onPressed, required this.buttonName});
  final Color? borderColor;
  final Color? buttonColor;
  final Color? buttonNameColor;
  final String buttonName;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? kButtonColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        onPressed: onPressed ?? () {},
        child: Text(
          buttonName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: "Ulagadi Sans", color: buttonNameColor ?? Colors.white),
        ),
      ),
    );
  }
}
