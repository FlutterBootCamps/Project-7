import 'package:cv_app/extension/spase.dart';
import 'package:flutter/material.dart';

class TextFieldColumn extends StatelessWidget {
  TextFieldColumn(
      {super.key,
      required this.hinttext,
      required this.label,
      required this.controller,
      required this.prefixIcon});
  String label;
  Icon prefixIcon;
  String hinttext;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        sizedBox10,
        TextField(
          controller: controller,
          enabled: false,
          decoration: InputDecoration(
              prefixIcon: prefixIcon,
              hintText: hinttext,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
        )
      ],
    );
  }
}
