import 'package:assignsix/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class AppDropdownField extends StatelessWidget {
  const AppDropdownField({
    super.key,
    required this.title,
    this.hintText,
    required this.items,
    required this.value,
    this.onChanged,
  });

  final String title;
  final String? hintText;
  final List<String> items;
  final String? value;
  final ValueChanged<String?>? onChanged;

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
          child: DropdownButtonFormField<String>(
            isDense: true,
            isExpanded: true,
            decoration: InputDecoration(
              border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              fillColor: kTextFieldColor,
              filled: true,
              hintText: hintText,
            ),
            value: value,
            items: items
                .map(
                  (String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: kDefaultTextStyle.copyWith(color: Colors.white, fontSize: 13),
                    ),
                  ),
                )
                .toList(),
            hint: hintText == null
                ? null
                : Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      hintText!,
                      style: kDefaultTextStyle.copyWith(color: Colors.white, fontSize: 13),
                    ),
                  ),
            onChanged: onChanged,
            dropdownColor: Colors.black,
            icon: const Icon(Icons.keyboard_arrow_down, size: 26, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
