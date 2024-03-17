import 'package:cv_app/extension/colors.dart';
import 'package:cv_app/models/cv_model.dart';
import 'package:cv_app/pages/cv/new_cv_page.dart';
import 'package:cv_app/pages/previus_cv/bloc/previus_cv_bloc.dart';
import 'package:cv_app/widgets/explore_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:google_fonts/google_fonts.dart';

class PreviusCvPage extends StatefulWidget {
  const PreviusCvPage({super.key});

  @override
  State<PreviusCvPage> createState() => _PreviusCvPageState();
}

class _PreviusCvPageState extends State<PreviusCvPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<PreviusCvBloc>(context).add(FetchPreviusEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "CV Initiator",
          style: GoogleFonts.caveat(fontSize: 25, fontWeight: FontWeight.w800),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewCvPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<PreviusCvBloc, PreviusCvState>(
              builder: (context, state) {
                print("enter");
                if (state is SuccessState) {
                  if (state.listResumes.isEmpty) {
                    return const Center(child: Text("No Cv"));
                  }
                  print("enter2");
                  return Expanded(
                    child: ListView(
                      children: [
                        for (CvModel cv in state.listResumes)
                          ExploreCard(
                            resume: cv,
                            isEditable: true,
                          ),
                      ],
                    ),
                  );
                } else if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const Text("erroe");
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}
