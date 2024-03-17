import 'package:cv_creator_app/constrans/color.dart';
import 'package:cv_creator_app/helper/screen_helper.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({super.key, this.controller, required this.hintText, required this.icon});
  TextEditingController? controller;
  final String hintText;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: context.getWidth() * 0.8,
        child: TextField(
          controller: controller,
          style: const TextStyle(color: darkGreen, fontSize: 18),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: darkGreen, width: 3, style: BorderStyle.solid),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(color: grey, fontSize: 16),
            fillColor: lightGrey,
            filled: true,
            prefixIcon:  icon ,
            prefixIconColor: grey,
          ),
        ),
      ),
    );
  }
}
