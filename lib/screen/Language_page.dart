import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? language; //no radio button will be selected
  //String gender = "male"; //if you want to set default value
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Language",
          style: TextStyle(color: ThirdColor),
        ),
        leading: GestureDetector(
          onTap: () {
            () => Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back, color: ThirdColor),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "Suggested",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            RadioListTile(
              title: Text(
                "English(US)",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              value: "(us)",
              groupValue: language,
              onChanged: (value) {
                setState(() {
                  language = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text(
                "English(UK)",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              value: "(uk)",
              groupValue: language,
              onChanged: (value) {
                setState(() {
                  language = value.toString();
                });
              },
            ),
            Text(
              "Language",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RadioListTile(
              title: Text(
                "Mandrain",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              value: "Mandrain",
              groupValue: language,
              onChanged: (value) {
                setState(() {
                  language = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text(
                "Hindi",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              value: "Hindi",
              groupValue: language,
              onChanged: (value) {
                setState(() {
                  language = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text(
                "Spanish",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              value: "Spanish",
              groupValue: language,
              onChanged: (value) {
                setState(() {
                  language = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text(
                "French",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              value: "French",
              groupValue: language,
              onChanged: (value) {
                setState(() {
                  language = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text(
                "Arabic",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              value: "Arabic",
              groupValue: language,
              onChanged: (value) {
                setState(() {
                  language = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text(
                "Bengali",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              value: "Bengali",
              groupValue: language,
              onChanged: (value) {
                setState(() {
                  language = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text(
                "Russian",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              value: "Russian",
              groupValue: language,
              onChanged: (value) {
                setState(() {
                  language = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text(
                "Indonessia",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              value: "Indonessia",
              groupValue: language,
              onChanged: (value) {
                setState(() {
                  language = value.toString();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
