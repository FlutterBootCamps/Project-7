import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project7/views/Log-In/log_in.dart';
import 'package:project7/views/Sign-In/bloc/sign_in_bloc.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController SignUpemailController = TextEditingController();
  final TextEditingController SignUppasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/void.jpg"),
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
              "Sign Up",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            const SizedBox(height: 50),
            TextField(
              controller: SignUpemailController,
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
              controller: SignUppasswordController,
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
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LogInScreen()));
                },
                child: const Text(
                  "Already has an Account? ",
                  style: TextStyle(color: Color(0xFFA75AFE)),
                )),
            const SizedBox(height: 20),
            BlocConsumer<SignInBloc, SignInState>(
              listener: (context, state) {
                if (state is SuccessSignInState) {
                  Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LogInScreen()));
                } else if (state is ErrorSignInState) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title:  Text("Wrong !"),
                      content:  Text(state.massage),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("OK"),
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
                          const Color(0xFFA75AFE).withOpacity(0.5)),
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
                        borderRadius:
                            BorderRadius.circular(12), 
                      )),
                    ),
                    onPressed: () {
                       BlocProvider.of<SignInBloc>(context).add(SignInEventEvent(
                          email: SignUpemailController.text,
                          password: SignUppasswordController.text));
                      
                    },
                    child: const Text(
                      "Sign Up",
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
