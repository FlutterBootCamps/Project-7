import 'package:cv_maker_app/bloc/cv_bloc.dart';
import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/models/skill_model.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/spacing.dart';
import 'package:cv_maker_app/widgets/head_tail_text.dart';
import 'package:cv_maker_app/widgets/skill_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({
    super.key,
    required this.isUser,
    required this.skill,
  });

  final Skill skill;
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
          HeadTailText(headText: skill.skill, tailText: "", headSize: 20),
          HeadTailText(
            headText: "",
            tailText: skill.description,
            tailSize: 10,
            maxLines: 8,
          ),
          (isUser)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          TextEditingController skillController =
                              TextEditingController(text: skill.skill);
                          TextEditingController descriptionController =
                              TextEditingController(text: skill.description);
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return SkillBottomSheet(
                                isEdit: true,
                                skillController: skillController,
                                descriptionController: descriptionController,
                                onTap: () {
                                  context.read<CvBloc>().add(UpdateSkillEvent(
                                      id: skill.id!,
                                      skill: Skill(
                                          skill: skillController.text,
                                          description:
                                              descriptionController.text,
                                          resumeId: skill.resumeId)));
                                  Navigator.pop(context);
                                },
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: whiteColor,
                        )),
                    IconButton(
                        onPressed: () {
                          context
                              .read<CvBloc>()
                              .add(RemoveSkillEvent(skill: skill));
                        },
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
