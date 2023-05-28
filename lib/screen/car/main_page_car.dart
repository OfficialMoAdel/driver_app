import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import '../Booking/booking_page.dart';
import '../chat/inbox_Page.dart';
import '../profile/profile_screen.dart';
import '../wallet/wallet_page.dart';
import 'home_page_car.dart';

class MainPagecar extends StatefulWidget {
  const MainPagecar({super.key});
  static String id = 'MainPageCar';

  @override
  State<MainPagecar> createState() => _MainPagecarState();
}

class _MainPagecarState extends State<MainPagecar> {
  int _selactedIndex = 0;

  List<Widget> _WigetOptions = <Widget>[
    HomepageCar(),
    BookingPage(),
    InboxPage(),
    WalletScreen(),
    ProfileScreen(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selactedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _WigetOptions.elementAt(_selactedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          selectedItemColor: PrimaryColor,
          //unselectedItemColor: kScandryColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icon/Home.svg',
                  color: _selactedIndex == 0 ? PrimaryColor : ScandryColor),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icon/Paper.svg',
                  color: _selactedIndex == 1 ? PrimaryColor : ScandryColor),
              label: "Bookings",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icon/Chat.svg',
                  color: _selactedIndex == 2 ? PrimaryColor : ScandryColor),
              label: "Inbox",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icon/Wallet.svg',
                  color: _selactedIndex == 3 ? PrimaryColor : ScandryColor),
              label: "Wallet",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icon/Profile.svg',
                  color: _selactedIndex == 4 ? PrimaryColor : ScandryColor),
              label: "Profile",
            )
          ],
          currentIndex: _selactedIndex,
          onTap: _onItemTap,
        ),
      ),
    );
  }
}
