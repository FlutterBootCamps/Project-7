import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project8/service/database.dart';
import 'package:project8/view/login_page.dart';
import 'package:project8/widgets/textfieldwidgets.dart';
import 'package:project8/widgets/tital_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: const Color(0xfff3f1ee),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const titalwidget(tital: 'Create Account'),
            Image.asset(
              'assets/cvlogo.png',
              height: 190,
              width: 190,
            ),
            TextfieldWidget(
              labelText: 'Enter your Name',
              controller: nameController,
            ),
            TextfieldWidget(
              labelText: 'Enter your Email',
              controller: emailController,
            ),
            TextfieldWidget(
              labelText: 'Enter your Password',
              controller: passwordController,
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 390,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    await DataBase().signUp(
                        email: emailController.text,
                        password: passwordController.text);
                  } on AuthException catch (e) {
                    print(Text('errorauuth'));
                  } on Exception catch (e) {
                    print(Text('errors'));
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 16, color: Color(0xffc5bbb9)),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: LogInPage(),
                  ),
                );
              },
              child: const Text(
                'Do you have an account? Log in',
                style: TextStyle(
                  color: Color(0xff928785),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
