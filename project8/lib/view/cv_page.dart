import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project8/model/cv_model.dart';
import 'package:project8/widgets/cv_widget.dart';

class CVPage extends StatelessWidget {
  final CV newCV;

  const CVPage({Key? key, required this.newCV}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff8c7c72),
        title: Text(
          'New CV',
          style: GoogleFonts.jacquesFrancois(
            fontSize: 22.0,
            color: const Color(0xfff3f1ee),
          ),
        ),
      ),
      backgroundColor: const Color(0xfff3f1ee),
      body: ListView(
        children: [
          CVWidgetedit(personal: newCV),
        ],
      ),
    );
  }
}
