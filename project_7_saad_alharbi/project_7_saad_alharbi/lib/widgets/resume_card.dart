import 'package:flutter/material.dart';
import 'package:project_7_saad_alharbi/extensions/screen_handler.dart';
import 'package:project_7_saad_alharbi/model/resume_model.dart';
import 'package:project_7_saad_alharbi/utils/colors.dart';

class ResumeCard extends StatelessWidget {
  ResumeCard({super.key, required this.resume, this.onTap});
  ResumeModel? resume;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container( margin: EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(16),
        alignment: Alignment.bottomLeft,
        width: context.getWidth(),
        height: context.getHeight() * 0.3,
        decoration: BoxDecoration(
          color: black,
          border: Border(
            top: BorderSide(
                color: teal,
                width: 50,
                strokeAlign: BorderSide.strokeAlignInside),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              resume!.name!,
              style: TextStyle(
                  color: teal,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
            Text(
              resume!.job!,
              style: TextStyle(
                  color: white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
          ],
        ),
      ),
    );
  }
}
