import 'dart:js_interop';

import 'package:cv_creator_app/bloc/cv_bloc.dart';
import 'package:cv_creator_app/constrans/color.dart';
import 'package:cv_creator_app/constrans/space.dart';
import 'package:cv_creator_app/helper/screen_helper.dart';
import 'package:cv_creator_app/layers/data_layer.dart';
import 'package:cv_creator_app/models/cv_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ProjectFieldWidget extends StatelessWidget {
  ProjectFieldWidget(
      {super.key,
      this.cv,
      required this.titleController,
      required this.descriptionController,
      required this.titleHintText,
      required this.descriptionHintText,
      this.icon});
  final CVModel? cv;
  TextEditingController? titleController;
  TextEditingController? descriptionController;
  final String titleHintText;
  final String descriptionHintText;
  Icon? icon;


  // TextEditingController projectTitleController = TextEditingController();
  // TextEditingController projectDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final locator = GetIt.I.get<DataService>();

    final bloc = context.read<CvBloc>();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: context.getWidth() * 0.8,
        child: Column(
          children: [
            TextField(
              // onChanged: (value) {
              //   locator.UpdateProjectTitle(index: index!, title: value);
              //   // bloc.add(UpdateProjectTitleEvent( index: index!, title: value ));
              //   // project[index!].projectTitleController.text = value;
              // },
              controller: titleController,
              // project[index!].projectTitleController,
              style: const TextStyle(color: darkGreen, fontSize: 18),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: darkGreen, width: 3, style: BorderStyle.solid),
                ),
                hintText:
                    cv!.projects.projectTitle.isEmpty ? "Enter your project title" : cv!.projects.projectTitle,
                hintStyle: const TextStyle(color: grey, fontSize: 16),
                fillColor: lightGrey,
                filled: true,
                prefixIcon: const Icon(
                  Icons.lightbulb_circle_rounded,
                  color: darkGreen,
                ),
                prefixIconColor: darkGreen,
              ),
            ),
            height12,
            TextField(
              // onChanged: (value) {
              //   project[index!].projectDescriptionController.text = value;
              // },
              controller:  descriptionController,
              style: const TextStyle(color: darkGreen, fontSize: 18),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: darkGreen, width: 3, style: BorderStyle.solid),
                ),
                hintText: cv!.projects
                    .projectDescription.isEmpty ? "Enter your project description" : cv!.projects.projectDescription,
                hintStyle: const TextStyle(color: grey, fontSize: 16),
                fillColor: lightGrey,
                filled: true,
                prefixIcon: const Icon(
                  Icons.lightbulb_circle_rounded,
                  color: darkGreen,
                ),
                prefixIconColor: darkGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
