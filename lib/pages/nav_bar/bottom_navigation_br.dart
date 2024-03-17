import 'package:cv_app/extension/colors.dart';
import 'package:cv_app/pages/cv/cv_page.dart';
import 'package:cv_app/pages/cv/new_cv_page.dart';
import 'package:cv_app/pages/home_page.dart';
import 'package:cv_app/pages/nav_bar/bloc/nav_bloc.dart';
import 'package:cv_app/pages/previus_cv_page.dart';
import 'package:cv_app/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  final List<Widget> _pages = [
    const HomePage(),
    const PreviusCvPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBloc, NavState>(
      builder: (context, state) {
        if (state is SuccessState) {
          return Scaffold(
              body: _pages[state.currentIndex],
              bottomNavigationBar: Container(
                child: BottomNavigationBar(
                  selectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                  unselectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.bold),
                  unselectedFontSize: 12,
                  selectedFontSize: 9,
                  showUnselectedLabels: true,
                  currentIndex: state.currentIndex,
                  backgroundColor: whiteColor,
                  selectedItemColor: blackColor,
                  unselectedItemColor: greyColor,
                  onTap: (index) {
                    context
                        .read<NavBloc>()
                        .add(ChangeThePageEvent(currentIndex: index));
                  },
                  items: [
                    BottomNavigationBarItem(
                      backgroundColor: blackColor,
                      icon: const Icon(Icons.home),
                      label: ("Home"),
                    ),
                    BottomNavigationBarItem(
                        backgroundColor: blackColor,
                        icon: const Icon(Icons.note_add_rounded),
                        label: "Cv"),
                    BottomNavigationBarItem(
                        backgroundColor: blackColor,
                        icon: const Icon(Icons.person),
                        label: "Profile"),
                  ],
                ),
              ));
        }
        return const Text("Error");
      },
    );
  }
}
