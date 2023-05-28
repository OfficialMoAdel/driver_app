import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/image/Ellipse.png"),
          ),
          Positioned(
            right: -10,
            bottom: 0,
            child: SizedBox(
              height: 32,
              width: 32,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: PrimaryColor,
                ),
                onPressed: () {},
                child: SvgPicture.asset("assets/icon/Edit.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
