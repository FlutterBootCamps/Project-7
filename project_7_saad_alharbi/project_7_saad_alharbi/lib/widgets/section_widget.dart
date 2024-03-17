import 'package:flutter/material.dart';
import 'package:project_7_saad_alharbi/utils/colors.dart';
import 'package:project_7_saad_alharbi/utils/spacing.dart';

class SectionWidget extends StatelessWidget {
  SectionWidget({
    required this.header,
    required this.content,
    super.key,
  });

  String header;
  String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height10,
        Text(
          header,
          style:
              TextStyle(color: teal, fontSize: 35, fontWeight: FontWeight.bold),
        ),
        height8,
        Text(
          content,
          style: TextStyle(
            color: white,
            fontSize: 16,
          ),
        ),
        height10,
        Divider(
          color: teal,
        ),
      ],
    );
  }
}
