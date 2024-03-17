import 'package:cv_creator_app/constrans/color.dart';
import 'package:cv_creator_app/constrans/space.dart';
import 'package:cv_creator_app/helper/screen_helper.dart';
import 'package:cv_creator_app/models/cv_model.dart';
import 'package:flutter/material.dart';

class ExperienceFieldWidget extends StatelessWidget {
  ExperienceFieldWidget({super.key,
    
  this.cv,
  required this.positionController,
  required this.companyController,
  required this.descriptionController,
  required this.startDateController,
  required this.endDateController,
  });
  CVModel? cv;
  TextEditingController? positionController;
  TextEditingController? companyController;
  TextEditingController? descriptionController;
  TextEditingController?  startDateController;
  TextEditingController? endDateController;
  // final String majorHintText;

  @override
  Widget build(BuildContext context) {
    return 
     Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: context.getWidth() * 0.8,
        child: Column(
          children: [
            TextField(
              controller: positionController,
              style: const TextStyle(color: darkGreen, fontSize: 18),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: darkGreen, width: 3, style: BorderStyle.solid),
                ),
                hintText: cv!.experiences.position.isEmpty ? "Enter Your position" : cv!.experiences.position,
                hintStyle: const TextStyle(color: grey, fontSize: 16),
                fillColor: lightGrey,
                filled: true,
                prefixIcon:  const Icon(Icons.card_travel_rounded) ,
                prefixIconColor: darkGreen,
              ),
            ),
            height12,
            TextField(
              controller: companyController,
              style: const TextStyle(color: darkGreen, fontSize: 18),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: darkGreen, width: 3, style: BorderStyle.solid),
                ),
                hintText: cv!.experiences.companyName.isEmpty ? "Enter Your company" : cv!.experiences.companyName,
                hintStyle: const TextStyle(color: grey, fontSize: 16),
                fillColor: lightGrey,
                filled: true,
                prefixIcon:   const Icon(Icons.card_travel_rounded) ,
                prefixIconColor: darkGreen,
              ),
            ),
            height12,
            TextField(
              controller: descriptionController,
              style: const TextStyle(color: darkGreen, fontSize: 18),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: darkGreen, width: 3, style: BorderStyle.solid),
                ),
                hintText: cv!.experiences.description.isEmpty ? "Enter Your job description" : cv!.experiences.description,
                hintStyle: const TextStyle(color: grey, fontSize: 16),
                fillColor: lightGrey,
                filled: true,
                prefixIcon:   const Icon(Icons.card_travel_rounded) ,
                prefixIconColor: darkGreen,
              ),
            ),
           height12,
          //  StartExperienceDatePickerWidget(text:"Enter start date"),
          //  height12,
          //  EndExperienceDatePickerWidget(text:"Enter end date"),
            TextField(
              controller: startDateController,
              style: const TextStyle(color: darkGreen, fontSize: 18),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: darkGreen, width: 3, style: BorderStyle.solid),
                ),
                hintText: cv!.experiences.startdate.isEmpty ? "Enter start date" : cv!.experiences.startdate,
                hintStyle: const TextStyle(color: grey, fontSize: 16),
                fillColor: lightGrey,
                filled: true,
                prefixIcon:   const Icon(Icons.date_range) ,
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
                hintText: cv!.experiences.endDate.isEmpty ? "Enter end date" : cv!.experiences.endDate,
                hintStyle: const TextStyle(color: grey, fontSize: 16),
                fillColor: lightGrey,
                filled: true,
                prefixIcon:   const Icon(Icons.date_range) ,
                prefixIconColor: darkGreen,
              ),
            ),
         
          ],
        ),
      ),
    );
  
  }
}