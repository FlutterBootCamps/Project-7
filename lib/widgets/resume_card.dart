import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/models/resume_model.dart';
import 'package:cv_maker_app/pages/cv_details_page.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResumeCard extends StatelessWidget {
  const ResumeCard({
    super.key, required this.resume, required this.isUser,
  });
  final Resume resume;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.push(context, CvDetailsPage(resume: resume, isUser: isUser,), true);
      },
      child: Container(
        width: context.getWidth(context),
        height: 150,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: brownColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(2, 3),
              blurRadius: 10,
            ),
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(resume.cvName, style: const TextStyle(color: whiteColor, fontFamily: nohemiFont, fontSize: 18, fontWeight: FontWeight.w500, overflow: TextOverflow.clip), maxLines: 1,),
                Text("Made by: ${resume.fullName}", style: const TextStyle(color: whiteColor, fontFamily: nohemiFont, fontSize: 16, fontWeight: FontWeight.w400, overflow: TextOverflow.clip), maxLines: 1),
                Text("Created on:  ${DateFormat('yyyy-MM-dd').format(resume.creationDate)}", style: const TextStyle(color: whiteColor, fontFamily: nohemiFont, fontSize: 12, fontWeight: FontWeight.w400),),
            
              ],
            ),
            const Icon(Icons.arrow_forward_ios_rounded, color: whiteColor,)
          ],
        ),
      ),
    );
  }
}