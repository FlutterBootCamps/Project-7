import 'package:cv_maker_app/bloc/cv_bloc.dart';
import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/models/resume_model.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/fonts.dart';
import 'package:cv_maker_app/utils/spacing.dart';
import 'package:cv_maker_app/widgets/add_section_button.dart';
import 'package:cv_maker_app/widgets/education_container.dart';
import 'package:cv_maker_app/widgets/experience_card.dart';
import 'package:cv_maker_app/widgets/personal_info_bottom_sheet.dart';
import 'package:cv_maker_app/widgets/personal_info_card.dart';
import 'package:cv_maker_app/widgets/project_card.dart';
import 'package:cv_maker_app/widgets/reference_card.dart';
import 'package:cv_maker_app/widgets/skill_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CvDetailsPage extends StatelessWidget {
  const CvDetailsPage({super.key, required this.resume, required this.isUser});

  final Resume resume;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    context.read<CvBloc>().add(GetResumeByIdEvent(id: resume.id!));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: milkChocolateColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context
                  .read<CvBloc>()
                  .add((isUser) ? GetUserResumesEvent() : GetAllResumesEvent());
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: brownColor,
            )),
        backgroundColor: milkChocolateColor,
        title: Text(
          resume.cvName,
          style: const TextStyle(
              color: brownColor,
              fontFamily: nohemiFont,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          (isUser)
              ? IconButton(
                  onPressed: () {
                    context
                        .read<CvBloc>()
                        .add(RemoveResumeEvent(id: resume.id!));
                    Navigator.pop(context);
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.trash,
                    color: brownColor,
                  ))
              : Container(),
          (isUser)
              ? BlocBuilder<CvBloc, CvState>(
                  builder: (context, state) {
                    if (state is CvLoadingState) {
                      return Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.only(right: 10),
                        child: const CircularProgressIndicator(
                          color: brownColor,
                        ),
                      );
                    } else if (state is ShowOneResumeState) {
                      return IconButton(
                          onPressed: () {
                            context.read<CvBloc>().add(UpdatePublicityEvent(
                                id: state.resume.id!,
                                isPublic: state.resume.isPublic!));
                            context
                                .read<CvBloc>()
                                .add(GetResumeByIdEvent(id: state.resume.id!));
                          },
                          icon: (state.resume.isPublic!)
                              ? const FaIcon(
                                  FontAwesomeIcons.eye,
                                  color: brownColor,
                                )
                              : const FaIcon(
                                  FontAwesomeIcons.eyeSlash,
                                  color: brownColor,
                                ));
                    } else {
                      return Container();
                    }
                  },
                )
              : Container(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<CvBloc, CvState>(
          listener: (context, state) {
            if (state is CvErrorState) {
              context.showErrorSnackBar(context, state.msg);
              context.read<CvBloc>().add(GetResumeByIdEvent(id: resume.id!));
            } else if (state is ModfiedResumeState) {
              (state.isPostive)
                  ? context.showSuccessSnackBar(context, state.msg)
                  : context.showErrorSnackBar(context, state.msg);
            }
          },
          builder: (context, state) {
            if (state is CvLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: brownColor,
                ),
              );
            } else if (state is ShowOneResumeState) {
              return ListView(
                shrinkWrap: true,
                children: [
                  const Text(
                    "Personal Information",
                    style: TextStyle(
                        color: brownColor,
                        fontFamily: nohemiFont,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  height16,
                  PersonalInfoCard(
                    onTap: () {
                      TextEditingController cvNameController =
                          TextEditingController(text: state.resume.cvName);
                      TextEditingController fullNameController =
                          TextEditingController(text: state.resume.fullName);
                      TextEditingController jobTitleController =
                          TextEditingController(text: state.resume.jobTitle);
                      TextEditingController emailController =
                          TextEditingController(text: state.resume.email);
                      TextEditingController phoneController =
                          TextEditingController(text: state.resume.phone);
                      TextEditingController addressController =
                          TextEditingController(text: state.resume.address);
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return PersonalInfoBottomSheet(
                              isEdit: true,
                              onTap: () {
                                context.read<CvBloc>().add(
                                    UpdatePersonalInfoEvent(
                                        id: state.resume.id!,
                                        jobTitle: jobTitleController.text,
                                        phone: phoneController.text,
                                        address: addressController.text));
                                Navigator.pop(context);
                              },
                              cvNameController: cvNameController,
                              fullNameController: fullNameController,
                              jobTitleController: jobTitleController,
                              emailController: emailController,
                              phoneController: phoneController,
                              addressController: addressController);
                        },
                      );
                    },
                    resume: state.resume,
                    isUser: isUser,
                  ),
                  height16,
                  (state.educationList.isNotEmpty)
                      ? const Text(
                          "Education",
                          style: TextStyle(
                              color: brownColor,
                              fontFamily: nohemiFont,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        )
                      : nothing,
                  (state.educationList.isNotEmpty) ? height16 : nothing,
                  (state.educationList.isNotEmpty)
                      ? SizedBox(
                          width: context.getWidth(context),
                          height: 200,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: .555,
                                    mainAxisSpacing: 16),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.educationList.length,
                            itemBuilder: (context, index) {
                              return EducationCard(
                                isUser: isUser,
                                education: state.educationList[index],
                              );
                            },
                          ))
                      : nothing,
                  (state.educationList.isNotEmpty) ? height16 : nothing,
                  (state.experienceList.isNotEmpty)
                      ? const Text(
                          "Experience",
                          style: TextStyle(
                              color: brownColor,
                              fontFamily: nohemiFont,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        )
                      : nothing,
                  (state.experienceList.isNotEmpty) ? height16 : nothing,
                  (state.experienceList.isNotEmpty)
                      ? SizedBox(
                          width: context.getWidth(context),
                          height: 200,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: .555,
                                    mainAxisSpacing: 16),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.experienceList.length,
                            itemBuilder: (context, index) {
                              return ExperienceCard(
                                  isUser: isUser,
                                  experience: state.experienceList[index]);
                            },
                          ))
                      : nothing,
                  (state.experienceList.isNotEmpty) ? height16 : nothing,
                  (state.projectList.isNotEmpty)
                      ? const Text(
                          "Projects",
                          style: TextStyle(
                              color: brownColor,
                              fontFamily: nohemiFont,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        )
                      : nothing,
                  (state.projectList.isNotEmpty) ? height16 : nothing,
                  (state.projectList.isNotEmpty)
                      ? SizedBox(
                          width: context.getWidth(context),
                          height: 200,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: .555,
                                    mainAxisSpacing: 16),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.projectList.length,
                            itemBuilder: (context, index) {
                              return ProjectCard(
                                  isUser: isUser,
                                  project: state.projectList[index]);
                            },
                          ))
                      : nothing,
                  (state.projectList.isNotEmpty) ? height16 : nothing,
                  (state.skillList.isNotEmpty)
                      ? const Text(
                          "Skills",
                          style: TextStyle(
                              color: brownColor,
                              fontFamily: nohemiFont,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        )
                      : nothing,
                  (state.skillList.isNotEmpty) ? height16 : nothing,
                  (state.skillList.isNotEmpty)
                      ? SizedBox(
                          width: context.getWidth(context),
                          height: 200,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: .555,
                                    mainAxisSpacing: 16),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.skillList.length,
                            itemBuilder: (context, index) {
                              return SkillCard(
                                  isUser: isUser,
                                  skill: state.skillList[index]);
                            },
                          ))
                      : nothing,
                  (state.skillList.isNotEmpty) ? height16 : nothing,
                  (state.referenceList.isNotEmpty)
                      ? const Text(
                          "References",
                          style: TextStyle(
                              color: brownColor,
                              fontFamily: nohemiFont,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        )
                      : nothing,
                  (state.referenceList.isNotEmpty) ? height16 : nothing,
                  (state.referenceList.isNotEmpty)
                      ? SizedBox(
                          width: context.getWidth(context),
                          height: 200,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: .555,
                                    mainAxisSpacing: 16),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.referenceList.length,
                            itemBuilder: (context, index) {
                              return ReferenceCard(
                                  isUser: isUser,
                                  reference: state.referenceList[index]);
                            },
                          ))
                      : nothing,
                  (state.referenceList.isNotEmpty) ? height16 : nothing,
                ],
              );
            } else if (state is CvErrorState) {
              return const Center(
                child: Text(
                  "Error in getting your CV",
                  style: TextStyle(
                      color: brownColor,
                      fontFamily: nohemiFont,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: (isUser) ? AddSectionButton(resume: resume) : null,
    );
  }
}


