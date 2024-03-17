import 'package:flutter/material.dart';

class TextfieldNumber extends StatelessWidget {
  const TextfieldNumber({
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
    // color: const Color(0xffc5bbb9),
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
     keyboardType: TextInputType.number,
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
class TextfieldMultiline extends StatelessWidget {
  const TextfieldMultiline({
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
    // color: const Color(0xffc5bbb9),
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
     keyboardType: TextInputType.multiline,
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