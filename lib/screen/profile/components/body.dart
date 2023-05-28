import 'package:flutter/material.dart';
import '../../../widgets/halper_app.dart';
import '../../Language_page.dart';
import '../../contact_us_page.dart';
import '../../notifications.dart';
import '../../payment_settings.dart';
import '../editProfile_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Edit Profile",
            icon: "assets/icon/Profile.svg",
            press: () => {context.push(new EditeProfileScreen())},
          ),
          ProfileMenu(
            text: "Address",
            icon: "assets/icon/Location.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Notification",
            icon: "assets/icon/Notification.svg",
            press: () => {context.push(new NotificationsPage())},
          ),
          ProfileMenu(
            text: "Payment",
            icon: "assets/icon/Wallet.svg",
            press: () {
              context.push(new payment());
            },
          ),
          ProfileMenu(
            text: "Languge",
            icon: "assets/icon/More Circle.svg",
            press: () {
              context.push(new LanguagePage());
            },
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icon/Info Square.svg",
            press: () {
              context.push(new ContactUsPage());
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icon/Logout.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
