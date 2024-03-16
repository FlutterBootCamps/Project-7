import 'package:cv_maker_app/bloc/cv_bloc.dart';
import 'package:cv_maker_app/data_layer/home_data_layer.dart';
import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/models/education_model.dart';
import 'package:cv_maker_app/models/resume_model.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/widgets/education_bottom_sheet.dart';
import 'package:cv_maker_app/widgets/icon_text_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

class AddSectionButton extends StatelessWidget {
  const AddSectionButton({
    super.key,
    required this.resume,
  });

  final Resume resume;

  @override
  Widget build(BuildContext context) {
    final locator = GetIt.I.get<HomeData>();
    return FloatingActionButton(
        onPressed: () {
          showMenu(
              color: brownColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(20),
              )),
              context: context,
              position: RelativeRect.fromDirectional(
                  textDirection: TextDirection.ltr,
                  start: 1,
                  top: context.getHeight(context) * .53,
                  end: 0,
                  bottom: 0),
              items: [
                CheckedPopupMenuItem(
                  padding: const EdgeInsets.all(0),
                  child: const IconTextBar(
                    text: "Add Education",
                    icon: FaIcon(
                      FontAwesomeIcons.graduationCap,
                      color: milkChocolateColor,
                    ),
                  ),
                  onTap: () {
                    TextEditingController degreeController =
                        TextEditingController();
                    TextEditingController schoolController =
                        TextEditingController();
                    TextEditingController countryController =
                        TextEditingController();
                    TextEditingController cityController =
                        TextEditingController();
                    TextEditingController startDateController =
                        TextEditingController();
                    TextEditingController endDateController =
                        TextEditingController();
                    locator.currentlySelectedStartDate = null;
                    locator.currentlySelectedEndDate = null;
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return EducationBottomSheet(
                          degreeController: degreeController,
                          schoolController: schoolController,
                          countryController: countryController,
                          cityController: cityController,
                          startDateController: startDateController,
                          endDateController: endDateController,
                          onTap: () {
                            context.read<CvBloc>().add(AddEducationEvent(
                                  education: Education(
                                      degree: degreeController.text,
                                      school: schoolController.text,
                                      country: countryController.text,
                                      city: cityController.text,
                                      startDate: locator
                                          .currentlySelectedStartDate,
                                      endDate: locator
                                          .currentlySelectedEndDate,
                                      resumeId: resume.id!),
                                ));
                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  },
                ),
                const CheckedPopupMenuItem(
                  padding: EdgeInsets.all(0),
                  child: IconTextBar(
                    text: "Add Experience",
                    icon: FaIcon(
                      FontAwesomeIcons.briefcase,
                      color: milkChocolateColor,
                    ),
                  ),
                ),
                const CheckedPopupMenuItem(
                  padding: EdgeInsets.all(0),
                  child: IconTextBar(
                    text: "Add Project",
                    icon: FaIcon(
                      FontAwesomeIcons.diagramProject,
                      color: milkChocolateColor,
                    ),
                  ),
                ),
                const CheckedPopupMenuItem(
                  padding: EdgeInsets.all(0),
                  child: IconTextBar(
                    text: "Add Skill",
                    icon: FaIcon(
                      FontAwesomeIcons.star,
                      color: milkChocolateColor,
                    ),
                  ),
                ),
                const CheckedPopupMenuItem(
                  padding: EdgeInsets.all(0),
                  child: IconTextBar(
                    text: "Add Reference",
                    icon: FaIcon(
                      FontAwesomeIcons.peopleArrows,
                      color: milkChocolateColor,
                    ),
                  ),
                ),
              ]);
        },
        backgroundColor: brownColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add_rounded,
          color: whiteColor,
          size: 40,
        ),
      );
  }
}