import 'package:cv_maker_app/data_layer/home_data_layer.dart';
import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/spacing.dart';
import 'package:cv_maker_app/widgets/bottom_button.dart';
import 'package:cv_maker_app/widgets/text_field_iconed.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class EducationBottomSheet extends StatelessWidget {
  const EducationBottomSheet({
    super.key,
    required this.degreeController,
    required this.schoolController,
    required this.countryController,
    required this.cityController,
    required this.startDateController,
    required this.endDateController, this.onTap, this.isEdit = false,
  });

  final TextEditingController degreeController;
  final TextEditingController schoolController;
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
          TextfieldIconed(
            controller: degreeController,
            hintText: "Enter your degree",
            labelText: "Degree",
            icon: const Icon(Icons.school_rounded),
          ),
          height16,
          TextfieldIconed(
            controller: schoolController,
            hintText: "Enter your school/college",
            labelText: "School/College",
            icon: const Icon(
                Icons.location_city_rounded),
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
              text: (isEdit!) ? "Edit Education" : "Add Education",
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
