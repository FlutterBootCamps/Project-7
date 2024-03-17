import 'package:cv_creator_app/constrans/color.dart';
import 'package:cv_creator_app/constrans/space.dart';
import 'package:cv_creator_app/helper/screen_helper.dart';
import 'package:cv_creator_app/screens/home_screen.dart';
import 'package:cv_creator_app/screens/registration/bloc/registration_bloc.dart';
import 'package:cv_creator_app/screens/registration/signup_screen.dart';
import 'package:cv_creator_app/widgets/password_textfield_widget.dart';
import 'package:cv_creator_app/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<RegistrationBloc>();

          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: BlocConsumer<RegistrationBloc, RegistrationState>(
                  listener: (context, state) {
                    if (state is LoadingState) {
                      showDialog(
                          barrierDismissible: false,
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              content: CircularProgressIndicator(),
                            );
                          });
                    }
                    if (state is SignInState) {
                      Navigator.pop(context);
                      context.pushTo(view: const HomeScreen());
                    }
                    if (state is ErrorState) {
                      Navigator.pop(context);
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              width: context.getWidth(),
                              height: context.getWidth() * 0.2,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                state.message,
                                // " Password should be at least 6 characters.",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 18),
                              ),
                            );
                          });
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: context.getWidth() * 0.8,
                          height: context.getWidth() * 0.8,
                          child: Image.asset("assets/images/signin.png"),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: darkGreen),
                            ),
                          ],
                        ),
                        height32,
                        const Text(
                          "Welcome back!",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: black),
                        ),
                        const Text(
                          "Let's login for explore continues",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: grey),
                        ),
                        height24,
                        TextFieldWidget(
                          controller: emailController,
                          hintText: "Enter Your Email",
                          icon: const Icon(Icons.email_outlined),
                        ),
                        height24,
                        SizedBox(
                          width: context.getWidth() * 0.8,
                          child:
                              BlocBuilder<RegistrationBloc, RegistrationState>(
                            builder: (context, state) {
                              if (state is ShowHidePasswordState) {
                                return PasswordTextFieldWidget(
                                  passwordController: passwordController,
                                  isHidden: state.isHidden,
                                );
                              }
                              return PasswordTextFieldWidget(
                                passwordController: passwordController,
                                isHidden: true,
                              );
                            },
                          ),
                        ),
                        height32,
                        InkWell(
                          onTap: () async {
                            print("pressed");
                            if (emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              bloc.add(SignInEvent(
                                  email: emailController.text,
                                  password: passwordController.text));
                            }
                          },
                          child: Container(
                            width: context.getWidth() * 0.8,
                            height: context.getWidth() * 0.13,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: darkGreen,
                            ),
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                  color: white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        height32,
                        SizedBox(
                          width: context.getWidth() * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account? ",
                                style: TextStyle(color: black, fontSize: 14),
                              ),
                              width12,
                              InkWell(
                                  onTap: () {
                                    Navigator.pushAndRemoveUntil(context,
                                        MaterialPageRoute(builder: (context) {
                                      return SignUPScreen();
                                    }), (route) => false);
                                    // context.pushTo(view: SignUPScreen());
                                  },
                                  child: const Text(
                                    "Sign UP here ",
                                    style: TextStyle(
                                        color: darkGreen, fontSize: 14),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
