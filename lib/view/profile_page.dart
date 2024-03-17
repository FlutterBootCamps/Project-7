import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project8/service/database.dart';
import 'package:project8/view/edite_page.dart';
import 'package:project8/view/personalpage.dart';
import 'package:project8/view/tamplet_page.dart';
import 'package:project8/view/show_cv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff8c7c72),
        title: Text(
          ' Profile',
          style: GoogleFonts.jacquesFrancois(
              fontSize: 22.0, color: const Color(0xfff3f1ee)),
        ),
      ),
      backgroundColor: const Color(0xfff3f1ee),
      body: SafeArea(
          child: ListView(
        children: [
          listTileWidget(
            text: 'Personal Details',
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: PersonalPage(),
                ),
              );
            },
          ),
           listTileWidget(
              text: 'MY CV',
              onTap: () async {
               final String userid = await getUserId();
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CVShow(userid: userid),
                  ),
                );
                          },
          ),
          listTileWidget(
            text: 'Explorer',
            onTap: () {
          
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TempletPage(),
                  ),);},
          ),
      
        ],
      )),
    );
  }
}

class listTileWidget extends StatelessWidget {
  const listTileWidget({super.key, required this.text, required this.onTap});
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.red[900]),
          child: const Icon(Icons.edit_document, color: Color(0xfff3f1ee)),
        ),
        title: Text(
          text,
          style: GoogleFonts.jacquesFrancois(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: const Color(0xff8c7c72)),
        ),
        trailing: const Icon(Icons.chevron_right_sharp, color: Colors.black),
      ),
    );
  }
}
