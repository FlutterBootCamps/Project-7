import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project7/page/signup_page.dart';

import '../bloc/bloc/signin_bloc.dart';
import '../helper/colors.dart';
import '../navbar/nav_bottom.dart';
import '../widgets/textfiled_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        body: BlocProvider(
          create: (context) => SigninBloc(),
          child: BlocConsumer<SigninBloc, SigninState>(
            listener: (context, state) {
            if (state is SignInSuccessState){
                Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const NavBottom()),
                (route) => false,
              );
            }else if (state is ErrorState) {
              // Show an error dialog if sign-in fails
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Error'),
                  content: Text(state.wrongSignIn),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            }
            },
            builder: (context, state) {
              return Container(
                width: double.infinity,
                // Background decoration
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    // Gradient overlay for better readability of content
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(.9),
                        Colors.black.withOpacity(.5),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
        
                        Container(
                           height: 340,
                          color: white,
                          child: Column(
                            children: [
                              Container(
                                 height: 60,
                                      width: 360,
                                      decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        colors: [teal, lightTeal]),
                                  
                                  ),
                                child: const Center(child: Text("Sign In",style: TextStyle(color: white,fontWeight: FontWeight.w900,fontSize: 30),)),
                              ),
                               Textfield2Widget(label: 'Email',controller:emailController),
                              const SizedBox(height: 20),
                              Textfield2Widget(label: 'Password',controller:passwordController),
                               const SizedBox(height: 30),
                                // Sign-in button
                        GestureDetector(
                          onTap: () {
                            //---TODO LOGIN
                            BlocProvider.of<SigninBloc>(context).add(
                              SigninnEvent(
                                email: emailController.text,
                              password: passwordController.text,
                            ),
                            );
                          },
                          child: Container(
                            height: 50,
                             width: 250,
                        decoration: BoxDecoration(
                          
                         gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,
                         colors: [teal, lightTeal]),
                          borderRadius: BorderRadius.circular(50),
                        ),
                            child: const Center(
                              child: Text(
                                "Get started",
                                style: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),

                          Row(
                            children: [
                              const SizedBox(width: 20),
                              const Text(
                               ' Not a member ?',
                                style: TextStyle(color: dark,fontSize: 15)
                                 
                            ), 
                              TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return const SignupPage();
                                    },
                                  ), (route) => false);
                                },
                                child: const Text(
                                  "SignUp",
                                  style: TextStyle(color: Colors.teal,fontSize: 15,fontWeight: FontWeight.w700),
                                )),
                            ],
                          ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
