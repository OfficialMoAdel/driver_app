import 'package:flutter/material.dart';

import '../constants.dart';

class IntroPage extends StatelessWidget {
  IntroPage({
    required this.headline,
    Key? key,
    required this.image,
  });
  final String image;
  final String headline;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Image.asset(
                image,
                height: 250,
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  headline,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: ThirdColor),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}
