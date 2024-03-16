import 'package:cv_maker_app/bloc/auth_bloc.dart';
import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/fonts.dart';
import 'package:cv_maker_app/utils/spacing.dart';
import 'package:cv_maker_app/widgets/bottom_button.dart';
import 'package:cv_maker_app/widgets/text_field_iconed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoBottomSheet extends StatelessWidget {
  const PersonalInfoBottomSheet({
    super.key,
    required this.cvNameController,
    required this.fullNameController,
    required this.jobTitleController,
    required this.emailController,
    required this.phoneController,
    required this.addressController, this.onTap, this.isEdit = false,
  });

  final TextEditingController cvNameController;
  final TextEditingController fullNameController;
  final TextEditingController jobTitleController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final bool? isEdit;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(context),
      height: 650,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: milkChocolateColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ErrorState){
            context.showErrorSnackBar(context, state.msg);
            Navigator.pop(context);
          }else if (state is ShowUserInfoState){
            (isEdit!) ? null :fullNameController.text = state.userinfo.name;
            (isEdit!) ? null :emailController.text = state.userinfo.email;
            (isEdit!) ? null : jobTitleController.text = state.userinfo.jobField;
          }
        },
        builder: (context, state) {
          if (state is LoadingState){
            return const Center(child: CircularProgressIndicator(color: brownColor,),);
          }else {
          return Column(
            children: [
              const Text(
                "Personal Information",
                style: TextStyle(
                  color: brownColor,
                  fontFamily: nohemiFont,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              height32,
              TextfieldIconed(
                isEnabled: !isEdit!,
                controller: cvNameController,
                hintText: "Enter CV name",
                labelText: "CV Name",
                icon: const Icon(
                  Icons.library_books_rounded,
                ),
              ),
              height8,
              TextfieldIconed(
                isEnabled: false,
                controller: fullNameController,
                hintText: "Enter full name",
                labelText: "Full Name",
                icon: const Icon(
                  Icons.person,
                ),
              ),
              height8,
              TextfieldIconed(
                controller: jobTitleController,
                hintText: "Enter job title",
                labelText: "Job Title",
                icon: const Icon(
                  Icons.work_rounded,
                ),
              ),
              height8,
              TextfieldIconed(
                isEnabled: false,
                controller: emailController,
                hintText: "Enter email",
                labelText: "Email",
                icon: const Icon(
                  Icons.alternate_email_rounded,
                ),
              ),
              height8,
              TextfieldIconed(
                controller: phoneController,
                hintText: "Enter phone",
                labelText: "Phone",
                icon: const Icon(Icons.phone_rounded),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              height8,
              TextfieldIconed(
                controller: addressController,
                hintText: "Enter address",
                labelText: "Address",
                icon: const Icon(
                  Icons.home_work_rounded,
                ),
              ),
              height32,
              BottomButton(
                buttonColor: brownColor,
                text: (isEdit!) ? "Edit" : "Add CV",
                textColor: whiteColor,
                textSize: 16,
                buttonWidth: context.getWidth(context) * .5,
                onTap: onTap
              ),
            ],
          );
          }
        },
      ),
    );
  }
}
