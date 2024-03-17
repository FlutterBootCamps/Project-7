import 'package:cv_creator_app/constrans/color.dart';
import 'package:cv_creator_app/helper/screen_helper.dart';
import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: context.getWidth() * 0.35,
        height: context.getHeight() * 0.037,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: darkGreen,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Text(
          title,
          // "contact Me",
          style: const TextStyle(
              color: white, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
