import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class ProfileMenu extends StatelessWidget {
  ProfileMenu({
    Key? key,
    this.widget,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;
  Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(10),
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: ThirdColor,
              width: 22,
            ),
            SizedBox(width: 20),
            Expanded(
                child: Text(
              text,
              style: TextStyle(color: ThirdColor),
            )),
            SvgPicture.asset(
              'assets/icon/Arrow - Right 2.svg',
              color: ThirdColor,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenu1 extends StatelessWidget {
  ProfileMenu1({
    Key? key,
    this.widget,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text, icon;

  Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            color: ThirdColor,
            width: 22,
          ),
          SizedBox(width: 20),
          Expanded(
              child: Text(
            text,
            style: TextStyle(color: ThirdColor),
          )),
          SvgPicture.asset(
            'assets/icon/Arrow - Right 2.svg',
            color: ThirdColor,
          ),
        ],
      ),
    );
  }
}
