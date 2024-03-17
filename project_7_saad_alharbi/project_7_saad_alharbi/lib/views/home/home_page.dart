import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_7_saad_alharbi/extensions/screen_handler.dart';
import 'package:project_7_saad_alharbi/utils/colors.dart';
import 'package:project_7_saad_alharbi/utils/spacing.dart';
import 'package:project_7_saad_alharbi/views/home/bloc/home_bloc.dart';
import 'package:project_7_saad_alharbi/views/resume_template/resume_template.dart';

import '../../widgets/resume_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(HomeLoadDataEvent());
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: teal,
                ),
              );
            } else if (state is HomeLoadState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResumeCard(
                      resume: state.resume,
                      onTap: () {
                        context.push(
                            view: ResumeTemplate(
                              resume: state.resume,
                              isVisible: true,
                            ),
                            isPush: true);
                      },
                    ),
                    Divider(
                      color: teal,
                    ),
                    height16,
                    Text(
                      "Public Resume you can check",
                      style: TextStyle(
                          color: teal,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    ...List.generate(state.resumesList.length, (index) {
                      return ResumeCard(
                        resume: state.resumesList[index],
                        onTap: () {
                          context.push(
                              view: ResumeTemplate(
                                resume: state.resumesList[index],
                                isVisible: false,
                              ),
                              isPush: true);
                        },
                      );
                    })
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "You Need To Create a Resume",
                  style: TextStyle(
                    color: teal,
                    fontSize: 30,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
