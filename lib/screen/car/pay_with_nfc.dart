import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constants.dart';

class PayWithNfc extends StatefulWidget {
  const PayWithNfc({Key? key}) : super(key: key);

  @override
  State<PayWithNfc> createState() => _PayWithNfcState();
}

class _PayWithNfcState extends State<PayWithNfc> {
  final databaseReference = FirebaseDatabase.instance.reference();
  List<int> identifier = [];
  List<String> hexList = [];
  late String hexID = '';
  ValueNotifier<dynamic> result = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Image.asset(
                'assets/image/icon nfc 1.png', // Replace with your image file path
                width: 350,
                height: 350,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                context: context,
                builder: (BuildContext context) {
                  return Container(
                      height: 450,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'SCANNING...',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            'assets/image/icon nfc 2.png',
                            // Replace with your image file path
                            width: 170,
                            height: 170,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              NfcManager.instance.stopSession();
                            },
                            child: Container(
                              height: 60,
                              width: 300,
                              decoration: BoxDecoration(
                                color: PrimaryColor,
                                borderRadius: BorderRadius.circular(
                                    30), // adjust the radius to make the border more or less circular
                              ),
                              child: const Center(
                                child: Text(
                                  'Stop Scanning',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ));
                },
              ).then(
                (value) {
                  NfcManager.instance.stopSession();
                },
              );
              _tagRead();
            },
            child: Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                color: PrimaryColor,
                borderRadius: BorderRadius.circular(
                    30), // adjust the radius to make the border more or less circular
              ),
              child: const Center(
                child: Text(
                  'Scan NFC Card',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void updateBalance() {
    final balanceRef = databaseReference.child('$hexID/balance');
    balanceRef.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value is int) {
        int? currentBalance = snapshot.value as int?;
        balanceRef
            .set(currentBalance! - 5)
            .then((value) => showToast('تم خصم سعر الرحله'));
      } else {
        print('Error: balance value is not an integer');
        showToast('خطأ');
      }
    }).catchError((error) => print('Error: $error'));
  }

  void _tagRead() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      result.value = tag.data;
      identifier = result.value['nfca']['identifier'].cast<int>();
      hexList = identifier.map((i) => i.toRadixString(16)).toList();
      hexID = hexList.join(':').toUpperCase();
      debugPrint(hexID);
      updateBalance();
    });
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
