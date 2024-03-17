
import 'package:flutter/material.dart';
import 'package:project7/views/View-All-Cv/view_all_cvs.dart';
import 'package:project7/views/view-cv/view_user_cv.dart';
import 'package:project7/views/home-screen/home_screen.dart';

class NavBottomBar extends StatefulWidget {
  @override
  _NavBottomBarState createState() => _NavBottomBarState();
}

class _NavBottomBarState extends State<NavBottomBar> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    ViewUserCv(),
    ViewAllCvs(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.create_new_folder),
            label: 'Create Cv ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books_rounded),
            label: 'My Cv',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inbox),
            label: 'ViewAllCvs',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}