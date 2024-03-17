import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project7/bloc/bloc/signin_bloc.dart';
import 'package:project7/model/user_data.dart';
import 'package:project7/page/signup_page.dart';

import '../helper/colors.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key, this.userData});
  final UserDataModel? userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,
      appBar: AppBar(
        backgroundColor: beige,
        title: const Center(
          child: Text(
            "Profile",
            style: TextStyle(
                fontSize: 20, color: white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(150),
              ),
              clipBehavior: Clip.antiAlias,
              height: 120,
              width: 120,
              child: Image.asset(
                "images/user.png",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 5),
            const SizedBox(height: 19),
            Container(
              color: const Color(0xfff8f8f8),
              width: 350,
              height: 90,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          userData?.fullName ?? 'SAUD ALQURASHI',
                          style: const TextStyle(
                              color: dark, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.edit,
                          color: teal,
                          size: 17,
                        )
                      ],
                    ),
                    const Divider(indent: 10, endIndent: 10),
                    Row(
                      children: [
                        Text(
                          userData?.email ?? 'saod.q@gmail.com',
                          style: const TextStyle(
                              color: dark, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.edit,
                          color: teal,
                          size: 17,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              color: const Color(0xfff8f8f8),
              width: 350,
              height: 130,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.accessible_forward),
                        Text("  Social Responsibility"),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffc3c3c3),
                          size: 17,
                        )
                      ],
                    ),
                    Divider(indent: 10, endIndent: 10),
                    Row(
                      children: [
                        Icon(Icons.abc_outlined),
                        Text("  FAQ"),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffc3c3c3),
                          size: 17,
                        )
                      ],
                    ),
                    Divider(indent: 10, endIndent: 10),
                    Row(
                      children: [
                        Icon(Icons.abc_outlined),
                        Text("  Terms & Conditions"),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffc3c3c3),
                          size: 17,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 200,
              height: 33,
              child: ElevatedButton(
                onPressed: () {
                  context.read<SigninBloc>().add(SignOutEvent());
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    )),
                child: const Text(
                  "Sign Out",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
