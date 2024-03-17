import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project7/views/Log-In/bloc/log_in_bloc.dart';
import 'package:project7/views/Sign-In/sign_in.dart';
import 'package:project7/views/home-screen/home_screen.dart';
import 'package:project7/views/widgets/nav_bottom.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/blue.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Log In",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            const SizedBox(height: 50),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                filled: true,
                fillColor: Colors.transparent,
              ),
              obscureText: true,
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      //  Navigator.of(context).push(
                      //         MaterialPageRoute(builder: (context) => SignInScreen()));
                    },
                    child: const Text(
                      "Forget Passwoer ",
                      style: TextStyle(color: Colors.blue),
                    )),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpScreen()));
                    },
                    child: const Text(
                      "create new account ",
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            ),
            const SizedBox(height: 20),
            BlocConsumer<LogInBloc, LogInState>(
              listener: (context, state) {
                if (state is SuccessState) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => NavBottomBar()));
                } else if (state is ErrorState) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Wrong !"),
                      content: Text(state.massage),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"),
                        ),
                      ],
                    ),
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.lightBlue.withOpacity(0.5)),
                      elevation: MaterialStateProperty.all(8),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24)),
                      textStyle: MaterialStateProperty.all(const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                    ),
                    onPressed: () {
                      BlocProvider.of<LogInBloc>(context).add(LogInEventEvent(
                          email: emailController.text,
                          password: passwordController.text));
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(color: Colors.white),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
