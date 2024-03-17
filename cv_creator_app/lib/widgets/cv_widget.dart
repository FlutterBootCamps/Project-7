import 'package:cv_creator_app/constrans/color.dart';
import 'package:cv_creator_app/constrans/space.dart';
import 'package:cv_creator_app/helper/screen_helper.dart';
import 'package:cv_creator_app/models/cv_model.dart';
import 'package:cv_creator_app/widgets/experience_card.dart';
import 'package:cv_creator_app/widgets/project_card.dart';
import 'package:cv_creator_app/widgets/title_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CVWidget extends StatelessWidget {
  CVWidget({super.key, required this.cv});
  CVModel cv;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          child: Column(
            children: [
              height12,
              Text(
                cv.name,
                style: GoogleFonts.acme(
                  textStyle: const TextStyle(
                      color: darkGreen,
                      fontSize: 24,
                      fontWeight: FontWeight.w800),
                ),
              ),
              // const Text("PMP" , style: TextStyle(color: grey, fontSize: 16, fontWeight: FontWeight.w500),),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 24),
                    width: context.getWidth() * 0.4,
                    height: context.getHeight() * 0.80,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(color: lightGrey),
                    child: Column(
                      children: [
                        const TitleCard(
                          title: "CONTACT ME",
                        ),
                        height12,
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.phone,
                                color: darkGreen,
                                size: 20,
                              ),
                              width12,
                              Text(
                                cv.phone.toString(),
                                style:
                                    const TextStyle(color: black, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        height12,
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.email_outlined,
                                color: darkGreen,
                                size: 20,
                              ),
                              width12,
                              Expanded(
                                child: Text(
                                  cv.email,
                                  style:
                                      const TextStyle(color: black, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                        height12,

                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: darkGreen,
                                size: 20,
                              ),
                              width12,
                              Text(
                                cv.location,
                                style:
                                    const TextStyle(color: black, fontSize: 14),
                              ),
                            ],
                          ),
                        ),

                        height24,
                        const TitleCard(
                          title: "EDUCATION",
                        ),
                        height12,
                        Container(
                          padding: const EdgeInsets.only(left: 12),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              const Text(
                                "Bachelor degree in",
                                style: TextStyle(
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                cv.educations.major,
                                style: const TextStyle(
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                cv.educations.university,
                                style: const TextStyle(
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "${cv.educations.startDate} - ${cv.educations.endDate} ",
                                style: const TextStyle(
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        height24,
                        const TitleCard(
                          title: "SKILLS",
                        ),
                        height12,
                        Container(
                          padding: const EdgeInsets.only(left: 12),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "  -  ${cv.skills.skillTitle}",
                                style: const TextStyle(
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              height12,
                              Text(
                                "  -  ${cv.skills.skillTitle1}",
                                style: const TextStyle(
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              height12,
                              Text(
                                "  -  ${cv.skills.skillTitle2}",
                                style: const TextStyle(
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              height12,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  width12,
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        height24,
                        Row(
                          children: [
                            const Text(
                              "WORK EXPERIENCE  ",
                              style: TextStyle(
                                  color: darkGreen,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900),
                            ),
                            Container(
                              height: context.getHeight() * 0.002,
                              width: context.getWidth() * 0.1,
                              decoration: const BoxDecoration(
                                  color: brown,
                                  border: Border(
                                      top: BorderSide(
                                          color: darkGreen, width: 2))),
                            ),
                          ],
                        ),

                        height12,
                        ExperienceCard(
                          cv: cv,
                        ),

                        height12,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "PROJECT  ",
                              style: TextStyle(
                                  color: darkGreen,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900),
                            ),
                            Container(
                              height: context.getHeight() * 0.015,
                              width: context.getWidth() * 0.3,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: darkGreen, width: 2))),
                            ),
                          ],
                        ),
                        height12,

                        ProjectCard(cv: cv),

                        height24,                    
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
