import 'package:cv_maker_app/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: milkChocolateColor,
      body: Center(child: Text("This is homepage", style: TextStyle(color: blackColor),),),
    );
  }
}