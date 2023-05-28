import 'package:flutter/material.dart';
import '../../constants.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String id = 'ProfileScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        //
        title: const Text(
          "Profile",
          textAlign: TextAlign.center,
          style: TextStyle(color: ThirdColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Body(),
    );
  }
}
