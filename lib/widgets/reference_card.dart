import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/models/reference_model.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/spacing.dart';
import 'package:cv_maker_app/widgets/head_tail_text.dart';
import 'package:flutter/material.dart';

class ReferenceCard extends StatelessWidget {
  const ReferenceCard({
    super.key,
    required this.isUser, required this.reference,
  });
  
  final Reference reference;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
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
            headText: "Name:  ",
            tailText: reference.name,
          ),
          HeadTailText(
              headText: "Job Title:  ", tailText: reference.jobTitle),
          HeadTailText(
              headText: "Organization:  ",
              tailText: reference.organization),
          HeadTailText(
              headText: "Email:  ",
              tailText: reference.email),
          HeadTailText(
              headText: "Phone:  ", tailText: reference.phone),
          (isUser)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: whiteColor,
                        )),
                    IconButton(
                        onPressed: () {},
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