import 'package:cv_maker_app/bloc/auth_bloc.dart';
import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/pages/login_page.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/fonts.dart';
import 'package:cv_maker_app/utils/spacing.dart';
import 'package:cv_maker_app/widgets/text_field_iconed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController jobFieldController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: milkChocolateColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SignedUpState) {
              context.showSuccessSnackBar(context, state.msg);
              context.push(context, LoginPage(), false);
            } else if (state is ErrorState) {
              context.showErrorSnackBar(context, state.msg);
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: brownColor),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome to\nMocolate",
                    style: TextStyle(
                      color: brownColor,
                      fontFamily: nohemiFont,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "Make your resume as easy as a cup of milk chocolate",
                    style: TextStyle(
                      color: brownColor,
                      fontFamily: nohemiFont,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  height32,
                  const Text("Sign up",
                      style: TextStyle(
                          color: brownColor,
                          fontFamily: nohemiFont,
                          fontSize: 28,
                          fontWeight: FontWeight.w600)),
                  height32,
                  TextfieldIconed(
                      hintText: "Enter your name",
                      labelText: "Name",
                      icon: const Icon(
                        Icons.person,
                      ),
                      controller: nameController),
                  height16,
                  TextfieldIconed(
                      hintText: "Enter your Job field",
                      labelText: "Job Field",
                      icon: const Icon(
                        Icons.work_rounded,
                      ),
                      controller: jobFieldController),
                  height16,
                  TextfieldIconed(
                      hintText: "Enter your email",
                      labelText: "Email",
                      icon: const Icon(
                        Icons.alternate_email_sharp,
                      ),
                      controller: emailController),
                  height16,
                  TextfieldIconed(
                    isObscured: true,
                      hintText: "Enter your password",
                      labelText: "Password",
                      icon: const Icon(
                        Icons.lock_outline_rounded,
                      ),
                      controller: passwordController),
                  height16,
                  ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(brownColor),
                      ),
                      onPressed: () {
                        context.read<AuthBloc>().add(SignupEvent(name: nameController.text, jobField: jobFieldController.text ,email: emailController.text, password: passwordController.text));
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            color: whiteColor,
                            fontFamily: nohemiFont,
                            fontSize: 16),
                      )),
                  height16,
                  InkWell(
                    onTap: () {
                      context.push(context, LoginPage(), false);
                    },
                    child: RichText(
                        text: const TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                                color: blackColor,
                                fontFamily: nohemiFont,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            children: [
                          TextSpan(
                            text: "Log in",
                            style: TextStyle(
                                color: blackColor,
                                fontFamily: nohemiFont,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                decorationThickness: 4),
                          ),
                        ])),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
