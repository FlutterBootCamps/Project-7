import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project8/view/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff8c7c72),
        title: Text(
          ' Curriculum Vitae (CV)',
          style: GoogleFonts.jacquesFrancois(
              fontSize: 22.0, color: const Color(0xfff3f1ee)),
        ),
      ),
      backgroundColor: const Color(0xfff3f1ee),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: const ProfilePage(),
              ),
            );
          },
          backgroundColor: const Color(0xff8c7c72),
          child: const Icon(
            Icons.add,
            color: Color(0xfff3f1ee),
            size: 30,
          )),
    );
  }
}
