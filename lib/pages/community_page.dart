import 'package:cv_maker_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: milkChocolateColor,
      body: Center(child: Text("This is Community Page", style: TextStyle(color: blackColor),),),
    );
  }
}