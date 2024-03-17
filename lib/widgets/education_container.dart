import 'package:cv_maker_app/bloc/cv_bloc.dart';
import 'package:cv_maker_app/data_layer/home_data_layer.dart';
import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/models/education_model.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/spacing.dart';
import 'package:cv_maker_app/widgets/education_bottom_sheet.dart';
import 'package:cv_maker_app/widgets/head_tail_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({
    super.key,
    required this.isUser,
    required this.education,
  });

  final Education education;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    final locator = GetIt.I.get<HomeData>();
    return Container(
      width: context.getWidth(context) * .91,
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: brownColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadTailText(
            headText: education.degree,
            tailText: "",
            headSize: 20,
          ),
          HeadTailText(
            headText: "",
            tailText: education.school,
            tailSize: 18,
          ),
          HeadTailText(
            headText: "",
            tailText:
                "${locator.formatDate(education.startDate!)} - ${locator.formatDate(education.endDate!)}",
            tailSize: 16,
          ),
          HeadTailText(
            headText: "",
            tailText: "${education.city}, ${education.country}",
            tailSize: 14,
          ),
          (isUser)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          TextEditingController degreeController =
                              TextEditingController(text: education.degree);
                          TextEditingController schoolController =
                              TextEditingController(text: education.school);
                          TextEditingController countryController =
                              TextEditingController(text: education.country);
                          TextEditingController cityController =
                              TextEditingController(text: education.city);
                          TextEditingController startDateController =
                              TextEditingController(
                                  text:
                                      locator.formatDate(education.startDate!));
                          TextEditingController endDateController =
                              TextEditingController(
                                  text: locator.formatDate(education.endDate!));
                          locator.currentlySelectedStartDate =
                              education.startDate;
                          locator.currentlySelectedEndDate = education.endDate;
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return EducationBottomSheet(
                                isEdit: true,
                                degreeController: degreeController,
                                schoolController: schoolController,
                                countryController: countryController,
                                cityController: cityController,
                                startDateController: startDateController,
                                endDateController: endDateController,
                                onTap: () {
                                  context.read<CvBloc>().add(
                                      UpdateEducationEvent(
                                          id: education.id!,
                                          education: Education(
                                              degree: degreeController.text,
                                              school: schoolController.text,
                                              country: countryController.text,
                                              city: cityController.text,
                                              startDate: locator
                                                  .currentlySelectedStartDate,
                                              endDate: locator
                                                  .currentlySelectedEndDate,
                                              resumeId: education.resumeId)));
                                  Navigator.pop(context);
                                },
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: whiteColor,
                        )),
                    IconButton(
                        onPressed: () {
                          context
                              .read<CvBloc>()
                              .add(RemoveEducationEvent(education: education));
                        },
                        icon: const Icon(
                          Icons.delete_rounded,
                          color: whiteColor,
                        )),
                  ],
                )
              : height32
        ],
      ),
    );
  }
}
