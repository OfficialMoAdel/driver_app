import 'dart:async';
import 'package:driver_app/screen/intro_screen/onebordding_sceen.dart';
import 'package:driver_app/widgets/halper_app.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'Splash';

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 5), () => context.Replacement(new onBordingScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: const AssetImage('assets/image/splash.png'),
                  width: width * 0.5,
                  height: width * 0.5),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              Image.asset(
                "assets/image/loading-dots-in-yellow.gif",
                height: 200.0,
                width: 200.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
