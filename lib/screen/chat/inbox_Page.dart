import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../car/home_page_car.dart';
import 'ChatsScreen.dart';
import 'CallsScreen.dart';
import '../../constants.dart';

class InboxPage extends StatefulWidget {
  static String id = 'InboxPage';
  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Inbox',
            style: TextStyle(
                color: ThirdColor, fontWeight: FontWeight.w500, fontSize: 21),
          ),
          actions: [
            GestureDetector(
                /* onTap: () {

                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomepageCar()),
                  );
                }, */
                child: SvgPicture.asset('assets/icon/Search.svg')),
            SizedBox(
              width: 24,
            ),
            SvgPicture.asset('assets/icon/More Circle.svg'),
            const SizedBox(
              width: 24,
            ),
          ],
          bottom: const TabBar(
            labelColor: PrimaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 22),
            labelPadding: EdgeInsets.symmetric(horizontal: 22),
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            indicatorColor: PrimaryColor,
            unselectedLabelColor: ScandryColor,
            tabs: [
              Tab(
                text: "Chats",
              ),
              Tab(
                text: "Calls",
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TabBarView(
            children: [
              ChatsScreen(),
              CallsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
