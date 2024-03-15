import 'package:cv_maker_app/utils/colors.dart';
import 'package:flutter/material.dart';

class TextfieldIconed extends StatelessWidget {
  const TextfieldIconed({
    super.key, required this.hintText, required this.labelText, required this.icon, this.controller, this.floatingLabelColor, this.floatingLabelBehaviour, this.isObscured, this.isEnabled,
  });
  final String hintText;
  final String labelText;
  final Icon icon;
  final TextEditingController? controller;
  final Color? floatingLabelColor;
  final FloatingLabelBehavior? floatingLabelBehaviour;
  final bool? isObscured;
  final bool? isEnabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObscured ?? false,
      enabled: isEnabled,
      readOnly: isEnabled ?? false,
      decoration: InputDecoration(
        floatingLabelBehavior: floatingLabelBehaviour,
        floatingLabelStyle: TextStyle(color: floatingLabelColor,),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide.none,
        ),
        prefixIcon: icon,
        fillColor: whiteColor,
        filled: true,
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: blackColor)
      ),
    );
  }
}