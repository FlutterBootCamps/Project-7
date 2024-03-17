
import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({
    super.key, required this.labelText,required this.controller,
 
  });
 final String labelText;
  // final String hintText;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
     return 
    Container(
  margin: const EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: const Color(0xffc5bbb9),
    borderRadius: BorderRadius.circular(6),
    border: Border.all(color: Colors.black, width: 2),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), 
      ),
    ],
  ),
  padding: const EdgeInsets.all(8.0),
  child: TextField(
    controller: controller,
    decoration: InputDecoration(
      border: InputBorder.none,
      labelText: labelText,
      // hintText: hintText,
    ),
  ),
);
  }
}