import 'package:cv_maker_app/bloc/cv_bloc.dart';
import 'package:cv_maker_app/data_layer/home_data_layer.dart';
import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/models/project_model.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/spacing.dart';
import 'package:cv_maker_app/widgets/head_tail_text.dart';
import 'package:cv_maker_app/widgets/project_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.isUser, required this.project,
  });

  final Project project;
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
          HeadTailText(headText: project.title, tailText: "", headSize: 20),
          HeadTailText(headText: "", tailText: "${locator.formatDate(project.startDate!)} - ${locator.formatDate(project.endDate!)}", tailSize: 14),
          HeadTailText(headText: "", tailText: project.description, tailSize: 10, maxLines: 4,),
          (isUser)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          TextEditingController titleController =
                      TextEditingController(text: project.title);
                  TextEditingController descriptionController =
                      TextEditingController(text: project.description);
                  TextEditingController startDateController =
                      TextEditingController(text: locator.formatDate(project.startDate!));
                  TextEditingController endDateController =
                      TextEditingController(text: locator.formatDate(project.endDate!));
                  locator.currentlySelectedStartDate = project.startDate;
                  locator.currentlySelectedEndDate = project.endDate;
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return ProjectBottomSheet(
                        isEdit: true,
                        titleController: titleController,
                        descriptionController: descriptionController,
                        startDateController: startDateController,
                        endDateController: endDateController,
                        onTap: () {
                          context.read<CvBloc>().add(UpdateProjectEvent(
                              project: Project(
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  startDate: locator.currentlySelectedStartDate,
                                  endDate: locator.currentlySelectedEndDate,
                                  resumeId: project.resumeId,),
                                  id: project.id!));
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
                              .add(RemoveProjectEvent(project: project));
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