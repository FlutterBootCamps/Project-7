import 'package:cv_maker_app/data_layer/home_data_layer.dart';
import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/fonts.dart';
import 'package:cv_maker_app/utils/spacing.dart';
import 'package:cv_maker_app/widgets/bottom_button.dart';
import 'package:cv_maker_app/widgets/text_field_iconed.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ExperienceBottomSheet extends StatelessWidget {
  const ExperienceBottomSheet({
    super.key,
    required this.jobTitleController,
    required this.employerController,
    required this.countryController,
    required this.cityController,
    required this.startDateController,
    required this.endDateController, this.onTap, this.isEdit = false,
  });

  final TextEditingController jobTitleController;
  final TextEditingController employerController;
  final TextEditingController countryController;
  final TextEditingController cityController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final Function()? onTap;
  final bool? isEdit;

  @override
  Widget build(BuildContext context) {
    final locator = GetIt.I.get<HomeData>();
    return Container(
      width: context.getWidth(context),
      height: 650,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: milkChocolateColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20))),
      child: Column(
        children: [
          const Text(
                "Experience",
                style: TextStyle(
                  color: brownColor,
                  fontFamily: nohemiFont,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
          TextfieldIconed(
            controller: jobTitleController,
            hintText: "Enter your job title",
            labelText: "Job Title",
            icon: const Icon(Icons.work_rounded),
          ),
          height16,
          TextfieldIconed(
            controller: employerController,
            hintText: "Enter your employer",
            labelText: "Employer",
            icon: const Icon(
                Icons.home_work_rounded),
          ),
          height16,
          TextfieldIconed(
            controller: countryController,
            hintText: "Enter your country",
            labelText: "Country",
            icon: const Icon(Icons.public_rounded),
          ),
          height16,
          TextfieldIconed(
            controller: cityController,
            hintText: "Enter your city",
            labelText: "City",
            icon:
                const Icon(Icons.location_on_rounded),
          ),
          height16,
          TextfieldIconed(
            controller: startDateController,
            hintText: "Select start date",
            labelText: "Start Date",
            icon: const Icon(
                Icons.calendar_month_rounded),
            isReadOnly: true,
            onTap: () async {
              DateTime? startDate = await locator
                  .showCustomDatePicker(context);
              if (startDate != null) {
                locator.currentlySelectedStartDate =
                    startDate;
                startDateController.text =
                    locator.formatDate(startDate);
              }
            },
          ),
          height16,
          TextfieldIconed(
            controller: endDateController,
            hintText: "Select end date",
            labelText: "End Date",
            icon: const Icon(
                Icons.calendar_month_rounded),
            isReadOnly: true,
            onTap: () async {
              DateTime? endDate = await locator
                  .showCustomDatePicker(context);
              if (endDate != null) {
                locator.currentlySelectedEndDate =
                    endDate;
                endDateController.text =
                    locator.formatDate(endDate);
              }
            },
          ),
          height32,
          BottomButton(
              buttonColor: brownColor,
              text: (isEdit!) ? "Edit Experience" : "Add Experience",
              textColor: whiteColor,
              textSize: 16,
              buttonWidth:
                  context.getWidth(context) * .5,
              onTap: onTap),
        ],
      ),
    );
  }
}
