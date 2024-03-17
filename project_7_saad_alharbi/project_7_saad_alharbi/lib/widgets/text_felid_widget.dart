import 'package:flutter/material.dart';
import 'package:project_7_saad_alharbi/utils/colors.dart';

class TextFelidWidget extends StatelessWidget {
  const TextFelidWidget(
      {super.key,
      this.controller,
      required this.hintText,
      required this.title,
      this.icon,
      this.maxLine,
      this.isObscure = false});
  final TextEditingController? controller;
  final String hintText;
  final String title;
  final bool? isObscure;
  final IconData? icon;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: white,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextField(
          
          maxLines: maxLine,
          obscureText: isObscure!,
          controller: controller,
          decoration: InputDecoration(

            prefixIcon: Icon(
              icon,
              color: teal,
            ),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          ),
        ),
      ],
    );
  }
}
