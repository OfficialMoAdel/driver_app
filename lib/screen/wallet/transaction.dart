import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../../widgets/container.dart';
import '../../widgets/lists.dart';

class Transaction extends StatelessWidget {
  Transaction({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFAFAFA),
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset('assets/icon/Arrow - Left.svg')),
              Text(
                'Transaction History',
                style: TextStyle(color: ThirdColor),
              )
            ],
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  //  context.push(new HomepageCar());
                },
                child: SvgPicture.asset('assets/icon/Search.svg')),
            const SizedBox(
              width: 24,
            ),
            SvgPicture.asset('assets/icon/More Circle.svg'),
            const SizedBox(
              width: 24,
            ),
          ],
        ),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            return customcontainer(
                Date: Date[index],
                image: image[index],
                Price: Price[index],
                actiontype: actiontype[index],
                name: name[index]);
          }),
          itemCount: name.length,
        ),
      ),
    );
  }
}
