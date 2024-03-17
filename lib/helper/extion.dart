import 'package:flutter/material.dart';

extension Screen on BuildContext {
  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  push(BuildContext context, Widget nextPage) {
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => nextPage),
      (route) => false,
    );
  }

  push_(BuildContext context, Widget nextPage) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => nextPage),
    );
  }

  pop(BuildContext context, Widget nextPage) {
    return Navigator.pop(
        context, MaterialPageRoute(builder: (route) => nextPage));
  }
}