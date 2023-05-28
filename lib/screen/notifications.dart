import 'package:flutter/material.dart';

import '../constants.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool _generalNotification = true;
  bool _sound = true;
  bool _vibrate = false;
  bool _specialOffers = true;
  bool _promoDiscount = true;
  bool _payment = false;
  bool _cashback = true;
  bool _appUpdates = true;
  bool _newServiceAvailable = true;
  bool _newTipsAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: ThirdColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Notifications",
            style: TextStyle(color: ThirdColor),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: ListView(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  _buildNotificationItem(
                      'General Notification', _generalNotification, (value) {
                    setState(() {
                      _generalNotification = value;
                    });
                  }),
                  _buildNotificationItem('Sound', _sound, (value) {
                    setState(() {
                      _sound = value;
                    });
                  }),
                  _buildNotificationItem('Vibrate', _vibrate, (value) {
                    setState(() {
                      _vibrate = value;
                    });
                  }),
                  _buildNotificationItem('Special Offers', _specialOffers,
                      (value) {
                    setState(() {
                      _specialOffers = value;
                    });
                  }),
                  _buildNotificationItem('Promo & Discount', _promoDiscount,
                      (value) {
                    setState(() {
                      _promoDiscount = value;
                    });
                  }),
                  _buildNotificationItem('Payment', _payment, (value) {
                    setState(() {
                      _payment = value;
                    });
                  }),
                  _buildNotificationItem('Cashback', _cashback, (value) {
                    setState(() {
                      _cashback = value;
                    });
                  }),
                  _buildNotificationItem('App Updates', _appUpdates, (value) {
                    setState(() {
                      _appUpdates = value;
                    });
                  }),
                  _buildNotificationItem(
                      'New Service Available', _newServiceAvailable, (value) {
                    setState(() {
                      _newServiceAvailable = value;
                    });
                  }),
                  _buildNotificationItem(
                      'New Tips Available', _newTipsAvailable, (value) {
                    setState(() {
                      _newTipsAvailable = value;
                    });
                  }),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildNotificationItem(
      String title, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: ThirdColor)),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: PrimaryColor,
            inactiveTrackColor: ScandryColor,
          ),
        ],
      ),
    );
  }
}
