import 'package:flutter/material.dart';

class Textfield2Widget extends StatelessWidget {
  const Textfield2Widget({
    super.key, this.controller, required this.label,  this.max,  this.min,
  });

  final TextEditingController? controller;
 final  String label ;
 final int? max;
 final int? min;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: TextField(
          maxLines: max,
          minLines: min,
          controller: controller,
          decoration:  InputDecoration(
            border: const UnderlineInputBorder(
            ),
            labelText: label,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
}