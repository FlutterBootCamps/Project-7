import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextNameTitle extends StatelessWidget {
  const TextNameTitle({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.jacquesFrancois(
          fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}

class Iconwidget extends StatelessWidget {
  const Iconwidget({
    super.key,
    required this.icon,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Icon(
        icon,
        size: 10,
      ),
    );
  }
}

class TextTitelCV extends StatelessWidget {
  const TextTitelCV({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: GoogleFonts.jacquesFrancois(
                fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Container(
            height: 2,
            width: 40,
            color: const Color(0xff8c7c72),
          )
        ],
      ),
    );
  }
}

class TextCVwidget extends StatelessWidget {
  const TextCVwidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        text,
        style: GoogleFonts.jacquesFrancois(fontSize: 8.0, color: Colors.black),
      ),
    );
  }
}
