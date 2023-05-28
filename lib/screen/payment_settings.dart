import 'package:flutter/material.dart';
import '../widgets/halper_app.dart';

import '../constants.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Payment', style: TextStyle(color: ThirdColor)),
          leading: Icon(Icons.arrow_back, color: ThirdColor),
          backgroundColor: Colors.transparent,
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: ScandryColor.withOpacity(0.07),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.paypal,
                      color: PrimaryColor,
                      size: 35,
                    ),
                  ),
                  Text(
                    'Paypal',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 160,
                  ),
                  Text(
                    'Connect',
                    style: TextStyle(
                        fontSize: 17,
                        color: PrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: ScandryColor.withOpacity(0.07),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.g_mobiledata,
                      color: PrimaryColor,
                      size: 35,
                    ),
                  ),
                  Text(
                    'Google Pay',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 118,
                  ),
                  Text(
                    'Connect',
                    style: TextStyle(
                        fontSize: 17,
                        color: PrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: ScandryColor.withOpacity(0.07),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.apple,
                      color: PrimaryColor,
                      size: 35,
                    ),
                  ),
                  Text(
                    'Apple Pay',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 130,
                  ),
                  Text(
                    'Connect',
                    style: TextStyle(
                        fontSize: 17,
                        color: PrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: ScandryColor.withOpacity(0.07),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.credit_card,
                      color: PrimaryColor,
                      size: 35,
                    ),
                  ),
                  Text(
                    'Mater Card',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 119,
                  ),
                  Text(
                    'Connect',
                    style: TextStyle(
                        fontSize: 17,
                        color: PrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 200),
          Container(
            child: MaterialButton(
              onPressed: () {
                //context.push(new Addnewcard());
              },
              child: Container(
                height: 50,
                width: 330,
                decoration: BoxDecoration(
                  color: PrimaryColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: ScandryColor.withOpacity(0.07),
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 117),
                  child: Row(
                    children: [
                      Text(
                        'Add New Card',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
