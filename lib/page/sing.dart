
import 'package:flutter/material.dart';
import 'package:try_auth_suba/api/serves.dart';
import 'package:try_auth_suba/page/log.dart';
import 'package:try_auth_suba/setup/git_it.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
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
              const Text("singup to",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              const Text("how to get",
                  style: TextStyle(fontSize: 25, color: Colors.white)),
              const Text("job",
                  style: TextStyle(fontSize: 30, color: Colors.white)),
              TextField(
                controller: nameController,
decoration:  InputDecoration(filled: true,fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 10),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    prefixIcon: Icon(Icons.person_sharp, color: Colors.black),hintStyle: TextStyle(color: Colors.black),
                                      hintText: "name"),
              ),
              TextField(style: TextStyle(color: Colors.black),
                controller: emailController,
decoration: const InputDecoration(filled: true,fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 10),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    prefixIcon: Icon(Icons.email, color: Colors.black),hintStyle: TextStyle(color: Colors.black),
                                      hintText: "email"),
              ),
              TextField(style: TextStyle(color: Colors.black),
                controller: passwordController,
decoration: const InputDecoration(filled: true,fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 10),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    prefixIcon: Icon(Icons.password, color: Colors.black),hintStyle: TextStyle(color: Colors.black),
                                      hintText: "password"),
              ),
              const SizedBox(
                height: 24,
              ),
              MaterialButton(
                
                onPressed: () async{await gitIt().locator.get<Serves>().supabase.auth.signUp(email:emailController.text ,password: passwordController.text);
                await gitIt().locator.get<Serves>().insertDataUser(nameController.text , emailController.text, passwordController.text);
                setState(() {
                  
                });},
                                color: Colors.blue.shade500,

                child: const Text("singup"),
              ),
              const SizedBox(
                height: 24,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) {
                        return const LoginPage();
                      },
                    ), (route) => false);
                  },
                  child: const Text("Login",style: TextStyle(color: Colors.purple,))),
            ],
          ),
        ),
      ),
    );
  }
}
