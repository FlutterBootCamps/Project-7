import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_7_saad_alharbi/extensions/screen_handler.dart';
import 'package:project_7_saad_alharbi/model/resume_model.dart';
import 'package:project_7_saad_alharbi/utils/colors.dart';
import 'package:project_7_saad_alharbi/utils/spacing.dart';
import 'package:project_7_saad_alharbi/views/bottom_nav/bottom_nav.dart';
import 'package:project_7_saad_alharbi/views/resume_template/bloc/resume_template_bloc.dart';

import '../../widgets/edit_container_widget.dart';
import '../../widgets/icon_text_widget.dart';
import '../../widgets/section_widget.dart';

class ResumeTemplate extends StatefulWidget {
  ResumeTemplate({super.key, required this.resume, required this.isVisible});
  ResumeModel resume;
  bool isVisible;

  @override
  State<ResumeTemplate> createState() => _ResumeTemplateState();
}

class _ResumeTemplateState extends State<ResumeTemplate> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ResumeTemplateBloc>();
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: teal),
        actions: [
          Visibility(
            visible: widget.isVisible,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    bloc.nameControllerUpdated.text = widget.resume.name!;
                    bloc.emailControllerUpdated.text = widget.resume.email!;
                    bloc.phoneControllerUpdated.text = widget.resume.phone!;
                    bloc.addressControllerUpdated.text = widget.resume.adders!;
                    bloc.jobControllerUpdated.text = widget.resume.job!;
                    bloc.aboutMeControllerUpdated.text = widget.resume.aboutme!;
                    bloc.educationControllerUpdated.text =
                        widget.resume.education!;
                    bloc.experienceControllerUpdated.text =
                        widget.resume.experience!;
                    bloc.skillsControllerUpdated.text = widget.resume.skills!;
                    bloc.projectsControllerUpdated.text =
                        widget.resume.projects!;
                    bloc.referencesControllerUpdated.text =
                        widget.resume.references!;
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return EditContainerWidget(bloc: bloc);
                        });
                  },
                  icon: Icon(
                    Icons.edit,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context
                        .read<ResumeTemplateBloc>()
                        .add(ResumeTemplateDeleteEvent());
                    context.push(view: BottomNav(), isPush: true);
                  },
                  icon: Icon(
                    Icons.delete,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<ResumeTemplateBloc>().add(
                        ResumeTemplatePublishedEvent(
                            isPublished: bloc.isPublished));
                  },
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: BlocConsumer<ResumeTemplateBloc, ResumeTemplateState>(
        listener: (context, state) {
          if (state is ResumeTemplateSuccessState) {
            setState(() {});
            context.getMassages(msg: state.msg, color: success);
          } else if (state is ResumeTemplateErrorState) {
            context.getMassages(msg: state.msg, color: error);
          }
        },
        builder: (context, state) {
          if (state is ResumeTemplateLoadingState) {
            return Center(
                child: CircularProgressIndicator(
              color: teal,
            ));
          }
          return SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.resume.name!,
                    style: TextStyle(
                        color: teal, fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.resume.job!,
                    style: TextStyle(
                        color: white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  height8,
                  IconTextWidget(
                    text: widget.resume.phone!,
                    icon: Icons.phone,
                  ),
                  height8,
                  IconTextWidget(
                    text: widget.resume.email!,
                    icon: Icons.email,
                  ),
                  height8,
                  IconTextWidget(
                    text: widget.resume.adders!,
                    icon: Icons.location_city_outlined,
                  ),
                  height8,
                  Divider(
                    color: teal,
                  ),
                  SectionWidget(
                    header: "About me",
                    content: widget.resume.aboutme!,
                  ),
                  SectionWidget(
                    header: "Education",
                    content: widget.resume.education!,
                  ),
                  SectionWidget(
                    header: "Experience",
                    content: widget.resume.experience!,
                  ),
                  SectionWidget(
                    header: "Skills",
                    content: widget.resume.skills!,
                  ),
                  SectionWidget(
                    header: "Project",
                    content: widget.resume.projects!,
                  ),
                  SectionWidget(
                    header: "Reference",
                    content: widget.resume.references!,
                  ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
