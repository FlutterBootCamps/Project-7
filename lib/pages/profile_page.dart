import 'package:cv_maker_app/bloc/auth_bloc.dart';
import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/fonts.dart';
import 'package:cv_maker_app/utils/spacing.dart';
import 'package:cv_maker_app/widgets/text_field_iconed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController jobFieldController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(ViewUserInfoEvent());
    return Scaffold(
      backgroundColor: milkChocolateColor,
      appBar: AppBar(
        backgroundColor: brownColor,
        title: const Text(
          "Profile",
          style: TextStyle(
              color: milkChocolateColor,
              fontFamily: nohemiFont,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const FaIcon(
            FontAwesomeIcons.angleLeft,
            color: milkChocolateColor,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ErrorState){
            context.showErrorSnackBar(context, state.msg);
          }else if (state is ShowUserInfoState){
            nameController.text = state.userinfo.name;
            jobFieldController.text = state.userinfo.jobField;
            emailController.text = state.userinfo.email;
            passwordController.text = state.userinfo.password;
          }
        },
        builder: (context, state) {
          if(state is LoadingState){
            return const Center(child: CircularProgressIndicator(color: brownColor,),);
          }else if (state is ShowUserInfoState){
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/default_profile.png"),
                ),
                height32,
                TextfieldIconed(
                    isEnabled: false,
                    hintText: "Enter your name",
                    labelText: "Name",
                    icon: const Icon(
                      Icons.person,
                    ),
                    controller: nameController),
                height16,
                TextfieldIconed(
                    isEnabled: false,
                    hintText: "Enter your Job field",
                    labelText: "Job Field",
                    icon: const Icon(
                      Icons.work_rounded,
                    ),
                    controller: jobFieldController),
                height16,
                TextfieldIconed(
                    isEnabled: false,
                    hintText: "Enter your email",
                    labelText: "Email",
                    icon: const Icon(
                      Icons.alternate_email_sharp,
                    ),
                    controller: emailController),
                height16,
                TextfieldIconed(
                    isEnabled: false,
                    isObscured: true,
                    hintText: "Enter your password",
                    labelText: "Password",
                    icon: const Icon(
                      Icons.lock_outline_rounded,
                    ),
                    controller: passwordController),
              ],
                        ),
            );
          }else {
            return const Center(child: Text("No User Data Found", style: TextStyle(color: greyColor, fontFamily: nohemiFont, fontSize: 16)),);
          }
          
        },
      ),
    );
  }
}
