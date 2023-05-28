import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class SocalCard extends StatelessWidget {
  const SocalCard({
    Key? key,
    this.icon,
    this.press,
    this.backgroundColor,
  }) : super(key: key);
  final Color? backgroundColor;
  final String? icon;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        height: 60,
        width: 80,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all((12)),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: ScandryColor.withOpacity(.3)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: SvgPicture.asset(
          icon!,
          height: 18,
          width: 18,
        ),
      ),
    );
  }
}

class CustomButoonCard extends StatelessWidget {
  const CustomButoonCard({
    Key? key,
    this.text,
    this.press,
    this.backgroundColor,
  }) : super(key: key);
  final Color? backgroundColor;
  final String? text;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 40,
        width: 120,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all((12)),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: ScandryColor.withOpacity(.3)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}

class SocalCard1 extends StatelessWidget {
  const SocalCard1({
    this.text,
    Key? key,
    this.icon,
    this.onTap,
  }) : super(key: key);

  final String? icon;
  final VoidCallback? onTap;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all((12)),
        decoration: BoxDecoration(
          border: Border.all(color: ScandryColor.withOpacity(.3)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon!,
              height: 24,
              width: 24,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text!,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
