import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textwidget extends StatelessWidget {
  const Textwidget({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
     children: [
       Text(text,
              style: GoogleFonts.jacquesFrancois(
                  fontSize: 16.0, fontWeight: FontWeight.bold,color:  Colors.black),),
       Text('*',
              style: GoogleFonts.jacquesFrancois(
                 color: const Color.fromARGB(255, 210, 32, 32)),),
     ],
                    );
  }
}