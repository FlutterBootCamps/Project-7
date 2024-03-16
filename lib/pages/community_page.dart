import 'package:cv_maker_app/bloc/cv_bloc.dart';
import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/fonts.dart';
import 'package:cv_maker_app/utils/spacing.dart';
import 'package:cv_maker_app/widgets/resume_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CvBloc>().add(GetAllResumesEvent());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: milkChocolateColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Community CV's",
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
                  }
                },
                builder: (context, state) {
                  if (state is CvLoadingState){
                    return const Center(child: CircularProgressIndicator(color: brownColor,),);
                  }else if (state is ShowAllResumesState){
                    return (state.resumeList.isNotEmpty) ? ListView.builder(
                      itemCount: state.resumeList.length,
                      itemBuilder: (context, index) {
                        return ResumeCard(
                          isUser: false,
                          resume: state.resumeList[index],
                      );
                      },
                  ) : const Center(child: Text("No CV's Found, it's all chocolate crickits in here...", style: TextStyle(color: brownColor, fontFamily: nohemiFont, fontSize: 18, fontWeight: FontWeight.w400),),);
                  }else {
                    return const Center(child: Text("Error in getting all CV's", style: TextStyle(color: brownColor, fontFamily: nohemiFont, fontSize: 18, fontWeight: FontWeight.w400),),);
                  }
                  
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}