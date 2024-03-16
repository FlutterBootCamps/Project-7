import 'package:cv_maker_app/utils/fonts.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key, required this.buttonColor, this.buttonWidth, required this.textColor, required this.text, required this.textSize, this.onTap,
  });

  final Color buttonColor;
  final double? buttonWidth;
  final Color textColor;
  final String text;
  final double textSize;
  final Function()? onTap; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(buttonColor),
            ),
            onPressed: onTap,
            child: Text(
              text,
              style: TextStyle(
                  color: textColor,
                  fontFamily: nohemiFont,
                  fontSize: textSize),
            )),
    );
  }
}
