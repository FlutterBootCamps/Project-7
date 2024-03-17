import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_7_saad_alharbi/extensions/screen_handler.dart';
import 'package:project_7_saad_alharbi/utils/colors.dart';
import 'package:project_7_saad_alharbi/utils/spacing.dart';
import 'package:project_7_saad_alharbi/views/login/login_page.dart';
import 'package:project_7_saad_alharbi/views/profile/bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoadState) {
              return ProfileCard(
                  name: state.user.name!,
                  email: state.user.email!,
                  image: AssetImage("assets/images/profile.png"));
            }
            return Center(
              child: ElevatedButton(
                  onPressed: () {
                    context.push(view: LoginPage(), isPush: false);
                  },
                  child: Text("Login")),
            );
          },
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final ImageProvider image;

  ProfileCard({
    super.key,
    required this.name,
    required this.email,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight() * 0.5,
      width: context.getWidth(),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(200)),
          image: DecorationImage(
              image: AssetImage("assets/images/rm251-mind-13-f.jpg"),
              fit: BoxFit.contain)),
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: image,
            ),
            height16,
            Text(
              name,
              style: TextStyle(
                color: teal,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            height8,
            Text(
              email,
              style: TextStyle(
                color: white,
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
