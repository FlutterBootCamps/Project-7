import 'package:cv_maker_app/bloc/auth_bloc.dart';
import 'package:cv_maker_app/bloc/cv_bloc.dart';
import 'package:cv_maker_app/data_layer/home_data_layer.dart';
import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/models/resume_model.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/fonts.dart';
import 'package:cv_maker_app/utils/spacing.dart';
import 'package:cv_maker_app/widgets/personal_info_bottom_sheet.dart';
import 'package:cv_maker_app/widgets/resume_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final locator = GetIt.I.get<HomeData>();
    context.read<CvBloc>().add(GetUserResumesEvent());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: milkChocolateColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My CV's",
              style: TextStyle(
                  color: brownColor,
                  fontFamily: nohemiFont,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
            height16,
            SizedBox(
              width: context.getWidth(context),
              height: context.getHeight(context) * .71,
              child: BlocConsumer<CvBloc, CvState>(
                listener: (context, state) {
                  if (state is CvErrorState) {
                    context.showErrorSnackBar(context, state.msg);
                  } else if (state is ResumeCreatedState) {
                    context.showSuccessSnackBar(context, state.msg);
                    context.read<CvBloc>().add(GetUserResumesEvent());
                  }else if (state is ModfiedResumeState){
                    (state.isPostive) ? context.showSuccessSnackBar(context, state.msg) : context.showErrorSnackBar(context, state.msg);
                  }
                },
                builder: (context, state) {
                  if (state is CvLoadingState){
                    return const Center(child: CircularProgressIndicator(color: brownColor,),);
                  }else if (state is ShowUserResumesState){
                    return (state.resumeList.isNotEmpty) ? ListView.builder(
                      itemCount: state.resumeList.length,
                      itemBuilder: (context, index) {
                        return ResumeCard(
                          isUser: true,
                          resume: state.resumeList[index],
                      );
                      },
                  ) : const Center(child: Text("No CV's Found, create one now!", style: TextStyle(color: brownColor, fontFamily: nohemiFont, fontSize: 18, fontWeight: FontWeight.w400),),);
                  }else if (state is CvErrorState){
                    return const Center(child: Text("Error in getting your CV's", style: TextStyle(color: brownColor, fontFamily: nohemiFont, fontSize: 18, fontWeight: FontWeight.w400),),);
                  }else {
                    return Container();
                  }
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController cvNameController = TextEditingController();
          TextEditingController fullNameController = TextEditingController();
          TextEditingController jobTitleController = TextEditingController();
          TextEditingController emailController = TextEditingController();
          TextEditingController phoneController = TextEditingController();
          TextEditingController addressController = TextEditingController();
          context.read<AuthBloc>().add(ViewUserInfoEvent());
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return PersonalInfoBottomSheet(
                  onTap: () {
                    context.read<CvBloc>().add(CreateResumeEvent(
                        resume: Resume(
                            cvName: cvNameController.text,
                            creationDate: DateTime.now(),
                            fullName: fullNameController.text,
                            jobTitle: jobTitleController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            address: addressController.text,
                            userId: locator.currentUserId)));
                    Navigator.pop(context);
                  },
                  cvNameController: cvNameController,
                  fullNameController: fullNameController,
                  jobTitleController: jobTitleController,
                  emailController: emailController,
                  phoneController: phoneController,
                  addressController: addressController);
            },
          );
        },
        backgroundColor: brownColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add_rounded,
          color: whiteColor,
          size: 40,
        ),
      ),
    );
  }
}
