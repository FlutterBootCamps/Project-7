import 'package:cv_creator_app/constrans/color.dart';
import 'package:cv_creator_app/constrans/space.dart';
import 'package:cv_creator_app/helper/screen_helper.dart';
import 'package:cv_creator_app/models/cv_model.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  ProjectCard({super.key, required this.cv});
  CVModel cv;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: context.getWidth() * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cv.projects.projectTitle.isEmpty ? " " : cv.projects.projectTitle ,
         
              style: const TextStyle(
                  color: darkGreen, fontSize: 12, fontWeight: FontWeight.w600),
            ),
            width8,
            Text( 
              cv.projects.projectDescription.isEmpty ? " " :cv.projects.projectDescription ,
              maxLines: 5,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                color: darkGreen,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
