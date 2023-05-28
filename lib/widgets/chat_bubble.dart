import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/model_message.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    required this.message,
    Key? key,
  }) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 24),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32)),
          color: PrimaryColor,
        ),
        child: Text(
          message.message,
          style: const TextStyle(color: ScandryColor),
        ),
      ),
    );
  }
}

class ChatBubbleForFrend extends StatelessWidget {
  const ChatBubbleForFrend({
    required this.message,
    Key? key,
  }) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 24),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32)),
          color: ScandryColor,
        ),
        child: Text(
          message.message,
          style: TextStyle(color: ScandryColor),
        ),
      ),
    );
  }
}
