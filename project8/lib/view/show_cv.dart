import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project8/bloc/cv_bloc.dart';
import 'package:project8/widgets/cv_widget.dart';

class CVShow extends StatelessWidget {
 

  const CVShow({Key? key, required this.userid});
 final String userid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        appBar: AppBar(
        backgroundColor: const Color(0xff8c7c72),
        title: Text(
          ' Profile',
          style: GoogleFonts.jacquesFrancois(
              fontSize: 22.0, color: const Color(0xfff3f1ee)),
        ),actions: [],
      ),
      backgroundColor: const Color(0xfff3f1ee),
      body: BlocBuilder<CvBloc, CvState>(
        builder: (context, state) {
          // Use the userid to fetch and display the user's CV
          if (state is DisplayState) {
            // Filter CVs based on userid
            final userCVs = state.cvlist.where((cv) => cv.userid == userid).toList();
            return ListView.builder(
              itemCount: userCVs.length,
              itemBuilder: (context, index) {
                return 
                CVWidgetedit(
                  personal: userCVs[index],
                );
                
              },
            );
          }
          return const Center(child: Text("loading"));
        },
      ),
    );
  }
}