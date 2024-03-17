import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project8/bloc/cv_bloc.dart';
import 'package:project8/model/cv_model.dart';
import 'package:project8/widgets/cv_widget.dart';

class TempletPage extends StatelessWidget {
  const TempletPage({super.key});

  @override
  Widget build(BuildContext context) {
     final bloc = context.read<CvBloc>();
    bloc.add(FetchEvent());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff8c7c72),
        title: Text(
          ' CV',
          style: GoogleFonts.jacquesFrancois(
              fontSize: 22.0, color: const Color(0xfff3f1ee)),
        ),
      ),
      backgroundColor: const Color(0xfff3f1ee),
      body: BlocBuilder<CvBloc, CvState>(
        builder: (context, state) {
          if (state is DisplayState) {
            return ListView.builder(
             itemCount:state.cvlist.length,
              itemBuilder: (context, index) {
              return 
                    CVWidget(
                personal: state.cvlist[index],
              );
            });
          }
          return const Center(child: Text("loading"));
        },
      )
      
    );
  }
}



