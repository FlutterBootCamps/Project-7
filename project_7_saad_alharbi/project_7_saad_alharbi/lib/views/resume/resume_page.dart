import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_7_saad_alharbi/extensions/screen_handler.dart';
import 'package:project_7_saad_alharbi/model/resume_model.dart';
import 'package:project_7_saad_alharbi/utils/colors.dart';
import 'package:project_7_saad_alharbi/utils/spacing.dart';
import 'package:project_7_saad_alharbi/views/resume/bloc/resume_bloc.dart';
import 'package:project_7_saad_alharbi/widgets/text_felid_widget.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ResumeBloc>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<ResumeBloc, ResumeState>(
            listener: (context, state) {
              if (state is ResumeSuccessState) {
                context.getMassages(msg: state.msg, color: success);
              } else if (state is ResumeErrorState) {
                context.getMassages(msg: state.msg, color: error);
              }
            },
            builder: (context, state) {
              if (state is ResumeLoadingState) {
                return Center(
                    child: CircularProgressIndicator(
                  color: teal,
                ));
              }
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit_document,
                        color: teal,
                        size: 30,
                      ),
                      Text(
                        "  Create your CV",
                        style: TextStyle(
                          color: teal,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: teal,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          "Personal Information",
                          style: TextStyle(color: teal, fontSize: 30),
                        ),
                        height8,
                        TextFelidWidget(
                          hintText: "Name",
                          title: "Name",
                          controller: bloc.nameController,
                          icon: Icons.person,
                        ),
                        height8,
                        TextFelidWidget(
                          hintText: "Email",
                          title: "Email",
                          controller: bloc.emailController,
                          icon: Icons.email,
                        ),
                        height8,
                        TextFelidWidget(
                          hintText: "Phone",
                          title: "Phone",
                          controller: bloc.phoneController,
                          icon: Icons.phone,
                        ),
                        height8,
                        TextFelidWidget(
                          hintText: "Address",
                          title: "Address",
                          controller: bloc.addressController,
                          icon: Icons.location_on,
                        ),
                        height8,
                        TextFelidWidget(
                          hintText: "Job",
                          title: "Job",
                          controller: bloc.jobController,
                          icon: Icons.badge,
                        ),
                        height8,
                        TextFelidWidget(
                          hintText: "About Me",
                          title: "About Me",
                          maxLine: 4,
                          controller: bloc.aboutMeController,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: teal,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          "Education",
                          style: TextStyle(color: teal, fontSize: 30),
                        ),
                        TextFelidWidget(
                          hintText: "Education",
                          title: "Education",
                          controller: bloc.educationController,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: teal,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          "Work Experience",
                          style: TextStyle(color: teal, fontSize: 30),
                        ),
                        TextFelidWidget(
                          hintText: "Experience",
                          title: "Experience",
                          controller: bloc.experienceController,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: teal,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          "Skills",
                          style: TextStyle(color: teal, fontSize: 30),
                        ),
                        TextFelidWidget(
                          controller: bloc.skillsController,
                          hintText: "Skills",
                          title: "Skills",
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: teal,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          "Projects",
                          style: TextStyle(color: teal, fontSize: 30),
                        ),
                        TextFelidWidget(
                          hintText: "Projects",
                          title: "Projects",
                          controller: bloc.projectsController,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: teal,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          "References",
                          style: TextStyle(color: teal, fontSize: 30),
                        ),
                        TextFelidWidget(
                          hintText: "References",
                          title: "References",
                          controller: bloc.referencesController,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    width: context.getWidth(),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<ResumeBloc>().add(
                              CreateCVEvent(
                                resume: ResumeModel(
                                    name: bloc.nameController.text,
                                    email: bloc.emailController.text,
                                    phone: bloc.phoneController.text,
                                    aboutme: bloc.aboutMeController.text,
                                    adders: bloc.addressController.text,
                                    education: bloc.educationController.text,
                                    experience:
                                        bloc.experienceController.text,
                                    job: bloc.jobController.text,
                                    projects: bloc.projectsController.text,
                                    references:
                                        bloc.referencesController.text,
                                    skills: bloc.skillsController.text),
                              ),
                            );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Summit',
                          style: TextStyle(
                              fontSize: 20,
                              color: white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
