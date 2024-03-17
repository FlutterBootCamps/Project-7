import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_7_saad_alharbi/extensions/screen_handler.dart';
import 'package:project_7_saad_alharbi/utils/colors.dart';
import 'package:project_7_saad_alharbi/utils/spacing.dart';
import 'package:project_7_saad_alharbi/views/bottom_nav/bottom_nav.dart';
import 'package:project_7_saad_alharbi/views/login/bloc/login_bloc.dart';
import 'package:project_7_saad_alharbi/views/signup/signup_page.dart';
import 'package:project_7_saad_alharbi/widgets/text_felid_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerPassword = TextEditingController();
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        backgroundColor: black,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    context.getMassages(msg: state.msg, color: success);
                    context.push(view: const BottomNav(), isPush: false);
                  } else if (state is LoginErrorState) {
                    context.getMassages(msg: state.msg, color: error);
                  }
                },
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: teal,
                      ),
                    );
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome To CV Maker where you Make your own CV",
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      height16,
                      Text(
                        "Login",
                        style: TextStyle(
                            color: teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        padding: const EdgeInsets.all(16),
                        width: context.getWidth(),
                        height: context.getHeight() * 0.4,
                        decoration: BoxDecoration(
                            color: gray,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
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
                                    context.read<LoginBloc>().add(
                                        LoginUserEvent(
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
                                      'Login',
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
                                context.push(view: SignUpPage(), isPush: false);
                              },
                              child: Text(
                                "You don't have an account? Sign up",
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
