import 'package:assignsix/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.title,
    this.hintText,
    this.enabled,
    this.controller,
  });

  final String title;
  final String? hintText;
  final bool? enabled;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: kDefaultTextStyle.copyWith(fontSize: 13),
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          height: 50,
          child: TextFormField(
            enabled: enabled,
            controller: controller,
            style: kDefaultTextStyle.copyWith(color: Colors.white, fontSize: 13),
            decoration: InputDecoration(
              border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              fillColor: kTextFieldColor,
              filled: true,
              hintText: hintText,
              hintStyle: kDefaultTextStyle.copyWith(color: Colors.white, fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }
}
