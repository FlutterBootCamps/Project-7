import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/fonts.dart';
import 'package:flutter/material.dart';

class HeadTailText extends StatelessWidget {
  const HeadTailText({
    super.key, required this.headText, required this.tailText, this.headColor = whiteColor, this.tailColor = milkChocolateColor, this.headSize = 16, this.tailSize = 16, this.headWeight = FontWeight.w600, this.tailWeight = FontWeight.w500, this.maxLines = 1,
  });
  final String headText;
  final String tailText;
  final Color? headColor;
  final Color? tailColor;
  final double? headSize;
  final double? tailSize;
  final FontWeight? headWeight;
  final FontWeight? tailWeight;
  final int? maxLines;
  
  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: maxLines,
      overflow: TextOverflow.clip,
      text: TextSpan(
        style: TextStyle(
            color: headColor,
            fontFamily: nohemiFont,
            fontSize: headSize,
            fontWeight: headWeight),
        text: headText,
        children: [
          TextSpan(
              style: TextStyle(
                  color: tailColor,
                  fontFamily: nohemiFont,
                  fontSize: tailSize,
                  fontWeight: tailWeight,),
              text: tailText)
        ],
      ),
    );
  }
}
