import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_7_saad_alharbi/extensions/screen_handler.dart';
import 'package:project_7_saad_alharbi/model/resume_model.dart';
import 'package:project_7_saad_alharbi/utils/colors.dart';
import 'package:project_7_saad_alharbi/utils/spacing.dart';
import 'package:project_7_saad_alharbi/views/resume_template/bloc/resume_template_bloc.dart';
import 'package:project_7_saad_alharbi/widgets/text_felid_widget.dart';

class EditContainerWidget extends StatelessWidget {
  const EditContainerWidget({
    super.key,
    required this.bloc,
  });

  final ResumeTemplateBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(),
      height: context.getHeight() * 0.9,
      color: black,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit_document,
                    color: teal,
                    size: 30,
                  ),
                  Text(
                    "  Update your CV",
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
                      style: TextStyle(
                          color: teal, fontSize: 30),
                    ),
                    height8,
                    TextFelidWidget(
                      hintText: "Name",
                      title: "Name",
                      controller: bloc.nameControllerUpdated,
                      icon: Icons.person,
                    ),
                    height8,
                    TextFelidWidget(
                      hintText: "Email",
                      title: "Email",
                      controller: bloc.emailControllerUpdated,
                      icon: Icons.email,
                    ),
                    height8,
                    TextFelidWidget(
                      hintText: "Phone",
                      title: "Phone",
                      controller: bloc.phoneControllerUpdated,
                      icon: Icons.phone,
                    ),
                    height8,
                    TextFelidWidget(
                      hintText: "Address",
                      title: "Address",
                      controller: bloc.addressControllerUpdated,
                      icon: Icons.location_on,
                    ),
                    height8,
                    TextFelidWidget(
                      hintText: "Job",
                      title: "Job",
                      controller: bloc.jobControllerUpdated,
                      icon: Icons.badge,
                    ),
                    height8,
                    TextFelidWidget(
                      hintText: "About Me",
                      title: "About Me",
                      maxLine: 4,
                      controller: bloc.aboutMeControllerUpdated,
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
                      style: TextStyle(
                          color: teal, fontSize: 30),
                    ),
                    TextFelidWidget(
                      hintText: "Education",
                      title: "Education",
                      controller:
                          bloc.educationControllerUpdated,
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
                      style: TextStyle(
                          color: teal, fontSize: 30),
                    ),
                    TextFelidWidget(
                      hintText: "Experience",
                      title: "Experience",
                      controller:
                          bloc.experienceControllerUpdated,
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
                      style: TextStyle(
                          color: teal, fontSize: 30),
                    ),
                    TextFelidWidget(
                      controller: bloc.skillsControllerUpdated,
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
                      style: TextStyle(
                          color: teal, fontSize: 30),
                    ),
                    TextFelidWidget(
                      hintText: "Projects",
                      title: "Projects",
                      controller: bloc.projectsControllerUpdated,
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
                      style: TextStyle(
                          color: teal, fontSize: 30),
                    ),
                    TextFelidWidget(
                      hintText: "References",
                      title: "References",
                      controller:
                          bloc.referencesControllerUpdated,
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 16),
                width: context.getWidth(),
                child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<ResumeTemplateBloc>()
                        .add(
                          ResumeTemplateUpdateEvent(
                            resume: ResumeModel(
                                name: bloc
                                    .nameControllerUpdated.text,
                                email: bloc
                                    .emailControllerUpdated.text,
                                phone: bloc
                                    .phoneControllerUpdated.text,
                                aboutme: bloc
                                    .aboutMeControllerUpdated
                                    .text,
                                adders: bloc
                                    .addressControllerUpdated
                                    .text,
                                education: bloc
                                    .educationControllerUpdated
                                    .text,
                                experience: bloc
                                    .experienceControllerUpdated
                                    .text,
                                job: bloc
                                    .jobControllerUpdated.text,
                                projects: bloc
                                    .projectsControllerUpdated
                                    .text,
                                references: bloc
                                    .referencesControllerUpdated
                                    .text,
                                skills: bloc
                                    .skillsControllerUpdated
                                    .text),
                          ),
                        );
                        Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: teal,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Update',
                      style: TextStyle(
                          fontSize: 20,
                          color: white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
