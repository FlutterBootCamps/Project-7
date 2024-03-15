import 'package:cv_maker_app/bloc/auth_bloc.dart';
import 'package:cv_maker_app/helpers/extensions/screen_helper.dart';
import 'package:cv_maker_app/pages/navigation_page.dart';
import 'package:cv_maker_app/pages/signup_page.dart';
import 'package:cv_maker_app/utils/colors.dart';
import 'package:cv_maker_app/utils/fonts.dart';
import 'package:cv_maker_app/utils/spacing.dart';
import 'package:cv_maker_app/widgets/text_field_iconed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: brownColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SignedInState) {
              context.showSuccessSnackBar(context, state.msg);
              context.push(context, const NavigationPage(), false);
            } else if (state is ErrorState) {
              context.showErrorSnackBar(context, state.msg);
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: milkChocolateColor),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome back",
                    style: TextStyle(
                      color: milkChocolateColor,
                      fontFamily: nohemiFont,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "Ready to make a steamy CV?",
                    style: TextStyle(
                      color: milkChocolateColor,
                      fontFamily: nohemiFont,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  height32,
                  const Text("Log in",
                      style: TextStyle(
                          color: milkChocolateColor,
                          fontFamily: nohemiFont,
                          fontSize: 28,
                          fontWeight: FontWeight.w600)),
                  height32,
                  TextfieldIconed(
                    floatingLabelBehaviour: FloatingLabelBehavior.never,
                      hintText: "Enter your email",
                      labelText: "Email",
                      icon: const Icon(
                        Icons.alternate_email_sharp,
                      ),
                      controller: emailController),
                  height16,
                  TextfieldIconed(
                    isObscured: true,
                    floatingLabelBehaviour: FloatingLabelBehavior.never,
                    floatingLabelColor: milkChocolateColor,
                      hintText: "Enter your password",
                      labelText: "Password",
                      icon: const Icon(
                        Icons.lock_outline_rounded,
                      ),
                      controller: passwordController),
                  height16,
                  ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(milkChocolateColor),
                      ),
                      onPressed: () {
                        context.read<AuthBloc>().add(SigninEvent(email: emailController.text, password: passwordController.text));
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: whiteColor,
                            fontFamily: nohemiFont,
                            fontSize: 16),
                      )),
                  height16,
                  InkWell(
                    onTap: () {
                      context.push(context, SignupPage(), false);
                    },
                    child: RichText(
                        text: const TextSpan(
                            text: "Don't have an account yet? ",
                            style: TextStyle(
                                color: whiteColor,
                                fontFamily: nohemiFont,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            children: [
                          TextSpan(
                            text: "Sign up",
                            style: TextStyle(
                                color: whiteColor,
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
