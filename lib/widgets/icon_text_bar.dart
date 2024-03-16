import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/fonts.dart';
import 'package:cv_maker_app/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconTextBar extends StatelessWidget {
  const IconTextBar({
    super.key, required this.text, required this.icon,
  });
  final String text;
  final FaIcon icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        width8,
        Text(text, style: const TextStyle(color: whiteColor, fontFamily: nohemiFont, fontSize: 16,),)
      ],
    );
  }
}