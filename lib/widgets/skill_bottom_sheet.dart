import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/fonts.dart';
import 'package:cv_maker_app/utils/spacing.dart';
import 'package:cv_maker_app/widgets/bottom_button.dart';
import 'package:cv_maker_app/widgets/text_field_iconed.dart';
import 'package:flutter/material.dart';

class SkillBottomSheet extends StatelessWidget {
  const SkillBottomSheet({
    super.key,
    required this.skillController,
    required this.descriptionController,this.onTap, this.isEdit = false,
  });

  final TextEditingController skillController;
  final TextEditingController descriptionController;
  final Function()? onTap;
  final bool? isEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(context),
      height: 300,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: milkChocolateColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20))),
      child: Column(
        children: [
          const Text(
                "Skill",
                style: TextStyle(
                  color: brownColor,
                  fontFamily: nohemiFont,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
          TextfieldIconed(
            controller: skillController,
            hintText: "Enter your skill",
            labelText: "Skill",
            icon: const Icon(Icons.star_rounded),
          ),
          height16,
          TextfieldIconed(
            controller: descriptionController,
            hintText: "Enter your skill description",
            labelText: "Skill Description",
            icon: const Icon(
                Icons.library_books_rounded),
          ),
          height32,
          BottomButton(
              buttonColor: brownColor,
              text: (isEdit!) ? "Edit Skill" : "Add Skill",
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