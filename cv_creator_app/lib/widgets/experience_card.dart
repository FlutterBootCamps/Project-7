import 'package:cv_creator_app/constrans/color.dart';
import 'package:cv_creator_app/constrans/space.dart';
import 'package:cv_creator_app/models/cv_model.dart';
import 'package:flutter/material.dart';

class ExperienceCard extends StatelessWidget {
  ExperienceCard({super.key, required this.cv});
  CVModel cv;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cv.experiences.position,
                // "SoftWare developer",
                style: const TextStyle(
                  color: black,
                  fontSize: 12,
                ),
              ),
              width12,
            ],
          ),
              Text(
                "${cv.experiences.startdate} - ${cv.experiences.endDate}",
                // "2019 - 2023",
                style: const TextStyle(
                  color: grey,
                  fontSize: 12,
                ),
              ),
          Text(
            cv.experiences.companyName,
            // "tuwaiq Academy",
            style: const TextStyle(
              color: darkGreen,
              fontSize: 14,
            ),
          ),
          Text(
            cv.experiences.description,
            // "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy",
            maxLines: 4,
            style: const TextStyle(
              color: darkGreen,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
