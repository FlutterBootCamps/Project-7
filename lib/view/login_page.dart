import 'package:flutter/material.dart';
import 'package:project8/service/database.dart';
import 'package:project8/view/home_page.dart';
import 'package:project8/view/signup_page.dart';
import 'package:project8/view/tamplet_page.dart';
import 'package:project8/widgets/textfieldwidgets.dart';
import 'package:project8/widgets/tital_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});
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
            const titalwidget(tital: 'Welcome Back'),
            Image.asset(
              'assets/cvlogo.png',
              height: 190,
              width: 190,
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
                onPressed:  () async {
                  try {
                    await DataBase().signIn(
                        email: emailController.text,
                        password: passwordController.text);
                        if (context.mounted) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const HomePage();
                      },
                    ));
                  }
                  } on AuthException  {
                    print('auth errore');
                  } on Exception  {
                    print('error');
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: const Text(
                  'Sign In',
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
                    child: SignUpPage(),
                  ),
                );
              },
              child: const Text(
                'Don\'t have an account? Sign up',
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
