import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
}

extension NavigatorHelper on BuildContext {
  void push(Widget widget) {
    Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  void Replacement(Widget widget) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }
}
/* SizedBox(
//height: MediaQuery.of(context).size.height / 20,
height:context.screenHeight / 20;
), // SizedBox
ontap(){context.push(new screen());} */
