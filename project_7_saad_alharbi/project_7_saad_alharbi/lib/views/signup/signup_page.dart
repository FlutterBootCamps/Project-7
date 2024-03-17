import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_7_saad_alharbi/extensions/screen_handler.dart';
import 'package:project_7_saad_alharbi/utils/colors.dart';
import 'package:project_7_saad_alharbi/views/login/login_page.dart';
import 'package:project_7_saad_alharbi/views/signup/bloc/sign_up_bloc.dart';

import '../../widgets/text_felid_widget.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerPassword = TextEditingController();
    TextEditingController controllerName = TextEditingController();
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: Scaffold(
        backgroundColor: black,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocConsumer<SignUpBloc, SignUpState>(
                listener: (context, state) {
                  if (state is SignUpSuccessState) {
                    context.getMassages(msg: state.msg, color: success);
                    context.push(view: const LoginPage(), isPush: false);
                  } else if (state is SignUpErrorState) {
                    context.getMassages(msg: state.msg, color: error);
                  }
                },
                builder: (context, state) {
                  if (state is SignUpLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: teal,
                      ),
                    );
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            color: teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        padding: const EdgeInsets.all(16),
                        width: context.getWidth(),
                        height: context.getHeight() * 0.45,
                        decoration: BoxDecoration(
                            color: gray,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFelidWidget(
                              controller: controllerName,
                              title: "Name",
                              hintText: "Enter your Name",
                              icon: Icons.person,
                            ),
                            TextFelidWidget(
                              controller: controllerEmail,
                              title: "Email",
                              hintText: "Enter your Email",
                              icon: Icons.email,
                            ),
                            TextFelidWidget(
                              controller: controllerPassword,
                              title: "Password",
                              maxLine: 1,
                              hintText: "Enter your password",
                              isObscure: true,
                              icon: Icons.lock,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    context.read<SignUpBloc>().add(
                                        SignUpNewUserEvent(
                                            name: controllerName.text,
                                            email: controllerEmail.text,
                                            password: controllerPassword.text));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: teal,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      'Sign up',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                context.push(
                                    view: const LoginPage(), isPush: false);
                              },
                              child: Text(
                                "Have an account? Login",
                                style: TextStyle(color: white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
