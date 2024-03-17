import 'package:cv_creator_app/constrans/color.dart';
import 'package:cv_creator_app/constrans/space.dart';
import 'package:cv_creator_app/helper/screen_helper.dart';
import 'package:cv_creator_app/models/cv_model.dart';
import 'package:flutter/material.dart';

class EductionFieldWidget extends StatelessWidget {
  EductionFieldWidget({
    super.key,
    this.cv,
    required this.majorController,
    required this.universityController,
    required this.startDateController,
    required this.endDateController,
  });
  CVModel? cv;
  TextEditingController? majorController;
  TextEditingController? universityController;
  TextEditingController? startDateController;
  TextEditingController? endDateController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: context.getWidth() * 0.8,
        child: Column(
          children: [
            TextField(
              controller: majorController,
              style: const TextStyle(color: darkGreen, fontSize: 18),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: darkGreen, width: 3, style: BorderStyle.solid),
                ),
                hintText: cv!.educations.major.isEmpty
                    ? "Enter Your major"
                    : cv!.educations.major,
                hintStyle: const TextStyle(color: grey, fontSize: 16),
                fillColor: lightGrey,
                filled: true,
                prefixIcon: const Icon(Icons.cast_for_education),
                prefixIconColor: darkGreen,
              ),
            ),
            height12,
            TextField(
              controller: universityController,
              style: const TextStyle(color: darkGreen, fontSize: 18),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: darkGreen, width: 3, style: BorderStyle.solid),
                ),
                hintText: cv!.educations.university.isEmpty
                    ? "Enter Your university"
                    : cv!.educations.university,
                hintStyle: const TextStyle(color: grey, fontSize: 16),
                fillColor: lightGrey,
                filled: true,
                prefixIcon: const Icon(Icons.home_work_outlined),
                prefixIconColor: darkGreen,
              ),
            ),
            height12,
            TextField(
              controller: startDateController,
              style: const TextStyle(color: darkGreen, fontSize: 18),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: darkGreen, width: 3, style: BorderStyle.solid),
                ),
                hintText: cv!.educations.startDate.isEmpty
                    ? "Enter start date"
                    : cv!.educations.startDate,
                hintStyle: const TextStyle(color: grey, fontSize: 16),
                fillColor: lightGrey,
                filled: true,
                prefixIcon: const Icon(Icons.date_range),
                prefixIconColor: darkGreen,
              ),
            ),
            height12,
            TextField(
              controller: endDateController,
              style: const TextStyle(color: darkGreen, fontSize: 18),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: darkGreen, width: 3, style: BorderStyle.solid),
                ),
                hintText: cv!.educations.endDate.isEmpty
                    ? "Enter end date"
                    : cv!.educations.endDate,
                hintStyle: const TextStyle(color: grey, fontSize: 16),
                fillColor: lightGrey,
                filled: true,
                prefixIcon: const Icon(Icons.date_range),
                prefixIconColor: darkGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
