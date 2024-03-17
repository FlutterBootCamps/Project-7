import 'package:flutter/material.dart';
import 'package:project_7_saad_alharbi/utils/colors.dart';

class IconTextWidget extends StatelessWidget {
  IconTextWidget({super.key, this.icon, required this.text});
  String text;
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          maxRadius: 15,
          backgroundColor: teal,
          child: Icon(
            icon,
            color: black,
            size: 25,
          ),
        ),
        Text(
          "  $text",
          style: TextStyle(
            color: white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
