import 'package:flutter/material.dart';
import 'ChatScreen.dart';
import '../../widgets/halper_app.dart';
import '../../constants.dart';

class ChatsScreen extends StatefulWidget {
  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  List<ChatModel> chats = [
    ChatModel(
      name: "Sara",
      currentMessage: "Hello!",
      photo:
          'https://tse3.mm.bing.net/th?id=OIP.Ri2fV_CRt_3gpmX7KAjq6AHaHa&pid=Api&P=0',
      time: "3:44",
      messageNumber: '4',
    ),
    ChatModel(
      name: "Ali",
      currentMessage: "Hey!",
      photo:
          'https://tse3.mm.bing.net/th?id=OIP.Ri2fV_CRt_3gpmX7KAjq6AHaHa&pid=Api&P=0',
      time: "12:23",
      messageNumber: '2',
    ),
    ChatModel(
      name: "Eman",
      currentMessage: "Hello!",
      photo:
          'https://tse3.mm.bing.net/th?id=OIP.Ri2fV_CRt_3gpmX7KAjq6AHaHa&pid=Api&P=0',
      time: "2:48",
      messageNumber: '1',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: ListView(
              children: [
                GestureDetector(
                  onTap: () => context.push(new ChatScreen()),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://tse3.mm.bing.net/th?id=OIP.Ri2fV_CRt_3gpmX7KAjq6AHaHa&pid=Api&P=0'),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sara',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                CircleAvatar(
                                  radius: 13,
                                  backgroundColor: PrimaryColor,
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: ThirdColor),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'I have booked your taxi now..',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                Text('12:43'),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://tse3.mm.bing.net/th?id=OIP.Ri2fV_CRt_3gpmX7KAjq6AHaHa&pid=Api&P=0'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sara',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              CircleAvatar(
                                radius: 13,
                                backgroundColor: PrimaryColor,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: ThirdColor),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'I have booked your taxi now..',
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                              Text('12:43'),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://tse3.mm.bing.net/th?id=OIP.Ri2fV_CRt_3gpmX7KAjq6AHaHa&pid=Api&P=0'),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sara',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              CircleAvatar(
                                radius: 13,
                                backgroundColor: PrimaryColor,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: ThirdColor),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'I have booked your taxi now..',
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                              Text('12:43'),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://tse3.mm.bing.net/th?id=OIP.Ri2fV_CRt_3gpmX7KAjq6AHaHa&pid=Api&P=0'),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sara',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              CircleAvatar(
                                radius: 13,
                                backgroundColor: PrimaryColor,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: ThirdColor),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'I have booked your taxi now..',
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                              Text('12:43'),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://tse3.mm.bing.net/th?id=OIP.Ri2fV_CRt_3gpmX7KAjq6AHaHa&pid=Api&P=0'),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sara',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              CircleAvatar(
                                radius: 13,
                                backgroundColor: PrimaryColor,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: ThirdColor),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'I have booked your taxi now..',
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                              Text('12:43'),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://tse3.mm.bing.net/th?id=OIP.Ri2fV_CRt_3gpmX7KAjq6AHaHa&pid=Api&P=0'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sara',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              CircleAvatar(
                                radius: 13,
                                backgroundColor: PrimaryColor,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: ThirdColor),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'I have booked your taxi now..',
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                              Text('12:43'),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://tse3.mm.bing.net/th?id=OIP.Ri2fV_CRt_3gpmX7KAjq6AHaHa&pid=Api&P=0'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sara',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              CircleAvatar(
                                radius: 13,
                                backgroundColor: PrimaryColor,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: ThirdColor),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'I have booked your taxi now..',
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                              Text('12:43'),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://tse3.mm.bing.net/th?id=OIP.Ri2fV_CRt_3gpmX7KAjq6AHaHa&pid=Api&P=0'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sara',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              CircleAvatar(
                                radius: 13,
                                backgroundColor: PrimaryColor,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: ThirdColor),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'I have booked your taxi now..',
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                              Text('12:43'),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ))));
  }
}

class ChatModel {
  String name;
  String messageNumber;
  String time;
  String currentMessage;
  String photo;
  ChatModel(
      {required this.currentMessage,
      required this.messageNumber,
      required this.name,
      required this.photo,
      required this.time});
}
