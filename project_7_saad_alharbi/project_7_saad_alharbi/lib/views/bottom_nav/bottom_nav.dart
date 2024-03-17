import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project_7_saad_alharbi/extensions/screen_handler.dart';
import 'package:project_7_saad_alharbi/utils/colors.dart';
import 'package:project_7_saad_alharbi/views/bottom_nav/bloc/bottom_nav_bloc.dart';
import 'package:project_7_saad_alharbi/views/login/login_page.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          final bloc = context.read<BottomNavBloc>();
          return Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/v859-katie-09.jpg"))),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                actions: [
                  IconButton(
                      onPressed: () {
                        context.read<BottomNavBloc>().add(LogoutEvent());
                        context.push(view: const LoginPage(), isPush: true);
                      },
                      icon: Icon(
                        Icons.logout,
                        color: teal,
                      ))
                ],
              ),
              bottomNavigationBar: Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: gray,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: GNav(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    tabs: const [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.add,
                        text: 'Create CV',
                      ),
                      GButton(
                        icon: Icons.person,
                        text: 'Profile',
                      ),
                    ],
                    activeColor: white,
                    color: black,
                    backgroundColor: Colors.transparent,
                    iconSize: 30,
                    gap: 8,
                    tabBackgroundColor: teal,
                    padding: const EdgeInsets.all(16),
                    onTabChange: (value) {
                      bloc.add(ChangePageEvent(indexPage: value));
                    },
                    selectedIndex: bloc.currentIndex,
                  ),
                ),
              ),
              body: bloc.pages[bloc.currentIndex],
            ),
          );
        },
      ),
    );
  }
}
