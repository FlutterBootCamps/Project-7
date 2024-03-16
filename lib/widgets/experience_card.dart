import 'package:cv_maker_app/data_layer/home_data_layer.dart';
import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/models/experience_model.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/spacing.dart';
import 'package:cv_maker_app/widgets/head_tail_text.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    super.key,
    required this.isUser, required this.experience,
  });
  
  final Experience experience;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    final locator = GetIt.I.get<HomeData>();
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
            headText: experience.jobTitle,
            tailText: "",
            headSize: 20,
          ),
          HeadTailText(
            headText: "",
            tailText: experience.employer,
            tailSize: 18,
          ),
          HeadTailText(
            headText: "",
            tailText:
                "${locator.formatDate(experience.startDate)} - ${locator.formatDate(experience.endDate)}",
            tailSize: 16,
          ),
          HeadTailText(
            headText: "",
            tailText: "${experience.city}, ${experience.country}",
            tailSize: 14,
          ),
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