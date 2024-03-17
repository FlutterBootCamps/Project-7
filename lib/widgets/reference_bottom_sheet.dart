import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/fonts.dart';
import 'package:cv_maker_app/utils/spacing.dart';
import 'package:cv_maker_app/widgets/bottom_button.dart';
import 'package:cv_maker_app/widgets/text_field_iconed.dart';
import 'package:flutter/material.dart';

class ReferenceBottomSheet extends StatelessWidget {
  const ReferenceBottomSheet({
    super.key,this.onTap, this.isEdit = false, required this.nameController, required this.jobTitleController, required this.organizationController, required this.emailController, required this.phoneController,
  });

  final TextEditingController nameController;
  final TextEditingController jobTitleController;
  final TextEditingController organizationController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final Function()? onTap;
  final bool? isEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(context),
      height: 550,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: milkChocolateColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20))),
      child: Column(
        children: [
          const Text(
                "Reference",
                style: TextStyle(
                  color: brownColor,
                  fontFamily: nohemiFont,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
          TextfieldIconed(
            controller: nameController,
            hintText: "Enter thier name",
            labelText: "Name",
            icon: const Icon(Icons.person_rounded),
          ),
          height16,
          TextfieldIconed(
            controller: jobTitleController,
            hintText: "Enter thier job title",
            labelText: "Job Title",
            icon: const Icon(
                Icons.work_rounded),
          ),
          height16,
          TextfieldIconed(
            controller: organizationController,
            hintText: "Enter thier organization",
            labelText: "Organization",
            icon: const Icon(Icons.location_city_rounded),
          ),
          height16,
          TextfieldIconed(
            controller: emailController,
            hintText: "Enter thier email",
            labelText: "Email",
            icon: const Icon(Icons.alternate_email_rounded),
          ),
          height16,
          TextfieldIconed(
            controller: phoneController,
            hintText: "Enter thier phone number",
            labelText: "Phone",
            icon: const Icon(Icons.phone_rounded),
          ),
          height32,
          BottomButton(
              buttonColor: brownColor,
              text: (isEdit!) ? "Edit Reference" : "Add Reference",
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