import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class titalwidget extends StatelessWidget {
  const titalwidget({
    super.key, required this.tital,
  });
final String tital;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xff8c7c72),
      highlightColor:  Colors.black,
      child: Text(
        tital,
        textAlign: TextAlign.center,
        //jacquesFrancois
        style: GoogleFonts.fleurDeLeah(
          fontSize: 50.0,
        ),
      ),
    );
  }
}
