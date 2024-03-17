import 'package:flutter/material.dart';
import 'package:project_7_saad_alharbi/utils/colors.dart';

extension Screen on BuildContext {
  getWidth() {
    return MediaQuery.of(this).size.width;
  }

  push({required Widget view, required bool isPush}) {
    return Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => view),
      (route) => isPush,
    );
  }

  getHeight() {
    return MediaQuery.of(this).size.height;
  }

  getMassages({required String msg, required Color color}) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            msg,
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: color,
      ),
    );
  }
}
