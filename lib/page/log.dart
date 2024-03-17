import 'package:flutter/material.dart';
import 'package:try_auth_suba/api/serves.dart';
import 'package:try_auth_suba/page/home.dart';
import 'package:try_auth_suba/page/sing.dart';
import 'package:try_auth_suba/setup/git_it.dart';
import 'package:try_auth_suba/temp%20cv/view_cv.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text("Login to",
                  style: TextStyle(fontSize: 20, color: Colors.blue)),
              const Text("how to get",
                  style: TextStyle(fontSize: 25, color: Colors.blue)),
              const Text("job",
                  style: TextStyle(fontSize: 30, color: Colors.blue)),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 10),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                    hintText: "email" ,hintStyle: TextStyle(color: Colors.white)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: passwordController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    prefixIcon: Icon(Icons.password, color: Colors.white),
                    hintText: "password",hintStyle: TextStyle(color: Colors.white)),
              ),
              const SizedBox(
                height: 24,
              ),
              MaterialButton(
                onPressed: () async {
                  await gitIt()
                      .locator
                      .get<Serves>()
                      .supabase
                      .auth
                      .signInWithPassword(
                          password: passwordController.text,
                          email: emailController.text);
                  String token = gitIt()
                      .locator
                      .get<Serves>()
                      .supabase
                      .auth
                      .currentSession!
                      .accessToken;
                  await gitIt().locator.get<Serves>().AddToken(token: token);

                  if (gitIt()
                      .locator
                      .get<Serves>()
                      .supabase
                      .auth
                      .currentSession!
                      .tokenType
                      .isNotEmpty) {
                    final id =
                        await gitIt().locator.get<Serves>().getUserIdByToken();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }

                  setState(() {});
                },
                color: Colors.blue.shade500,
                child: const Text("login"),
              ),
              Row(
                children: [Text("if you dont have account",style: TextStyle(color: Colors.white)),
                  TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (context) {
                            return const SignUpPage();
                          },
                        ), (route) => false);
                      },
                      child: const Text("signUp",style: TextStyle(color: Colors.blue),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
