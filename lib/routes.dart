import 'package:driver_app/screen/auth/lets_in.dart';
import 'package:driver_app/screen/auth/login_page.dart';
import 'package:driver_app/screen/auth/register_page.dart';
import 'package:driver_app/screen/car/home_page_car.dart';
import 'package:driver_app/screen/car/main_page_car.dart';
import 'package:driver_app/screen/chat/inbox_Page.dart';
import 'package:driver_app/screen/contact_us_page.dart';
import 'package:driver_app/screen/main_app.dart';
import 'package:driver_app/screen/profile/editProfile_screen.dart';
import 'package:driver_app/screen/profile/profile_screen.dart';
import 'package:driver_app/screen/wallet/wallet_page.dart';
import 'package:flutter/material.dart';
import 'screen/intro_screen/onebordding_sceen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginPage.id: (context) => LoginPage(),
  RegisterPage.id: (context) => RegisterPage(),
  ProfileScreen.id: (context) => ProfileScreen(),
  HomepageCar.id: (context) => HomepageCar(),
  LetsIn.id: (context) => LetsIn(),
  onBordingScreen.id: (context) => onBordingScreen(),
  WalletScreen.id: (context) => WalletScreen(),
  InboxPage.id: (context) => InboxPage(),
  MainPagecar.id: (context) => MainPagecar(),
  EditeProfileScreen.id: (context) => EditeProfileScreen(),
  ContactUsPage.id: (context) => ContactUsPage(),
  MainApp.id: (context) => MainApp()
};
