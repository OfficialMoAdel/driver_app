import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/digle.dart';

class TopUpWallet extends StatelessWidget {
  const TopUpWallet({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: ThirdColor,
        ),
        title: Text(
          'Top Up E-Wallete',
          style: TextStyle(
            color: ThirdColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Text(
            'Enter the amount of top up',
            style: TextStyle(
                fontSize: 20, color: ScandryColor, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Container(
              height: 120,
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 70, fontWeight: FontWeight.w200),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: PrimaryColor)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 42,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialog(
                        header: 'Top Up Successful!',
                        massage: 'You have successfully top up e-wallet',
                        imagePath: 'assets/image/Group.svg',
                        buttonText: "OK",
                        onButtonPressed: () {},
                      );
                    });
              },
              child: Text(
                'Continue',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: PrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
        ],
      ),
    );
  }
}
