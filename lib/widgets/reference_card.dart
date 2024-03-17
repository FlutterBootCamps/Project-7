import 'package:cv_maker_app/bloc/cv_bloc.dart';
import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/models/reference_model.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/spacing.dart';
import 'package:cv_maker_app/widgets/head_tail_text.dart';
import 'package:cv_maker_app/widgets/reference_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                        onPressed: () {
                          TextEditingController nameController =
                      TextEditingController(text: reference.name);
                  TextEditingController jobTitleController =
                      TextEditingController(text: reference.jobTitle);
                  TextEditingController organizationController =
                      TextEditingController(text: reference.organization);
                  TextEditingController emailController =
                      TextEditingController(text: reference.email);
                  TextEditingController phoneController =
                      TextEditingController(text: reference.phone);
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return ReferenceBottomSheet(
                        isEdit:  true,
                        nameController: nameController,
                        jobTitleController: jobTitleController,
                        organizationController: organizationController,
                        emailController: emailController,
                        phoneController: phoneController,
                        onTap: () {
                          context.read<CvBloc>().add(UpdateReferenceEvent(
                            id: reference.id!,
                              reference: Reference(
                                  name: nameController.text,
                                  jobTitle: jobTitleController.text,
                                  organization: organizationController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  resumeId: reference.resumeId)));
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
                              .add(RemoveReferenceEvent(reference: reference));
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