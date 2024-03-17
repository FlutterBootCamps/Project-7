import 'package:cv_app/extension/colors.dart';
import 'package:cv_app/extension/spase.dart';
import 'package:cv_app/pages/sign_in_page.dart';
import 'package:cv_app/services/data_service.dart';
import 'package:cv_app/services/setup.dart';
import 'package:cv_app/widgets/purble_elevated_button.dart';
import 'package:cv_app/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
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
                'assets/images/Sign up-amico (1).png',
                width: 200,
              ),
              sizedBox15,
              const Text(
                "Let's Get Started",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
              ),
              const Text("Create a new account"),
              sizedBox10,
              TextFieldWidget(
                label: "First Name",
                hintText: "First Name",
                controller: firstNameController,
              ),
              sizedBox15,
              TextFieldWidget(
                label: "Phone",
                hintText: "05*******",
                controller: secondNameController,
              ),
              sizedBox15,
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
              sizedBox20,
              PurbleElevatedButton(
                onPressed: () async {
                  print("enter");
                  try {
                    await servicelocater.signup(
                        password: passwordController.text,
                        phone: secondNameController.text,
                        email: emailController.text);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SigninPage(),
                      ),
                    );
                  } on AuthException {
                    print("error auth");
                  } on Exception {
                    print("error ");
                  }
                },
                text: "Sign Up",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Have an account?"),
                  TextButton(
                      onPressed: () {
                        print("error auth");
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SigninPage();
                          },
                        ));
                      },
                      child: const Text("Sign in")),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
