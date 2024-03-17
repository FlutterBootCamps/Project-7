import 'package:cv_app/extension/colors.dart';
import 'package:cv_app/extension/spase.dart';
import 'package:cv_app/pages/home_page.dart';
import 'package:cv_app/pages/nav_bar/bottom_navigation_br.dart';
import 'package:cv_app/pages/sign_up_page.dart';
import 'package:cv_app/services/data_service.dart';
import 'package:cv_app/services/setup.dart';
import 'package:cv_app/widgets/purble_elevated_button.dart';
import 'package:cv_app/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final servicelocater = DataInjection().locater.get<DataBase>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/Sign in-amico.png',
                width: 200,
              ),
              sizedBox15,
              const Text(
                "Welcome Back!",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
              ),
              const Text("Sign in to continue"),
              sizedBox10,
              TextFieldWidget(
                label: "Email",
                hintText: "gmail@gmail.com",
                controller: emailController,
              ),
              sizedBox15,
              TextFieldWidget(
                label: "Password",
                hintText: "*********",
                controller: passwordController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () async {
                        // try {
                        //   await servicelocater.signin(
                        //       password: passwordController.text,
                        //       email: emailController.text);
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const BottomNavBar(),
                        //     ),
                        //   );
                        // } on AuthException {
                        //   print("error auth");
                        // } on Exception {
                        //   print("error ");
                        // }
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) {
                        //     return const HomePage();
                        //   },
                        // ));
                      },
                      child: const Text("Forgot Password?")),
                ],
              ),
              sizedBox20,
              PurbleElevatedButton(
                onPressed: () async {
                  try {
                    await servicelocater.signin(
                        password: passwordController.text,
                        email: emailController.text);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavBar(),
                      ),
                    );
                  } on AuthException {
                    print("error auth");
                  } on Exception {
                    print("error ");
                  }
                  // print("object23");
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) {
                  //     return const HomePage();
                  //   },
                  // ));
                },
                text: "Sign in",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have as acount?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SignUpPage();
                          },
                        ));
                      },
                      child: const Text("Register")),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
