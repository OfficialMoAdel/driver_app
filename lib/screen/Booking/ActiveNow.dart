import 'package:flutter/material.dart';
import '../../constants.dart';
import 'booking_page.dart';

class ActiveNow extends StatefulWidget {
  const ActiveNow({Key? key}) : super(key: key);

  @override
  State<ActiveNow> createState() => _ActiveNowState();
}

class _ActiveNowState extends State<ActiveNow> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffafafa),
        body: ListView(
          children: [
            SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              child: Column(
                children: [
                  CustomCard(
                    title: 'Wade Warren',
                    subtitle: 'Honda Mobilio',
                    imageUrl:
                        'https://www.androidcoding.in/wp-content/uploads/flutter_banner_expandable_listview.png',
                    activeText: 'Active',
                    activeColor: PrimaryColor,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
