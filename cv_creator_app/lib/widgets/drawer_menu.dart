import 'package:cv_creator_app/constrans/color.dart';
import 'package:cv_creator_app/constrans/space.dart';
import 'package:cv_creator_app/screens/add_cv_screen.dart';
import 'package:cv_creator_app/screens/all_user_cvs_screen.dart';
import 'package:cv_creator_app/screens/registration/bloc/registration_bloc.dart';
import 'package:cv_creator_app/screens/user_cv_screen.dart';
import 'package:cv_creator_app/screens/registration/signin.dart';
import 'package:cv_creator_app/widgets/menu_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
      child: ListView(children: [
   
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: brown,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " ProfeCV",
                  style: GoogleFonts.alegreya(textStyle: const TextStyle(
                      color: white, fontSize: 24, fontWeight: FontWeight.w700),
                )
                ),
                const Icon(
                  Icons.error_outline,
                  color: brown,
                ),
              ]),
        ),
        height24,
        Container(
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: green, width: 1))),
        ),

        height24,
        MenuCard(
          title: "Add CV",
          icon: Icons.add_box_outlined,
          toPage: AddCVScreen(),
        ),
        height24,
        const MenuCard(
          title: "Your CV",
          icon: Icons.account_box_outlined,// add_circle_outline_sharp
          toPage: UserCVScreen(),
        ),
        height24,
        const MenuCard(
          title: "All other CV",
          icon: Icons.amp_stories_outlined, // chat_outlined,
          toPage: AllUserCVsScreen(),
        ),
        height24,
        InkWell(
          onTap:(){
            context.read<RegistrationBloc>().add(SignOutEvent());
          },
          child: MenuCard(
            title: "Sign Out",
            icon: Icons.login_outlined,
            toPage: SignInScreen(),
          ),
        ),
      ]),
    );
  }
}