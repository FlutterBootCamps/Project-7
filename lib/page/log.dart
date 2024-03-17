import 'package:flutter/material.dart';
import 'package:try_auth_suba/api/serves.dart';
import 'package:try_auth_suba/page/sing.dart';
import 'package:try_auth_suba/page/user_cv.dart';
import 'package:try_auth_suba/setup/git_it.dart';
import 'package:try_auth_suba/temp%20cv/view_all_cv.dart';

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
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text("Login to",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              const Text("how to get",
                  style: TextStyle(fontSize: 25, color: Colors.white)),
              const Text("job",
                  style: TextStyle(fontSize: 30, color: Colors.white)),
              TextField(
                style: TextStyle(color: Colors.black),
                controller: emailController,
                decoration: const InputDecoration(filled: true,fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 10),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    prefixIcon: Icon(Icons.email, color: Colors.black),
                    hintText: "email" ,hintStyle: TextStyle(color: Colors.black)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                controller: passwordController,
                decoration: const InputDecoration(filled: true,fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    prefixIcon: Icon(Icons.password, color: Colors.black),
                    hintText: "password",hintStyle: TextStyle(color: Colors.black)),
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
                            builder: (context) => const UserCv()));
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
                      child: const Text("signUp",style: TextStyle(color: Colors.purple),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
