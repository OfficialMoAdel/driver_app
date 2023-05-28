import 'package:flutter/material.dart';

import '../constants.dart';

class ContactUsPage extends StatelessWidget {
  static String id = 'ContactUsPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Contact Us'),
        centerTitle: true,
        backgroundColor: ThirdColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildButton('Customer Service', Icons.headset_mic),
            SizedBox(height: 20),
            _buildButton('WhatsApp', Icons.phone),
            SizedBox(height: 20),
            _buildButton('Website', Icons.public),
            SizedBox(height: 20),
            _buildButton('Facebook', Icons.facebook),
            SizedBox(height: 20),
            _buildButton('Instagram', Icons.camera_alt),
            SizedBox(height: 20),
            _buildButton('location', Icons.location_on),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String title, IconData icon) {
    return SizedBox(
      width: 250,
      height: 50,
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.green),
        label: Text(title, style: TextStyle(fontSize: 18)),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: ThirdColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
