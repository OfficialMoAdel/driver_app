import 'package:flutter/material.dart';

import '../../constants.dart';
import 'booking_page.dart';

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
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
                    activeText: 'Completed',
                    activeColor: GraanColor,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  CustomCard(
                    title: 'Wade Warren',
                    subtitle: 'Honda Mobilio',
                    imageUrl:
                        'https://www.androidcoding.in/wp-content/uploads/flutter_banner_expandable_listview.png',
                    activeText: 'Completed',
                    activeColor: GraanColor,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
