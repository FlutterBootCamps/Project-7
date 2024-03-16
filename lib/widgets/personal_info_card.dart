import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/models/resume_model.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/widgets/head_tail_text.dart';
import 'package:flutter/material.dart';

class PersonalInfoCard extends StatelessWidget {
  const PersonalInfoCard({
    super.key, required this.resume, this.onTap, required this.isUser,
  });

  final Resume resume;
  final bool isUser;
  final Function()? onTap;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(context),
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: brownColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadTailText(headText: "Name:  ", tailText: resume.fullName,),
                HeadTailText(headText: "Job Title:  ", tailText: resume.jobTitle),
                HeadTailText(headText: "Email:  ", tailText: resume.email),
                HeadTailText(headText: "Phone:  ", tailText: resume.phone),
                HeadTailText(headText: "Address:  ", tailText: resume.address),
              ],
            ),
          ),
          
          (isUser) ? IconButton(onPressed: onTap, icon: const Icon(Icons.edit, color: whiteColor,)) : Container(),
        ],
      ),
    );
  }
}

