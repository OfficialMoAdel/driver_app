import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'coustom_button.dart';

import '../constants.dart';

class CustomDialog extends StatelessWidget {
  final String imagePath, header, massage;
  final String? buttonText;
  final String? buttonText2;
  final VoidCallback? onButtonPressed;
  final VoidCallback? onButtonPressed2;

  const CustomDialog({
    Key? key,
    required this.imagePath,
    required this.header,
    required this.massage,
    this.buttonText,
    this.buttonText2,
    this.onButtonPressed,
    this.onButtonPressed2,
  }) : super(key: key);

  dialogContent(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(42.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: <Widget>[
            SvgPicture.asset(
              imagePath,
              height: 100,
              color: PrimaryColor,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              header,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              massage,
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 24.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: CoustomButton(
                text: buttonText ??
                    'OK', // use the provided text, or 'OK' if none is provided
                onTap: onButtonPressed ??
                    () {}, // use the provided function, or an empty function if none is provided
              ),
            ),
            const SizedBox(height: 24.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: CoustomButton(
                text: buttonText2 ??
                    'OK', // use the provided text, or 'OK' if none is provided
                onTap: onButtonPressed2 ??
                    () {}, // use the provided function, or an empty function if none is provided
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
