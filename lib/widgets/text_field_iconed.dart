import 'package:cv_maker_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldIconed extends StatelessWidget {
  const TextfieldIconed({
    super.key, required this.hintText, required this.labelText, required this.icon, this.controller, this.floatingLabelColor = blackColor, this.floatingLabelBehaviour, this.isObscured, this.isEnabled = true, this.fillColor = whiteColor, this.keyboardType, this.inputFormatters, this.onEditingComplete, this.onTap, this.isReadOnly,
  });
  final String hintText;
  final String labelText;
  final Icon icon;
  final TextEditingController? controller;
  final Color? floatingLabelColor;
  final FloatingLabelBehavior? floatingLabelBehaviour;
  final bool? isObscured;
  final bool? isEnabled;
  final bool? isReadOnly;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onEditingComplete;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      onChanged: (value) {},
      onSubmitted: (value) {},
      onEditingComplete: onEditingComplete,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: isObscured ?? false,
      enabled: isEnabled,
      readOnly: isReadOnly ?? false,
      decoration: InputDecoration(
        floatingLabelBehavior: floatingLabelBehaviour,
        floatingLabelStyle: TextStyle(color: floatingLabelColor,),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide.none,
        ),
        prefixIcon: icon,
        fillColor: fillColor,
        filled: true,
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: blackColor)
      ),
    );
  }
}